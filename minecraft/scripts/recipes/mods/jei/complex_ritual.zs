/*
 * This script is created for the GreedyCraft II modpack by mc_Edwin.
 * You may NOT use this script in any other publicly distributed modpack without my permission.
 */

#priority 1400

import crafttweaker.item.IItemStack;

import mods.jei.JEI;
import mods.randomtweaker.jei.IJeiPanel;
import mods.randomtweaker.jei.IJeiUtils;
import mods.randomtweaker.jei.IJeiRecipe;

var complex_ritualJEI as IJeiPanel = JEI.createJei("complex_ritual", "融合仪式");
complex_ritualJEI.setModid("gct_aby");
complex_ritualJEI.setIcon(<gct_aby:abyss_wand>);
complex_ritualJEI.addRecipeCatalyst(<gct_aby:abyss_wand>);
complex_ritualJEI.setBackground(IJeiUtils.createBackground(0, 0, 128, 128, "randomtweaker:textures/gui/complex_ritual.png"));
complex_ritualJEI.addSlot(IJeiUtils.createItemSlot("input1", 3, 85, true, false));
complex_ritualJEI.addSlot(IJeiUtils.createItemSlot("input2", 56, 85, true, false));
complex_ritualJEI.addSlot(IJeiUtils.createItemSlot("output", 96, 54, false, false));
complex_ritualJEI.addSlot(IJeiUtils.createItemSlot("catalyst", 48, 5, true, true));
complex_ritualJEI.addElement(IJeiUtils.createFontInfoElement("消耗位能：150000 PE", 52, 108, 0xffffff));
complex_ritualJEI.register();

function createComplexRitualJEI(output as IItemStack, input1 as IItemStack, input2 as IItemStack, catalyst as IItemStack) {
    var recipe as IJeiRecipe = JEI.createJeiRecipe("complex_ritual");
    recipe.addInput(input1);
    recipe.addInput(input2);
    recipe.addInput(catalyst);
    recipe.addOutput(output);
    recipe.build();
}

createComplexRitualJEI(<gct_aby:muddy_flesh>,
    <minecraft:spawn_egg>.withTag({EntityTag: {id: "babymobs:babyzombie"}}),
    <minecraft:spawn_egg>.withTag({EntityTag: {id: "babymobs:babyzombie"}}),
    null);

createComplexRitualJEI(<minecraft:spawn_egg>.withTag({EntityTag: {id: "gct_aby:mixture_shoggoth"}}),
    <minecraft:spawn_egg>.withTag({EntityTag: {id: "ageofabyssalcraft:lessershoggothhelpful"}}),
    <minecraft:spawn_egg>.withTag({EntityTag: {id: "ageofabyssalcraft:lessershoggothhelpful"}}),
    <gct_aby:shoggy_slime>);

createComplexRitualJEI(<minecraft:spawn_egg>.withTag({EntityTag: {id: "gct_aby:bloody_shoggoth"}}),
    <minecraft:spawn_egg>.withTag({EntityTag: {id: "gct_aby:mixture_shoggoth"}}),
    <minecraft:spawn_egg>.withTag({EntityTag: {id: "abyssalcraft:lesserdreadbeast"}}),
    <gct_aby:shoggy_slime_purified>);

createComplexRitualJEI(<minecraft:spawn_egg>.withTag({EntityTag: {id: "erebus:erebus.ant_shell"}}),
    <minecraft:spawn_egg>.withTag({EntityTag: {id: "erebus:erebus.zombie_ant_soldier"}}),
    <minecraft:spawn_egg>.withTag({EntityTag: {id: "erebus:erebus.zombie_ant_soldier"}}),
    <jaopca:dust.undead>);

createComplexRitualJEI(<minecraft:spawn_egg>.withTag({EntityTag: {id: "thaumicconcilium:quicksilver_elemental"}}),
    <minecraft:spawn_egg>.withTag({EntityTag: {id: "thaumicconcilium:thaumaturge"}}),
    <minecraft:spawn_egg>.withTag({EntityTag: {id: "babymobs:babyirongolem"}}),
    <tiths:block_cinnabar>);

createComplexRitualJEI(<minecraft:spawn_egg>.withTag({EntityTag: {id: "thaumicconcilium:overanimated"}}),
    <minecraft:spawn_egg>.withTag({EntityTag: {id: "thaumicconcilium:thaumaturge"}}),
    <minecraft:spawn_egg>.withTag({EntityTag: {id: "thermalfoundation:blizz"}}),
    <additions:godslime_slimeball>);