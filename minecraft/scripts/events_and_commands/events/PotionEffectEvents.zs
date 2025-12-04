/*
 * This script is created for the GreedyCraft modpack by 一只飞鸟 & mc_Edwin.
 * You may NOT use this script in any other publicly distributed modpack without my permission.
 */


#priority 90

import crafttweaker.event.PotionEffectRemoveEvent;
import crafttweaker.event.PotionEffectExpiryEvent;

import crafttweaker.entity.IEntityLiving;

events.onPotionEffectRemove(function(event as PotionEffectRemoveEvent) {
    if (!isNull(event.potionEffect) && event.potionEffect.potion.name == <potion:contenttweaker:demon_decay>.name) {
        if (!isNull(event.entity)) {
            var enemy as IEntityLiving = event.entity;
            enemy.isAIDisabled = false;
        }
    }
});

events.onPotionEffectExpiry(function(event as PotionEffectExpiryEvent){
    if (!isNull(event.potionEffect) && event.potionEffect.potion.name == <potion:contenttweaker:demon_decay>.name) {
        if (!isNull(event.entity)) {
            var enemy as IEntityLiving = event.entity;
            enemy.isAIDisabled = false;
        }
    }
});
