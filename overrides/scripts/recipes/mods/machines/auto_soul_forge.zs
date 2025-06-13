/*
 * This script is created for the GreedyCraft 
 * 至暗锭配方谁写的每次发完任务两个束缚锭堆同一格去了（恼
 * 还有恶魔意志没办法自动化咕咕工具那个是区块意志量挺复杂的但百科没有详细介绍（悲
 */

#priority 20

import crafttweaker.oredict.IOreDictEntry;
import crafttweaker.item.IItemStack;
import crafttweaker.data.IData;
import crafttweaker.item.IIngredient;
import crafttweaker.liquid.ILiquidStack;

import mods.modularmachinery.RecipeBuilder;
import mods.modularmachinery.RecipeModifierBuilder;
import mods.ctutils.utils.Math;
import mods.jei.JEI;

RecipeBuilder.newBuilder("darkest_ingot", "auto_soul_forge", 100)
    .addCatalystInput(
        <additions:proliferation_star> * 1,
        ["增殖之星的力量使生命源质消耗减半！！！",],
        [RecipeModifierBuilder.create( "modularmachinery:fluid", "input",0.5f,1, false).build(),]
    ).setChance(0)
    .addItemInput(<tconevo:metal:25> * 2)
    .addItemInput(<additions:darkest_core> * 1)
    .addItemInput(<evilcraft:promise:2> * 1)
    .addFluidInput(<liquid:lifeessence> * 100000)
    .addEnergyPerTickInput(10000)
    .addItemOutput(<additions:darkest_ingot>)
    .setChance(5.0f / 10.0f)
    .addRecipeTooltip("扩展狱火熔炉使你有概率额外获得产出！")
    .addItemOutput(<additions:darkest_ingot> * 2)
    .build();

RecipeBuilder.newBuilder("soul_gem", "auto_soul_forge", 1000)
    .addCatalystInput(
        <additions:proliferation_star> * 1,
        ["增殖之星的力量使生命源质消耗减半！！！",],
        [RecipeModifierBuilder.create( "modularmachinery:fluid", "input",0.5f,1, false).build(),]
    ).setChance(0)
    .addItemInput(<bloodmagic:soul_gem:4> * 1)
    .addEnergyPerTickInput(10000)
    .addFluidInput(<liquid:lifeessence> * 100000)
    .addItemOutput(<bloodmagic:soul_gem:4>.withTag({souls: 16000.0}) * 1)
    .build();

RecipeBuilder.newBuilder("blood_shard", "auto_soul_forge", 100)
    .addCatalystInput(
        <additions:proliferation_star> * 1,
        ["增殖之星的力量使生命源质消耗减半！！！",],
        [RecipeModifierBuilder.create( "modularmachinery:fluid", "input",0.5f,1, false).build(),]
    ).setChance(0)
    .addFluidInput(<liquid:lifeessence> * 100000)
    .addItemInput(<tconevo:metal:27> * 1)
    .addEnergyPerTickInput(10000)
    .addItemOutput(<bloodmagic:blood_shard> * 1)
    .addRecipeTooltip("大量的生命源质足以让束缚粒坍缩为气血碎片！")
    .build();

RecipeBuilder.newBuilder("balanced_slate", "auto_soul_forge", 100)
    .addCatalystInput(
        <additions:proliferation_star> * 1,
        ["增殖之星的力量使你消耗生命源质大幅减少！！！"],
        [RecipeModifierBuilder.create("modularmachinery:fluid", "input", 0.1, 1, false).build()]
    ).setChance(0)
    .addItemInput(<additions:slate_7> * 1)
    .addItemInput(<gct_ores:balanced_matrix_ingot> * 1)
    .addFluidInput(<liquid:lifeessence> * 100000)
    .addEnergyPerTickInput(10000)
    .addItemOutput(<additions:balanced_slate> * 2)
    .addItemOutput(<additions:balanced_slate>)
    .setChance(5.0f / 10.0f)
    .addRecipeTooltip("扩展狱火熔炉使你有概率额外获得产出！")
    .build();

RecipeBuilder.newBuilder("additions:reagent_ghost", "auto_soul_forge", 100)
    .addCatalystInput(
        <additions:proliferation_star> * 1,
        ["增殖之星的力量使你消耗生命源质大幅减少！！！"],
        [RecipeModifierBuilder.create("modularmachinery:fluid", "input", 0.1, 1, false).build()]
    ).setChance(0)
    .addItemInput(<minecraft:gunpowder> * 1)
    .addItemInput(<jaopca:dust.darkest> * 1)
    .addItemInput(<tconevo:metal:32> * 1)
    .addItemInput(<jaopca:dust.wigthium> * 1)
    .addFluidInput(<liquid:lifeessence> * 100000)
    .addEnergyPerTickInput(10000)
    .addItemOutput(<additions:reagent_ghost> * 1)
    .addItemOutput(<additions:reagent_ghost>)
    .setChance(5.0f / 10.0f)
    .addRecipeTooltip("扩展狱火熔炉使你有概率额外获得产出！")
    .build();

RecipeBuilder.newBuilder("shufushiji", "auto_soul_forge", 100)
    .addCatalystInput(
        <additions:proliferation_star> * 1,
        ["增殖之星的力量使你消耗生命源质大幅减少！！！"],
        [RecipeModifierBuilder.create("modularmachinery:fluid", "input", 0.1, 1, false).build()]
    ).setChance(0)
    .addItemInput(<minecraft:gunpowder> * 1)
    .addItemInput(<minecraft:gold_nugget> * 1)
    .addItemInput(<minecraft:redstone> * 1)
    .addItemInput(<minecraft:glowstone_dust> * 1)
    .addFluidInput(<liquid:lifeessence> * 10000)
    .addEnergyPerTickInput(10000)
    .addItemOutput(<bloodmagic:component:8> * 1)
    .addItemOutput(<bloodmagic:component:8>)
    .setChance(5.0f / 10.0f)
    .addRecipeTooltip("扩展狱火熔炉使你有概率额外获得产出！")
    .build();

RecipeBuilder.newBuilder("blood_diamond", "auto_soul_forge", 100)
    .addCatalystInput(
        <additions:proliferation_star> * 1,
        ["增殖之星的力量使你消耗生命源质大幅减少！！！"],
        [RecipeModifierBuilder.create("modularmachinery:fluid", "input", 0.1, 1, false).build()]
    ).setChance(0)
    .addItemInput(<minecraft:diamond> * 1)
    .addItemInput(<additions:slate_7> * 4)
    .addItemInput(<bloodmagic:component:8> * 1)
    .addItemInput(<bloodarsenal:blood_infused_iron_block> * 4)
    .addItemInput(<bloodarsenal:blood_infused_glowstone> * 4)
    .addFluidInput(<liquid:lifeessence> * 100000)
    .addEnergyPerTickInput(10000)
    .addItemOutput(<bloodarsenal:blood_diamond:3> * 1)
    .addItemOutput(<bloodarsenal:blood_diamond:3>)
    .setChance(5.0f / 10.0f)
    .addRecipeTooltip("扩展狱火熔炉使你有概率额外获得产出！")
    .build();

RecipeBuilder.newBuilder("blood_iron", "auto_soul_forge", 100)
    .addCatalystInput(
        <additions:proliferation_star> * 1,
        ["增殖之星的力量使你消耗生命源质大幅减少！！！"],
        [RecipeModifierBuilder.create("modularmachinery:fluid", "input", 0.1, 1, false).build()]
    ).setChance(0)
    .addItemInput(<minecraft:iron_ingot> * 1)
    .addItemInput(<bloodmagic:slate:4> * 1)
    .addItemInput(<bloodmagic:component:8> * 1)
    .addItemInput(<bloodarsenal:base_item:2> * 1)
    .addFluidInput(<liquid:lifeessence> * 100000)
    .addEnergyPerTickInput(10000)
    .addItemOutput(<bloodarsenal:base_item:3> * 1)
    .addItemOutput(<bloodarsenal:base_item:3>)
    .setChance(5.0f / 10.0f)
    .addRecipeTooltip("扩展狱火熔炉使你有概率额外获得产出！")
    .build();

RecipeBuilder.newBuilder("slate1", "auto_soul_forge", 100)
    .addCatalystInput(
        <additions:proliferation_star> * 1,
        ["增殖之星的力量使你消耗生命源质大幅减少！！！"],
        [RecipeModifierBuilder.create("modularmachinery:fluid", "input", 0.1, 1, false).build()]
    ).setChance(0)
    .addItemInput(<minecraft:stone> * 1)
    .addFluidInput(<liquid:lifeessence> * 1000)
    .addEnergyPerTickInput(10000)
    .addItemOutput(<bloodmagic:slate> * 1)
    .build();

RecipeBuilder.newBuilder("sentientmetal", "auto_soul_forge", 100)
    .addCatalystInput(
        <additions:proliferation_star> * 1,
        ["增殖之星的力量使你消耗生命源质大幅减少！！！"],
        [RecipeModifierBuilder.create("modularmachinery:fluid", "input", 0.1, 1, false).build()]
    ).setChance(0)
    .addItemInput(<ore:blockGlass> * 1)
    .addItemInput(<minecraft:gold_ingot> * 1)
    .addItemInput(<minecraft:redstone> * 1)
    .addItemInput(<ore:dyeBlue> * 1)
    .addItemInput(<additions:stainless_steel_ingot> * 1)
    .addFluidInput(<liquid:lifeessence> * 1000)
    .addEnergyPerTickInput(10000)
    .addItemOutput(<tconevo:metal:30> * 1)
    .build();

RecipeBuilder.newBuilder("reagent_godness", "auto_soul_forge", 100)
    .addCatalystInput(
        <additions:proliferation_star> * 1,
        ["增殖之星的力量使你消耗生命源质大幅减少！！！"],
        [RecipeModifierBuilder.create("modularmachinery:fluid", "input", 0.1, 1, false).build()]
    ).setChance(0)
    .addItemInput(<gct_ores:everite_ingot> * 1)
    .addItemInput(<jaopca:dust.eugardite> * 1)
    .addItemInput(<jaopca:dust.scientificite> * 1)
    .addItemInput(<jaopca:dust.cosmilite> * 1)
    .addFluidInput(<liquid:lifeessence> * 100000)
    .addEnergyPerTickInput(100000)
    .addItemOutput(<additions:reagent_godness> * 1)
    .addItemOutput(<additions:reagent_godness> * 1).setChance(5.0f / 10.0f)
    .build();