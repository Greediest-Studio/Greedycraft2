 /* 
  *  This script is created for the GreedyCraft modpack by TCreopargh.
  *  You may NOT use this script in any other publicly distributed modpack without my permission.
  */

#priority 3000

import thaumcraft.aspect.CTAspect;

import crafttweaker.item.IItemStack;
import crafttweaker.data.IData;
import crafttweaker.item.IIngredient;

import mods.thaumcraft.Infusion;
import mods.thaumcraft.ArcaneWorkbench;
import mods.thaumcraft.Crucible;

var removedRecipes as IItemStack[] = [
    <thaumadditions:adaminite_hood>,
    <thaumadditions:adaminite_robe>,
    <thaumadditions:adaminite_belt>,
    <thaumadditions:adaminite_boots>,
    <thaumadditions:mithminite_hood>,
    <thaumadditions:mithminite_robe>,
    <thaumadditions:mithminite_belt>,
    <thaumadditions:mithminite_boots>,
    <thaumcraft:fortress_helm>,
    <thaumcraft:fortress_chest>,
    <thaumcraft:fortress_legs>,
    <thaumcraft:void_robe_helm>,
    <thaumcraft:void_robe_chest>,
    <thaumcraft:void_robe_legs>,
    <thaumadditions:adaminite_sword>,
    <thaumadditions:mithminite_scythe>,
    <thaumadditions:mithminite_blade>,
    <thaumadditions:mithminite_handle>,
    <thaumadditions:mithminite_fabric>,
    <thaumadditions:entity_summoner>,
    <thaumadditions:dna_sample>
];

for removedItem in removedRecipes {
    Infusion.removeRecipe(removedItem);
    ArcaneWorkbench.removeRecipe(removedItem);
}

Infusion.removeRecipe(<thaumicaugmentation:thaumostatic_harness>);
Infusion.removeRecipe(<thaumadditions:mithminite_ingot>);
Infusion.removeRecipe(<thaumadditions:adaminite_ingot>);
Infusion.removeRecipe(<thaumadditions:mithrillium_ingot>);

Infusion.registerRecipe("quardstate", "", <additions:greedycraft-quardstate_star>, 15, [
    <aspect:aversio> * 500, 
    <aspect:motus> * 500, 
    <aspect:vinculum> * 500, 
    <aspect:machina> * 500
], <additions:greedycraft-arcane_crystal_ball>, [
    <additions:greedycraft-end_star>, 
    <additions:greedycraft-ice_star>, 
    <additions:greedycraft-canopy_star>, 
    <additions:greedycraft-solarium_star>
]);

Infusion.registerRecipe("PRIMPEARL", "PRIMPEARL", <thaumcraft:primordial_pearl>, 3, [
    <aspect:aer> * 1000, 
    <aspect:ordo> * 1000, 
    <aspect:aqua> * 1000, 
    <aspect:terra> * 1000, 
    <aspect:ignis> * 1000, 
    <aspect:perditio> * 1000, 
    <aspect:praecantatio> * 1000, 
    <aspect:auram> * 1000
], <thaumcraft:causality_collapser>, [
    <thaumcraft:primordial_pearl>,
    <thaumcraft:void_seed>,
    <thaumcraft:primordial_pearl>,
    <thaumcraft:void_seed>
]);

Infusion.registerRecipe("mithrillium_ingot", "TAR_MITHRILLIUM", <thaumadditions:mithrillium_ingot>, 6, [
    <aspect:vitreus> * 400, 
    <aspect:metallum> * 400, 
    <aspect:potentia> * 320, 
    <aspect:alienis> * 150, 
    <aspect:praecantatio> * 150, 
    <aspect:instrumentum> * 100
], <additions:aeonsteel_ingot>, [
    <thaumcraft:primordial_pearl>,
    <thaumicwonders:alchemist_stone>,
    <thaumictinkerer:energetic_nitor>,
    <botania:manaresource:22>,
    <thaumcraft:curio:1>,
    <thaumcraft:primordial_pearl>,
    <thaumicwonders:alchemist_stone>,
    <thaumictinkerer:energetic_nitor>,
    <botania:manaresource:22>,
    <thaumcraft:curio:1>
]);


Infusion.registerRecipe("adaminite_ingot", "TAR_ADAMINITE", <thaumadditions:adaminite_ingot>, 12, [
    <aspect:draco> * 700, 
    <aspect:infernum> * 450, 
    <aspect:visum> * 400,
    <aspect:ordo> * 320, 
    <aspect:spiritus> * 240, 
    <aspect:cognitio> * 200, 
    <aspect:alkimia> * 200, 
    <aspect:fabrico> * 120
], <additions:chromasteel_ingot>, [
    <thaumadditions:zeith_fur>,
    <thaumicwonders:primordial_grain>,
    <thaumadditions:mithrillium_resonator>,
    <thaumicwonders:primordial_grain>,
    <draconicevolution:draconic_ingot>,
    <thaumadditions:zeith_fur>,
    <thaumicwonders:primordial_grain>,
    <thaumadditions:mithrillium_resonator>,
    <thaumicwonders:primordial_grain>,
    <gct_ores:relifed_witherium_ingot>
]);

Infusion.registerRecipe("eldritch_steel_ingot", "", <additions:greedycraft-eldritch_steel_ingot>, 18, [
    <aspect:metallum> * 160,
    <aspect:praecantatio> * 120,
    <aspect:vitium> * 240,
    <aspect:instrumentum> * 120
], <additions:greedycraft-corruptium_ingot>, [
    <additions:greedycraft-eldritch_slime>,
    <additions:greedycraft-eldritch_slime>,
    <additions:greedycraft-eldritch_slime>,
    <additions:greedycraft-eldritch_slime>
]);

Infusion.registerRecipe("extended_primordial_metal_ingot", "", <additions:greedycraft-extended_primal_metal_ingot>, 21, [
    <aspect:gelum> * 150,
    <aspect:lux> * 150,
    <aspect:metallum> * 150,
    <aspect:motus> * 150,
    <aspect:mortuus> * 150,
    <aspect:permutatio> * 150,
    <aspect:potentia> * 150,
    <aspect:victus> * 150,
    <aspect:vitreus> * 150,
    <aspect:vacuos> * 150
], <tconevo:metal:20>, [
    <thaumcraft:primordial_pearl>,
    <thaumcraft:primordial_pearl>,
    <thaumcraft:primordial_pearl>,
    <thaumcraft:primordial_pearl>,
    <thaumcraft:primordial_pearl>,
    <thaumcraft:primordial_pearl>,
    <thaumcraft:salis_mundus>,
    <thaumcraft:salis_mundus>,
    <gct_ores:everite_dust>,
    <gct_ores:everite_dust>
]);

Infusion.registerRecipe("cursium_ingot", "", <additions:greedycraft-cursium_ingot>, 30, [
    <aspect:alkimia> * 2000,
    <aspect:alienis> * 2000,
    <aspect:auram> * 2000,
    <aspect:aversio> * 2000,
    <aspect:cognitio> * 2000,
    <aspect:desiderium> * 2000,
    <aspect:fabrico> * 2000,
    <aspect:humanus> * 2000,
    <aspect:machina> * 2000,
    <aspect:praemunio> * 2000,
    <aspect:sensus> * 2000,
    <aspect:vitium> * 2000
], <gct_ores:balanced_matrix_ingot>, [
    <additions:greedycraft-impetusite_ingot>,
    <additions:greedycraft-impetusite_ingot>,
    <additions:greedycraft-eldritch_steel_ingot>,
    <additions:greedycraft-eldritch_steel_ingot>,
    <additions:greedycraft-eldritch_steel_ingot>,
    <additions:greedycraft-eldritch_steel_ingot>,
    <additions:greedycraft-extended_primal_metal_ingot>,
    <additions:greedycraft-extended_primal_metal_ingot>,
    <additions:bloody-darkest_core>,
    <additions:bloody-darkest_core>,
    <gct_ores:equipment_witherium_ingot>,
    <gct_ores:ruled_draconium_ingot>
]);

Infusion.registerRecipe("mithminite_ingot", "TAR_MITHMINITE", <thaumadditions:mithminite_ingot>, 25, [
    <aspect:tempus> * 1000, 
    <aspect:caeles> * 1000, 
    <aspect:exitium> * 1000, 
    <aspect:fluctus> * 1000, 
    <aspect:coralos> * 1000, 
    <aspect:dreadia> * 1000
], <additions:cosmilite_ingot>, [
    <thaumadditions:adaminite_fabric>,
    <thaumicaugmentation:material:5>,
    <thaumicwonders:alienist_stone>,
    <additions:betwnite_ingot>,
    <thaumadditions:adaminite_fabric>,
    <thaumicaugmentation:material:5>,
    <thaumicwonders:alienist_stone>,
    <additions:betwnite_ingot>
]);

Infusion.registerRecipe("deadman", "", <thebetweenlands:mummy_bait>, 8, [
    <aspect:victus> * 1200, 
    <aspect:imperium> * 400,
    <aspect:exanimis> * 400
], <thebetweenlands:items_misc:25>, [
    <thebetweenlands:items_misc:26>,
    <thebetweenlands:dentrothyst_fluid_vial:1>.withTag({Fluid: {FluidName: "shallowbreath", Amount: 1000}}),
    <thebetweenlands:items_misc:26>,
    <thebetweenlands:items_misc:13>,
    <thebetweenlands:items_misc:13>,
    <thebetweenlands:items_misc:45>,
    <thebetweenlands:items_misc:13>,
    <thebetweenlands:items_misc:13>
]);

Infusion.registerRecipe("eld_boss", "", <thaumicaugmentation:capstone:2>, 20, [
    <aspect:visum> * 300,
    <aspect:tenebrae> * 300,
    <aspect:vitium> * 500,
    <aspect:machina> * 500
], <thaumcraft:stone_eldritch_tile>, [
    <additions:greedycraft-extended_primal_metal_ingot>,
    <thaumadditions:mithrillium_ingot>,
    <additions:greedycraft-extended_primal_metal_ingot>,
    <thaumadditions:mithrillium_ingot>,
    <additions:greedycraft-extended_primal_metal_ingot>,
    <thaumadditions:mithrillium_ingot>,
    <thaumcraft:primordial_pearl>
]);

Crucible.registerRecipe("smithstoneore",
"",
<journey:smithstoneore>,
<journey:enderilliumblock>,
[<aspect:vitreus>*20,<aspect:alienis>*25]);

Infusion.registerRecipe("disaster_metal_ingot","", <additions:link-disaster_metal_ingot>, 5, [
    <aspect:draco> * 150,
    <aspect:coralos> * 150,
    <aspect:dreadia> * 150,
    <aspect:vitium> * 300,
    <aspect:tenebrae> * 300,
    <aspect:herba> * 377
], <taiga:nihilite_ingot>, [
    <sakura:futon>,
    <minecraft:bed:11>,
    <cfm:modern_bed_bottom:11>,
    <tconevo:metal_block:1>,
    <thaumicaugmentation:material:3>,
    <tconevo:metal:20>,
    <thaumadditions:adaminite_ingot>,
    <thaumicaugmentation:elytra_harness>
]);

