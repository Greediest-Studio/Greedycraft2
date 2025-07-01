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
    <thaumadditions:entity_summoner>,
    <thaumadditions:dna_sample>,
    <thaumicenergistics:essentia_component_256k>
];

for removedItem in removedRecipes {
    Infusion.removeRecipe(removedItem);
    ArcaneWorkbench.removeRecipe(removedItem);
}

ArcaneWorkbench.registerShapedRecipe("sanity_checker_abyss", "ABYSSISM_STARTING", 40, [<aspect:ordo> * 10, <aspect:perditio> * 10], <gct_aby:sanity_observer>, [
    [null, <jaopca:nugget.cthulhurite>, <gct_aby:shoggothtooth>],
    [<jaopca:nugget.cthulhurite>, null, <thaumcraft:sanity_checker>],
    [null, <jaopca:nugget.cthulhurite>, <gct_aby:shoggothtooth>]
]);
ArcaneWorkbench.registerShapedRecipe("mind_fruit", "SANCHECK", 5, [<aspect:ordo> * 3], <gct_aby:fruit_of_mind>, [
    [<ore:ingotSanite>, <ore:ingotSanite>, <ore:ingotSanite>],
    [<ore:ingotSanite>, <minecraft:apple>, <ore:ingotSanite>],
    [<ore:ingotSanite>, <ore:ingotSanite>, <ore:ingotSanite>]
]);
ArcaneWorkbench.registerShapedRecipe("mind_fruit_enchanted", "SANCHECK", 5, [<aspect:ordo> * 9], <gct_aby:fruit_of_mind_enchanted>, [
    [<ore:blockSanite>, <ore:blockSanite>, <ore:blockSanite>],
    [<ore:blockSanite>, <minecraft:apple>, <ore:blockSanite>],
    [<ore:blockSanite>, <ore:blockSanite>, <ore:blockSanite>]
]);

Crucible.registerRecipe("salis_mundus", "", <thaumcraft:salis_mundus> * 2, <thaumcraft:salis_mundus>, [<aspect:praecantatio> * 3, <aspect:auram> * 3]);
Crucible.registerRecipe("smithstoneore", "", <journey:smithstoneore>, <journey:enderilliumblock>, [<aspect:vitreus> * 20, <aspect:alienis> * 25]);

Infusion.removeRecipe(<thaumicaugmentation:thaumostatic_harness>);
Infusion.removeRecipe(<thaumadditions:mithminite_ingot>);
Infusion.removeRecipe(<thaumadditions:adaminite_ingot>);
Infusion.removeRecipe(<thaumadditions:mithrillium_ingot>);
Infusion.removeRecipe(<thaumicenergistics:essentia_component_4096k>);


Infusion.registerRecipe("quardstate", "", <additions:quardstate_star>, 15, [
    <aspect:aversio> * 500, 
    <aspect:motus> * 500, 
    <aspect:vinculum> * 500, 
    <aspect:machina> * 500
], <additions:arcane_crystal_ball>, [
    <additions:end_star>, 
    <additions:ice_star>, 
    <additions:canopy_star>, 
    <additions:solarium_star>
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

Infusion.registerRecipe("eldritch_steel_ingot", "", <additions:eldritch_steel_ingot>, 18, [
    <aspect:metallum> * 160,
    <aspect:praecantatio> * 120,
    <aspect:vitium> * 240,
    <aspect:instrumentum> * 120
], <additions:corruptium_ingot>, [
    <additions:eldritch_slime>,
    <additions:eldritch_slime>,
    <additions:eldritch_slime>,
    <additions:eldritch_slime>
]);

Infusion.registerRecipe("extended_primordial_metal_ingot", "", <additions:extended_primal_metal_ingot>, 21, [
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

Infusion.registerRecipe("cursium_ingot", "", <additions:cursium_ingot>, 30, [
    <aspect:alkimia> * 750,
    <aspect:alienis> * 750,
    <aspect:auram> * 750,
    <aspect:aversio> * 750,
    <aspect:cognitio> * 750,
    <aspect:desiderium> * 750,
    <aspect:fabrico> * 750,
    <aspect:humanus> * 750,
    <aspect:machina> * 750,
    <aspect:praemunio> * 750,
    <aspect:sensus> * 750,
    <aspect:vitium> * 750
], <gct_ores:balanced_matrix_ingot>, [
    <additions:impetusite_ingot>,
    <additions:impetusite_ingot>,
    <additions:eldritch_steel_ingot>,
    <additions:eldritch_steel_ingot>,
    <additions:eldritch_steel_ingot>,
    <additions:eldritch_steel_ingot>,
    <additions:extended_primal_metal_ingot>,
    <additions:extended_primal_metal_ingot>,
    <additions:darkest_core>,
    <additions:darkest_core>,
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
    <additions:extended_primal_metal_ingot>,
    <thaumadditions:mithrillium_ingot>,
    <additions:extended_primal_metal_ingot>,
    <thaumadditions:mithrillium_ingot>,
    <additions:extended_primal_metal_ingot>,
    <thaumadditions:mithrillium_ingot>,
    <thaumcraft:primordial_pearl>
]);

Infusion.registerRecipe("disaster_metal_ingot", "", <additions:disaster_metal_ingot>, 5, [
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

Infusion.registerRecipe("shoggoth_complex_crystal", "SHOGGOTH_MUD_COLLECTION", <gct_aby:shoggoth_complex_crystal>, 15, [
    <aspect:coralos> * 180,
    <aspect:dreadia> * 180,
    <aspect:abyss> * 180,
    <aspect:cthulhu> * 40,
    <aspect:praemunio> * 140
], <additions:abyssine_ingot>, [
    <additions:godslime_slimeball>,
    <gct_aby:shoggoth_slimeball>,
    <additions:godslime_slimeball>,
    <gct_aby:shoggoth_slimeball>,
    <additions:godslime_slimeball>,
    <gct_aby:shoggoth_slimeball>,
    <additions:godslime_slimeball>,
    <gct_aby:shoggoth_slimeball>
]);

Infusion.registerRecipe("sanite_siphon", "ABYSSISM_MOBS", <gct_aby:sanite_siphon>, 16, [
    <aspect:abyss> * 320,
    <aspect:cthulhu> * 120,
    <aspect:tenebrae> * 320,
    <aspect:machina> * 320,
    <aspect:desiderium> * 320,
    <aspect:permutatio> * 320
], <gct_mobs:sanite_block>, [
    <additions:abyssine_ingot>,
    <forge:bucketfilled>.withTag({FluidName: "liquidantimatter", Amount: 1000}),
    <appliedenergistics2:material:47>,
    <additions:blackhole_alloy_block>,
    <additions:abyssine_ingot>,
    <forge:bucketfilled>.withTag({FluidName: "liquidantimatter", Amount: 1000}),
    <appliedenergistics2:material:47>,
    <additions:blackhole_alloy_block>    
]);

Infusion.registerRecipe("essentia_component", "", <thaumicenergistics:essentia_cell_1048576k>, 10, [
    <aspect:caeles> * 10000, 
    <aspect:praecantatio> * 10000, 
    <aspect:desiderium> * 10000, 
    <aspect:machina> * 10000
], <thaumicenergistics:essentia_component_64k>, [
    <additions:creative_shard>, 
    <additions:arcane_control_circuit>, 
    <additions:creative_shard>,
    <additions:extended_primal_metal_ingot>, 
    <additions:creative_shard>,
    <thaumicaugmentation:material:3>,
    <additions:creative_shard>,
    <gct_ores:order_crystal>
]);

//Infusion.registerRecipe("");