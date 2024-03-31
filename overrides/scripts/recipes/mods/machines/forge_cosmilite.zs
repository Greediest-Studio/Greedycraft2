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

RecipeBuilder.newBuilder("cosmilite_forge", "cosmic_forge", 72000, 1)
    .addItemInputs([
        <ore:ingotChromasteel>,
        <ore:ingotCompressite>,
        <ore:ingotChaoticMetal>,
        <ore:ingotStormyMetal>,
        <ore:ingotSky>,
        <ore:ingotEverite>,
        <ore:ingotPorpezite>,
        <ore:ingotDullium>,
        <ore:ingotCthulhurite>,
        <ore:ingotCrimsonite>,
        <ore:ingotAstralMetal>,
        <ore:gemHermaphroditic>
    ])
    .addEnergyPerTickInput(13600)
    .addCatalystInput(
        <thaumadditions:adaminite_ingot>, ["§e加工时间减少到80%", "§e能量消耗减少到75%", "§e材料产出增加到106%"], [
            RecipeModifierBuilder.create(TIME, "input", 0.8f, 1, false).build(),
            RecipeModifierBuilder.create(RF, "input", 0.75f, 1, false).build(),
            RecipeModifierBuilder.create(ITEM, "output", 1.06f, 1, false).build(),
        ]
    ).setChance(0.5f)
    .addCatalystInput(
        <additions:eioaddon-blackhole_alloy_ingot>, ["§e加工时间减少到80%", "§e能量消耗减少到80%", "§e材料产出增加到105%"], [
            RecipeModifierBuilder.create(TIME, "input", 0.8f, 1, false).build(),
            RecipeModifierBuilder.create(RF, "input", 0.8f, 1, false).build(),
            RecipeModifierBuilder.create(ITEM, "output", 1.05f, 1, false).build(),
        ]
    ).setChance(0.5f)
    .addCatalystInput(
        <additions:greedycraft-flux_ingot>, ["§e加工时间减少到30%", "§e能量消耗减少到75%", "§e材料产出增加到102%"], [
            RecipeModifierBuilder.create(TIME, "input", 0.3f, 1, false).build(),
            RecipeModifierBuilder.create(RF, "input", 0.75f, 1, false).build(),
            RecipeModifierBuilder.create(ITEM, "output", 1.02f, 1, false).build(),
        ]
    ).setChance(0.75f)
    .addCatalystInput(
        <additions:greedycraft-pe_ingot>, ["§e加工时间减少到80%", "§e材料产出增加到103%"], [
            RecipeModifierBuilder.create(TIME, "input", 0.8f, 1, false).build(),
            RecipeModifierBuilder.create(ITEM, "output", 1.03f, 1, false).build(),
        ]
    ).setChance(0.75f)
    .addCatalystInput(
        <thaumadditions:mithminite_ingot>, ["§e加工时间减少到40%", "§e能量消耗减少到95%", "§e材料产出增加到108%"], [
            RecipeModifierBuilder.create(TIME, "input", 0.4f, 1, false).build(),
            RecipeModifierBuilder.create(RF, "input", 0.95f, 1, false).build(),
            RecipeModifierBuilder.create(ITEM, "output", 1.08f, 1, false).build(),
        ]
    ).setChance(0.25f)
    .addCatalystInput(
        <additions:greedycraft-enderite_ingot>, ["§e加工时间减少到90%", "§e能量消耗减少到80%", "§e材料产出增加到106%"], [
            RecipeModifierBuilder.create(TIME, "input", 0.9f, 1, false).build(),
            RecipeModifierBuilder.create(RF, "input", 0.8f, 1, false).build(),
            RecipeModifierBuilder.create(ITEM, "output", 1.06f, 1, false).build(),
        ]
    ).setChance(0.5f)
    .addCatalystInput(
        <additions:greedycraft-chaotic_crystal_gem>, ["§e加工时间减少到75%", "§e能量消耗减少到75%", "§e材料产出增加到106%"], [
            RecipeModifierBuilder.create(TIME, "input", 0.75f, 1, false).build(),
            RecipeModifierBuilder.create(RF, "input", 0.75f, 1, false).build(),
            RecipeModifierBuilder.create(ITEM, "output", 1.06f, 1, false).build(),
        ]
    ).setChance(0.25f)
    .addCatalystInput(
        <projectex:matter:2>, ["§e加工时间减少到70%", "§e能量消耗减少到70%", "§e材料产出增加到103%"], [
            RecipeModifierBuilder.create(TIME, "input", 0.7f, 1, false).build(),
            RecipeModifierBuilder.create(RF, "input", 0.7f, 1, false).build(),
            RecipeModifierBuilder.create(ITEM, "output", 1.03f, 1, false).build(),
        ]
    ).setChance(0.75f)
    .addCatalystInput(
        <additions:greedycraft-anti_entropy_matter>, ["§e加工时间减少到90%", "§e能量消耗减少到90%", "§e材料产出增加到108%"], [
            RecipeModifierBuilder.create(TIME, "input", 0.9f, 1, false).build(),
            RecipeModifierBuilder.create(RF, "input", 0.9f, 1, false).build(),
            RecipeModifierBuilder.create(ITEM, "output", 1.08f, 1, false).build(),
        ]
    ).setChance(0.5f)
    .addCatalystInput(
        <additions:greedycraft-aurora_heart>, ["§e加工时间减少到40%", "§e能量消耗减少到40%", "§e材料产出增加到108%"], [
            RecipeModifierBuilder.create(TIME, "input", 0.4f, 1, false).build(),
            RecipeModifierBuilder.create(RF, "input", 0.4f, 1, false).build(),
            RecipeModifierBuilder.create(ITEM, "output", 1.08f, 1, false).build(),
        ]
    ).setChance(0.75f)
    .addCatalystInput(
        <additions:greedycraft-sand_of_time>, ["§e加工时间减少到75%"], [
            RecipeModifierBuilder.create(TIME, "input", 0.75f, 1, false).build(),
        ]
    ).setChance(1.0f)
    .addCatalystInput(
        <additions:greedycraft-proliferation_star>, ["§e材料产出增加到130%"], [
            RecipeModifierBuilder.create(ITEM, "output", 1.3f, 1, false).build(),
        ]
    ).setChance(1.0f)
    .addCatalystInput(
        <additions:greedycraft-catalyst_star>, ["§e加工时间减少到75%", "§e能量消耗减少到75%"], [
            RecipeModifierBuilder.create(TIME, "input", 0.75f, 1, false).build(),
            RecipeModifierBuilder.create(RF, "input", 0.75f, 1, false).build(),
        ]
    ).setChance(1.0f)
    .addItemOutput(<additions:cosmilite_ingot> * 8)
    .build();