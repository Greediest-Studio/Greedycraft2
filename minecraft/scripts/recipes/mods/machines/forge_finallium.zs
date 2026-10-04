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

MachineModifier.setMaxParallelism("final_forge", 65536);
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
        <additions:hexacite_ingot>, ["§e加工时间减少到75%", "§e能量消耗减少到75%", "§e材料产出增加到108%"], [
            RecipeModifierBuilder.create(TIME, "input", 0.75f, 1, false).build(),
            RecipeModifierBuilder.create(RF, "input", 0.75f, 1, false).build(),
            RecipeModifierBuilder.create(ITEM, "output", 1.08f, 1, false).build(),
        ]
    ).setChance(0.25f)
    .addCatalystInput(
        <additions:spironium_ingot>, ["§e加工时间减少到85%", "§e能量消耗减少到85%", "§e材料产出增加到107%"], [
            RecipeModifierBuilder.create(TIME, "input", 0.85f, 1, false).build(),
            RecipeModifierBuilder.create(RF, "input", 0.85f, 1, false).build(),
            RecipeModifierBuilder.create(ITEM, "output", 1.07f, 1, false).build(),
        ]
    ).setChance(0.50f)
    .addCatalystInput(
        <additions:original_steel_ingot>, ["§e加工时间减少到70%", "§e能量消耗减少到70%", "§e材料产出增加到107%"], [
            RecipeModifierBuilder.create(TIME, "input", 0.70f, 1, false).build(),
            RecipeModifierBuilder.create(RF, "input", 0.70f, 1, false).build(),
            RecipeModifierBuilder.create(ITEM, "output", 1.07f, 1, false).build(),
        ]
    ).setChance(0.25f)
    .addCatalystInput(
        <moretcon:ingotvalasium>, ["§e加工时间减少到75%", "§e能量消耗减少到70%", "§e材料产出增加到107%"], [
            RecipeModifierBuilder.create(TIME, "input", 0.75f, 1, false).build(),
            RecipeModifierBuilder.create(RF, "input", 0.70f, 1, false).build(),
            RecipeModifierBuilder.create(ITEM, "output", 1.07f, 1, false).build(),
        ]
    ).setChance(0.50f)
    .addCatalystInput(
        <additions:godlikeum_ingot>, ["§e加工时间减少到90%", "§e能量消耗减少到90%", "§e材料产出增加到105%"], [
            RecipeModifierBuilder.create(TIME, "input", 0.90f, 1, false).build(),
            RecipeModifierBuilder.create(RF, "input", 0.90f, 1, false).build(),
            RecipeModifierBuilder.create(ITEM, "output", 1.05f, 1, false).build(),
        ]
    ).setChance(0.50f)
    .addCatalystInput(
        <additions:nonenium_ingot>, ["§e加工时间减少到75%", "§e能量消耗减少到75%", "§e材料产出增加到107%"], [
            RecipeModifierBuilder.create(TIME, "input", 0.75f, 1, false).build(),
            RecipeModifierBuilder.create(RF, "input", 0.75f, 1, false).build(),
            RecipeModifierBuilder.create(ITEM, "output", 1.07f, 1, false).build(),
        ]
    ).setChance(0.50f)
    .addCatalystInput(
        <gct_additions:shoggoth_complex_crystal>, ["§e加工时间减少到90%", "§e能量消耗减少到90%", "§e材料产出增加到105%"], [
            RecipeModifierBuilder.create(TIME, "input", 0.90f, 1, false).build(),
            RecipeModifierBuilder.create(RF, "input", 0.90f, 1, false).build(),
            RecipeModifierBuilder.create(ITEM, "output", 1.05f, 1, false).build(),
        ]
    ).setChance(0.50f)
    .addCatalystInput(
        <additions:yeet>, ["§e加工时间减少到88%", "§e能量消耗减少到88%", "§e材料产出增加到103%"], [
            RecipeModifierBuilder.create(TIME, "input", 0.88f, 1, false).build(),
            RecipeModifierBuilder.create(RF, "input", 0.88f, 1, false).build(),
            RecipeModifierBuilder.create(ITEM, "output", 1.03f, 1, false).build(),
        ]
    ).setChance(0.25f)
    .addCatalystInput(
        <gct_additions:shoggy_slime_purified>, ["§e加工时间减少到70%", "§e能量消耗减少到75%", "§e材料产出增加到108%"], [
            RecipeModifierBuilder.create(TIME, "input", 0.70f, 1, false).build(),
            RecipeModifierBuilder.create(RF, "input", 0.75f, 1, false).build(),
            RecipeModifierBuilder.create(ITEM, "output", 1.08f, 1, false).build(),
        ]
    ).setChance(0.25f)
    .addCatalystInput(
        <additions:dentrothyst_rainbow>, ["§e加工时间减少到85%", "§e能量消耗减少到85%", "§e材料产出增加到105%"], [
            RecipeModifierBuilder.create(TIME, "input", 0.85f, 1, false).build(),
            RecipeModifierBuilder.create(RF, "input", 0.85f, 1, false).build(),
            RecipeModifierBuilder.create(ITEM, "output", 1.05f, 1, false).build(),
        ]
    ).setChance(0.25f)
    .addCatalystInput(
        <mekanism:antimatterpellet>, ["§e加工时间减少到60%", "§e能量消耗减少到60%", "§e材料产出增加到110%"], [
            RecipeModifierBuilder.create(TIME, "input", 0.60f, 1, false).build(),
            RecipeModifierBuilder.create(RF, "input", 0.60f, 1, false).build(),
            RecipeModifierBuilder.create(ITEM, "output", 1.10f, 1, false).build(),
        ]
    ).setChance(0.25f)
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
    .addItemOutput(<gct_additions:finallium_ingot> * 8)
    .addRecipeTooltip("§b关于催化剂的介绍：")
    .addRecipeTooltip("§c催化剂§e为机器运行配方时的§a可选§e输入，")
    .addRecipeTooltip("§e可以降低能耗、提升效率、增加产量，")
    .addRecipeTooltip("§e对于八钢熔炉，催化剂的所有计算方式均为§c叠乘§e，")
    .addRecipeTooltip("§e从第§a15§e个显示的材料开始，之后均为催化剂。")
    .build();
