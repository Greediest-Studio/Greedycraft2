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

RecipeBuilder.newBuilder("miner_foggy", "miner_foggy", speed, 0)//这两个"miner_basic"是机器的ID与配方ID，保持相同即可
    .addEnergyPerTickInput(energy)
    .setDimension([69])//定义维度

    //接下来每两行为一组，一组对应一个物品
    .addItemOutput(<mist:niobium_ore>)//定义物品ID
    .setChance(0.1f / 10.0f)//定义几率（比方说这个就是0.3÷10=3%）
    
    .addItemOutput(<thermalfoundation:material:771>)
    .setChance(0.3f / 10.0f)
    .addItemOutput(<mist:filter_coal_ore>)
    .setChance(0.2f / 10.0f)
    .addItemOutput(<additions:mekaddon-ruthenium_ore>)
    .setChance(0.05f / 10.0f)
    .addItemOutput(<additions:mekaddon-rhodium_ore>)
    .setChance(0.04f / 10.0f)
    
    .build();//注册语句，不能省略，否则会报错