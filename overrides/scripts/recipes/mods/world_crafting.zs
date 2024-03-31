/*
 * This script is created for the GreedyCraft II modpack by mc_Edwin.
 * You may NOT use this script in any other publicly distributed modpack without my permission.
 */

#priority 3000

import mods.inworldcrafting.FluidToItem;
import mods.inworldcrafting.FluidToFluid;
import mods.inworldcrafting.ExplosionCrafting;

FluidToItem.transform(<thebetweenlands:swamp_talisman:1>, <liquid:blackhole_alloy> * 1000, [<gct_aby:shadownuclear>, <additions:cosmilite_ingot>], false); 
FluidToItem.transform(<thebetweenlands:swamp_talisman:2>, <liquid:blackhole_alloy> * 1000, [<aether_legacy:dungeon_key:2>, <aether_legacy:dungeon_key:1>, <aether_legacy:dungeon_key>, <additions:cosmilite_ingot>], false); 
FluidToItem.transform(<thebetweenlands:swamp_talisman:3>, <liquid:blackhole_alloy> * 1000, [<gct_aby:ancientmud>, <additions:cosmilite_ingot>], false); 
FluidToItem.transform(<thebetweenlands:swamp_talisman:4>, <liquid:blackhole_alloy> * 1000, [<gct_aby:shoggothtancale>, <additions:cosmilite_ingot>], false); 
FluidToItem.transform(<moretcon:ingotrotiron>, <liquid:cosmilite> * 1000, [<additions:greedycraft-rotiron_scrap> * 9,<additions:greedycraft-bone_shard>], false); 
FluidToItem.transform(<thebetweenlands:bl_bucket_plant_tonic>, <liquid:stagnant_water> * 1000, [<thebetweenlands:mire_scramble>, <thebetweenlands:items_misc:61>, <thebetweenlands:weeping_blue_petal_salad>, <thebetweenlands:sushi>], false); 
FluidToItem.transform(<minecraft:spawn_egg>.withTag({EntityTag: {id: "thebetweenlands:olm"}}), <liquid:cosmilite> * 1000, [<thebetweenlands:mire_snail_egg>], true); 
FluidToItem.transform(<thebetweenlands:shimmer_stone>, <liquid:cosmilite> * 1000, [<thebetweenlands:life_crystal>], true); 
FluidToItem.transform(<additions:greedycraft-rotiron_scrap> * 8, <liquid:rottensludge> * 1000, [<thebetweenlands:bl_bucket_plant_tonic>, <moretcon:ingotrunesteel>, <thebetweenlands:items_misc:11> * 3,<thaumcraft:bottle_taint>], true);
FluidToItem.transform(<moretcon:ingotgravitonium> * 2, <liquid:betweensludge> * 4000, [<extendedcrafting:material> * 2,<journey:storoningot> * 8], true); 
FluidToItem.transform(<thebetweenlands:dentrothyst_fluid_vial:1>.withTag({Fluid: {FluidName: "shallowbreath", Amount: 1000}}), <liquid:betweensludge> * 1000, [<thebetweenlands:dentrothyst_fluid_vial:1>.withTag({Fluid: {FluidName: "fog", Amount: 1000}}), <thebetweenlands:aspect_vial:1>.withTag({blHerbloreAspects: {container: [{aspect: {type: "Wodren"}, storage: {hasStoredStatic: 0 as byte, storedStatic: 0, dynamic: 2000}}]}}), <thebetweenlands:aspect_vial:1>.withTag({blHerbloreAspects: {container: [{aspect: {type: "Byrginaz"}, storage: {hasStoredStatic: 0 as byte, storedStatic: 0, dynamic: 1000}}]}}), <thebetweenlands:aspect_vial:1>.withTag({blHerbloreAspects: {container: [{aspect: {type: "Byariis"}, storage: {hasStoredStatic: 0 as byte, storedStatic: 0, dynamic: 1000}}]}})], true);
FluidToItem.transform(<thebetweenlands:forbidden_fig> * 16, <liquid:flux_goo> * 1000, [<thebetweenlands:chiromaw_barb>, <thebetweenlands:anadia_meat_smoked>, <thebetweenlands:pearled_pear>, <thebetweenlands:nibblestick>], false); 
FluidToItem.transform(<moretcon:itemtrichromadentiumsponge>, <liquid:balanced_matrix> * 1000, [<moretcon:itemtrichromadentiumsponge:2>], false); 
FluidToItem.transform(<moretcon:itemtrichromadentiumsponge:1>, <liquid:burningsulfurflow> * 1000, [<moretcon:gravitoniumsponge>], true); 
FluidToItem.transform(<moretcon:itemtrichromadentiumsponge:2>, <liquid:ichor> * 1000, [<moretcon:itemtrichromadentiumsponge:1>], true); 
FluidToItem.transform(<moretcon:itemtrichromadentiumsponge:3>, <liquid:tamoltencerulean> * 1000, [<moretcon:itemtrichromadentiumsponge:2>], true); 
FluidToItem.transform(<additions:greedycraft-gemundyingember>, <liquid:liquidember> * 1000, [<moretcon:dustoctine>, <thebetweenlands:wisp>, <thebetweenlands:items_misc:46>, <thebetweenlands:items_crushed:21>], true); 
FluidToItem.transform(<additions:greedycraft-valonitedruse> * 2, <liquid:rubber> * 1000, [<thebetweenlands:items_misc:19> * 16,<thebetweenlands:items_misc:39> * 24,<thebetweenlands:sap_spit> * 12,<additions:greedycraft-dirtshape>], true); 
FluidToItem.transform(<additions:taigaddon-cthughate_ingot> * 3, <liquid:lava> * 1000, [<additions:greedycraft-living_fire>], true);
FluidToItem.transform(<additions:greedycraft-slider_gem_unforked>, <liquid:water> * 1000, [<additions:greedycraft-soul_of_slider> * 2, <aether_legacy:aercloud> * 4, <aether_legacy:golden_amber>], true);
FluidToItem.transform(<additions:greedycraft-apollonium_overheat_ingot>, <liquid:lava> * 1000, [<additions:botaniaddon-holium_ingot> * 4, <additions:greedycraft-sun_crystal> * 4, <aether_legacy:golden_amber>], true);
FluidToItem.transform(<additions:greedycraft-brightine>, <liquid:astralsorcery.liquidstarlight> * 9000, [<astralsorcery:itemcraftingcomponent:4>, <additions:greedycraft-resonating_ruby>, <avaritia:block_resource:2>, <additions:greedycraft-nasalum_ingot>], true);
FluidToItem.transform(<additions:greedycraft-pruified_matter>, <liquid:unshapable_liquid> * 1000, [<draconicevolution:chaos_shard>, <gct_ores:stormy_shard>, <thaumicaugmentation:material:5>, <additions:greedycraft-malevolence_core>], true);

FluidToItem.transform(<moretcon:repitem:5> * 3, <liquid:fierymetal> * 1000, [<twilightforest:steeleaf_ingot> * 4, <twilightforest:ironwood_raw> * 6, <twilightforest:knightmetal_ingot> * 2], true);
FluidToItem.transform(<moretcon:repitem:2> * 3, <liquid:endacid> * 1000, [<endreborn:item_ingot_endorium> * 6, <moretcon:gemenderal> * 5, <tiths:ender_crevice_shard> * 5, <gct_mobs:resonated_scrap>], true);
FluidToItem.transform(<moretcon:repitem:4> * 3, <liquid:liquidgoldenamber> * 1000, [<aether_legacy:aether_log> * 16, <aether_legacy:golden_amber> * 4, <additions:asgardium_ingot> * 2, <extrabotany:material:8> * 2], true);
FluidToItem.transform(<moretcon:repitem:3> * 3, <liquid:darkest> * 1000, [<abyssalcraft:shadowgem> * 8, <voidcraft:voidcrystal> * 16, <gct_ores:stormy_witherium_ingot> * 3, <additions:shadowium_ingot> * 4], true);

ExplosionCrafting.explodeBlockRecipe(<moretcon:oreenderal>, <biomesoplenty:crystal>, 10);