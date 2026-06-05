#reloadable

import crafttweaker.player.IPlayer;
import crafttweaker.entity.IEntity;
import crafttweaker.event.EntityLivingHealEvent;

events.onEntityLivingHeal(function(event as EntityLivingHealEvent){

    if (!(event.entityLivingBase instanceof IPlayer)) {
    return;
    }

    var player as IPlayer = event.entityLivingBase;

    if (player.isBaubleEquipped(<contenttweaker:bauble_blood_pact>) != -1) {
        event.amount = event.amount * 1.33f;
    }
});