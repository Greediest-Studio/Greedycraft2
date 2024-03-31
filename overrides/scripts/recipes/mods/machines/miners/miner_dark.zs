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

RecipeBuilder.newBuilder("miner_dark", "miner_dark", speed, 0)//这两个"miner_basic"是机器的ID与配方ID，保持相同即可
    .addEnergyPerTickInput(energy)
    .setDimension([54])//定义维度

    //接下来每两行为一组，一组对应一个物品
    .addItemOutput(<additions:greedycraft-bnightium_ore>)//定义物品ID
    .setChance(0.08f / 10.0f)//定义几率（比方说这个就是0.3÷10=3%）
    
    .addItemOutput(<gct_aby:dreadiumore>)
    .setChance(0.3f / 10.0f)
    .addItemOutput(<gct_aby:ethauxiumore>)
    .setChance(0.1f / 10.0f)
    .addItemOutput(<gct_aby:saniteore>)
    .setChance(0.04f / 10.0f)
    .addItemOutput(<abyssalcraft:cobblestone>)
    .setChance(5.0f / 10.0f)

    .build();//注册语句，不能省略，否则会报错