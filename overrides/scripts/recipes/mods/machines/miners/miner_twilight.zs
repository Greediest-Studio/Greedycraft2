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

RecipeBuilder.newBuilder("miner_twilight", "miner_twilight", speed, 0)
    .addEnergyPerTickInput(energy)
    .setDimension([7])
    .addItemOutput(<twilightforest:torchberries>)
    .setChance(0.6f / 10.0f)
    .addItemOutput(<twilightforest:raven_feather>)
    .setChance(0.6f / 10.0f)
    .addItemOutput(<twilightforest:steeleaf_ingot>)
    .setChance(0.4f / 10.0f)
    .addItemOutput(<twilightforest:naga_scale>)
    .setChance(0.3f / 10.0f)
    .addItemOutput(<twilightforest:liveroot>)
    .setChance(0.6f / 10.0f)
    .addItemOutput(<twilightforest:borer_essence>)
    .setChance(0.6f / 10.0f)
    .addItemOutput(<twilightforest:alpha_fur>)
    .setChance(0.3f / 10.0f)
    .addItemOutput(<additions:twilightaddon-fiery_ore>)
    .setChance(0.4f / 10.0f)
    .addItemOutput(<additions:twilightaddon-knigh_metal_ore>)
    .setChance(0.4f / 10.0f)
    .addItemOutput(<twilightforest:giant_cobblestone>)
    .setChance(0.3f / 10.0f)
    .addItemOutput(<twilightforest:giant_log>)
    .setChance(0.3f / 10.0f)
    .addItemOutput(<twilightforest:giant_leaves>)
    .setChance(0.4f / 10.0f)
    .addItemOutput(<twilightforest:giant_obsidian>)
    .setChance(0.1f / 10.0f)
    .build();