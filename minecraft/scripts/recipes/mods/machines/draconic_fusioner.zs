/*
 * This script is created for the GreedyCraft Tweaks by mc_Edwin.
 */

#priority 50
#crafttweaker reloadable
#reloadable

import crafttweaker.oredict.IOreDictEntry;
import crafttweaker.item.IItemStack;
import crafttweaker.data.IData;
import crafttweaker.item.IIngredient;
import crafttweaker.liquid.ILiquidStack;

import mods.modularmachinery.RecipeBuilder;
import mods.modularmachinery.MMEvents;
import mods.modularmachinery.MachineTickEvent;
import mods.modularmachinery.ControllerGUIRenderEvent;
import mods.modularmachinery.RecipeTickEvent;
import mods.modularmachinery.MachineModifier;
import mods.modularmachinery.IMachineController;
import mods.modularmachinery.RecipeAdapterBuilder;
import mods.modularmachinery.RecipePrimer;
import mods.ctutils.utils.Math;
import mods.jei.JEI;

import mods.zenutils.DataUpdateOperation.OVERWRITE;
import mods.zenutils.DataUpdateOperation.APPEND;
import mods.zenutils.DataUpdateOperation.MERGE;
import mods.zenutils.DataUpdateOperation.REMOVE;
import mods.zenutils.DataUpdateOperation.BUMP;

MachineModifier.setMaxThreads("draconic_fusioner", 1);
MachineModifier.setMaxParallelism("draconic_fusioner", 256);
MachineModifier.setInternalParallelism("draconic_fusioner", 1);

MMEvents.onMachinePreTick("draconic_fusioner", function(event as MachineTickEvent) {
    var controller = event.controller;
    if (controller.getBlocksInPattern(<additions:basic_fusion_core>) == 1) {
        event.controller.customData = {level : 0 as int};
    } else if (controller.getBlocksInPattern(<additions:wyvern_fusion_core>) == 1) {
        event.controller.customData = {level : 1 as int};
    } else if (controller.getBlocksInPattern(<additions:draconic_fusion_core>) == 1) {
        event.controller.customData = {level : 2 as int};
    } else if (controller.getBlocksInPattern(<additions:chaotic_fusion_core>) == 1) {
        event.controller.customData = {level : 3 as int};
    } else if (controller.getBlocksInPattern(<gct_ores:ordered_fusion_core>) == 1) {
        event.controller.customData = {level : 4 as int};
    } else {
        event.controller.customData = {level : -1 as int};
    }
});

$expand IMachineController$ getFusionLevel() as int {
    if (!isNull(this.customData.level)) {
        return this.customData.level as int;
    } else {
        return -1;
    }
}

function addFusionRecipe(output as IItemStack, input as IIngredient[], ept as long, level as int) {
    var levelMap as string[int] = {
        0: "基础",
        1: "飞龙",
        2: "神龙",
        3: "混沌",
        4: "秩序",
        5: "霜炙",
        6: "悚怖",
        7: "超元",
        8: "贪婪",
        9: "无尽"
    };
    var recipe = RecipeBuilder.newBuilder(output.definition.id + output.metadata + "a", "draconic_fusioner", 200);
    recipe.addEnergyPerTickInput(ept);
    for inputItem in input {
        recipe.addItemInput(inputItem);
    }
    recipe.addPreTickHandler(function(event as RecipeTickEvent) {
        if (event.controller.getFusionLevel() < level) {
            event.setFailed(true, "注入核心等级不足！");
        }
    });
    recipe.addRecipeTooltip("§d核心等级：" + levelMap[level]);
    recipe.addItemOutput(output);
    recipe.build();
}

MMEvents.onControllerGUIRender("draconic_fusioner", function(event as ControllerGUIRenderEvent) {
    var levelMap as string[int] = {
        -1: "§c错误！",
        0: "基础",
        1: "飞龙",
        2: "神龙",
        3: "混沌",
        4: "秩序",
        5: "霜炙",
        6: "悚怖",
        7: "超元",
        8: "贪婪",
        9: "无尽"
    };
    var level as string = levelMap[event.controller.getFusionLevel()];
    var info as string[] = [
        "§e///龙之研究聚合台控制面板///",
        "§a机器名称：§eLV2 - 龙之研究聚合台",
        "§a聚合核心等级：§e" ~ level as string
    ];
    event.extraInfo = info;
});

addFusionRecipe(<draconicevolution:draconic_block> * 4, [<ore:blockDraconium> * 4, <ore:coreDraconium> * 6, <draconicevolution:dragon_heart>], 1750000, 1);
addFusionRecipe(<gct_ores:chaotic_draconium_block> * 4, [<ore:blockDraconiumAwakened> * 4, <ore:ingotEverite> * 2, <ore:metalChaotic> * 2, <ore:gemChaosShard> * 2, <contenttweaker:chaos_heart> * 2], 6016340, 2);
addFusionRecipe(<gct_ores:ruled_draconium_block> * 4, [<ore:blockDraconiumChaotic> * 4, <ore:coreChaotic>, <ore:blockAdamantium> * 2, <ore:blockEverite> * 2, <ore:blockChaosShard>, <contenttweaker:chaos_heart> * 2], 512000000, 3);
addFusionRecipe(<gct_ores:relifed_witherium_block> * 4, [<ore:blockWitherium> * 4, <ore:coreWitherium> * 6, <ore:netherStar> * 2], 1750000, 1);
addFusionRecipe(<gct_ores:stormy_witherium_block> * 4, [<ore:blockWitheriumRelifed> * 4, <ore:ingotEverite> * 2, <ore:metalChaotic> * 2, <ore:gemStormyShard> * 2, <ore:netherStarWithered> * 2], 6016340, 2);
addFusionRecipe(<gct_ores:equipment_witherium_block> * 4, [<ore:blockWitheriumStormy> * 4, <ore:coreStormy>, <ore:blockAdamantium> * 2, <ore:blockEverite> * 2, <ore:blockStormyShard>, <ageofminecraft:withered_nether_star> * 2], 512000000, 3);

addFusionRecipe(<tconevo:metal>, [<ore:ingotFusionMatrix>, <ore:coreWyvern>, <ore:blockRedstone>, <ore:gemDiamond> * 2], 1280, 1);
addFusionRecipe(<tconevo:metal:5>, [<ore:ingotFusionMatrix>, <ore:coreAwakened>, <draconicevolution:wyvern_energy_core>, <ore:netherStar> * 2], 20480, 2);
addFusionRecipe(<tconevo:metal:10>, [<ore:ingotFusionMatrix>, <ore:coreChaotic>, <draconicevolution:draconic_energy_core>, <ore:dragonEgg> * 2], 5120000, 3);
addFusionRecipe(<gct_ores:fallen_metal_ingot>, [<ore:ingotFusionMatrix>, <ore:coreFallen>, <ore:blockRedstone>, <ore:gemDiamond> * 2], 1280, 1);
addFusionRecipe(<gct_ores:relifed_metal_ingot>, [<ore:ingotFusionMatrix>, <ore:coreRelifed>, <draconicevolution:wyvern_energy_core>, <ore:netherStar> * 2], 20480, 2);
addFusionRecipe(<gct_ores:stormy_metal_ingot>, [<ore:ingotFusionMatrix>, <ore:coreStormy>, <draconicevolution:draconic_energy_core>, <ore:dragonEgg> * 2], 5120000, 3);
addFusionRecipe(<gct_ores:ordered_metal_ingot>, [<ore:ingotBalancedMatrix>, <ore:coreOrdered>, <contenttweaker:chaotic_energy_core>, <ore:netherStarWithered>, <contenttweaker:chaos_heart>], 268435456, 4);

addFusionRecipe(<draconicevolution:wyvern_core>, [<ore:netherStar>, <ore:coreDraconium> * 4, <ore:ingotStellarAlloy>, <ore:ingotOrbadite>, <ore:metalWyvern> * 2], 122880, 0);
addFusionRecipe(<draconicevolution:awakened_core>, [<ore:netherStar>, <ore:coreExcellent> * 2, <ore:ingotDraconiumAwakened> * 2, <ore:ingotAeonsteel> * 2, <ore:metalAwakened> * 2], 2000000, 1);
addFusionRecipe(<draconicevolution:chaotic_core>, [<ore:gemChaosShard>, <ore:ingotWyvernMetal> * 2, <ore:ingotDraconicMetal> * 2, <ore:ingotNeutronium> * 2, <ore:ingotChromasteel> * 2], 1572864, 2);
addFusionRecipe(<gct_ores:fallen_core>, [<ore:netherStar>, <ore:coreWitherium> * 4, <ore:ingotStellarAlloy>, <ore:ingotOrbadite>, <ore:metalWyvern> * 2], 122880, 0);
addFusionRecipe(<gct_ores:relifed_core>, [<ore:netherStar>, <ore:coreExcellent> * 2, <ore:ingotWitheriumRelifed> * 2, <ore:ingotAeonsteel> * 2, <ore:metalAwakened> * 2], 2000000, 1);
addFusionRecipe(<gct_ores:stormy_core>, [<ore:gemStormyShard>, <ore:ingotFallenMetal> * 2, <ore:ingotRelifedMetal> * 2, <ore:ingotNeutronium> * 2, <ore:ingotChromasteel> * 2], 1572864, 2);
addFusionRecipe(<gct_ores:ordered_core>, [<ore:gemOrderCrystal>, <ore:coreChaotic> * 3, <ore:coreStormy> * 3, <ore:ingotCosmilite> * 2, <ore:blockWitheriumEquipment> * 2, <ore:blockDraconiumRuled> * 2], 786432000, 4);

addFusionRecipe(<draconicevolution:crafting_injector:1>, [<draconicevolution:crafting_injector>, <ore:coreBasic> * 2, <ore:coreExcellent>, <ore:blockDraconium>, <ore:gemDiamond> * 4], 1280, 0);
addFusionRecipe(<draconicevolution:crafting_injector:2>, [<draconicevolution:crafting_injector:1>, <ore:coreExcellent> * 2, <ore:blockDraconiumAwakened>, <ore:gemDiamond> * 4], 8960, 1);
addFusionRecipe(<draconicevolution:crafting_injector:3>, [<draconicevolution:crafting_injector:2>, <ore:coreEpic>, <ore:dragonEgg>, <ore:gemDiamond> * 4], 24000000, 3);

addFusionRecipe(<solarflux:solar_panel_wyvern>, [<solarflux:solar_panel_8>, <ore:ingotWyvernMetal> * 4, <draconicevolution:wyvern_energy_core> * 4], 64000, 1);
addFusionRecipe(<solarflux:solar_panel_draconic>, [<solarflux:solar_panel_wyvern>, <ore:ingotDraconicMetal> * 4, <draconicevolution:draconic_energy_core> * 4], 512000, 2);
addFusionRecipe(<solarflux:solar_panel_chaotic> * 4, [<solarflux:solar_panel_draconic> * 4, <ore:coreChaotic>, <ore:coreAwakened> * 4], 10240000, 3);
addFusionRecipe(<solarflux:custom_solar_panel_solar_panel_order> * 4, [<solarflux:solar_panel_chaotic> * 3, <solarflux:custom_solar_panel_solar_panel_11>, <ore:coreOrdered> * 2, <ore:gemOrderCrystal> * 4], 160000000, 4);

addFusionRecipe(<additions:basic_fusion_core>, [<draconicevolution:fusion_crafting_core>, <draconicevolution:crafting_injector> * 8, <ore:coreBasic> * 2], 1280, 0);
addFusionRecipe(<additions:wyvern_fusion_core>, [<draconicevolution:fusion_crafting_core>, <draconicevolution:crafting_injector:1> * 8, <ore:coreExcellent> * 2], 51200, 1);
addFusionRecipe(<additions:draconic_fusion_core>, [<draconicevolution:fusion_crafting_core>, <draconicevolution:crafting_injector:2> * 8, <ore:coreSuperior> * 2], 1024000, 2);
addFusionRecipe(<additions:chaotic_fusion_core>, [<draconicevolution:fusion_crafting_core>, <draconicevolution:crafting_injector:3> * 8, <ore:coreEpic> * 2], 20480000, 3);
addFusionRecipe(<gct_ores:ordered_fusion_core>, [<draconicevolution:fusion_crafting_core>, <draconicevolution:crafting_injector:3> * 14, <ore:gemOrderCrystal> * 2], 655360000, 3);

addFusionRecipe(<draconicevolution:energy_crystal:2>, [<draconicevolution:energy_crystal:1>, <ore:coreExcellent>, <draconicevolution:wyvern_energy_core> * 4, <ore:gemDiamond> * 4], 5760, 2);
addFusionRecipe(<draconicevolution:reactor_component>, [<draconicevolution:reactor_part:3>, <draconicevolution:reactor_part:4>, <ore:ingotDraconiumAwakened> * 4, <ore:coreEpic>, <draconicevolution:draconic_energy_core>], 640000, 3);
addFusionRecipe(<draconicevolution:reactor_component:1>, [<ore:coreExcellent>, <ore:ingotDraconium> * 4, <ore:ingotIron> * 2, <draconicevolution:reactor_part:1> * 4], 800000, 3);
addFusionRecipe(<draconicevolution:reactor_core>, [<ore:gemChaosShard>, <ore:ingotCosmilite> * 2, <ore:ingotDraconicMetal> * 2, <contenttweaker:chaotic_energy_core> * 2, <ore:metalEvery> * 2], 16384000, 3);
addFusionRecipe(<draconicevolution:draconium_chest>, [<ore:chest>, <ore:coreBasic> * 2, <ore:blockDraconium>, <minecraft:furnace> * 5, <ore:workbench> * 2], 100000, 0);
addFusionRecipe(<draconicevolution:ender_energy_manipulator>, [<ore:skullWitherSkeleton>, <ore:coreExcellent>, <ore:coreBasic> * 2, <ore:pearlEnderEye> * 7], 600000, 1);
addFusionRecipe(<draconicevolution:dislocator_advanced>, [<draconicevolution:dislocator>, <ore:coreExcellent>, <ore:ingotDraconium> * 4, <ore:enderpearl> * 3], 40000, 1);
addFusionRecipe(<gct_ores:command_core>, [<ore:ingotHarcadium> * 4, <ore:ingotVoidEssence> * 4, <ore:ingotAdamantium> * 4, <ore:blockDraconiumChaotic>, <ore:ingotChromasteel>, <ore:ingotCrimsonite>, <ore:ingotAdaminite>], 10735000, 2);
addFusionRecipe(<gct_ores:creepy_wither_doll>, [<ore:blockHarcadium>, <ore:skullWitherSkeleton> * 4, <ore:soulSand> * 4], 16777216, 2);
addFusionRecipe(<gct_ores:rng_relinquisher>, [<ore:coreChaotic>, <ore:ingotHarcadium> * 2, <ore:ingotVoidEssence> * 2, <ore:metalChaotic> * 4], 83886080, 3);
addFusionRecipe(<minecraft:command_block>, [<ore:coreCommand>, <ore:coreRelifed> * 8, <ore:coreChaotic>, <ore:bedrock> * 2, <ore:blockAdamantium>], 26214400, 3);
addFusionRecipe(<gct_ores:creepy_witherstorm_doll>, [<gct_ores:creepy_wither_doll>, <ore:coreEpic> * 2, <ore:blockInsaniumEssence>, <ore:blockCommand>], 61728395, 3);
addFusionRecipe(<minecraft:barrier> * 4, [<ore:blockGlass> * 4, <ore:bedrock> * 3, <ore:nuggetCosmilite> * 3], 2500000, 3);
addFusionRecipe(<extendedcrafting:material:14>, [<extendedcrafting:material:2>, <ore:ingotVibranium> * 2, <extendedcrafting:material:7> * 2], 640, 0);
addFusionRecipe(<extendedcrafting:material:15>, [<extendedcrafting:material:2>, <ore:ingotFusionMatrix> * 2, <extendedcrafting:material:7> * 2], 12800, 1);
addFusionRecipe(<extendedcrafting:material:16>, [<extendedcrafting:material:2>, <ore:ingotBalancedMatrix> * 2, <extendedcrafting:material:7> * 2], 256000, 2);
addFusionRecipe(<extendedcrafting:material:17>, [<extendedcrafting:material:2>, <ore:ingotRadiationMatrix> * 2, <extendedcrafting:material:7> * 2], 5120000, 3);
addFusionRecipe(<extendedcrafting:material:18>, [<extendedcrafting:material:2>, <ore:ingotCrystaltine> * 2, <extendedcrafting:material:7> * 2], 20480000, 3);
addFusionRecipe(<godagglomerationplate:godagglomerationplate>, [<ore:ingotMythsteel> * 4, <ore:ingotCosmilite> * 4, <ore:ingotOrichalcosReversed> * 4, <ore:ingotBotanical> * 2, <ore:blockMana> * 2], 120000000, 3);
addFusionRecipe(<additions:chaotic_crystal_gem>, [<ore:blockChaosShard>, <ore:gemTerrestrial> * 2, <gct_ores:shalloite> * 2], 5242880, 3);
addFusionRecipe(<additions:stormy_crystal_gem>, [<ore:blockStormyShard>, <ore:gemTerrestrial> * 2, <gct_ores:shalloite> * 2], 5242880, 3);
addFusionRecipe(<contenttweaker:chaotic_energy_core>, [<draconicevolution:draconic_energy_core>, <draconicevolution:chaos_shard:1> * 4, <ore:blockRedstone> * 4], 40000000, 2);
addFusionRecipe(<avaritia:extreme_crafting_table>, [<extendedcrafting:table_ultimate>, <ore:blockCrystalMatrix> * 2, <ore:ingotCrystalMatrix> * 2, <ore:coreExcellent> * 2, <additions:ancient_tome_fragment> * 2], 4000000, 1);
addFusionRecipe(<additions:blueprint_tactic>, [<additions:blueprint>, <ore:ingotDraconium> * 4], 20000, 0);
addFusionRecipe(<additions:blueprint_tinkering>, [<additions:blueprint>, <ore:ingotWitherium> * 4], 20000, 0);
addFusionRecipe(<additions:electronium_ingot>, [<ore:ingotFusionMatrix>, <ore:ingotElectrumFlux> * 4, <ore:ingotGelidEnderium> * 4], 500000, 0);
addFusionRecipe(<additions:creative_shard>, [<ore:coreChaotic>, <ore:ingotCosmilite> * 4, <ore:dustTime>, <additions:bounty_hunter_medal>, <additions:ancient_tome_page> * 2], 10737418, 3);
addFusionRecipe(<packageddraconic:fusion_crafter>, [<draconicevolution:fusion_crafting_core>, <ore:ingotDraconiumAwakened> * 2, <ore:coreAwakened>, <ore:dragonEgg>, <ore:netherStar>, <ore:enderpearl> * 2, <ore:pearlEnderEye> * 2, <packagedauto:me_package_component>], 2500000, 1);
addFusionRecipe(<gct_aby:shoggy_slime_purified>, [<gct_aby:shoggy_slime>, <ore:slimecrystalGod> * 8], 565800000, 4);
