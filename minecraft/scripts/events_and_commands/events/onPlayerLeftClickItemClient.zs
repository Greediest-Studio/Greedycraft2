/*
 * This script is created for the GreedyCraft modpack by mc_Edwin.
 * You may NOT use this script in any other publicly distributed modpack without my permission.
 */


#priority 90

import crafttweaker.player.IPlayer;
import crafttweaker.item.IItemStack;
import crafttweaker.entity.IEntityMob;

import mods.zenutils.NetworkHandler;
import mods.randomtweaker.botania.IManaItemHandler;

import native.net.minecraftforge.event.entity.player.PlayerInteractEvent.LeftClickEmpty;
import native.com.meteor.extrabotany.common.helper.SubspaceHelper;
import native.slimeknights.tconstruct.library.utils.ToolHelper;

function getManaBaublesAndItems(player as IPlayer) as IItemStack[] {
    var outputList as IItemStack[] = [];
    if (!(isNull(IManaItemHandler.getManaItems(player)) || IManaItemHandler.getManaItems(player).length == 0)) {
        for manaItem in IManaItemHandler.getManaItems(player) {
            outputList += manaItem;
        }
    }
    if (!(isNull(IManaItemHandler.getManaBaubles(player)) || IManaItemHandler.getManaBaubles(player).length == 0)) {
        for manaBauble in IManaItemHandler.getManaBaubles(player).values {
            outputList += manaBauble;
        }
    }
    return outputList;
}

events.register(function(event as LeftClickEmpty) {
    var player as IPlayer = event.getEntityPlayer().wrapper;
    if (!isNull(player.mainHandHeldItem)) {
        var item as IItemStack = player.mainHandHeldItem;
        if (TicLib.isTicTool(item) && TicTraitLib.hasTicTrait(item, "subspace")) {
            NetworkHandler.sendToServer("subspaceLeftClick");
        }
        if (item.definition.id == "additions:emergency_button") {
            player.sendStatusMessage("§c§l已清除所有敌对实体！");
            NetworkHandler.sendToServer("emergencyButtonLeftClick");
        }
    }
});

NetworkHandler.registerClient2ServerMessage("subspaceLeftClick", function(server, byteBuf, player) {
    if (!isNull(player.mainHandHeldItem)) {
        var item as IItemStack = player.mainHandHeldItem;
        if (TicLib.isTicTool(item) && TicTraitLib.hasTicTrait(item, "subspace")) {
            for manaItem in getManaBaublesAndItems(player) {
                if (IManaItemHandler.requestManaExactForTool(manaItem, player, 600, true)) {
                    var damage as float = ToolHelper.getActualAttack(item.native);
                    SubspaceHelper.summonSubspaceFromPlayerWithEffect(player.world.native, player.native, damage);
                    break;
                }
            }
        }
    }
});

NetworkHandler.registerClient2ServerMessage("emergencyButtonLeftClick", function(server, byteBuf, player) {
    server.commandManager.executeCommandSilent(player, "particle lava ~ ~ ~ 1 1 1 1 50 force");
    var item as IItemStack = player.mainHandHeldItem;
    item.mutable().shrink(1);
    if (!isNull(player.activePotionEffects)) {
        if (player.activePotionEffects.length > 0) {
            for effect in player.activePotionEffects {
                player.removePotionEffect(effect.potion);
            }
        }
    }
    for entity in player.world.getEntities() {
        if (entity instanceof IEntityMob) {
            entity.removeFromWorld();
        }
    }
});