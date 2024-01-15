#priority 30


import crafttweaker.oredict.IOreDictEntry;
import crafttweaker.item.IItemStack;
import crafttweaker.data.IData;
import crafttweaker.item.IIngredient;
import crafttweaker.liquid.ILiquidStack;

import mods.modularmachinery.RecipeBuilder;
import mods.ctutils.utils.Math;

RecipeBuilder.newBuilder("overworld_air", "air_collector", 2)
    .setDimension([0])
    .addEnergyPerTickInput(100)
    .addGasOutput("air", 500)
    .build();

RecipeBuilder.newBuilder("nether_air", "air_collector", 2)
    .setDimension([-1])
    .addEnergyPerTickInput(100)
    .addGasOutput("airnether", 500)
    .build();

RecipeBuilder.newBuilder("end_air", "air_collector", 2)
    .setDimension([1])
    .addEnergyPerTickInput(100)
    .addGasOutput("airend", 500)
    .build();

RecipeBuilder.newBuilder("abyss_air1", "air_collector", 2)
    .setDimension([50])
    .addEnergyPerTickInput(100)
    .addGasOutput("airabyss", 500)
    .build();

RecipeBuilder.newBuilder("abyss_air2", "air_collector", 2)
    .setDimension([51])
    .addEnergyPerTickInput(100)
    .addGasOutput("airabyss", 500)
    .build();

RecipeBuilder.newBuilder("abyss_air3", "air_collector", 2)
    .setDimension([52])
    .addEnergyPerTickInput(100)
    .addGasOutput("airabyss", 500)
    .build();

RecipeBuilder.newBuilder("abyss_air4", "air_collector", 2)
    .setDimension([53])
    .addEnergyPerTickInput(100)
    .addGasOutput("airabyss", 500)
    .build();
