import crafttweaker.event.EntityLivingDeathEvent;
import crafttweaker.entity.IEntityLivingBase;
import crafttweaker.player.IPlayer;
import crafttweaker.item.IItemStack;

var crimsonCultistList as string[] = [
    "thaumcraft:cultistcleric",
    "thaumcraft:cultistleader",
    "thaumcraft:cultistknight",
    "thaumicconcilium:crimson_pontifex",
    "thaumicconcilium:crimson_paladin",
    "crimsonrevelations:cultist_archer"
];

events.onEntityLivingDeath(function(event as EntityLivingDeathEvent) {
    if (!(isNull(event.entityLivingBase) || isNull(event.entityLivingBase.definition))) {
        var ent as IEntityLivingBase = event.entityLivingBase;
        if (!isNull(event.damageSource.getTrueSource())) {
            if (event.damageSource.getTrueSource() instanceof IPlayer) {
                var player as IPlayer = event.damageSource.getTrueSource();
                for i in 0 to player.baublesInventory.getSlotCount() {
                    if (!isNull(player.baublesInventory.getStackInSlot(i))) {
                        if (player.baublesInventory.getStackInSlot(i).definition.id == "contenttweaker:bauble_crimson_ring") {
                            var ring as IItemStack = player.baublesInventory.getStackInSlot(i);
                            if (crimsonCultistList has ent.definition.id) {
                                if (!isNull(ring.tag.crimsonPower)) {
                                    var currentPower as int = ring.tag.crimsonPower as int;
                                    ring.mutable().updateTag({crimsonPower : currentPower + 1 as int});
                                } else {
                                    ring.mutable().updateTag({crimsonPower : 1 as int});
                                }
                                break;
                            }
                        }
                    }
                }
            }
        }
    } 
});