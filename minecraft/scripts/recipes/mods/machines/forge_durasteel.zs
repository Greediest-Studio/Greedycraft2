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

MMEvents.onControllerGUIRender("durasteel_forge", function(event as ControllerGUIRenderEvent) {
    var info as string[] = [
        "§a///耐钢熔合机控制面板///",
        "§a机器名称：§eLV1 - 耐钢熔合机"
    ];
    event.extraInfo = info;
});

val ITEM as string = "modularmachinery:item";
val TIME as string = "modularmachinery:duration";
val RF as string = "modularmachinery:energy";

MachineModifier.setMaxParallelism("durasteel_forge", 65536);
MachineModifier.setInternalParallelism("durasteel_forge", 1);
MachineModifier.setMaxThreads("durasteel_forge", 1);

RecipeBuilder.newBuilder("durasteel_forge", "durasteel_forge", 1800, 1)
    .addItemInputs([
        <ore:ingotStainlessSteel>,
        <ore:ingotBalancite>,
        <ore:ingotIciricium>,
        <ore:ingotLiquifiedCoralium>,
        <ore:ingotAurorianSteel>,
        <ore:ingotManyullyn>,
        <ore:ingotShadowBar>,
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
        <additions:apollonium_ingot>, ["§e加工时间减少到75%", "§e能量消耗减少到90%", "§e材料产出增加到103%"], [
            RecipeModifierBuilder.create(TIME, "input", 0.75f, 1, false).build(),
            RecipeModifierBuilder.create(RF, "input", 0.9f, 1, false).build(),
            RecipeModifierBuilder.create(ITEM, "output", 1.03f, 1, false).build(),
        ]
    ).setChance(0.5f)
    .addCatalystInput(
        <additions:darkice_ingot>, ["§e加工时间减少到60%", "§e材料产出增加到104%"], [
            RecipeModifierBuilder.create(TIME, "input", 0.6f, 1, false).build(),
            RecipeModifierBuilder.create(ITEM, "output", 1.04f, 1, false).build(),
        ]
    ).setChance(0.75f)
    .addCatalystInput(
        <additions:ascensionite_ingot>, ["§e加工时间减少到70%", "§e材料产出增加到107%"], [
            RecipeModifierBuilder.create(TIME, "input", 0.7f, 1, false).build(),
            RecipeModifierBuilder.create(ITEM, "output", 1.07f, 1, false).build(),
        ]
    ).setChance(0.75f)
    .addCatalystInput(
        <additions:endusium_ingot>, ["§e加工时间减少到85%", "§e能量消耗减少到85%", "§e材料产出增加到107%"], [
            RecipeModifierBuilder.create(TIME, "input", 0.85f, 1, false).build(),
            RecipeModifierBuilder.create(RF, "input", 0.85f, 1, false).build(),
            RecipeModifierBuilder.create(ITEM, "output", 1.07f, 1, false).build(),
        ]
    ).setChance(0.75f)
    .addCatalystInput(
        <additions:godslime_ingot>, ["§e加工时间减少到90%", "§e能量消耗减少到88%", "§e材料产出增加到105%"], [
            RecipeModifierBuilder.create(TIME, "input", 0.9f, 1, false).build(),
            RecipeModifierBuilder.create(RF, "input", 0.88f, 1, false).build(),
            RecipeModifierBuilder.create(ITEM, "output", 1.05f, 1, false).build(),
        ]
    ).setChance(0.25f)
    .addCatalystInput(
        <additions:flamium_ingot>, ["§e加工时间减少到85%", "§e能量消耗减少到85%", "§e材料产出增加到105%"], [
            RecipeModifierBuilder.create(TIME, "input", 0.85f, 1, false).build(),
            RecipeModifierBuilder.create(RF, "input", 0.85f, 1, false).build(),
            RecipeModifierBuilder.create(ITEM, "output", 1.05f, 1, false).build(),
        ]
    ).setChance(0.75f)
    .addCatalystInput(
        <moretcon:ingotpenguinite>, ["§e加工时间减少到75%", "§e能量消耗减少到80%", "§e材料产出增加到107%"], [
            RecipeModifierBuilder.create(TIME, "input", 0.75f, 1, false).build(),
            RecipeModifierBuilder.create(RF, "input", 0.8f, 1, false).build(),
            RecipeModifierBuilder.create(ITEM, "output", 1.07f, 1, false).build(),
        ]
    ).setChance(0.50f)
    .addCatalystInput(
        <extrautils2:ingredients:17>, ["§e加工时间减少到95%", "§e能量消耗减少到95%", "§e材料产出增加到103%"], [
            RecipeModifierBuilder.create(TIME, "input", 0.95f, 1, false).build(),
            RecipeModifierBuilder.create(RF, "input", 0.95f, 1, false).build(),
            RecipeModifierBuilder.create(ITEM, "output", 1.03f, 1, false).build(),
        ]
    ).setChance(0.75f)
    .addCatalystInput(
        <plustic:mirioningot>, ["§e加工时间减少到95%", "§e能量消耗减少到95%", "§e材料产出增加到105%"], [
            RecipeModifierBuilder.create(TIME, "input", 0.95f, 1, false).build(),
            RecipeModifierBuilder.create(RF, "input", 0.95f, 1, false).build(),
            RecipeModifierBuilder.create(ITEM, "output", 1.05f, 1, false).build(),
        ]
    ).setChance(0.5f)
    .addCatalystInput(
        <avaritia:resource:1>, ["§e加工时间减少到60%", "§e能量消耗减少到60%", "§e材料产出增加到108%"], [
            RecipeModifierBuilder.create(TIME, "input", 0.6f, 1, false).build(),
            RecipeModifierBuilder.create(RF, "input", 0.6f, 1, false).build(),
            RecipeModifierBuilder.create(ITEM, "output", 1.08f, 1, false).build(),
        ]
    ).setChance(0.25f)
    .addCatalystInput(
        <mysticalagriculture:crafting:36>, ["§e加工时间减少到90%", "§e能量消耗减少到90%", "§e材料产出增加到105%"], [
            RecipeModifierBuilder.create(TIME, "input", 0.9f, 1, false).build(),
            RecipeModifierBuilder.create(RF, "input", 0.9f, 1, false).build(),
            RecipeModifierBuilder.create(ITEM, "output", 1.05f, 1, false).build(),
        ]
    ).setChance(0.50f)
    .addCatalystInput(
        <mysticalagriculture:crafting:37>, ["§e加工时间减少到75%", "§e能量消耗减少到75%", "§e材料产出增加到107%"], [
            RecipeModifierBuilder.create(TIME, "input", 0.75f, 1, false).build(),
            RecipeModifierBuilder.create(RF, "input", 0.75f, 1, false).build(),
            RecipeModifierBuilder.create(ITEM, "output", 1.07f, 1, false).build(),
        ]
    ).setChance(0.50f)
    .addCatalystInput(
        <projecte:item.pe_matter:1>, ["§e加工时间减少到70%", "§e能量消耗减少到70%", "§e材料产出增加到106%"], [
            RecipeModifierBuilder.create(TIME, "input", 0.70f, 1, false).build(),
            RecipeModifierBuilder.create(RF, "input", 0.70f, 1, false).build(),
            RecipeModifierBuilder.create(ITEM, "output", 1.06f, 1, false).build(),
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
        <additions:mana_firestone>, ["§e加工时间减少到90%", "§e能量消耗减少到90%", "§e材料产出增加到105%"], [
            RecipeModifierBuilder.create(TIME, "input", 0.9f, 1, false).build(),
            RecipeModifierBuilder.create(RF, "input", 0.9f, 1, false).build(),
            RecipeModifierBuilder.create(ITEM, "output", 1.05f, 1, false).build(),
        ]
    ).setChance(0.75f)
    .addCatalystInput(
        <additions:slider_gem>, ["§e加工时间减少到90%", "§e能量消耗减少到80%", "§e材料产出增加到105%"], [
            RecipeModifierBuilder.create(TIME, "input", 0.9f, 1, false).build(),
            RecipeModifierBuilder.create(RF, "input", 0.8f, 1, false).build(),
            RecipeModifierBuilder.create(ITEM, "output", 1.05f, 1, false).build(),
        ]
    ).setChance(0.75f)
    .addCatalystInput(
        <additions:iridium_tofu>, ["§e加工时间减少到85%", "§e能量消耗减少到80%", "§e材料产出增加到108%"], [
            RecipeModifierBuilder.create(TIME, "input", 0.85f, 1, false).build(),
            RecipeModifierBuilder.create(RF, "input", 0.8f, 1, false).build(),
            RecipeModifierBuilder.create(ITEM, "output", 1.08f, 1, false).build(),
        ]
    ).setChance(0.25f)
    .addCatalystInput(
        <additions:time_shard>, ["§e加工时间减少到75%"], [
            RecipeModifierBuilder.create(TIME, "input", 0.75f, 1, false).build(),
        ]
    ).setChance(1.0f)
    .addCatalystInput(
        <additions:proliferation_star>, ["§e材料产出增加到130%"], [
            RecipeModifierBuilder.create(ITEM, "output", 1.3f, 1, false).build(),
        ]
    ).setChance(1.0f)
    .addCatalystInput(
        <additions:catalyst_star>, ["§e加工时间减少到15%", "§e能量消耗减少到15%"], [
            RecipeModifierBuilder.create(TIME, "input", 0.15f, 1, false).build(),
            RecipeModifierBuilder.create(RF, "input", 0.15f, 1, false).build(),
        ]
    ).setChance(1.0f)
    .addItemOutput(<additions:durasteel_ingot> * 8)
    .addRecipeTooltip("§b关于催化剂的介绍：")
    .addRecipeTooltip("§c催化剂§e为机器运行配方时的§a可选§e输入，")
    .addRecipeTooltip("§e可以降低能耗、提升效率、增加产量，")
    .addRecipeTooltip("§e对于八钢熔炉，催化剂的所有计算方式均为§c叠乘§e，")
    .addRecipeTooltip("§e从第§a9§e个显示的材料开始，之后均为催化剂。")
    .build();