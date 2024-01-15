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

RecipeBuilder.newBuilder("miner_nether", "miner_nether", speed, 0)
    .addEnergyPerTickInput(energy)
    .setDimension([-1])
    .addItemOutput(<tconstruct:ore>)
    .setChance(0.4f / 10.0f)    
    .addItemOutput(<tconstruct:ore:1>)
    .setChance(0.4f / 10.0f)    
    .addItemOutput(<divinerpg:bloodgem>)
    .setChance(0.3f / 10.0f)    
    .addItemOutput(<divinerpg:netherite_ore>)
    .setChance(0.4f / 10.0f)    
    .addItemOutput(<betternether:cincinnasite>)
    .setChance(0.6f / 10.0f)    
    .addItemOutput(<minecraft:quartz>)
    .setChance(0.6f / 10.0f)    
    .addItemOutput(<journey:hellstoneore>)
    .setChance(0.2f / 10.0f)    
    .addItemOutput(<minecraft:magma>)
    .setChance(0.3f / 10.0f)    
    .addItemOutput(<rftools:dimensional_shard>)
    .setChance(0.4f / 10.0f)    
    .addItemOutput(<netherendingores:ore_nether_modded_1:4>)
    .setChance(0.1f / 10.0f)    
    .addItemOutput(<minecraft:soul_sand>)
    .setChance(1.0f / 10.0f)    
    .addItemOutput(<minecraft:netherrack>)
    .setChance(5.0f / 10.0f)    
    .build();