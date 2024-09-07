#loader contenttweaker
#priority 1

import mods.contenttweaker.VanillaFactory;
import mods.randomtweaker.cote.IPotion;
import crafttweaker.potions.IPotionEffect;
import crafttweaker.player.IPlayer;
import crafttweaker.entity.IEntityLivingBase;
import crafttweaker.events.IEventManager;

var rejuvenation as IPotion = VanillaFactory.createPotion("rejuvenation", 0x820000);
rejuvenation.register();

events.onEntityLivingHeal(function(event as crafttweaker.event.EntityLivingHealEvent){
    var entity = event.entityLivingBase;
    var health = event.amount;
    if (!entity.world.remote && entity.isPotionActive(<potion:contenttweaker:rejuvenation>)){
        var number = entity.getActivePotionEffect(<potion:contenttweaker:rejuvenation>).amplifier;
            event.amount = event.amount * (number + 2);
    }
  });
