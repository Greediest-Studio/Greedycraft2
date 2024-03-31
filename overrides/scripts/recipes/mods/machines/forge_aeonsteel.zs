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

RecipeBuilder.newBuilder("aeonsteel_forge", "aeonsteel_forge", 30000, 1)
    .addItemInputs([
        <ore:ingotDurasteel>,
        <ore:ingotHellite>,
        <ore:ingotWitherium>,
        <ore:ingotDraconium>,
        <ore:ingotGenite>,
        <ore:ingotFusionMatrix>,
        <ore:ingotStellarAlloy>,
        <ore:ingotDreadium>,
        <divinerpg:arcanium>
    ])
    .addEnergyPerTickInput(2048)
    .addCatalystInput(
        <additions:astral_metal_ingot>, ["§e加工时间减少到80%", "§e能量消耗减少到80%", "§e材料产出增加到105%"], [
            RecipeModifierBuilder.create(TIME, "input", 0.80f, 1, false).build(),
            RecipeModifierBuilder.create(RF, "input", 0.80f, 1, false).build(),
            RecipeModifierBuilder.create(ITEM, "output", 1.06f, 1, false).build()
        ]
    ).setChance(0.5f)
    .addCatalystInput(
        <additions:greedycraft-twilight_crystal_ingot>, ["§e加工时间减少到60%", "§e能量消耗减少到80%", "§e材料产出增加到107%"], [
            RecipeModifierBuilder.create(TIME, "input", 0.60f, 1, false).build(),
            RecipeModifierBuilder.create(RF, "input", 0.80f, 1, false).build(),
            RecipeModifierBuilder.create(ITEM, "output", 1.07f, 1, false).build()
        ]
    ).setChance(0.5f)
    .addCatalystInput(
        <draconicevolution:draconic_ingot>, ["§e加工时间减少到85%", "§e能量消耗减少到70%", "§e材料产出增加到104%"], [
            RecipeModifierBuilder.create(TIME, "input", 0.85f, 1, false).build(),
            RecipeModifierBuilder.create(RF, "input", 0.70f, 1, false).build(),
            RecipeModifierBuilder.create(ITEM, "output", 1.04f, 1, false).build()
        ]
    ).setChance(0.75f)
    .addCatalystInput(
        <gct_ores:relifed_witherium_ingot>, ["§e加工时间减少到85%", "§e能量消耗减少到70%", "§e材料产出增加到104%"], [
            RecipeModifierBuilder.create(TIME, "input", 0.85f, 1, false).build(),
            RecipeModifierBuilder.create(RF, "input", 0.70f, 1, false).build(),
            RecipeModifierBuilder.create(ITEM, "output", 1.04f, 1, false).build()
        ]
    ).setChance(0.75f)
    .addCatalystInput(
        <extrabotany:material:1>, ["§e加工时间减少到65%", "§e能量消耗减少到65%", "§e材料产出增加到108%"], [
            RecipeModifierBuilder.create(TIME, "input", 0.65f, 1, false).build(),
            RecipeModifierBuilder.create(RF, "input", 0.65f, 1, false).build(),
            RecipeModifierBuilder.create(ITEM, "output", 1.08f, 1, false).build()
        ]
    ).setChance(0.25f)
    .addCatalystInput(
        <mysticalagradditions:insanium:2>, ["§e加工时间减少到75%", "§e能量消耗减少到95%", "§e材料产出增加到107%"], [
            RecipeModifierBuilder.create(TIME, "input", 0.75f, 1, false).build(),
            RecipeModifierBuilder.create(RF, "input", 0.95f, 1, false).build(),
            RecipeModifierBuilder.create(ITEM, "output", 1.07f, 1, false).build()
        ]
    ).setChance(0.5f)
    .addCatalystInput(
        <thaumcraft:ingot:1>, ["§e加工时间减少到80%", "§e能量消耗减少到80%", "§e材料产出增加到103%"], [
            RecipeModifierBuilder.create(TIME, "input", 0.80f, 1, false).build(),
            RecipeModifierBuilder.create(RF, "input", 0.80f, 1, false).build(),
            RecipeModifierBuilder.create(ITEM, "output", 1.03f, 1, false).build()
        ]
    ).setChance(0.5f)
    .addCatalystInput(
        <abyssalcraft:ethaxiumingot>, ["§e加工时间减少到80%", "§e能量消耗减少到80%", "§e材料产出增加到105%"], [
            RecipeModifierBuilder.create(TIME, "input", 0.80f, 1, false).build(),
            RecipeModifierBuilder.create(RF, "input", 0.80f, 1, false).build(),
            RecipeModifierBuilder.create(ITEM, "output", 1.05f, 1, false).build()
        ]
    ).setChance(0.25f)
    .addCatalystInput(
        <botanicadds:gaiasteel_ingot>, ["§e加工时间减少到70%", "§e能量消耗减少到70%", "§e材料产出增加到106%"], [
            RecipeModifierBuilder.create(TIME, "input", 0.70f, 1, false).build(),
            RecipeModifierBuilder.create(RF, "input", 0.70f, 1, false).build(),
            RecipeModifierBuilder.create(ITEM, "output", 1.06f, 1, false).build()
        ]
    ).setChance(0.25f)
    .addCatalystInput(
        <gct_mobs:earth_ingot>, ["§e加工时间减少到90%", "§e能量消耗减少到85%", "§e材料产出增加到104%"], [
            RecipeModifierBuilder.create(TIME, "input", 0.90f, 1, false).build(),
            RecipeModifierBuilder.create(RF, "input", 0.85f, 1, false).build(),
            RecipeModifierBuilder.create(ITEM, "output", 1.04f, 1, false).build()
        ]
    ).setChance(0.5f)
    .addCatalystInput(
        <additions:greedycraft-undead_ingot>, ["§e加工时间减少到75%", "§e材料产出增加到108%"], [
            RecipeModifierBuilder.create(TIME, "input", 0.75f, 1, false).build(),
            RecipeModifierBuilder.create(ITEM, "output", 1.08f, 1, false).build()
        ]
    ).setChance(0.25f)
    .addCatalystInput(
        <additions:greedycraft-darkice_ingot>, ["§e加工时间减少到50%", "§e能量消耗减少到50%", "§e材料产出增加到104%"], [
            RecipeModifierBuilder.create(TIME, "input", 0.50f, 1, false).build(),
            RecipeModifierBuilder.create(RF, "input", 0.50f, 1, false).build(),
            RecipeModifierBuilder.create(ITEM, "output", 1.04f, 1, false).build()
        ]
    ).setChance(0.75f)
    .addCatalystInput(
        <additions:link-endusium_ingot>, ["§e加工时间减少到70%", "§e能量消耗减少到70%", "§e材料产出增加到106%"], [
            RecipeModifierBuilder.create(TIME, "input", 0.70f, 1, false).build(),
            RecipeModifierBuilder.create(RF, "input", 0.70f, 1, false).build(),
            RecipeModifierBuilder.create(ITEM, "output", 1.06f, 1, false).build()
        ]
    ).setChance(0.75f)
    .addCatalystInput(
        <additions:greedycraft-uracilite_ingot>, ["§e加工时间减少到80%", "§e能量消耗减少到40%", "§e材料产出增加到105%"], [
            RecipeModifierBuilder.create(TIME, "input", 0.80f, 1, false).build(),
            RecipeModifierBuilder.create(RF, "input", 0.40f, 1, false).build(),
            RecipeModifierBuilder.create(ITEM, "output", 1.05f, 1, false).build()
        ]
    ).setChance(0.5f)
    .addCatalystInput(
        <additions:greedycraft-ascensionite_ingot>, ["§e加工时间减少到75%", "§e材料产出增加到106%"], [
            RecipeModifierBuilder.create(TIME, "input", 0.75f, 1, false).build(),
            RecipeModifierBuilder.create(ITEM, "output", 1.06f, 1, false).build()
        ]
    ).setChance(0.75f)
    .addCatalystInput(
        <additions:greedycraft-brightine>, ["§e加工时间减少到70%", "§e能量消耗减少到65%", "§e材料产出增加到107%"], [
            RecipeModifierBuilder.create(TIME, "input", 0.70f, 1, false).build(),
            RecipeModifierBuilder.create(RF, "input", 0.65f, 1, false).build(),
            RecipeModifierBuilder.create(ITEM, "output", 1.07f, 1, false).build()
        ]
    ).setChance(0.5f)
    .addCatalystInput(
        <additions:greedycraft-time_shard>, ["§e加工时间减少到75%"], [
            RecipeModifierBuilder.create(TIME, "input", 0.75f, 1, false).build()
        ]
    ).setChance(1.0f)
    .addCatalystInput(
        <additions:greedycraft-proliferation_star>, ["§e材料产出增加到130%"], [
            RecipeModifierBuilder.create(ITEM, "output", 1.3f, 1, false).build()
        ]
    ).setChance(1.0f)
    .addCatalystInput(
        <additions:greedycraft-catalyst_star>, ["§e加工时间减少到25%", "§e能量消耗减少到25%"], [
            RecipeModifierBuilder.create(TIME, "input", 0.25f, 1, false).build(),
            RecipeModifierBuilder.create(RF, "input", 0.25f, 1, false).build()
        ]
    ).setChance(1.0f)
    .addItemOutput(<additions:aeonsteel_ingot> * 8)
    .build();