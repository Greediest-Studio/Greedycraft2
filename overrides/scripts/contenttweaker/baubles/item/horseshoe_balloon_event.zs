#reloadable

import crafttweaker.player.IPlayer;
import crafttweaker.event.EntityLivingJumpEvent;
import crafttweaker.entity.IEntity;
import crafttweaker.event.EntityLivingFallEvent;

events.onEntityLivingFall(function(event as EntityLivingFallEvent){

    if (!(event.entityLivingBase instanceof IPlayer)) {
    return;
    }

    var player as IPlayer = event.entityLivingBase;

    if (player.isBaubleEquipped(<contenttweaker:bauble_horseshoe_balloon>) != -1) {
        event.cancel();
    }
});

events.onEntityLivingJump(function(event as EntityLivingJumpEvent) {

    if (!(event.entityLivingBase instanceof IPlayer)) {
    return;
    }

    var player as IPlayer = event.entityLivingBase;

    if (player.isBaubleEquipped(<contenttweaker:bauble_horseshoe_balloon>) != -1) {
    player.motionY += 0.4;
    }
});