/*
 * This script is created for the GreedyCraft Tweaks by mc_Edwin.
 */

#priority 50
#loader crafttweaker reloadable

import crafttweaker.oredict.IOreDictEntry;
import crafttweaker.item.IItemStack;
import crafttweaker.data.IData;
import crafttweaker.item.IIngredient;
import crafttweaker.liquid.ILiquidStack;

import mods.modularmachinery.RecipePrimer;
import mods.modularmachinery.RecipeBuilder;
import mods.modularmachinery.RecipeCheckEvent;
import mods.modularmachinery.FactoryRecipeStartEvent;
import mods.modularmachinery.FactoryRecipeTickEvent;
import mods.modularmachinery.FactoryRecipeFinishEvent;
import mods.modularmachinery.RecipeModifierBuilder;
import mods.modularmachinery.RecipeAdapterBuilder;
import mods.modularmachinery.MMEvents;
import mods.modularmachinery.ControllerGUIRenderEvent;
import mods.modularmachinery.IMachineController;
import mods.modularmachinery.SmartInterfaceData;
import mods.modularmachinery.MachineModifier;
import mods.modularmachinery.MachineTickEvent;
import mods.modularmachinery.SmartInterfaceType;
import mods.modularmachinery.FactoryRecipeThread;
import mods.modularmachinery.MachineUpgradeBuilder;
import mods.modularmachinery.MachineUpgradeHelper;

import mods.ctutils.utils.Math;
import mods.jei.JEI;

MachineModifier.setMaxThreads("loot_creater", 4);
MachineModifier.setMaxParallelism("loot_creater", 256);
MachineModifier.setInternalParallelism("loot_creater", 1);

MachineModifier.addCoreThread("loot_creater", FactoryRecipeThread.createCoreThread("精华收集模块")
    .addRecipe("essence_generation_essenceInferium")
    .addRecipe("essence_generation_essencePrudentium")
    .addRecipe("essence_generation_essenceIntermedium")
    .addRecipe("essence_generation_essenceSuperium")
    .addRecipe("essence_generation_essenceSupremium")
    .addRecipe("essence_generation_essenceInsanium")
    .addRecipe("essence_generation_essenceExtremium")
    .addRecipe("essence_generation_essenceGodlikeum")
    .addRecipe("essence_generation_essenceNonenium")
);

$expand IMachineController$getEssence() as long {
    if (!isNull(this.customData.essence)) {
        return this.customData.essence as long;
    } else {
        return 0 as long;
    }
}

$expand IMachineController$setEssence(amount as long) {
    this.customData = this.customData.update({essence : amount as long});
}

$expand IMachineController$addEssence(amount as long) {
    this.setEssence(this.getEssence() + amount as long);
}

$expand IMachineController$removeEssence(amount as long) {
    this.setEssence(this.getEssence() - amount as long);
}

MMEvents.onControllerGUIRender("loot_creater", function(event as ControllerGUIRenderEvent) {
    var info as string[] = [
        "§a///战利品扫荡机控制面板///", 
        "§a机器名称：§eLV4 - 战利品扫荡机",
        "§a精华储存：§e" + event.controller.getEssence() + "点"
    ];
    event.extraInfo = info;
});

val essenceList as long[IOreDictEntry] = {
    <ore:essenceInferium> : 1,
    <ore:essencePrudentium> : 1.0E1 as long,
    <ore:essenceIntermedium> : 1.0E2 as long,
    <ore:essenceSuperium> : 1.0E3 as long,
    <ore:essenceSupremium> : 1.0E4 as long,
    <ore:essenceInsanium> : 1.0E5 as long,
    <ore:essenceExtremium> : 1.0E6 as long,
    <ore:essenceGodlikeum> : 1.0E7 as long,
    <ore:essenceNonenium> : 1.0E8 as long
};

for essence in essenceList {
    RecipeBuilder.newBuilder("essence_generation_" + essence.name, "loot_creater", 1)
        .addItemInput(essence)
        .setParallelized(false)
        .addFactoryFinishHandler(function(event as FactoryRecipeFinishEvent) {
            event.controller.addEssence(essenceList[essence] as long);
        })
        .addRecipeTooltip("增加" + essenceList[essence] + "点精华值")
        .setThreadName("精华收集模块")
        .build();
}

var StainlessUpgrade as MachineUpgradeBuilder = MachineUpgradeBuilder.newBuilder("stainless_loot", "不锈钢扫荡升级", 1, 1);
StainlessUpgrade.addCompatibleMachines("loot_creater");
StainlessUpgrade.addDescriptions("§b使战利品扫荡机拥有产出不锈钢阶段战利品的能力");
StainlessUpgrade.buildAndRegister();
MachineUpgradeHelper.addFixedUpgrade(<additions:upgrade_stainless_steel>, "stainless_loot");

var DurasteelUpgrade as MachineUpgradeBuilder = MachineUpgradeBuilder.newBuilder("durasteel_loot", "耐钢扫荡升级", 1, 1);
DurasteelUpgrade.addCompatibleMachines("loot_creater");
DurasteelUpgrade.addDescriptions("§b使战利品扫荡机拥有产出耐钢阶段战利品的能力");
DurasteelUpgrade.buildAndRegister();
MachineUpgradeHelper.addFixedUpgrade(<additions:upgrade_durasteel>, "durasteel_loot");

var AeonsteelUpgrade as MachineUpgradeBuilder = MachineUpgradeBuilder.newBuilder("aeonsteel_loot", "恒钢扫荡升级", 1, 1);
AeonsteelUpgrade.addCompatibleMachines("loot_creater");
AeonsteelUpgrade.addDescriptions("§b使战利品扫荡机拥有产出恒钢阶段战利品的能力");
AeonsteelUpgrade.buildAndRegister();
MachineUpgradeHelper.addFixedUpgrade(<additions:upgrade_aeonsteel>, "aeonsteel_loot");

var ChromasteelUpgrade as MachineUpgradeBuilder = MachineUpgradeBuilder.newBuilder("chromasteel_loot", "炫钢扫荡升级", 1, 1);
ChromasteelUpgrade.addCompatibleMachines("loot_creater");
ChromasteelUpgrade.addDescriptions("§b使战利品扫荡机拥有产出炫钢阶段战利品的能力");
ChromasteelUpgrade.buildAndRegister();
MachineUpgradeHelper.addFixedUpgrade(<additions:upgrade_chromasteel>, "chromasteel_loot");

var CosmiliteUpgrade as MachineUpgradeBuilder = MachineUpgradeBuilder.newBuilder("cosmilite_loot", "寰宇扫荡升级", 1, 1);
CosmiliteUpgrade.addCompatibleMachines("loot_creater");
CosmiliteUpgrade.addDescriptions("§b使战利品扫荡机拥有产出寰宇阶段战利品的能力");
CosmiliteUpgrade.buildAndRegister();
MachineUpgradeHelper.addFixedUpgrade(<additions:upgrade_cosmilite>, "cosmilite_loot");

var FinalliumUpgrade as MachineUpgradeBuilder = MachineUpgradeBuilder.newBuilder("finallium_loot", "终焉扫荡升级", 1, 1);
FinalliumUpgrade.addCompatibleMachines("loot_creater");
FinalliumUpgrade.addDescriptions("§b使战利品扫荡机拥有产出终焉阶段战利品的能力");
FinalliumUpgrade.buildAndRegister();
MachineUpgradeHelper.addFixedUpgrade(<additions:upgrade_finallium>, "finallium_loot");

var WaviteUpgrade as MachineUpgradeBuilder = MachineUpgradeBuilder.newBuilder("wavite_loot", "波动扫荡升级", 1, 1);
WaviteUpgrade.addCompatibleMachines("loot_creater");
WaviteUpgrade.addDescriptions("§b使战利品扫荡机拥有产出波动阶段战利品的能力");
WaviteUpgrade.buildAndRegister();
MachineUpgradeHelper.addFixedUpgrade(<additions:upgrade_wavite>, "wavite_loot");

function createLootRecipe(license as string, consume as IItemStack[], output as IItemStack[], time as int, essence as long, priority as int) {
    val licenseMap as string[string] = {
        "stainless_loot" : "不锈钢扫荡升级",
        "durasteel_loot" : "耐钢扫荡升级",
        "aeonsteel_loot" : "恒钢扫荡升级",
        "chromasteel_loot" : "炫钢扫荡升级",
        "cosmilite_loot" : "寰宇扫荡升级",
        "finallium_loot" : "终焉扫荡升级",
        "wavite_loot" : "波动扫荡升级"
    };
    var builder as RecipePrimer = RecipeBuilder.newBuilder("loot_consume" + consume[0].definition.id + consume[0].metadata + "_" + priority, "loot_creater", time * 20, priority);
    for input in consume {
        builder.addItemInput(input);
    }
    for output in output {
        builder.addItemOutput(output);
    }
    builder.addFluidPerTickInput(<liquid:lifeessence> * 20);
    builder.addEnergyPerTickInput(128000);
    builder.addPreCheckHandler(function(event as RecipeCheckEvent) {
        if (!event.controller.hasMachineUpgrade(license)) {
            event.setFailed("需要安装" + licenseMap[license]);
        }
    });
    builder.addFactoryPreTickHandler(function(event as FactoryRecipeTickEvent) {
        var parallelism as int = event.activeRecipe.parallelism;
        if (essence * parallelism > event.controller.getEssence()) {
            event.setFailed(true, "精华值不足");
        }
    });
    builder.addFactoryFinishHandler(function(event as FactoryRecipeFinishEvent) {
        var parallelism as int = event.activeRecipe.parallelism;
        event.controller.removeEssence(essence * parallelism);
    });
    builder.addRecipeTooltip("§e消耗" + essence + "点精华值");
    builder.addRecipeTooltip("§a需要升级：" + licenseMap[license]);
    builder.build();
}

//时间单位是秒！！！
//盖亚1
createLootRecipe("durasteel_loot", [
    <botania:manaresource:4>
], [
    <botania:manaresource:5> * 8
], 30, 2.0E4 as long, 0);

//盖亚2
createLootRecipe("aeonsteel_loot", [
    <botania:manaresource:14>
], [
    <botania:manaresource:5> * 16,
    <botania:dice>,
    <botania:manaresource> * 12,
    <botania:manaresource:1> * 4,
    <botania:manaresource:2> * 2
], 30, 1.0E5 as long, 0);

//盖亚3
createLootRecipe("cosmilite_loot", [
    <extrabotany:material:6>
], [
    <extrabotany:treasurebox>,
    <gct_mobs:gaia_heart> * 2
], 45, 1.0E6 as long, 0);

//凋灵
createLootRecipe("durasteel_loot", [
    <minecraft:soul_sand> * 4,
    <minecraft:skull:1> * 3
], [
    <minecraft:nether_star> * 1,
    <progressivebosses:nether_star_shard> * 12
], 20, 2.0E4 as long, 0);

//末影龙
createLootRecipe("aeonsteel_loot", [
    <minecraft:end_crystal> * 4
], [
    <minecraft:dragon_egg> * 2,
    <bountifulbaubles:enderdragonscale>
], 25, 6.0E4 as long, 0);

//毁灭者
createLootRecipe("durasteel_loot", [
    <defiledlands:calling_stone>
], [
    <defiledlands:umbrium_ingot> * 12,
    <defiledlands:essence_destroyer> * 8
], 20, 2.0E4 as long, 0);

//悼亡者
createLootRecipe("aeonsteel_loot", [
    <defiledlands:idol_sorrow>
], [
    <defiledlands:scarlite> * 8,
    <defiledlands:essence_mourner> * 8
], 30, 1.0E5 as long, 1);

//悼亡者II
createLootRecipe("chromasteel_loot", [
    <defiledlands:idol_sorrow>
], [
    <defiledlands:scarlite> * 8,
    <defiledlands:essence_mourner> * 8,
    <additions:undead_essence> * 4
], 30, 1.0E5 as long, 0);

//死神
createLootRecipe("wavite_loot", [
    <additions:final_scythe>
], [
    <additions:zomril_ingot> * 2
], 30, 1.5E7 as long, 0);

//滑行者
createLootRecipe("durasteel_loot", [
    <additions:slider_gem>
], [
    <additions:soul_of_slider> * 30
], 40, 5.5E4 as long, 0);

//武神女王
createLootRecipe("durasteel_loot", [
    <tinkersaether:valkyrie_ingot>
], [
    <additions:gem_of_valkyrie> * 20
], 40, 2.5E5 as long, 0);

//烈阳巨魔
createLootRecipe("durasteel_loot", [
    <additions:apollonium_ingot>,
    <additions:cryonic_artifact>
], [
    <additions:sun_crystal> * 20
], 40, 3.0E5 as long, 0);

//天启立方
createLootRecipe("chromasteel_loot", [
    <gct_mobs:apocalypse_ruin>
], [
    <gct_mobs:apocalypsium_scrap> * 20
], 30, 2.0E5 as long, 0);

//混沌守卫
createLootRecipe("cosmilite_loot", [
    <draconicevolution:chaos_shard>
], [
    <draconicevolution:chaos_shard> * 6,
    <contenttweaker:chaos_heart> * 1
], 40, 1.0E6 as long, 0);

//凋灵风暴
createLootRecipe("cosmilite_loot", [
    <gct_ores:creepy_witherstorm_doll>
], [
    <gct_ores:stormy_shard> * 5,
    <ageofminecraft:withered_nether_star> * 1,
    <additions:withered_nether_star_shard> * 2
], 40, 2.0E6 as long, 0);

//哨兵之心
createLootRecipe("cosmilite_loot", [
    <gct_ores:senterian_builder_lab>
], [
    <additions:dullium_ingot> * 15
], 30, 9.0E5 as long, 0);

//恐怖泥炭木乃伊
createLootRecipe("finallium_loot", [
    <thebetweenlands:mummy_bait>
], [
    <additions:bone_shard> * 20,
    <thebetweenlands:shimmer_stone> * 2
], 30, 4.5E6 as long, 0);

//原始恶意
createLootRecipe("finallium_loot", [
    <additions:malevolencite_ingot>
], [
    <additions:demon_shard> * 6
], 40, 1.0E7 as long, 0);

//虚域
createLootRecipe("finallium_loot", [
    <additions:eldritch_steel_ingot>
], [
    <additions:eldritch_slime> * 10,
    <additions:corruptium_ingot> * 3
], 45, 7.0E6 as long, 0);

//至暗之日
createLootRecipe("cosmilite_loot", [
    <additions:gloomy_passport>
], [
    <additions:darkest_core> * 15
], 30, 1.0E6 as long, 0);

//苍狼
createLootRecipe("cosmilite_loot", [
    <minecraft:spawn_egg>.withTag({EntityTag: {id: "thaumadditions:blue_wolf"}})
], [
    <thaumadditions:zeith_fur> * 2
], 40, 1.2E7 as long, 0);

//污泥威胁
createLootRecipe("finallium_loot", [
    <additions:dirtshape>
], [
    <additions:dirtshape> * 6
], 40, 4.0E6 as long, 0);