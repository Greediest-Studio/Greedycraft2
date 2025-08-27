/*
 * This script is created for the GreedyCraft Tweaks by mc_Edwin.
 */

#priority 50

import crafttweaker.oredict.IOreDictEntry;
import crafttweaker.item.IItemStack;
import crafttweaker.data.IData;
import crafttweaker.item.IIngredient;
import crafttweaker.liquid.ILiquidStack;

import mods.modularmachinery.RecipePrimer;
import mods.modularmachinery.RecipeBuilder;
import mods.modularmachinery.RecipeCheckEvent;
import mods.modularmachinery.FactoryRecipeStartEvent;
import mods.modularmachinery.FactoryRecipeTickEvent;
import mods.modularmachinery.FactoryRecipeFinishEvent;
import mods.modularmachinery.RecipeModifierBuilder;
import mods.modularmachinery.RecipeAdapterBuilder;
import mods.modularmachinery.MMEvents;
import mods.modularmachinery.ControllerGUIRenderEvent;
import mods.modularmachinery.IMachineController;
import mods.modularmachinery.MachineModifier;
import mods.modularmachinery.FactoryRecipeThread;

import mod.mekanism.gas.IGasStack;

MachineModifier.setMaxThreads("elysia_grinder", 8);
MachineModifier.setInternalParallelism("elysia_grinder", 4);
MachineModifier.setMaxParallelism("elysia_grinder", 65536);

MMEvents.onControllerGUIRender("elysia_vaporizer", function(event as ControllerGUIRenderEvent) {
    var info as string[] = [
        "§e///大型搅拌单元控制面板///",
        "§a机器名称：§eELYSIA单元 - 大型搅拌单元"
    ];
    event.extraInfo = info;
});

RecipeBuilder.newBuilder("grind_adamant_1", "elysia_grinder", 100)
    .addFluidInputs([
        <liquid:prometheum_fluid> * 48,
        <liquid:palladium_fluid> * 48,
        <liquid:eezo_fluid> * 592,
        <liquid:abyssum_fluid> * 592,
        <liquid:osram_fluid> * 592,
        <liquid:valyrium_fluid> * 96,
        <liquid:uru_fluid> * 96,
        <liquid:vibranium_fluid> * 96,
        <liquid:obsidiorite_fluid> * 2592
    ])
    .addRecipeTooltip("§d搅拌配方支持模块化电容升级，详情请查询“模块化电容”")
    .addEnergyPerTickInput(2000)
    .addFluidOutput(<liquid:adamant_fluid> * 144)
    .build();

RecipeBuilder.newBuilder("grind_adamant_2", "elysia_grinder", 100)
    .addFluidInputs([
        <liquid:duranite_fluid> * 72,
        <liquid:prometheum_fluid> * 24,
        <liquid:abyssum_fluid> * 600,
        <liquid:osram_fluid> * 592,
        <liquid:eezo_fluid> * 592,
        <liquid:valyrium_fluid> * 96,
        <liquid:vibranium_fluid> * 96,
        <liquid:obsidiorite_fluid> * 2592
    ])
    .addRecipeTooltip("§d搅拌配方支持模块化电容升级，详情请查询“模块化电容”")
    .addEnergyPerTickInput(2000)
    .addFluidOutput(<liquid:adamant_fluid> * 144)
    .build();

RecipeBuilder.newBuilder("grind_adamant_3", "elysia_grinder", 100)
    .addFluidInputs([
        <liquid:palladium_fluid> * 48,
        <liquid:osram_fluid> * 592,
        <liquid:duranite_fluid> * 16,
        <liquid:eezo_fluid> * 592,
        <liquid:abyssum_fluid> * 592,
        <liquid:valyrium_fluid> * 96,
        <liquid:uru_fluid> * 96,
        <liquid:vibranium_fluid> * 96,
        <liquid:obsidiorite_fluid> * 2592
    ])
    .addRecipeTooltip("§d搅拌配方支持模块化电容升级，详情请查询“模块化电容”")
    .addEnergyPerTickInput(2000)
    .addFluidOutput(<liquid:adamant_fluid> * 144)
    .build();

RecipeBuilder.newBuilder("grind_flashite", "elysia_grinder", 100)
    .addFluidInputs([
        <liquid:fraxinium> * 108,
        <liquid:gold> * 252,
        <liquid:rubium> * 72,
        <liquid:indium> * 72,
        <liquid:sissidium> * 72,
        <liquid:xenidium> * 72,
        <liquid:osram_fluid> * 1296,
        <liquid:dimesium> * 72,
        <liquid:uru_fluid> * 144,
        <liquid:lighteum> * 96,
        <liquid:stripium> * 144,
        <liquid:nihilite_fluid> * 48,
        <liquid:eezo_fluid> * 288,
        <liquid:abyssum_fluid> * 288,
        <liquid:obsidiorite_fluid> * 1296,
        <liquid:antimony> * 72,
        <liquid:circlium> * 108,
        <liquid:fenzium> * 216,
        <liquid:dawnium> * 144,
        <liquid:breakium> * 288,
        <liquid:liquidgallium> * 144,
        <liquid:oneo> * 216,
        <liquid:soilium> * 432,
        <liquid:mangisite> * 144,
        <liquid:manyullyn> * 216,
        <liquid:cloudite> * 72,
        <liquid:togrium> * 96,
        <liquid:yoggleseum> * 96,
        <liquid:valyrium_fluid> * 72,
        <liquid:manarium> * 72
    ])
    .addRecipeTooltip("§d搅拌配方支持模块化电容升级，详情请查询“模块化电容”")
    .addEnergyPerTickInput(2000)
    .addFluidOutput(<liquid:flashite> * 162)
    .build();

RecipeBuilder.newBuilder("grind_overlaite", "elysia_grinder", 100)
    .addFluidInputs([
        <liquid:cestium> * 160,
        <liquid:circlium> * 210,
        <liquid:technetium> * 40,
        <liquid:vanadium> * 360,
        <liquid:liquidgallium> * 1080,
        <liquid:fenzium> * 480,
        <liquid:rapesesium> * 120,
        <liquid:molybdenum> * 360,
        <liquid:losessium> * 180,
        <liquid:ttwo> * 120,
        <liquid:cloudite> * 150,
        <liquid:terrax_fluid> * 120,
        <liquid:vibranium_fluid> * 80,
        <liquid:indium> * 80,
        <liquid:sissidium> * 80,
        <liquid:osram_fluid> * 1440,
        <liquid:dimesium> * 80,
        <liquid:uru_fluid> * 160,
        <liquid:lighteum> * 105,
        <liquid:stripium> * 160,
        <liquid:nihilite_fluid> * 55,
        <liquid:eezo_fluid> * 320,
        <liquid:abyssum_fluid> * 320,
        <liquid:obsidiorite_fluid> * 1440,
        <liquid:xenidium> * 80,
        <liquid:togrium> * 105,
        <liquid:yoggleseum> * 105,
        <liquid:soilium> * 480,
        <liquid:mangisite> * 160,
        <liquid:manyullyn> * 240,
        <liquid:valyrium_fluid> * 80,
        <liquid:manarium> * 80,
        <liquid:breakium> * 320,
        <liquid:oneo> * 240,
        <liquid:antimony> * 80,
        <liquid:dawnium> * 160
    ])
    .addRecipeTooltip("§d搅拌配方支持模块化电容升级，详情请查询“模块化电容”")
    .addEnergyPerTickInput(2000)
    .addFluidOutput(<liquid:overlaite> * 120)
    .build();

RecipeBuilder.newBuilder("grind_deusiotium", "elysia_grinder", 100)
    .addFluidInputs([
        <liquid:bronze> * 18,
        <liquid:constantan> * 18,
        <liquid:brass> * 18,
        <liquid:lumium> * 18,
        <liquid:glowing_signalum> * 18,
        <liquid:modularium> * 18,
        <liquid:fluxed_electrum> * 18,
        <liquid:rose_gold> * 18,
        <liquid:vibrant_alloy> * 18,
        <liquid:vivid_alloy> * 18,
        <liquid:alumite> * 18,
        <liquid:mirion> * 18,
        <liquid:knightslime> * 18,
        <liquid:pigiron> * 18,
        <liquid:dark_steel> * 18,
        <liquid:royal_alloy> * 18,
        <liquid:magiga> * 18,
        <liquid:hard_carbon> * 18
    ])
    .addRecipeTooltip("§d搅拌配方支持模块化电容升级，详情请查询“模块化电容”")
    .addEnergyPerTickInput(2000)
    .addFluidOutput(<liquid:deusiotium> * 180)
    .build();

RecipeBuilder.newBuilder("grind_culture", "elysia_grinder", 100)
    .addFluidInputs([
        <liquid:rich_brine> * 50,
        <liquid:sodium_dihydrogen_phosphate_solution> * 10,
        <liquid:magnesium_sulfate_solution> * 10,
        <liquid:sodium_hydrogen_carbonate_solution> * 20,
        <liquid:zinc_chloride_solution>,
        <liquid:iron_2_sulfate_solution>,
        <liquid:boric_acid>,
        <liquid:sodium_molybdate_solution>,
        <liquid:manganese_chloride_solution>,
        <liquid:serum> * 20,
        <liquid:water> * 85
    ])
    .addRecipeTooltip("§d搅拌配方支持模块化电容升级，详情请查询“模块化电容”")
    .addEnergyPerTickInput(2000)
    .addFluidOutput(<liquid:culture_medium> * 180)
    .build();