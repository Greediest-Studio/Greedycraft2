/*
 * This script is created for the GreedyCraft modpack by TCreopargh.
 * You may NOT use this script in any other publicly distributed modpack without my permission. 
 */


#priority 30

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

MMEvents.onControllerGUIRender("chromasteel_forge", function(event as ControllerGUIRenderEvent) {
    var info as string[] = [
        "§a///炫钢熔合机控制面板///",
        "§a机器名称：§eLV3 - 炫钢熔合机"
    ];
    event.extraInfo = info;
});

val ITEM as string = "modularmachinery:item";
val TIME as string = "modularmachinery:duration";
val RF as string = "modularmachinery:energy";

MachineModifier.setMaxParallelism("chromasteel_forge", 65536);
MachineModifier.setInternalParallelism("chromasteel_forge", 1);
MachineModifier.setMaxThreads("chromasteel_forge", 1);

RecipeBuilder.newBuilder("chromasteel_forge", "chromasteel_forge", 4200, 1)
    .addItemInputs([
        <ore:ingotAeonsteel>,
        <enderio:item_alloy_endergy_ingot:3>,
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
        <additions:daynight_ingot>, ["§e加工时间减少到75%", "§e能量消耗减少到90%", "§e材料产出增加到102%"], [
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
        <additions:aurune_ingot>, ["§e加工时间减少到85%", "§e能量消耗减少到85%", "§e材料产出增加到107%"], [
            RecipeModifierBuilder.create(TIME, "input", 0.85f, 1, false).build(),
            RecipeModifierBuilder.create(RF, "input", 0.85f, 1, false).build(),
            RecipeModifierBuilder.create(ITEM, "output", 1.07f, 1, false).build(),
        ]
    ).setChance(0.5f)
    .addCatalystInput(
        <gct_additions:sanite_ingot>, ["§e加工时间减少到75%", "§e能量消耗减少到90%", "§e材料产出增加到103%"], [
            RecipeModifierBuilder.create(TIME, "input", 0.75f, 1, false).build(),
            RecipeModifierBuilder.create(RF, "input", 0.9f, 1, false).build(),
            RecipeModifierBuilder.create(ITEM, "output", 1.03f, 1, false).build(),
        ]
    ).setChance(0.75f)
    .addCatalystInput(
        <additions:mana_ingot>, ["§e加工时间减少到85%", "§e能量消耗减少到70%", "§e材料产出增加到102%"], [
            RecipeModifierBuilder.create(TIME, "input", 0.85f, 1, false).build(),
            RecipeModifierBuilder.create(RF, "input", 0.7f, 1, false).build(),
            RecipeModifierBuilder.create(ITEM, "output", 1.02f, 1, false).build(),
        ]
    ).setChance(0.75f)
    .addCatalystInput(
        <additions:enderite_ingot>, ["§e加工时间减少到90%", "§e能量消耗减少到80%", "§e材料产出增加到105%"], [
            RecipeModifierBuilder.create(TIME, "input", 0.9f, 1, false).build(),
            RecipeModifierBuilder.create(RF, "input", 0.8f, 1, false).build(),
            RecipeModifierBuilder.create(ITEM, "output", 1.05f, 1, false).build(),
        ]
    ).setChance(0.25f)
    .addCatalystInput(
        <additions:endest_steel_ingot>, ["§e加工时间减少到80%", "§e能量消耗减少到80%", "§e材料产出增加到106%"], [
            RecipeModifierBuilder.create(TIME, "input", 0.8f, 1, false).build(),
            RecipeModifierBuilder.create(RF, "input", 0.8f, 1, false).build(),
            RecipeModifierBuilder.create(ITEM, "output", 1.06f, 1, false).build(),
        ]
    ).setChance(0.5f)
    .addCatalystInput(
        <additions:blue_alloy_ingot>, ["§e加工时间减少到95%", "§e能量消耗减少到95%", "§e材料产出增加到103%"], [
            RecipeModifierBuilder.create(TIME, "input", 0.95f, 1, false).build(),
            RecipeModifierBuilder.create(RF, "input", 0.95f, 1, false).build(),
            RecipeModifierBuilder.create(ITEM, "output", 1.03f, 1, false).build(),
        ]
    ).setChance(0.75f)
    .addCatalystInput(
        <additions:wigthium_ingot>, ["§e加工时间减少到90%", "§e能量消耗减少到90%", "§e材料产出增加到106%"], [
            RecipeModifierBuilder.create(TIME, "input", 0.90f, 1, false).build(),
            RecipeModifierBuilder.create(RF, "input", 0.90f, 1, false).build(),
            RecipeModifierBuilder.create(ITEM, "output", 1.06f, 1, false).build(),
        ]
    ).setChance(0.50f)
    .addCatalystInput(
        <additions:killer_alloy_ingot>, ["§e加工时间减少到75%", "§e能量消耗减少到75%", "§e材料产出增加到105%"], [
            RecipeModifierBuilder.create(TIME, "input", 0.75f, 1, false).build(),
            RecipeModifierBuilder.create(RF, "input", 0.75f, 1, false).build(),
            RecipeModifierBuilder.create(ITEM, "output", 1.05f, 1, false).build(),
        ]
    ).setChance(0.50f)
    .addCatalystInput(
        <moretcon:ingotrunesteel>, ["§e加工时间减少到85%", "§e能量消耗减少到85%", "§e材料产出增加到105%"], [
            RecipeModifierBuilder.create(TIME, "input", 0.85f, 1, false).build(),
            RecipeModifierBuilder.create(RF, "input", 0.85f, 1, false).build(),
            RecipeModifierBuilder.create(ITEM, "output", 1.05f, 1, false).build(),
        ]
    ).setChance(0.50f)
    .addCatalystInput(
        <journey:reinforcedcrystalingot>, ["§e加工时间减少到80%", "§e能量消耗减少到80%", "§e材料产出增加到108%"], [
            RecipeModifierBuilder.create(TIME, "input", 0.80f, 1, false).build(),
            RecipeModifierBuilder.create(RF, "input", 0.80f, 1, false).build(),
            RecipeModifierBuilder.create(ITEM, "output", 1.08f, 1, false).build(),
        ]
    ).setChance(0.50f)
    .addCatalystInput(
        <gct_additions:stormy_witherium_ingot>, ["§e加工时间减少到90%", "§e能量消耗减少到75%", "§e材料产出增加到104%"], [
            RecipeModifierBuilder.create(TIME, "input", 0.90f, 1, false).build(),
            RecipeModifierBuilder.create(RF, "input", 0.75f, 1, false).build(),
            RecipeModifierBuilder.create(ITEM, "output", 1.04f, 1, false).build(),
        ]
    ).setChance(0.75f)
    .addCatalystInput(
        <gct_additions:chaotic_draconium_ingot>, ["§e加工时间减少到90%", "§e能量消耗减少到75%", "§e材料产出增加到104%"], [
            RecipeModifierBuilder.create(TIME, "input", 0.90f, 1, false).build(),
            RecipeModifierBuilder.create(RF, "input", 0.75f, 1, false).build(),
            RecipeModifierBuilder.create(ITEM, "output", 1.04f, 1, false).build(),
        ]
    ).setChance(0.75f)
    .addCatalystInput(
        <extendedcrafting:material:24>, ["§e加工时间减少到88%", "§e能量消耗减少到88%", "§e材料产出增加到104%"], [
            RecipeModifierBuilder.create(TIME, "input", 0.88f, 1, false).build(),
            RecipeModifierBuilder.create(RF, "input", 0.88f, 1, false).build(),
            RecipeModifierBuilder.create(ITEM, "output", 1.04f, 1, false).build(),
        ]
    ).setChance(0.75f)
    .addCatalystInput(
        <enderio:item_alloy_endergy_ingot:4>, ["§e加工时间减少到80%", "§e能量消耗减少到80%", "§e材料产出增加到105%"], [
            RecipeModifierBuilder.create(TIME, "input", 0.80f, 1, false).build(),
            RecipeModifierBuilder.create(RF, "input", 0.80f, 1, false).build(),
            RecipeModifierBuilder.create(ITEM, "output", 1.05f, 1, false).build(),
        ]
    ).setChance(0.50f)
    .addCatalystInput(
        <additions:extremium_ingot>, ["§e加工时间减少到75%", "§e能量消耗减少到75%", "§e材料产出增加到107%"], [
            RecipeModifierBuilder.create(TIME, "input", 0.75f, 1, false).build(),
            RecipeModifierBuilder.create(RF, "input", 0.75f, 1, false).build(),
            RecipeModifierBuilder.create(ITEM, "output", 1.07f, 1, false).build(),
        ]
    ).setChance(0.50f)
    .addCatalystInput(
        <additions:kianate_ingot>, ["§e加工时间减少到90%", "§e能量消耗减少到90%", "§e材料产出增加到104%"], [
            RecipeModifierBuilder.create(TIME, "input", 0.90f, 1, false).build(),
            RecipeModifierBuilder.create(RF, "input", 0.90f, 1, false).build(),
            RecipeModifierBuilder.create(ITEM, "output", 1.04f, 1, false).build(),
        ]
    ).setChance(0.50f)
    .addCatalystInput(
        <additions:sharpen_alloy_ingot>, ["§e加工时间减少到90%", "§e能量消耗减少到90%", "§e材料产出增加到104%"], [
            RecipeModifierBuilder.create(TIME, "input", 0.90f, 1, false).build(),
            RecipeModifierBuilder.create(RF, "input", 0.90f, 1, false).build(),
            RecipeModifierBuilder.create(ITEM, "output", 1.04f, 1, false).build(),
        ]
    ).setChance(0.25f)
    .addCatalystInput(
        <projectex:matter:1>, ["§e加工时间减少到65%", "§e能量消耗减少到65%", "§e材料产出增加到104%"], [
            RecipeModifierBuilder.create(TIME, "input", 0.65f, 1, false).build(),
            RecipeModifierBuilder.create(RF, "input", 0.65f, 1, false).build(),
            RecipeModifierBuilder.create(ITEM, "output", 1.04f, 1, false).build(),
        ]
    ).setChance(0.75f)
    .addCatalystInput(
        <additions:token_emotion>, ["§e加工时间减少到80%", "§e能量消耗减少到80%", "§e材料产出增加到108%"], [
            RecipeModifierBuilder.create(TIME, "input", 0.80f, 1, false).build(),
            RecipeModifierBuilder.create(RF, "input", 0.80f, 1, false).build(),
            RecipeModifierBuilder.create(ITEM, "output", 1.08f, 1, false).build(),
        ]
    ).setChance(0.25f)
    .addCatalystInput(
        <additions:infused_diamond_ghost>, ["§e加工时间减少到80%", "§e能量消耗减少到80%", "§e材料产出增加到106%"], [
            RecipeModifierBuilder.create(TIME, "input", 0.80f, 1, false).build(),
            RecipeModifierBuilder.create(RF, "input", 0.80f, 1, false).build(),
            RecipeModifierBuilder.create(ITEM, "output", 1.06f, 1, false).build(),
        ]
    ).setChance(0.25f)
    .addCatalystInput(
        <additions:stormy_crystal_gem>, ["§e加工时间减少到90%", "§e能量消耗减少到75%", "§e材料产出增加到106%"], [
            RecipeModifierBuilder.create(TIME, "input", 0.90f, 1, false).build(),
            RecipeModifierBuilder.create(RF, "input", 0.75f, 1, false).build(),
            RecipeModifierBuilder.create(ITEM, "output", 1.06f, 1, false).build(),
        ]
    ).setChance(0.25f)
    .addCatalystInput(
        <additions:chaotic_crystal_gem>, ["§e加工时间减少到90%", "§e能量消耗减少到75%", "§e材料产出增加到106%"], [
            RecipeModifierBuilder.create(TIME, "input", 0.9f, 1, false).build(),
            RecipeModifierBuilder.create(RF, "input", 0.75f, 1, false).build(),
            RecipeModifierBuilder.create(ITEM, "output", 1.06f, 1, false).build(),
        ]
    ).setChance(0.25f)
    .addCatalystInput(
        <additions:aurora_heart>, ["§e加工时间减少到60%", "§e能量消耗减少到60%", "§e材料产出增加到108%"], [
            RecipeModifierBuilder.create(TIME, "input", 0.6f, 1, false).build(),
            RecipeModifierBuilder.create(RF, "input", 0.6f, 1, false).build(),
            RecipeModifierBuilder.create(ITEM, "output", 1.08f, 1, false).build(),
        ]
    ).setChance(0.75f)
    .addCatalystInput(
        <additions:sand_of_time>, ["§e加工时间减少到60%"], [
            RecipeModifierBuilder.create(TIME, "input", 0.6f, 1, false).build(),
        ]
    ).setChance(1.0f)
    .addCatalystInput(
        <additions:proliferation_star>, ["§e材料产出增加到130%"], [
            RecipeModifierBuilder.create(ITEM, "output", 1.3f, 1, false).build(),
        ]
    ).setChance(1.0f)
    .addCatalystInput(
        <additions:catalyst_star>, ["§e加工时间减少到50%", "§e能量消耗减少到50%"], [
            RecipeModifierBuilder.create(TIME, "input", 0.5f, 1, false).build(),
            RecipeModifierBuilder.create(RF, "input", 0.5f, 1, false).build(),
        ]
    ).setChance(1.0f)
    .addItemOutput(<additions:chromasteel_ingot> * 8)
    .addRecipeTooltip("§b关于催化剂的介绍：")
    .addRecipeTooltip("§c催化剂§e为机器运行配方时的§a可选§e输入，")
    .addRecipeTooltip("§e可以降低能耗、提升效率、增加产量，")
    .addRecipeTooltip("§e对于八钢熔炉，催化剂的所有计算方式均为§c叠乘§e，")
    .addRecipeTooltip("§e从第§a11§e个显示的材料开始，之后均为催化剂。")
    .build();
