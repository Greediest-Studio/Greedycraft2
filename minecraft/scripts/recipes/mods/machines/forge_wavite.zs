/*
 * This script is created for the GreedyCraft modpack by TCreopargh.
 * You may NOT use this script in any other publicly distributed modpack without my permission. 
 */


#priority 30
#reloadable

import crafttweaker.oredict.IOreDictEntry;
import crafttweaker.item.IItemStack;
import crafttweaker.data.IData;
import crafttweaker.item.IIngredient;
import crafttweaker.liquid.ILiquidStack;

import mods.modularmachinery.RecipeBuilder;
import mods.modularmachinery.RecipeModifierBuilder;
import mods.modularmachinery.MachineModifier;
import mods.ctutils.utils.Math;
import mods.jei.JEI;

import mods.modularmachinery.MMEvents;
import mods.modularmachinery.ControllerGUIRenderEvent;

MMEvents.onControllerGUIRender("wave_forge", function(event as ControllerGUIRenderEvent) {
    var info as string[] = [
        "§a///波动熔合机控制面板///",
        "§a机器名称：§eLV5 - 波动熔合机"
    ];
    event.extraInfo = info;
});

val ITEM as string = "modularmachinery:item";
val TIME as string = "modularmachinery:duration";
val RF as string = "modularmachinery:energy";

MachineModifier.setMaxParallelism("wave_forge", 256);
MachineModifier.setInternalParallelism("wave_forge", 1);
MachineModifier.setMaxThreads("wave_forge", 1);

RecipeBuilder.newBuilder("wavite_forge", "wave_forge", 10800, 1)
    .addItemInputs([
        <ore:ingotFinallium>,
        <ore:ingotFrostburnMetal>,
        <ore:ingotAuric>,
        <ore:ingotEinsteinium>,
        <ore:ingotDuskstone>,
        <ore:ingotEldium>,
        <ore:ingotFlux>,
        <ore:ingotInsectite>,
        <ore:ingotSculkium>,
        <ore:ingotSeasonite>,
        <ore:ingotTridimite>,
        <ore:ingotIchorium>,
        <ore:gemDubhe>,
        <ore:gemAlkaid>,
        <ore:gemAlioth>
    ])
    .addEnergyPerTickInput(1248000)
    .addCatalystInput(
        <additions:magnetite_ingot>, ["§e加工时间减少到90%", "§e能量消耗减少到90%", "§e材料产出增加到105%"], [
            RecipeModifierBuilder.create(TIME, "input", 0.9f, 1, false).build(),
            RecipeModifierBuilder.create(RF, "input", 0.9f, 1, false).build(),
            RecipeModifierBuilder.create(ITEM, "output", 1.05f, 1, false).build(),
        ]
    ).setChance(0.75f)
    .addCatalystInput(
        <additions:lawrencium_ingot>, ["§e加工时间减少到80%", "§e能量消耗减少到85%", "§e材料产出增加到113%"], [
            RecipeModifierBuilder.create(TIME, "input", 0.8f, 1, false).build(),
            RecipeModifierBuilder.create(RF, "input", 0.85f, 1, false).build(),
            RecipeModifierBuilder.create(ITEM, "output", 1.13f, 1, false).build(),
        ]
    ).setChance(0.25f)
    .addCatalystInput(
        <projectex:matter:7>, ["§e加工时间减少到80%", "§e能量消耗减少到80%", "§e材料产出增加到105%"], [
            RecipeModifierBuilder.create(TIME, "input", 0.8f, 1, false).build(),
            RecipeModifierBuilder.create(RF, "input", 0.8f, 1, false).build(),
            RecipeModifierBuilder.create(ITEM, "output", 1.05f, 1, false).build(),
        ]
    ).setChance(0.75f)
    .addCatalystInput(
        <projectex:matter:8>, ["§e加工时间减少到60%", "§e能量消耗减少到60%", "§e材料产出增加到109%"], [
            RecipeModifierBuilder.create(TIME, "input", 0.6f, 1, false).build(),
            RecipeModifierBuilder.create(RF, "input", 0.6f, 1, false).build(),
            RecipeModifierBuilder.create(ITEM, "output", 1.09f, 1, false).build(),
        ]
    ).setChance(0.75f)
    .addCatalystInput(
        <additions:anti_entropy_matter>, ["§e加工时间减少到75%", "§e能量消耗减少到75%", "§e材料产出增加到107%"], [
            RecipeModifierBuilder.create(TIME, "input", 0.75f, 1, false).build(),
            RecipeModifierBuilder.create(RF, "input", 0.75f, 1, false).build(),
            RecipeModifierBuilder.create(ITEM, "output", 1.07f, 1, false).build(),
        ]
    ).setChance(0.5f)
    .addCatalystInput(
        <additions:ancient_collection>, ["§e加工时间减少到80%", "§e能量消耗减少到80%"], [
            RecipeModifierBuilder.create(TIME, "input", 0.8f, 1, false).build(),
            RecipeModifierBuilder.create(RF, "input", 0.8f, 1, false).build(),
        ]
    ).setChance(1.0f)
    .addCatalystInput(
        <additions:sand_of_time>, ["§e加工时间减少到85%"], [
            RecipeModifierBuilder.create(TIME, "input", 0.85f, 1, false).build(),
        ]
    ).setChance(1.0f)
    .addCatalystInput(
        <additions:proliferation_star>, ["§e材料产出增加到130%"], [
            RecipeModifierBuilder.create(ITEM, "output", 1.3f, 1, false).build(),
        ]
    ).setChance(1.0f)
    .addCatalystInput(
        <additions:catalyst_star>, ["§e加工时间减少到85%", "§e能量消耗减少到85%"], [
            RecipeModifierBuilder.create(TIME, "input", 0.85f, 1, false).build(),
            RecipeModifierBuilder.create(RF, "input", 0.85f, 1, false).build(),
        ]
    ).setChance(1.0f)
    .addItemOutput(<gct_mobs:wavite_ingot> * 8)
    .build();