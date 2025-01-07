/*
 * This script is created for the GreedyCraft Tweaks by 咕咕咕.
 */

#priority 50


import crafttweaker.oredict.IOreDictEntry;
import crafttweaker.item.IItemStack;
import crafttweaker.data.IData;
import crafttweaker.item.IIngredient;
import crafttweaker.liquid.ILiquidStack;

import mods.modularmachinery.RecipeBuilder;
import mods.ctutils.utils.Math;
import mods.jei.JEI;

import scripts.util.machines as MMUtil;

RecipeBuilder.newBuilder("botanical_ingot_awakened", "mythsteel_plate", 400)
    .addManaPerTickInput(100000)
    .addItemInput(<gct_mobs:botanical_ingot> * 4)
    .addItemInput(<gct_mobs:rosium_ingot> * 1)
    .addItemInput(<gct_mobs:chrysanthemium_ingot> * 1)
    .addItemInput(<gct_mobs:dandelionium_ingot> * 1)
    .addItemInput(<gct_mobs:myosotisium_ingot> * 1)
    .addItemInput(<gct_mobs:begonium_ingot> * 1)
    .addItemInput(<gct_mobs:carnationium_ingot> * 1)
    .addItemInput(<additions:botaniaddon-kianate_ingot> * 6)
    .addItemInput(<gct_ores:balanced_matrix_ingot> * 1)
    .addItemOutput(<gct_mobs:botanical_ingot_awakened> * 2)
    .build();

RecipeBuilder.newBuilder("rosium_ingot", "mythsteel_plate", 200)
    .addManaPerTickInput(40000)
    .addItemInput(<additions:botaniaddon-ratziel_rune> * 1)
    .addItemInput(<additions:botaniaddon-chamael_rune> * 1)
    .addItemInput(<additions:botaniaddon-raphael_rune> * 1)
    .addItemInput(<additions:botaniaddon-michael_rune> * 1)
    .addItemInput(<additions:botaniaddon-gabriel_rune> * 1)
    .addItemInput(<defiledlands:scarlite_block> * 2)
    .addItemInput(<gct_mobs:mana_block> * 2)
    .addItemInput(<gct_mobs:botanical_ingot> * 1)
    .addItemInput(<gct_mobs:gaia_heart> * 1)
    .addItemOutput(<gct_mobs:rosium_ingot> * 1)
    .build();

RecipeBuilder.newBuilder("chrysanthemium_ingot", "mythsteel_plate", 200)
    .addManaPerTickInput(40000)
    .addItemInput(<additions:botaniaddon-michael_rune> * 1)
    .addItemInput(<additions:botaniaddon-haniel_rune> * 1)
    .addItemInput(<additions:botaniaddon-raphael_rune> * 1)
    .addItemInput(<additions:botaniaddon-gabriel_rune> * 1)
    .addItemInput(<additions:botaniaddon-sandalphon_rune> * 1)
    .addItemInput(<tinkersaether:valkyrie_block> * 2)
    .addItemInput(<gct_mobs:mana_block> * 2)
    .addItemInput(<gct_mobs:botanical_ingot> * 1)
    .addItemInput(<gct_mobs:gaia_heart> * 1)
    .addItemOutput(<gct_mobs:chrysanthemium_ingot> * 1)
    .build();

RecipeBuilder.newBuilder("carnationium_ingot", "mythsteel_plate", 200)
    .addManaPerTickInput(40000)
    .addItemInput(<additions:botaniaddon-metatron_rune> * 1)
    .addItemInput(<additions:botaniaddon-zaphkiel_rune> * 1)
    .addItemInput(<additions:botaniaddon-chamael_rune> * 1)
    .addItemInput(<additions:botaniaddon-haniel_rune> * 1)
    .addItemInput(<additions:botaniaddon-gabriel_rune> * 1)
    .addItemInput(<extrabotany:blockphotonium> * 2)
    .addItemInput(<gct_mobs:mana_block> * 2)
    .addItemInput(<gct_mobs:botanical_ingot> * 1)
    .addItemInput(<gct_mobs:gaia_heart> * 1)
    .addItemOutput(<gct_mobs:carnationium_ingot> * 1)
    .build();

RecipeBuilder.newBuilder("dandelionium_ingot", "mythsteel_plate", 200)
    .addManaPerTickInput(40000)
    .addItemInput(<additions:botaniaddon-metatron_rune> * 1)
    .addItemInput(<additions:botaniaddon-zadkiel_rune> * 1)
    .addItemInput(<additions:botaniaddon-haniel_rune> * 1)
    .addItemInput(<additions:botaniaddon-sandalphon_rune> * 1)
    .addItemInput(<additions:botaniaddon-zaphkiel_rune> * 1)
    .addItemInput(<additions:greedycraft-balancite_block> * 2)
    .addItemInput(<gct_mobs:mana_block> * 2)
    .addItemInput(<gct_mobs:botanical_ingot> * 1)
    .addItemInput(<gct_mobs:gaia_heart> * 1)
    .addItemOutput(<gct_mobs:dandelionium_ingot> * 1)
    .build();

RecipeBuilder.newBuilder("myosotisium_ingot", "mythsteel_plate", 200)
    .addManaPerTickInput(40000)
    .addItemInput(<additions:botaniaddon-ratziel_rune> * 1)
    .addItemInput(<additions:botaniaddon-zadkiel_rune> * 1)
    .addItemInput(<additions:botaniaddon-michael_rune> * 1)
    .addItemInput(<additions:botaniaddon-raphael_rune> * 1)
    .addItemInput(<additions:botaniaddon-sandalphon_rune> * 1)
    .addItemInput(<extrabotany:blockshadowium> * 2)
    .addItemInput(<gct_mobs:mana_block> * 2)
    .addItemInput(<gct_mobs:botanical_ingot> * 1)
    .addItemInput(<gct_mobs:gaia_heart> * 1)
    .addItemOutput(<gct_mobs:myosotisium_ingot> * 1)
    .build();

RecipeBuilder.newBuilder("begonium_ingot", "mythsteel_plate", 200)
    .addManaPerTickInput(40000)
    .addItemInput(<additions:botaniaddon-metatron_rune> * 1)
    .addItemInput(<additions:botaniaddon-ratziel_rune>* 1)
    .addItemInput(<additions:botaniaddon-zaphkiel_rune>* 1)
    .addItemInput(<additions:botaniaddon-zadkiel_rune> * 1)
    .addItemInput(<additions:botaniaddon-chamael_rune> * 1)
    .addItemInput(<sakura:sakura_diamond_block> * 2)
    .addItemInput(<gct_mobs:mana_block> * 2)
    .addItemInput(<gct_mobs:botanical_ingot> * 1)
    .addItemInput(<gct_mobs:gaia_heart> * 1)
    .addItemOutput(<gct_mobs:begonium_ingot> * 1)
    .build();