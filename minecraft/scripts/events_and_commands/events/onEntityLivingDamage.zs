/*
 * This script is created for the GreedyCraft modpack by TCreopargh.
 * You may NOT use this script in any other publicly distributed modpack without my permission.
 */

#priority 90

import crafttweaker.event.EntityLivingDamageEvent;
import crafttweaker.entity.IEntityLivingBase;
import crafttweaker.player.IPlayer;
import crafttweaker.item.IItemStack;
import crafttweaker.damage.IDamageSource;
import crafttweaker.data.IData;

import mods.ctutils.utils.Math;
import mods.zenutils.DataUpdateOperation.OVERWRITE;
import mods.zenutils.DataUpdateOperation.APPEND;
import mods.zenutils.DataUpdateOperation.MERGE;
import mods.zenutils.DataUpdateOperation.REMOVE;
import mods.zenutils.DataUpdateOperation.BUMP;

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

    if (!isNull(event.entity.id) && !isNull(event.damageSource.getTrueSource())) {
        if (event.damageSource.getTrueSource() instanceof IPlayer) {
            var player as IPlayer = event.damageSource.getTrueSource();
            if (!isNull(player.offHandHeldItem)) {
                if (TicTraitLib.hasTicTrait(player.offHandHeldItem, "flamebow")) {
                    var bow as IItemStack = player.offHandHeldItem;
                    var damageType as string = event.damageSource.getDamageType();
                    var entityId as int = event.entity.id;
                    if (isNull(bow.tag.flamebow) && !event.damageSource.projectile) {
                        bow.mutable().updateTag({flamebow : {id : entityId, types : [{type : damageType}]}});
                        player.sendStatusMessage("§6【烈弓】§c♥§7 ♦ ♣ ♠§r");
                    } else {
                        var oldId as int = -1;
                        if (!isNull(bow.tag.flamebow.id)) {
                            oldId = bow.tag.flamebow.id as int;
                        }
                        if (oldId != entityId) {
                            bow.mutable().updateTag({flamebow : {id : entityId, types : [{type : damageType}]}});
                            player.sendStatusMessage("§6【烈弓】§c♥§7 ♦ ♣ ♠§r");
                        } else {
                            var oldTypes as IData = bow.tag.flamebow.types;
                            var pass as bool = true;
                            if (oldTypes.asList().length != 0) {
                                for type in oldTypes.asList() {
                                    if (type.type as string == damageType) {
                                        pass = false;
                                        break;                                
                                    }
                                }
                            }
                            if (pass) {
                                var newData as IData = {type : damageType};
                                var oldData as IData = bow.tag.flamebow.types;
                                var length as int = oldTypes.asList().length + 1;
                                bow.mutable().updateTag({flamebow : {types : (oldData + [newData])}});
                                player.sendStatusMessage("§6【烈弓】§r"
                                    + (length > 0 ? "§c" : "§7") + "♥§r "
                                    + (length > 1 ? "§c" : "§7") + "♦§r "
                                    + (length > 2 ? "§0" : "§7") + "♣§r "
                                    + (length > 3 ? "§0" : "§7") + "♠§r");
                            } else {
                                var length as int = oldTypes.asList().length;
                                player.sendStatusMessage("§6【烈弓】§r"
                                    + (length > 0 ? "§c" : "§7") + "♥§r "
                                    + (length > 1 ? "§c" : "§7") + "♦§r "
                                    + (length > 2 ? "§0" : "§7") + "♣§r "
                                    + (length > 3 ? "§0" : "§7") + "♠§r");
                            }
                        }
                    }
                }
            }
        }
    }

});