#priority 30
#reloadable

import crafttweaker.oredict.IOreDictEntry;
import crafttweaker.item.IItemStack;
import crafttweaker.data.IData;
import crafttweaker.item.IIngredient;
import crafttweaker.liquid.ILiquidStack;

import mods.modularmachinery.RecipeBuilder;
import mods.modularmachinery.MachineUpgradeBuilder;
import mods.modularmachinery.MachineUpgradeHelper;
import mods.modularmachinery.MachineModifier;
import mods.modularmachinery.IMachineController;
import mods.modularmachinery.RecipePrimer;
import mods.modularmachinery.RecipeModifier;
import mods.modularmachinery.RecipeModifierBuilder;
import mods.modularmachinery.FactoryRecipeThread;
import mods.modularmachinery.RecipeAdapterBuilder;
import mods.modularmachinery.RecipeCheckEvent;
import mods.modularmachinery.ControllerGUIRenderEvent;
import mods.modularmachinery.MMEvents;
import mods.modularmachinery.FactoryRecipeTickEvent;
import mods.ctutils.utils.Math;

var STAINLESS as string = "miner_stainless_upg";
var DURASTEEL as string = "miner_durasteel_upg";
var AEONSTEEL as string = "miner_aeonsteel_upg";
var CHROMASTEEL as string = "miner_chromasteel_upg";
var COSMILITE as string = "miner_cosmilite_upg";
var FINALLIUM as string = "miner_finallium_upg";
var WAVITE as string = "miner_wavite_upg";

$expand RecipePrimer$addItemUpgradeOutput(item as IItemStack, upgrade as string, chance as float) as RecipePrimer {
    var STAINLESS as string = "miner_stainless_upg";
    var DURASTEEL as string = "miner_durasteel_upg";
    var AEONSTEEL as string = "miner_aeonsteel_upg";
    var CHROMASTEEL as string = "miner_chromasteel_upg";
    var COSMILITE as string = "miner_cosmilite_upg";
    var FINALLIUM as string = "miner_finallium_upg";
    var WAVITE as string = "miner_wavite_upg";
    var tooltip as string = "";
    if (upgrade == STAINLESS) {
        tooltip = "§a需求：不锈钢采掘升级";
    } else if (upgrade == DURASTEEL) {
        tooltip = "§a需求：耐钢采掘升级";
    } else if (upgrade == AEONSTEEL) {
        tooltip = "§a需求：恒钢采掘升级";
    } else if (upgrade == CHROMASTEEL) {
        tooltip = "§a需求：炫钢采掘升级";
    } else if (upgrade == COSMILITE) {
        tooltip = "§a需求：寰宇采掘升级";
    } else if (upgrade == FINALLIUM) {
        tooltip = "§a需求：终焉采掘升级";
    } else if (upgrade == WAVITE) {
        tooltip = "§a需求：波动采掘升级";
    }
    return this.addItemOutput(item).setChance(chance).addItemModifier(function(ctrl as IMachineController, item as IItemStack) as IItemStack {
        if (ctrl.hasMachineUpgrade(upgrade)) {
            return item;
        } else {
            return null;
        }
    }).setPreViewNBT({display:{Lore:[tooltip as string]}}).setIgnoreOutputCheck(true);
}

var efficiencyUpgrade as MachineUpgradeBuilder = MachineUpgradeBuilder.newBuilder("efficiency_upg", "超频升级", 1, 1);
efficiencyUpgrade.addDescriptions("§b降低模块化机械配方处理时间至50%\n§b提升模块化机械能耗至200%");
efficiencyUpgrade.addModifier(false, "efficiency_upgrade_energy", RecipeModifierBuilder.create("modularmachinery:energy", "input", 2.0, 1, false).build());
efficiencyUpgrade.addModifier(false, "efficiency_upgrade_time", RecipeModifierBuilder.create("modularmachinery:duration", "input", 0.5, 1, false).build());
efficiencyUpgrade.buildAndRegister();

var energyUpgrade as MachineUpgradeBuilder = MachineUpgradeBuilder.newBuilder("energy_upg", "节能升级", 1, 1);
energyUpgrade.addDescriptions("§b降低模块化机械能耗至60%");
energyUpgrade.addModifier(false, "energy_upgrade_energy", RecipeModifierBuilder.create("modularmachinery:energy", "input", 0.6, 1, false).build());
energyUpgrade.buildAndRegister();

var stainlessUpgrade as MachineUpgradeBuilder = MachineUpgradeBuilder.newBuilder(STAINLESS, "不锈钢采掘升级", 1, 1);
stainlessUpgrade.addDescriptions("§b使模块化矿机拥有采集不锈钢阶段矿物的能力\n§b矿机能耗变为原来的2倍");
stainlessUpgrade.addCompatibleMachines("basic_miner");
stainlessUpgrade.addCompatibleMachines("advanced_miner");
stainlessUpgrade.addCompatibleMachines("dimensional_miner");
stainlessUpgrade.addModifier(false, "stainless_upgrade_energy", RecipeModifierBuilder.create("modularmachinery:energy", "input", 2.0, 1, false).build());
stainlessUpgrade.buildAndRegister();

var durasteelUpgrade as MachineUpgradeBuilder = MachineUpgradeBuilder.newBuilder(DURASTEEL, "耐钢采掘升级", 1, 1);
durasteelUpgrade.addDescriptions("§b使模块化矿机拥有采集耐钢阶段矿物的能力\n§b矿机能耗变为原来的4倍");
durasteelUpgrade.addCompatibleMachines("basic_miner");
durasteelUpgrade.addCompatibleMachines("advanced_miner");
durasteelUpgrade.addCompatibleMachines("dimensional_miner");
durasteelUpgrade.addModifier(false, "durasteel_upgrade_energy", RecipeModifierBuilder.create("modularmachinery:energy", "input", 4.0, 1, false).build());
durasteelUpgrade.buildAndRegister();

var aeonsteelUpgrade as MachineUpgradeBuilder = MachineUpgradeBuilder.newBuilder(AEONSTEEL, "恒钢采掘升级", 1, 1);
aeonsteelUpgrade.addDescriptions("§b使模块化矿机拥有采集恒钢阶段矿物的能力\n§b矿机能耗变为原来的8倍");
aeonsteelUpgrade.addCompatibleMachines("basic_miner");
aeonsteelUpgrade.addCompatibleMachines("advanced_miner");
aeonsteelUpgrade.addCompatibleMachines("dimensional_miner");
aeonsteelUpgrade.addModifier(false, "aeonsteel_upgrade_energy", RecipeModifierBuilder.create("modularmachinery:energy", "input", 8.0, 1, false).build());
aeonsteelUpgrade.buildAndRegister();

var chromasteelUpgrade as MachineUpgradeBuilder = MachineUpgradeBuilder.newBuilder(CHROMASTEEL, "炫钢采掘升级", 1, 1);
chromasteelUpgrade.addDescriptions("§b使模块化矿机拥有采集炫钢阶段矿物的能力\n§b矿机能耗变为原来的16倍");
chromasteelUpgrade.addCompatibleMachines("basic_miner");
chromasteelUpgrade.addCompatibleMachines("advanced_miner");
chromasteelUpgrade.addCompatibleMachines("dimensional_miner");
chromasteelUpgrade.addModifier(false, "chromasteel_upgrade_energy", RecipeModifierBuilder.create("modularmachinery:energy", "input", 16.0, 1, false).build());
chromasteelUpgrade.buildAndRegister();

var cosmiliteUpgrade as MachineUpgradeBuilder = MachineUpgradeBuilder.newBuilder(COSMILITE, "寰宇采掘升级", 1, 1);
cosmiliteUpgrade.addDescriptions("§b使模块化矿机拥有采集寰宇阶段矿物的能力\n§b矿机能耗变为原来的32倍");
cosmiliteUpgrade.addCompatibleMachines("basic_miner");
cosmiliteUpgrade.addCompatibleMachines("advanced_miner");
cosmiliteUpgrade.addCompatibleMachines("dimensional_miner");
cosmiliteUpgrade.addModifier(false, "cosmilite_upgrade_energy", RecipeModifierBuilder.create("modularmachinery:energy", "input", 32.0, 1, false).build());
cosmiliteUpgrade.buildAndRegister();

var finalliumUpgrade as MachineUpgradeBuilder = MachineUpgradeBuilder.newBuilder(FINALLIUM, "终焉采掘升级", 1, 1);
finalliumUpgrade.addDescriptions("§b使模块化矿机拥有采集终焉阶段矿物的能力\n§b矿机能耗变为原来的64倍");
finalliumUpgrade.addCompatibleMachines("basic_miner");
finalliumUpgrade.addCompatibleMachines("advanced_miner");
finalliumUpgrade.addCompatibleMachines("dimensional_miner");
finalliumUpgrade.addModifier(false, "finallium_upgrade_energy", RecipeModifierBuilder.create("modularmachinery:energy", "input", 64.0, 1, false).build());
finalliumUpgrade.buildAndRegister();

var waviteUpgrade as MachineUpgradeBuilder = MachineUpgradeBuilder.newBuilder(WAVITE, "波动采掘升级", 1, 1);
waviteUpgrade.addDescriptions("§b使模块化矿机拥有采集波动阶段矿物的能力\n§b矿机能耗变为原来的128倍");
waviteUpgrade.addCompatibleMachines("basic_miner");
waviteUpgrade.addCompatibleMachines("advanced_miner");
waviteUpgrade.addCompatibleMachines("dimensional_miner");
waviteUpgrade.addModifier(false, "wavite_upgrade_energy", RecipeModifierBuilder.create("modularmachinery:energy", "input", 128.0, 1, false).build());
waviteUpgrade.buildAndRegister();

var multiUpgrade as MachineUpgradeBuilder = MachineUpgradeBuilder.newBuilder("miner_upg_multidim", "时空采掘升级", 1, 1);
multiUpgrade.addDescriptions("§b使模块化矿机拥有跨维度采集所有矿物的能力");
multiUpgrade.addCompatibleMachines("dimensional_miner");
multiUpgrade.buildAndRegister();

MachineUpgradeHelper.addFixedUpgrade(<additions:upgrade_efficiency>, "efficiency_upg");
MachineUpgradeHelper.addFixedUpgrade(<additions:upgrade_energy>, "energy_upg");

MachineUpgradeHelper.addFixedUpgrade(<additions:upgrade_stainless_steel>, STAINLESS);
MachineUpgradeHelper.addFixedUpgrade(<additions:upgrade_durasteel>, DURASTEEL);
MachineUpgradeHelper.addFixedUpgrade(<additions:upgrade_aeonsteel>, AEONSTEEL);
MachineUpgradeHelper.addFixedUpgrade(<additions:upgrade_chromasteel>, CHROMASTEEL);
MachineUpgradeHelper.addFixedUpgrade(<additions:upgrade_cosmilite>, COSMILITE);
MachineUpgradeHelper.addFixedUpgrade(<additions:upgrade_finallium>, FINALLIUM);
MachineUpgradeHelper.addFixedUpgrade(<additions:upgrade_wavite>, WAVITE);

MachineUpgradeHelper.addFixedUpgrade(<additions:upgrade_multidim>, "miner_upg_multidim");

MachineModifier.setMaxParallelism("basic_miner", 65536);
MachineModifier.setMaxThreads("basic_miner", 1);

var overworld = RecipeBuilder.newBuilder("overworld", "basic_miner", 200);
overworld.addEnergyPerTickInput(200);
overworld.addDimensionInput(0);
overworld.addItemOutput(<minecraft:iron_ore>).setChance(0.03).setIgnoreOutputCheck(true);
overworld.addItemOutput(<minecraft:gold_ore>).setChance(0.02).setIgnoreOutputCheck(true);
overworld.addItemOutput(<thermalfoundation:ore>).setChance(0.025).setIgnoreOutputCheck(true);
overworld.addItemOutput(<thermalfoundation:ore:1>).setChance(0.025).setIgnoreOutputCheck(true);
overworld.addItemOutput(<thermalfoundation:ore:2>).setChance(0.02).setIgnoreOutputCheck(true);
overworld.addItemOutput(<thermalfoundation:ore:3>).setChance(0.02).setIgnoreOutputCheck(true);
overworld.addItemOutput(<thermalfoundation:ore:4>).setChance(0.035).setIgnoreOutputCheck(true);
overworld.addItemOutput(<thermalfoundation:ore:5>).setChance(0.02).setIgnoreOutputCheck(true);
overworld.addItemOutput(<thermalfoundation:ore:6>).setChance(0.005).setIgnoreOutputCheck(true);
overworld.addItemOutput(<thermalfoundation:ore:7>).setChance(0.002).setIgnoreOutputCheck(true);
overworld.addItemOutput(<actuallyadditions:block_misc:3>).setChance(0.015).setIgnoreOutputCheck(true);
overworld.addItemOutput(<additions:chromium_ore>).setChance(0.005).setIgnoreOutputCheck(true);
overworld.addItemOutput(<mekanism:oreblock>).setChance(0.015).setIgnoreOutputCheck(true);
overworld.addItemOutput(<additions:zinc_ore>).setChance(0.02).setIgnoreOutputCheck(true);
overworld.addItemOutput(<divinerpg:rupee_ore>).setChance(0.01).setIgnoreOutputCheck(true);
overworld.addItemOutput(<divinerpg:realmite_ore>).setChance(0.01).setIgnoreOutputCheck(true);
overworld.addItemOutput(<divinerpg:arlemite_ore>).setChance(0.008).setIgnoreOutputCheck(true);
overworld.addItemOutput(<minecraft:coal>).setChance(0.04).setIgnoreOutputCheck(true);
overworld.addItemOutput(<thermalfoundation:material:893>).setChance(0.04).setIgnoreOutputCheck(true);
overworld.addItemOutput(<minecraft:redstone>).setChance(0.045).setIgnoreOutputCheck(true);
overworld.addItemOutput(<minecraft:dye:4>).setChance(0.035).setIgnoreOutputCheck(true);
overworld.addItemOutput(<minecraft:diamond>).setChance(0.008).setIgnoreOutputCheck(true);
overworld.addItemOutput(<minecraft:emerald>).setChance(0.003).setIgnoreOutputCheck(true);
overworld.addItemOutput(<thaumcraft:amber>).setChance(0.01).setIgnoreOutputCheck(true);
//不锈钢级
overworld.addItemUpgradeOutput(<astralsorcery:blockmarble>, STAINLESS, 0.03);
overworld.addItemUpgradeOutput(<netherex:basalt>, STAINLESS, 0.03);
overworld.addItemUpgradeOutput(<minecraft:obsidian>, STAINLESS, 0.02);
overworld.addItemUpgradeOutput(<astralsorcery:blockcustomore:1>, STAINLESS, 0.008);
overworld.addItemUpgradeOutput(<appliedenergistics2:material>, STAINLESS, 0.02);
overworld.addItemUpgradeOutput(<appliedenergistics2:material:1>, STAINLESS, 0.006);
overworld.addItemUpgradeOutput(<mysticalagriculture:crafting:5>, STAINLESS, 0.04);
overworld.addItemUpgradeOutput(<additions:experience_ingot>, STAINLESS, 0.04);
overworld.addItemUpgradeOutput(<mysticalagriculture:crafting>, STAINLESS, 0.04);
overworld.addItemUpgradeOutput(<thermalfoundation:material:772>, STAINLESS, 0.015);
overworld.addItemUpgradeOutput(<minecraft:flint>, STAINLESS, 0.02);
overworld.addItemUpgradeOutput(<minecraft:quartz>, STAINLESS, 0.02);
overworld.addItemUpgradeOutput(<astralsorcery:itemcraftingcomponent>, STAINLESS, 0.01);
//耐钢级
overworld.addItemUpgradeOutput(<additions:manganese_ore>, DURASTEEL, 0.03);
overworld.addItemUpgradeOutput(<nuclearcraft:ore:7>, DURASTEEL, 0.025);
overworld.addItemUpgradeOutput(<additions:aqualite_ore>, DURASTEEL, 0.015);
overworld.addItemUpgradeOutput(<additions:aeroite_ore>, DURASTEEL, 0.02);
overworld.addItemUpgradeOutput(<thaumcraft:ore_cinnabar>, DURASTEEL, 0.03);
overworld.addItemUpgradeOutput(<abyssalcraft:abyore>, DURASTEEL, 0.015);
overworld.addItemUpgradeOutput(<journey:shadiumore>, DURASTEEL, 0.008);
overworld.addItemUpgradeOutput(<journey:luniumore>, DURASTEEL, 0.008);
overworld.addItemUpgradeOutput(<taiga:meteorite_block>, DURASTEEL, 0.006);
overworld.addItemUpgradeOutput(<taiga:meteoritecobble_block>, DURASTEEL, 0.01);
//恒钢级
overworld.addItemUpgradeOutput(<taiga:karmesine_ore>, AEONSTEEL, 0.02);
overworld.addItemUpgradeOutput(<taiga:jauxum_ore>, AEONSTEEL, 0.02);
overworld.addItemUpgradeOutput(<taiga:ovium_ore>, AEONSTEEL, 0.02);
overworld.addItemUpgradeOutput(<taiga:duranite_ore>, AEONSTEEL, 0.016);
overworld.addItemUpgradeOutput(<taiga:vibranium_ore>, AEONSTEEL, 0.005);
overworld.addItemUpgradeOutput(<additions:cytosinite_ore>, AEONSTEEL, 0.008);
overworld.addItemUpgradeOutput(<taiga:eezo_ore>, AEONSTEEL, 0.02);
overworld.addItemUpgradeOutput(<draconicevolution:draconium_dust>, AEONSTEEL, 0.004);
overworld.addItemUpgradeOutput(<gct_ores:witherium_dust>, AEONSTEEL, 0.004);
overworld.addItemUpgradeOutput(<taiga:dilithium_crystal>, AEONSTEEL, 0.035);
overworld.addItemUpgradeOutput(<mekanism:fluoriteclump>, AEONSTEEL, 0.02);
//炫钢级
overworld.addItemUpgradeOutput(<additions:cryonium_ore>, CHROMASTEEL, 0.005);
overworld.addItemUpgradeOutput(<additions:snowingium_ore>, CHROMASTEEL, 0.005);
overworld.addItemUpgradeOutput(<biomesoplenty:gem:1>, CHROMASTEEL, 0.003);
overworld.addItemUpgradeOutput(<biomesoplenty:gem:2>, CHROMASTEEL, 0.003);
overworld.addItemUpgradeOutput(<biomesoplenty:gem:3>, CHROMASTEEL, 0.003);
overworld.addItemUpgradeOutput(<biomesoplenty:gem:4>, CHROMASTEEL, 0.003);
overworld.addItemUpgradeOutput(<biomesoplenty:gem:5>, CHROMASTEEL, 0.003);
overworld.addItemUpgradeOutput(<biomesoplenty:gem:6>, CHROMASTEEL, 0.003);
//寰宇级
overworld.addItemUpgradeOutput(<additions:oceanium_ore>, COSMILITE, 0.0015);
overworld.addItemUpgradeOutput(<additions:harcadium_ore>, COSMILITE, 0.002);
overworld.addItemUpgradeOutput(<tiths:redins>, COSMILITE, 0.002);
overworld.addItemUpgradeOutput(<tiths:corundum>, COSMILITE, 0.002);
overworld.addItemUpgradeOutput(<tiths:pyrophyllite>, COSMILITE, 0.002);
overworld.addItemUpgradeOutput(<tiths:opal>, COSMILITE, 0.002);
overworld.addItemUpgradeOutput(<tiths:spinel>, COSMILITE, 0.002);
overworld.addItemUpgradeOutput(<tiths:tourmaline>, COSMILITE, 0.002);
overworld.addItemUpgradeOutput(<tiths:cordierite>, COSMILITE, 0.002);
overworld.addItemUpgradeOutput(<tiths:prehnite>, COSMILITE, 0.002);
//终焉级
overworld.addItemUpgradeOutput(<additions:swinium_ore>, FINALLIUM, 0.009);
overworld.addItemUpgradeOutput(<additions:vanadium_ore>, FINALLIUM, 0.007);
overworld.addItemUpgradeOutput(<additions:gallium_ore>, FINALLIUM, 0.006);
overworld.addItemUpgradeOutput(<additions:indium_ore>, FINALLIUM, 0.0045);
overworld.addItemUpgradeOutput(<additions:rubium_ore>, FINALLIUM, 0.003);
overworld.addItemUpgradeOutput(<additions:cestium_ore>, FINALLIUM, 0.0015);
overworld.addItemUpgradeOutput(<additions:fraxinium_ore>, FINALLIUM, 0.0015);
overworld.addItemUpgradeOutput(<nuclearcraft:ore:5>, FINALLIUM, 0.01);
overworld.addItemUpgradeOutput(<nuclearcraft:ore:6>, FINALLIUM, 0.007);
overworld.addItemUpgradeOutput(<nuclearcraft:ore:3>, FINALLIUM, 0.005);
overworld.addItemUpgradeOutput(<mekanism:oreblock:5>, FINALLIUM, 0.015);
overworld.addRecipeTooltip("§d请注意，绝大部分高级矿石产出需要机器强化组件，具体请查询“模块化电容”");
overworld.build();

var nether = RecipeBuilder.newBuilder("nether", "basic_miner", 200);
nether.addEnergyPerTickInput(200);
nether.addDimensionInput(-1);
nether.addItemOutput(<minecraft:soul_sand>).setChance(0.1).setIgnoreOutputCheck(true);
nether.addItemOutput(<minecraft:magma>).setChance(0.03).setIgnoreOutputCheck(true);
nether.addItemOutput(<minecraft:quartz>).setChance(0.06).setIgnoreOutputCheck(true);
nether.addItemOutput(<betternether:cincinnasite>).setChance(0.06).setIgnoreOutputCheck(true);
nether.addItemOutput(<netherex:rime_crystal>).setChance(0.04).setIgnoreOutputCheck(true);
nether.addItemOutput(<minecraft:glowstone_dust>).setChance(0.06).setIgnoreOutputCheck(true);
nether.addItemOutput(<thermalfoundation:material:894>).setChance(0.03).setIgnoreOutputCheck(true);
//不锈钢级
nether.addItemUpgradeOutput(<tconstruct:ore>, STAINLESS, 0.03);
nether.addItemUpgradeOutput(<tconstruct:ore:1>, STAINLESS, 0.03);
nether.addItemUpgradeOutput(<divinerpg:netherite_ore>, STAINLESS, 0.03);
nether.addItemUpgradeOutput(<journey:hellstoneore>, STAINLESS, 0.02);
nether.addItemUpgradeOutput(<netherendingores:ore_nether_modded_1:4>, STAINLESS, 0.01);
nether.addItemUpgradeOutput(<rftools:dimensional_shard>, STAINLESS, 0.02);
nether.addItemUpgradeOutput(<divinerpg:bloodgem>, STAINLESS, 0.018);
//耐钢级
nether.addItemUpgradeOutput(<additions:emberstone_ore>, DURASTEEL, 0.015);
nether.addItemUpgradeOutput(<additions:netherite_scrap>, DURASTEEL, 0.001);
nether.addItemUpgradeOutput(<journey:firestoneclump>, DURASTEEL, 0.015);
//恒钢级
nether.addItemUpgradeOutput(<taiga:osram_ore>, AEONSTEEL, 0.02);
nether.addItemUpgradeOutput(<taiga:prometheum_ore>, AEONSTEEL, 0.015);
nether.addItemUpgradeOutput(<taiga:valyrium_ore>, AEONSTEEL, 0.009);
nether.addItemUpgradeOutput(<additions:thyminite_ore>, AEONSTEEL, 0.008);
nether.addItemUpgradeOutput(<taiga:tiberium_crystal>, AEONSTEEL, 0.06);
nether.addItemUpgradeOutput(<draconicevolution:draconium_dust>, AEONSTEEL, 0.004);
nether.addItemUpgradeOutput(<gct_ores:witherium_dust>, AEONSTEEL, 0.004);
//炫钢级
nether.addItemUpgradeOutput(<additions:lavarite_ore>, CHROMASTEEL, 0.005);
nether.addItemUpgradeOutput(<additions:infernium_ore>, CHROMASTEEL, 0.005);
nether.addItemUpgradeOutput(<additions:freezite_ore>, CHROMASTEEL, 0.005);
//寰宇级
nether.addItemUpgradeOutput(<additions:nether_harcadium_ore>, COSMILITE, 0.002);
nether.addItemUpgradeOutput(<tiths:lizanite>, COSMILITE, 0.002);
//终焉级
nether.addItemUpgradeOutput(<additions:lighteum_ore>, FINALLIUM, 0.009);
nether.addItemUpgradeOutput(<additions:mangisite_ore>, FINALLIUM, 0.008);
nether.addItemUpgradeOutput(<additions:oneo_ore>, FINALLIUM, 0.007);
nether.addItemUpgradeOutput(<additions:xenidium_ore>, FINALLIUM, 0.006);
nether.addItemUpgradeOutput(<additions:rapesesium_ore>, FINALLIUM, 0.003);
nether.addRecipeTooltip("§d请注意，绝大部分高级矿石产出需要机器强化组件，具体请查询“模块化电容”");
nether.build();

var end = RecipeBuilder.newBuilder("end", "basic_miner", 200);
end.addEnergyPerTickInput(200);
end.addDimensionInput(1);
end.addItemOutput(<minecraft:ender_pearl>).setChance(0.08).setIgnoreOutputCheck(true);
end.addItemOutput(<tiths:ender_crevice_shard>).setChance(0.05).setIgnoreOutputCheck(true);
//不锈钢级
end.addItemUpgradeOutput(<minecraft:obsidian>, STAINLESS, 0.05);
end.addItemUpgradeOutput(<quark:biotite>, STAINLESS, 0.05);
//耐钢级
end.addItemUpgradeOutput(<endreborn:item_end_essence>, DURASTEEL, 0.04);
end.addItemUpgradeOutput(<thermalfoundation:material:895>, DURASTEEL, 0.06);
end.addItemUpgradeOutput(<journey:enderilliumshard>, DURASTEEL, 0.01);
//恒钢级
end.addItemUpgradeOutput(<taiga:abyssum_ore>, AEONSTEEL, 0.02);
end.addItemUpgradeOutput(<taiga:palladium_ore>, AEONSTEEL, 0.017);
end.addItemUpgradeOutput(<taiga:uru_ore>, AEONSTEEL, 0.015);
end.addItemUpgradeOutput(<taiga:aurorium_ore>, AEONSTEEL, 0.015);
end.addItemUpgradeOutput(<taiga:obsidiorite_block>, AEONSTEEL, 0.008);
end.addItemUpgradeOutput(<taiga:obsidioritecobble_block>, AEONSTEEL, 0.012);
end.addItemUpgradeOutput(<draconicevolution:draconium_dust>, AEONSTEEL, 0.02);
end.addItemUpgradeOutput(<gct_ores:witherium_dust>, AEONSTEEL, 0.02);
end.addItemUpgradeOutput(<gct_mobs:resonated_scrap>, AEONSTEEL, 0.001);
//炫钢级
end.addItemUpgradeOutput(<endreborn:block_wolframium_ore>, CHROMASTEEL, 0.009);
end.addItemUpgradeOutput(<additions:plasmarite_ore>, CHROMASTEEL, 0.005);
end.addItemUpgradeOutput(<biomesoplenty:gem>, CHROMASTEEL, 0.01);
//寰宇级
end.addItemUpgradeOutput(<additions:titanium_ore>, COSMILITE, 0.0015);
end.addItemUpgradeOutput(<additions:end_harcadium_ore>, COSMILITE, 0.005);
//终焉级
end.addItemUpgradeOutput(<additions:thallium_ore>, FINALLIUM, 0.005);
end.addItemUpgradeOutput(<additions:manarium_ore>, FINALLIUM, 0.01);
end.addItemUpgradeOutput(<additions:soilium_ore>, FINALLIUM, 0.008);
end.addItemUpgradeOutput(<additions:breakium_ore>, FINALLIUM, 0.006);
end.addItemUpgradeOutput(<additions:fenzium_ore>, FINALLIUM, 0.012);
end.addItemUpgradeOutput(<additions:sissidium_ore>, FINALLIUM, 0.0045);
end.addItemUpgradeOutput(<additions:technetium_ore>, FINALLIUM, 0.003);
end.addRecipeTooltip("§d请注意，绝大部分高级矿石产出需要机器强化组件，具体请查询“模块化电容”");
end.build();

var twilightf = RecipeBuilder.newBuilder("twilight_forest", "basic_miner", 200);
twilightf.addEnergyPerTickInput(200);
twilightf.addDimensionInput(7);
twilightf.addItemOutput(<twilightforest:torchberries>).setChance(0.06).setIgnoreOutputCheck(true);
twilightf.addItemOutput(<twilightforest:raven_feather>).setChance(0.06).setIgnoreOutputCheck(true);
twilightf.addItemOutput(<twilightforest:steeleaf_ingot>).setChance(0.04).setIgnoreOutputCheck(true);
twilightf.addItemOutput(<twilightforest:naga_scale>).setChance(0.03).setIgnoreOutputCheck(true);
twilightf.addItemOutput(<twilightforest:liveroot>).setChance(0.06).setIgnoreOutputCheck(true);
twilightf.addItemOutput(<twilightforest:borer_essence>).setChance(0.06).setIgnoreOutputCheck(true);
twilightf.addItemOutput(<twilightforest:alpha_fur>).setChance(0.03).setIgnoreOutputCheck(true);
//不锈钢级
twilightf.addItemUpgradeOutput(<additions:fiery_ore>, STAINLESS, 0.04);
twilightf.addItemUpgradeOutput(<additions:knigh_metal_ore>, STAINLESS, 0.04);
twilightf.addItemUpgradeOutput(<twilightforest:giant_cobblestone>, STAINLESS, 0.03);
twilightf.addItemUpgradeOutput(<twilightforest:giant_log>, STAINLESS, 0.03);
twilightf.addItemUpgradeOutput(<twilightforest:giant_leaves>, STAINLESS, 0.04);
twilightf.addItemUpgradeOutput(<twilightforest:giant_obsidian>, STAINLESS, 0.005);
//耐钢级
twilightf.addItemUpgradeOutput(<moretcon:nuggetpenguinite>, DURASTEEL, 0.01);
//炫钢级
twilightf.addItemUpgradeOutput(<additions:canopium_ore>, CHROMASTEEL, 0.005);
twilightf.addRecipeTooltip("§d请注意，绝大部分高级矿石产出需要机器强化组件，具体请查询“模块化电容”");
twilightf.build();

var aether = RecipeBuilder.newBuilder("aether", "basic_miner", 200);
aether.addEnergyPerTickInput(200);
aether.addDimensionInput(173);
aether.addItemOutput(<aether_legacy:ambrosium_shard>).setChance(0.06).setIgnoreOutputCheck(true);
//不锈钢级
aether.addItemUpgradeOutput(<aether_legacy:gravitite_ore>, STAINLESS, 0.01);
aether.addItemUpgradeOutput(<aether_legacy:zanite_gemstone>, STAINLESS, 0.035);
//耐钢级
aether.addItemUpgradeOutput(<additions:asgardium_ore>, DURASTEEL, 0.02);
//恒钢级
aether.addItemUpgradeOutput(<gct_mobs:gravity_scrap>, AEONSTEEL, 0.001);
//炫钢级
aether.addItemUpgradeOutput(<additions:aetherium_ore>, CHROMASTEEL, 0.005);
//终焉级
aether.addItemUpgradeOutput(<additions:cloudite_ore>, FINALLIUM, 0.008);
aether.addItemUpgradeOutput(<additions:molybdenum_ore>, FINALLIUM, 0.006);
aether.addRecipeTooltip("§d请注意，绝大部分高级矿石产出需要机器强化组件，具体请查询“模块化电容”");
aether.build();

var abysswaste = RecipeBuilder.newBuilder("abyss_wasteland", "basic_miner", 200);
abysswaste.addEnergyPerTickInput(200);
abysswaste.addDimensionInput(50);
abysswaste.addItemOutput(<abyssalcraft:coralium>).setChance(0.08).setIgnoreOutputCheck(true);
abysswaste.addItemOutput(<thermalfoundation:material:772>).setChance(0.06).setIgnoreOutputCheck(true);
abysswaste.addItemOutput(<abyssalcraft:cobblestone:4>).setChance(0.1).setIgnoreOutputCheck(true);
//不锈钢级
abysswaste.addItemUpgradeOutput(<abyssalcraft:abylcorore>, STAINLESS, 0.03);
abysswaste.addItemUpgradeOutput(<abyssalcraft:cpearl>, STAINLESS, 0.02);
//恒钢级
abysswaste.addItemUpgradeOutput(<additions:guaninite_ore>, AEONSTEEL, 0.012);
//终焉级
abysswaste.addItemUpgradeOutput(<additions:stripium_ore>, AEONSTEEL, 0.009);
abysswaste.addItemUpgradeOutput(<additions:ttwo_ore>, AEONSTEEL, 0.008);
abysswaste.addRecipeTooltip("§d请注意，绝大部分高级矿石产出需要机器强化组件，具体请查询“模块化电容”");
abysswaste.build();

var dreadland = RecipeBuilder.newBuilder("dreadland", "basic_miner", 200);
dreadland.addEnergyPerTickInput(200);
dreadland.addDimensionInput(51);
//耐钢级
dreadland.addItemUpgradeOutput(<abyssalcraft:abydreadore>, DURASTEEL, 0.08);
dreadland.addItemUpgradeOutput(<abyssalcraft:dreadfragment>, DURASTEEL, 0.02);
//恒钢级
dreadland.addItemUpgradeOutput(<additions:adeninite_ore>, AEONSTEEL, 0.012);
//终焉级
dreadland.addItemUpgradeOutput(<additions:togrium_ore>, FINALLIUM, 0.004);
dreadland.addItemUpgradeOutput(<additions:antimony_ore>, FINALLIUM, 0.004);
dreadland.addRecipeTooltip("§d请注意，绝大部分高级矿石产出需要机器强化组件，具体请查询“模块化电容”");
dreadland.build();

var omothol = RecipeBuilder.newBuilder("omothol", "basic_miner", 200);
omothol.addEnergyPerTickInput(200);
omothol.addDimensionInput(52);
//寰宇级
omothol.addItemUpgradeOutput(<additions:mistium_ore>, COSMILITE, 0.008);
//终焉级
omothol.addItemUpgradeOutput(<additions:yoggleseum_ore>, FINALLIUM, 0.007);
omothol.addItemUpgradeOutput(<additions:circlium_ore>, FINALLIUM, 0.003);
omothol.addItemUpgradeOutput(<additions:dimesium_ore>, FINALLIUM, 0.005);
omothol.addRecipeTooltip("§d请注意，绝大部分高级矿石产出需要机器强化组件，具体请查询“模块化电容”");
omothol.build();

var darkrealm = RecipeBuilder.newBuilder("dark_realm", "basic_miner", 200);
darkrealm.addEnergyPerTickInput(200);
darkrealm.addDimensionInput(53);
//不锈钢级
darkrealm.addItemUpgradeOutput(<abyssalcraft:shadowgem>, STAINLESS, 0.01);
//寰宇级
darkrealm.addItemUpgradeOutput(<additions:bnightium_ore>, COSMILITE, 0.008);
darkrealm.addRecipeTooltip("§d请注意，绝大部分高级矿石产出需要机器强化组件，具体请查询“模块化电容”");
darkrealm.build();

var darkerrealm = RecipeBuilder.newBuilder("darker_realm", "basic_miner", 200);
darkerrealm.addEnergyPerTickInput(200);
darkerrealm.addDimensionInput(54);
//寰宇级
darkerrealm.addItemUpgradeOutput(<gct_aby:dreadiumore>, COSMILITE, 0.03);
darkerrealm.addItemUpgradeOutput(<gct_aby:ethauxiumore>, COSMILITE, 0.01);
darkerrealm.addItemUpgradeOutput(<gct_aby:saniteore>, COSMILITE, 0.004);
darkerrealm.addRecipeTooltip("§d请注意，绝大部分高级矿石产出需要机器强化组件，具体请查询“模块化电容”");
darkerrealm.build();

var warpland = RecipeBuilder.newBuilder("warp_land", "basic_miner", 200);
warpland.addEnergyPerTickInput(200);
warpland.addDimensionInput(55);
//终焉级
warpland.addItemUpgradeOutput(<gct_aby:azathothium_ore_complex>, FINALLIUM, 0.01);
warpland.addItemUpgradeOutput(<gct_aby:nyralathotepium_ore_complex>, FINALLIUM, 0.01);
warpland.addItemUpgradeOutput(<gct_aby:yogsothothium_ore_complex>, FINALLIUM, 0.01);
warpland.addItemUpgradeOutput(<gct_aby:shubniggurathium_ore_complex>, FINALLIUM, 0.01);
warpland.addRecipeTooltip("§d请注意，绝大部分高级矿石产出需要机器强化组件，具体请查询“模块化电容”");
warpland.build();

var iceika = RecipeBuilder.newBuilder("iceika", "basic_miner", 200);
iceika.addEnergyPerTickInput(200);
iceika.addDimensionInput(425);
iceika.addItemOutput(<divinerpg:corrupted_shards>).setChance(0.04).setIgnoreOutputCheck(true);
iceika.addItemOutput(<divinerpg:divine_shards>).setChance(0.04).setIgnoreOutputCheck(true);
iceika.addItemOutput(<divinerpg:jungle_shards>).setChance(0.04).setIgnoreOutputCheck(true);
iceika.addItemOutput(<divinerpg:terran_shards>).setChance(0.04).setIgnoreOutputCheck(true);
iceika.addItemOutput(<divinerpg:molten_shards>).setChance(0.04).setIgnoreOutputCheck(true);
//耐钢级
iceika.addItemUpgradeOutput(<additions:iciricium_ore>, DURASTEEL, 0.01);
iceika.addRecipeTooltip("§d请注意，绝大部分高级矿石产出需要机器强化组件，具体请查询“模块化电容”");
iceika.build();

var arcana = RecipeBuilder.newBuilder("arcana", "basic_miner", 200);
arcana.addEnergyPerTickInput(200);
arcana.addDimensionInput(426);
//恒钢级
arcana.addItemUpgradeOutput(<divinerpg:raw_arcanium>, AEONSTEEL, 0.03);
arcana.addRecipeTooltip("§d请注意，绝大部分高级矿石产出需要机器强化组件，具体请查询“模块化电容”");
arcana.build();

var aurorian = RecipeBuilder.newBuilder("aurorian", "basic_miner", 200);
aurorian.addEnergyPerTickInput(200);
aurorian.addDimensionInput(645);
//不锈钢级
aurorian.addItemUpgradeOutput(<theaurorian:moonstoneore>, STAINLESS, 0.05);
aurorian.addItemUpgradeOutput(<theaurorian:ceruleanore>, STAINLESS, 0.03);
aurorian.addItemUpgradeOutput(<theaurorian:crystal>, STAINLESS, 0.03);
//耐钢级
aurorian.addItemUpgradeOutput(<theaurorian:scrapaurorianite>, DURASTEEL, 0.02);
aurorian.addItemUpgradeOutput(<theaurorian:scrapumbra>, DURASTEEL, 0.02);
aurorian.addItemUpgradeOutput(<theaurorian:scrapcrystalline>, DURASTEEL, 0.02);
aurorian.addRecipeTooltip("§d请注意，绝大部分高级矿石产出需要机器强化组件，具体请查询“模块化电容”");
aurorian.build();

var frozenlands = RecipeBuilder.newBuilder("frozen_lands", "basic_miner", 200);
frozenlands.addEnergyPerTickInput(200);
frozenlands.addDimensionInput(823);
//恒钢级
frozenlands.addItemUpgradeOutput(<additions:chillinium_ore>, AEONSTEEL, 0.04);
frozenlands.addItemUpgradeOutput(<additions:germanium_ore>, AEONSTEEL, 0.03);
frozenlands.addRecipeTooltip("§d请注意，绝大部分高级矿石产出需要机器强化组件，具体请查询“模块化电容”");
frozenlands.build();

var boiling = RecipeBuilder.newBuilder("boiling_point", "basic_miner", 200);
boiling.addEnergyPerTickInput(200);
boiling.addDimensionInput(822);
//恒钢级
boiling.addItemUpgradeOutput(<additions:flamium_ore>, AEONSTEEL, 0.04);
boiling.addItemUpgradeOutput(<journey:blazium>, AEONSTEEL, 0.03);
boiling.addRecipeTooltip("§d请注意，绝大部分高级矿石产出需要机器强化组件，具体请查询“模块化电容”");
boiling.build();

var euca = RecipeBuilder.newBuilder("euca", "basic_miner", 200);
euca.addEnergyPerTickInput(200);
euca.addDimensionInput(820);
//炫钢级
euca.addItemUpgradeOutput(<journey:celestiumore>, CHROMASTEEL, 0.03);
euca.addItemUpgradeOutput(<journey:koriteore>, CHROMASTEEL, 0.03);
euca.addItemUpgradeOutput(<journey:mekyumore>, CHROMASTEEL, 0.03);
euca.addItemUpgradeOutput(<journey:storonore>, CHROMASTEEL, 0.03);
euca.addRecipeTooltip("§d请注意，绝大部分高级矿石产出需要机器强化组件，具体请查询“模块化电容”");
euca.build();

var depth = RecipeBuilder.newBuilder("depth", "basic_miner", 200);
depth.addEnergyPerTickInput(200);
depth.addDimensionInput(821);
//炫钢级
depth.addItemUpgradeOutput(<journey:flairiumore>, CHROMASTEEL, 0.03);
depth.addItemUpgradeOutput(<journey:desore>, CHROMASTEEL, 0.03);
//终焉级
depth.addItemUpgradeOutput(<additions:barite_ore>, CHROMASTEEL, 0.04);
depth.addRecipeTooltip("§d请注意，绝大部分高级矿石产出需要机器强化组件，具体请查询“模块化电容”");
depth.build();

var corba = RecipeBuilder.newBuilder("corba", "basic_miner", 200);
corba.addEnergyPerTickInput(200);
corba.addDimensionInput(824);
//炫钢级
corba.addItemUpgradeOutput(<journey:orbaditeore>, CHROMASTEEL, 0.03);
corba.addItemUpgradeOutput(<journey:gorbitegem>, CHROMASTEEL, 0.04);
corba.addRecipeTooltip("§d请注意，绝大部分高级矿石产出需要机器强化组件，具体请查询“模块化电容”");
corba.build();

var terrania = RecipeBuilder.newBuilder("terrania", "basic_miner", 200);
terrania.addEnergyPerTickInput(200);
terrania.addDimensionInput(827);
//寰宇级
terrania.addItemUpgradeOutput(<additions:chloroplast_ore>, COSMILITE, 0.04);
terrania.addRecipeTooltip("§d请注意，绝大部分高级矿石产出需要机器强化组件，具体请查询“模块化电容”");
terrania.build();

var cloudia = RecipeBuilder.newBuilder("cloudia", "basic_miner", 200);
cloudia.addEnergyPerTickInput(200);
cloudia.addDimensionInput(826);
//寰宇级
cloudia.addItemUpgradeOutput(<journey:lunitechunk>, COSMILITE, 0.04);
cloudia.addRecipeTooltip("§d请注意，绝大部分高级矿石产出需要机器强化组件，具体请查询“模块化电容”");
cloudia.build();

var deepdark = RecipeBuilder.newBuilder("deep_dark", "basic_miner", 200);
deepdark.addEnergyPerTickInput(200);
deepdark.addDimensionInput(-11325);
//炫钢级
deepdark.addItemUpgradeOutput(<additions:shadowium_ore>, CHROMASTEEL, 0.02);
deepdark.addRecipeTooltip("§d请注意，绝大部分高级矿石产出需要机器强化组件，具体请查询“模块化电容”");
deepdark.build();

var city = RecipeBuilder.newBuilder("lost_city", "basic_miner", 200);
city.addEnergyPerTickInput(200);
city.addDimensionInput(111);
//炫钢级
city.addItemUpgradeOutput(<additions:limonite_ore>, DURASTEEL, 0.03);
city.addItemUpgradeOutput(<additions:rosite_ore>, DURASTEEL, 0.025);
city.addRecipeTooltip("§d请注意，绝大部分高级矿石产出需要机器强化组件，具体请查询“模块化电容”");
city.build();

var everdawn = RecipeBuilder.newBuilder("everdawn", "basic_miner", 200);
everdawn.addEnergyPerTickInput(200);
everdawn.addDimensionInput(77);
//炫钢级
everdawn.addItemUpgradeOutput(<blue_skies:horizonite_ore>, CHROMASTEEL, 0.02);
everdawn.addItemUpgradeOutput(<blue_skies:diopside_gem>, CHROMASTEEL, 0.03);
everdawn.addItemUpgradeOutput(<blue_skies:pyrope_gem>, CHROMASTEEL, 0.03);
everdawn.addItemUpgradeOutput(<blue_skies:turquoise_gem>, CHROMASTEEL, 0.03);
everdawn.addItemUpgradeOutput(<blue_skies:charoite>, CHROMASTEEL, 0.03);
everdawn.addItemUpgradeOutput(<blue_skies:moonstone>, CHROMASTEEL, 0.03);
everdawn.addItemUpgradeOutput(<minecraft:emerald>, CHROMASTEEL, 0.03);
everdawn.addRecipeTooltip("§d请注意，绝大部分高级矿石产出需要机器强化组件，具体请查询“模块化电容”");
everdawn.build();

var everbright = RecipeBuilder.newBuilder("everbright", "basic_miner", 200);
everbright.addEnergyPerTickInput(200);
everbright.addDimensionInput(76);
//炫钢级
everbright.addItemUpgradeOutput(<blue_skies:falsite_ore>, CHROMASTEEL, 0.02);
everbright.addItemUpgradeOutput(<blue_skies:ventium_ore>, CHROMASTEEL, 0.02);
everbright.addItemUpgradeOutput(<blue_skies:diopside_gem>, CHROMASTEEL, 0.03);
everbright.addItemUpgradeOutput(<blue_skies:pyrope_gem>, CHROMASTEEL, 0.03);
everbright.addItemUpgradeOutput(<blue_skies:turquoise_gem>, CHROMASTEEL, 0.03);
everbright.addItemUpgradeOutput(<blue_skies:charoite>, CHROMASTEEL, 0.03);
everbright.addItemUpgradeOutput(<blue_skies:moonstone>, CHROMASTEEL, 0.03);
everbright.addItemUpgradeOutput(<minecraft:emerald>, CHROMASTEEL, 0.03);
everbright.addRecipeTooltip("§d请注意，绝大部分高级矿石产出需要机器强化组件，具体请查询“模块化电容”");
everbright.build();

var everheaven = RecipeBuilder.newBuilder("everheaven", "basic_miner", 200);
everheaven.addEnergyPerTickInput(200);
everheaven.addDimensionInput(78);
//寰宇级
everheaven.addItemUpgradeOutput(<tiths:ore_halleium>, COSMILITE, 0.008);
everheaven.addItemUpgradeOutput(<tiths:ore_altairium>, COSMILITE, 0.008);
everheaven.addItemUpgradeOutput(<tiths:ore_tonium>, COSMILITE, 0.008);
everheaven.addItemUpgradeOutput(<tiths:ore_polarium>, COSMILITE, 0.008);
everheaven.addItemUpgradeOutput(<tiths:ore_hothium>, COSMILITE, 0.008);
everheaven.addItemUpgradeOutput(<tiths:ore_stellarium>, COSMILITE, 0.004);
everheaven.addRecipeTooltip("§d请注意，绝大部分高级矿石产出需要机器强化组件，具体请查询“模块化电容”");
everheaven.build();

var voidland = RecipeBuilder.newBuilder("void", "basic_miner", 200);
voidland.addEnergyPerTickInput(200);
voidland.addDimensionInput(100);
//寰宇级
voidland.addItemUpgradeOutput(<minecraft:bedrock>, COSMILITE, 0.3);
voidland.addItemUpgradeOutput(<additions:void_harcadium_ore>, COSMILITE, 0.1);
voidland.addItemUpgradeOutput(<additions:void_ore>, COSMILITE, 0.02);
voidland.addRecipeTooltip("§d请注意，绝大部分高级矿石产出需要机器强化组件，具体请查询“模块化电容”");
voidland.build();

var nowhere = RecipeBuilder.newBuilder("nowhere", "basic_miner", 200);
nowhere.addEnergyPerTickInput(200);
nowhere.addDimensionInput(101);
//寰宇级
nowhere.addItemUpgradeOutput(<additions:void_harcadium_ore>, COSMILITE, 0.15);
nowhere.addItemUpgradeOutput(<additions:void_ore>, COSMILITE, 0.06);
nowhere.addItemUpgradeOutput(<additions:adamantium_ore>, COSMILITE, 0.02);
//终焉级
nowhere.addItemUpgradeOutput(<additions:dawnium_ore>, FINALLIUM, 0.008);
nowhere.addRecipeTooltip("§d请注意，绝大部分高级矿石产出需要机器强化组件，具体请查询“模块化电容”");
nowhere.build();

var order = RecipeBuilder.newBuilder("order", "basic_miner", 200);
order.addEnergyPerTickInput(200);
order.addDimensionInput(102);
//终焉级
order.addItemUpgradeOutput(<gct_ores:order_crystal>, FINALLIUM, 0.0005);
order.addRecipeTooltip("§d请注意，绝大部分高级矿石产出需要机器强化组件，具体请查询“模块化电容”");
order.build();

var betweenland = RecipeBuilder.newBuilder("betweenland", "basic_miner", 200);
betweenland.addEnergyPerTickInput(200);
betweenland.addDimensionInput(20);
//终焉级
betweenland.addItemUpgradeOutput(<thebetweenlands:octine_ore>, FINALLIUM, 0.04);
betweenland.addItemUpgradeOutput(<thebetweenlands:syrmorite_ore>, FINALLIUM, 0.04);
betweenland.addItemUpgradeOutput(<thebetweenlands:items_misc:19>, FINALLIUM, 0.03);
betweenland.addItemUpgradeOutput(<thebetweenlands:items_misc:39>, FINALLIUM, 0.05);
betweenland.addItemUpgradeOutput(<thebetweenlands:items_misc:18>, FINALLIUM, 0.08);
betweenland.addItemUpgradeOutput(<thebetweenlands:items_misc:14>, FINALLIUM, 0.05);
betweenland.addItemUpgradeOutput(<thebetweenlands:crimson_middle_gem>, FINALLIUM, 0.015);
betweenland.addItemUpgradeOutput(<thebetweenlands:green_middle_gem>, FINALLIUM, 0.015);
betweenland.addItemUpgradeOutput(<thebetweenlands:aqua_middle_gem>, FINALLIUM, 0.015);
betweenland.addItemUpgradeOutput(<thebetweenlands:life_crystal>, FINALLIUM, 0.025);
betweenland.addRecipeTooltip("§d请注意，绝大部分高级矿石产出需要机器强化组件，具体请查询“模块化电容”");
betweenland.build();

var alfheim = RecipeBuilder.newBuilder("alfheim", "basic_miner", 200);
alfheim.addEnergyPerTickInput(200);
alfheim.addDimensionInput(42);
//寰宇级
alfheim.addItemUpgradeOutput(<gct_mobs:elementium_ore>, COSMILITE, 0.03);
alfheim.addItemUpgradeOutput(<gct_mobs:terrasteel_ore>, COSMILITE, 0.008);
//终焉级
alfheim.addItemUpgradeOutput(<gct_mobs:orichalcos_ore>, FINALLIUM, 0.005);
alfheim.addRecipeTooltip("§d请注意，绝大部分高级矿石产出需要机器强化组件，具体请查询“模块化电容”");
alfheim.build();

var starland = RecipeBuilder.newBuilder("starland", "basic_miner", 200);
starland.addEnergyPerTickInput(200);
starland.addDimensionInput(80);
//寰宇级
starland.addItemUpgradeOutput(<astralsorcery:itemcraftingcomponent>, COSMILITE, 0.05);
starland.addItemUpgradeOutput(<additions:star_metal_ore>, COSMILITE, 0.04);
//终焉级
starland.addItemUpgradeOutput(<additions:astralmetal_ore>, FINALLIUM, 0.02);
starland.addItemUpgradeOutput(<additions:nasalum_ore>, FINALLIUM, 0.01);
starland.addItemUpgradeOutput(<additions:lunarine_ore>, FINALLIUM, 0.02);
starland.addItemUpgradeOutput(<additions:arimite_ore>, FINALLIUM, 0.005);
starland.addRecipeTooltip("§d请注意，绝大部分高级矿石产出需要机器强化组件，具体请查询“模块化电容”");
starland.build();

var atlantis = RecipeBuilder.newBuilder("atlantis", "basic_miner", 200);
atlantis.addEnergyPerTickInput(200);
atlantis.addDimensionInput(324987);
//寰宇级
atlantis.addItemUpgradeOutput(<additions:tanatonium_ore>, COSMILITE, 0.015);
atlantis.addItemUpgradeOutput(<additions:imitatium_ore>, COSMILITE, 0.015);
atlantis.addRecipeTooltip("§d请注意，绝大部分高级矿石产出需要机器强化组件，具体请查询“模块化电容”");
atlantis.build();

RecipeAdapterBuilder.create("advanced_miner", "modularmachinery:basic_miner").build();
RecipeAdapterBuilder.create("dimensional_miner", "modularmachinery:basic_miner").build();

MMEvents.onControllerGUIRender("basic_miner", function(event as ControllerGUIRenderEvent) {
    var info as string[] = [
        "§a///基础采掘机控制面板///",
        "§a机器名称：§eLV1 - 基础采掘机"
    ];
    event.extraInfo = info;
});

MMEvents.onControllerGUIRender("advanced_miner", function(event as ControllerGUIRenderEvent) {
    var info as string[] = [
        "§a///精密过滤采掘机控制面板///",
        "§a机器名称：§eLV3 - 精密过滤采掘机"
    ];
    event.extraInfo = info;
});

MMEvents.onControllerGUIRender("dimensional_miner", function(event as ControllerGUIRenderEvent) {
    var info as string[] = [
        "§a///时空相位采掘机控制面板///",
        "§a机器名称：§eLV5 - 时空相位采掘机"
    ];
    event.extraInfo = info;
});
