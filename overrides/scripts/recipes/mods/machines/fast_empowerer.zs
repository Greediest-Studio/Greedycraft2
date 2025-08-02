/*
 * This script is created for the GreedyCraft Tweaks by 咕咕咕.
 */

#priority 50

import crafttweaker.oredict.IOreDictEntry;
import crafttweaker.item.IItemStack;
import crafttweaker.data.IData;
import crafttweaker.item.IIngredient;
import crafttweaker.liquid.ILiquidStack;

import mods.modularmachinery.RecipeBuilder;
import mods.modularmachinery.MachineModifier;
import mods.modularmachinery.RecipeAdapterBuilder;
import mods.modularmachinery.MMEvents;
import mods.modularmachinery.ControllerGUIRenderEvent;
import mods.ctutils.utils.Math;
import mods.jei.JEI;

import scripts.util.machines as MMUtil;

MachineModifier.setMaxThreads("empowerer", 1);
MachineModifier.setInternalParallelism("empowerer", 1);
MachineModifier.setMaxParallelism("empowerer", 256);

RecipeBuilder.newBuilder("redstone" , "empowerer" , "40")
    .addItemInput(<actuallyadditions:block_crystal:0> * 1)
    .addItemInput(<minecraft:netherbrick> * 1)
    .addItemInput(<minecraft:brick> * 1)
    .addItemInput(<minecraft:redstone> * 1)
    .addItemInput(<ore:dyeRed> * 1)
    .addEnergyPerTickInput(100000)
    .addItemOutput(<actuallyadditions:block_crystal_empowered:0> * 1)
    .build();

RecipeBuilder.newBuilder("blue" , "empowerer" , "40")
    .addItemInput(<actuallyadditions:block_crystal:1> * 1)
    .addItemInput(<minecraft:prismarine_shard> * 3)
    .addItemInput(<ore:dyeCyan> * 1)
    .addEnergyPerTickInput(100000)
    .addItemOutput(<actuallyadditions:block_crystal_empowered:1> * 1)
    .build();

RecipeBuilder.newBuilder("diamond" , "empowerer" , "40")
    .addItemInput(<actuallyadditions:block_crystal:2> * 1)
    .addItemInput(<minecraft:clay_ball> * 2)
    .addItemInput(<minecraft:clay> * 1)
    .addItemInput(<ore:dyeLightBlue> * 1)
    .addEnergyPerTickInput(100000)
    .addItemOutput(<actuallyadditions:block_crystal_empowered:2> * 1)
    .build();

RecipeBuilder.newBuilder("coal" , "empowerer" , "40")
    .addItemInput(<actuallyadditions:block_crystal:3> * 1)
    .addItemInput(<minecraft:coal:1> * 1)
    .addItemInput(<minecraft:flint> * 1)
    .addItemInput(<minecraft:stone> * 1)
    .addItemInput(<ore:dyeBlack> * 1)
    .addEnergyPerTickInput(100000)
    .addItemOutput(<actuallyadditions:block_crystal_empowered:3> * 1)
    .build();

RecipeBuilder.newBuilder("green" , "empowerer" , "40")
    .addItemInput(<actuallyadditions:block_crystal:4> * 1)
    .addItemInput(<minecraft:sapling> * 1)
    .addItemInput(<minecraft:tallgrass:1> * 1)
    .addItemInput(<ore:slimeball> * 1)
    .addItemInput(<ore:dyeLime> * 1)
    .addEnergyPerTickInput(100000)
    .addItemOutput(<actuallyadditions:block_crystal_empowered:4> * 1)
    .build();

RecipeBuilder.newBuilder("iron" , "empowerer" , "40")
    .addItemInput(<actuallyadditions:block_crystal:5> * 1)
    .addItemInput(<minecraft:snowball> * 1)
    .addItemInput(<minecraft:cobblestone> * 1)
    .addItemInput(<minecraft:stone_button> * 1)
    .addItemInput(<ore:dyeGray> * 1)
    .addEnergyPerTickInput(100000)
    .addItemOutput(<actuallyadditions:block_crystal_empowered:5> * 1)
    .build();

RecipeBuilder.newBuilder("seed" , "empowerer" , "40")
    .addItemInput(<actuallyadditions:item_misc:23> * 1)
    .addItemInput(<actuallyadditions:item_canola_seed> * 4)
    .addEnergyPerTickInput(100000)
    .addItemOutput(<actuallyadditions:item_misc:24> * 1)
    .build();

RecipeBuilder.newBuilder("blackwhite" , "empowerer" , "40")
    .addItemInput(<draconicevolution:wyvern_core> * 1)
    .addItemInput(<naturesaura:aura_bottle>.withTag({stored_type: "naturesaura:nether"}) * 1)
    .addItemInput(<additions:ivorium_ingot> * 1)
    .addItemInput(<defiledlands:remorseful_gem> * 1)
    .addItemInput(<moretcon:ingotebonite> * 1)
    .addEnergyPerTickInput(100000)
    .addItemOutput(<additions:ebony_and_lvory> * 1)
    .build();

MMEvents.onControllerGUIRender("empowerer", function(event as ControllerGUIRenderEvent) {
    var info as string[] = [
        "§a///快速充能台控制面板///",
        "§a机器名称：§eLV1 - 快速充能台"
    ];
    event.extraInfo = info;
});