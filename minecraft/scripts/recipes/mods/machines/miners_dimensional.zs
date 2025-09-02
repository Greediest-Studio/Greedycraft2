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
import mods.modularmachinery.MMEvents;
import mods.modularmachinery.MachineTickEvent;
import mods.modularmachinery.ControllerGUIRenderEvent;
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

MachineModifier.setMaxParallelism("dimensional_miner", 65536);
MachineModifier.setMaxThreads("dimensional_miner", 0);

MMEvents.onMachinePreTick("dimensional_miner", function(event as MachineTickEvent) {
    if (isNull(event.controller.customData.dims)) {
        event.controller.customData = {dims : [] as int[]};
    } else {
        var dims as int[] = event.controller.customData.dims as int[];
        if (!(dims has event.controller.world.dimension)) {
            event.controller.extraThreadCount = (dims.length + 1);
        } else {
            event.controller.extraThreadCount = dims.length;
        }
    }
});

var overworld = RecipeBuilder.newBuilder("dim_overworld", "dimensional_miner", 200);
overworld.addEnergyPerTickInput(200);
overworld.addPreCheckHandler(function(event as RecipeCheckEvent) {
    if (event.controller.world.dimension != 0) {
        if (!isNull(event.controller.customData.dims)) {
            if ((!(event.controller.hasMachineUpgrade("miner_upg_multidim"))) || (!(event.controller.customData.dims as int[] has 0))) {
                event.setFailed("缺少时空组件或控制器未绑定维度标记！");
            }
        } else {
            event.setFailed("机器初始化失败！");
        }
    } else {
        event.setFailed("当前维度就是主世界！");
    }
});
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
overworld.addRecipeTooltip("§e需要时空采掘升级且控制器绑定了主世界维度标记！");
overworld.setMaxThreads(1).build();

var nether = RecipeBuilder.newBuilder("dim_nether", "dimensional_miner", 200);
nether.addEnergyPerTickInput(200);
nether.addPreCheckHandler(function(event as RecipeCheckEvent) {
    if (event.controller.world.dimension != -1) {
        if (!isNull(event.controller.customData.dims)) {
            if ((!(event.controller.hasMachineUpgrade("miner_upg_multidim"))) || (!(event.controller.customData.dims as int[] has -1))) {
                event.setFailed("缺少时空组件或控制器未绑定维度标记！");
            }
        } else {
            event.setFailed("机器初始化失败！");
        }
    } else {
        event.setFailed("当前维度就是下界！");
    }
});
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
nether.addRecipeTooltip("§e需要时空采掘升级且控制器绑定了下界维度标记！");
nether.setMaxThreads(1).build();

var end = RecipeBuilder.newBuilder("dim_end", "dimensional_miner", 200);
end.addEnergyPerTickInput(200);
end.addPreCheckHandler(function(event as RecipeCheckEvent) {
    if (event.controller.world.dimension != 1) {
        if (!isNull(event.controller.customData.dims)) {
            if ((!(event.controller.hasMachineUpgrade("miner_upg_multidim"))) || (!(event.controller.customData.dims as int[] has 1))) {
                event.setFailed("缺少时空组件或控制器未绑定维度标记！");
            }
        } else {
            event.setFailed("机器初始化失败！");
        }
    } else {
        event.setFailed("当前维度就是末地！");
    }
});
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
end.addRecipeTooltip("§e需要时空采掘升级且控制器绑定了末地维度标记！");
end.setMaxThreads(1).build();

var twilightf = RecipeBuilder.newBuilder("dim_twilight_forest", "dimensional_miner", 200);
twilightf.addRecipeTooltip("§d请注意，绝大部分高级矿石产出需要机器强化组件，具体请查询“模块化电容”");
twilightf.addEnergyPerTickInput(200);
twilightf.addPreCheckHandler(function(event as RecipeCheckEvent) {
    if (event.controller.world.dimension != 7) {
        if (!isNull(event.controller.customData.dims)) {
            if ((!(event.controller.hasMachineUpgrade("miner_upg_multidim"))) || (!(event.controller.customData.dims as int[] has 7))) {
                event.setFailed("缺少时空组件或控制器未绑定维度标记！");
            }
        } else {
            event.setFailed("机器初始化失败！");
        }
    } else {
        event.setFailed("当前维度就是暮色森林！");
    }
});
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
twilightf.addRecipeTooltip("§e需要时空采掘升级且控制器绑定了暮色森林维度标记！");
twilightf.setMaxThreads(1).build();

var aether = RecipeBuilder.newBuilder("dim_aether", "dimensional_miner", 200);
aether.addEnergyPerTickInput(200);
aether.addPreCheckHandler(function(event as RecipeCheckEvent) {
    if (event.controller.world.dimension != 173) {
        if (!isNull(event.controller.customData.dims)) {
            if ((!(event.controller.hasMachineUpgrade("miner_upg_multidim"))) || (!(event.controller.customData.dims as int[] has 173))) {
                event.setFailed("缺少时空组件或控制器未绑定维度标记！");
            }
        } else {
            event.setFailed("机器初始化失败！");
        }
    } else {
        event.setFailed("当前维度就是天境！");
    }
});
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
aether.addRecipeTooltip("§e需要时空采掘升级且控制器绑定了天境维度标记！");
aether.setMaxThreads(1).build();

var abysswaste = RecipeBuilder.newBuilder("dim_abyss_wasteland", "dimensional_miner", 200);
abysswaste.addEnergyPerTickInput(200);
abysswaste.addPreCheckHandler(function(event as RecipeCheckEvent) {
    if (event.controller.world.dimension != 50) {
        if (!isNull(event.controller.customData.dims)) {
            if ((!(event.controller.hasMachineUpgrade("miner_upg_multidim"))) || (!(event.controller.customData.dims as int[] has 50))) {
                event.setFailed("缺少时空组件或控制器未绑定维度标记！");
            }
        } else {
            event.setFailed("机器初始化失败！");
        }
    } else {
        event.setFailed("当前维度就是深渊荒原！");
    }
});
abysswaste.addItemOutput(<abyssalcraft:coralium>).setChance(0.08).setIgnoreOutputCheck(true);
abysswaste.addItemOutput(<thermalfoundation:material:772>).setChance(0.06).setIgnoreOutputCheck(true);
abysswaste.addItemOutput(<abyssalcraft:cobblestone:4>).setChance(0.1).setIgnoreOutputCheck(true);
//不锈钢级
abysswaste.addItemUpgradeOutput(<abyssalcraft:abylcorore>, STAINLESS, 0.03);
abysswaste.addItemUpgradeOutput(<abyssalcraft:cpearl>, STAINLESS, 0.02);
//恒钢级
abysswaste.addItemUpgradeOutput(<additions:guaninite_ore>, AEONSTEEL, 0.012);
//终焉级
abysswaste.addItemUpgradeOutput(<additions:stripium_ore>, FINALLIUM, 0.009);
abysswaste.addItemUpgradeOutput(<additions:ttwo_ore>, FINALLIUM, 0.008);
abysswaste.addRecipeTooltip("§d请注意，绝大部分高级矿石产出需要机器强化组件，具体请查询“模块化电容”");
abysswaste.addRecipeTooltip("§e需要时空采掘升级且控制器绑定了深渊荒原维度标记！");
abysswaste.setMaxThreads(1).build();

var dreadland = RecipeBuilder.newBuilder("dim_dreadland", "dimensional_miner", 200);
dreadland.addEnergyPerTickInput(200);
dreadland.addPreCheckHandler(function(event as RecipeCheckEvent) {
    if (event.controller.world.dimension != 51) {
        if (!isNull(event.controller.customData.dims)) {
            if ((!(event.controller.hasMachineUpgrade("miner_upg_multidim"))) || (!(event.controller.customData.dims as int[] has 51))) {
                event.setFailed("缺少时空组件或控制器未绑定维度标记！");
            }
        } else {
            event.setFailed("机器初始化失败！");
        }
    } else {
        event.setFailed("当前维度就是恐惧之地！");
    }
});
//耐钢级
dreadland.addItemUpgradeOutput(<abyssalcraft:abydreadore>, DURASTEEL, 0.08);
dreadland.addItemUpgradeOutput(<abyssalcraft:dreadfragment>, DURASTEEL, 0.02);
//恒钢级
dreadland.addItemUpgradeOutput(<additions:adeninite_ore>, AEONSTEEL, 0.012);
//终焉级
dreadland.addItemUpgradeOutput(<additions:togrium_ore>, FINALLIUM, 0.004);
dreadland.addItemUpgradeOutput(<additions:antimony_ore>, FINALLIUM, 0.004);
dreadland.addRecipeTooltip("§d请注意，绝大部分高级矿石产出需要机器强化组件，具体请查询“模块化电容”");
dreadland.addRecipeTooltip("§e需要时空采掘升级且控制器绑定了恐惧之地维度标记！");
dreadland.setMaxThreads(1).build();

var omothol = RecipeBuilder.newBuilder("dim_omothol", "dimensional_miner", 200);
omothol.addEnergyPerTickInput(200);
omothol.addPreCheckHandler(function(event as RecipeCheckEvent) {
    if (event.controller.world.dimension != 52) {
        if (!isNull(event.controller.customData.dims)) {
            if ((!(event.controller.hasMachineUpgrade("miner_upg_multidim"))) || (!(event.controller.customData.dims as int[] has 52))) {
                event.setFailed("缺少时空组件或控制器未绑定维度标记！");
            }
        } else {
            event.setFailed("机器初始化失败！");
        }
    } else {
        event.setFailed("当前维度就是奥穆索！");
    }
});
//寰宇级
omothol.addItemUpgradeOutput(<additions:mistium_ore>, COSMILITE, 0.008);
//终焉级
omothol.addItemUpgradeOutput(<additions:yoggleseum_ore>, FINALLIUM, 0.007);
omothol.addItemUpgradeOutput(<additions:circlium_ore>, FINALLIUM, 0.003);
omothol.addItemUpgradeOutput(<additions:dimesium_ore>, FINALLIUM, 0.005);
omothol.addRecipeTooltip("§d请注意，绝大部分高级矿石产出需要机器强化组件，具体请查询“模块化电容”");
omothol.addRecipeTooltip("§e需要时空采掘升级且控制器绑定了奥穆索维度标记！");
omothol.setMaxThreads(1).build();

var darkrealm = RecipeBuilder.newBuilder("dim_dark_realm", "dimensional_miner", 200);
darkrealm.addEnergyPerTickInput(200);
darkrealm.addPreCheckHandler(function(event as RecipeCheckEvent) {
    if (event.controller.world.dimension != 53) {
        if (!isNull(event.controller.customData.dims)) {
            if ((!(event.controller.hasMachineUpgrade("miner_upg_multidim"))) || (!(event.controller.customData.dims as int[] has 53))) {
                event.setFailed("缺少时空组件或控制器未绑定维度标记！");
            }
        } else {
            event.setFailed("机器初始化失败！");
        }
    } else {
        event.setFailed("当前维度就是黑暗领域！");
    }
});
//不锈钢级
darkrealm.addItemUpgradeOutput(<abyssalcraft:shadowgem>, STAINLESS, 0.01);
//寰宇级
darkrealm.addItemUpgradeOutput(<additions:bnightium_ore>, COSMILITE, 0.008);
darkrealm.addRecipeTooltip("§d请注意，绝大部分高级矿石产出需要机器强化组件，具体请查询“模块化电容”");
darkrealm.addRecipeTooltip("§e需要时空采掘升级且控制器绑定了黑暗领域维度标记！");
darkrealm.setMaxThreads(1).build();

var darkerrealm = RecipeBuilder.newBuilder("dim_darker_realm", "dimensional_miner", 200);
darkerrealm.addEnergyPerTickInput(200);
darkerrealm.addPreCheckHandler(function(event as RecipeCheckEvent) {
    if (event.controller.world.dimension != 54) {
        if (!isNull(event.controller.customData.dims)) {
            if ((!(event.controller.hasMachineUpgrade("miner_upg_multidim"))) || (!(event.controller.customData.dims as int[] has 54))) {
                event.setFailed("缺少时空组件或控制器未绑定维度标记！");
            }
        } else {
            event.setFailed("机器初始化失败！");
        }
    } else {
        event.setFailed("当前维度就是深暗领域！");
    }
});
//寰宇级
darkerrealm.addItemUpgradeOutput(<gct_aby:dreadiumore>, COSMILITE, 0.03);
darkerrealm.addItemUpgradeOutput(<gct_aby:ethauxiumore>, COSMILITE, 0.01);
darkerrealm.addItemUpgradeOutput(<gct_aby:saniteore>, COSMILITE, 0.004);
darkerrealm.addRecipeTooltip("§d请注意，绝大部分高级矿石产出需要机器强化组件，具体请查询“模块化电容”");
darkerrealm.addRecipeTooltip("§e需要时空采掘升级且控制器绑定了深暗领域维度标记！");
darkerrealm.setMaxThreads(1).build();

var warpland = RecipeBuilder.newBuilder("dim_warp_land", "dimensional_miner", 200);
warpland.addEnergyPerTickInput(200);
warpland.addPreCheckHandler(function(event as RecipeCheckEvent) {
    if (event.controller.world.dimension != 55) {
        if (!isNull(event.controller.customData.dims)) {
            if ((!(event.controller.hasMachineUpgrade("miner_upg_multidim"))) || (!(event.controller.customData.dims as int[] has 55))) {
                event.setFailed("缺少时空组件或控制器未绑定维度标记！");
            }
        } else {
            event.setFailed("机器初始化失败！");
        }
    } else {
        event.setFailed("当前维度就是扭曲遗址！");
    }
});
//终焉级
warpland.addItemUpgradeOutput(<gct_aby:azathothium_ore_complex>, FINALLIUM, 0.01);
warpland.addItemUpgradeOutput(<gct_aby:nyralathotepium_ore_complex>, FINALLIUM, 0.01);
warpland.addItemUpgradeOutput(<gct_aby:yogsothothium_ore_complex>, FINALLIUM, 0.01);
warpland.addItemUpgradeOutput(<gct_aby:shubniggurathium_ore_complex>, FINALLIUM, 0.01);
warpland.addRecipeTooltip("§d请注意，绝大部分高级矿石产出需要机器强化组件，具体请查询“模块化电容”");
warpland.addRecipeTooltip("§e需要时空采掘升级且控制器绑定了扭曲遗址维度标记！");
warpland.setMaxThreads(1).build();

var iceika = RecipeBuilder.newBuilder("dim_iceika", "dimensional_miner", 200);
iceika.addEnergyPerTickInput(200);
iceika.addPreCheckHandler(function(event as RecipeCheckEvent) {
    if (event.controller.world.dimension != 425) {
        if (!isNull(event.controller.customData.dims)) {
            if ((!(event.controller.hasMachineUpgrade("miner_upg_multidim"))) || (!(event.controller.customData.dims as int[] has 425))) {
                event.setFailed("缺少时空组件或控制器未绑定维度标记！");
            }
        } else {
            event.setFailed("机器初始化失败！");
        }
    } else {
        event.setFailed("当前维度就是冰晶雪原！");
    }
});
iceika.addItemOutput(<divinerpg:corrupted_shards>).setChance(0.04).setIgnoreOutputCheck(true);
iceika.addItemOutput(<divinerpg:divine_shards>).setChance(0.04).setIgnoreOutputCheck(true);
iceika.addItemOutput(<divinerpg:jungle_shards>).setChance(0.04).setIgnoreOutputCheck(true);
iceika.addItemOutput(<divinerpg:terran_shards>).setChance(0.04).setIgnoreOutputCheck(true);
iceika.addItemOutput(<divinerpg:molten_shards>).setChance(0.04).setIgnoreOutputCheck(true);
//耐钢级
iceika.addItemUpgradeOutput(<additions:iciricium_ore>, DURASTEEL, 0.01);
iceika.addRecipeTooltip("§d请注意，绝大部分高级矿石产出需要机器强化组件，具体请查询“模块化电容”");
iceika.addRecipeTooltip("§e需要时空采掘升级且控制器绑定了冰晶雪原维度标记！");
iceika.setMaxThreads(1).build();

var arcana = RecipeBuilder.newBuilder("dim_arcana", "dimensional_miner", 200);
arcana.addEnergyPerTickInput(200);
arcana.addPreCheckHandler(function(event as RecipeCheckEvent) {
    if (event.controller.world.dimension != 426) {
        if (!isNull(event.controller.customData.dims)) {
            if ((!(event.controller.hasMachineUpgrade("miner_upg_multidim"))) || (!(event.controller.customData.dims as int[] has 426))) {
                event.setFailed("缺少时空组件或控制器未绑定维度标记！");
            }
        } else {
            event.setFailed("机器初始化失败！");
        }
    } else {
        event.setFailed("当前维度就是秘界！");
    }
});
//恒钢级
arcana.addItemUpgradeOutput(<divinerpg:raw_arcanium>, AEONSTEEL, 0.03);
arcana.addRecipeTooltip("§d请注意，绝大部分高级矿石产出需要机器强化组件，具体请查询“模块化电容”");
arcana.addRecipeTooltip("§e需要时空采掘升级且控制器绑定了秘界维度标记！");
arcana.setMaxThreads(1).build();

var aurorian = RecipeBuilder.newBuilder("dim_aurorian", "dimensional_miner", 200);
aurorian.addEnergyPerTickInput(200);
aurorian.addPreCheckHandler(function(event as RecipeCheckEvent) {
    if (event.controller.world.dimension != 645) {
        if (!isNull(event.controller.customData.dims)) {
            if ((!(event.controller.hasMachineUpgrade("miner_upg_multidim"))) || (!(event.controller.customData.dims as int[] has 645))) {
                event.setFailed("缺少时空组件或控制器未绑定维度标记！");
            }
        } else {
            event.setFailed("机器初始化失败！");
        }
    } else {
        event.setFailed("当前维度就是极光幽境！");
    }
});
//不锈钢级
aurorian.addItemUpgradeOutput(<theaurorian:moonstoneore>, STAINLESS, 0.05);
aurorian.addItemUpgradeOutput(<theaurorian:ceruleanore>, STAINLESS, 0.03);
aurorian.addItemUpgradeOutput(<theaurorian:crystal>, STAINLESS, 0.03);
//耐钢级
aurorian.addItemUpgradeOutput(<theaurorian:scrapaurorianite>, DURASTEEL, 0.02);
aurorian.addItemUpgradeOutput(<theaurorian:scrapumbra>, DURASTEEL, 0.02);
aurorian.addItemUpgradeOutput(<theaurorian:scrapcrystalline>, DURASTEEL, 0.02);
aurorian.addRecipeTooltip("§d请注意，绝大部分高级矿石产出需要机器强化组件，具体请查询“模块化电容”");
aurorian.addRecipeTooltip("§e需要时空采掘升级且控制器绑定了极光幽境维度标记！");
aurorian.setMaxThreads(1).build();

var frozenlands = RecipeBuilder.newBuilder("dim_frozen_lands", "dimensional_miner", 200);
frozenlands.addEnergyPerTickInput(200);
frozenlands.addPreCheckHandler(function(event as RecipeCheckEvent) {
    if (event.controller.world.dimension != 823) {
        if (!isNull(event.controller.customData.dims)) {
            if ((!(event.controller.hasMachineUpgrade("miner_upg_multidim"))) || (!(event.controller.customData.dims as int[] has 823))) {
                event.setFailed("缺少时空组件或控制器未绑定维度标记！");
            }
        } else {
            event.setFailed("机器初始化失败！");
        }
    } else {
        event.setFailed("当前维度就是遗忘冰川！");
    }
});
//恒钢级
frozenlands.addItemUpgradeOutput(<additions:chillinium_ore>, AEONSTEEL, 0.04);
frozenlands.addItemUpgradeOutput(<additions:germanium_ore>, AEONSTEEL, 0.03);
frozenlands.addRecipeTooltip("§d请注意，绝大部分高级矿石产出需要机器强化组件，具体请查询“模块化电容”");
frozenlands.addRecipeTooltip("§e需要时空采掘升级且控制器绑定了遗忘冰川维度标记！");
frozenlands.setMaxThreads(1).build();

var boiling = RecipeBuilder.newBuilder("dim_boiling_point", "dimensional_miner", 200);
boiling.addEnergyPerTickInput(200);
boiling.addPreCheckHandler(function(event as RecipeCheckEvent) {
    if (event.controller.world.dimension != 822) {
        if (!isNull(event.controller.customData.dims)) {
            if ((!(event.controller.hasMachineUpgrade("miner_upg_multidim"))) || (!(event.controller.customData.dims as int[] has 822))) {
                event.setFailed("缺少时空组件或控制器未绑定维度标记！");
            }
        } else {
            event.setFailed("机器初始化失败！");
        }
    } else {
        event.setFailed("当前维度就是怒焰石林！");
    }
});
//恒钢级
boiling.addItemUpgradeOutput(<additions:flamium_ore>, AEONSTEEL, 0.04);
boiling.addItemUpgradeOutput(<additions:sorrowium_ore>, AEONSTEEL, 0.02);
boiling.addItemUpgradeOutput(<journey:blazium>, AEONSTEEL, 0.03);
boiling.addRecipeTooltip("§d请注意，绝大部分高级矿石产出需要机器强化组件，具体请查询“模块化电容”");
boiling.addRecipeTooltip("§e需要时空采掘升级且控制器绑定了怒焰石林维度标记！");
boiling.setMaxThreads(1).build();

var euca = RecipeBuilder.newBuilder("dim_euca", "dimensional_miner", 200);
euca.addEnergyPerTickInput(200);
euca.addPreCheckHandler(function(event as RecipeCheckEvent) {
    if (event.controller.world.dimension != 820) {
        if (!isNull(event.controller.customData.dims)) {
            if ((!(event.controller.hasMachineUpgrade("miner_upg_multidim"))) || (!(event.controller.customData.dims as int[] has 820))) {
                event.setFailed("缺少时空组件或控制器未绑定维度标记！");
            }
        } else {
            event.setFailed("机器初始化失败！");
        }
    } else {
        event.setFailed("当前维度就是桉域！");
    }
});
//炫钢级
euca.addItemUpgradeOutput(<journey:celestiumore>, CHROMASTEEL, 0.03);
euca.addItemUpgradeOutput(<journey:koriteore>, CHROMASTEEL, 0.03);
euca.addItemUpgradeOutput(<journey:mekyumore>, CHROMASTEEL, 0.03);
euca.addItemUpgradeOutput(<journey:storonore>, CHROMASTEEL, 0.03);
euca.addRecipeTooltip("§d请注意，绝大部分高级矿石产出需要机器强化组件，具体请查询“模块化电容”");
euca.addRecipeTooltip("§e需要时空采掘升级且控制器绑定了桉域维度标记！");
euca.setMaxThreads(1).build();

var depth = RecipeBuilder.newBuilder("dim_depth", "dimensional_miner", 200);
depth.addEnergyPerTickInput(200);
depth.addPreCheckHandler(function(event as RecipeCheckEvent) {
    if (event.controller.world.dimension != 821) {
        if (!isNull(event.controller.customData.dims)) {
            if ((!(event.controller.hasMachineUpgrade("miner_upg_multidim"))) || (!(event.controller.customData.dims as int[] has 821))) {
                event.setFailed("缺少时空组件或控制器未绑定维度标记！");
            }
        } else {
            event.setFailed("机器初始化失败！");
        }
    } else {
        event.setFailed("当前维度就是噬渊！");
    }
});
//炫钢级
depth.addItemUpgradeOutput(<journey:flairiumore>, CHROMASTEEL, 0.03);
depth.addItemUpgradeOutput(<journey:desore>, CHROMASTEEL, 0.03);
//终焉级
depth.addItemUpgradeOutput(<additions:barite_ore>, CHROMASTEEL, 0.04);
depth.addRecipeTooltip("§d请注意，绝大部分高级矿石产出需要机器强化组件，具体请查询“模块化电容”");
depth.addRecipeTooltip("§e需要时空采掘升级且控制器绑定了噬渊维度标记！");
depth.setMaxThreads(1).build();

var corba = RecipeBuilder.newBuilder("dim_corba", "dimensional_miner", 200);
corba.addEnergyPerTickInput(200);
corba.addPreCheckHandler(function(event as RecipeCheckEvent) {
    if (event.controller.world.dimension != 824) {
        if (!isNull(event.controller.customData.dims)) {
            if ((!(event.controller.hasMachineUpgrade("miner_upg_multidim"))) || (!(event.controller.customData.dims as int[] has 824))) {
                event.setFailed("缺少时空组件或控制器未绑定维度标记！");
            }
        } else {
            event.setFailed("机器初始化失败！");
        }
    } else {
        event.setFailed("当前维度就是尘泥沼泽！");
    }
});
//炫钢级
corba.addItemUpgradeOutput(<journey:orbaditeore>, CHROMASTEEL, 0.03);
corba.addItemUpgradeOutput(<journey:gorbitegem>, CHROMASTEEL, 0.04);
corba.addRecipeTooltip("§d请注意，绝大部分高级矿石产出需要机器强化组件，具体请查询“模块化电容”");
corba.addRecipeTooltip("§e需要时空采掘升级且控制器绑定了尘泥沼泽维度标记！");
corba.setMaxThreads(1).build();

var terrania = RecipeBuilder.newBuilder("dim_terrania", "dimensional_miner", 200);
terrania.addEnergyPerTickInput(200);
terrania.addPreCheckHandler(function(event as RecipeCheckEvent) {
    if (event.controller.world.dimension != 827) {
        if (!isNull(event.controller.customData.dims)) {
            if ((!(event.controller.hasMachineUpgrade("miner_upg_multidim"))) || (!(event.controller.customData.dims as int[] has 827))) {
                event.setFailed("缺少时空组件或控制器未绑定维度标记！");
            }
        } else {
            event.setFailed("机器初始化失败！");
        }
    } else {
        event.setFailed("当前维度就是迷雾丛林！");
    }
});
//寰宇级
terrania.addItemUpgradeOutput(<additions:chloroplast_ore>, COSMILITE, 0.04);
terrania.addRecipeTooltip("§d请注意，绝大部分高级矿石产出需要机器强化组件，具体请查询“模块化电容”");
terrania.addRecipeTooltip("§e需要时空采掘升级且控制器绑定了迷雾丛林维度标记！");
terrania.setMaxThreads(1).build();

var cloudia = RecipeBuilder.newBuilder("dim_cloudia", "dimensional_miner", 200);
cloudia.addEnergyPerTickInput(200);
cloudia.addPreCheckHandler(function(event as RecipeCheckEvent) {
    if (event.controller.world.dimension != 826) {
        if (!isNull(event.controller.customData.dims)) {
            if ((!(event.controller.hasMachineUpgrade("miner_upg_multidim"))) || (!(event.controller.customData.dims as int[] has 826))) {
                event.setFailed("缺少时空组件或控制器未绑定维度标记！");
            }
        } else {
            event.setFailed("机器初始化失败！");
        }
    } else {
        event.setFailed("当前维度就是苍穹之城！");
    }
});
//寰宇级
cloudia.addItemUpgradeOutput(<journey:lunitechunk>, COSMILITE, 0.04);
cloudia.addRecipeTooltip("§d请注意，绝大部分高级矿石产出需要机器强化组件，具体请查询“模块化电容”");
cloudia.addRecipeTooltip("§e需要时空采掘升级且控制器绑定了苍穹之城维度标记！");
cloudia.setMaxThreads(1).build();

var deepdark = RecipeBuilder.newBuilder("dim_deep_dark", "dimensional_miner", 200);
deepdark.addEnergyPerTickInput(200);
deepdark.addPreCheckHandler(function(event as RecipeCheckEvent) {
    if (event.controller.world.dimension != -11325) {
        if (!isNull(event.controller.customData.dims)) {
            if ((!(event.controller.hasMachineUpgrade("miner_upg_multidim"))) || (!(event.controller.customData.dims as int[] has -11325))) {
                event.setFailed("缺少时空组件或控制器未绑定维度标记！");
            }
        } else {
            event.setFailed("机器初始化失败！");
        }
    } else {
        event.setFailed("当前维度就是漆黑世界！");
    }
});
//炫钢级
deepdark.addItemUpgradeOutput(<additions:shadowium_ore>, CHROMASTEEL, 0.02);
deepdark.addRecipeTooltip("§d请注意，绝大部分高级矿石产出需要机器强化组件，具体请查询“模块化电容”");
deepdark.addRecipeTooltip("§e需要时空采掘升级且控制器绑定了漆黑世界维度标记！");
deepdark.setMaxThreads(1).build();

var city = RecipeBuilder.newBuilder("dim_lost_city", "dimensional_miner", 200);
city.addEnergyPerTickInput(200);
city.addPreCheckHandler(function(event as RecipeCheckEvent) {
    if (event.controller.world.dimension != 111) {
        if (!isNull(event.controller.customData.dims)) {
            if ((!(event.controller.hasMachineUpgrade("miner_upg_multidim"))) || (!(event.controller.customData.dims as int[] has 111))) {
                event.setFailed("缺少时空组件或控制器未绑定维度标记！");
            }
        } else {
            event.setFailed("机器初始化失败！");
        }
    } else {
        event.setFailed("当前维度就是失落城市！");
    }
});
//炫钢级
city.addItemUpgradeOutput(<additions:limonite_ore>, DURASTEEL, 0.03);
city.addItemUpgradeOutput(<additions:rosite_ore>, DURASTEEL, 0.025);
city.addRecipeTooltip("§d请注意，绝大部分高级矿石产出需要机器强化组件，具体请查询“模块化电容”");
city.addRecipeTooltip("§e需要时空采掘升级且控制器绑定了失落城市维度标记！");
city.setMaxThreads(1).build();

var everdawn = RecipeBuilder.newBuilder("dim_everdawn", "dimensional_miner", 200);
everdawn.addEnergyPerTickInput(200);
everdawn.addPreCheckHandler(function(event as RecipeCheckEvent) {
    if (event.controller.world.dimension != 77) {
        if (!isNull(event.controller.customData.dims)) {
            if ((!(event.controller.hasMachineUpgrade("miner_upg_multidim"))) || (!(event.controller.customData.dims as int[] has 77))) {
                event.setFailed("缺少时空组件或控制器未绑定维度标记！");
            }
        } else {
            event.setFailed("机器初始化失败！");
        }
    } else {
        event.setFailed("当前维度就是恒晓之地！");
    }
});
//炫钢级
everdawn.addItemUpgradeOutput(<blue_skies:horizonite_ore>, CHROMASTEEL, 0.02);
everdawn.addItemUpgradeOutput(<blue_skies:diopside_gem>, CHROMASTEEL, 0.03);
everdawn.addItemUpgradeOutput(<blue_skies:pyrope_gem>, CHROMASTEEL, 0.03);
everdawn.addItemUpgradeOutput(<blue_skies:turquoise_gem>, CHROMASTEEL, 0.03);
everdawn.addItemUpgradeOutput(<blue_skies:charoite>, CHROMASTEEL, 0.03);
everdawn.addItemUpgradeOutput(<blue_skies:moonstone>, CHROMASTEEL, 0.03);
everdawn.addItemUpgradeOutput(<minecraft:emerald>, CHROMASTEEL, 0.03);
everdawn.addRecipeTooltip("§d请注意，绝大部分高级矿石产出需要机器强化组件，具体请查询“模块化电容”");
everdawn.addRecipeTooltip("§e需要时空采掘升级且控制器绑定了恒晓之地维度标记！");
everdawn.setMaxThreads(1).build();

var everbright = RecipeBuilder.newBuilder("dim_everbright", "dimensional_miner", 200);
everbright.addEnergyPerTickInput(200);
everbright.addPreCheckHandler(function(event as RecipeCheckEvent) {
    if (event.controller.world.dimension != 76) {
        if (!isNull(event.controller.customData.dims)) {
            if ((!(event.controller.hasMachineUpgrade("miner_upg_multidim"))) || (!(event.controller.customData.dims as int[] has 76))) {
                event.setFailed("缺少时空组件或控制器未绑定维度标记！");
            }
        } else {
            event.setFailed("机器初始化失败！");
        }
    } else {
        event.setFailed("当前维度就是永昼之地！");
    }
});
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
everbright.addRecipeTooltip("§e需要时空采掘升级且控制器绑定了永昼之地维度标记！");
everbright.setMaxThreads(1).build();

var everheaven = RecipeBuilder.newBuilder("dim_everheaven", "dimensional_miner", 200);
everheaven.addEnergyPerTickInput(200);
everheaven.addPreCheckHandler(function(event as RecipeCheckEvent) {
    if (event.controller.world.dimension != 78) {
        if (!isNull(event.controller.customData.dims)) {
            if ((!(event.controller.hasMachineUpgrade("miner_upg_multidim"))) || (!(event.controller.customData.dims as int[] has 78))) {
                event.setFailed("缺少时空组件或控制器未绑定维度标记！");
            }
        } else {
            event.setFailed("机器初始化失败！");
        }
    } else {
        event.setFailed("当前维度就是深空之地！");
    }
});
//寰宇级
everheaven.addItemUpgradeOutput(<tiths:ore_halleium>, COSMILITE, 0.008);
everheaven.addItemUpgradeOutput(<tiths:ore_altairium>, COSMILITE, 0.008);
everheaven.addItemUpgradeOutput(<tiths:ore_tonium>, COSMILITE, 0.008);
everheaven.addItemUpgradeOutput(<tiths:ore_polarium>, COSMILITE, 0.008);
everheaven.addItemUpgradeOutput(<tiths:ore_hothium>, COSMILITE, 0.008);
everheaven.addItemUpgradeOutput(<tiths:ore_stellarium>, COSMILITE, 0.004);
everheaven.addRecipeTooltip("§d请注意，绝大部分高级矿石产出需要机器强化组件，具体请查询“模块化电容”");
everheaven.addRecipeTooltip("§e需要时空采掘升级且控制器绑定了深空之地维度标记！");
everheaven.setMaxThreads(1).build();

var voidland = RecipeBuilder.newBuilder("dim_void", "dimensional_miner", 200);
voidland.addEnergyPerTickInput(200);
voidland.addPreCheckHandler(function(event as RecipeCheckEvent) {
    if (event.controller.world.dimension != 100) {
        if (!isNull(event.controller.customData.dims)) {
            if ((!(event.controller.hasMachineUpgrade("miner_upg_multidim"))) || (!(event.controller.customData.dims as int[] has 100))) {
                event.setFailed("缺少时空组件或控制器未绑定维度标记！");
            }
        } else {
            event.setFailed("机器初始化失败！");
        }
    } else {
        event.setFailed("当前维度就是虚空之地！");
    }
});
//寰宇级
voidland.addItemUpgradeOutput(<minecraft:bedrock>, COSMILITE, 0.3);
voidland.addItemUpgradeOutput(<additions:void_harcadium_ore>, COSMILITE, 0.1);
voidland.addItemUpgradeOutput(<additions:void_ore>, COSMILITE, 0.02);
voidland.addRecipeTooltip("§d请注意，绝大部分高级矿石产出需要机器强化组件，具体请查询“模块化电容”");
voidland.addRecipeTooltip("§e需要时空采掘升级且控制器绑定了虚空之地维度标记！");
voidland.setMaxThreads(1).build();

var nowhere = RecipeBuilder.newBuilder("dim_nowhere", "dimensional_miner", 200);
nowhere.addEnergyPerTickInput(200);
nowhere.addPreCheckHandler(function(event as RecipeCheckEvent) {
    if (event.controller.world.dimension != 101) {
        if (!isNull(event.controller.customData.dims)) {
            if ((!(event.controller.hasMachineUpgrade("miner_upg_multidim"))) || (!(event.controller.customData.dims as int[] has 101))) {
                event.setFailed("缺少时空组件或控制器未绑定维度标记！");
            }
        } else {
            event.setFailed("机器初始化失败！");
        }
    } else {
        event.setFailed("当前维度就是无名之地！");
    }
});
//寰宇级
nowhere.addItemUpgradeOutput(<additions:void_harcadium_ore>, COSMILITE, 0.15);
nowhere.addItemUpgradeOutput(<additions:void_ore>, COSMILITE, 0.06);
nowhere.addItemUpgradeOutput(<additions:adamantium_ore>, COSMILITE, 0.02);
//终焉级
nowhere.addItemUpgradeOutput(<additions:dawnium_ore>, FINALLIUM, 0.008);
nowhere.addRecipeTooltip("§d请注意，绝大部分高级矿石产出需要机器强化组件，具体请查询“模块化电容”");
nowhere.addRecipeTooltip("§e需要时空采掘升级且控制器绑定了无名之地维度标记！");
nowhere.setMaxThreads(1).build();

var order = RecipeBuilder.newBuilder("dim_order", "dimensional_miner", 200);
order.addEnergyPerTickInput(200);
order.addPreCheckHandler(function(event as RecipeCheckEvent) {
    if (event.controller.world.dimension != 102) {
        if (!isNull(event.controller.customData.dims)) {
            if ((!(event.controller.hasMachineUpgrade("miner_upg_multidim"))) || (!(event.controller.customData.dims as int[] has 102))) {
                event.setFailed("缺少时空组件或控制器未绑定维度标记！");
            }
        } else {
            event.setFailed("机器初始化失败！");
        }
    } else {
        event.setFailed("当前维度就是秩序之地！");
    }
});
//终焉级
order.addItemUpgradeOutput(<gct_ores:order_crystal>, FINALLIUM, 0.0005);
order.addRecipeTooltip("§d请注意，绝大部分高级矿石产出需要机器强化组件，具体请查询“模块化电容”");
order.addRecipeTooltip("§e需要时空采掘升级且控制器绑定了秩序之地维度标记！");
order.setMaxThreads(1).build();

var betweenland = RecipeBuilder.newBuilder("dim_betweenland", "dimensional_miner", 200);
betweenland.addEnergyPerTickInput(200);
betweenland.addPreCheckHandler(function(event as RecipeCheckEvent) {
    if (event.controller.world.dimension != 20) {
        if (!isNull(event.controller.customData.dims)) {
            if ((!(event.controller.hasMachineUpgrade("miner_upg_multidim"))) || (!(event.controller.customData.dims as int[] has 20))) {
                event.setFailed("缺少时空组件或控制器未绑定维度标记！");
            }
        } else {
            event.setFailed("机器初始化失败！");
        }
    } else {
        event.setFailed("当前维度就是交错次元！");
    }
});
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
//波动级
betweenland.addItemUpgradeOutput(<additions:izumium_ore>, WAVITE, 0.02);
betweenland.addRecipeTooltip("§d请注意，绝大部分高级矿石产出需要机器强化组件，具体请查询“模块化电容”");
betweenland.addRecipeTooltip("§e需要时空采掘升级且控制器绑定了交错次元维度标记！");
betweenland.setMaxThreads(1).build();

var alfheim = RecipeBuilder.newBuilder("dim_alfheim", "dimensional_miner", 200);
alfheim.addEnergyPerTickInput(200);
alfheim.addPreCheckHandler(function(event as RecipeCheckEvent) {
    if (event.controller.world.dimension != 42) {
        if (!isNull(event.controller.customData.dims)) {
            if ((!(event.controller.hasMachineUpgrade("miner_upg_multidim"))) || (!(event.controller.customData.dims as int[] has 42))) {
                event.setFailed("缺少时空组件或控制器未绑定维度标记！");
            }
        } else {
            event.setFailed("机器初始化失败！");
        }
    } else {
        event.setFailed("当前维度就是亚尔夫海姆！");
    }
});
//寰宇级
alfheim.addItemUpgradeOutput(<gct_mobs:elementium_ore>, COSMILITE, 0.03);
alfheim.addItemUpgradeOutput(<gct_mobs:terrasteel_ore>, COSMILITE, 0.008);
//终焉级
alfheim.addItemUpgradeOutput(<gct_mobs:orichalcos_ore>, FINALLIUM, 0.005);
alfheim.addItemUpgradeOutput(<gct_mobs:botanical_stone>, FINALLIUM, 0.004);
alfheim.addRecipeTooltip("§d请注意，绝大部分高级矿石产出需要机器强化组件，具体请查询“模块化电容”");
alfheim.addRecipeTooltip("§e需要时空采掘升级且控制器绑定了亚尔夫海姆维度标记！");
alfheim.setMaxThreads(1).build();

var starland = RecipeBuilder.newBuilder("dim_starland", "dimensional_miner", 200);
starland.addEnergyPerTickInput(200);
starland.addPreCheckHandler(function(event as RecipeCheckEvent) {
    if (event.controller.world.dimension != 80) {
        if (!isNull(event.controller.customData.dims)) {
            if ((!(event.controller.hasMachineUpgrade("miner_upg_multidim"))) || (!(event.controller.customData.dims as int[] has 80))) {
                event.setFailed("缺少时空组件或控制器未绑定维度标记！");
            }
        } else {
            event.setFailed("机器初始化失败！");
        }
    } else {
        event.setFailed("当前维度就是永恒星域！");
    }
});
//寰宇级
starland.addItemUpgradeOutput(<astralsorcery:itemcraftingcomponent>, COSMILITE, 0.05);
starland.addItemUpgradeOutput(<additions:star_metal_ore>, COSMILITE, 0.04);
//终焉级
starland.addItemUpgradeOutput(<additions:astralmetal_ore>, FINALLIUM, 0.02);
starland.addItemUpgradeOutput(<additions:nasalum_ore>, FINALLIUM, 0.01);
starland.addItemUpgradeOutput(<additions:lunarine_ore>, FINALLIUM, 0.02);
starland.addItemUpgradeOutput(<additions:arimite_ore>, FINALLIUM, 0.005);
starland.addRecipeTooltip("§d请注意，绝大部分高级矿石产出需要机器强化组件，具体请查询“模块化电容”");
starland.addRecipeTooltip("§e需要时空采掘升级且控制器绑定了永恒星域维度标记！");
starland.setMaxThreads(1).build();

var atlantis = RecipeBuilder.newBuilder("dim_atlantis", "dimensional_miner", 200);
atlantis.addEnergyPerTickInput(200);
atlantis.addPreCheckHandler(function(event as RecipeCheckEvent) {
    if (event.controller.world.dimension != 324987) {
        if (!isNull(event.controller.customData.dims)) {
            if ((!(event.controller.hasMachineUpgrade("miner_upg_multidim"))) || (!(event.controller.customData.dims as int[] has 324987))) {
                event.setFailed("缺少时空组件或控制器未绑定维度标记！");
            }
        } else {
            event.setFailed("机器初始化失败！");
        }
    } else {
        event.setFailed("当前维度就是亚特兰蒂斯！");
    }
});
//寰宇级
atlantis.addItemUpgradeOutput(<additions:tanatonium_ore>, COSMILITE, 0.015);
atlantis.addItemUpgradeOutput(<additions:imitatium_ore>, COSMILITE, 0.015);
atlantis.addRecipeTooltip("§d请注意，绝大部分高级矿石产出需要机器强化组件，具体请查询“模块化电容”");
atlantis.addRecipeTooltip("§e需要时空采掘升级且控制器绑定了亚特兰蒂斯维度标记！");
atlantis.setMaxThreads(1).build();

var besidevoid = RecipeBuilder.newBuilder("dim_besidevoid", "dimensional_miner", 200);
besidevoid.addEnergyPerTickInput(200);
besidevoid.addPreCheckHandler(function(event as RecipeCheckEvent) {
    if (event.controller.world.dimension != 41) {
        if (!isNull(event.controller.customData.dims)) {
            if ((!(event.controller.hasMachineUpgrade("miner_upg_multidim"))) || (!(event.controller.customData.dims as int[] has 41))) {
                event.setFailed("缺少时空组件或控制器未绑定维度标记！");
            }
        } else {
            event.setFailed("机器初始化失败！");
        }
    } else {
        event.setFailed("当前维度就是血腥裂隙！");
    }
});
//终焉级
besidevoid.addItemUpgradeOutput(<additions:losessium_ore>, FINALLIUM, 0.003);
besidevoid.addRecipeTooltip("§d请注意，绝大部分高级矿石产出需要机器强化组件，具体请查询“模块化电容”");
besidevoid.setMaxThreads(1).build();

MMEvents.onControllerGUIRender("dimensional_miner", function(event as ControllerGUIRenderEvent) {
    var dimList as int[] = [];
    if (!isNull(event.controller.customData.dims)) {
        dimList = event.controller.customData.dims as int[];
    }
    var info as string[] = [
        "§a///时空相位采掘机控制面板///",
        "§a机器名称：§eLV5 - 时空相位采掘机",
        "§a可用维度：",
        (dimList has 0?"§e":"§c") ~ "主界 " ~ (dimList has -1?"§e":"§c") ~ "下界 " ~ (dimList has 1?"§e":"§c") ~ "末地 " ~ (dimList has 7?"§e":"§c") ~ "暮色 " ~ (dimList has 173?"§e":"§c") ~ "天境 " ~ (dimList has 50?"§e":"§c") ~ "深渊 " ~ (dimList has 51?"§e":"§c") ~ "恐惧 " ~ (dimList has 52?"§e":"§c") ~ "残存 " ~ (dimList has 53?"§e":"§c") ~ "黑暗 " ~ (dimList has 54?"§e":"§c") ~ "深暗",
        (dimList has 55?"§e":"§c") ~ "扭曲 " ~ (dimList has 425?"§e":"§c") ~ "雪原 " ~ (dimList has 426?"§e":"§c") ~ "秘界 " ~ (dimList has 645?"§e":"§c") ~ "极光 " ~ (dimList has 823?"§e":"§c") ~ "冰川 " ~ (dimList has 822?"§e":"§c") ~ "怒焰 " ~ (dimList has 820?"§e":"§c") ~ "桉域 " ~ (dimList has 821?"§e":"§c") ~ "噬渊 " ~ (dimList has 824?"§e":"§c") ~ "尘泥 " ~ (dimList has 827?"§e":"§c") ~ "迷雾",
        (dimList has 826?"§e":"§c") ~ "苍穹 " ~ (dimList has -11325?"§e":"§c") ~ "漆黑 " ~ (dimList has 111?"§e":"§c") ~ "失落 " ~ (dimList has 77?"§e":"§c") ~ "恒晓 " ~ (dimList has 76?"§e":"§c") ~ "永昼 " ~ (dimList has 78?"§e":"§c") ~ "深空 " ~ (dimList has 100?"§e":"§c") ~ "虚空 " ~ (dimList has 101?"§e":"§c") ~ "无名 " ~ (dimList has 102?"§e":"§c") ~ "秩序 " ~ (dimList has 20?"§e":"§c") ~ "交错",
        (dimList has 42?"§e":"§c") ~ "精灵 " ~ (dimList has 80?"§e":"§c") ~ "星域 " ~ (dimList has 324987?"§e":"§c") ~ "深海 " ~ (dimList has 41?"§e":"§c") ~ "血腥 "
    ];
    event.extraInfo = info;
});
