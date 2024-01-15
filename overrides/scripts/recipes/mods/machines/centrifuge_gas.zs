/*
 * This script is created for the GreedyCraft modpack by TCreopargh.
 * You may NOT use this script in any other publicly distributed modpack without my permission. 
 */

#priority 30

import crafttweaker.oredict.IOreDictEntry;
import crafttweaker.item.IItemStack;
import crafttweaker.data.IData;
import crafttweaker.item.IIngredient;
import crafttweaker.liquid.ILiquidStack;

import mods.modularmachinery.RecipeBuilder;
import mods.ctutils.utils.Math;

RecipeBuilder.newBuilder("centrifuge_air", "gas_centrifuge", 100)
    .addGasInput("air", 2000)
    .addEnergyPerTickInput(100)
    .addGasOutput("nitrogen", 500)
    .addGasOutput("oxygen", 125)
    .addGasOutput("argon", 10)
    .addGasOutput("carbondioxide", 8)
    .addGasOutput("neon", 8)
    .addGasOutput("krypton", 8)
    .addGasOutput("helium", 4)
    .addGasOutput("xenon", 4)
    .addGasOutput("radon", 2)
    .build();

RecipeBuilder.newBuilder("centrifuge_air_nether", "gas_centrifuge", 100)
    .addGasInput("airnether", 2000)
    .addEnergyPerTickInput(200)
    .addGasOutput("oxygen", 160)
    .addGasOutput("sulfurdioxide", 15)
    .addGasOutput("sulfurtrioxide", 12)
    .addGasOutput("chlorine", 12)
    .addGasOutput("hydrogenchloride", 8)
    .addGasOutput("hydrogenfluoride", 4)
    .addGasOutput("bromine", 4)
    .build();

RecipeBuilder.newBuilder("centrifuge_air_end", "gas_centrifuge", 100)
    .addGasInput("airend", 2000)
    .addEnergyPerTickInput(200)
    .addGasOutput("oxygen", 140)
    .addGasOutput("nitrogenoxide", 20)
    .addGasOutput("nitrogendioxide", 10)
    .addGasOutput("chlorine", 8)
    .addGasOutput("bromine", 8)
    .addGasOutput("iodine", 4)
    .addGasOutput("hydrogenchloride", 10)
    .addGasOutput("hydrogenfluoride", 6)
    .build();

RecipeBuilder.newBuilder("centrifuge_air_abyss", "gas_centrifuge", 100)
    .addGasInput("airabyss", 2000)
    .addEnergyPerTickInput(200)
    .addGasOutput("oxygen", 200)
    .addGasOutput("nitrogen", 200)
    .addGasOutput("hydrogen", 30)
    .addGasOutput("ozone", 15)
    .addGasOutput("ammonia", 15)
    .addGasOutput("phosphine", 8)
    .build();
