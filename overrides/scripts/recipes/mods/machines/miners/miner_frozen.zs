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

RecipeBuilder.newBuilder("miner_frozen", "miner_frozen", speed, 0)//这两个"miner_basic"是机器的ID与配方ID，保持相同即可
    .addEnergyPerTickInput(energy)
    .setDimension([823])//定义维度

    //接下来每两行为一组，一组对应一个物品
    .addItemOutput(<additions:greedycraft-iciricium_ore>)//定义物品ID
    .setChance(0.5f / 10.0f)//定义几率（比方说这个就是0.3÷10=3%）
    
    .addItemOutput(<divinerpg:ice_shards>)
    .setChance(0.2f / 10.0f)
    .addItemOutput(<divinerpg:terran_shards>)
    .setChance(0.2f / 10.0f)
    .addItemOutput(<divinerpg:molten_shards>)
    .setChance(0.2f / 10.0f)
    .addItemOutput(<divinerpg:divine_shards>)
    .setChance(0.2f / 10.0f)
    .addItemOutput(<divinerpg:divine_shards>)
    .setChance(0.2f / 10.0f)
    .addItemOutput(<divinerpg:jungle_shards>)
    .setChance(0.2f / 10.0f)
    .addItemOutput(<divinerpg:ender_shards>)
    .setChance(0.2f / 10.0f)
    .addItemOutput(<divinerpg:corrupted_shards>)
    .setChance(0.2f / 10.0f)
    .addItemOutput(<additions:greedycraft-chillinium_ore>)
    .setChance(0.12f / 10.0f)
    .addItemOutput(<minecraft:snowball>)
    .setChance(7.0f / 10.0f)

    .build();//注册语句，不能省略，否则会报错