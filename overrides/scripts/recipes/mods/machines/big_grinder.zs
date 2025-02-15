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
import mods.modularmachinery.RecipeAdapterBuilder;
import mods.modularmachinery.MachineModifier;
import mods.ctutils.utils.Math;
import mods.jei.JEI;

import scripts.util.machines as MMUtil;

MachineModifier.setMaxThreads("big_grinder", 16);
MachineModifier.setInternalParallelism("big_grinder", 512);

for items in oreDict {
    var name = items.name;
    if name has "ingot" {
        var od_dust = oreDict.get("dust" ~ name.replace("ingot",""));
        var od_block = oreDict.get("block" ~ name.replace("ingot",""));
        var od_gem = oreDict.get("gem" ~ name.replace("ingot",""));
        var dust = od_dust.firstItem;
        var ingot = oreDict.get(name);
        if !isNull(dust) && !ingot.empty {
            RecipeBuilder.newBuilder("ingot" + name , "big_grinder" , 10)
                .addItemInput(ingot)
                .addEnergyPerTickInput(100)
                .addItemOutput(dust)
                .build();
        }
        if !isNull(dust) && !od_block.empty {
            RecipeBuilder.newBuilder("block" + name , "big_grinder" , 30)
                .addItemInput(od_block)
                .addEnergyPerTickInput(200)
                .addItemOutput(dust * 9)
                .build();
        }
    }
    if name has "gem" {
        var od_dust = oreDict.get("dust" ~ name.replace("gem",""));
        var od_block = oreDict.get("block" ~ name.replace("gem",""));
        var od_gem = oreDict.get(name);
        var dust = od_dust.firstItem;
        if !isNull(dust) && !od_gem.empty {
            RecipeBuilder.newBuilder("gem" + name , "big_grinder" , 10)
                .addItemInput(od_gem)
                .addEnergyPerTickInput(100)
                .addItemOutput(dust)
                .build();
        }
        if !isNull(dust) && !od_block.empty {
            RecipeBuilder.newBuilder("block" + name , "big_grinder" , 30)
                .addItemInput(od_block)
                .addEnergyPerTickInput(200)
                .addItemOutput(dust * 9)
                .build();
        }
    }
    if name has "rod" {
        var od_dust = oreDict.get("dust" ~ name.replace("rod",""));
        var od_rod = oreDict.get(name);
        var dust = od_dust.firstItem;
        if !isNull(dust) && !od_rod.empty {
            RecipeBuilder.newBuilder("rod" + name , "big_grinder" , 15)
                .addItemInput(od_rod)
                .addEnergyPerTickInput(120)
                .addItemOutput(dust * 4)
                .build();
        }
    }
    if name has "gear" {
        var od_dust = oreDict.get("dust" ~ name.replace("gear",""));
        var od_gear = oreDict.get(name);
        var dust = od_dust.firstItem;
        if !isNull(dust) && !od_gear.empty {
            RecipeBuilder.newBuilder("gear" + name , "big_grinder" , 30)
                .addItemInput(od_gear)
                .addEnergyPerTickInput(120)
                .addItemOutput(dust * 4)
                .build();
        }
    }
    if name has "plate" {
        var od_dust = oreDict.get("dust" ~ name.replace("gear",""));
        var od_plate = oreDict.get(name);
        var dust = od_dust.firstItem;
        if !isNull(dust) && !od_plate.empty {
            RecipeBuilder.newBuilder("plate" + name , "big_grinder" , 5)
                .addItemInput(od_plate)
                .addEnergyPerTickInput(120)
                .addItemOutput(dust)
                .build();
        }
    }
    if name has "ore" {
        var od_dust = oreDict.get("dust" ~ name.replace("gear",""));
        var od_ore = oreDict.get(name);
        var dust = od_dust.firstItem;
        if !isNull(dust) && !od_ore.empty {
            RecipeBuilder.newBuilder("gear" + name , "big_grinder" , 10)
                .addItemInput(od_ore)
                .addEnergyPerTickInput(200)
                .addItemOutput(dust * 2)
                .addItemOutput(dust * 1).setChance(0.5f)
                .build();
        }
    }
}