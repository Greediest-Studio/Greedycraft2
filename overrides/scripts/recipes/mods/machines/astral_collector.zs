/*
 * This script is created for the GreedyCraft Tweaks by mc_Edwin.
 */

/*
Discidia -> Sagittarius
Armara -> Capricornus
Vicio -> Gemini
Aevitas -> Virgo
Evorsio -> Aries
Lucerna -> Libra
Mineralis -> Taurus
Horologium -> Scorpius
Octans -> Pisces
Bootes -> Aquarius
Fornax -> Leo
Pelotrio -> Cancer
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

RecipeBuilder.newBuilder("astral_gem_01", "astral_collector", 400)
    .addItemInput(<additions:astral-astral_gem_00> * 1)
    .addStarlightInput(6000, "astralsorcery.constellation.discidia")
    .setDimension([80])
    .addItemOutput(<additions:astral-astral_gem_01>)
    .build();
RecipeBuilder.newBuilder("astral_gem_02", "astral_collector", 400)
    .addItemInput(<additions:astral-astral_gem_00> * 1)
    .addStarlightInput(6000, "astralsorcery.constellation.armara")
    .setDimension([80])
    .addItemOutput(<additions:astral-astral_gem_02>)
    .build();
RecipeBuilder.newBuilder("astral_gem_03", "astral_collector", 400)
    .addItemInput(<additions:astral-astral_gem_00> * 1)
    .addStarlightInput(6000, "astralsorcery.constellation.vicio")
    .setDimension([80])
    .addItemOutput(<additions:astral-astral_gem_03>)
    .build();
RecipeBuilder.newBuilder("astral_gem_04", "astral_collector", 400)
    .addItemInput(<additions:astral-astral_gem_00> * 1)
    .addStarlightInput(6000, "astralsorcery.constellation.aevitas")
    .setDimension([80])
    .addItemOutput(<additions:astral-astral_gem_04>)
    .build();
RecipeBuilder.newBuilder("astral_gem_05", "astral_collector", 400)
    .addItemInput(<additions:astral-astral_gem_00> * 1)
    .addStarlightInput(6000, "astralsorcery.constellation.evorsio")
    .setDimension([80])
    .addItemOutput(<additions:astral-astral_gem_05>)
    .build();
RecipeBuilder.newBuilder("astral_gem_06", "astral_collector", 400)
    .addItemInput(<additions:astral-astral_gem_00> * 1)
    .addStarlightInput(6000, "astralsorcery.constellation.lucerna")
    .setDimension([80])
    .addItemOutput(<additions:astral-astral_gem_06>)
    .build();
RecipeBuilder.newBuilder("astral_gem_07", "astral_collector", 400)
    .addItemInput(<additions:astral-astral_gem_00> * 1)
    .addStarlightInput(6000, "astralsorcery.constellation.mineralis")
    .setDimension([80])
    .addItemOutput(<additions:astral-astral_gem_07>)
    .build();
RecipeBuilder.newBuilder("astral_gem_08", "astral_collector", 400)
    .addItemInput(<additions:astral-astral_gem_00> * 1)
    .addStarlightInput(6000, "astralsorcery.constellation.horologium")
    .setDimension([80])
    .addItemOutput(<additions:astral-astral_gem_08>)
    .build();
RecipeBuilder.newBuilder("astral_gem_09", "astral_collector", 400)
    .addItemInput(<additions:astral-astral_gem_00> * 1)
    .addStarlightInput(6000, "astralsorcery.constellation.octans")
    .setDimension([80])
    .addItemOutput(<additions:astral-astral_gem_09>)
    .build();
RecipeBuilder.newBuilder("astral_gem_10", "astral_collector", 400)
    .addItemInput(<additions:astral-astral_gem_00> * 1)
    .addStarlightInput(6000, "astralsorcery.constellation.bootes")
    .setDimension([80])
    .addItemOutput(<additions:astral-astral_gem_10>)
    .build();
RecipeBuilder.newBuilder("astral_gem_11", "astral_collector", 400)
    .addItemInput(<additions:astral-astral_gem_00> * 1)
    .addStarlightInput(6000, "astralsorcery.constellation.fornax")
    .setDimension([80])
    .addItemOutput(<additions:astral-astral_gem_11>)
    .build();
RecipeBuilder.newBuilder("astral_gem_12", "astral_collector", 400)
    .addItemInput(<additions:astral-astral_gem_00> * 1)
    .addStarlightInput(6000, "astralsorcery.constellation.pelotrio")
    .setDimension([80])
    .addItemOutput(<additions:astral-astral_gem_12>)
    .build();
