/*
 * This script is created for the GreedyCraft Tweaks by mc_Edwin.
 */

#priority 50

import crafttweaker.oredict.IOreDictEntry;
import crafttweaker.item.IItemStack;
import crafttweaker.data.IData;
import crafttweaker.item.IIngredient;
import crafttweaker.liquid.ILiquidStack;

import mods.modularmachinery.RecipeBuilder;
import mods.ctutils.utils.Math;
import mods.jei.JEI;

for i in 7 to 10 {
    RecipeBuilder.newBuilder("slate_mk7" + i, "blood_altar_mk" + i, 500)
        .addFluidInput(<liquid:lifeessence> * 1000000)
        .addItemInput(<additions:bloody-slate_6>)
        .addItemOutput(<additions:bloody-slate_7>)
        .build();
    RecipeBuilder.newBuilder("ghost_metal_ingot" + i, "blood_altar_mk" + i, 80)
        .addFluidInput(<liquid:lifeessence> * 1280000)
        .addItemInput(<ore:ingotCosmilite> * 1)
        .addItemOutput(<additions:bloody-ghost_metal>)
        .build();
    RecipeBuilder.newBuilder("darkest_stonebrick" + i, "blood_altar_mk" + i, 100)
        .addFluidInput(<liquid:lifeessence> * 3840000)
        .addItemInput(<ore:blockDarkest> * 1)
        .addItemOutput(<additions:bloody-darkest_stonebrick_large>)
        .build();
    RecipeBuilder.newBuilder("proliferation_star" + i, "blood_altar_mk" + i, 800)
        .addFluidInput(<liquid:lifeessence> * 6400000)
        .addItemInput(<additions:greedycraft-catalyst_star> * 4)
        .addItemOutput(<additions:greedycraft-proliferation_star>)
        .build();
    RecipeBuilder.newBuilder("ivorium" + i, "blood_altar_mk" + i, 100)
        .addFluidInput(<liquid:lifeessence> * 1280000)
        .addItemInput(<minecraft:bone_block> * 2)
        .addItemOutput(<additions:ivorium_ingot>)
        .build();
}
for i in 8 to 10 {
    RecipeBuilder.newBuilder("slate_mk8" + i, "blood_altar_mk" + i, 500)
        .addFluidInput(<liquid:lifeessence> * 8000000)
        .addItemInput(<additions:bloody-slate_7>)
        .addItemOutput(<additions:bloody-slate_8>)
        .build();
    RecipeBuilder.newBuilder("murderite_ingot" + i, "blood_altar_mk" + i, 200)
        .addFluidInput(<liquid:lifeessence> * 20000000)
        .addItemInput(<additions:bloody-balanced_slate>)
        .addItemOutput(<additions:greedycraft-murderite_ingot>)
        .build();
}