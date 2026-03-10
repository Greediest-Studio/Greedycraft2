/*
 * This script is created for the GreedyCraft modpack by mc_Edwin.
 * You may NOT use this script in any other publicly distributed modpack without my permission.
 */


#priority 90
#sideonly client

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

