

import crafttweaker.event.EntityLivingDeathDropsEvent;
import crafttweaker.world.IWorld;
import crafttweaker.entity.IEntityLivingBase;
import crafttweaker.entity.IEntityLiving;
import crafttweaker.entity.IEntity;
import crafttweaker.item.IItemStack;


function addDropt(entityname as string,uncooked as IItemStack,cooked as IItemStack,maxdrop as int){

    events.onEntityLivingDeathDrops(function(event as EntityLivingDeathDropsEvent){

        if(event.entity.world.remote || !(event.entity instanceof IEntityLivingBase)) return;

        val entity = event.entity;
        val dropamount =event.entity.world.random.nextInt(1,maxdrop);

        if !(isNull(entity.definition)) {
            if(entity.definition.id == entityname) {
                if(event.damageSource.isFireDamage()) {
                    event.addItem(cooked.withAmount(dropamount));
                } else {
                    event.addItem(uncooked.withAmount(dropamount));
                }
            }
        }
    });
}

addDropt("minecraft:wolf",<contenttweaker:wolfmeat>,<contenttweaker:cookedwolfmeat>,2);
addDropt("minecraft:squid",<contenttweaker:squid>,<contenttweaker:cookedsquid>,2);
addDropt("minecraft:horse",<contenttweaker:horsemeat>,<contenttweaker:cookedhorsemeat>,2);
addDropt("minecraft:bat",<contenttweaker:batwing>,<contenttweaker:cookedbatwing>,1);
addDropt("minecraft:ocelot",<contenttweaker:ocelotmeat>,<contenttweaker:cookedocelotmeat>,1);
addDropt("minecraft:parrot",<contenttweaker:parrotmeat>,<contenttweaker:cookedparrotmeat>,1);
addDropt("minecraft:llama",<contenttweaker:llamameat>,<contenttweaker:cookedllamameat>,2);
addDropt("minecraft:polar_bear",<contenttweaker:polarbearmeat>,<contenttweaker:cookedpolarbearmeat>,3);