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
import mods.modularmachinery.MMEvents;
import mods.modularmachinery.MachineTickEvent;
import mods.modularmachinery.RecipeTickEvent;
import mods.modularmachinery.MachineModifier;
import mods.modularmachinery.ControllerGUIRenderEvent;
import mods.ctutils.utils.Math;
import mods.jei.JEI;

MachineModifier.setMaxThreads("ion_exchange_column", 1);
MachineModifier.setMaxParallelism("ion_exchange_column", 4096);
MachineModifier.setInternalParallelism("ion_exchange_column", 1);

MMEvents.onControllerGUIRender("ion_exchange_column", function(event as ControllerGUIRenderEvent) {
    var info as string[] = [
        "§a///大型离子交换柱控制面板///",
        "§a机器名称：§eLV5 - 大型离子交换柱"
    ];
    event.extraInfo = info;
});

RecipeBuilder.newBuilder("ion_exchange_trinite_solution", "ion_exchange_column", 1200)
    .addFluidInput(<liquid:actinide_solution> * 5000)
    .addFluidInput(<liquid:nitric_acid> * 5000)
    .addEnergyPerTickInput(60000000)
    .addFluidOutput(<liquid:uranyl_nitrate_solution> * 7500)
    .addFluidOutput(<liquid:neptunyl_nitrate_solution> * 1000)
    .addFluidOutput(<liquid:plutonyl_nitrate_solution> * 1000)
    .addFluidOutput(<liquid:heavy_actinide_nitrate_solution> * 500)
    .addRadiationOutput(1, 1)
    .build();

RecipeBuilder.newBuilder("ion_exchange_heavy_actinide_primary_cut", "ion_exchange_column", 1800)
    .addItemInput(<additions:sulfonated_polystyrene_resin>)
    .addFluidInput(<liquid:heavy_actinide_nitrate_solution> * 1000)
    .addFluidInput(<liquid:ammonium_alpha_hydroxyisobutyrate_solution> * 4000)
    .addEnergyPerTickInput(80000000)
    .addFluidOutput(<liquid:americium_curium_nitrate_solution> * 600)
    .addFluidOutput(<liquid:transcurium_nitrate_solution> * 400)
    .addFluidOutput(<liquid:nitric_acid> * 500)
    .addRadiationOutput(2, 1)
    .build();

RecipeBuilder.newBuilder("ion_exchange_americium_curium_cut", "ion_exchange_column", 1800)
    .addItemInput(<additions:sulfonated_polystyrene_resin>)
    .addFluidInput(<liquid:americium_curium_nitrate_solution> * 1000)
    .addFluidInput(<liquid:ammonium_alpha_hydroxyisobutyrate_solution> * 4000)
    .addEnergyPerTickInput(80000000)
    .addFluidOutput(<liquid:americium_nitrate_solution> * 500)
    .addFluidOutput(<liquid:curium_nitrate_solution> * 500)
    .addFluidOutput(<liquid:nitric_acid> * 500)
    .addRadiationOutput(2, 1)
    .build();

RecipeBuilder.newBuilder("ion_exchange_transcurium_cut", "ion_exchange_column", 2400)
    .addItemInput(<additions:chelated_cation_exchange_resin>)
    .addFluidInput(<liquid:transcurium_nitrate_solution> * 1000)
    .addFluidInput(<liquid:dtpa_lactic_acid_eluent> * 5000)
    .addEnergyPerTickInput(100000000)
    .addFluidOutput(<liquid:berkelium_nitrate_solution> * 500)
    .addFluidOutput(<liquid:californium_einsteinium_nitrate_solution> * 500)
    .addFluidOutput(<liquid:nitric_acid> * 500)
    .addRadiationOutput(3, 1)
    .build();

RecipeBuilder.newBuilder("ion_exchange_einsteinium_252_tail_cut", "ion_exchange_column", 3600)
    .addItemInput(<additions:ultrafine_cation_exchange_resin>)
    .addFluidInput(<liquid:californium_einsteinium_nitrate_solution> * 1000)
    .addFluidInput(<liquid:dtpa_lactic_acid_eluent> * 8000)
    .addEnergyPerTickInput(120000000)
    .addFluidOutput(<liquid:californium_nitrate_solution> * 980)
    .addFluidOutput(<liquid:einsteinium_252_nitrate_solution> * 20)
    .addFluidOutput(<liquid:nitric_acid> * 500)
    .addRadiationOutput(5, 1)
    .build();