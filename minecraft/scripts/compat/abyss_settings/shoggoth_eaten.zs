#reloadable

import crafttweaker.event.EntityLivingDeathEvent;
import crafttweaker.entity.IEntityLivingBase;
import crafttweaker.entity.IEntityLiving;

events.onEntityLivingDeath(function(event as EntityLivingDeathEvent) {
    if (!isNull(event.entityLivingBase)) {
        var entity as IEntityLivingBase = event.entityLivingBase;
        if (!isNull(entity.definition)) {
            if (entity.definition.id == "gct_aby:ancientshoggoth" && !(entity.world.isRemote())) {
                var right as bool = false;
                for ents in getEntityLivingBasesInCube(entity, 12) {
                    if (!isNull(ents.definition)) {
                        if (ents.definition.id == "gct_aby:bloody_shoggoth") {
                            right = true;
                        }
                    }
                }
                if (right) {
                    entity.world.spawnEntity(<gct_aby:ancient_shoggoth_mud>.createEntityItem(entity.world, entity.position));
                }
            }
        }
    }
});