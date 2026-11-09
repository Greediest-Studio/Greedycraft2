
/*
 * This script is created for the GreedyCraft II modpack by mc_Edwin.
 * You may NOT use this script in any other publicly distributed modpack without my permission. 
 */

#priority 30


import crafttweaker.oredict.IOreDictEntry;
import crafttweaker.item.IItemStack;
import crafttweaker.data.IData;
import crafttweaker.item.IIngredient;
import crafttweaker.liquid.ILiquidStack;

import mods.modularmachinery.RecipeBuilder;
import mods.modularmachinery.MachineModifier;
import mods.modularmachinery.RecipeAdapterBuilder;
import mods.modularmachinery.FactoryRecipeTickEvent;
import mods.modularmachinery.RecipeModifierBuilder;
import mods.modularmachinery.MMEvents;
import mods.modularmachinery.ControllerGUIRenderEvent;
import mods.ctutils.utils.Math;
import mods.jei.JEI;

import mod.mekanism.gas.IGasStack;

import scripts.util.machines as MMUtil;

val regName = "gas_power_generator";

MachineModifier.setMaxThreads(regName, 1);
MachineModifier.setInternalParallelism(regName, 1);
MachineModifier.setMaxParallelism(regName, 65536);

MMEvents.onControllerGUIRender(regName, function(event as ControllerGUIRenderEvent) {
    var hasOxidizeModule = event.controller.hasModule("oxidize");
    var ModuleList as string[] = [];
    if (hasOxidizeModule) ModuleList += "§e助燃模块";
    if (ModuleList.length == 0) ModuleList += "§c无";
    var showModule as string = "";
    for Module in ModuleList {
        if (Module != ModuleList[0]) {
            showModule = showModule + " " + Module;
        } else {
            showModule = Module;
        }
    }
    var info as string[] = [
        "§a///燃气发电机控制面板///",
        "§a机器名称：§eLV1 - 燃气发电机",
        "§a附属模块：" + showModule
    ];
    event.extraInfo = info;
});

function addGasFuel(gas as ILiquidStack, energyPerTick as int, burnTime as int) {
    val regName = "gas_power_generator";
    val oxidizerList as float[ILiquidStack] = {
        <liquid:liquidchlorine> * 1000 : 1.5f,
        <liquid:liquid_chlorine> * 10 : 2.0f,
        <liquid:oxygen> * 1000 : 1.2f,
        <liquid:liquid_oxygen> * 10 : 1.8f,
        <liquid:fluorine> * 1000 : 2.0f,
        <liquid:liquid_fluorine> * 10 : 2.5f,
        <liquid:hydrogen_peroxide> * 1000 : 1.8f,
        <liquid:oxygen_difluoride> * 1000 : 2.5f
    };
    RecipeBuilder.newBuilder("gas_generation_" + gas.definition.name, regName, burnTime, 1)
        .addFluidInput(gas * 1000)
        .addEnergyPerTickOutput(energyPerTick)
        .setJEICategory("gas", "§aLV1 - 燃气发电机 - 空气燃烧")
        .setMultipleParallelism(4)
        .build();
    var oxidizeRecipe = RecipeBuilder.newBuilder("gas_generation_" + gas.definition.name + "_ox", regName, burnTime, 0);
    oxidizeRecipe.addFluidInput(gas * 1000);
    oxidizeRecipe.addEnergyPerTickOutput(energyPerTick);
    for oxidizer, mtp in oxidizerList {
        oxidizeRecipe.addFluidCatalystInput(oxidizer, ["§e将产能提升为" + mtp as string + "倍", "§c不可叠加"],
            [RecipeModifierBuilder.create("modularmachinery:energy", "output", mtp, 1, false).build()]
        );
    }
    oxidizeRecipe.setMaxCatalyst(1);
    oxidizeRecipe.withModule(["oxidize"]);
    oxidizeRecipe.addRecipeTooltip("§a需要模块：助燃模块");
    oxidizeRecipe.addRecipeTooltip("§c注意！助燃剂不可叠加使用！");
    oxidizeRecipe.setJEICategory("gas_cat", "§aLV1 - 燃气发电机 - 助燃燃烧");
    oxidizeRecipe.setMultipleParallelism(4);
    oxidizeRecipe.build();
}

function addGasFuelAsGas(gas as IGasStack, energyPerTick as int, burnTime as int) {
    val regName = "gas_power_generator";
    val oxidizerList as float[ILiquidStack] = {
        <liquid:liquidchlorine> * 1000 : 1.5f,
        <liquid:liquid_chlorine> * 10 : 2.0f,
        <liquid:oxygen> * 1000 : 1.2f,
        <liquid:liquid_oxygen> * 10 : 1.8f,
        <liquid:fluorine> * 1000 : 2.0f,
        <liquid:liquid_fluorine> * 10 : 2.5f,
        <liquid:hydrogen_peroxide> * 1000 : 1.8f,
        <liquid:oxygen_difluoride> * 1000 : 2.5f
    };
    RecipeBuilder.newBuilder("gas_generation_" + gas.definition.NAME + "_gas", regName, burnTime, 1)
        .addGasInput(gas * 1000)
        .addEnergyPerTickOutput(energyPerTick)
        .setJEICategory("gas", "§aLV1 - 燃气发电机 - 空气燃烧")
        .setMultipleParallelism(4)
        .build();
    var oxidizeRecipe = RecipeBuilder.newBuilder("gas_generation_" + gas.definition.NAME + "_ox_gas", regName, burnTime, 0);
    oxidizeRecipe.addGasInput(gas * 1000);
    oxidizeRecipe.addEnergyPerTickOutput(energyPerTick);
    for oxidizer, mtp in oxidizerList {
        oxidizeRecipe.addFluidCatalystInput(oxidizer, ["§e将产能提升为" + mtp as string + "倍", "§c不可叠加"],
            [RecipeModifierBuilder.create("modularmachinery:energy", "output", mtp, 1, false).build()]
        );
    }
    oxidizeRecipe.setMaxCatalyst(1);
    oxidizeRecipe.withModule(["oxidize"]);
    oxidizeRecipe.addRecipeTooltip("§a需要模块：助燃模块");
    oxidizeRecipe.addRecipeTooltip("§c注意！助燃剂不可叠加使用！");
    oxidizeRecipe.setJEICategory("gas_cat", "§aLV1 - 燃气发电机 - 助燃燃烧");
    oxidizeRecipe.setMultipleParallelism(4);
    oxidizeRecipe.build();
}

addGasFuel(<liquid:liquidhydrogen>, 81920, 2);
addGasFuel(<liquid:liquidethene>, 128000, 50);
addGasFuel(<liquid:methane>, 200000, 20);
addGasFuel(<liquid:ethyne>, 480000, 10);
addGasFuel(<liquid:crude_oil>, 8000, 250);
addGasFuel(<liquid:refined_oil>, 24000, 150);
addGasFuel(<liquid:refined_fuel>, 64000, 100);
addGasFuel(<liquid:organic_fluid>, 320, 600);
addGasFuel(<liquid:canolaoil>, 20000, 200);
addGasFuel(<liquid:refinedcanolaoil>, 48000, 150);
addGasFuel(<liquid:seed_oil>, 16000, 250);
addGasFuel(<liquid:hootch>, 40000, 50);
addGasFuel(<liquid:crystaloil>, 64000, 250);
addGasFuel(<liquid:empoweredoil>, 128000, 250);
addGasFuel(<liquid:creosote>, 4000, 250);
addGasFuel(<liquid:tree_oil>, 16000, 250);
addGasFuel(<liquid:coal>, 40000, 100);
addGasFuel(<liquid:rocket_fuel>, 120000, 25);
addGasFuel(<liquid:fire_water>, 40000, 75);
addGasFuel(<liquid:refined_biofuel>, 32000, 150);
addGasFuel(<liquid:bio.ethanol>, 160000, 45);
addGasFuel(<liquid:ethanol>, 160000, 50);
addGasFuel(<liquid:methanol>, 160000, 50);
addGasFuel(<liquid:formaldehyde>, 40000, 50);
addGasFuel(<liquid:benzene>, 240000, 50);
addGasFuel(<liquid:toluene>, 240000, 50);
addGasFuel(<liquid:paraxylene>, 240000, 50);
addGasFuel(<liquid:1_2_4_trimethylbenzene>, 240000, 50);
addGasFuel(<liquid:durene>, 240000, 50);
addGasFuel(<liquid:nitrobenzene>, 360000, 40);
addGasFuel(<liquid:mixed_hydrocarbon>, 40000, 25);
addGasFuel(<liquid:carbon_monoxide>, 40960, 2);
addGasFuel(<liquid:smoldering_tar>, 16000, 250);

addGasFuelAsGas(<gas:hydrogen>, 81920, 2);
addGasFuelAsGas(<gas:ethene>, 128000, 50);
addGasFuelAsGas(<gas:ethyne>, 480000, 5);
addGasFuelAsGas(<gas:carbonoxide>, 40960, 2);
