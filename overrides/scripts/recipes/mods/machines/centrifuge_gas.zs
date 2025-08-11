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
import mods.modularmachinery.MachineUpgradeBuilder;
import mods.modularmachinery.MachineUpgradeHelper;
import mods.modularmachinery.MachineModifier;
import mods.modularmachinery.IMachineController;
import mods.modularmachinery.RecipePrimer;
import mods.modularmachinery.RecipeModifier;
import mods.modularmachinery.RecipeModifierBuilder;
import mods.modularmachinery.FactoryRecipeThread;
import mods.modularmachinery.RecipeAdapterBuilder;
import mods.modularmachinery.RecipeCheckEvent;
import mods.modularmachinery.ControllerGUIRenderEvent;
import mods.modularmachinery.MMEvents;
import mods.ctutils.utils.Math;

MachineModifier.setMaxParallelism("gas_centrifuge", 256);
MachineModifier.setInternalParallelism("gas_centrifuge", 1);
MachineModifier.setMaxThreads("gas_centrifuge", 1);

MMEvents.onControllerGUIRender("gas_centrifuge", function(event as ControllerGUIRenderEvent) {
    var info as string[] = [
        "§a///气体分离器控制面板///",
        "§a机器名称：§eLV3 - 气体分离器"
    ];
    event.extraInfo = info;
});

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

