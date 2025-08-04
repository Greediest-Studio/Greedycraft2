#priority 30


import crafttweaker.oredict.IOreDictEntry;
import crafttweaker.item.IItemStack;
import crafttweaker.data.IData;
import crafttweaker.item.IIngredient;
import crafttweaker.liquid.ILiquidStack;

import mods.modularmachinery.RecipeBuilder;
import mods.ctutils.utils.Math;

RecipeBuilder.newBuilder("overworld_air", "air_collector", 2)
    .addDimensionInput(0)
    .addEnergyPerTickInput(100)
    .addGasOutput(<gas:air> * 500)
    .build();

RecipeBuilder.newBuilder("nether_air", "air_collector", 2)
    .addDimensionInput(-1)
    .addEnergyPerTickInput(100)
    .addGasOutput(<gas:airnether> * 500)
    .build();

RecipeBuilder.newBuilder("end_air", "air_collector", 2)
    .addDimensionInput(1)
    .addEnergyPerTickInput(100)
    .addGasOutput(<gas:airend> * 500)
    .build();

RecipeBuilder.newBuilder("abyss_air1", "air_collector", 2)
    .addDimensionInput(50)
    .addEnergyPerTickInput(100)
    .addGasOutput(<gas:airabyss> * 500)
    .build();

RecipeBuilder.newBuilder("abyss_air2", "air_collector", 2)
    .addDimensionInput(51)
    .addEnergyPerTickInput(100)
    .addGasOutput(<gas:airabyss> * 500)
    .build();

RecipeBuilder.newBuilder("abyss_air3", "air_collector", 2)
    .addDimensionInput(52)
    .addEnergyPerTickInput(100)
    .addGasOutput(<gas:airabyss> * 500)
    .build();

RecipeBuilder.newBuilder("abyss_air4", "air_collector", 2)
    .addDimensionInput(53)
    .addEnergyPerTickInput(100)
    .addGasOutput(<gas:airabyss> * 500)
    .build();
