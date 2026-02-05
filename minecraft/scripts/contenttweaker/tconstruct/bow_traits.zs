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

events.onBowShoot(function(event as onBowShootEvent) {
    if (!event.entity.world.remote && !isNull(event.bow) && !isNull(event.ammo) && !isNull(event.player)) {
        var bow as IItemStack = event.bow;
        var ammo as IItemStack = event.ammo;
        
        if (CotTicTraitLib.hasTicTrait(bow, "slimy_shot")) {
            var count as int = 1;
            for i in 0 to 2 {
                if (Math.random() < 0.5f) count += 1;
            }
            event.setCount(count);
        }
    }
});
