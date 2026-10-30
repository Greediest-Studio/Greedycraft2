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
import mods.modularmachinery.RecipeModifierBuilder;
import mods.modularmachinery.FactoryRecipeStartEvent;
import mods.modularmachinery.MachineModifier;
import mods.modularmachinery.SmartInterfaceType;
import mods.ctutils.utils.Math;
import mods.modularmachinery.ControllerGUIRenderEvent;
import mods.modularmachinery.MMEvents;
import mods.jei.JEI;

MachineModifier.setInternalParallelism("thermal_evaporation_plant", 32);
MachineModifier.setMaxThreads("thermal_evaporation_plant", 1);
MachineModifier.setMaxParallelism("thermal_evaporation_plant", 65536);

MachineModifier.addSmartInterfaceType("thermal_evaporation_plant", SmartInterfaceType.create("配方选择", 0.0f));

function getThermalEvaporationScaling(height as int) as double[] {
    var x as int = height;
    if (x < 1) {
        x = 1;
    }
    if (x > 100) {
        x = 100;
    }
    val energyCoefficient as double = 0.1d + 0.9d * ((x - 1) as double) / 19.0d;
    val timeCoefficient as double = 1.0d / energyCoefficient;
    return [energyCoefficient, timeCoefficient] as double[];
}

function applyThermalEvaporationScaling(event as FactoryRecipeStartEvent) {
    val pattern = event.controller.getDynamicPattern("tower");
    val height as int = isNull(pattern) ? 20 : pattern.size;
    val scaling as double[] = getThermalEvaporationScaling(height);
    event.factoryRecipeThread.addModifier("thermal_evaporation_energy", RecipeModifierBuilder.create("modularmachinery:energy", "input", scaling[0] as float, 1, false).build());
    event.factoryRecipeThread.addModifier("thermal_evaporation_duration", RecipeModifierBuilder.create("modularmachinery:duration", "input", scaling[1] as float, 1, false).build());
}

RecipeBuilder.newBuilder("r1", "thermal_evaporation_plant", 100)
    .addEnergyPerTickInput(100000)
    .addFluidInputs(<liquid:water> * 20000)
    .addFluidOutput(<liquid:heavywater> * 2000)
    .addSmartInterfaceDataInput("配方选择", 0.0f)
    .addFactoryStartHandler(function(event as FactoryRecipeStartEvent) {
        applyThermalEvaporationScaling(event);
    })
    .addRecipeTooltip("§e重复层数X的能耗和时间随机器高度变化：")
    .addRecipeTooltip("§d能耗系数=0.1+0.9×(X－1)/19；时间系数=1/能耗系数")
    .addRecipeTooltip("§eX范围为1至100，X=20时两项系数均为1。")
    .build();

RecipeBuilder.newBuilder("r1a", "thermal_evaporation_plant", 100)
    .addEnergyPerTickInput(100000)
    .addFluidInputs(<liquid:water> * 20000)
    .addFluidOutput(<liquid:brine> * 2000)
    .addSmartInterfaceDataInput("配方选择", 1.0f)
    .addFactoryStartHandler(function(event as FactoryRecipeStartEvent) {
        applyThermalEvaporationScaling(event);
    })
    .addRecipeTooltip("§e重复层数X的能耗和时间随机器高度变化：")
    .addRecipeTooltip("§d能耗系数=0.1+0.9×(X－1)/19；时间系数=1/能耗系数")
    .addRecipeTooltip("§eX范围为1至100，X=20时两项系数均为1。")
    .build();

RecipeBuilder.newBuilder("r2", "thermal_evaporation_plant", 100)
    .addEnergyPerTickInput(100000)
    .addFluidInputs(<liquid:brine> * 20000)
    .addFluidOutput(<liquid:liquidlithium> * 2000)
    .addFactoryStartHandler(function(event as FactoryRecipeStartEvent) {
        applyThermalEvaporationScaling(event);
    })
    .addRecipeTooltip("§e重复层数X的能耗和时间随机器高度变化：")
    .addRecipeTooltip("§d能耗系数=0.1+0.9×(X－1)/19；时间系数=1/能耗系数")
    .addRecipeTooltip("§eX范围为1至100，X=20时两项系数均为1。")
    .build();

RecipeBuilder.newBuilder("r3", "thermal_evaporation_plant", 100)
    .addEnergyPerTickInput(100000)
    .addFluidInputs(<liquid:liquidsodium> * 2000000)
    .addFluidOutput(<liquid:liquidsuperheatedsodium> * 2000)
    .addFactoryStartHandler(function(event as FactoryRecipeStartEvent) {
        applyThermalEvaporationScaling(event);
    })
    .addRecipeTooltip("§e重复层数X的能耗和时间随机器高度变化：")
    .addRecipeTooltip("§d能耗系数=0.1+0.9×(X－1)/19；时间系数=1/能耗系数")
    .addRecipeTooltip("§eX范围为1至100，X=20时两项系数均为1。")
    .build();

RecipeBuilder.newBuilder("r4", "thermal_evaporation_plant", 100)
    .addEnergyPerTickInput(100000)
    .addFluidInputs(<liquid:mekanism_extras.polonium_containing_solution> * 20000)
    .addFluidOutput(<liquid:mekanism_extras.polonium_208> * 2000)
    .addFactoryStartHandler(function(event as FactoryRecipeStartEvent) {
        applyThermalEvaporationScaling(event);
    })
    .addRecipeTooltip("§e重复层数X的能耗和时间随机器高度变化：")
    .addRecipeTooltip("§d能耗系数=0.1+0.9×(X－1)/19；时间系数=1/能耗系数")
    .addRecipeTooltip("§eX范围为1至100，X=20时两项系数均为1。")
    .build();

MMEvents.onControllerGUIRender("thermal_evaporation_plant", function(event as ControllerGUIRenderEvent) {
    var pattern = event.controller.getDynamicPattern("tower");
    var height as int = isNull(pattern) ? 3 : pattern.size + 3;
    var scalingHeight as int = height < 1 ? 1 : height;
    var scaling as double[] = getThermalEvaporationScaling(scalingHeight);
    var energyText as string = ((Math.round(scaling[0] * 100.0d) as double) / 100.0d) as string;
    var timeText as string = ((Math.round(scaling[1] * 100.0d) as double) / 100.0d) as string;
    var info as string[] = [
        "§a///电热热力蒸馏塔控制面板///",
        "§a机器名称：§eLV3 - 电热热力蒸馏塔",
        "§a机器高度：§e" ~ height as string,
        "§a能耗倍率：§e" ~ energyText,
        "§a时间倍率：§e" ~ timeText
    ];
    event.extraInfo = info;
});
