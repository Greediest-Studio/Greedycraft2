/*
 * This script is created for the GreedyCraft modpack by mc_Edwin.
 * You may NOT use this script in any other publicly distributed modpack without my permission.
 */


#priority 90
#sideonly client

import mods.ticlib.TicTool;
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
        if (TicTool.isTool(item) && TicTool.hasTrait(item, "subspace")) {
            NetworkHandler.sendToServer("subspaceLeftClick");
        }
        if (item.definition.id == "additions:emergency_button") {
            player.sendStatusMessage("§c§l已清除所有敌对实体！");
            NetworkHandler.sendToServer("emergencyButtonLeftClick");
        }
        if (TicTool.getArmorSlotTraits(player, "helmet") has "dragon_body_armor") {
            if (TicTool.getArmorSlotTraits(player, "chestplate") has "dragon_body_armor" &&
                TicTool.getArmorSlotTraits(player, "leggings") has "dragon_body_armor" &&
                TicTool.getArmorSlotTraits(player, "boots") has "dragon_body_armor") {
                    NetworkHandler.sendToServer("dragonBodyTraitLeftClick");
            }
        }
    }
});

