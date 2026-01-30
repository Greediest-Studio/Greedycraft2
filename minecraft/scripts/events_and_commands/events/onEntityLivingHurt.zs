/*
 * This script is created for the GreedyCraft modpack by TCreopargh.
 * You may NOT use this script in any other publicly distributed modpack without my permission.
 */

#priority 90

import crafttweaker.event.PlayerLoggedInEvent;
import crafttweaker.event.IPlayerEvent;
import crafttweaker.event.PlayerRespawnEvent;
import crafttweaker.event.PlayerTickEvent;
import crafttweaker.data.IData;
import crafttweaker.damage.IDamageSource;
import crafttweaker.entity.IEntityLivingBase;
import crafttweaker.player.IPlayer;
import crafttweaker.util.Position3f;
import crafttweaker.block.IBlock;
import crafttweaker.world.IBlockPos;
import crafttweaker.block.IBlockState;
import crafttweaker.potions.IPotionEffect;
import crafttweaker.world.IFacing;
import crafttweaker.command.ICommandSender;
import crafttweaker.event.EntityLivingHurtEvent;

import mods.ctutils.utils.Math;
import mods.ctutils.world.IGameRules;

static damageScalingBlacklist as string[] = [
    "abyssalcraft:jzahar",
    "draconicevolution:chaosguardian",
    "abyssalcraft:shadowboss",
    "aether_legacy:sun_spirit",
    "extrabotany:gaiaiii",
    "extrabotany:voidherrscher",
    "botania:doppleganger"
];

static skeletonEntities as string[] = [
    "minecraft:skeleton",
    "minecraft:wither_skeleton"
];

events.onEntityLivingHurt(function(event as EntityLivingHurtEvent) {
    var entity as IEntityLivingBase = event.entityLivingBase;
    
    // Make burning undead mobs burn quicker
    if (entity.isUndead && entity.isBurning && !entity.isBoss && entity.world.canSeeSky(entity.position) && entity.world.isDayTime() && event.damageSource.isFireDamage()) {
        event.amount += (entity.maxHealth as float / 20.0f);
    }

    // Reduce thorns damage caused by player
    if (!isNull(event.damageSource.getTrueSource()) && event.damageSource.getTrueSource() instanceof IPlayer) {
        if (event.damageSource.getDamageType().equalsIgnoreCase(IDamageSource.createThornsDamage(event.damageSource.getTrueSource()).getDamageType())) {
            if (event.amount > 50.0f) {
                event.amount = 50.0f;
            }
            if (event.amount > entity.maxHealth * 0.05f) {
                event.amount = entity.maxHealth * 0.05f;
            }
            if (entity.isBoss) {
                event.amount = 0.0f;
                event.cancel();
            }
        }
    }

    if (isNull(entity) || !entity instanceof IPlayer) {
        return;
    }

    var player as IPlayer = entity;

    // Spider traps player with slowness or web
    var spiderId = <entity:minecraft:spider>.id;
    var caveSpiderId = <entity:minecraft:cave_spider>.id;
    if (!isNull(event.damageSource.getTrueSource()) && event.damageSource.getTrueSource() instanceof IEntityLivingBase && !isNull(event.damageSource.getTrueSource().definition) && !isNull(event.damageSource.getTrueSource().definition.id)) {
        if (event.damageSource.getTrueSource().definition.id == spiderId || event.damageSource.getTrueSource().definition.id == caveSpiderId) {
            if (!entity.isPotionActive(<potion:minecraft:slowness>)) {
                entity.addPotionEffect(<potion:minecraft:slowness>.makePotionEffect(200, 0, false, false));
            } else {
                if (Math.random() < 0.66) {
                    var slownessLevel = entity.getActivePotionEffect(<potion:minecraft:slowness>).amplifier;
                    if (slownessLevel < 3) {
                        var increment = 1;
                        if (Math.random() < 0.33) {
                            increment = 2;
                        }
                        entity.addPotionEffect(<potion:minecraft:slowness>.makePotionEffect(200, slownessLevel + increment, false, false));
                    } else {
                        entity.addPotionEffect(<potion:minecraft:slowness>.makePotionEffect(200, 4, false, false));
                        if (!isNull(entity.world.getBlock(entity.position)) && entity.world.getBlock(entity.position).definition.id == "minecraft:air") {
                            var blockState as IBlockState = IBlockState.getBlockState(<minecraft:web>.definition.id, [] as string[]);
                            entity.world.setBlockState(blockState, entity.position as IBlockPos);
                        }
                    }
                }
            }
        }
    }

    var dmg as float = event.amount;

    // Scales explosion damage
    if (event.damageSource.isExplosion()) {
        if (player.hasGameStageSilent("nether")) {
            dmg *= 1.25f;
        }
        
        if (player.hasGameStageSilent("hardmode")) {
            dmg *= 1.5f;
        }
    }

    // Scales projectile damage
    if (!isNull(event.damageSource.getTrueSource()) && event.damageSource.getTrueSource() instanceof IEntityLivingBase && event.damageSource.isProjectile()) {
        if (!event.damageSource.getTrueSource().isBoss) {
            dmg *= (1.0 + 0.0012 * player.difficulty) as double;
            if (!isNull(event.damageSource.getTrueSource().definition) && skeletonEntities has event.damageSource.getTrueSource().definition.id) {
                dmg *= 2.0f;
            }
        }
    }

    // More boss damage
    if (!isNull(event.damageSource.getTrueSource()) && event.damageSource.getTrueSource() instanceof IEntityLivingBase) {
        if (event.damageSource.getTrueSource().isBoss) {
            if (!(damageScalingBlacklist has event.damageSource.getTrueSource().definition.id)) {
                dmg *= (1.0 + 0.0016 * player.difficulty) as double;     
            }
        }
    }
    
    // Prevents damage overflow from Eldrich Guardian
    if (!isNull(event.damageSource.getTrueSource()) && event.damageSource.getTrueSource() instanceof IEntityLivingBase && !isNull(event.damageSource.getTrueSource().definition) && event.damageSource.getTrueSource().definition.id == <entity:thaumcraft:eldritchguardian>.id) {
        if (dmg > player.maxHealth * 0.15) {
            dmg = player.maxHealth * 0.15;
        }
    }

    // Potion effect: Pure
    if (player.isPotionActive(<potion:contenttweaker:pure>)) {
        dmg *= 5.0f;
    }

    // Potion effect: Atum Protection
    if (player.dimension == 17 && (!player.isPotionActive(<potion:contenttweaker:atum_protection>))) {
        player.sendChat("§c来自阿图姆的沙尘暴轻而易举地撕碎了你的身躯。");
        player.setDead();
        player.health = 0.0f;
    }

    // Dragon Body Trait Damage Reduction
    var dragonBodyTraitCount as int = 0;
    dragonBodyTraitCount += TicTraitLib.getPlayerTicHelmetTrait(player) has "dragon_body" ? 1 : 0;
    dragonBodyTraitCount += TicTraitLib.getPlayerTicChestplateTrait(player) has "dragon_body" ? 1 : 0;
    dragonBodyTraitCount += TicTraitLib.getPlayerTicLeggingsTrait(player) has "dragon_body" ? 1 : 0;
    dragonBodyTraitCount += TicTraitLib.getPlayerTicBootsTrait(player) has "dragon_body" ? 1 : 0;
    if (dragonBodyTraitCount > 0 && player.native.capabilities.isFlying) {
        dmg *= (1.0f - 0.2f * dragonBodyTraitCount as float);
    }

    //Sukhavati Trait Damage Reduction
    if (player.isPotionActive(<potion:gctcore:sukhavati>) && !player.world.remote) {
        if (!isNull(player.nbt) && !isNull(player.nbt.ForgeData) && !isNull(player.nbt.ForgeData.sukhavatiHurt)) {
            var hurtTime = player.nbt.ForgeData.sukhavatiHurt as int;
            player.update({sukhavatiHurt : hurtTime + 1 as int});
        } else {
            player.update({sukhavatiHurt : 1 as int});
        }
        if (!isNull(player.nbt) && !isNull(player.nbt.ForgeData) && !isNull(player.nbt.ForgeData.sukhavatiKill)) {
            var killCount = player.nbt.ForgeData.sukhavatiKill as int;
            var hurtTime = (!isNull(player.nbt) && !isNull(player.nbt.ForgeData) && !isNull(player.nbt.ForgeData.sukhavatiHurt)) ? (player.nbt.ForgeData.sukhavatiHurt as int) : 0;
            player.sendChat("§f[极乐净土] 击杀数：" + killCount as string + " 受伤数：" + hurtTime as string);
        } else {
            var hurtTime = (!isNull(player.nbt) && !isNull(player.nbt.ForgeData) && !isNull(player.nbt.ForgeData.sukhavatiHurt)) ? (player.nbt.ForgeData.sukhavatiHurt as int) : 0;
            player.sendChat("§f[极乐净土] 击杀数：0 受伤数：" + hurtTime as string);
        }
        dmg = 0.0f;
    }
    
    event.amount = dmg;
});
