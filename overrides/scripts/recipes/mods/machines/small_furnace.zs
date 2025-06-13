/*
 * This script is created for the GreedyCraft Tweaks by 孤梦.
 */

#priority 0

#loader crafttweaker reloadable

import crafttweaker.world.IWorld;
import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;
import crafttweaker.block.IBlock;
import crafttweaker.block.IBlockDefinition;
import crafttweaker.world.IBlockPos;
import crafttweaker.liquid.ILiquidStack;
import crafttweaker.oredict.IOreDictEntry;
import crafttweaker.data.IData;
import crafttweaker.util.Math;

import mods.modularmachinery.RecipePrimer;
import mods.modularmachinery.RecipeBuilder;
import mods.modularmachinery.RecipeCheckEvent;
import mods.modularmachinery.FactoryRecipeStartEvent;
import mods.modularmachinery.FactoryRecipeTickEvent;
import mods.modularmachinery.FactoryRecipeFinishEvent;
import mods.modularmachinery.RecipeModifierBuilder;

import mods.modularmachinery.MMEvents;
import mods.modularmachinery.ControllerGUIRenderEvent;

import mods.modularmachinery.IMachineController;
import mods.modularmachinery.MachineModifier;
import mods.modularmachinery.FactoryRecipeThread;

MachineModifier.setMaxThreads("small_furnace",4);
MachineModifier.setMaxParallelism("small_furnace",1);
/* byd用不了会虚空产铁
RecipeAdapterBuilder.create("small_furnace", "minecraft:furnace")
    .addModifier(RecipeModifierBuilder.create("modularmachinery:duration", "input", 0.75, 1, false).build())
    .addModifier(RecipeModifierBuilder.create("modularmachinery:energy",   "input", 5.0, 1, false).build())
    .build();
*/

MMEvents.onControllerGUIRender("small_furnace" , function(event as ControllerGUIRenderEvent) {
    val levellist as string[int] = {
        0 : "龙芯/凋零芯",
        1 : "双足飞龙核心/堕落凋零核心",
        2 : "觉醒核心/重生核心",
        3 : "混沌核心/风暴核心",
        4 : "秩序核心",
        5 : "暂无",
        6 : "看什么看没见过占位符吗",
        7 : "还看，再看也没东西了",
        8 : "不是你怎么还在看",
        9 : "手搓个物质解压器看看实力（笑"
    };
    val ctrl = event.controller;
    val map = ctrl.customData.asMap();
    val level = isNull(map["level"]) ? 0 : map["level"].asInt();
    val bx = isNull(map["bx"]) ? 0 : map["bx"].asInt();
    val xc = isNull(map["xc"]) ? 0 : map["xc"].asInt();
    var info as string[] = [
        "§4///熔炼单元监控系统///",
        "§4当前等级：" + level,
        "§4当前每线程最大并行数：" + bx,
        "§4当前最大线程数：" + xc,
        "§4升至下一等级所需物品：" + levellist[level]
    ];

    event.extraInfo = info;
});

function test(ingot as IItemStack) as bool {
    val banlist as IItemStack[] = [
        <nuclearcraft:ingot:11>,
        <nuclearcraft:ingot:12>,
        <biomesoplenty:gem:7>,
        <tiths:ingot_titanium>,
        <minecraft:quartz>,
        <appliedenergistics2:material>,
        <additions:sulfur_ingot>
    ];
    for item in loadedMods["additions"].items {
        if (ingot.definition.id has "") {
            return true;
        }
    }
    for item in banlist {
        if (ingot.definition.id == item.definition.id) {
            return true;
        }
    }
    return false;
}



for ores in oreDict.entries {
    if ores.name has "ore" {
        val od_ingot = oreDict.get(ores.name.replace("ore","ingot"));
        val od_ingotlist = od_ingot.itemArray;
        for ingot in od_ingotlist {
            if !isNull(ingot) && !test(ingot) {
                RecipeBuilder.newBuilder("small_furnace_ingot1" + ores.name, "small_furnace", 20)
                    .addPreCheckHandler(function(event as RecipeCheckEvent) {
                        val map = event.controller.customData.asMap();
                        val bx = isNull(map["bx"]) ? 1 : map["bx"].asInt();
                        event.activeRecipe.maxParallelism = bx;
                    })
                    .addItemInput(ores)
                    .addEnergyPerTickInput(400)
                    .addItemOutput(ingot * 1)
                    .build();
            }
        }

        val od_gem = oreDict.get(ores.name.replace("ore","gem"));
        val od_gemlist = od_gem.itemArray;
        for gem in od_gemlist {
            if !isNull(gem) && !test(gem) {
                RecipeBuilder.newBuilder("small_furnace_gem1" + ores.name, "small_furnace", 20)
                    .addPreCheckHandler(function(event as RecipeCheckEvent) {
                        val map = event.controller.customData.asMap();
                        val bx = isNull(map["bx"]) ? 1 : map["bx"].asInt();
                        event.activeRecipe.maxParallelism = bx;
                    })
                    .addItemInput(ores)
                    .addEnergyPerTickInput(400)
                    .addItemOutput(gem * 1)
                    .build();
            }
        }
    }
    if ores.name has "dust" {
        val od_ingot = oreDict.get(ores.name.replace("dust","ingot"));
        val od_ingotlist = od_ingot.itemArray;
        for ingot in od_ingotlist {
            if !isNull(ingot) && !test(ingot) {
                RecipeBuilder.newBuilder("small_furnace_dust1" + ores.name, "small_furnace", 20)
                    .addPreCheckHandler(function(event as RecipeCheckEvent) {
                        val map = event.controller.customData.asMap();
                        val bx = isNull(map["bx"]) ? 1 : map["bx"].asInt();
                        event.activeRecipe.maxParallelism = bx;
                    })
                    .addItemInput(ores)
                    .addEnergyPerTickInput(400)
                    .addItemOutput(ingot * 1)
                    .build();
                //break;
            }
        }

        val od_gem = oreDict.get(ores.name.replace("dust","gem"));
        val od_gemlist = od_gem.itemArray;
        for gem in od_gemlist {
            if !isNull(gem) && !test(gem) {
                RecipeBuilder.newBuilder("small_furnace_dust2" + ores.name, "small_furnace", 20)
                    .addPreCheckHandler(function(event as RecipeCheckEvent) {
                        val map = event.controller.customData.asMap();
                        val bx = isNull(map["bx"]) ? 1 : map["bx"].asInt();
                        event.activeRecipe.maxParallelism = bx;
                    })
                    .addItemInput(ores)
                    .addEnergyPerTickInput(400)
                    .addItemOutput(gem * 1)
                    .build();
                //break;
            }
        }
    }
}

function recipe(input as IIngredient,output as IItemStack,duration as int = 20,energy as int = 400,uuid as int = 1) {
    RecipeBuilder.newBuilder(output.definition.id + uuid, "small_furnace", duration)
        .addPreCheckHandler(function(event as RecipeCheckEvent) {
            val map = event.controller.customData.asMap();
            val bx = isNull(map["bx"]) ? 1 : map["bx"].asInt();
            event.activeRecipe.maxParallelism = bx;
        })
        .addItemInput(input)
        .addEnergyPerTickInput(energy)
        .addItemOutput(output)
        .build();
}

function level(input as IIngredient,level as int,bx as int,xc as int) {
    RecipeBuilder.newBuilder("aaaaalevelupgread" + level, "small_furnace", 100)
        .addPreCheckHandler(function(event as RecipeCheckEvent) {
            val ctrl = event.controller;
            val data = ctrl.customData;
            val map = data.asMap();
            var ctrllevel = isNull(map["level"]) ? 0 : map["level"].asInt();
            if !(ctrllevel == level - 1) {event.setFailed("§4当前升级不适用于当前等级");}
        })
        .addItemInput(input)
        .addFactoryFinishHandler(function(event as FactoryRecipeFinishEvent) {
            val ctrl = event.controller;
            val data = ctrl.customData;
            val map = data.asMap();
            map["level"] = level;
            map["bx"] = bx;
            map["xc"] = xc;
            ctrl.extraThreadCount = xc;
            ctrl.customData = data as IData;
        })
        .setParallelized(false)
        .addRecipeTooltip("§e将熔炼单元等级从" + (level - 1) + "升至" + level + "级","§e升级后每线程最大并行数：" + bx,"§e升级后最大线程数：" + xc)
        .build();
}
level(<ore:coreBasic>,1,8,4);
level(<ore:coreExcellent>,2,16,8);
level(<ore:coreSuperior>,3,32,16);
level(<ore:coreEpic>,4,128,24);
level(<ore:coreOrdered>,5,256,32);

recipe(<ore:sand>,<minecraft:glass>);
recipe(<ore:dustNetherQuartz>,<appliedenergistics2:material:5>);
recipe(<ore:dustCertusQuartz>,<appliedenergistics2:material:5>,20,400,2);
recipe(<minecraft:cobblestone>,<minecraft:stone>);
recipe(<ore:blockSkyStone>,<appliedenergistics2:smooth_sky_stone_block>);
recipe(<ore:cropChorusfruit>,<minecraft:chorus_fruit_popped>);
recipe(<ore:netherrack>,<minecraft:netherbrick>);
recipe(<ore:itemClay>,<minecraft:brick>);