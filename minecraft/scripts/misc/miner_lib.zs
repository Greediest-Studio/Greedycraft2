/*
I'm gonna give you everything ~
ideal world's theory ~
over that end of the world ~
最高の愛の中で ~
I'm gonna give you everything ~
ideal world's theory ~
over that end of the world ~
change my word, further away ~
*/

#priority 5000

import crafttweaker.oredict.IOreDictEntry;
import crafttweaker.item.IItemStack;
import crafttweaker.data.IData;
import crafttweaker.item.IIngredient;
import crafttweaker.liquid.ILiquidStack;

import mods.modularmachinery.IMachineController;
import mods.modularmachinery.MachineModifier;
import mods.modularmachinery.RecipeModifierBuilder;
import mods.modularmachinery.MachineUpgradeBuilder;
import mods.modularmachinery.MachineUpgradeHelper;
import mods.gctweaker.oreOutput;

global BASIC as string = "basic";
global STAINLESS as string = "miner_stainless_upg";
global DURASTEEL as string = "miner_durasteel_upg";
global AEONSTEEL as string = "miner_aeonsteel_upg";
global CHROMASTEEL as string = "miner_chromasteel_upg";
global COSMILITE as string = "miner_cosmilite_upg";
global FINALLIUM as string = "miner_finallium_upg";
global WAVITE as string = "miner_wavite_upg";

static upgradeList as string[] = [BASIC,STAINLESS,DURASTEEL,AEONSTEEL,CHROMASTEEL,COSMILITE,FINALLIUM,WAVITE];

function getParallelism(ctrl as IMachineController) as int {
    var parallel = 1;
    parallel += ctrl.getBlocksInPattern(<modularmachinery:blockparallelcontroller:0>) * 4;
    parallel += ctrl.getBlocksInPattern(<modularmachinery:blockparallelcontroller:5>) * 8;
    parallel += ctrl.getBlocksInPattern(<modularmachinery:blockparallelcontroller:1>) * 16;
    parallel += ctrl.getBlocksInPattern(<modularmachinery:blockparallelcontroller:6>) * 32;
    parallel += ctrl.getBlocksInPattern(<modularmachinery:blockparallelcontroller:2>) * 64;
    parallel += ctrl.getBlocksInPattern(<modularmachinery:blockparallelcontroller:7>) * 128;
    parallel += ctrl.getBlocksInPattern(<modularmachinery:blockparallelcontroller:3>) * 256;
    parallel += ctrl.getBlocksInPattern(<modularmachinery:blockparallelcontroller:8>) * 512;
    parallel += ctrl.getBlocksInPattern(<modularmachinery:blockparallelcontroller:4>) * 1024;
    parallel += ctrl.getBlocksInPattern(<modularmachinery:blockparallelcontroller:9>) * 2048;
    return parallel;
}

function upgradeTooltip(o as oreOutput) as string {
    val u = o.upgrade;
    if (u == BASIC) {
        return "§a无需采掘升级";
    } else if (u == STAINLESS) {
        return "§a需求：不锈钢采掘升级";
    } else if (u == DURASTEEL) {
        return "§a需求：耐钢采掘升级";
    } else if (u == AEONSTEEL) {
        return "§a需求：恒钢采掘升级";
    } else if (u == CHROMASTEEL) {
        return "§a需求：炫钢采掘升级";
    } else if (u == COSMILITE) {
        return "§a需求：寰宇采掘升级";
    } else if (u == FINALLIUM) {
        return "§a需求：终焉采掘升级";
    } else if (u == WAVITE) {
        return "§a需求：波动采掘升级";
    } else {
        return "§a升级填错了喵";
    }
}

MachineUpgradeBuilder.newBuilder("efficiency_upg", "超频升级", 1, 1)
    .addDescriptions("§b降低模块化机械配方处理时间至50%\n§b提升模块化机械能耗至200%")
    .addModifier(false, "efficiency_upgrade_energy", RecipeModifierBuilder.create("modularmachinery:energy", "input", 2.0, 1, false).build())
    .addModifier(false, "efficiency_upgrade_time", RecipeModifierBuilder.create("modularmachinery:duration", "input", 0.5, 1, false).build())
    .addIncompatibleMachines("chaos_reactor")
    .addIncompatibleMachines("exp_power_generator")
    .addIncompatibleMachines("loot_power_generator")
    .addIncompatibleMachines("gas_power_generator")
    .addIncompatibleMachines("solar_power_generator")
    .buildAndRegister();

MachineUpgradeBuilder.newBuilder("energy_upg", "节能升级", 1, 1)
    .addDescriptions("§b降低模块化机械能耗至60%")
    .addModifier(false, "energy_upgrade_energy", RecipeModifierBuilder.create("modularmachinery:energy", "input", 0.6, 1, false).build())
    .buildAndRegister();

MachineUpgradeBuilder.newBuilder("generation_upg", "产能升级", 1, 1)
    .addDescriptions("§b增加模块化发电机60%的产出")
    .addModifier(false, "generation_upgrade_energy", RecipeModifierBuilder.create("modularmachinery:energy", "output", 1.6, 1, false).build())
    .addCompatibleMachines("loot_power_generator")
    .addCompatibleMachines("exp_power_generator")
    .addCompatibleMachines("chaos_reactor")
    .addCompatibleMachines("gas_power_generator")
    .addCompatibleMachines("solar_power_generator")
    .buildAndRegister();

MachineUpgradeBuilder.newBuilder(STAINLESS, "不锈钢采掘升级", 1, 1)
    .addDescriptions("§b使模块化矿机拥有采集不锈钢阶段矿物的能力\n§b矿机能耗变为原来的2倍")
    .addCompatibleMachines("simple_miner")
    .addCompatibleMachines("basic_miner")
    .addCompatibleMachines("advanced_miner")
    .addCompatibleMachines("dimensional_miner")
    .addModifier(false, "stainless_upgrade_energy", RecipeModifierBuilder.create("modularmachinery:energy", "input", 2.0, 1, false).build())
    .buildAndRegister();

MachineUpgradeBuilder.newBuilder(DURASTEEL, "耐钢采掘升级", 1, 1)
    .addDescriptions("§b使模块化矿机拥有采集耐钢阶段矿物的能力\n§b矿机能耗变为原来的4倍")
    .addCompatibleMachines("simple_miner")
    .addCompatibleMachines("basic_miner")
    .addCompatibleMachines("advanced_miner")
    .addCompatibleMachines("dimensional_miner")
    .addModifier(false, "durasteel_upgrade_energy", RecipeModifierBuilder.create("modularmachinery:energy", "input", 4.0, 1, false).build())
    .buildAndRegister();

MachineUpgradeBuilder.newBuilder(AEONSTEEL, "恒钢采掘升级", 1, 1)
    .addDescriptions("§b使模块化矿机拥有采集恒钢阶段矿物的能力\n§b矿机能耗变为原来的8倍")
    .addCompatibleMachines("basic_miner")
    .addCompatibleMachines("advanced_miner")
    .addCompatibleMachines("dimensional_miner")
    .addModifier(false, "aeonsteel_upgrade_energy", RecipeModifierBuilder.create("modularmachinery:energy", "input", 8.0, 1, false).build())
    .buildAndRegister();

MachineUpgradeBuilder.newBuilder(CHROMASTEEL, "炫钢采掘升级", 1, 1)
    .addDescriptions("§b使模块化矿机拥有采集炫钢阶段矿物的能力\n§b矿机能耗变为原来的16倍")
    .addCompatibleMachines("basic_miner")
    .addCompatibleMachines("advanced_miner")
    .addCompatibleMachines("dimensional_miner")
    .addModifier(false, "chromasteel_upgrade_energy", RecipeModifierBuilder.create("modularmachinery:energy", "input", 16.0, 1, false).build())
    .buildAndRegister();

MachineUpgradeBuilder.newBuilder(COSMILITE, "寰宇采掘升级", 1, 1)
    .addDescriptions("§b使模块化矿机拥有采集寰宇阶段矿物的能力\n§b矿机能耗变为原来的32倍")
    .addCompatibleMachines("basic_miner")
    .addCompatibleMachines("advanced_miner")
    .addCompatibleMachines("dimensional_miner")
    .addModifier(false, "cosmilite_upgrade_energy", RecipeModifierBuilder.create("modularmachinery:energy", "input", 32.0, 1, false).build())
    .buildAndRegister();

MachineUpgradeBuilder.newBuilder(FINALLIUM, "终焉采掘升级", 1, 1)
    .addDescriptions("§b使模块化矿机拥有采集终焉阶段矿物的能力\n§b矿机能耗变为原来的64倍")
    .addCompatibleMachines("basic_miner")
    .addCompatibleMachines("advanced_miner")
    .addCompatibleMachines("dimensional_miner")
    .addModifier(false, "finallium_upgrade_energy", RecipeModifierBuilder.create("modularmachinery:energy", "input", 64.0, 1, false).build())
    .buildAndRegister();

MachineUpgradeBuilder.newBuilder(WAVITE, "波动采掘升级", 1, 1)
    .addDescriptions("§b使模块化矿机拥有采集波动阶段矿物的能力\n§b矿机能耗变为原来的128倍")
    .addCompatibleMachines("basic_miner")
    .addCompatibleMachines("advanced_miner")
    .addCompatibleMachines("dimensional_miner")
    .addModifier(false, "wavite_upgrade_energy", RecipeModifierBuilder.create("modularmachinery:energy", "input", 128.0, 1, false).build())
    .buildAndRegister();

MachineUpgradeBuilder.newBuilder("miner_upg_dimoverworld", "主世界维度升级", 1, 1)
    .addDescriptions("§b使模块化矿机拥有跨维度采集主世界矿物的能力")
    .addCompatibleMachines("advanced_miner")
    .buildAndRegister();

MachineUpgradeBuilder.newBuilder("miner_upg_dimnether", "下界维度升级", 1, 1)
    .addDescriptions("§b使模块化矿机拥有跨维度采集下界矿物的能力")
    .addCompatibleMachines("advanced_miner")
    .buildAndRegister();

MachineUpgradeBuilder.newBuilder("miner_upg_dimend", "末地维度升级", 1, 1)
    .addDescriptions("§b使模块化矿机拥有跨维度采集末地矿物的能力")
    .addCompatibleMachines("advanced_miner")
    .buildAndRegister();

MachineUpgradeBuilder.newBuilder("miner_upg_multidim", "时空采掘升级", 1, 1)
    .addDescriptions("§b使模块化矿机拥有跨维度采集所有矿物的能力")
    .addCompatibleMachines("dimensional_miner")
    .buildAndRegister();

MachineUpgradeHelper.addFixedUpgrade(<additions:upgrade_efficiency>, "efficiency_upg");
MachineUpgradeHelper.addFixedUpgrade(<additions:upgrade_energy>, "energy_upg");
MachineUpgradeHelper.addFixedUpgrade(<additions:upgrade_output>, "generation_upg");

MachineUpgradeHelper.addFixedUpgrade(<additions:upgrade_dim_overworld>, "miner_upg_dimoverworld");
MachineUpgradeHelper.addFixedUpgrade(<additions:upgrade_dim_nether>, "miner_upg_dimnether");
MachineUpgradeHelper.addFixedUpgrade(<additions:upgrade_dim_end>, "miner_upg_dimend");
MachineUpgradeHelper.addFixedUpgrade(<additions:upgrade_multidim>, "miner_upg_multidim");

MachineUpgradeHelper.addFixedUpgrade(<additions:upgrade_stainless_steel>, STAINLESS);
MachineUpgradeHelper.addFixedUpgrade(<additions:upgrade_durasteel>, DURASTEEL);
MachineUpgradeHelper.addFixedUpgrade(<additions:upgrade_aeonsteel>, AEONSTEEL);
MachineUpgradeHelper.addFixedUpgrade(<additions:upgrade_chromasteel>, CHROMASTEEL);
MachineUpgradeHelper.addFixedUpgrade(<additions:upgrade_cosmilite>, COSMILITE);
MachineUpgradeHelper.addFixedUpgrade(<additions:upgrade_finallium>, FINALLIUM);
MachineUpgradeHelper.addFixedUpgrade(<additions:upgrade_wavite>, WAVITE);

//主世界 基础级 (String dimName, int dimId, String upgrade, IItemStack ore, int amount, float chance)
oreOutput.create("主世界",0,BASIC,<minecraft:iron_ore>,1,0.03);
oreOutput.create("主世界",0,BASIC,<minecraft:gold_ore>,1,0.02);
oreOutput.create("主世界",0,BASIC,<thermalfoundation:ore>,1,0.025);
oreOutput.create("主世界",0,BASIC,<thermalfoundation:ore:1>,1,0.025);
oreOutput.create("主世界",0,BASIC,<thermalfoundation:ore:2>,1,0.02);
oreOutput.create("主世界",0,BASIC,<thermalfoundation:ore:3>,1,0.02);
oreOutput.create("主世界",0,BASIC,<thermalfoundation:ore:4>,1,0.035);
oreOutput.create("主世界",0,BASIC,<thermalfoundation:ore:5>,1,0.02);
oreOutput.create("主世界",0,BASIC,<thermalfoundation:ore:6>,1,0.005);
oreOutput.create("主世界",0,BASIC,<thermalfoundation:ore:7>,1,0.002);
oreOutput.create("主世界",0,BASIC,<actuallyadditions:block_misc:3>,1,0.015);
oreOutput.create("主世界",0,BASIC,<additions:chromium_ore>,1,0.005);
oreOutput.create("主世界",0,BASIC,<mekanism:oreblock>,1,0.015);
oreOutput.create("主世界",0,BASIC,<additions:zinc_ore>,1,0.02);
oreOutput.create("主世界",0,BASIC,<divinerpg:rupee_ore>,1,0.01);
oreOutput.create("主世界",0,BASIC,<divinerpg:realmite_ore>,1,0.01);
oreOutput.create("主世界",0,BASIC,<divinerpg:arlemite_ore>,1,0.008);
oreOutput.create("主世界",0,BASIC,<minecraft:coal>,1,0.04);
oreOutput.create("主世界",0,BASIC,<thermalfoundation:material:893>,1,0.04);
oreOutput.create("主世界",0,BASIC,<minecraft:redstone>,1,0.045);
oreOutput.create("主世界",0,BASIC,<minecraft:dye:4>,1,0.035);
oreOutput.create("主世界",0,BASIC,<minecraft:diamond>,1,0.008);
oreOutput.create("主世界",0,BASIC,<minecraft:emerald>,1,0.003);
//主世界 不锈钢级
oreOutput.create("主世界",0,STAINLESS,<astralsorcery:blockmarble>,1,0.03);
oreOutput.create("主世界",0,STAINLESS,<netherex:basalt>,1,0.03);
oreOutput.create("主世界",0,STAINLESS,<minecraft:obsidian>,1,0.02);
oreOutput.create("主世界",0,STAINLESS,<astralsorcery:blockcustomore:1>,1,0.008);
oreOutput.create("主世界",0,STAINLESS,<appliedenergistics2:material>,1,0.02);
oreOutput.create("主世界",0,STAINLESS,<appliedenergistics2:material:1>,1,0.006);
oreOutput.create("主世界",0,STAINLESS,<mysticalagriculture:crafting:5>,1,0.04);
oreOutput.create("主世界",0,STAINLESS,<additions:experience_ingot>,1,0.04);
oreOutput.create("主世界",0,STAINLESS,<mysticalagriculture:crafting>,1,0.04);
oreOutput.create("主世界",0,STAINLESS,<thermalfoundation:material:772>,1,0.015);
oreOutput.create("主世界",0,STAINLESS,<minecraft:flint>,1,0.02);
oreOutput.create("主世界",0,STAINLESS,<minecraft:quartz>,1,0.02);
oreOutput.create("主世界",0,STAINLESS,<astralsorcery:itemcraftingcomponent>,1,0.01);
//主世界 耐钢级
oreOutput.create("主世界",0,DURASTEEL,<additions:manganese_ore>,1,0.03);
oreOutput.create("主世界",0,DURASTEEL,<nuclearcraft:ore:7>,1,0.025);
oreOutput.create("主世界",0,DURASTEEL,<additions:aqualite_ore>,1,0.015);
oreOutput.create("主世界",0,DURASTEEL,<additions:aeroite_ore>,1,0.02);
oreOutput.create("主世界",0,DURASTEEL,<thaumcraft:ore_cinnabar>,1,0.03);
oreOutput.create("主世界",0,DURASTEEL,<abyssalcraft:abyore>,1,0.015);
oreOutput.create("主世界",0,DURASTEEL,<journey:shadiumore>,1,0.008);
oreOutput.create("主世界",0,DURASTEEL,<journey:luniumore>,1,0.008);
oreOutput.create("主世界",0,DURASTEEL,<taiga:meteorite_block>,1,0.006);
oreOutput.create("主世界",0,DURASTEEL,<taiga:meteoritecobble_block>,1,0.01);
oreOutput.create("主世界",0,DURASTEEL,<tiths:ore_broken_bedrock>,1,0.015);
//主世界 恒钢级
oreOutput.create("主世界",0,AEONSTEEL,<taiga:karmesine_ore>,1,0.02);
oreOutput.create("主世界",0,AEONSTEEL,<taiga:jauxum_ore>,1,0.02);
oreOutput.create("主世界",0,AEONSTEEL,<taiga:ovium_ore>,1,0.02);
oreOutput.create("主世界",0,AEONSTEEL,<taiga:duranite_ore>,1,0.016);
oreOutput.create("主世界",0,AEONSTEEL,<taiga:vibranium_ore>,1,0.005);
oreOutput.create("主世界",0,AEONSTEEL,<additions:cytosinite_ore>,1,0.008);
oreOutput.create("主世界",0,AEONSTEEL,<taiga:eezo_ore>,1,0.02);
oreOutput.create("主世界",0,AEONSTEEL,<draconicevolution:draconium_dust>,1,0.004);
oreOutput.create("主世界",0,AEONSTEEL,<gct_ores:witherium_dust>,1,0.004);
oreOutput.create("主世界",0,AEONSTEEL,<taiga:dilithium_crystal>,1,0.035);
oreOutput.create("主世界",0,AEONSTEEL,<mekanism:fluoriteclump>,1,0.02);
oreOutput.create("主世界",0,AEONSTEEL,<thaumcraft:ore_amber>,1,0.03);
//主世界 炫钢级
oreOutput.create("主世界",0,CHROMASTEEL,<additions:cryonium_ore>,1,0.005);
oreOutput.create("主世界",0,CHROMASTEEL,<additions:snowingium_ore>,1,0.005);
oreOutput.create("主世界",0,CHROMASTEEL,<biomesoplenty:gem:1>,1,0.003);
oreOutput.create("主世界",0,CHROMASTEEL,<biomesoplenty:gem:2>,1,0.003);
oreOutput.create("主世界",0,CHROMASTEEL,<biomesoplenty:gem:3>,1,0.003);
oreOutput.create("主世界",0,CHROMASTEEL,<biomesoplenty:gem:4>,1,0.003);
oreOutput.create("主世界",0,CHROMASTEEL,<biomesoplenty:gem:5>,1,0.003);
oreOutput.create("主世界",0,CHROMASTEEL,<biomesoplenty:gem:6>,1,0.003);
//主世界 寰宇级
oreOutput.create("主世界",0,COSMILITE,<additions:oceanium_ore>,1,0.0015);
oreOutput.create("主世界",0,COSMILITE,<additions:harcadium_ore>,1,0.002);
oreOutput.create("主世界",0,COSMILITE,<tiths:redins>,1,0.002);
oreOutput.create("主世界",0,COSMILITE,<tiths:corundum>,1,0.002);
oreOutput.create("主世界",0,COSMILITE,<tiths:pyrophyllite>,1,0.002);
oreOutput.create("主世界",0,COSMILITE,<tiths:opal>,1,0.002);
oreOutput.create("主世界",0,COSMILITE,<tiths:spinel>,1,0.002);
oreOutput.create("主世界",0,COSMILITE,<tiths:tourmaline>,1,0.002);
oreOutput.create("主世界",0,COSMILITE,<tiths:cordierite>,1,0.002);
oreOutput.create("主世界",0,COSMILITE,<tiths:prehnite>,1,0.002);
//主世界 终焉级
oreOutput.create("主世界",0,FINALLIUM,<sakura:sakura_diamond>,1,0.005);
oreOutput.create("主世界",0,FINALLIUM,<additions:swinium_ore>,1,0.009);
oreOutput.create("主世界",0,FINALLIUM,<additions:vanadium_ore>,1,0.007);
oreOutput.create("主世界",0,FINALLIUM,<additions:gallium_ore>,1,0.006);
oreOutput.create("主世界",0,FINALLIUM,<additions:indium_ore>,1,0.0045);
oreOutput.create("主世界",0,FINALLIUM,<additions:rubium_ore>,1,0.003);
oreOutput.create("主世界",0,FINALLIUM,<additions:cestium_ore>,1,0.0015);
oreOutput.create("主世界",0,FINALLIUM,<additions:fraxinium_ore>,1,0.0015);
oreOutput.create("主世界",0,FINALLIUM,<nuclearcraft:ore:5>,1,0.01);
oreOutput.create("主世界",0,FINALLIUM,<nuclearcraft:ore:6>,1,0.007);
oreOutput.create("主世界",0,FINALLIUM,<nuclearcraft:ore:3>,1,0.005);
oreOutput.create("主世界",0,FINALLIUM,<mekanism:oreblock:5>,1,0.015);

//下界 基础级
oreOutput.create("下界",-1,BASIC,<minecraft:soul_sand>,1,0.1);
oreOutput.create("下界",-1,BASIC,<minecraft:magma>,1,0.03);
oreOutput.create("下界",-1,BASIC,<minecraft:quartz>,1,0.06);
oreOutput.create("下界",-1,BASIC,<betternether:cincinnasite>,1,0.06);
oreOutput.create("下界",-1,BASIC,<netherex:rime_crystal>,1,0.04);
oreOutput.create("下界",-1,BASIC,<minecraft:glowstone_dust>,1,0.06);
oreOutput.create("下界",-1,BASIC,<thermalfoundation:material:894>,1,0.03);
//下界 不锈钢级
oreOutput.create("下界",-1,STAINLESS,<tconstruct:ore>,1,0.03);
oreOutput.create("下界",-1,STAINLESS,<tconstruct:ore:1>,1,0.03);
oreOutput.create("下界",-1,STAINLESS,<divinerpg:netherite_ore>,1,0.03);
oreOutput.create("下界",-1,STAINLESS,<journey:hellstoneore>,1,0.02);
oreOutput.create("下界",-1,STAINLESS,<netherendingores:ore_nether_modded_1:4>,1,0.01);
oreOutput.create("下界",-1,STAINLESS,<rftools:dimensional_shard>,1,0.02);
oreOutput.create("下界",-1,STAINLESS,<divinerpg:bloodgem>,1,0.018);
//下界 耐钢级
oreOutput.create("下界",-1,DURASTEEL,<additions:emberstone_ore>,1,0.015);
oreOutput.create("下界",-1,DURASTEEL,<additions:netherite_scrap>,1,0.001);
oreOutput.create("下界",-1,DURASTEEL,<journey:firestoneclump>,1,0.015);
//下界 恒钢级
oreOutput.create("下界",-1,AEONSTEEL,<taiga:osram_ore>,1,0.02);
oreOutput.create("下界",-1,AEONSTEEL,<taiga:prometheum_ore>,1,0.015);
oreOutput.create("下界",-1,AEONSTEEL,<taiga:valyrium_ore>,1,0.009);
oreOutput.create("下界",-1,AEONSTEEL,<additions:thyminite_ore>,1,0.008);
oreOutput.create("下界",-1,AEONSTEEL,<taiga:tiberium_crystal>,1,0.06);
oreOutput.create("下界",-1,AEONSTEEL,<draconicevolution:draconium_dust>,1,0.004);
oreOutput.create("下界",-1,AEONSTEEL,<gct_ores:witherium_dust>,1,0.004);
//下界 炫钢级
oreOutput.create("下界",-1,CHROMASTEEL,<additions:lavarite_ore>,1,0.005);
oreOutput.create("下界",-1,CHROMASTEEL,<additions:infernium_ore>,1,0.005);
oreOutput.create("下界",-1,CHROMASTEEL,<additions:freezite_ore>,1,0.005);
//下界 寰宇级
oreOutput.create("下界",-1,COSMILITE,<additions:nether_harcadium_ore>,1,0.002);
oreOutput.create("下界",-1,COSMILITE,<tiths:lizanite>,1,0.002);
//下界 终焉级
oreOutput.create("下界",-1,FINALLIUM,<additions:lighteum_ore>,1,0.009);
oreOutput.create("下界",-1,FINALLIUM,<additions:mangisite_ore>,1,0.008);
oreOutput.create("下界",-1,FINALLIUM,<additions:oneo_ore>,1,0.007);
oreOutput.create("下界",-1,FINALLIUM,<additions:xenidium_ore>,1,0.006);
oreOutput.create("下界",-1,FINALLIUM,<additions:rapesesium_ore>,1,0.003);

//末地 基础级
oreOutput.create("末地",1,BASIC,<minecraft:ender_pearl>,1,0.08);
oreOutput.create("末地",1,BASIC,<tiths:ender_crevice_shard>,1,0.05);
//末地 不锈钢级
oreOutput.create("末地",1,STAINLESS,<minecraft:obsidian>,1,0.05);
oreOutput.create("末地",1,STAINLESS,<quark:biotite>,1,0.05);
//末地 耐钢级
oreOutput.create("末地",1,DURASTEEL,<endreborn:item_end_essence>,1,0.04);
oreOutput.create("末地",1,DURASTEEL,<thermalfoundation:material:895>,1,0.06);
oreOutput.create("末地",1,DURASTEEL,<journey:enderilliumshard>,1,0.01);
//末地 恒钢级
oreOutput.create("末地",1,AEONSTEEL,<taiga:abyssum_ore>,1,0.02);
oreOutput.create("末地",1,AEONSTEEL,<taiga:palladium_ore>,1,0.017);
oreOutput.create("末地",1,AEONSTEEL,<taiga:uru_ore>,1,0.015);
oreOutput.create("末地",1,AEONSTEEL,<taiga:aurorium_ore>,1,0.015);
oreOutput.create("末地",1,AEONSTEEL,<taiga:obsidiorite_block>,1,0.008);
oreOutput.create("末地",1,AEONSTEEL,<taiga:obsidioritecobble_block>,1,0.012);
oreOutput.create("末地",1,AEONSTEEL,<draconicevolution:draconium_dust>,1,0.02);
oreOutput.create("末地",1,AEONSTEEL,<gct_ores:witherium_dust>,1,0.02);
oreOutput.create("末地",1,AEONSTEEL,<gct_mobs:resonated_scrap>,1,0.001);
//末地 炫钢级
oreOutput.create("末地",1,CHROMASTEEL,<endreborn:block_wolframium_ore>,1,0.009);
oreOutput.create("末地",1,CHROMASTEEL,<additions:plasmarite_ore>,1,0.005);
oreOutput.create("末地",1,CHROMASTEEL,<biomesoplenty:gem>,1,0.01);
oreOutput.create("末地",1,CHROMASTEEL,<betterendforge:emerald_ice>,1,0.01);
//末地 寰宇级
oreOutput.create("末地",1,COSMILITE,<additions:titanium_ore>,1,0.0015);
oreOutput.create("末地",1,COSMILITE,<additions:end_harcadium_ore>,1,0.005);
oreOutput.create("末地",1,COSMILITE,<betterendforge:dense_emerald_ice>,1,0.005);
//末地 终焉级
oreOutput.create("末地",1,FINALLIUM,<additions:thallium_ore>,1,0.005);
oreOutput.create("末地",1,FINALLIUM,<additions:manarium_ore>,1,0.01);
oreOutput.create("末地",1,FINALLIUM,<additions:soilium_ore>,1,0.008);
oreOutput.create("末地",1,FINALLIUM,<additions:breakium_ore>,1,0.006);
oreOutput.create("末地",1,FINALLIUM,<additions:fenzium_ore>,1,0.012);
oreOutput.create("末地",1,FINALLIUM,<additions:sissidium_ore>,1,0.0045);
oreOutput.create("末地",1,FINALLIUM,<additions:technetium_ore>,1,0.003);
oreOutput.create("末地",1,FINALLIUM,<moretcon:oregravitonium>,1,0.02);
oreOutput.create("末地",1,FINALLIUM,<betterendforge:ancient_emerald_ice>,1,0.0025);
//末地 波动级
oreOutput.create("末地",1,WAVITE,<additions:breedum_ore>,1,0.0015);

//暮色森林 基础级
oreOutput.create("暮色森林",7,BASIC,<twilightforest:torchberries>,1,0.06);
oreOutput.create("暮色森林",7,BASIC,<twilightforest:raven_feather>,1,0.06);
oreOutput.create("暮色森林",7,BASIC,<twilightforest:steeleaf_ingot>,1,0.04);
oreOutput.create("暮色森林",7,BASIC,<twilightforest:naga_scale>,1,0.03);
oreOutput.create("暮色森林",7,BASIC,<twilightforest:liveroot>,1,0.06);
oreOutput.create("暮色森林",7,BASIC,<twilightforest:borer_essence>,1,0.06);
oreOutput.create("暮色森林",7,BASIC,<twilightforest:alpha_fur>,1,0.03);
//暮色森林 不锈钢级
oreOutput.create("暮色森林",7,STAINLESS,<additions:fiery_ore>,1,0.04);
oreOutput.create("暮色森林",7,STAINLESS,<additions:knigh_metal_ore>,1,0.04);
oreOutput.create("暮色森林",7,STAINLESS,<twilightforest:giant_cobblestone>,1,0.03);
oreOutput.create("暮色森林",7,STAINLESS,<twilightforest:giant_log>,1,0.03);
oreOutput.create("暮色森林",7,STAINLESS,<twilightforest:giant_leaves>,1,0.04);
oreOutput.create("暮色森林",7,STAINLESS,<twilightforest:giant_obsidian>,1,0.005);
//暮色森林 耐钢级
oreOutput.create("暮色森林",7,DURASTEEL,<moretcon:nuggetpenguinite>,1,0.01);
//暮色森林 炫钢级
oreOutput.create("暮色森林",7,CHROMASTEEL,<additions:canopium_ore>,1,0.005);

//天境 基础级
oreOutput.create("天境",173,BASIC,<aether_legacy:ambrosium_shard>,1,0.06);
oreOutput.create("天境",173,BASIC,<aether_legacy:icestone>, 1, 0.15);
//天境 不锈钢级
oreOutput.create("天境",173,STAINLESS,<aether_legacy:gravitite_ore>,1,0.01);
oreOutput.create("天境",173,STAINLESS,<aether_legacy:zanite_gemstone>,1,0.035);
//天境 耐钢级
oreOutput.create("天境",173,DURASTEEL,<additions:asgardium_ore>,1,0.02);
oreOutput.create("天境",173,DURASTEEL,<aether_legacy:golden_amber>,1,0.01);
//天境 恒钢级
oreOutput.create("天境",173,AEONSTEEL,<gct_mobs:gravity_scrap>,1,0.001);
oreOutput.create("天境",173,AEONSTEEL,<thermalfoundation:material:1026>,1,0.01);
//天境 炫钢级
oreOutput.create("天境",173,CHROMASTEEL,<additions:aetherium_ore>,1,0.005);
//天境 终焉级
oreOutput.create("天境",173,FINALLIUM,<additions:cloudite_ore>,1,0.008);
oreOutput.create("天境",173,FINALLIUM,<additions:molybdenum_ore>,1,0.006);

//深渊荒原 基础级
oreOutput.create("深渊荒原",50,BASIC,<abyssalcraft:coralium>,1,0.08);
oreOutput.create("深渊荒原",50,BASIC,<thermalfoundation:material:772>,1,0.06);
oreOutput.create("深渊荒原",50,BASIC,<abyssalcraft:cobblestone:4>,1,0.1);
//深渊荒原 不锈钢级
oreOutput.create("深渊荒原",50,STAINLESS,<abyssalcraft:abylcorore>,1,0.03);
oreOutput.create("深渊荒原",50,STAINLESS,<abyssalcraft:cpearl>,1,0.02);
//深渊荒原 恒钢级
oreOutput.create("深渊荒原",50,AEONSTEEL,<additions:guaninite_ore>,1,0.012);
//深渊荒原 终焉级
oreOutput.create("深渊荒原",50,FINALLIUM,<additions:stripium_ore>,1,0.009);
oreOutput.create("深渊荒原",50,FINALLIUM,<additions:ttwo_ore>,1,0.008);

//恐惧之地 耐钢级
oreOutput.create("恐惧之地",51,DURASTEEL,<abyssalcraft:abydreadore>,1,0.08);
oreOutput.create("恐惧之地",51,DURASTEEL,<abyssalcraft:dreadfragment>,1,0.02);
//恐惧之地 恒钢级
oreOutput.create("恐惧之地",51,AEONSTEEL,<additions:adeninite_ore>,1,0.012);
//恐惧之地 终焉级
oreOutput.create("恐惧之地",51,FINALLIUM,<additions:togrium_ore>,1,0.004);
oreOutput.create("恐惧之地",51,FINALLIUM,<additions:antimony_ore>,1,0.004);

//奥穆索 寰宇级
oreOutput.create("奥穆索",52,COSMILITE,<additions:mistium_ore>,1,0.008);
//奥穆索 终焉级
oreOutput.create("奥穆索",52,FINALLIUM,<additions:yoggleseum_ore>,1,0.007);
oreOutput.create("奥穆索",52,FINALLIUM,<additions:circlium_ore>,1,0.003);
oreOutput.create("奥穆索",52,FINALLIUM,<additions:dimesium_ore>,1,0.005);

//黑暗领域 不锈钢级
oreOutput.create("黑暗领域",53,STAINLESS,<abyssalcraft:shadowgem>,1,0.01);
//黑暗领域 寰宇级
oreOutput.create("黑暗领域",53,COSMILITE,<additions:bnightium_ore>,1,0.008);

//深暗领域 寰宇级
oreOutput.create("深暗领域",54,COSMILITE,<gct_aby:dreadiumore>,1,0.03);
oreOutput.create("深暗领域",54,COSMILITE,<gct_aby:ethauxiumore>,1,0.01);
oreOutput.create("深暗领域",54,COSMILITE,<gct_aby:saniteore>,1,0.004);

//扭曲遗址 终焉级
oreOutput.create("扭曲遗址",55,FINALLIUM,<gct_aby:azathothium_ore_complex>,1,0.01);
oreOutput.create("扭曲遗址",55,FINALLIUM,<gct_aby:nyralathotepium_ore_complex>,1,0.01);
oreOutput.create("扭曲遗址",55,FINALLIUM,<gct_aby:yogsothothium_ore_complex>,1,0.01);
oreOutput.create("扭曲遗址",55,FINALLIUM,<gct_aby:shubniggurathium_ore_complex>,1,0.01);

//冰晶雪原 基础级
oreOutput.create("冰晶雪原",425,BASIC,<divinerpg:corrupted_shards>,1,0.04);
oreOutput.create("冰晶雪原",425,BASIC,<divinerpg:divine_shards>,1,0.04);
oreOutput.create("冰晶雪原",425,BASIC,<divinerpg:jungle_shards>,1,0.04);
oreOutput.create("冰晶雪原",425,BASIC,<divinerpg:terran_shards>,1,0.04);
oreOutput.create("冰晶雪原",425,BASIC,<divinerpg:molten_shards>,1,0.04);
//冰晶雪原 耐钢级
oreOutput.create("冰晶雪原",425,DURASTEEL,<additions:iciricium_ore>,1,0.01);
//冰晶雪原 恒钢级
oreOutput.create("冰晶雪原",425,AEONSTEEL,<thermalfoundation:material:1025>,1,0.01);

//秘界 恒钢级
oreOutput.create("秘界",426,AEONSTEEL,<divinerpg:raw_arcanium>,1,0.03);

//极光幽境 不锈钢级
oreOutput.create("极光幽境",645,STAINLESS,<theaurorian:moonstoneore>,1,0.05);
oreOutput.create("极光幽境",645,STAINLESS,<theaurorian:ceruleanore>,1,0.03);
oreOutput.create("极光幽境",645,STAINLESS,<theaurorian:crystal>,1,0.03);
//极光幽境 耐钢级
oreOutput.create("极光幽境",645,DURASTEEL,<theaurorian:scrapaurorianite>,1,0.02);
oreOutput.create("极光幽境",645,DURASTEEL,<theaurorian:scrapumbra>,1,0.02);
oreOutput.create("极光幽境",645,DURASTEEL,<theaurorian:scrapcrystalline>,1,0.02);
//极光幽境 恒钢级
oreOutput.create("极光幽境",645,AEONSTEEL,<thermalfoundation:material:1027>,1,0.01);

//遗忘冰川 恒钢级
oreOutput.create("遗忘冰川",823,AEONSTEEL,<additions:chillinium_ore>,1,0.04);
oreOutput.create("遗忘冰川",823,AEONSTEEL,<additions:germanium_ore>,1,0.03);

//怒焰石林 恒钢级
oreOutput.create("怒焰石林",822,AEONSTEEL,<additions:flamium_ore>,1,0.04);
oreOutput.create("怒焰石林",822,AEONSTEEL,<additions:sorrowium_ore>,1,0.02);
oreOutput.create("怒焰石林",822,AEONSTEEL,<journey:blazium>,1,0.03);
oreOutput.create("怒焰石林",822,AEONSTEEL,<thermalfoundation:material:1024>,1,0.01);

//桉域 炫钢级
oreOutput.create("桉域",820,CHROMASTEEL,<journey:celestiumore>,1,0.03);
oreOutput.create("桉域",820,CHROMASTEEL,<journey:koriteore>,1,0.03);
oreOutput.create("桉域",820,CHROMASTEEL,<journey:mekyumore>,1,0.03);
oreOutput.create("桉域",820,CHROMASTEEL,<journey:storonore>,1,0.03);
//桉域 终焉级
oreOutput.create("桉域",820,FINALLIUM,<gct_mobs:lumixeium_dust>,1,0.01);

//噬渊 炫钢级
oreOutput.create("噬渊",821,CHROMASTEEL,<journey:flairiumore>,1,0.03);
oreOutput.create("噬渊",821,CHROMASTEEL,<journey:desore>,1,0.03);
//噬渊 终焉级
oreOutput.create("噬渊",821,CHROMASTEEL,<additions:barite_ore>,1,0.04);
oreOutput.create("噬渊",821,FINALLIUM,<gct_mobs:noxexeum_dust>,1,0.01);

//尘泥沼泽 炫钢级
oreOutput.create("尘泥沼泽",824,CHROMASTEEL,<journey:orbaditeore>,1,0.03);
oreOutput.create("尘泥沼泽",824,CHROMASTEEL,<journey:gorbitegem>,1,0.04);
//尘泥沼泽 终焉级
oreOutput.create("尘泥沼泽",824,FINALLIUM,<gct_mobs:naturaeum_dust>,1,0.01);

//迷雾丛林 寰宇级
oreOutput.create("迷雾丛林",827,COSMILITE,<additions:chloroplast_ore>,1,0.04);

//苍穹之城 寰宇级
oreOutput.create("苍穹之城",826,COSMILITE,<journey:lunitechunk>,1,0.04);
//苍穹之城 终焉级
oreOutput.create("苍穹之城",826,FINALLIUM,<gct_mobs:tonitruium_dust>,1,0.01);

//漆黑世界 炫钢级
oreOutput.create("漆黑世界",-11325,CHROMASTEEL,<additions:shadowium_ore>,1,0.02);

//失落的城市 耐钢级
oreOutput.create("失落的城市",111,DURASTEEL,<additions:limonite_ore>,1,0.03);
oreOutput.create("失落的城市",111,DURASTEEL,<additions:rosite_ore>,1,0.025);

//深空之域 寰宇级
oreOutput.create("深空之域",78,COSMILITE,<tiths:ore_halleium>,1,0.008);
oreOutput.create("深空之域",78,COSMILITE,<tiths:ore_altairium>,1,0.008);
oreOutput.create("深空之域",78,COSMILITE,<tiths:ore_tonium>,1,0.008);
oreOutput.create("深空之域",78,COSMILITE,<tiths:ore_polarium>,1,0.008);
oreOutput.create("深空之域",78,COSMILITE,<tiths:ore_hothium>,1,0.008);
oreOutput.create("深空之域",78,COSMILITE,<tiths:ore_stellarium>,1,0.004);

//虚空之地 寰宇级
oreOutput.create("虚空之地",100,COSMILITE,<minecraft:bedrock>,1,0.3);
oreOutput.create("虚空之地",100,COSMILITE,<additions:void_harcadium_ore>,1,0.1);
oreOutput.create("虚空之地",100,COSMILITE,<additions:void_ore>,1,0.02);

//无名之地 寰宇级
oreOutput.create("无名之地",101,COSMILITE,<additions:void_harcadium_ore>,1,0.15);
oreOutput.create("无名之地",101,COSMILITE,<additions:void_ore>,1,0.06);
oreOutput.create("无名之地",101,COSMILITE,<additions:adamantium_ore>,1,0.02);
//无名之地 终焉级
oreOutput.create("无名之地",101,FINALLIUM,<additions:dawnium_ore>,1,0.008);

//秩序之地 终焉级
oreOutput.create("秩序之地",102,FINALLIUM,<gct_ores:order_crystal>,1,0.0005);

//交错次元 终焉级
oreOutput.create("交错次元",20,FINALLIUM,<thebetweenlands:octine_ore>,1,0.04);
oreOutput.create("交错次元",20,FINALLIUM,<thebetweenlands:syrmorite_ore>,1,0.04);
oreOutput.create("交错次元",20,FINALLIUM,<thebetweenlands:items_misc:19>,1,0.03);
oreOutput.create("交错次元",20,FINALLIUM,<thebetweenlands:items_misc:39>,1,0.05);
oreOutput.create("交错次元",20,FINALLIUM,<thebetweenlands:items_misc:18>,1,0.08);
oreOutput.create("交错次元",20,FINALLIUM,<thebetweenlands:items_misc:14>,1,0.05);
oreOutput.create("交错次元",20,FINALLIUM,<thebetweenlands:crimson_middle_gem>,1,0.015);
oreOutput.create("交错次元",20,FINALLIUM,<thebetweenlands:green_middle_gem>,1,0.015);
oreOutput.create("交错次元",20,FINALLIUM,<thebetweenlands:aqua_middle_gem>,1,0.015);
oreOutput.create("交错次元",20,FINALLIUM,<thebetweenlands:life_crystal>,1,0.025);
//交错次元 波动级
oreOutput.create("交错次元",20,WAVITE,<additions:izumium_ore>,1,0.02);

//亚尔夫海姆 寰宇级
oreOutput.create("亚尔夫海姆",42,COSMILITE,<gct_mobs:elementium_ore>,1,0.03);
oreOutput.create("亚尔夫海姆",42,COSMILITE,<gct_mobs:terrasteel_ore>,1,0.008);
//亚尔夫海姆 终焉级
oreOutput.create("亚尔夫海姆",42,FINALLIUM,<gct_mobs:orichalcos_ore>,1,0.005);
oreOutput.create("亚尔夫海姆",42,FINALLIUM,<gct_mobs:botanical_stone>,1,0.004);

//尼福尔海姆 波动级
oreOutput.create("尼福尔海姆",43,WAVITE,<gctcore:apathy_ore>,1,0.02);

//永恒星域 寰宇级
oreOutput.create("永恒星域",80,COSMILITE,<astralsorcery:itemcraftingcomponent>,1,0.05);
oreOutput.create("永恒星域",80,COSMILITE,<additions:star_metal_ore>,1,0.04);
//永恒星域 终焉级
oreOutput.create("永恒星域",80,FINALLIUM,<additions:astralmetal_ore>,1,0.02);
oreOutput.create("永恒星域",80,FINALLIUM,<additions:nasalum_ore>,1,0.01);
oreOutput.create("永恒星域",80,FINALLIUM,<additions:lunarine_ore>,1,0.02);
//永恒星域 波动级
oreOutput.create("永恒星域",80,WAVITE,<additions:arimite_ore>,1,0.005);

//亚特兰蒂斯 寰宇级
oreOutput.create("亚特兰蒂斯",324987,COSMILITE,<additions:tanatonium_ore>,1,0.015);
oreOutput.create("亚特兰蒂斯",324987,COSMILITE,<additions:imitatium_ore>,1,0.015);
oreOutput.create("亚特兰蒂斯",324987,COSMILITE,<additions:immersed_silver_ore>,1,0.002);

//血腥裂隙 寰宇级
oreOutput.create("血腥裂隙",41,COSMILITE,<additions:blood_infused_iron_ore>,1,0.035);
oreOutput.create("血腥裂隙",41,COSMILITE,<bloodarsenal:blood_diamond>,1,0.015);
//血腥裂隙 终焉级
oreOutput.create("血腥裂隙",41,FINALLIUM,<additions:losessium_ore>,1,0.003);

//虚域 寰宇级
oreOutput.create("虚域",14676,COSMILITE,<additions:void_metal_ore>,1,0.02);
//虚域 终焉级
oreOutput.create("虚域",14676,FINALLIUM,<additions:primal_metal_ore>,1,0.01);

//腐朽之地 终焉级
oreOutput.create("腐朽之地",66,FINALLIUM,<additions:rotiron_ore>,1,0.01);
oreOutput.create("腐朽之地",66,FINALLIUM,<additions:putrallium_ore>,1,0.002);
oreOutput.create("腐朽之地",66,FINALLIUM,<erebus:materials:1>,1,0.01);
oreOutput.create("腐朽之地",66,FINALLIUM,<erebus:materials:2>,1,0.02);
oreOutput.create("腐朽之地",66,FINALLIUM,<erebus:materials:7>,1,0.02);
oreOutput.create("腐朽之地",66,FINALLIUM,<erebus:materials:47>,1,0.02);
oreOutput.create("腐朽之地",66,FINALLIUM,<erebus:materials:74>,1,0.015);

//阿图姆 终焉级
oreOutput.create("阿图姆",17,FINALLIUM,<additions:nebu_ore>,1,0.004);

//辐射废土 终焉级
oreOutput.create("辐射废土",4598,FINALLIUM,<mekanism:oreblock:5>,1,0.04);
oreOutput.create("辐射废土",4598,FINALLIUM,<additions:uranium_235_ore>,1,0.03);
oreOutput.create("辐射废土",4598,FINALLIUM,<additions:plutonium_ore>,1,0.01);
oreOutput.create("辐射废土",4598,FINALLIUM,<additions:zirconium_ore>,1,0.02);