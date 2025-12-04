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
import mods.modularmachinery.MachineTickEvent;
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

MMEvents.onMachinePreTick("advanced_miner", function(event as MachineTickEvent) {
    var vanilla as int[] = [-1, 0, 1];
    var threadCount as int = 0;
    var dims as int[] = [];
    if (event.controller.hasMachineUpgrade("miner_upg_dimoverworld")) {threadCount += 1; dims += 0;}
    if (event.controller.hasMachineUpgrade("miner_upg_dimnether")) {threadCount += 1; dims += -1;}
    if (event.controller.hasMachineUpgrade("miner_upg_dimend")) {threadCount += 1; dims += 1;}
    if (!(vanilla has event.controller.world.dimension)) {
        event.controller.extraThreadCount = threadCount + 1;
    } else if (dims has event.controller.world.dimension) {
        event.controller.extraThreadCount = threadCount;
    } else {
        event.controller.extraThreadCount = threadCount + 1;

    }
});

var overworldUpgrade as MachineUpgradeBuilder = MachineUpgradeBuilder.newBuilder("miner_upg_dimoverworld", "主世界维度升级", 1, 1);
overworldUpgrade.addDescriptions("§b使模块化矿机拥有跨维度采集主世界矿物的能力");
overworldUpgrade.addCompatibleMachines("advanced_miner");
overworldUpgrade.buildAndRegister();

var netherUpgrade as MachineUpgradeBuilder = MachineUpgradeBuilder.newBuilder("miner_upg_dimnether", "下界维度升级", 1, 1);
netherUpgrade.addDescriptions("§b使模块化矿机拥有跨维度采集下界矿物的能力");
netherUpgrade.addCompatibleMachines("advanced_miner");
netherUpgrade.buildAndRegister();

var endUpgrade as MachineUpgradeBuilder = MachineUpgradeBuilder.newBuilder("miner_upg_dimend", "末地维度升级", 1, 1);
endUpgrade.addDescriptions("§b使模块化矿机拥有跨维度采集末地矿物的能力");
endUpgrade.addCompatibleMachines("advanced_miner");
endUpgrade.buildAndRegister();

MachineUpgradeHelper.addFixedUpgrade(<additions:upgrade_dim_overworld>, "miner_upg_dimoverworld");
MachineUpgradeHelper.addFixedUpgrade(<additions:upgrade_dim_nether>, "miner_upg_dimnether");
MachineUpgradeHelper.addFixedUpgrade(<additions:upgrade_dim_end>, "miner_upg_dimend");

MachineModifier.setMaxParallelism("advanced_miner", 65536);
MachineModifier.setMaxThreads("advanced_miner", 0);

var advOverworld = RecipeBuilder.newBuilder("upgrade_overworld_1", "advanced_miner", 200);
advOverworld.addPreCheckHandler(function(event as RecipeCheckEvent) {
    if (event.controller.world.dimension != 0) {
        if ((!(event.controller.hasMachineUpgrade("miner_upg_dimoverworld")))) {
            event.setFailed("缺少主世界组件！");
        }
    } else {
        event.setFailed("当前维度就是主世界！");
    }
});
advOverworld.addEnergyPerTickInput(200);
advOverworld.addItemOutput(<minecraft:iron_ore>).setChance(0.03).setIgnoreOutputCheck(true);
advOverworld.addItemOutput(<minecraft:gold_ore>).setChance(0.02).setIgnoreOutputCheck(true);
advOverworld.addItemOutput(<thermalfoundation:ore>).setChance(0.025).setIgnoreOutputCheck(true);
advOverworld.addItemOutput(<thermalfoundation:ore:1>).setChance(0.025).setIgnoreOutputCheck(true);
advOverworld.addItemOutput(<thermalfoundation:ore:2>).setChance(0.02).setIgnoreOutputCheck(true);
advOverworld.addItemOutput(<thermalfoundation:ore:3>).setChance(0.02).setIgnoreOutputCheck(true);
advOverworld.addItemOutput(<thermalfoundation:ore:4>).setChance(0.035).setIgnoreOutputCheck(true);
advOverworld.addItemOutput(<thermalfoundation:ore:5>).setChance(0.02).setIgnoreOutputCheck(true);
advOverworld.addItemOutput(<thermalfoundation:ore:6>).setChance(0.005).setIgnoreOutputCheck(true);
advOverworld.addItemOutput(<thermalfoundation:ore:7>).setChance(0.002).setIgnoreOutputCheck(true);
advOverworld.addItemOutput(<actuallyadditions:block_misc:3>).setChance(0.015).setIgnoreOutputCheck(true);
advOverworld.addItemOutput(<additions:chromium_ore>).setChance(0.005).setIgnoreOutputCheck(true);
advOverworld.addItemOutput(<mekanism:oreblock>).setChance(0.015).setIgnoreOutputCheck(true);
advOverworld.addItemOutput(<additions:zinc_ore>).setChance(0.02).setIgnoreOutputCheck(true);
advOverworld.addItemOutput(<divinerpg:rupee_ore>).setChance(0.01).setIgnoreOutputCheck(true);
advOverworld.addItemOutput(<divinerpg:realmite_ore>).setChance(0.01).setIgnoreOutputCheck(true);
advOverworld.addItemOutput(<divinerpg:arlemite_ore>).setChance(0.008).setIgnoreOutputCheck(true);
advOverworld.addItemOutput(<minecraft:coal>).setChance(0.04).setIgnoreOutputCheck(true);
advOverworld.addItemOutput(<thermalfoundation:material:893>).setChance(0.04).setIgnoreOutputCheck(true);
advOverworld.addItemOutput(<minecraft:redstone>).setChance(0.045).setIgnoreOutputCheck(true);
advOverworld.addItemOutput(<minecraft:dye:4>).setChance(0.035).setIgnoreOutputCheck(true);
advOverworld.addItemOutput(<minecraft:diamond>).setChance(0.008).setIgnoreOutputCheck(true);
advOverworld.addItemOutput(<minecraft:emerald>).setChance(0.003).setIgnoreOutputCheck(true);
advOverworld.addItemOutput(<thaumcraft:amber>).setChance(0.01).setIgnoreOutputCheck(true);
//不锈钢级
advOverworld.addItemUpgradeOutput(<astralsorcery:blockmarble>, STAINLESS, 0.03);
advOverworld.addItemUpgradeOutput(<netherex:basalt>, STAINLESS, 0.03);
advOverworld.addItemUpgradeOutput(<minecraft:obsidian>, STAINLESS, 0.02);
advOverworld.addItemUpgradeOutput(<astralsorcery:blockcustomore:1>, STAINLESS, 0.008);
advOverworld.addItemUpgradeOutput(<appliedenergistics2:material>, STAINLESS, 0.02);
advOverworld.addItemUpgradeOutput(<appliedenergistics2:material:1>, STAINLESS, 0.006);
advOverworld.addItemUpgradeOutput(<mysticalagriculture:crafting:5>, STAINLESS, 0.04);
advOverworld.addItemUpgradeOutput(<additions:experience_ingot>, STAINLESS, 0.04);
advOverworld.addItemUpgradeOutput(<mysticalagriculture:crafting>, STAINLESS, 0.04);
advOverworld.addItemUpgradeOutput(<thermalfoundation:material:772>, STAINLESS, 0.015);
advOverworld.addItemUpgradeOutput(<minecraft:flint>, STAINLESS, 0.02);
advOverworld.addItemUpgradeOutput(<minecraft:quartz>, STAINLESS, 0.02);
advOverworld.addItemUpgradeOutput(<astralsorcery:itemcraftingcomponent>, STAINLESS, 0.01);
//耐钢级
advOverworld.addItemUpgradeOutput(<additions:manganese_ore>, DURASTEEL, 0.03);
advOverworld.addItemUpgradeOutput(<nuclearcraft:ore:7>, DURASTEEL, 0.025);
advOverworld.addItemUpgradeOutput(<additions:aqualite_ore>, DURASTEEL, 0.015);
advOverworld.addItemUpgradeOutput(<additions:aeroite_ore>, DURASTEEL, 0.02);
advOverworld.addItemUpgradeOutput(<thaumcraft:ore_cinnabar>, DURASTEEL, 0.03);
advOverworld.addItemUpgradeOutput(<abyssalcraft:abyore>, DURASTEEL, 0.015);
advOverworld.addItemUpgradeOutput(<journey:shadiumore>, DURASTEEL, 0.008);
advOverworld.addItemUpgradeOutput(<journey:luniumore>, DURASTEEL, 0.008);
advOverworld.addItemUpgradeOutput(<taiga:meteorite_block>, DURASTEEL, 0.006);
advOverworld.addItemUpgradeOutput(<taiga:meteoritecobble_block>, DURASTEEL, 0.01);
advOverworld.addItemUpgradeOutput(<tiths:ore_broken_bedrock>, DURASTEEL, 0.015);
//恒钢级
advOverworld.addItemUpgradeOutput(<taiga:karmesine_ore>, AEONSTEEL, 0.02);
advOverworld.addItemUpgradeOutput(<taiga:jauxum_ore>, AEONSTEEL, 0.02);
advOverworld.addItemUpgradeOutput(<taiga:ovium_ore>, AEONSTEEL, 0.02);
advOverworld.addItemUpgradeOutput(<taiga:duranite_ore>, AEONSTEEL, 0.016);
advOverworld.addItemUpgradeOutput(<taiga:vibranium_ore>, AEONSTEEL, 0.005);
advOverworld.addItemUpgradeOutput(<additions:cytosinite_ore>, AEONSTEEL, 0.008);
advOverworld.addItemUpgradeOutput(<taiga:eezo_ore>, AEONSTEEL, 0.02);
advOverworld.addItemUpgradeOutput(<draconicevolution:draconium_dust>, AEONSTEEL, 0.004);
advOverworld.addItemUpgradeOutput(<gct_ores:witherium_dust>, AEONSTEEL, 0.004);
advOverworld.addItemUpgradeOutput(<taiga:dilithium_crystal>, AEONSTEEL, 0.035);
advOverworld.addItemUpgradeOutput(<mekanism:fluoriteclump>, AEONSTEEL, 0.02);
//炫钢级
advOverworld.addItemUpgradeOutput(<additions:cryonium_ore>, CHROMASTEEL, 0.005);
advOverworld.addItemUpgradeOutput(<additions:snowingium_ore>, CHROMASTEEL, 0.005);
advOverworld.addItemUpgradeOutput(<biomesoplenty:gem:1>, CHROMASTEEL, 0.003);
advOverworld.addItemUpgradeOutput(<biomesoplenty:gem:2>, CHROMASTEEL, 0.003);
advOverworld.addItemUpgradeOutput(<biomesoplenty:gem:3>, CHROMASTEEL, 0.003);
advOverworld.addItemUpgradeOutput(<biomesoplenty:gem:4>, CHROMASTEEL, 0.003);
advOverworld.addItemUpgradeOutput(<biomesoplenty:gem:5>, CHROMASTEEL, 0.003);
advOverworld.addItemUpgradeOutput(<biomesoplenty:gem:6>, CHROMASTEEL, 0.003);
//寰宇级
advOverworld.addItemUpgradeOutput(<additions:oceanium_ore>, COSMILITE, 0.0015);
advOverworld.addItemUpgradeOutput(<additions:harcadium_ore>, COSMILITE, 0.002);
advOverworld.addItemUpgradeOutput(<tiths:redins>, COSMILITE, 0.002);
advOverworld.addItemUpgradeOutput(<tiths:corundum>, COSMILITE, 0.002);
advOverworld.addItemUpgradeOutput(<tiths:pyrophyllite>, COSMILITE, 0.002);
advOverworld.addItemUpgradeOutput(<tiths:opal>, COSMILITE, 0.002);
advOverworld.addItemUpgradeOutput(<tiths:spinel>, COSMILITE, 0.002);
advOverworld.addItemUpgradeOutput(<tiths:tourmaline>, COSMILITE, 0.002);
advOverworld.addItemUpgradeOutput(<tiths:cordierite>, COSMILITE, 0.002);
advOverworld.addItemUpgradeOutput(<tiths:prehnite>, COSMILITE, 0.002);
//终焉级
advOverworld.addItemUpgradeOutput(<sakura:sakura_diamond>, FINALLIUM, 0.005);
advOverworld.addItemUpgradeOutput(<additions:swinium_ore>, FINALLIUM, 0.009);
advOverworld.addItemUpgradeOutput(<additions:vanadium_ore>, FINALLIUM, 0.007);
advOverworld.addItemUpgradeOutput(<additions:gallium_ore>, FINALLIUM, 0.006);
advOverworld.addItemUpgradeOutput(<additions:indium_ore>, FINALLIUM, 0.0045);
advOverworld.addItemUpgradeOutput(<additions:rubium_ore>, FINALLIUM, 0.003);
advOverworld.addItemUpgradeOutput(<additions:cestium_ore>, FINALLIUM, 0.0015);
advOverworld.addItemUpgradeOutput(<additions:fraxinium_ore>, FINALLIUM, 0.0015);
advOverworld.addItemUpgradeOutput(<nuclearcraft:ore:5>, FINALLIUM, 0.01);
advOverworld.addItemUpgradeOutput(<nuclearcraft:ore:6>, FINALLIUM, 0.007);
advOverworld.addItemUpgradeOutput(<nuclearcraft:ore:3>, FINALLIUM, 0.005);
advOverworld.addItemUpgradeOutput(<mekanism:oreblock:5>, FINALLIUM, 0.015);
advOverworld.addRecipeTooltip("§d请注意，绝大部分高级矿石产出需要机器强化组件，具体请查询“模块化电容”");
advOverworld.addRecipeTooltip("§e需要主世界维度强化组件");
advOverworld.setMaxThreads(1).build();

var advNether = RecipeBuilder.newBuilder("upgrade_nether_1", "advanced_miner", 200);
advNether.addPreCheckHandler(function(event as RecipeCheckEvent) {
    if (event.controller.world.dimension != -1) {
        if ((!(event.controller.hasMachineUpgrade("miner_upg_dimnether")))) {
            event.setFailed("缺少下界组件！");
        }
    } else {
        event.setFailed("当前维度就是下界！");
    }
});
advNether.addEnergyPerTickInput(200);
advNether.addItemOutput(<minecraft:soul_sand>).setChance(0.1).setIgnoreOutputCheck(true);
advNether.addItemOutput(<minecraft:magma>).setChance(0.03).setIgnoreOutputCheck(true);
advNether.addItemOutput(<minecraft:quartz>).setChance(0.06).setIgnoreOutputCheck(true);
advNether.addItemOutput(<betternether:cincinnasite>).setChance(0.06).setIgnoreOutputCheck(true);
advNether.addItemOutput(<netherex:rime_crystal>).setChance(0.04).setIgnoreOutputCheck(true);
advNether.addItemOutput(<minecraft:glowstone_dust>).setChance(0.06).setIgnoreOutputCheck(true);
advNether.addItemOutput(<thermalfoundation:material:894>).setChance(0.03).setIgnoreOutputCheck(true);
//不锈钢级
advNether.addItemUpgradeOutput(<tconstruct:ore>, STAINLESS, 0.03);
advNether.addItemUpgradeOutput(<tconstruct:ore:1>, STAINLESS, 0.03);
advNether.addItemUpgradeOutput(<divinerpg:netherite_ore>, STAINLESS, 0.03);
advNether.addItemUpgradeOutput(<journey:hellstoneore>, STAINLESS, 0.02);
advNether.addItemUpgradeOutput(<netherendingores:ore_nether_modded_1:4>, STAINLESS, 0.01);
advNether.addItemUpgradeOutput(<rftools:dimensional_shard>, STAINLESS, 0.02);
advNether.addItemUpgradeOutput(<divinerpg:bloodgem>, STAINLESS, 0.018);
//耐钢级
advNether.addItemUpgradeOutput(<additions:emberstone_ore>, DURASTEEL, 0.015);
advNether.addItemUpgradeOutput(<additions:netherite_scrap>, DURASTEEL, 0.001);
advNether.addItemUpgradeOutput(<journey:firestoneclump>, DURASTEEL, 0.015);
//恒钢级
advNether.addItemUpgradeOutput(<taiga:osram_ore>, AEONSTEEL, 0.02);
advNether.addItemUpgradeOutput(<taiga:prometheum_ore>, AEONSTEEL, 0.015);
advNether.addItemUpgradeOutput(<taiga:valyrium_ore>, AEONSTEEL, 0.009);
advNether.addItemUpgradeOutput(<additions:thyminite_ore>, AEONSTEEL, 0.008);
advNether.addItemUpgradeOutput(<taiga:tiberium_crystal>, AEONSTEEL, 0.06);
advNether.addItemUpgradeOutput(<draconicevolution:draconium_dust>, AEONSTEEL, 0.004);
advNether.addItemUpgradeOutput(<gct_ores:witherium_dust>, AEONSTEEL, 0.004);
//炫钢级
advNether.addItemUpgradeOutput(<additions:lavarite_ore>, CHROMASTEEL, 0.005);
advNether.addItemUpgradeOutput(<additions:infernium_ore>, CHROMASTEEL, 0.005);
advNether.addItemUpgradeOutput(<additions:freezite_ore>, CHROMASTEEL, 0.005);
//寰宇级
advNether.addItemUpgradeOutput(<additions:nether_harcadium_ore>, COSMILITE, 0.002);
advNether.addItemUpgradeOutput(<tiths:lizanite>, COSMILITE, 0.002);
//终焉级
advNether.addItemUpgradeOutput(<additions:lighteum_ore>, FINALLIUM, 0.009);
advNether.addItemUpgradeOutput(<additions:mangisite_ore>, FINALLIUM, 0.008);
advNether.addItemUpgradeOutput(<additions:oneo_ore>, FINALLIUM, 0.007);
advNether.addItemUpgradeOutput(<additions:xenidium_ore>, FINALLIUM, 0.006);
advNether.addItemUpgradeOutput(<additions:rapesesium_ore>, FINALLIUM, 0.003);
advNether.addRecipeTooltip("§d请注意，绝大部分高级矿石产出需要机器强化组件，具体请查询“模块化电容”");
advNether.addRecipeTooltip("§e需要下界维度强化组件");
advNether.setMaxThreads(1).build();

var advEnd = RecipeBuilder.newBuilder("upgrade_end_1", "advanced_miner", 200);
advEnd.addPreCheckHandler(function(event as RecipeCheckEvent) {
    if (event.controller.world.dimension != 1) {
        if ((!(event.controller.hasMachineUpgrade("miner_upg_dimend")))) {
            event.setFailed("缺少末地组件！");
        }
    } else {
        event.setFailed("当前维度就是末地！");
    }
});
advEnd.addEnergyPerTickInput(200);
advEnd.addItemOutput(<minecraft:ender_pearl>).setChance(0.08).setIgnoreOutputCheck(true);
advEnd.addItemOutput(<tiths:ender_crevice_shard>).setChance(0.05).setIgnoreOutputCheck(true);
//不锈钢级
advEnd.addItemUpgradeOutput(<minecraft:obsidian>, STAINLESS, 0.05);
advEnd.addItemUpgradeOutput(<quark:biotite>, STAINLESS, 0.05);
//耐钢级
advEnd.addItemUpgradeOutput(<endreborn:item_end_essence>, DURASTEEL, 0.04);
advEnd.addItemUpgradeOutput(<thermalfoundation:material:895>, DURASTEEL, 0.06);
advEnd.addItemUpgradeOutput(<journey:enderilliumshard>, DURASTEEL, 0.01);
//恒钢级
advEnd.addItemUpgradeOutput(<taiga:abyssum_ore>, AEONSTEEL, 0.02);
advEnd.addItemUpgradeOutput(<taiga:palladium_ore>, AEONSTEEL, 0.017);
advEnd.addItemUpgradeOutput(<taiga:uru_ore>, AEONSTEEL, 0.015);
advEnd.addItemUpgradeOutput(<taiga:aurorium_ore>, AEONSTEEL, 0.015);
advEnd.addItemUpgradeOutput(<taiga:obsidiorite_block>, AEONSTEEL, 0.008);
advEnd.addItemUpgradeOutput(<taiga:obsidioritecobble_block>, AEONSTEEL, 0.012);
advEnd.addItemUpgradeOutput(<draconicevolution:draconium_dust>, AEONSTEEL, 0.02);
advEnd.addItemUpgradeOutput(<gct_ores:witherium_dust>, AEONSTEEL, 0.02);
advEnd.addItemUpgradeOutput(<gct_mobs:resonated_scrap>, AEONSTEEL, 0.001);
//炫钢级
advEnd.addItemUpgradeOutput(<endreborn:block_wolframium_ore>, CHROMASTEEL, 0.009);
advEnd.addItemUpgradeOutput(<additions:plasmarite_ore>, CHROMASTEEL, 0.005);
advEnd.addItemUpgradeOutput(<biomesoplenty:gem>, CHROMASTEEL, 0.01);
//寰宇级
advEnd.addItemUpgradeOutput(<additions:titanium_ore>, COSMILITE, 0.0015);
advEnd.addItemUpgradeOutput(<additions:end_harcadium_ore>, COSMILITE, 0.005);
//终焉级
advEnd.addItemUpgradeOutput(<additions:thallium_ore>, FINALLIUM, 0.005);
advEnd.addItemUpgradeOutput(<additions:manarium_ore>, FINALLIUM, 0.01);
advEnd.addItemUpgradeOutput(<additions:soilium_ore>, FINALLIUM, 0.008);
advEnd.addItemUpgradeOutput(<additions:breakium_ore>, FINALLIUM, 0.006);
advEnd.addItemUpgradeOutput(<additions:fenzium_ore>, FINALLIUM, 0.012);
advEnd.addItemUpgradeOutput(<additions:sissidium_ore>, FINALLIUM, 0.0045);
advEnd.addItemUpgradeOutput(<additions:technetium_ore>, FINALLIUM, 0.003);
advEnd.addItemUpgradeOutput(<moretcon:oregravitonium>, FINALLIUM, 0.02);
//波动级
advEnd.addItemUpgradeOutput(<additions:breedum_ore>, WAVITE, 0.0015);
advEnd.addRecipeTooltip("§d请注意，绝大部分高级矿石产出需要机器强化组件，具体请查询“模块化电容”");
advEnd.addRecipeTooltip("§e需要末地维度强化组件");
advEnd.setMaxThreads(1).build();
