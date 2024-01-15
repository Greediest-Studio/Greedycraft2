/*
 * This script is created for the GreedyCraft modpack by TCreopargh.
 * You may NOT use this script in any other publicly distributed modpack without my permission. 
 */

#reloadable
#priority 30

import crafttweaker.oredict.IOreDictEntry;
import crafttweaker.item.IItemStack;
import crafttweaker.data.IData;
import crafttweaker.item.IIngredient;
import crafttweaker.liquid.ILiquidStack;

import mods.modularmachinery.RecipeBuilder;
import mods.modularmachinery.RecipeModifierBuilder;
import mods.ctutils.utils.Math;
import mods.jei.JEI;

val ITEM as string = "modularmachinery:item";
val TIME as string = "modularmachinery:duration";
val RF as string = "modularmachinery:energy";

RecipeBuilder.newBuilder("finallium_forge", "final_forge", 96000, 1)
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
        <additions:link-disaster_metal_ingot>, ["§e加工时间减少到80%", "§e能量消耗减少到85%", "§e材料产出增加到107%"], [
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
        <naturalpledge:resource:1>, ["§e加工时间减少到90%", "§e能量消耗减少到85%", "§e材料产出增加到103%"], [
            RecipeModifierBuilder.create(TIME, "input", 0.90f, 1, false).build(),
            RecipeModifierBuilder.create(RF, "input", 0.85f, 1, false).build(),
            RecipeModifierBuilder.create(ITEM, "output", 1.03f, 1, false).build(),
        ]
    ).setChance(0.75f)
    .addCatalystInput(
        <additions:greedycraft-flux_ingot>, ["§e能量消耗减少到85%", "§e材料产出增加到103%"], [
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
        <additions:greedycraft-anti_entropy_matter>, ["§e加工时间减少到70%", "§e能量消耗减少到70%", "§e材料产出增加到108%"], [
            RecipeModifierBuilder.create(TIME, "input", 0.7f, 1, false).build(),
            RecipeModifierBuilder.create(RF, "input", 0.7f, 1, false).build(),
            RecipeModifierBuilder.create(ITEM, "output", 1.08f, 1, false).build(),
        ]
    ).setChance(0.5f)
    .addCatalystInput(
        <additions:greedycraft-ancient_tome>, ["§e加工时间减少到90%", "§e能量消耗减少到90%"], [
            RecipeModifierBuilder.create(TIME, "input", 0.9f, 1, false).build(),
            RecipeModifierBuilder.create(RF, "input", 0.9f, 1, false).build(),
        ]
    ).setChance(1.0f)
    .addCatalystInput(
        <additions:greedycraft-sand_of_time>, ["§e加工时间减少到80%"], [
            RecipeModifierBuilder.create(TIME, "input", 0.8f, 1, false).build(),
        ]
    ).setChance(1.0f)
    .addCatalystInput(
        <additions:greedycraft-proliferation_star>, ["§e材料产出增加到130%"], [
            RecipeModifierBuilder.create(ITEM, "output", 1.3f, 1, false).build(),
        ]
    ).setChance(1.0f)
    .addCatalystInput(
        <additions:greedycraft-catalyst_star>, ["§e加工时间减少到80%", "§e能量消耗减少到80%"], [
            RecipeModifierBuilder.create(TIME, "input", 0.8f, 1, false).build(),
            RecipeModifierBuilder.create(RF, "input", 0.8f, 1, false).build(),
        ]
    ).setChance(1.0f)
    .addItemOutput(<gct_ores:finallium_ingot> * 8)
    .build();