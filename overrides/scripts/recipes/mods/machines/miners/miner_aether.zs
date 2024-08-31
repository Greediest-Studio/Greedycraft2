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

RecipeBuilder.newBuilder("miner_aether", "miner_aether", speed, 0)//这两个"miner_basic"是机器的ID与配方ID，保持相同即可
    .addEnergyPerTickInput(energy)
    .setDimension([173])//定义维度

    //接下来每两行为一组，一组对应一个物品
    .addItemOutput(<aether_legacy:zanite_gemstone>)//定义物品ID
    .setChance(0.5f / 10.0f)//定义几率（比方说这个就是0.3÷10=3%）
    
    .addItemOutput(<aether_legacy:gravitite_ore>)
    .setChance(0.3f / 10.0f)
    .addItemOutput(<additions:greedycraft-asgardium_ore>)
    .setChance(0.25f / 10.0f)
    .addItemOutput(<aether_legacy:ambrosium_ore>)
    .setChance(1.0f / 10.0f)
    .addItemOutput(<aether_legacy:holystone>)
    .setChance(5.0f / 10.0f)
    .addItemOutput(<additions:taigaddon-cloudite_ore>)
    .setChance(0.08f / 10.0f)
    .addItemOutput(<additions:taigaddon-molybdenum_ore>)
    .setChance(0.06f / 10.0f)
    .addItemOutput(<tinkersaether:valkyrie_nugget>)
    .setChance(0.1f / 10.0f)

    .build();//注册语句，不能省略，否则会报错