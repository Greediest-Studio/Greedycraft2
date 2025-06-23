/*
 * This script is created for the GreedyCraft Tweaks by 咕咕咕.
 */
/*
#priority 0

import crafttweaker.oredict.IOreDictEntry;
import crafttweaker.item.IItemStack;
import crafttweaker.data.IData;
import crafttweaker.item.IIngredient;
import crafttweaker.liquid.ILiquidStack;

import mods.modularmachinery.RecipeBuilder;
import mods.modularmachinery.RecipeAdapterBuilder;
import mods.modularmachinery.MachineModifier;
import mods.modularmachinery.FactoryRecipeThread;
import mods.ctutils.utils.Math;
import mods.jei.JEI;

import scripts.util.machines as MMUtil;

MachineModifier.setMaxThreads("ore_5x", 0);
MachineModifier.setInternalParallelism("ore_5x", 256);
for i in 0 to 32 {
    MachineModifier.addCoreThread("ore_5x", FactoryRecipeThread.createCoreThread("§e§l处理线程" + i));
}

static blacklist as IItemStack[] = [
    <nuclearcraft:ingot:11>,
    <nuclearcraft:ingot:12>,
    <biomesoplenty:gem:7>,
    <tiths:ingot_titanium>,
    <additions:sulfur_ingot>
];

function test(ingot as IItemStack) as bool {
    if (ingot.definition.id has "") {
        return true;
    }
    for item in blacklist {
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
                RecipeBuilder.newBuilder("ingot1" + ores.name , "ore_5x" , 10)
                    .addItemInput(ores)
                    .addFluidInput(<liquid:sulfuric_acid> * 50)
                    .addFluidInput(<liquid:oxygen> * 100)
                    .addEnergyPerTickInput(1000)
                    .addItemOutput(ingot * 5)
                    .build();
            }
        }


        val od_gem = oreDict.get(ores.name.replace("ore","gem"));
        val od_gemlist = od_gem.itemArray;
        for gem in od_gemlist {
            if !isNull(gem) && !test(gem) {
                RecipeBuilder.newBuilder("gem1" + ores.name , "ore_5x" , 10)
                    .addItemInput(ores)
                    .addFluidInput(<liquid:sulfuric_acid> * 50)
                    .addFluidInput(<liquid:oxygen> * 100)
                    .addEnergyPerTickInput(1000)
                    .addItemOutput(gem * 5)
                    .build();
            }
        }
    }
    if ores.name has "compound" {
        val od_ingot = oreDict.get(ores.name.replace("compound","ingot"));
        val od_ingotlist = od_ingot.itemArray;
        for ingot in od_ingotlist {
            if !isNull(ingot) && !test(ingot) {
                RecipeBuilder.newBuilder("ingot2" + ores.name , "ore_5x" , 10)
                    .addItemInput(ores)
                    .addFluidInput(<liquid:sulfuric_acid> * 50)
                    .addFluidInput(<liquid:oxygen> * 100)
                    .addEnergyPerTickInput(1000)
                    .addItemOutput(ingot)
                    .build();
            }
        }   

        val od_gem = oreDict.get(ores.name.replace("compound","gem"));
        val od_gemlist = od_gem.itemArray;
        for gem in od_gemlist {
            if !isNull(gem) && !test(gem) {
                RecipeBuilder.newBuilder("gem2" + ores.name , "ore_5x" , 10)
                    .addItemInput(ores)
                    .addFluidInput(<liquid:sulfuric_acid> * 50)
                    .addFluidInput(<liquid:oxygen> * 100)
                    .addEnergyPerTickInput(1000)
                    .addItemOutput(gem)
                    .build();
            }
        }
    }    
}

val debuglist_ore as IItemStack[IOreDictEntry] = {
    <ore:oreImitatium> : <tiths:ingot_imitatium>,
    <ore:oreFierymetal> : <twilightforest:fiery_ingot>,
    <ore:oreTanatonium> : <tiths:ingot_tanatonium>,
    <ore:oreSanite> : <gct_mobs:sanite_ingot>
};

for ores , ingot in debuglist_ore {
    RecipeBuilder.newBuilder("debug_ingot" ~ ingot.definition.id , "ore_5x" , 10)
        .addItemInput(ores)
        .addFluidInput(<liquid:sulfuric_acid> * 50)
        .addFluidInput(<liquid:oxygen> * 100)
        .addEnergyPerTickInput(1000)
        .addItemOutput(ingot * 5)
        .build();
}

val debuglist_compound as IItemStack[IOreDictEntry] = {
    <ore:compoundImitatium> : <tiths:ingot_imitatium>,
    <ore:compoundFierymetal> : <twilightforest:fiery_ingot>,
    <ore:compoundTanatonium> : <tiths:ingot_tanatonium>,
    <ore:compoundSanite> : <gct_mobs:sanite_ingot>
};

for ores , ingot in debuglist_compound {
    RecipeBuilder.newBuilder("debug_compound" ~ ingot.definition.id , "ore_5x" , 10)
        .addItemInput(ores)
        .addFluidInput(<liquid:sulfuric_acid> * 50)
        .addFluidInput(<liquid:oxygen> * 100)
        .addEnergyPerTickInput(1000)
        .addItemOutput(ingot)
        .build();
}
*/
