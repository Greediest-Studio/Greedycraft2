import crafttweaker.event.EntityLivingHurtEvent;
import crafttweaker.player.IPlayer;
import crafttweaker.entity.IEntityLivingBase;
import crafttweaker.damage.IDamageSource;


events.onEntityLivingHurt(function(event as EntityLivingHurtEvent) {

    if (!isNull(event.damageSource)) {

        var entity as IEntityLivingBase = event.entityLivingBase;
        var damagetype = event.damageSource.damageType;
        var damageamount = event.amount;

        if (!isNull(event.damageSource.getTrueSource()) && event.damageSource.getTrueSource() instanceof IPlayer) {

            var player as IPlayer = event.damageSource.getTrueSource();

            if (player.isBaubleEquipped(<contenttweaker:bauble_damage_viewer>) != -1) {

                player.sendMessage("伤害类型为" + damagetype);
                player.sendMessage("理论伤害值为" + damageamount);

            }
        }

        if (entity instanceof IPlayer){

            var player as IPlayer = entity;

            if (player.isBaubleEquipped(<contenttweaker:bauble_damage_viewer>) != -1) {

                player.sendMessage("受到的伤害类型为" + damagetype);
                player.sendMessage("受到的理论伤害值为" + damageamount);
            }
        }
    }
});