

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