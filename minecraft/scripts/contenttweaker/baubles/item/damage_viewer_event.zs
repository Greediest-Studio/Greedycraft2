

import crafttweaker.event.EntityLivingHurtEvent;
import crafttweaker.player.IPlayer;
import crafttweaker.entity.IEntityLivingBase;
import crafttweaker.damage.IDamageSource;


events.onEntityLivingHurt(function(event as EntityLivingHurtEvent) {

    var entity as IEntityLivingBase = event.entityLivingBase;

    if (!isNull(event.damageSource.getTrueSource()) && event.damageSource.getTrueSource() instanceof IPlayer) {

        var player as IPlayer = event.damageSource.getTrueSource();

        if (player.isBaubleEquipped(<contenttweaker:bauble_damage_viewer>) != -1) {

        var damagetype = event.damageSource.damageType;

        player.sendMessage("伤害类型为" + damagetype);

    }}
});