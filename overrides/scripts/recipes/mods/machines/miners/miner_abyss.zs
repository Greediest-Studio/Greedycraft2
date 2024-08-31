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

RecipeBuilder.newBuilder("miner_abyss", "miner_abyss", speed, 0)//这两个"miner_basic"是机器的ID与配方ID，保持相同即可
    .addEnergyPerTickInput(energy)
    .setDimension([50])//定义维度

    //接下来每两行为一组，一组对应一个物品
    .addItemOutput(<abyssalcraft:abylcorore>)//定义物品ID
    .setChance(0.3f / 10.0f)//定义几率（比方说这个就是0.3÷10=3%）
    
    .addItemOutput(<abyssalcraft:coralium>)
    .setChance(0.8f / 10.0f)
    .addItemOutput(<abyssalcraft:nitre>)
    .setChance(0.6f / 10.0f)
    .addItemOutput(<abyssalcraft:cpearl>)
    .setChance(0.2f / 10.0f)
    .addItemOutput(<additions:greedycraft-guaninite_ore>)
    .setChance(0.12f / 10.0f)
    .addItemOutput(<abyssalcraft:cobblestone:1>)
    .setChance(3.0f / 10.0f)
    .addItemOutput(<abyssalcraft:cobblestone:4>)
    .setChance(1.0f / 10.0f)
    .addItemOutput(<additions:taigaddon-stripium_ore>)
    .setChance(0.09f / 10.0f)
    .addItemOutput(<additions:taigaddon-ttwo_ore>)
    .setChance(0.045f / 10.0f)

    .build();//注册语句，不能省略，否则会报错