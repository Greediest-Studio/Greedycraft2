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

RecipeBuilder.newBuilder("miner_Molten", "miner_molten", speed, 0)//这两个"miner_basic"是机器的ID与配方ID，保持相同即可
    .addEnergyPerTickInput(energy)
    .setDimension([-1])//定义维度

    //接下来每两行为一组，一组对应一个物品
    .addItemOutput(<additions:taigaddon-lighteum_ore>)//定义物品ID
    .setChance(0.09f / 10.0f)//定义几率（比方说这个就是0.3÷10=3%）
    
    .addItemOutput(<additions:taigaddon-mangisite_ore>)
    .setChance(0.08f / 10.0f)
    .addItemOutput(<additions:taigaddon-oneo_ore>)
    .setChance(0.07f / 10.0f)
    .addItemOutput(<additions:taigaddon-xenidium_ore>)
    .setChance(0.06f / 10.0f)
    .addItemOutput(<additions:taigaddon-rapesesium_ore>)
    .setChance(0.03f / 10.0f)
    .addItemOutput(<additions:taigaddon-nether_harcadium_ore>)
    .setChance(0.12f / 10.0f)
    .addItemOutput(<taiga:osram_ore>)
    .setChance(0.5f / 10.0f)
    
    .build();//注册语句，不能省略，否则会报错