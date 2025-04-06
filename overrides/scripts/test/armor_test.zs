/*
#reloadable

#priority 1000

import crafttweaker.entity.IEntity;
import crafttweaker.player.IPlayer;
import crafttweaker.entity.Attribute;
import crafttweaker.entity.AttributeInstance;
import crafttweaker.event.EntityLivingDamageEvent;

events.onEntityLivingDamage(function(event as EntityLivingDamageEvent) {

    if (!(event.entityLivingBase instanceof IPlayer)) {
        return;
    }

    var player as IPlayer = event.entityLivingBase;
    val armor1 = player.getAttribute("generic.armor").getAttributeValue();
    val toughness1 = player.getAttribute("generic.armorToughness").getAttributeValue();
    
    player.sendChat("护甲：" + armor1 +"，韧性："+ toughness1 +"伤害: " + event.amount);
});
*/