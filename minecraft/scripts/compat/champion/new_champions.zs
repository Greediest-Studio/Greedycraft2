/*
 * This script is created for the GreedyCraft II modpack by mc_Edwin.
 * You may NOT use this script in any other publicly distributed modpack without my permission.
 */

#priority 2800

import crafttweaker.player.IPlayer;
import crafttweaker.world.IWorld;
import crafttweaker.entity.IEntityLivingBase;
import crafttweaker.entity.IEntityLiving;
import crafttweaker.event.EntityLivingDamageEvent;

import mods.ra.champions.AffixBuilder;
import mods.ra.utils;


//魅魔
val succubus = AffixBuilder.create("succubus");
succubus.tier = 1;
succubus.onDamaged = function(living, source, damage, newDamage) {
    if (!isNull(source.getTrueSource())) {
        if (source.getTrueSource() instanceof IPlayer) {
            var player as IPlayer = source.getTrueSource();
            var world as IWorld = living.world;
            if (!world.remote) {
                if (!isNull(living.nbt.succubusCount)) {
                    var count as int = living.nbt.succubusCount as int;
                    living.update({succubusCount : count + 1});
                    var healAmount as float = (damage * 0.1f * (count as float + 1.0f) > damage) ? damage : (damage * 0.1f * (count as float + 1.0f));
                    world.catenation().sleep(20).then(function(world, context) {
                        if (!isNull(living)) {
                            if (living.maxHealth - living.health > healAmount) {
                                living.health += healAmount;
                            } else {
                                var extra as float = healAmount - (living.maxHealth - living.health);
                                living.health = living.maxHealth;
                                if (!isNull(living.nbt.succubusDamageMutiplier)) {
                                    living.update({succubusDamageMutiplier : living.nbt.succubusDamageMutiplier as float + extra});
                                } else {
                                    living.update({succubusDamageMutiplier : extra});
                                }
                            }
                        }
                    }).start();
                } else {
                    living.update({succubusCount : 0 as int});
                }
            }
        }
    }
    return newDamage;
};
succubus.register();

//恶臭
val poopy = AffixBuilder.create("poopy");
poopy.tier = 1;
poopy.onDeath = function(living, source, event) {
    if (!isNull(source.getTrueSource())) {
        if (source.getTrueSource() instanceof IPlayer) {
            <additions:poop>.createEntityItem(living.world, living.x as float, living.y as float, living.z as float);
        }
    }
};
poopy.register();

events.onEntityLivingDamage(function(event as EntityLivingDamageEvent) {
    if (!isNull(event.damageSource.getTrueSource())) {
        var sourceEntity as IEntityLivingBase = event.damageSource.getTrueSource();
        if (sourceEntity instanceof IEntityLiving) {
            var entity as IEntityLiving = sourceEntity;
            if (utils.isChampion(entity)) {
                if (utils.getAffixes(entity) has "succubus") {
                    if (!isNull(entity.nbt.succubusDamageMutiplier)) {
                        var extra as float = entity.nbt.succubusDamageMutiplier as float;
                        entity.update({succubusDamageMutiplier : 0.0f});
                        event.amount += extra;
                    }
                }
            }
        }
    }
});