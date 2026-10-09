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
import mods.modularmachinery.MachineModifier;
import mods.modularmachinery.ControllerMode;
import mods.ctutils.utils.Math;
import mods.modularmachinery.ControllerGUIRenderEvent;
import mods.modularmachinery.MMEvents;
import mods.jei.JEI;

MachineModifier.addControllerMode("thermal_evaporation_plant",
    ControllerMode.create("模式", 0)
        .addMode(0, "重水模式")
        .addMode(1, "卤水模式")
        .setControllerButtonVisible(true)
        .setControllerButtonTooltip(
            "§e按下按钮切换运行模式",
            "§a当前模式：§f%s"
        )
);

MachineModifier.setInternalParallelism("thermal_evaporation_plant", 32);
MachineModifier.setMaxThreads("thermal_evaporation_plant", 1);
MachineModifier.setMaxParallelism("thermal_evaporation_plant", 65536);

RecipeBuilder.newBuilder("r1","thermal_evaporation_plant",1)
    .addEnergyPerTickInput(100000)
    .addModeSelect("模式", 0)
    .addFluidInputs(<liquid:water> * 1000)
    .addFluidOutput(<liquid:heavywater> * 100)
    .addRecipeTooltip("§a需求模式：重水模式")
    .build();

RecipeBuilder.newBuilder("r1a","thermal_evaporation_plant",1)
    .addEnergyPerTickInput(100000)
    .addModeSelect("模式", 1)
    .addFluidInputs(<liquid:water> * 1000)
    .addFluidOutput(<liquid:brine> * 100)
    .addRecipeTooltip("§a需求模式：卤水模式")
    .build();

RecipeBuilder.newBuilder("r2","thermal_evaporation_plant",1)
    .addEnergyPerTickInput(10000)
    .addFluidInputs(<liquid:brine> * 1000)
    .addFluidOutput(<liquid:liquidlithium> * 100)
    .build();

RecipeBuilder.newBuilder("r3","thermal_evaporation_plant",1)
    .addEnergyPerTickInput(10000)
    .addFluidInputs(<liquid:liquidsodium> * 1000)
    .addFluidOutput(<liquid:liquidsuperheatedsodium> * 1)
    .build();

MMEvents.onControllerGUIRender("thermal_evaporation_plant", function(event as ControllerGUIRenderEvent) {
    var mode as int = event.controller.getControllerMode("模式");
    var info as string[] = [
        "§a///电热热力蒸馏塔控制面板///",
        "§a机器名称：§eLV3 - 电热热力蒸馏塔",
        "§a机器模式：§e" ~ (mode == 0 ? "重水模式" : "卤水模式")
    ];
    event.extraInfo = info;
});
