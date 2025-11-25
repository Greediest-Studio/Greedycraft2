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

MMEvents.onControllerGUIRender("final_forge", function(event as ControllerGUIRenderEvent) {
    var info as string[] = [
        "§a///终焉熔合机控制面板///",
        "§a机器名称：§eLV4 - 终焉熔合机"
    ];
    event.extraInfo = info;
});

val ITEM as string = "modularmachinery:item";
val TIME as string = "modularmachinery:duration";
val RF as string = "modularmachinery:energy";

MachineModifier.setMaxParallelism("final_forge", 256);
MachineModifier.setInternalParallelism("final_forge", 1);
MachineModifier.setMaxThreads("final_forge", 1);

RecipeBuilder.newBuilder("finallium_forge", "final_forge", 9600, 1)
    .addItemInputs([
        <ore:ingotCosmilite>,
        <ore:ingotOrderedMetal>,
        <ore:ingotCreativeAlloy>,
        <ore:ingotBalancedMatrix>,
        <ore:ingotBetwnite>,
        <ore:ingotScientificite>,
        <ore:ingotLegendite>,
        <ore:ingotThermallite>,
        <ore:ingotTwilit>,
        <ore:ingotMurderite>,
        <ore:ingotCursium>,
        <ore:ingotZodiacite>,
        <ore:ingotAbyssine>,
        <ore:ingotBotanicalAwakened>
    ])
    .addEnergyPerTickInput(312500)
    .addCatalystInput(
        <additions:disaster_metal_ingot>, ["§e加工时间减少到80%", "§e能量消耗减少到85%", "§e材料产出增加到107%"], [
            RecipeModifierBuilder.create(TIME, "input", 0.8f, 1, false).build(),
            RecipeModifierBuilder.create(RF, "input", 0.85f, 1, false).build(),
            RecipeModifierBuilder.create(ITEM, "output", 1.07f, 1, false).build(),
        ]
    ).setChance(0.5f)
    .addCatalystInput(
        <thaumadditions:mithminite_ingot>, ["§e加工时间减少到50%", "§e能量消耗减少到95%", "§e材料产出增加到105%"], [
            RecipeModifierBuilder.create(TIME, "input", 0.50f, 1, false).build(),
            RecipeModifierBuilder.create(RF, "input", 0.95f, 1, false).build(),
            RecipeModifierBuilder.create(ITEM, "output", 1.05f, 1, false).build(),
        ]
    ).setChance(0.5f)
    .addCatalystInput(
        <additions:flux_ingot>, ["§e能量消耗减少到85%", "§e材料产出增加到103%"], [
            RecipeModifierBuilder.create(RF, "input", 0.85f, 1, false).build(),
            RecipeModifierBuilder.create(ITEM, "output", 1.03f, 1, false).build(),
        ]
    ).setChance(0.75f)
    .addCatalystInput(
        <moretcon:ingotirradium>, ["§e加工时间减少到80%", "§e能量消耗减少到75%", "§e材料产出增加到106%"], [
            RecipeModifierBuilder.create(TIME, "input", 0.8f, 1, false).build(),
            RecipeModifierBuilder.create(RF, "input", 0.75f, 1, false).build(),
            RecipeModifierBuilder.create(ITEM, "output", 1.06f, 1, false).build(),
        ]
    ).setChance(0.5f)
    .addCatalystInput(
        <additions:pruified>, ["§e加工时间减少到65%", "§e能量消耗减少到85%", "§e材料产出增加到110%"], [
            RecipeModifierBuilder.create(TIME, "input", 0.65f, 1, false).build(),
            RecipeModifierBuilder.create(RF, "input", 0.85f, 1, false).build(),
            RecipeModifierBuilder.create(ITEM, "output", 1.10f, 1, false).build(),
        ]
    ).setChance(0.75f)
    .addCatalystInput(
        <projectex:matter:4>, ["§e加工时间减少到80%", "§e能量消耗减少到80%", "§e材料产出增加到103%"], [
            RecipeModifierBuilder.create(TIME, "input", 0.8f, 1, false).build(),
            RecipeModifierBuilder.create(RF, "input", 0.8f, 1, false).build(),
            RecipeModifierBuilder.create(ITEM, "output", 1.03f, 1, false).build(),
        ]
    ).setChance(0.75f)
    .addCatalystInput(
        <projectex:matter:5>, ["§e加工时间减少到50%", "§e能量消耗减少到50%", "§e材料产出增加到106%"], [
            RecipeModifierBuilder.create(TIME, "input", 0.5f, 1, false).build(),
            RecipeModifierBuilder.create(RF, "input", 0.5f, 1, false).build(),
            RecipeModifierBuilder.create(ITEM, "output", 1.06f, 1, false).build(),
        ]
    ).setChance(0.75f)
    .addCatalystInput(
        <projectex:matter:6>, ["§e加工时间减少到70%", "§e能量消耗减少到70%", "§e材料产出增加到108%"], [
            RecipeModifierBuilder.create(TIME, "input", 0.7f, 1, false).build(),
            RecipeModifierBuilder.create(RF, "input", 0.7f, 1, false).build(),
            RecipeModifierBuilder.create(ITEM, "output", 1.08f, 1, false).build(),
        ]
    ).setChance(0.75f)
    .addCatalystInput(
        <additions:anti_entropy_matter>, ["§e加工时间减少到70%", "§e能量消耗减少到70%", "§e材料产出增加到108%"], [
            RecipeModifierBuilder.create(TIME, "input", 0.7f, 1, false).build(),
            RecipeModifierBuilder.create(RF, "input", 0.7f, 1, false).build(),
            RecipeModifierBuilder.create(ITEM, "output", 1.08f, 1, false).build(),
        ]
    ).setChance(0.5f)
    .addCatalystInput(
        <additions:ancient_tome>, ["§e加工时间减少到90%", "§e能量消耗减少到90%"], [
            RecipeModifierBuilder.create(TIME, "input", 0.9f, 1, false).build(),
            RecipeModifierBuilder.create(RF, "input", 0.9f, 1, false).build(),
        ]
    ).setChance(1.0f)
    .addCatalystInput(
        <additions:sand_of_time>, ["§e加工时间减少到80%"], [
            RecipeModifierBuilder.create(TIME, "input", 0.8f, 1, false).build(),
        ]
    ).setChance(1.0f)
    .addCatalystInput(
        <additions:proliferation_star>, ["§e材料产出增加到130%"], [
            RecipeModifierBuilder.create(ITEM, "output", 1.3f, 1, false).build(),
        ]
    ).setChance(1.0f)
    .addCatalystInput(
        <additions:catalyst_star>, ["§e加工时间减少到80%", "§e能量消耗减少到80%"], [
            RecipeModifierBuilder.create(TIME, "input", 0.8f, 1, false).build(),
            RecipeModifierBuilder.create(RF, "input", 0.8f, 1, false).build(),
        ]
    ).setChance(1.0f)
    .addItemOutput(<gct_ores:finallium_ingot> * 8)
    .build();