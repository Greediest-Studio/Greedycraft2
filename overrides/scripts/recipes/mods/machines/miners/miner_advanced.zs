#priority 30


import crafttweaker.oredict.IOreDictEntry;
import crafttweaker.item.IItemStack;
import crafttweaker.data.IData;
import crafttweaker.item.IIngredient;
import crafttweaker.liquid.ILiquidStack;

import mods.modularmachinery.RecipeBuilder;
import mods.ctutils.utils.Math;

val speed = 250;
val energy = 100;

RecipeBuilder.newBuilder("miner_advanced", "miner_advanced", speed, 0)
    .addEnergyPerTickInput(energy)
    .setDimension([0])
    .addItemOutput(<additions:greedycraft-manganese_ore>)
    .setChance(0.4f / 10.0f)
    .addItemOutput(<nuclearcraft:ore:7>)
    .setChance(0.35f / 10.0f)
    .addItemOutput(<additions:greedycraft-aqualite_ore>)
    .setChance(0.2f / 10.0f)
    .addItemOutput(<additions:greedycraft-aeroite_ore>)
    .setChance(0.3f / 10.0f)
    .addItemOutput(<nyx:meteor_shard>)
    .setChance(0.3f / 10.0f)
    .addItemOutput(<thaumcraft:ore_cinnabar>)
    .setChance(0.5f / 10.0f)
    .addItemOutput(<abyssalcraft:abyore>)
    .setChance(0.2f / 10.0f)
    .addItemOutput(<taiga:basalt_block>)
    .setChance(0.1f / 10.0f)
    .addItemOutput(<journey:shadiumore>)
    .setChance(0.1f / 10.0f)
    .addItemOutput(<journey:luniumore>)
    .setChance(0.1f / 10.0f)
    .addItemOutput(<taiga:meteorite_block>)
    .setChance(0.08f / 10.0f)
    .addItemOutput(<taiga:meteoritecobble_block>)
    .setChance(0.16f / 10.0f)    
    .build();