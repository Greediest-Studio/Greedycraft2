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

RecipeBuilder.newBuilder("miner_mana", "miner_mana", speed, 0)//这两个"miner_basic"是机器的ID与配方ID，保持相同即可
    .addEnergyPerTickInput(energy)
    .setDimension([0])//定义维度
    .addManaInput(100, true)

    //接下来每两行为一组，一组对应一个物品
    .addItemOutput(<gct_mobs:mana_cobble_stone>)//定义物品ID
    .setChance(4.0f / 10.0f)//定义几率  
    .addItemOutput(<additions:botaniaddon-manasteel_ore>)
    .setChance(0.3f / 10.0f)
    .addItemOutput(<botanicadds:mana_lapis>)
    .setChance(0.15f / 10.0f)
    .addItemOutput(<botania:manaresource:2>)
    .setChance(0.07f / 10.0f)
    .addItemOutput(<botania:quartz:1>)
    .setChance(0.2f / 10.0f)
    
    .build();//注册语句，不能省略，否则会报错