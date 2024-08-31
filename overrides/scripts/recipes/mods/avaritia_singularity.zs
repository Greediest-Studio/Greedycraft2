
#priority 3000

import crafttweaker.item.IItemStack;
import crafttweaker.data.IData;
import crafttweaker.item.IIngredient;

import mods.avaritia.ExtremeCrafting;
import mods.avaritia.Compressor;
import mods.extendedcrafting.CompressionCrafting;
import mods.ctintegration.util.RecipePattern;

val cj = <extendedcrafting:material:8>;
val gj = <extendedcrafting:material:9>;
val jy = <extendedcrafting:material:10>;
val zj = <extendedcrafting:material:11>;
val js = <extendedcrafting:material:12>;

//原版无尽贪婪奇点：
CompressionCrafting.addRecipe(<avaritia:singularity:0>, <minecraft:iron_block>, 800, cj, 100000000, 500000);
CompressionCrafting.addRecipe(<avaritia:singularity:1>, <minecraft:gold_block>, 500, gj, 100000000, 500000);
CompressionCrafting.addRecipe(<avaritia:singularity:2>, <minecraft:lapis_block>, 600, cj, 100000000, 500000);
CompressionCrafting.addRecipe(<avaritia:singularity:3>, <minecraft:redstone_block>, 600, cj, 100000000, 500000);
CompressionCrafting.addRecipe(<avaritia:singularity:4>, <minecraft:quartz_block>, 600, cj, 100000000, 500000);
CompressionCrafting.addRecipe(<avaritia:singularity:5>, <thermalfoundation:storage>, 800, cj, 100000000, 500000);
CompressionCrafting.addRecipe(<avaritia:singularity:6>, <thermalfoundation:storage:1>, 800, cj, 100000000, 500000);
CompressionCrafting.addRecipe(<avaritia:singularity:7>, <thermalfoundation:storage:3>, 800, cj, 100000000, 500000);
CompressionCrafting.addRecipe(<avaritia:singularity:8>, <thermalfoundation:storage:2>, 600, cj, 100000000, 500000);
CompressionCrafting.addRecipe(<avaritia:singularity:9>, <thermalfoundation:storage:5>, 600, cj, 100000000, 500000);
CompressionCrafting.addRecipe(<avaritia:singularity:10>, <minecraft:diamond_block>, 400, gj, 100000000, 500000);
CompressionCrafting.addRecipe(<avaritia:singularity:11>, <minecraft:emerald_block>, 400, gj, 100000000, 500000);
CompressionCrafting.addRecipe(<avaritia:singularity:12>, <redstonearsenal:storage>, 400, gj, 100000000, 500000);
CompressionCrafting.addRecipe(<avaritia:singularity:13>, <thermalfoundation:storage:6>, 400, gj, 100000000, 500000);
CompressionCrafting.addRecipe(<avaritia:singularity:14>, <thermalfoundation:storage:7>, 400, gj, 100000000, 500000);

