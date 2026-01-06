/*
 * This script is created for the GreedyCraft modpack by TCreopargh.
 * You may NOT use this script in any other publicly distributed modpack without my permission.
 */

#priority 11000

import crafttweaker.item.IItemStack;
import crafttweaker.data.IData;
import crafttweaker.item.IIngredient;

import mods.zenutils.I18n;

import scripts.util.mystical_agriculture.regName;
import scripts.util.mystical_agriculture.energy;
import scripts.util.mystical_agriculture.time;
import scripts.util.mystical_agriculture.fluid;
import scripts.util.mystical_agriculture.timeCarpenter;
import scripts.util.mystical_agriculture.fluidCarpenter;
import scripts.util.mystical_agriculture.seedChance;
import scripts.util.mystical_agriculture.registerSeedRecipe;

registerSeedRecipe(<mysticalagriculture:stainless_steel_seeds>, <additions:stainless_steel_ingot>, 5, 1, <mysticalagriculture:stainless_steel_essence>, <additions:stainless_steel_ingot>);
registerSeedRecipe(<mysticalagriculture:chromium_seeds>, <additions:chromium_ingot>, 5, 1, <mysticalagriculture:chromium_essence>, <additions:chromium_ingot>);
registerSeedRecipe(<mysticalagriculture:ignite_seeds>, <additions:ignite_ingot>, 5, 1, <mysticalagriculture:ignite_essence>, <additions:ignite_ingot>);
registerSeedRecipe(<mysticalagriculture:cytosinite_seeds>, <additions:cytosinite_ingot>, 5, 1, <mysticalagriculture:cytosinite_essence>, <additions:cytosinite_ingot>);
registerSeedRecipe(<mysticalagriculture:thyminite_seeds>, <additions:thyminite_ingot>, 5, 1, <mysticalagriculture:thyminite_essence>, <additions:thyminite_ingot>);
registerSeedRecipe(<mysticalagriculture:guaninite_seeds>, <additions:guaninite_ingot>, 5, 1, <mysticalagriculture:guaninite_essence>, <additions:guaninite_ingot>);
registerSeedRecipe(<mysticalagriculture:adeninite_seeds>, <additions:adeninite_ingot>, 5, 1, <mysticalagriculture:adeninite_essence>, <additions:adeninite_ingot>);
registerSeedRecipe(<mysticalagriculture:witherium_seeds>, <tiths:ingot_witherium>, 5, 1, <mysticalagriculture:witherium_essence>, null);

registerSeedRecipe(<mysticalagriculture:fusion_matrix_seeds>, <tconevo:material>, 6, 1, <mysticalagriculture:fusion_matrix_essence>, <tconevo:material>);
registerSeedRecipe(<mysticalagriculture:aetherium_seeds>, <additions:aetherium_ingot>, 6, 3, <mysticalagriculture:aetherium_essence>, <gct_ores:aetherium_nugget>);
registerSeedRecipe(<mysticalagriculture:canopium_seeds>, <additions:canopium_ingot>, 6, 3, <mysticalagriculture:canopium_essence>, <gct_ores:canopium_nugget>);
registerSeedRecipe(<mysticalagriculture:mistium_seeds>, <additions:mistium_ingot>, 6, 1, <mysticalagriculture:mistium_essence>, <gct_ores:mistium_nugget>);
registerSeedRecipe(<mysticalagriculture:lavarite_seeds>, <additions:lavarite_ingot>, 6, 3, <mysticalagriculture:lavarite_essence>, <gct_ores:lavarite_nugget>);
registerSeedRecipe(<mysticalagriculture:plasmarite_seeds>, <additions:plasmarite_ingot>, 6, 3, <mysticalagriculture:plasmarite_essence>, <gct_ores:plasmarite_nugget>);
registerSeedRecipe(<mysticalagriculture:bnightium_seeds>, <additions:bnightium_ingot>, 6, 1, <mysticalagriculture:bnightium_essence>, <gct_ores:bnightium_nugget>);
registerSeedRecipe(<mysticalagriculture:snowingium_seeds>, <additions:snowingium_ingot>, 6, 3, <mysticalagriculture:snowingium_essence>, <gct_ores:snowingium_nugget>);
registerSeedRecipe(<mysticalagriculture:freezite_seeds>, <additions:freezite_ingot>, 6, 3, <mysticalagriculture:freezite_essence>, <gct_ores:freezite_nugget>);
registerSeedRecipe(<mysticalagriculture:oceanium_seeds>, <additions:oceanium_ingot>, 6, 1, <mysticalagriculture:oceanium_essence>, <gct_ores:oceanium_nugget>);
registerSeedRecipe(<mysticalagriculture:cryonium_seeds>, <additions:cryonium_ingot>, 6, 3, <mysticalagriculture:cryonium_essence>, <jaopca:nugget.cryonium>);
registerSeedRecipe(<mysticalagriculture:infernium_seeds>, <additions:infernium_ingot>, 6, 3, <mysticalagriculture:infernium_essence>, <additions:infernium_nugget>);
registerSeedRecipe(<mysticalagriculture:titanium_seeds>, <additions:titanium_ingot>, 6, 1, <mysticalagriculture:titanium_essence>, <additions:titanium_nugget>);

registerSeedRecipe(<mysticalagriculture:dawnstone_gc_seeds>, <embers:ingot_dawnstone>, 7, 3, <mysticalagriculture:dawnstone_gc_essence>, <embers:nugget_dawnstone>);
registerSeedRecipe(<mysticalagriculture:uracilite_seeds>, <additions:uracilite_ingot>, 7, 1, <mysticalagriculture:uracilite_essence>, <additions:uracilite_ingot>);

registerSeedRecipe(<mysticalagriculture:balanced_matrix_seeds>, <gct_ores:balanced_matrix_ingot>, 8, 2, <mysticalagriculture:balanced_matrix_essence>, <jaopca:nugget.balanced_matrix>);