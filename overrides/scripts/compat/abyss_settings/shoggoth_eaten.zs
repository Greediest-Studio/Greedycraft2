

import crafttweaker.event.EntityLivingDeathEvent;
import crafttweaker.entity.IEntityLivingBase;
import crafttweaker.entity.IEntityLiving;

events.onEntityLivingDeath(function(event as EntityLivingDeathEvent) {
    if (!isNull(event.damageSource.getTrueSource()) && !isNull(event.entityLivingBase)) {
        var sourceEntity as IEntityLivingBase = event.damageSource.getTrueSource();
        var entity as IEntityLivingBase = event.entityLivingBase;
        if (entity instanceof IEntityLiving && sourceEntity instanceof IEntityLiving) {
            var ent as IEntityLiving = entity;
            var sourEnt as IEntityLiving = sourceEntity;
            if (ent.definition.id == "gct_aby:ancientshoggoth" && sourEnt.definition.id == "gct_aby:bloody_shoggoth") {
                var x as int = ent.x as int;
                var y as int = ent.y as int;
                var z as int = ent.z as int;
                entity.world.spawnEntity(<gct_aby:ancient_shoggoth_mud>.createEntityItem(entity.world, x, y, z));
            }
        }
    }
});