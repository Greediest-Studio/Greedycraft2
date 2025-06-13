

import crafttweaker.player.IPlayer;
import crafttweaker.event.EntityLivingJumpEvent;
import crafttweaker.entity.IEntity;

events.onEntityLivingJump(function(event as EntityLivingJumpEvent) {

    if (!(event.entityLivingBase instanceof IPlayer)) {
    return;
    }

    var player as IPlayer = event.entityLivingBase;

    if (player.isBaubleEquipped(<contenttweaker:bauble_energy_gum>) != -1) {
    player.motionY += 0.2;
    }
});



