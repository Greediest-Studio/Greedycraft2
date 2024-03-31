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

RecipeBuilder.newBuilder("miner_aurorian", "miner_aurorian", speed, 0)
    .addEnergyPerTickInput(energy)
    .setDimension([645])
    .addItemOutput(<theaurorian:moonstoneore>)
    .setChance(0.5f / 10.0f)
    .addItemOutput(<theaurorian:ceruleanore>)
    .setChance(0.3f / 10.0f)
    .addItemOutput(<theaurorian:crystal>)
    .setChance(0.3f / 10.0f)
    .addItemOutput(<theaurorian:scrapaurorianite>)
    .setChance(0.5f / 10.0f)
    .addItemOutput(<theaurorian:scrapcrystalline>)
    .setChance(0.5f / 10.0f)
    .addItemOutput(<theaurorian:scrapumbra>)
    .setChance(0.5f / 10.0f)
    .build();