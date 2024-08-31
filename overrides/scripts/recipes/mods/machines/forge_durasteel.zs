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

RecipeBuilder.newBuilder("durasteel_forge", "durasteel_forge", 18000, 1)
    .addItemInputs([
        <ore:ingotStainlessSteel>,
        <ore:ingotBalancite>,
        <ore:ingotIciricium>,
        <ore:ingotLiquifiedCoralium>,
        <ore:ingotAurorianSteel>,
        <ore:ingotManyullyn>,
        <divinerpg:shadow_bar>,
        <ore:gemTwilightRefined>
    ])
    .addEnergyPerTickInput(256)
    .addCatalystInput(
        <additions:netherite_ingot>, ["§e加工时间减少到50%", "§e能量消耗减少到50%", "§e材料产出增加到108%"], [
            RecipeModifierBuilder.create(TIME, "input", 0.5f, 1, false).build(),
            RecipeModifierBuilder.create(RF, "input", 0.5f, 1, false).build(),
            RecipeModifierBuilder.create(ITEM, "output", 1.08f, 1, false).build(),
        ]
    ).setChance(0.5f)
    .addCatalystInput(
        <botanicadds:gaiasteel_ingot>, ["§e加工时间减少到65%", "§e能量消耗减少到65%", "§e材料产出增加到107%"], [
            RecipeModifierBuilder.create(TIME, "input", 0.65f, 1, false).build(),
            RecipeModifierBuilder.create(RF, "input", 0.65f, 1, false).build(),
            RecipeModifierBuilder.create(ITEM, "output", 1.07f, 1, false).build(),
        ]
    ).setChance(0.25f)
    .addCatalystInput(
        <botania:manaresource:14>, ["§e加工时间减少到75%", "§e能量消耗减少到75%", "§e材料产出增加到105%"], [
            RecipeModifierBuilder.create(TIME, "input", 0.75f, 1, false).build(),
            RecipeModifierBuilder.create(RF, "input", 0.75f, 1, false).build(),
            RecipeModifierBuilder.create(ITEM, "output", 1.05f, 1, false).build(),
        ]
    ).setChance(0.5f)
    .addCatalystInput(
        <divinerpg:netherite_ingot>, ["§e加工时间减少到75%", "§e能量消耗减少到75%", "§e材料产出增加到103%"], [
            RecipeModifierBuilder.create(TIME, "input", 0.75f, 1, false).build(),
            RecipeModifierBuilder.create(RF, "input", 0.75f, 1, false).build(),
            RecipeModifierBuilder.create(ITEM, "output", 1.03f, 1, false).build(),
        ]
    ).setChance(0.75f)
    .addCatalystInput(
        <tconevo:metal:30>, ["§e加工时间减少到80%", "§e能量消耗减少到80%", "§e材料产出增加到106%"], [
            RecipeModifierBuilder.create(TIME, "input", 0.8f, 1, false).build(),
            RecipeModifierBuilder.create(RF, "input", 0.8f, 1, false).build(),
            RecipeModifierBuilder.create(ITEM, "output", 1.06f, 1, false).build(),
        ]
    ).setChance(0.5f)
    .addCatalystInput(
        <additions:greedycraft-apollonium_ingot>, ["§e加工时间减少到75%", "§e能量消耗减少到90%", "§e材料产出增加到103%"], [
            RecipeModifierBuilder.create(TIME, "input", 0.75f, 1, false).build(),
            RecipeModifierBuilder.create(RF, "input", 0.9f, 1, false).build(),
            RecipeModifierBuilder.create(ITEM, "output", 1.03f, 1, false).build(),
        ]
    ).setChance(0.5f)
    .addCatalystInput(
        <additions:greedycraft-darkice_ingot>, ["§e加工时间减少到60%", "§e材料产出增加到104%"], [
            RecipeModifierBuilder.create(TIME, "input", 0.6f, 1, false).build(),
            RecipeModifierBuilder.create(ITEM, "output", 1.04f, 1, false).build(),
        ]
    ).setChance(0.75f)
    .addCatalystInput(
        <additions:greedycraft-ascensionite_ingot>, ["§e加工时间减少到70%", "§e材料产出增加到107%"], [
            RecipeModifierBuilder.create(TIME, "input", 0.7f, 1, false).build(),
            RecipeModifierBuilder.create(ITEM, "output", 1.07f, 1, false).build(),
        ]
    ).setChance(0.75f)
    .addCatalystInput(
        <additions:link-endusium_ingot>, ["§e加工时间减少到85%", "§e能量消耗减少到85%", "§e材料产出增加到107%"], [
            RecipeModifierBuilder.create(TIME, "input", 0.85f, 1, false).build(),
            RecipeModifierBuilder.create(RF, "input", 0.85f, 1, false).build(),
            RecipeModifierBuilder.create(ITEM, "output", 1.07f, 1, false).build(),
        ]
    ).setChance(0.75f)
    .addCatalystInput(
        <defiledlands:remorseful_gem>, ["§e加工时间减少到95%", "§e能量消耗减少到75%", "§e材料产出增加到105%"], [
            RecipeModifierBuilder.create(TIME, "input", 0.95f, 1, false).build(),
            RecipeModifierBuilder.create(RF, "input", 0.75f, 1, false).build(),
            RecipeModifierBuilder.create(ITEM, "output", 1.05f, 1, false).build(),
        ]
    ).setChance(0.25f)
    .addCatalystInput(
        <additions:botaniaddon-mana_firestone>, ["§e加工时间减少到90%", "§e能量消耗减少到90%", "§e材料产出增加到105%"], [
            RecipeModifierBuilder.create(TIME, "input", 0.9f, 1, false).build(),
            RecipeModifierBuilder.create(RF, "input", 0.9f, 1, false).build(),
            RecipeModifierBuilder.create(ITEM, "output", 1.05f, 1, false).build(),
        ]
    ).setChance(0.75f)
    .addCatalystInput(
        <additions:greedycraft-slider_gem>, ["§e加工时间减少到90%", "§e能量消耗减少到80%", "§e材料产出增加到105%"], [
            RecipeModifierBuilder.create(TIME, "input", 0.9f, 1, false).build(),
            RecipeModifierBuilder.create(RF, "input", 0.8f, 1, false).build(),
            RecipeModifierBuilder.create(ITEM, "output", 1.05f, 1, false).build(),
        ]
    ).setChance(0.75f)
    .addCatalystInput(
        <additions:greedycraft-iridium_tofu>, ["§e加工时间减少到85%", "§e能量消耗减少到80%", "§e材料产出增加到108%"], [
            RecipeModifierBuilder.create(TIME, "input", 0.85f, 1, false).build(),
            RecipeModifierBuilder.create(RF, "input", 0.8f, 1, false).build(),
            RecipeModifierBuilder.create(ITEM, "output", 1.08f, 1, false).build(),
        ]
    ).setChance(0.25f)
    .addCatalystInput(
        <additions:greedycraft-time_shard>, ["§e加工时间减少到75%"], [
            RecipeModifierBuilder.create(TIME, "input", 0.75f, 1, false).build(),
        ]
    ).setChance(1.0f)
    .addCatalystInput(
        <additions:greedycraft-proliferation_star>, ["§e材料产出增加到130%"], [
            RecipeModifierBuilder.create(ITEM, "output", 1.3f, 1, false).build(),
        ]
    ).setChance(1.0f)
    .addCatalystInput(
        <additions:greedycraft-catalyst_star>, ["§e加工时间减少到15%", "§e能量消耗减少到15%"], [
            RecipeModifierBuilder.create(TIME, "input", 0.15f, 1, false).build(),
            RecipeModifierBuilder.create(RF, "input", 0.15f, 1, false).build(),
        ]
    ).setChance(1.0f)
    .addItemOutput(<additions:durasteel_ingot> * 8)
    .build();