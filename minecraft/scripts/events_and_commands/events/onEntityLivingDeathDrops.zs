

import crafttweaker.event.EntityLivingDeathDropsEvent;
import crafttweaker.player.IPlayer;
import crafttweaker.entity.IEntityLivingBase;
import crafttweaker.item.IItemStack;
import crafttweaker.entity.IEntityItem;

import mods.ctutils.utils.Math;

events.onEntityLivingDeathDrops(function (event as EntityLivingDeathDropsEvent) {
    if (event.isRecentlyHit && !isNull(event.damageSource.getTrueSource()) && !event.entity.world.remote) {
        if (event.damageSource.getTrueSource() instanceof IPlayer && !isNull(event.entityLivingBase)) {
            var player as IPlayer = event.damageSource.getTrueSource();
            var entity as IEntityLivingBase = event.entityLivingBase;
            if (!isNull(player.mainHandHeldItem)) {
                var item as IItemStack = player.mainHandHeldItem;
                if (TicLib.isTicTool(item)) {
                    
                    // Nitration Trait Drop
                    if (TicTraitLib.hasTicTrait(item, "nitration")) {
                        event.drops += <minecraft:gunpowder>.createEntityItem(entity.world, entity.x as float, entity.y as float, entity.z as float);
                    }

                    // Jadeitization Trait Drop
                    if (TicTraitLib.hasTicTrait(item, "jadeitization")) {
                        for i in 0 to Math.ceil((Math.random() * 3.0f) as double) as int {
                            event.drops += <erebus:materials:55>.createEntityItem(entity.world, entity.x as float, entity.y as float, entity.z as float);
                        }
                    }

                }
            }

            // Demon Decay Drop
            if (entity.isPotionActive(<potion:contenttweaker:demon_decay>)) {
                event.drops = [];
            }
        }
    }
});
