

import crafttweaker.event.EntityLivingDamageEvent;
import crafttweaker.player.IPlayer;
import crafttweaker.damage.IDamageSource;
import crafttweaker.entity.IEntityLivingBase;
import crafttweaker.event.ILivingEvent;

import crafttweaker.world.IWorld;

events.onEntityLivingDamage(function(events as EntityLivingDamageEvent){

    var target as IEntityLivingBase = events.entity;
    var entity0 as IEntityLivingBase = events.damageSource.getTrueSource();
    var world as IWorld = target.world;
    val source = events.damageSource;

    if (!world.remote){
        if(entity0 instanceof IPlayer){
            var player as IPlayer = entity0;
            if (player.isBaubleEquipped(<contenttweaker:bauble_ranger_badge>) != -1) {
                if (source.damageType == "arrow") {
                    events.amount *= 1.15F;
                }              
            }
            if (player.isBaubleEquipped(<contenttweaker:bauble_wizard_badge>) != -1) {
                if (source.damageType == "magic" ||source.damageType == "indirectMagic") {
                    events.amount *= 1.15F;
                }              
            }
            if (player.isBaubleEquipped(<contenttweaker:bauble_warrior_badge>) != -1) {
                if (source.damageType == "player") {
                    events.amount *= 1.15F;
                }              
            }
        }}
});