#reloadable

import crafttweaker.player.IPlayer;
import crafttweaker.event.PlayerTickEvent;
import crafttweaker.event.PlayerAttackEntityEvent;
import crafttweaker.event.EntityLivingDamageEvent;
import crafttweaker.event.PlayerBreakSpeedEvent;
import crafttweaker.event.EntityLivingUpdateEvent;
import crafttweaker.event.PlayerInteractBlockEvent;
import crafttweaker.event.EntityLivingUseItemEvent.Finish;
import crafttweaker.entity.AttributeModifier;
import crafttweaker.entity.IEntityLivingBase;
import crafttweaker.entity.IEntityLiving;

import scripts.compat.abyss_settings.sanity_functions as SanityHelper;

events.onPlayerTick(function(event as PlayerTickEvent) {
    
    var player as IPlayer = event.player;
    var san as float = SanityHelper.getSanity(player);
    var mtp as float = (100.0f - san) / 200.0f as float;

    if (!player.getAttribute("generic.movementSpeed").hasModifier(AttributeModifier.createModifier("generic.movementSpeed", mtp as double, 2, "f47ac10b-58cc-4372-a567-0e02b2c3d47e"))) {
        player.getAttribute("generic.movementSpeed").applyModifier(AttributeModifier.createModifier("generic.movementSpeed", mtp as double, 2, "f47ac10b-58cc-4372-a567-0e02b2c3d47e"));
    }

    if (player.hasGameStage("final") == false) {
        SanityHelper.setSanity(player, 100.0f);
    }

});

events.onEntityLivingDamage(function(event as EntityLivingDamageEvent) {
    
    if (event.entityLivingBase instanceof IPlayer) {
        var player as IPlayer = event.entityLivingBase;
        var san as float = SanityHelper.getSanity(player);
        var mtp as float = (100.0f - san) / 200.0f as float;

        if (player.hasGameStage("final")) {
            event.amount *= (1.0f + mtp * 4.0f);
        }
    }

    if (!isNull(event.damageSource.getTrueSource())) {
        if (event.damageSource.getTrueSource() instanceof IPlayer) {
            var player as IPlayer = event.damageSource.getTrueSource();
            var san as float = SanityHelper.getSanity(player);
            var mtp as float = (100.0f - san) / 200.0f as float;

            if (player.hasGameStage("final")) {
                event.amount *= (1.0f + mtp * 2.0f);
            }
        }

    }

});

events.onPlayerBreakSpeed(function(event as PlayerBreakSpeedEvent) {

    var player as IPlayer = event.player;
    var san as float = SanityHelper.getSanity(player);
    var mtp as float =  1.0f - (100.0f - san) / 200.0f as float;

    if (player.hasGameStage("final")) {
        event.newSpeed *= mtp;
    }

});

events.onEntityLivingUpdate(function(event as EntityLivingUpdateEvent) {
    if (!isNull(event.entityLivingBase) ) {
        if (event.entityLivingBase instanceof IEntityLiving) {
            var entity as IEntityLiving = event.entityLivingBase;
            if (!isNull(entity.definition)) {
                if (entity.definition.id has "abyssalcraft" || entity.definition.id has "gct_aby") {
                    if (entity.attackTarget instanceof IPlayer) {
                        var player as IPlayer = entity.attackTarget;
                        if (SanityHelper.getSanity(player) <= -30.0f) {
                            if (!isNull(entity.lastAttackedEntity)) {
                                if (entity.lastAttackedEntity instanceof IPlayer) {
                                   var targetPlayer as IPlayer = entity.lastAttackedEntity;
                                    if (targetPlayer.uuid != player.uuid) {
                                        entity.attackTarget = null;
                                    }
                                } else {
                                    entity.attackTarget = null;
                                }
                            } 
                            else {entity.attackTarget = null;}  
                        }
                    }
                }
            }
        }
    }
});

events.onPlayerInteractBlock(function(event as PlayerInteractBlockEvent) {

    if (!event.world.isRemote()) {
        if (SanityHelper.getSanity(event.player) <= -50.0f) {
            event.player.sendStatusMessage("§e你感到一阵精神恍惚，这让你无法思考接下来的行动。", true);
            event.cancel();
        }
    }

});

events.onPlayerAttackEntity(function(event as PlayerAttackEntityEvent) {
    
    if (event.target instanceof IEntityLiving) {
        var entity as IEntityLiving = event.target;
        if (!isNull(entity.definition)) {
            if (entity.definition.id has "abyssalcraft" || entity.definition.id has "gct_aby") {
                if (SanityHelper.getSanity(event.player) >= 0.5f) {
                    SanityHelper.removeSanity(event.player, 0.5f);
                }
            }
        }
    }
});

events.onEntityLivingUseItemFinish(function(event as Finish) {
    
    if (event.isPlayer) {
        if (<gct_aby:shoggothtancale>.matches(event.item)) {
            SanityHelper.removeSanity(event.player, 10);
        } else if (<gct_aby:shoggoth_tancale_soup>.matches(event.item)) {
            SanityHelper.removeSanity(event.player, 20);
        } else if (<gct_aby:remnant_cookie>.matches(event.item)) {
            SanityHelper.removeSanity(event.player, 5);
        } else if (<gct_aby:fruit_of_mind>.matches(event.item)) {
            SanityHelper.addSanity(event.player, 20);
        } else if (<gct_aby:fruit_of_mind_enchanted>.matches(event.item)) {
            SanityHelper.addSanity(event.player, 200);
        }
    }

});