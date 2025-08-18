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
import mods.modularmachinery.RecipePrimer;
import mods.modularmachinery.MachineModifier;
import mods.modularmachinery.MMEvents;
import mods.modularmachinery.ControllerGUIRenderEvent;
import mods.ctutils.utils.Math;
import mods.jei.JEI;

MachineModifier.setMaxThreads("astral_collector", 1);
MachineModifier.setMaxParallelism("astral_collector", 256);
MachineModifier.setInternalParallelism("astral_collector", 1);

MMEvents.onControllerGUIRender("astral_collector", function(event as ControllerGUIRenderEvent) {
    var info as string[] = ["§a///星芒收集器控制面板///", "§a机器名称：§eLV4 - 星芒收集器"];
    event.extraInfo = info;
});

RecipeBuilder.newBuilder("astral_gem_01", "astral_collector", 400)
    .addItemInput(<additions:astral_gem_00> * 1)
    .addStarlightInput(6000, "astralsorcery.constellation.discidia")
    .addDimensionInput(80)
    .addItemOutput(<additions:astral_gem_01>)
    .build();
RecipeBuilder.newBuilder("astral_gem_02", "astral_collector", 400)
    .addItemInput(<additions:astral_gem_00> * 1)
    .addStarlightInput(6000, "astralsorcery.constellation.armara")
    .addDimensionInput(80)
    .addItemOutput(<additions:astral_gem_02>)
    .build();
RecipeBuilder.newBuilder("astral_gem_03", "astral_collector", 400)
    .addItemInput(<additions:astral_gem_00> * 1)
    .addStarlightInput(6000, "astralsorcery.constellation.vicio")
    .addDimensionInput(80)
    .addItemOutput(<additions:astral_gem_03>)
    .build();
RecipeBuilder.newBuilder("astral_gem_04", "astral_collector", 400)
    .addItemInput(<additions:astral_gem_00> * 1)
    .addStarlightInput(6000, "astralsorcery.constellation.aevitas")
    .addDimensionInput(80)
    .addItemOutput(<additions:astral_gem_04>)
    .build();
RecipeBuilder.newBuilder("astral_gem_05", "astral_collector", 400)
    .addItemInput(<additions:astral_gem_00> * 1)
    .addStarlightInput(6000, "astralsorcery.constellation.evorsio")
    .addDimensionInput(80)
    .addItemOutput(<additions:astral_gem_05>)
    .build();
RecipeBuilder.newBuilder("astral_gem_06", "astral_collector", 400)
    .addItemInput(<additions:astral_gem_00> * 1)
    .addStarlightInput(6000, "astralsorcery.constellation.lucerna")
    .addDimensionInput(80)
    .addItemOutput(<additions:astral_gem_06>)
    .build();
RecipeBuilder.newBuilder("astral_gem_07", "astral_collector", 400)
    .addItemInput(<additions:astral_gem_00> * 1)
    .addStarlightInput(6000, "astralsorcery.constellation.mineralis")
    .addDimensionInput(80)
    .addItemOutput(<additions:astral_gem_07>)
    .build();
RecipeBuilder.newBuilder("astral_gem_08", "astral_collector", 400)
    .addItemInput(<additions:astral_gem_00> * 1)
    .addStarlightInput(6000, "astralsorcery.constellation.horologium")
    .addDimensionInput(80)
    .addItemOutput(<additions:astral_gem_08>)
    .build();
RecipeBuilder.newBuilder("astral_gem_09", "astral_collector", 400)
    .addItemInput(<additions:astral_gem_00> * 1)
    .addStarlightInput(6000, "astralsorcery.constellation.octans")
    .addDimensionInput(80)
    .addItemOutput(<additions:astral_gem_09>)
    .build();
RecipeBuilder.newBuilder("astral_gem_10", "astral_collector", 400)
    .addItemInput(<additions:astral_gem_00> * 1)
    .addStarlightInput(6000, "astralsorcery.constellation.bootes")
    .addDimensionInput(80)
    .addItemOutput(<additions:astral_gem_10>)
    .build();
RecipeBuilder.newBuilder("astral_gem_11", "astral_collector", 400)
    .addItemInput(<additions:astral_gem_00> * 1)
    .addStarlightInput(6000, "astralsorcery.constellation.fornax")
    .addDimensionInput(80)
    .addItemOutput(<additions:astral_gem_11>)
    .build();
RecipeBuilder.newBuilder("astral_gem_12", "astral_collector", 400)
    .addItemInput(<additions:astral_gem_00> * 1)
    .addStarlightInput(6000, "astralsorcery.constellation.pelotrio")
    .addDimensionInput(80)
    .addItemOutput(<additions:astral_gem_12>)
    .build();
