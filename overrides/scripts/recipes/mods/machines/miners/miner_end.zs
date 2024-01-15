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

RecipeBuilder.newBuilder("miner_end", "miner_end", speed, 0)//这两个"miner_basic"是机器的ID与配方ID，保持相同即可
    .addEnergyPerTickInput(energy)
    .setDimension([1])//定义维度

    //接下来每两行为一组，一组对应一个物品
    .addItemOutput(<minecraft:ender_pearl>)//定义物品ID
    .setChance(1.0f / 10.0f)//定义几率（比方说这个就是0.3÷10=3%）
    
    .addItemOutput(<tiths:ender_crevice_shard>)
    .setChance(0.5f / 10.0f)
    .addItemOutput(<taiga:aurorium_ore>)
    .setChance(0.2f / 10.0f)
    .addItemOutput(<taiga:abyssum_ore>)
    .setChance(0.2f / 10.0f)
    .addItemOutput(<contenttweaker:sub_block_holder_2:12>)
    .setChance(0.16f / 10.0f)
    .addItemOutput(<taiga:uru_ore>)
    .setChance(0.14f / 10.0f)
    .addItemOutput(<additions:greedycraft-plasmarite_ore>)
    .setChance(0.8f / 10.0f)
    .addItemOutput(<taiga:obsidiorite_block>)
    .setChance(0.12f / 10.0f)
    .addItemOutput(<taiga:obsidioritecobble_block>)
    .setChance(0.24f / 10.0f)
    .addItemOutput(<minecraft:end_stone>)
    .setChance(4.0f / 10.0f)
    .addItemOutput(<draconicevolution:draconium_dust>)
    .setChance(0.2f / 10.0f)
    .addItemOutput(<gct_ores:witherium_dust>)
    .setChance(0.2f / 10.0f)

    .build();//注册语句，不能省略，否则会报错