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

RecipeBuilder.newBuilder("chromasteel_forge", "chromasteel_forge", 42000, 1)
    .addItemInputs([
        <ore:ingotAeonsteel>,
        <ore:ingotNiobium>,
        <ore:ingotWyvernMetal>,
        <ore:ingotFallenMetal>,
        <ore:ingotPrimordial>,
        <ore:ingotOsgloglas>,
        <ore:ingotEucite>,
        <ore:ingotCorbite>,
        <ore:ingotMythsteel>,
        <ore:gemTerrestrial>
    ])
    .addEnergyPerTickInput(6400)
    .addCatalystInput(
        <additions:astral_metal_ingot>, ["§e加工时间减少到85%", "§e能量消耗减少到80%", "§e材料产出增加到104%"], [
            RecipeModifierBuilder.create(TIME, "input", 0.85f, 1, false).build(),
            RecipeModifierBuilder.create(RF, "input", 0.8f, 1, false).build(),
            RecipeModifierBuilder.create(ITEM, "output", 1.04f, 1, false).build(),
        ]
    ).setChance(0.5f)
    .addCatalystInput(
        <additions:greedycraft-daynight_ingot>, ["§e加工时间减少到75%", "§e能量消耗减少到90%", "§e材料产出增加到102%"], [
            RecipeModifierBuilder.create(TIME, "input", 0.75f, 1, false).build(),
            RecipeModifierBuilder.create(RF, "input", 0.9f, 1, false).build(),
            RecipeModifierBuilder.create(ITEM, "output", 1.02f, 1, false).build(),
        ]
    ).setChance(0.75f)
    .addCatalystInput(
        <tconevo:metal:25>, ["§e加工时间减少到90%", "§e能量消耗减少到80%", "§e材料产出增加到106%"], [
            RecipeModifierBuilder.create(TIME, "input", 0.9f, 1, false).build(),
            RecipeModifierBuilder.create(RF, "input", 0.8f, 1, false).build(),
            RecipeModifierBuilder.create(ITEM, "output", 1.06f, 1, false).build(),
        ]
    ).setChance(0.25f)
    .addCatalystInput(
        <additions:protonium_ingot>, ["§e加工时间减少到80%", "§e能量消耗减少到80%", "§e材料产出增加到108%"], [
            RecipeModifierBuilder.create(TIME, "input", 0.8f, 1, false).build(),
            RecipeModifierBuilder.create(RF, "input", 0.8f, 1, false).build(),
            RecipeModifierBuilder.create(ITEM, "output", 1.08f, 1, false).build(),
        ]
    ).setChance(0.5f)
    .addCatalystInput(
        <additions:electronium_ingot>, ["§e加工时间减少到80%", "§e能量消耗减少到80%", "§e材料产出增加到105%"], [
            RecipeModifierBuilder.create(TIME, "input", 0.8f, 1, false).build(),
            RecipeModifierBuilder.create(RF, "input", 0.8f, 1, false).build(),
            RecipeModifierBuilder.create(ITEM, "output", 1.05f, 1, false).build(),
        ]
    ).setChance(0.5f)
    .addCatalystInput(
        <avaritia:resource:4>, ["§e加工时间减少到85%", "§e能量消耗减少到70%", "§e材料产出增加到104%"], [
            RecipeModifierBuilder.create(TIME, "input", 0.85f, 1, false).build(),
            RecipeModifierBuilder.create(RF, "input", 0.7f, 1, false).build(),
            RecipeModifierBuilder.create(ITEM, "output", 1.04f, 1, false).build(),
        ]
    ).setChance(0.5f)
    .addCatalystInput(
        <extrabotany:material:1>, ["§e加工时间减少到75%", "§e能量消耗减少到75%", "§e材料产出增加到107%"], [
            RecipeModifierBuilder.create(TIME, "input", 0.75f, 1, false).build(),
            RecipeModifierBuilder.create(RF, "input", 0.75f, 1, false).build(),
            RecipeModifierBuilder.create(ITEM, "output", 1.07f, 1, false).build(),
        ]
    ).setChance(0.25f)
    .addCatalystInput(
        <mysticalagradditions:insanium:2>, ["§e加工时间减少到90%", "§e能量消耗减少到90%", "§e材料产出增加到106%"], [
            RecipeModifierBuilder.create(TIME, "input", 0.9f, 1, false).build(),
            RecipeModifierBuilder.create(RF, "input", 0.9f, 1, false).build(),
            RecipeModifierBuilder.create(ITEM, "output", 1.06f, 1, false).build(),
        ]
    ).setChance(0.5f)
    .addCatalystInput(
        <thaumadditions:mithrillium_ingot>, ["§e加工时间减少到80%", "§e能量消耗减少到80%", "§e材料产出增加到108%"], [
            RecipeModifierBuilder.create(TIME, "input", 0.8f, 1, false).build(),
            RecipeModifierBuilder.create(RF, "input", 0.8f, 1, false).build(),
            RecipeModifierBuilder.create(ITEM, "output", 1.08f, 1, false).build(),
        ]
    ).setChance(0.25f)
    .addCatalystInput(
        <additions:greedycraft-aurune_ingot>, ["§e加工时间减少到85%", "§e能量消耗减少到85%", "§e材料产出增加到107%"], [
            RecipeModifierBuilder.create(TIME, "input", 0.85f, 1, false).build(),
            RecipeModifierBuilder.create(RF, "input", 0.85f, 1, false).build(),
            RecipeModifierBuilder.create(ITEM, "output", 1.07f, 1, false).build(),
        ]
    ).setChance(0.5f)
    .addCatalystInput(
        <gct_mobs:sanite_ingot>, ["§e加工时间减少到75%", "§e能量消耗减少到90%", "§e材料产出增加到103%"], [
            RecipeModifierBuilder.create(TIME, "input", 0.75f, 1, false).build(),
            RecipeModifierBuilder.create(RF, "input", 0.9f, 1, false).build(),
            RecipeModifierBuilder.create(ITEM, "output", 1.03f, 1, false).build(),
        ]
    ).setChance(0.75f)
    .addCatalystInput(
        <additions:greedycraft-mana_ingot>, ["§e加工时间减少到85%", "§e能量消耗减少到70%", "§e材料产出增加到102%"], [
            RecipeModifierBuilder.create(TIME, "input", 0.85f, 1, false).build(),
            RecipeModifierBuilder.create(RF, "input", 0.7f, 1, false).build(),
            RecipeModifierBuilder.create(ITEM, "output", 1.02f, 1, false).build(),
        ]
    ).setChance(0.75f)
    .addCatalystInput(
        <additions:greedycraft-enderite_ingot>, ["§e加工时间减少到90%", "§e能量消耗减少到80%", "§e材料产出增加到105%"], [
            RecipeModifierBuilder.create(TIME, "input", 0.9f, 1, false).build(),
            RecipeModifierBuilder.create(RF, "input", 0.8f, 1, false).build(),
            RecipeModifierBuilder.create(ITEM, "output", 1.05f, 1, false).build(),
        ]
    ).setChance(0.25f)
    .addCatalystInput(
        <additions:greedycraft-endest_steel_ingot>, ["§e加工时间减少到80%", "§e能量消耗减少到80%", "§e材料产出增加到106%"], [
            RecipeModifierBuilder.create(TIME, "input", 0.8f, 1, false).build(),
            RecipeModifierBuilder.create(RF, "input", 0.8f, 1, false).build(),
            RecipeModifierBuilder.create(ITEM, "output", 1.06f, 1, false).build(),
        ]
    ).setChance(0.5f)
    .addCatalystInput(
        <additions:greedycraft-chaotic_crystal_gem>, ["§e加工时间减少到90%", "§e能量消耗减少到75%", "§e材料产出增加到106%"], [
            RecipeModifierBuilder.create(TIME, "input", 0.9f, 1, false).build(),
            RecipeModifierBuilder.create(RF, "input", 0.75f, 1, false).build(),
            RecipeModifierBuilder.create(ITEM, "output", 1.06f, 1, false).build(),
        ]
    ).setChance(0.25f)
    .addCatalystInput(
        <additions:greedycraft-aurora_heart>, ["§e加工时间减少到60%", "§e能量消耗减少到60%", "§e材料产出增加到108%"], [
            RecipeModifierBuilder.create(TIME, "input", 0.6f, 1, false).build(),
            RecipeModifierBuilder.create(RF, "input", 0.6f, 1, false).build(),
            RecipeModifierBuilder.create(ITEM, "output", 1.08f, 1, false).build(),
        ]
    ).setChance(0.75f)
    .addCatalystInput(
        <additions:greedycraft-sand_of_time>, ["§e加工时间减少到60%"], [
            RecipeModifierBuilder.create(TIME, "input", 0.6f, 1, false).build(),
        ]
    ).setChance(1.0f)
    .addCatalystInput(
        <additions:greedycraft-proliferation_star>, ["§e材料产出增加到130%"], [
            RecipeModifierBuilder.create(ITEM, "output", 1.3f, 1, false).build(),
        ]
    ).setChance(1.0f)
    .addCatalystInput(
        <additions:greedycraft-catalyst_star>, ["§e加工时间减少到50%", "§e能量消耗减少到50%"], [
            RecipeModifierBuilder.create(TIME, "input", 0.5f, 1, false).build(),
            RecipeModifierBuilder.create(RF, "input", 0.5f, 1, false).build(),
        ]
    ).setChance(1.0f)
    .addItemOutput(<additions:chromasteel_ingot> * 8)
    .build();