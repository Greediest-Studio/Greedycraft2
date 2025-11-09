import crafttweaker.event.EntityLivingDamageEvent;
import crafttweaker.event.EntityLivingDeathEvent;
import crafttweaker.player.IPlayer;
import crafttweaker.entity.IEntity;

import mods.ctutils.utils.Math;

events.onEntityLivingDamage(function(event as EntityLivingDamageEvent) {
    if (event.entity instanceof IPlayer) {
        var player as IPlayer = event.entity;
        if (!isNull(event.damageSource.getTrueSource())) {
            var source as IEntity = event.damageSource.getTrueSource();
            if (source.isBoss && player.isBaubleEquipped(<contenttweaker:bauble_source_of_swamp>) != -1) {
                event.amount *= 0.7f;
            }
        }
    }
});

events.onEntityLivingDeath(function(event as EntityLivingDeathEvent) {
    if (event.entity instanceof IPlayer) {
        var player as IPlayer = event.entity;
        if (!isNull(event.damageSource.getTrueSource())) {
            var source as IEntity = event.damageSource.getTrueSource();
            if ((!source.isBoss) && player.isBaubleEquipped(<contenttweaker:bauble_source_of_swamp>) != -1) {
                if (Math.random() < 0.5) {
                    source.setDead();
                }
            }
        }
    }
});