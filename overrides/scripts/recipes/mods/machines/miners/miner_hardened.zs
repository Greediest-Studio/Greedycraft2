#priority 30


import crafttweaker.oredict.IOreDictEntry;
import crafttweaker.item.IItemStack;
import crafttweaker.data.IData;
import crafttweaker.item.IIngredient;
import crafttweaker.liquid.ILiquidStack;

import mods.modularmachinery.RecipeBuilder;
import mods.ctutils.utils.Math;

val speed = 250;
val energy = 100;

RecipeBuilder.newBuilder("miner_hardened", "miner_hardened", speed, 0)
    .addEnergyPerTickInput(energy)
    .setDimension([0])
    .addItemOutput(<taiga:dilithium_crystal>)
    .setChance(0.35f / 10.0f)    
    .addItemOutput(<taiga:karmesine_ore>)
    .setChance(0.2f / 10.0f)    
    .addItemOutput(<taiga:jauxum_ore>)
    .setChance(0.2f / 10.0f)    
    .addItemOutput(<taiga:ovium_ore>)
    .setChance(0.2f / 10.0f)    
    .addItemOutput(<taiga:duranite_ore>)
    .setChance(0.16f / 10.0f)    
    .addItemOutput(<taiga:vibranium_ore>)
    .setChance(0.1f / 10.0f)    
    .addItemOutput(<additions:greedycraft-cryonium_ore>)
    .setChance(0.1f / 10.0f)    
    .addItemOutput(<additions:greedycraft-cytosinite_ore>)
    .setChance(0.12f / 10.0f)    
    .addItemOutput(<additions:greedycraft-snowingium_ore>)
    .setChance(0.1f / 10.0f)    
    .addItemOutput(<draconicevolution:draconium_dust>)
    .setChance(0.05f / 10.0f)    
    .addItemOutput(<gct_ores:witherium_dust>)
    .setChance(0.05f / 10.0f)    
    .build();