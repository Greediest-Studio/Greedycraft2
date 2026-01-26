/*
 * This script is created for the GreedyCraft modpack by mc_Edwin.
 * You may NOT use this script in any other publicly distributed modpack without my permission.
 */


#priority 90

import crafttweaker.player.IPlayer;
import crafttweaker.item.IItemStack;
import crafttweaker.entity.IEntityMob;
import crafttweaker.damage.IDamageSource;
import crafttweaker.item.IMutableItemStack;

import mods.zenutils.NetworkHandler;
import mods.randomtweaker.botania.IManaItemHandler;
import mods.ctutils.utils.Math;

import native.net.minecraftforge.event.entity.player.PlayerInteractEvent.LeftClickEmpty;
import native.com.meteor.extrabotany.common.helper.SubspaceHelper;
import native.slimeknights.tconstruct.library.utils.ToolHelper;

$expand IMutableItemStack$attemptDamageItemWithEnergy(num as int, player as IPlayer) as void {
    if (this.hasEnergy()) {
        var energyDura as int = this.getEnergy() / 640;
        if (energyDura >= num) {
            this.removeEnergy(num * 640);
        } else {
            var remainDura as int = num - energyDura;
            this.setEnergy(0);
            if (remainDura >= this.maxDamage) {
                ToolHelper.breakTool(this.native, player.native);
            } else {
                this.attemptDamageItem(remainDura, player);
            }
        }
    } else {
        if (num >= this.maxDamage) {
            ToolHelper.breakTool(this.native, player.native);
        } else {
            this.attemptDamageItem(num, player);
        }
    }
}

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
        if (TicTraitLib.getPlayerTicHelmetTrait(player) has "dragon_body_armor") {
            if (TicTraitLib.getPlayerTicChestplateTrait(player) has "dragon_body_armor" &&
                TicTraitLib.getPlayerTicLeggingsTrait(player) has "dragon_body_armor" &&
                TicTraitLib.getPlayerTicBootsTrait(player) has "dragon_body_armor") {
                    NetworkHandler.sendToServer("dragonBodyTraitLeftClick");
            }
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

NetworkHandler.registerClient2ServerMessage("dragonBodyTraitLeftClick", function(server, byteBuf, player) {
    var pass as bool = false;
    for target in getEntityLivingBasesInCube(player, 5.0f) {
        if (!target instanceof IPlayer) {
            pass = true;
            var poses as float[][] = [];
            var distance as float = distance3D(player.x, player.y, player.z, target.x, target.y, target.z) as float;
            var dx as float = (target.x - player.x) as float / Math.floor(distance) as float;
            var dy as float = (target.y - player.y) as float / Math.floor(distance) as float;
            var dz as float = (target.z - player.z) as float / Math.floor(distance) as float;
            for i in 1 to Math.floor(distance) + 1 {
                poses += [player.x + dx * i as float, player.y + dy * i as float, player.z + dz * i as float] as float[];
            }
            for pos in poses {
                server.commandManager.executeCommandSilent(player, "particle dragonbreath " + pos[0] + " " + (pos[1] + 1.0f) + " " + pos[2] + " 0 0 0 0 1 force");
            }
            target.attackEntityFrom(IDamageSource.createEntityDamage("chaos", player), target.isBoss ? Math.min(60.0f, target.maxHealth * 0.05f) : target.maxHealth * 0.05f);
        }
    }
    if (pass) {
        player.playSound("minecraft:entity.enderdragon.ambient", 1.0f, 1.0f);
        player.armorInventory[0].mutable().attemptDamageItemWithEnergy(5, player);
        player.armorInventory[1].mutable().attemptDamageItemWithEnergy(5, player);
        player.armorInventory[2].mutable().attemptDamageItemWithEnergy(5, player);
        player.armorInventory[3].mutable().attemptDamageItemWithEnergy(5, player);
    }
});