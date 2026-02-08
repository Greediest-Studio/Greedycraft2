/*
 * This script is created for the GreedyCraft II modpack by mc_Edwin.
 * You may NOT use this script in any other publicly distributed modpack without my permission.
 */

#loader contenttweaker

#modloaded tconstruct

#priority 2601

import crafttweaker.item.IItemStack;
import crafttweaker.player.IPlayer;
import crafttweaker.entity.IEntityLivingBase;
import crafttweaker.entity.IEntityLiving;
import crafttweaker.world.IVector3d;

import mods.cc.tic.BowTraitBuilder;
import mods.cc.tic.BowTrait;
import mods.cc.event.onBowShootEvent;
import mods.contenttweaker.Color;
import mods.zenutils.I18n;

import mods.ctutils.utils.Math;

val slimy_shotTrait = BowTraitBuilder.create("slimy_shot");
slimy_shotTrait.color = Color.fromHex("ffffff").getIntColor();
slimy_shotTrait.localizedName = game.localize("greedycraft.tconstruct.bow_trait.slimy_shotTrait.name");
slimy_shotTrait.localizedDescription = game.localize("greedycraft.tconstruct.bow_trait.slimy_shotTrait.desc");
slimy_shotTrait.register();

val soul_takerTrait = BowTraitBuilder.create("soul_taker");
soul_takerTrait.color = Color.fromHex("ffffff").getIntColor();
soul_takerTrait.localizedName = game.localize("greedycraft.tconstruct.bow_trait.soul_takerTrait.name");
soul_takerTrait.localizedDescription = game.localize("greedycraft.tconstruct.bow_trait.soul_takerTrait.desc");
soul_takerTrait.calcArrowDamage = function(trait, bow, arrow, helder, target, world, originalDamage, newDamage) {
    if (helder instanceof IPlayer && target instanceof IEntityLivingBase) {
        var entity as IEntityLivingBase = target;
        if (entity.isPotionActive(<potion:minecraft:invisibility>)) {
            return newDamage * 3.0f;
        }
    }
    return newDamage;
};
soul_takerTrait.register();

val spectual_arrowTrait = BowTraitBuilder.create("spectual_arrow");
spectual_arrowTrait.color = Color.fromHex("ffffff").getIntColor();
spectual_arrowTrait.localizedName = game.localize("greedycraft.tconstruct.bow_trait.spectual_arrowTrait.name");
spectual_arrowTrait.localizedDescription = game.localize("greedycraft.tconstruct.bow_trait.spectual_arrowTrait.desc");
spectual_arrowTrait.calcArrowDamage = function(trait, bow, arrow, helder, target, world, originalDamage, newDamage) {
    if (helder instanceof IPlayer && target instanceof IEntityLivingBase) {
        var entity as IEntityLivingBase = target;
        entity.addPotionEffect(<potion:minecraft:glowing>.makePotionEffect(200, 0, true, false));
    }
    return newDamage;
};
spectual_arrowTrait.register();

val cushioningTrait = BowTraitBuilder.create("cushioning");
cushioningTrait.color = Color.fromHex("ffffff").getIntColor();
cushioningTrait.localizedName = game.localize("greedycraft.tconstruct.bow_trait.cushioningTrait.name");
cushioningTrait.localizedDescription = game.localize("greedycraft.tconstruct.bow_trait.cushioningTrait.desc");
cushioningTrait.register();

val chemicalTrait = BowTraitBuilder.create("chemical");
chemicalTrait.color = Color.fromHex("ffffff").getIntColor();
chemicalTrait.localizedName = game.localize("greedycraft.tconstruct.bow_trait.chemicalTrait.name");
chemicalTrait.localizedDescription = game.localize("greedycraft.tconstruct.bow_trait.chemicalTrait.desc");
chemicalTrait.calcArrowDamage = function(trait, bow, arrow, helder, target, world, originalDamage, newDamage) {
    if (helder instanceof IPlayer && target instanceof IEntityLivingBase) {
        var entity as IEntityLivingBase = target;
        if (!isNull(entity.activePotionEffects)) {
            return newDamage * (1.0f + 0.25f * entity.activePotionEffects.length as float);
        }
    }
    return newDamage;
};
chemicalTrait.register();

val oscillationTrait = BowTraitBuilder.create("oscillation");
oscillationTrait.color = Color.fromHex("ffffff").getIntColor();
oscillationTrait.localizedName = game.localize("greedycraft.tconstruct.bow_trait.oscillationTrait.name");
oscillationTrait.localizedDescription = game.localize("greedycraft.tconstruct.bow_trait.oscillationTrait.desc");
oscillationTrait.onArrowLoose = function(trait, bow, charge, helder, world) {
    if (helder instanceof IPlayer) {
        var player as IPlayer = helder;
        var faceVec as IVector3d = player.lookingDirection;
        var pushVec as IVector3d = IVector3d.create(faceVec.x, 0.0d, faceVec.z);
        if (pushVec.x * pushVec.z != 0.0d) {
            var pushVecNormalized as IVector3d = pushVec.normalized.scale(2.5d);
            for entity in getEntityLivingBaseInSectorCot(helder, 10.0d, 90.0d) {
                entity.motionX += pushVecNormalized.x;
                entity.motionZ += pushVecNormalized.z;
            }
        }
    }
};
oscillationTrait.register();

val bloody_arrowTrait = BowTraitBuilder.create("bloody_arrow");
bloody_arrowTrait.color = Color.fromHex("ffffff").getIntColor();
bloody_arrowTrait.localizedName = game.localize("greedycraft.tconstruct.bow_trait.bloody_arrowTrait.name");
bloody_arrowTrait.localizedDescription = game.localize("greedycraft.tconstruct.bow_trait.bloody_arrowTrait.desc");
bloody_arrowTrait.register();

val bloody_arrow2Trait = BowTraitBuilder.create("bloody_arrow2");
bloody_arrow2Trait.color = Color.fromHex("ffffff").getIntColor();
bloody_arrow2Trait.localizedName = game.localize("greedycraft.tconstruct.bow_trait.bloody_arrow2Trait.name");
bloody_arrow2Trait.localizedDescription = game.localize("greedycraft.tconstruct.bow_trait.bloody_arrow2Trait.desc");
bloody_arrow2Trait.register();

val frightened_trait = BowTraitBuilder.create("frightened");
frightened_trait.color = Color.fromHex("ffffff").getIntColor();
frightened_trait.localizedName = game.localize("greedycraft.tconstruct.bow_trait.frightened_trait.name");
frightened_trait.localizedDescription = game.localize("greedycraft.tconstruct.bow_trait.frightened_trait.desc");
frightened_trait.calcArrowDamage = function(trait, bow, arrow, helder, target, world, originalDamage, newDamage) {
    if (target instanceof IEntityLiving && Math.random() < 0.5f) {
        var entity as IEntityLiving = target;
        var randomEntityList as IEntityLiving[] = [] as IEntityLiving[];
        for otherEntity in getEntityLivingBasesInCubeCot(entity, 7.0d) {
            if (otherEntity.id != entity.id && otherEntity instanceof IEntityLiving) {
                var otherLiving as IEntityLiving = otherEntity;
                randomEntityList += otherLiving;
            }
        }
        if (randomEntityList.length > 0) {
            var randomEntity as IEntityLiving = randomEntityList[entity.world.random.nextInt(0, randomEntityList.length - 1)];
            entity.revengeTarget = randomEntity;
        }
    }
    return newDamage;
};
frightened_trait.register();

val shroudTrait = BowTraitBuilder.create("shroud");
shroudTrait.color = Color.fromHex("ffffff").getIntColor();
shroudTrait.localizedName = game.localize("greedycraft.tconstruct.bow_trait.shroudTrait.name");
shroudTrait.localizedDescription = game.localize("greedycraft.tconstruct.bow_trait.shroudTrait.desc");
shroudTrait.calcArrowDamage = function(trait, bow, arrow, helder, target, world, originalDamage, newDamage) {
    if (helder instanceof IPlayer && target instanceof IEntityLivingBase) {
        var entity as IEntityLivingBase = target;
        entity.addPotionEffect(<potion:minecraft:slowness>.makePotionEffect(200, 1, false, false));
        helder.addPotionEffect(<potion:tiths:paralysed>.makePotionEffect(200, 0, false, false));
        return newDamage * 2.0f;
    }
    return newDamage;
};
shroudTrait.register();

val flamebowTrait = BowTraitBuilder.create("flamebow");
flamebowTrait.color = Color.fromHex("ffffff").getIntColor();
flamebowTrait.localizedName = game.localize("greedycraft.tconstruct.bow_trait.flamebowTrait.name");
flamebowTrait.localizedDescription = game.localize("greedycraft.tconstruct.bow_trait.flamebowTrait.desc");
flamebowTrait.register();

events.onBowShoot(function(event as onBowShootEvent) {
    if (!event.entity.world.remote && !isNull(event.bow) && !isNull(event.ammo) && !isNull(event.player)) {
        var bow as IItemStack = event.bow;
        var ammo as IItemStack = event.ammo;
        var totalBonusCount as int = 0;
        var totalBonusInaccuracy as float = 0.0f;
        
        if (CotTicTraitLib.hasTicTrait(bow, "slimy_shot")) {
            var count as int = 0;
            for i in 0 to 2 {
                if (Math.random() < 0.5f) count += 1;
            }
            totalBonusCount += count;
        }

        if (CotTicTraitLib.hasTicTrait(bow, "cushioning")) {
            totalBonusInaccuracy -= 0.25f;
        }

        if (CotTicTraitLib.hasTicTrait(bow, "bloody_arrow2")) {
            if (!isNull(bow.tag.bloodyArrow)) {
                var bloodyArrowCount as int = bow.tag.bloodyArrow as int;
                if (bloodyArrowCount > 5) {
                    totalBonusCount += 10;
                    bow.mutable().updateTag({bloodyArrow : bloodyArrowCount - 5 as int});
                } else if (bloodyArrowCount > 0) {
                    totalBonusCount += bloodyArrowCount * 2;
                    bow.mutable().updateTag({bloodyArrow : 0 as int});
                }
            }
        } else if (CotTicTraitLib.hasTicTrait(bow, "bloody_arrow")) {
            if (!isNull(bow.tag.bloodyArrow)) {
                var bloodyArrowCount as int = bow.tag.bloodyArrow as int;
                if (bloodyArrowCount > 5) {
                    totalBonusCount += 5;
                    bow.mutable().updateTag({bloodyArrow : bloodyArrowCount - 5 as int});
                } else if (bloodyArrowCount > 0) {
                    totalBonusCount += bloodyArrowCount;
                    bow.mutable().updateTag({bloodyArrow : 0 as int});
                }
            }
        }

        event.setCount(event.projectileCount + totalBonusCount);
        event.setBonusInaccuracy(totalBonusInaccuracy);

    }
});
