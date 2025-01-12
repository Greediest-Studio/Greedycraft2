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
    .addGasInput(<gas:air> * 200)
    .addEnergyPerTickInput(100)
    .addGasOutput(<gas:nitrogen> * 500)
    .addGasOutput(<gas:oxygen> * 125)
    .addGasOutput(<gas:argon> * 10)
    .addGasOutput(<gas:carbondioxide> * 8)
    .addGasOutput(<gas:neon> * 8)
    .addGasOutput(<gas:krypton> * 8)
    .addGasOutput(<gas:helium> * 4)
    .addGasOutput(<gas:xenon> * 4)
    .addGasOutput(<gas:radon> * 2)
    .build();

RecipeBuilder.newBuilder("centrifuge_air_nether", "gas_centrifuge", 100)
    .addGasInput(<gas:airnether> * 2000)
    .addEnergyPerTickInput(200)
    .addGasOutput(<gas:oxygen> * 160)
    .addGasOutput(<gas:sulfurdioxide> * 15)
    .addGasOutput(<gas:sulfurtrioxide> * 12)
    .addGasOutput(<gas:chlorine> * 12)
    .addGasOutput(<gas:hydrogenchloride> * 8)
    .addGasOutput(<gas:hydrogenfluoride> * 4)
    .addGasOutput(<gas:bromine> * 4)
    .addGasOutput(<gas:impurelifeessence> * 200)
    .build();

RecipeBuilder.newBuilder("centrifuge_air_end", "gas_centrifuge", 100)
    .addGasInput(<gas:airend> * 2000)
    .addEnergyPerTickInput(200)
    .addGasOutput(<gas:oxygen> * 140)
    .addGasOutput(<gas:nitrogenoxide> * 20)
    .addGasOutput(<gas:nitrogendioxide> * 10)
    .addGasOutput(<gas:chlorine> * 8)
    .addGasOutput(<gas:bromine> * 8)
    .addGasOutput(<gas:iodine> * 4)
    .addGasOutput(<gas:hydrogenchloride> * 10)
    .addGasOutput(<gas:hydrogenfluoride> * 6)
    .build();

RecipeBuilder.newBuilder("centrifuge_air_abyss", "gas_centrifuge", 100)
    .addGasInput(<gas:airabyss> * 2000)
    .addEnergyPerTickInput(200)
    .addGasOutput(<gas:oxygen> * 200)
    .addGasOutput(<gas:nitrogen> * 200)
    .addGasOutput(<gas:hydrogen> * 30)
    .addGasOutput(<gas:ozone> * 15)
    .addGasOutput(<gas:ammonia> * 15)
    .addGasOutput(<gas:phosphine> * 8)
    .build();

RecipeBuilder.newBuilder("lifeessence", "gas_centrifuge", 40)
    .addGasInput(<gas:impurelifeessence> * 1000)
    .addEnergyPerTickInput(200)
    .addFluidOutput(<liquid:substrate_lifeessence> * 90)
    .addItemOutput(<thermalfoundation:material:864> * 1)
    .build();