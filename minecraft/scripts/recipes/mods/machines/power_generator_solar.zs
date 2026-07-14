/*
 * This script is created for the GreedyCraft II modpack by mc_Edwin.
 */

#priority 30

import crafttweaker.oredict.IOreDictEntry;
import crafttweaker.item.IItemStack;
import crafttweaker.data.IData;
import crafttweaker.item.IIngredient;
import crafttweaker.liquid.ILiquidStack;
import crafttweaker.world.IBlockPos;

import crafttweaker.world.IWorldProvider;

import mods.modularmachinery.RecipeBuilder;
import mods.modularmachinery.MachineModifier;
import mods.modularmachinery.RecipeAdapterBuilder;
import mods.modularmachinery.MMEvents;
import mods.modularmachinery.ControllerGUIRenderEvent;
import mods.modularmachinery.MachineTickEvent;
import mods.modularmachinery.FactoryRecipeStartEvent;
import mods.modularmachinery.RecipeModifierBuilder;
import mods.modularmachinery.IMachineController;
import mods.ctutils.utils.Math;
import mods.jei.JEI;

import scripts.util.machines as MMUtil;

MachineModifier.setMaxThreads("solar_power_generator", 36);
MachineModifier.setInternalParallelism("solar_power_generator", 36);
MachineModifier.setMaxParallelism("solar_power_generator", 36);

MMEvents.onControllerGUIRender("solar_power_generator", function(event as ControllerGUIRenderEvent) {
    var info as string[] = [
        "§a///光伏集成阵列控制面板///",
        "§a机器名称：§eLV2 - 光伏集成阵列"
    ];
    var efficiency as float = isNull(event.controller.customData.solarEfficiency) ? 0.0f : event.controller.customData.solarEfficiency as float;
    var panelLight as int = isNull(event.controller.customData.solarPanelLight) ? 0 : event.controller.customData.solarPanelLight as int;
    var worldBrightness as float = isNull(event.controller.customData.solarWorldBrightness) ? 0.0f : event.controller.customData.solarWorldBrightness as float;
    info += "§a工作面积：§e" ~ panelLight as string ~ "§a/§e36";
    info += "§a世界亮度：§e" ~ ((Math.round(worldBrightness * 10000.0f) as float / 100.0f) as string) ~ "%";
    info += "§a实际效率：§e" ~ ((Math.round(efficiency * 10000.0f) as float / 100.0f) as string) ~ "%";
    event.extraInfo = info;
});

MMEvents.onMachinePreTick("solar_power_generator", function(event as MachineTickEvent) {
    val ctrl as IMachineController = event.controller;
    if (!ctrl.world.isRemote() && ctrl.world.getWorldTime() % 100 == 0) {
        var panelLight as int = ctrl.checkPanelLight();
        var World = IWorldProvider.getFromID(ctrl.world.getDimension());
        var worldBrightness as float = World.getSunBrightness(1.0F);
        var efficiency as float = (panelLight as float / 36.0f) * worldBrightness;
        ctrl.customData = ctrl.customData.update({
            solarPanelLight: panelLight as int,
            solarWorldBrightness: worldBrightness as float,
            solarEfficiency: efficiency as float
        });
    }
});

$expand IMachineController$checkPanelLight() as int {
    var heightSet as int = 0;
    var counter as int = 0;
    for i in -1 to 5 {
        heightSet += 1;
        var height as int = 6 + (heightSet / 2);
        for j in -3 to 3 {
            var blockPos = this.pos.getOffset(this.facing.opposite(), i).getOffset(this.facing.rotateY(), j).up(height);
            var canSeeSky as bool = this.world.canSeeSky(blockPos.up(1));
            counter += (canSeeSky ? 1 : 0);
        }
    }
    return counter;
}

val solarPanelList as long[IItemStack] = {
    <solarflux:solar_panel_1> : 1,
    <solarflux:solar_panel_2> : 4,
    <solarflux:solar_panel_3> : 8,
    <solarflux:solar_panel_4> : 16,
    <solarflux:solar_panel_5> : 64,
    <solarflux:solar_panel_6> : 128,
    <solarflux:solar_panel_7> : 512,
    <solarflux:solar_panel_8> : 2048,
    <solarflux:custom_solar_panel_solar_panel_9> : 8192,
    <solarflux:custom_solar_panel_solar_panel_10> : 32768,
    <solarflux:custom_solar_panel_solar_panel_11> : 131072,
    <solarflux:custom_solar_panel_solar_panel_12> : 524288,
    <solarflux:custom_solar_panel_solar_panel_13> : 2097152,
    <solarflux:custom_solar_panel_solar_panel_14> : 8388608,
    <solarflux:solar_panel_wyvern> : 16384,
    <solarflux:solar_panel_draconic> : 32768,
    <solarflux:solar_panel_chaotic> : 131072,
    <solarflux:custom_solar_panel_solar_panel_order> : 1048576,
    <solarflux:solar_panel_neutronium> : 268435456000,
    <solarflux:solar_panel_infinity> : 8796093022208,
    <solarflux:solar_panel_alchemical> : 16,
    <solarflux:solar_panel_alchemical_brass> : 32,
    <solarflux:solar_panel_thaumium> : 64,
    <solarflux:solar_panel_void_metal> : 256
};

function addSolarPanelRecipe(panel as IItemStack, baseRF as long) {
    RecipeBuilder.newBuilder("solar_generation_" ~ panel.definition.id.replaceAll(":", "_") ~ "_" ~ panel.metadata, "solar_power_generator", 1)
        .addItemInput(panel).setChance(0.0f)
        .addEnergyPerTickOutput(baseRF)
        .addFactoryStartHandler(function(event as FactoryRecipeStartEvent) {
            var parallel as int = event.activeRecipe.parallelism;
            var parallelBonus as float = 0.8f + (parallel as float * 0.08f);
            if (parallelBonus > 3.68f) {
                parallelBonus = 3.68f;
            }
            var efficiency as float = isNull(event.controller.customData.solarEfficiency) ? 0.0f : event.controller.customData.solarEfficiency as float;
            event.factoryRecipeThread.addModifier("solar_generation_bonus", RecipeModifierBuilder.create("modularmachinery:energy", "output", parallelBonus * efficiency, 1, false).build());
        })
        .setMaxThreads(1)
        .addRecipeTooltip("§b实际发电量拥有§c并行奖赏§b机制，其单位输出电量将乘以(0.8+0.08×并行数)")
        .addRecipeTooltip("§b该机器的最大并行数和最大线程数均为§e36")
        .build();
}

for panelList in solarPanelList.keys {
    addSolarPanelRecipe(panelList, solarPanelList[panelList]);
}
