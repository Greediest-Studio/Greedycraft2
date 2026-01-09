/*
 * This script is created for the GreedyCraft modpack by TCreopargh.
 * You may NOT use this script in any other publicly distributed modpack without my permission.
 */

#priority 90

import crafttweaker.event.EntityLivingDamageEvent;
import crafttweaker.entity.IEntityLivingBase;
import crafttweaker.player.IPlayer;
import mods.ctutils.utils.Math;

events.onEntityLivingDamage(function(event as EntityLivingDamageEvent) {

    if (event.entity.world.remote || isNull(event.entityLivingBase)) {
        return;
    }

    var entity as IEntityLivingBase = event.entityLivingBase;
    if (entity instanceof IPlayer) {
        var player as IPlayer = entity;
        
        //Craven Survivalism Trait
        var pass as bool = false;
        if (!isNull(player.mainHandHeldItem) && !pass) {
            if (TicTraitLib.hasTicTrait(player.mainHandHeldItem, "craven_survivalism")) {
                player.native.dropItem(player.mainHandHeldItem.native, false);
                player.mainHandHeldItem.mutable().shrink(1);
                pass = true;
            }
        }
        if (!isNull(player.offHandHeldItem) && !pass) {
            if (TicTraitLib.hasTicTrait(player.offHandHeldItem, "craven_survivalism")) {
                player.native.dropItem(player.offHandHeldItem.native, false);
                player.offHandHeldItem.mutable().shrink(1);
                pass = true;
            }
        }
        if (!(isNull(player.armorInventory) || player.armorInventory.length == 0) && !pass) {
            for armor in player.armorInventory {
                if (!isNull(armor)) {
                    if (TicTraitLib.hasTicTrait(armor, "craven_survivalism_armor")) {
                        if (Math.random() < 0.97f) player.native.dropItem(armor.native, false);
                        armor.mutable().shrink(1);
                        pass = true;
                        break;
                    }
                }
            }
        }

        if (pass) {
            event.amount = 0.0f;
        }
        
    }

});