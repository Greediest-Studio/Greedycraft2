/*
 * This script is created for the GreedyCraft modpack by 一只飞鸟 & mc_Edwin.
 * You may NOT use this script in any other publicly distributed modpack without my permission.
 */


#priority 90

import crafttweaker.event.PotionEffectRemoveEvent;
import crafttweaker.event.PotionEffectExpiryEvent;

import crafttweaker.entity.IEntityLiving;
import crafttweaker.player.IPlayer;

events.onPotionEffectRemove(function(event as PotionEffectRemoveEvent) {
    if (!isNull(event.potionEffect) && event.potionEffect.potion.name == <potion:contenttweaker:demon_decay>.name) {
        if (!isNull(event.entity)) {
            var enemy as IEntityLiving = event.entity;
            enemy.isAIDisabled = false;
        }
    }

    if (!isNull(event.potionEffect) && event.potionEffect.potion.name == <potion:gctcore:sukhavati>.name) {
        if (!isNull(event.entity)) {
            if (event.entity instanceof IPlayer) {
                var player as IPlayer = event.entity;
                if (!player.world.remote) {
                    if (!isNull(player.nbt.ForgeData.sukhavatiHurt) && !isNull(player.nbt.ForgeData.sukhavatiKill)) {
                        var hurt as int = player.nbt.ForgeData.sukhavatiHurt as int;
                        var kill as int = player.nbt.ForgeData.sukhavatiKill as int;
                        if (hurt > kill) {
                            player.sendChat("§f[极乐净土] 你遭到了反噬……");
                            player.update({sukhavatiHurt : 0 as int, sukhavatiKill : 0 as int});
                            player.health = 0.0;
                        } else {
                            player.sendChat("§f[极乐净土] 你安然无恙地走出了极乐净土。");
                            player.update({sukhavatiHurt : 0 as int, sukhavatiKill : 0 as int});
                        }
                    }
                }
            }
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

    if (!isNull(event.potionEffect) && event.potionEffect.potion.name == <potion:gctcore:sukhavati>.name) {
        if (!isNull(event.entity)) {
            if (event.entity instanceof IPlayer) {
                var player as IPlayer = event.entity;
                if (!player.world.remote) {
                    if (!isNull(player.nbt.ForgeData.sukhavatiHurt) && !isNull(player.nbt.ForgeData.sukhavatiKill)) {
                        var hurt as int = player.nbt.ForgeData.sukhavatiHurt as int;
                        var kill as int = player.nbt.ForgeData.sukhavatiKill as int;
                        if (hurt > kill) {
                            player.sendChat("§f[极乐净土] 你遭到了反噬……");
                            player.update({sukhavatiHurt : 0 as int, sukhavatiKill : 0 as int});
                            player.health = 0.0;
                        } else {
                            player.sendChat("§f[极乐净土] 你安然无恙地走出了极乐净土。");
                            player.update({sukhavatiHurt : 0 as int, sukhavatiKill : 0 as int});
                        }
                    }
                }
            }
        }
    }
});
