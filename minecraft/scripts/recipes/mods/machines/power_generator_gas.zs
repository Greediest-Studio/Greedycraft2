
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
    oxidizeRecipe.build();
}

addGasFuel(<liquid:liquidhydrogen>, 20480, 2);
addGasFuel(<liquid:liquidethene>, 32000, 100);
addGasFuel(<liquid:methane>, 50000, 40);
addGasFuel(<liquid:ethyne>, 120000, 20);
addGasFuel(<liquid:crude_oil>, 2000, 500);
addGasFuel(<liquid:refined_oil>, 6000, 300);
addGasFuel(<liquid:refined_fuel>, 16000, 200);
addGasFuel(<liquid:organic_fluid>, 80, 1200);
addGasFuel(<liquid:canolaoil>, 5000, 400);
addGasFuel(<liquid:refinedcanolaoil>, 12000, 300);
addGasFuel(<liquid:seed_oil>, 4000, 500);
addGasFuel(<liquid:hootch>, 10000, 100);
addGasFuel(<liquid:crystaloil>, 16000, 500);
addGasFuel(<liquid:empoweredoil>, 32000, 500);
addGasFuel(<liquid:creosote>, 1000, 500);
addGasFuel(<liquid:tree_oil>, 4000, 500);
addGasFuel(<liquid:coal>, 10000, 200);
addGasFuel(<liquid:rocket_fuel>, 30000, 25);
addGasFuel(<liquid:fire_water>, 10000, 150);
addGasFuel(<liquid:refined_biofuel>, 8000, 300);
addGasFuel(<liquid:bio.ethanol>, 40000, 90);
addGasFuel(<liquid:ethanol>, 40000, 100);
addGasFuel(<liquid:methanol>, 40000, 100);
addGasFuel(<liquid:formaldehyde>, 10000, 100);
addGasFuel(<liquid:benzene>, 60000, 100);
addGasFuel(<liquid:toluene>, 60000, 100);
addGasFuel(<liquid:paraxylene>, 60000, 100);
addGasFuel(<liquid:1_2_4_trimethylbenzene>, 60000, 100);
addGasFuel(<liquid:durene>, 60000, 100);
addGasFuel(<liquid:nitrobenzene>, 90000, 80);
addGasFuel(<liquid:mixed_hydrocarbon>, 10000, 50);
addGasFuel(<liquid:carbon_monoxide>, 10240, 2);
addGasFuel(<liquid:smoldering_tar>, 4000, 500);

addGasFuelAsGas(<gas:hydrogen>, 20480, 2);
addGasFuelAsGas(<gas:ethene>, 32000, 100);
addGasFuelAsGas(<gas:ethyne>, 120000, 10);
addGasFuelAsGas(<gas:carbonoxide>, 10240, 2);
