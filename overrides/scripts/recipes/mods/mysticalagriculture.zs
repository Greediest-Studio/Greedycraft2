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

registerSeedRecipe(<mysticalcreations:titanium_seeds>, <additions:titanium_ingot>, 6, 1, <mysticalcreations:titanium_essence>, <additions:greedycraft-titanium_nugget>);
registerSeedRecipe(<mysticalcreations:chromium_seeds>, <additions:chromium_ingot>, 5, 1, <mysticalcreations:chromium_essence>, null);
registerSeedRecipe(<mysticalcreations:cake_seeds>, <minecraft:cake>, 3, 2, <mysticalcreations:cake_essence>, null);
registerSeedRecipe(<mysticalcreations:witch_seeds>, <mysticalcreations:witch_chunk>, 4, 1, <mysticalcreations:witch_essence>, null);
registerSeedRecipe(<mysticalcreations:stainless_steel_seeds>, <additions:stainless_steel_ingot>, 5, 1, <mysticalcreations:stainless_steel_essence>, null);
registerSeedRecipe(<mysticalcreations:fusion_matrix_seeds>, <tconevo:material>, 6, 1, <mysticalcreations:fusion_matrix_essence>, <tconevo:material>);
registerSeedRecipe(<mysticalcreations:meteor_seeds>, <nyx:meteor_ingot>, 5, 1, <mysticalcreations:meteor_essence>, <nyx:meteor_ingot>);
registerSeedRecipe(<mysticalcreations:aetherium_seeds>, <additions:greedycraft-aetherium_ingot>, 6, 3, <mysticalcreations:aetherium_essence>, <gct_ores:aetherium_nugget>);
registerSeedRecipe(<mysticalcreations:canopium_seeds>, <additions:greedycraft-canopium_ingot>, 6, 3, <mysticalcreations:canopium_essence>, <gct_ores:canopium_nugget>);
registerSeedRecipe(<mysticalcreations:mistium_seeds>, <additions:greedycraft-mistium_ingot>, 6, 1, <mysticalcreations:mistium_essence>, <gct_ores:mistium_nugget>);
registerSeedRecipe(<mysticalcreations:lavarite_seeds>, <additions:greedycraft-lavarite_ingot>, 6, 3, <mysticalcreations:lavarite_essence>, <gct_ores:lavarite_nugget>);
registerSeedRecipe(<mysticalcreations:plasmarite_seeds>, <additions:greedycraft-plasmarite_ingot>, 6, 3, <mysticalcreations:plasmarite_essence>, <gct_ores:plasmarite_nugget>);
registerSeedRecipe(<mysticalcreations:bnightium_seeds>, <additions:greedycraft-bnightium_ingot>, 6, 1, <mysticalcreations:bnightium_essence>, <gct_ores:bnightium_nugget>);
registerSeedRecipe(<mysticalcreations:snowingium_seeds>, <additions:greedycraft-snowingium_ingot>, 6, 3, <mysticalcreations:snowingium_essence>, <gct_ores:snowingium_nugget>);
registerSeedRecipe(<mysticalcreations:freezite_seeds>, <additions:greedycraft-freezite_ingot>, 6, 3, <mysticalcreations:freezite_essence>, <gct_ores:freezite_nugget>);
registerSeedRecipe(<mysticalcreations:oceanium_seeds>, <additions:greedycraft-oceanium_ingot>, 6, 1, <mysticalcreations:oceanium_essence>, <gct_ores:oceanium_nugget>);
registerSeedRecipe(<mysticalcreations:cryonium_seeds>, <additions:cryonium_ingot>, 6, 3, <mysticalcreations:cryonium_essence>, <jaopca:item_nuggetcryonium>);
registerSeedRecipe(<mysticalcreations:infernium_seeds>, <additions:infernium_ingot>, 6, 3, <mysticalcreations:infernium_essence>, <additions:greedycraft-infernium_nugget>);
registerSeedRecipe(<mysticalcreations:cytosinite_seeds>, <additions:cytosinite_ingot>, 5, 1, <mysticalcreations:cytosinite_essence>, <additions:cytosinite_ingot>);
registerSeedRecipe(<mysticalcreations:thyminite_seeds>, <additions:greedycraft-thyminite_ingot>, 5, 1, <mysticalcreations:thyminite_essence>, <additions:greedycraft-thyminite_ingot>);
registerSeedRecipe(<mysticalcreations:guaninite_seeds>, <additions:greedycraft-guaninite_ingot>, 5, 1, <mysticalcreations:guaninite_essence>, <additions:greedycraft-guaninite_ingot>);
registerSeedRecipe(<mysticalcreations:adeninite_seeds>, <additions:greedycraft-adeninite_ingot>, 5, 1, <mysticalcreations:adeninite_essence>, <additions:greedycraft-adeninite_ingot>);