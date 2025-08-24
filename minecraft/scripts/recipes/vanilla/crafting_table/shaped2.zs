/*
 * This script is created for the GreedyCraft modpack by TCreopargh.
 * You may NOT use this script in any other publicly distributed modpack without my permission. 
 */

#priority 4000

import crafttweaker.item.IItemStack;
import crafttweaker.data.IData;
import crafttweaker.item.IIngredient;

import scripts.util.recipes as RecipeUtil;
import scripts.util.lang as LangUtil;

////////////////////////////////
//                            //
//      Shaped   Recipes      //
//                            //
////////////////////////////////

recipes.remove(<hydrogenation_tinker:field_generator>.withTag({Material: "nether_star"}));
recipes.remove(<ymadditions:network_hub>);
recipes.remove(<tconstruct:piggybackpack>.withTag({}));
recipes.removeByRecipeName("biomesoplenty:amber_block");
recipes.removeByRecipeName("biomesoplenty:amber");
recipes.removeByRecipeName("betterendforge:amber_block");
recipes.removeByRecipeName("botania:quartztypedark_0");
recipes.removeByRecipeName("thaumictinkerer:black_quartz_block");
recipes.removeByRecipeName("actuallyadditions:recipes149");

RecipeUtil.addShaped("calculator_subsystem_l4", <ecoaeextension:extendable_calculator_subsystem_l4>, [
    [<ecoaeextension:ecalculator_casing>, <additions:calculation_processor_2>, <ecoaeextension:ecalculator_casing>],
    [<additions:calculation_processor_2>, <projecte:item.pe_philosophers_stone>, <additions:calculation_processor_2>],
    [<ecoaeextension:ecalculator_casing>, <additions:calculation_processor_2>, <ecoaeextension:ecalculator_casing>]
]);
RecipeUtil.addShaped("extendable_calculator_subsystem_l6", <ecoaeextension:extendable_calculator_subsystem_l6>, [
    [<ecoaeextension:ecalculator_casing>, <additions:glowing_crystal_block>, <ecoaeextension:ecalculator_casing>],
    [<additions:glowing_crystal_block>, <ecoaeextension:extendable_calculator_subsystem_l4>, <additions:glowing_crystal_block>],
    [<ecoaeextension:ecalculator_casing>, <additions:glowing_crystal_block>, <ecoaeextension:ecalculator_casing>]
]);
RecipeUtil.addShaped("extendable_calculator_subsystem_l9>", <ecoaeextension:extendable_calculator_subsystem_l9>, [
    [<mekanism:controlcircuit:3>, <additions:durasteel_block>, <mekanism:controlcircuit:3>],
    [<additions:durasteel_block>, <ecoaeextension:extendable_calculator_subsystem_l6>, <additions:durasteel_block>],
    [<mekanism:controlcircuit:3>, <additions:durasteel_block>, <mekanism:controlcircuit:3>]
]);
RecipeUtil.addShaped("ecalculator_parallel_proc_l4", <ecoaeextension:ecalculator_parallel_proc_l4>, [
    [<ecoaeextension:ecalculator_casing>, <jaopca:gear.durasteel>, <ecoaeextension:ecalculator_casing>],
    [<crazyae:crafting_accelerator_16x>, <crazyae:crafting_accelerator_16x>, <crazyae:crafting_accelerator_16x>],
    [<ecoaeextension:ecalculator_casing>, <jaopca:gear.durasteel>, <ecoaeextension:ecalculator_casing>]
]);
RecipeUtil.addShaped("ecalculator_parallel_proc_l6", <ecoaeextension:ecalculator_parallel_proc_l6>, [
    [<ecoaeextension:ecalculator_casing>, <jaopca:gear.aeonsteel>, <ecoaeextension:ecalculator_casing>],
    [<crazyae:crafting_accelerator_16x>, <ecoaeextension:ecalculator_parallel_proc_l4>, <crazyae:crafting_accelerator_16x>],
    [<ecoaeextension:ecalculator_casing>, <jaopca:gear.aeonsteel>, <ecoaeextension:ecalculator_casing>]
]);
RecipeUtil.addShaped("ecalculator_parallel_proc_l9", <ecoaeextension:ecalculator_parallel_proc_l9>, [
    [<ecoaeextension:ecalculator_casing>, <jaopca:gear.chromasteel>, <ecoaeextension:ecalculator_casing>],
    [<crazyae:crafting_accelerator_16x>, <ecoaeextension:ecalculator_parallel_proc_l6>, <crazyae:crafting_accelerator_16x>],
    [<ecoaeextension:ecalculator_casing>, <jaopca:gear.chromasteel>, <ecoaeextension:ecalculator_casing>]
]);
RecipeUtil.addShaped("ecalculator_thread_core_l4", <ecoaeextension:ecalculator_thread_core_l4>, [
    [<ecoaeextension:ecalculator_casing>, <jaopca:gear.durasteel>, <ecoaeextension:ecalculator_casing>],
    [<ecoaeextension:ecalculator_parallel_proc_l4>, <ecoaeextension:ecalculator_parallel_proc_l4>, <ecoaeextension:ecalculator_parallel_proc_l4>],
    [<ecoaeextension:ecalculator_casing>, <jaopca:gear.durasteel>, <ecoaeextension:ecalculator_casing>]
]);
RecipeUtil.addShaped("ecalculator_thread_core_l6", <ecoaeextension:ecalculator_thread_core_l6>, [
    [<ecoaeextension:ecalculator_casing>, <jaopca:gear.durasteel>, <ecoaeextension:ecalculator_casing>],
    [<ecoaeextension:ecalculator_parallel_proc_l6>, <ecoaeextension:ecalculator_thread_core_l4>, <ecoaeextension:ecalculator_parallel_proc_l6>],
    [<ecoaeextension:ecalculator_casing>, <jaopca:gear.durasteel>, <ecoaeextension:ecalculator_casing>]
]);
RecipeUtil.addShaped("ecalculator_thread_core_l9", <ecoaeextension:ecalculator_thread_core_l9>, [
    [<ecoaeextension:ecalculator_casing>, <jaopca:gear.durasteel>, <ecoaeextension:ecalculator_casing>],
    [<ecoaeextension:ecalculator_parallel_proc_l9>, <ecoaeextension:ecalculator_thread_core_l6>, <ecoaeextension:ecalculator_parallel_proc_l9>],
    [<ecoaeextension:ecalculator_casing>, <jaopca:gear.durasteel>, <ecoaeextension:ecalculator_casing>]
]);
RecipeUtil.addShaped("ecalculator_thread_core_hyper_l4", <ecoaeextension:ecalculator_thread_core_hyper_l4>, [
    [<ecoaeextension:ecalculator_casing>, <jaopca:gear.durasteel>, <ecoaeextension:ecalculator_casing>],
    [<ecoaeextension:ecalculator_parallel_proc_l4>, <crazyae:crafting_accelerator_64x>, <ecoaeextension:ecalculator_parallel_proc_l4>],
    [<ecoaeextension:ecalculator_casing>, <jaopca:gear.durasteel>, <ecoaeextension:ecalculator_casing>]
]);
RecipeUtil.addShaped("ecalculator_thread_core_hyper_l6", <ecoaeextension:ecalculator_thread_core_hyper_l6>, [
    [<ecoaeextension:ecalculator_casing>, <jaopca:gear.durasteel>, <ecoaeextension:ecalculator_casing>],
    [<ecoaeextension:ecalculator_parallel_proc_l6>, <ecoaeextension:ecalculator_thread_core_hyper_l4>, <ecoaeextension:ecalculator_parallel_proc_l6>],
    [<ecoaeextension:ecalculator_casing>, <jaopca:gear.durasteel>, <ecoaeextension:ecalculator_casing>]
]);
RecipeUtil.addShaped("ecalculator_thread_core_hyper_l9", <ecoaeextension:ecalculator_thread_core_hyper_l9>, [
    [<ecoaeextension:ecalculator_casing>, <jaopca:gear.durasteel>, <ecoaeextension:ecalculator_casing>],
    [<ecoaeextension:ecalculator_parallel_proc_l9>, <ecoaeextension:ecalculator_thread_core_hyper_l6>, <ecoaeextension:ecalculator_parallel_proc_l9>],
    [<ecoaeextension:ecalculator_casing>, <jaopca:gear.durasteel>, <ecoaeextension:ecalculator_casing>]
]);
RecipeUtil.addShaped("ecalculator_tail_l4", <ecoaeextension:ecalculator_tail_l4>, [
    [<ecoaeextension:ecalculator_casing>, <redstonerepository:storage>, null],
    [<ecoaeextension:ecalculator_casing>, <redstonerepository:storage>, null],
    [<ecoaeextension:ecalculator_casing>, <redstonerepository:storage>, null]
]);
RecipeUtil.addShaped("ecalculator_tail_l6", <ecoaeextension:ecalculator_tail_l6>, [
    [<ecoaeextension:ecalculator_casing>, <additions:cryonium_block>, null],
    [<ecoaeextension:ecalculator_casing>, <ecoaeextension:ecalculator_tail_l4>, null],
    [<ecoaeextension:ecalculator_casing>, <additions:cryonium_block>, null]
]);
RecipeUtil.addShaped("ecalculator_tail_l9", <ecoaeextension:ecalculator_tail_l9>, [
    [<ecoaeextension:ecalculator_casing>, <gct_ores:ice_alloy_block>, null],
    [<ecoaeextension:ecalculator_casing>, <ecoaeextension:ecalculator_tail_l6>, null],
    [<ecoaeextension:ecalculator_casing>, <gct_ores:ice_alloy_block>, null]
]);
RecipeUtil.addShaped("ecalculator_me_channel", <ecoaeextension:ecalculator_me_channel>, [
    [<ecoaeextension:ecalculator_casing>, <appliedenergistics2:io_port>, <ecoaeextension:ecalculator_casing>],
    [<appliedenergistics2:io_port>, <appliedenergistics2:interface>, <appliedenergistics2:io_port>],
    [<ecoaeextension:ecalculator_casing>, <appliedenergistics2:io_port>, <ecoaeextension:ecalculator_casing>]
]);
RecipeUtil.addShaped("ecalculator_cell_drive", <ecoaeextension:ecalculator_cell_drive>, [
    [<ecoaeextension:ecalculator_casing>, <ecoaeextension:ecalculator_casing>, <ecoaeextension:ecalculator_casing>],
    [<ecoaeextension:ecalculator_casing>, <appliedenergistics2:drive>, <ecoaeextension:ecalculator_casing>],
    [<ecoaeextension:ecalculator_casing>, <ecoaeextension:ecalculator_casing>, <ecoaeextension:ecalculator_casing>]
]);
RecipeUtil.addShaped("ecalculator_transmitter_bus", <ecoaeextension:ecalculator_transmitter_bus>, [
    [<ecoaeextension:ecalculator_casing>, <ecoaeextension:ecalculator_casing>, <ecoaeextension:ecalculator_casing>],
    [<crazyae:fluixilized_block>, <crazyae:fluixilized_block>, <crazyae:fluixilized_block>],
    [<ecoaeextension:ecalculator_casing>, <ecoaeextension:ecalculator_casing>, <ecoaeextension:ecalculator_casing>]
]);
RecipeUtil.addShaped("ecalculator_casing", <ecoaeextension:ecalculator_casing>, [
    [<additions:stainless_steel_ingot>, <minecraft:concrete>, <additions:stainless_steel_ingot>],
    [<minecraft:concrete>, <minecraft:concrete>, <minecraft:concrete>],
    [<additions:stainless_steel_ingot>, <minecraft:concrete>, <additions:stainless_steel_ingot>]
]);
RecipeUtil.addShaped("ecalculator_cell_64m", <ecoaeextension:ecalculator_cell_64m>, [
    [null, <ecoaeextension:ecalculator_casing>, null],
    [<ecoaeextension:ecalculator_casing>, <crazyae:material:4>, <ecoaeextension:ecalculator_casing>],
    [null, <ecoaeextension:ecalculator_casing>, null]
]);
RecipeUtil.addShaped("ecalculator_cell_1024m", <ecoaeextension:ecalculator_cell_1024m>, [
    [null, <additions:durasteel_ingot>, null],
    [<additions:durasteel_ingot>, <ecoaeextension:ecalculator_cell_64m>, <additions:durasteel_ingot>],
    [null, <additions:durasteel_ingot>, null]
]);
RecipeUtil.addShaped("ecalculator_cell_16384m", <ecoaeextension:ecalculator_cell_16384m>, [
    [null, <additions:aeonsteel_ingot>, null],
    [<additions:aeonsteel_ingot>, <ecoaeextension:ecalculator_cell_1024m>, <additions:aeonsteel_ingot>],
    [null, <additions:aeonsteel_ingot>, null]
]);
RecipeUtil.addShaped("mmce_blockupgradebus_1", <modularmachinery:blockupgradebus>, [
    [<modularmachinery:itemmodularium>, <additions:stainless_steel_ingot>, <modularmachinery:itemmodularium>],
    [<additions:stainless_steel_ingot>, <minecraft:chest>, <additions:stainless_steel_ingot>],
    [<modularmachinery:itemmodularium>, <additions:stainless_steel_ingot>, <modularmachinery:itemmodularium>]
]);
RecipeUtil.addShaped("mmce_blockupgradebus_2", <modularmachinery:blockupgradebus:1>, [
    [<modularmachinery:itemmodularium>, <additions:durasteel_ingot>, <modularmachinery:itemmodularium>],
    [<additions:durasteel_ingot>, <modularmachinery:blockupgradebus>, <additions:durasteel_ingot>],
    [<modularmachinery:itemmodularium>, <additions:durasteel_ingot>, <modularmachinery:itemmodularium>]
]);
RecipeUtil.addShaped("mmce_blockupgradebus_3", <modularmachinery:blockupgradebus:2>, [
    [<modularmachinery:itemmodularium>, <additions:aeonsteel_ingot>, <modularmachinery:itemmodularium>],
    [<additions:aeonsteel_ingot>, <modularmachinery:blockupgradebus:1>, <additions:aeonsteel_ingot>],
    [<modularmachinery:itemmodularium>, <additions:aeonsteel_ingot>, <modularmachinery:itemmodularium>]
]);
RecipeUtil.addShaped("mmce_blockupgradebus_4", <modularmachinery:blockupgradebus:3>, [
    [<modularmachinery:itemmodularium>, <additions:chromasteel_ingot>, <modularmachinery:itemmodularium>],
    [<additions:chromasteel_ingot>, <modularmachinery:blockupgradebus:2>, <additions:chromasteel_ingot>],
    [<modularmachinery:itemmodularium>, <additions:chromasteel_ingot>, <modularmachinery:itemmodularium>]
]);
RecipeUtil.addShaped("mmce_blockupgradebus_5", <modularmachinery:blockupgradebus:4>, [
    [<modularmachinery:itemmodularium>, <additions:cosmilite_ingot>, <modularmachinery:itemmodularium>],
    [<additions:cosmilite_ingot>, <modularmachinery:blockupgradebus:3>, <additions:cosmilite_ingot>],
    [<modularmachinery:itemmodularium>, <additions:cosmilite_ingot>, <modularmachinery:itemmodularium>]
]);
RecipeUtil.addShaped("blockwillproviderinput", <modularmachinery:blockwillproviderinput>, [
    [<ore:plateSentientMetal>, <ore:ingotModularium>, <ore:plateSentientMetal>],
    [<ore:ingotModularium>, <bloodmagic:item_demon_crystal:1>, <ore:ingotModularium>],
    [<ore:plateSentientMetal>, <ore:ingotModularium>, <ore:plateSentientMetal>]
]);
RecipeUtil.addShaped("blockwillprovideroutput", <modularmachinery:blockwillprovideroutput>, [
    [<ore:plateSentientMetal>, <ore:ingotModularium>, <ore:plateSentientMetal>],
    [<ore:ingotModularium>, <bloodmagic:item_demon_crystal:3>, <ore:ingotModularium>],
    [<ore:plateSentientMetal>, <ore:ingotModularium>, <ore:plateSentientMetal>]
]);
RecipeUtil.addShaped("ecoc_16m_gas", <ecoaeextension:estorage_cell_gas_16m>.withTag({}), [
    [<additions:durasteel_ingot>,<thermalfoundation:material:1>,<additions:durasteel_ingot>],
    [<mekeng:gas_core_64k>,<crazyae:material:11>,<mekeng:gas_core_64k>],
    [<additions:durasteel_ingot>,<mekeng:gas_core_64k>,<additions:durasteel_ingot>]
]);
RecipeUtil.addShaped("ecoc_64m_gas", <ecoaeextension:estorage_cell_gas_64m>.withTag({}), [
    [null,<additions:aeonsteel_ingot>,null],
    [<additions:aeonsteel_ingot>,<ecoaeextension:estorage_cell_gas_16m>.withTag({}),<additions:aeonsteel_ingot>],
    [null,<additions:aeonsteel_ingot>,null]
]);
RecipeUtil.addShaped("ecoc_256m_gas", <ecoaeextension:estorage_cell_gas_256m>.withTag({}), [
    [null,<additions:chromasteel_ingot>,null],
    [<additions:chromasteel_ingot>,<ecoaeextension:estorage_cell_gas_64m>.withTag({}),<additions:chromasteel_ingot>],
    [null,<additions:chromasteel_ingot>,null]
]);
RecipeUtil.addShaped("aspcet_gugu_output", <whimcraft:blockmeaspectoutputbus>, [
    [<modularmachinery:blockcasing>,<thaumicenergistics:essentia_export>,<modularmachinery:blockcasing>],
    [<thaumicenergistics:essentia_export>,<thaumicenergistics:infusion_provider>,<thaumicenergistics:essentia_export>],
    [<modularmachinery:blockcasing>,<thaumicenergistics:essentia_export>,<modularmachinery:blockcasing>]
]);
RecipeUtil.addShaped("aspcet_gugu_input", <whimcraft:blockmeaspectinputbus>, [
    [<modularmachinery:blockcasing>,<thaumicenergistics:essentia_import>,<modularmachinery:blockcasing>],
    [<thaumicenergistics:essentia_import>,<thaumicenergistics:infusion_provider>,<thaumicenergistics:essentia_import>],
    [<modularmachinery:blockcasing>,<thaumicenergistics:essentia_import>,<modularmachinery:blockcasing>]
]);
RecipeUtil.addShaped("pattern_provider_share", <whimcraft:blockshareinfhandler>, [
    [<ore:blockModularium>, <additions:wireless_processor>, <ore:blockModularium>],
    [<appliedenergistics2:material:52>, <modularmachinery:blockmepatternprovider>, <appliedenergistics2:material:52>],
    [<ore:blockModularium>, <additions:wireless_processor>, <ore:blockModularium>]
]);
RecipeUtil.addShaped("cordless_YM", <ymadditions:network_hub>, [
    [<crazyae:material:16>,<appliedenergistics2:quantum_link>,<additions:wireless_processor>],
    [<crazyae:material:16>,<ae2stuff:wireless>,<additions:wireless_processor>],
    [<appliedenergistics2:quantum_ring>,<appliedenergistics2:quantum_link>,<appliedenergistics2:quantum_ring>]
]);
RecipeUtil.addShaped("therm_Ardite", <tconstruct:ingots:1>, [
    [<ore:oreArdite>, <thermalfoundation:material:1024>, null],
    [null, null, null],
    [null, null, null]
]);
RecipeUtil.addShaped("therm_Ardite_1", <tconstruct:ingots:1>, [
    [<ore:dustArdite>, <thermalfoundation:material:1024>, null],
    [null, null, null],
    [null, null, null]
]);
RecipeUtil.addShaped("therm_Ardite_2", <tconstruct:ingots:1> * 2, [
    [<ore:oreArdite>, <thermalfoundation:material:1027>, null],
    [<thermalfoundation:material:1024>, null, null],
    [null, null, null]
]);
RecipeUtil.addShaped("therm_Ethaxium", <abyssalcraft:ethaxiumingot>, [
    [<ore:oreEthaxium>, <thermalfoundation:material:1024>, null],
    [null, null, null],
    [null, null, null]
]);
RecipeUtil.addShaped("therm_Ethaxium_1", <abyssalcraft:ethaxiumingot>, [
    [<ore:dustEthaxium>, <thermalfoundation:material:1024>, null],
    [null, null, null],
    [null, null, null]
]);
RecipeUtil.addShaped("therm_Ethaxium_2", <abyssalcraft:ethaxiumingot> * 2, [
    [<ore:oreEthaxium>, <thermalfoundation:material:1027>, null],
    [<thermalfoundation:material:1024>, null, null],
    [null, null, null]
]);
RecipeUtil.addShaped("therm_Chloroplast", <tiths:ingot_chloroplast>, [
    [<ore:oreChloroplast>, <thermalfoundation:material:1024>, null],
    [null, null, null],
    [null, null, null]
]);
RecipeUtil.addShaped("therm_Chloroplast_1", <tiths:ingot_chloroplast>, [
    [<ore:dustChloroplast>, <thermalfoundation:material:1024>, null],
    [null, null, null],
    [null, null, null]
]);
RecipeUtil.addShaped("therm_Chloroplast_2", <tiths:ingot_chloroplast> * 2, [
    [<ore:oreChloroplast>, <thermalfoundation:material:1027>, null],
    [<thermalfoundation:material:1024>, null, null],
    [null, null, null]
]);
RecipeUtil.addShaped("therm_Sanite", <gct_mobs:sanite_ingot>, [
    [<ore:oreSanite>, <thermalfoundation:material:1024>, null],
    [null, null, null],
    [null, null, null]
]);
RecipeUtil.addShaped("therm_Sanite_1", <gct_mobs:sanite_ingot>, [
    [<ore:dustSanite>, <thermalfoundation:material:1024>, null],
    [null, null, null],
    [null, null, null]
]);
RecipeUtil.addShaped("therm_Sanite_2", <gct_mobs:sanite_ingot> * 2, [
    [<ore:oreSanite>, <thermalfoundation:material:1027>, null],
    [<thermalfoundation:material:1024>, null, null],
    [null, null, null]
]);
RecipeUtil.addShaped("therm_Imitatium", <tiths:ingot_imitatium>, [
    [<ore:oreImitatium>, <thermalfoundation:material:1024>, null],
    [null, null, null],
    [null, null, null]
]);
RecipeUtil.addShaped("therm_Imitatium_1", <tiths:ingot_imitatium>, [
    [<ore:dustImitatium>, <thermalfoundation:material:1024>, null],
    [null, null, null],
    [null, null, null]
]);
RecipeUtil.addShaped("therm_Imitatium_2", <tiths:ingot_imitatium> * 2, [
    [<ore:oreImitatium>, <thermalfoundation:material:1027>, null],
    [<thermalfoundation:material:1024>, null, null],
    [null, null, null]
]);
RecipeUtil.addShaped("therm_Tanatonium", <tiths:ingot_tanatonium>, [
    [<ore:oreTanatonium>, <thermalfoundation:material:1024>, null],
    [null, null, null],
    [null, null, null]
]);
RecipeUtil.addShaped("therm_Tanatonium_1", <tiths:ingot_tanatonium>, [
    [<ore:dustTanatonium>, <thermalfoundation:material:1024>, null],
    [null, null, null],
    [null, null, null]
]);
RecipeUtil.addShaped("therm_Tanatonium_2", <tiths:ingot_tanatonium> * 2, [
    [<ore:oreTanatonium>, <thermalfoundation:material:1027>, null],
    [<thermalfoundation:material:1024>, null, null],
    [null, null, null]
]);
RecipeUtil.addShaped("therm_Dreadium", <abyssalcraft:dreadiumingot>, [
    [<ore:oreDreadium>, <thermalfoundation:material:1024>, null],
    [null, null, null],
    [null, null, null]
]);
RecipeUtil.addShaped("therm_Dreadium_1", <abyssalcraft:dreadiumingot>, [
    [<ore:dustDreadium>, <thermalfoundation:material:1024>, null],
    [null, null, null],
    [null, null, null]
]);
RecipeUtil.addShaped("therm_Dreadium_2", <abyssalcraft:dreadiumingot> * 2, [
    [<ore:oreDreadium>, <thermalfoundation:material:1027>, null],
    [<thermalfoundation:material:1024>, null, null],
    [null, null, null]
]);
RecipeUtil.addShaped("mystical_Dreadium", <abyssalcraft:dreadiumingot>, [
    [<mysticalagriculture:dreadium_essence>, <mysticalagriculture:dreadium_essence>, <mysticalagriculture:dreadium_essence>],
    [<mysticalagriculture:dreadium_essence>, null, <mysticalagriculture:dreadium_essence>],
    [<mysticalagriculture:dreadium_essence>, <mysticalagriculture:dreadium_essence>, <mysticalagriculture:dreadium_essence>]
]);
RecipeUtil.addShaped("machine_assembler", <modularmachineryaddons:advancedmachineassembler>, [
    [null, <ore:ingotManyullyn>, null],
    [null, <ore:ingotManyullyn>, null],
    [null, <ore:stickWood>, null]
]);
RecipeUtil.addShaped("machine_assembler2", <additions:basic_assembler>, [
    [null, <ore:ingotAluminum>, null],
    [null, <ore:ingotAluminum>, null],
    [null, <ore:stickWood>, null]
]);
RecipeUtil.addShaped("machine_disassembler", <modularmachineryaddons:advancedmachinedisassembler>, [
    [<ore:ingotManyullyn>, <ore:ingotManyullyn>, <ore:ingotManyullyn>],
    [null, <ore:stickWood>, null],
    [null, <ore:stickWood>, null]
]);
RecipeUtil.addShaped("efficiency_rune", <bloodmagic:blood_rune:2>, [
    [<bloodmagic:blood_rune>, <ore:ingotBoundMetal>, <bloodmagic:blood_rune>],
    [<ore:fragmentTime>, <bloodmagic:slate:4>, <ore:fragmentTime>], 
    [<bloodmagic:blood_rune>, <bloodmagic:blood_orb>.withTag({orb: "bloodmagic:archmage"}).reuse(), <bloodmagic:blood_rune>]
]);
RecipeUtil.addShaped("biome_hatch", <modularmachineryaddons:blockbiomeproviderinput>, [
    [<modularmachinery:blockcasing>, <biomesoplenty:biome_essence>, <modularmachinery:blockcasing>],
    [<biomesoplenty:biome_essence>, <modularmachinery:blockcontroller>, <biomesoplenty:biome_essence>],
    [<modularmachinery:blockcasing>, <biomesoplenty:biome_essence>, <modularmachinery:blockcasing>]
]);
RecipeUtil.addShaped("dimension_hatch", <modularmachineryaddons:blockdimensionproviderinput>, [
    [<modularmachinery:blockcasing>, <ore:fragmentTime>, <modularmachinery:blockcasing>],
    [<ore:fragmentTime>, <modularmachinery:blockcontroller>, <ore:fragmentTime>],
    [<modularmachinery:blockcasing>, <ore:fragmentTime>, <modularmachinery:blockcasing>]
]);
RecipeUtil.addShaped("flux_provider_output", <modularmachineryaddons:blockfluxprovideroutput>, [
    [<ore:ingotModularium>, <thaumadditions:flux_concentrator>, <ore:ingotModularium>],
    [<ore:ingotMithrillium>, <modularmachinery:blockcasing>, <ore:ingotMithrillium>], 
    [<ore:ingotModularium>, <ore:ingotMithrillium>, <ore:ingotModularium>]
]);
RecipeUtil.addShaped("flux_provider_input", <modularmachineryaddons:blockfluxproviderinput>, [
    [<ore:ingotModularium>, <thaumcraft:condenser>, <ore:ingotModularium>],
    [<ore:ingotVoid>, <modularmachinery:blockcasing>, <ore:ingotVoid>], 
    [<ore:ingotModularium>, <ore:ingotVoid>, <ore:ingotModularium>]
]);
RecipeUtil.addShaped("me_essentia_output_bus", <modularmachineryaddons:blockmeessentiaoutputbus>, [
    [<ore:ingotModularium>, <thaumicenergistics:essentia_export>, <ore:ingotModularium>],
    [<ore:ingotModularium>, <thaumicenergistics:coalescence_core>, <ore:ingotModularium>], 
    [<ore:ingotModularium>, <modularmachinery:blockcasing>, <ore:ingotModularium>]
]);
RecipeUtil.addShaped("me_essentia_input_bus", <modularmachineryaddons:blockmeessentiainputbus>, [
    [<ore:ingotModularium>, <thaumicenergistics:essentia_import>, <ore:ingotModularium>],
    [<ore:ingotModularium>, <thaumicenergistics:diffusion_core>, <ore:ingotModularium>], 
    [<ore:ingotModularium>, <modularmachinery:blockcasing>, <ore:ingotModularium>]
]);
RecipeUtil.addShaped("meteor_provider_output", <modularmachineryaddons:blockmeteorprovideroutput>, [
    [<ore:ingotModularium>, <bloodmagic:activation_crystal:1>, <ore:ingotModularium>],
    [<ore:blockPorpezite>, <ore:blockIgnite>, <ore:blockPorpezite>], 
    [<ore:ingotModularium>, <ore:blockPorpezite>, <ore:ingotModularium>]
]);
RecipeUtil.addShaped("scrubber_provider_input", <modularmachineryaddons:blockscrubberproviderinput>, [
    [<ore:ingotModularium>, <ore:ingotPruified>, <ore:ingotModularium>],
    [<ore:ingotPruified>, <modularmachinery:blockcasing>, <ore:ingotPruified>], 
    [<ore:ingotModularium>, <ore:ingotPruified>, <ore:ingotModularium>]
]);
RecipeUtil.addShaped("radiation_provider_output", <modularmachineryaddons:blockradiationprovideroutput>, [
    [<ore:ingotModularium>, <nuclearcraft:ingot_block:8>, <ore:ingotModularium>],
    [<ore:ingotHafnium>, <modularmachinery:blockcasing>, <ore:ingotHafnium>], 
    [<ore:ingotModularium>, <nuclearcraft:ingot_block:8>, <ore:ingotModularium>]
]);
RecipeUtil.addShaped("radiation_provider_input", <modularmachineryaddons:blockradiationproviderinput>, [
    [<ore:ingotModularium>, <forge:bucketfilled>.withTag({FluidName: "heavy_water", Amount: 1000}).transformReplace(<minecraft:bucket>), <ore:ingotModularium>],
    [<ore:ingotZirconium>, <modularmachinery:blockcasing>, <ore:ingotZirconium>], 
    [<ore:ingotModularium>, <ore:ingotZirconium>, <ore:ingotModularium>]
]);
RecipeUtil.addShaped("aether_portal", <aether_legacy:aether_portal_frame>, [
    [null, <ore:compressedGlowstone1>, null],
    [<ore:compressedGlowstone1>, <minecraft:water_bucket>.transformReplace(<minecraft:bucket>), <ore:compressedGlowstone1>],
    [null, <ore:compressedGlowstone1>, null]
]);
RecipeUtil.addShaped("spike_stone", <extrautils2:spike_stone>, [
    [null, <ore:slabCobblestone>, null],
    [<ore:slabCobblestone>, <ore:cobblestone>, <ore:slabCobblestone>],
    [<ore:cobblestone>, <ore:cobblestone>, <ore:cobblestone>]
]);
RecipeUtil.addShaped("upgrade_blank", <additions:upgrade_blank>, [
    [null, <ore:ingotZincargentum>, <ore:ingotZincargentum>],
    [<ore:ingotZincargentum>, <ore:plateZincargentum>, <ore:ingotZincargentum>],
    [<ore:ingotZincargentum>, <ore:ingotZincargentum>, null]
]);
RecipeUtil.addShaped("upgrade_stainless", <additions:upgrade_stainless_steel>, [
    [<ore:gearStainlessSteel>, <ore:ingotModularium>, <ore:gearStainlessSteel>],
    [<ore:ingotModularium>, <ore:modularUpgradeBlank>, <ore:ingotModularium>],
    [<ore:gearStainlessSteel>, <ore:ingotModularium>, <ore:gearStainlessSteel>]
]);
RecipeUtil.addShaped("upgrade_durasteel", <additions:upgrade_durasteel>, [
    [<ore:gearDurasteel>, <ore:ingotModularium>, <ore:gearDurasteel>],
    [<ore:ingotModularium>, <ore:modularUpgradeStainlessSteel>, <ore:ingotModularium>],
    [<ore:gearDurasteel>, <ore:ingotModularium>, <ore:gearDurasteel>]
]);
RecipeUtil.addShaped("upgrade_aeonsteel", <additions:upgrade_aeonsteel>, [
    [<ore:gearAeonsteel>, <ore:ingotModularium>, <ore:gearAeonsteel>],
    [<ore:ingotModularium>, <ore:modularUpgradeDurasteel>, <ore:ingotModularium>],
    [<ore:gearAeonsteel>, <ore:ingotModularium>, <ore:gearAeonsteel>]
]);
RecipeUtil.addShaped("upgrade_chromasteel", <additions:upgrade_chromasteel>, [
    [<ore:gearChromasteel>, <ore:ingotModularium>, <ore:gearChromasteel>],
    [<ore:ingotModularium>, <ore:modularUpgradeAeonsteel>, <ore:ingotModularium>],
    [<ore:gearChromasteel>, <ore:ingotModularium>, <ore:gearChromasteel>]
]);
RecipeUtil.addShaped("upgrade_cosmilite", <additions:upgrade_cosmilite>, [
    [<ore:gearCosmilite>, <ore:ingotModularium>, <ore:gearCosmilite>],
    [<ore:ingotModularium>, <ore:modularUpgradeChromasteel>, <ore:ingotModularium>],
    [<ore:gearCosmilite>, <ore:ingotModularium>, <ore:gearCosmilite>]
]);
RecipeUtil.addShaped("upgrade_finallium", <additions:upgrade_finallium>, [
    [<ore:gearFinallium>, <ore:ingotModularium>, <ore:gearFinallium>],
    [<ore:ingotModularium>, <ore:modularUpgradeCosmilite>, <ore:ingotModularium>],
    [<ore:gearFinallium>, <ore:ingotModularium>, <ore:gearFinallium>]
]);
RecipeUtil.addShaped("upgrade_wavite", <additions:upgrade_wavite>, [
    [<ore:gearWavite>, <ore:ingotModularium>, <ore:gearWavite>],
    [<ore:ingotModularium>, <ore:modularUpgradeFinallium>, <ore:ingotModularium>],
    [<ore:gearWavite>, <ore:ingotModularium>, <ore:gearWavite>]
]);
RecipeUtil.addShaped("upgrade_nature", <additions:upgrade_nature>, [
    [<ore:gearStone>, <ore:ingotModularium>, <ore:gearStone>],
    [<ore:treeSapling>, <ore:modularUpgradeBlank>, <ore:treeSapling>],
    [<ore:gearStone>, <ore:ingotModularium>, <ore:gearStone>]
]);
RecipeUtil.addShaped("stone_1", <storagedrawers:produce_stone>, [
    [null, null, null],
    [null, <thermalexpansion:machine:15>.withTag({RSControl: 0 as byte, Facing: 3 as byte, Energy: 0, SideCache: [1, 1, 2, 2, 2, 2] as byte[] as byte[], Level: 0 as byte}), null],
    [null, null, null]
]);
RecipeUtil.addShaped("stone_2", <storagedrawers:produce_stone:1>, [
    [<storagedrawers:produce_stone>, <storagedrawers:produce_stone>, <storagedrawers:produce_stone>],
    [<storagedrawers:produce_stone>, <storagedrawers:produce_stone>, <storagedrawers:produce_stone>],
    [<storagedrawers:produce_stone>, <storagedrawers:produce_stone>, <storagedrawers:produce_stone>]
]);
RecipeUtil.addShaped("stone_3", <storagedrawers:produce_stone:2>, [
    [<storagedrawers:produce_stone:1>, <storagedrawers:produce_stone:1>, <storagedrawers:produce_stone:1>],
    [<storagedrawers:produce_stone:1>, <storagedrawers:produce_stone:1>, <storagedrawers:produce_stone:1>],
    [<storagedrawers:produce_stone:1>, <storagedrawers:produce_stone:1>, <storagedrawers:produce_stone:1>]
]);
RecipeUtil.addShaped("stone_4", <storagedrawers:produce_stone:3>, [
    [<storagedrawers:produce_stone:2>, <storagedrawers:produce_stone:2>, <storagedrawers:produce_stone:2>],
    [<storagedrawers:produce_stone:2>, <storagedrawers:produce_stone:2>, <storagedrawers:produce_stone:2>],
    [<storagedrawers:produce_stone:2>, <storagedrawers:produce_stone:2>, <storagedrawers:produce_stone:2>]
]);
RecipeUtil.addShaped("stone_5", <storagedrawers:produce_stone:4>, [
    [<storagedrawers:produce_stone:3>, <storagedrawers:produce_stone:3>, <storagedrawers:produce_stone:3>],
    [<storagedrawers:produce_stone:3>, <nuclearcraft:cobblestone_generator_dense>, <storagedrawers:produce_stone:3>],
    [<storagedrawers:produce_stone:3>, <storagedrawers:produce_stone:3>, <storagedrawers:produce_stone:3>]
]);
RecipeUtil.addShaped("stone_6", <storagedrawers:produce_stone:5>, [
    [<storagedrawers:produce_stone:4>, <storagedrawers:produce_stone:4>, <storagedrawers:produce_stone:4>],
    [<storagedrawers:produce_stone:4>, <nuclearcraft:cobblestone_generator_dense>, <storagedrawers:produce_stone:4>],
    [<storagedrawers:produce_stone:4>, <storagedrawers:produce_stone:4>, <storagedrawers:produce_stone:4>]
]);
RecipeUtil.addShaped("ender_1", <storagedrawers:ender_linker>, [
    [null, null, null],
    [null, <modularrouters:module:7>.withTag({ModuleFilter: [], Flags: 13 as byte}), null],
    [null, null, null]
]);
RecipeUtil.addShaped("ender_2", <storagedrawers:ender_linker:1>, [
    [null, null, null],
    [<appliedenergistics2:material:30>, <storagedrawers:ender_linker>, <appliedenergistics2:material:30>],
    [null, null, null]
]);
RecipeUtil.addShaped("ender_3", <storagedrawers:ender_linker:2>, [
    [null, null, null],
    [<appliedenergistics2:material:30>, <storagedrawers:ender_linker:1>, <appliedenergistics2:material:30>],
    [null, null, null]
]);
RecipeUtil.addShaped("ender_4", <storagedrawers:ender_linker:3>, [
    [null, null, null],
    [<appliedenergistics2:material:30>, <storagedrawers:ender_linker:2>, <appliedenergistics2:material:30>],
    [null, null, null]
]);
RecipeUtil.addShaped("ender_5", <storagedrawers:ender_linker:4>, [
    [null, null, null],
    [<appliedenergistics2:material:30>, <storagedrawers:ender_linker:3>, <appliedenergistics2:material:30>],
    [null, null, null]
]);
RecipeUtil.addShaped("ender_6", <storagedrawers:ender_linker:5>, [
    [null, null, null],
    [<appliedenergistics2:material:30>, <storagedrawers:ender_linker:4>, <appliedenergistics2:material:30>],
    [null, null, null]
]);
RecipeUtil.addModeRecipe("mm_upgrade_t4", <modularmachinery:blockcasing:5>, [
    [<ore:blockChromasteel>, <ore:ingotModularium>, <ore:blockChromasteel>],
    [<ore:ingotModularium>, <modularmachinery:blockcasing:3>, <ore:ingotModularium>],
    [<ore:blockChromasteel>, <ore:ingotModularium>, <ore:blockChromasteel>]
]);
RecipeUtil.addModeRecipe("mm_upgrade_t3", <modularmachinery:blockcasing:3>, [
    [<ore:blockAeonsteel>, <ore:ingotModularium>, <ore:blockAeonsteel>],
    [<ore:ingotModularium>, <modularmachinery:blockcasing:2>, <ore:ingotModularium>],
    [<ore:blockAeonsteel>, <ore:ingotModularium>, <ore:blockAeonsteel>]
]);
RecipeUtil.addModeRecipe("mm_upgrade_t2", <modularmachinery:blockcasing:2>, [
    [<ore:blockDurasteel>, <ore:ingotModularium>, <ore:blockDurasteel>],
    [<ore:ingotModularium>, <modularmachinery:blockcasing:1>, <ore:ingotModularium>],
    [<ore:blockDurasteel>, <ore:ingotModularium>, <ore:blockDurasteel>]
]);
RecipeUtil.addModeRecipe("mm_upgrade_t1", <modularmachinery:blockcasing:1>, [
    [<ore:blockStainlessSteel>, <ore:ingotModularium>, <ore:blockStainlessSteel>],
    [<ore:ingotModularium>, <modularmachinery:blockcasing:4>, <ore:ingotModularium>],
    [<ore:blockStainlessSteel>, <ore:ingotModularium>, <ore:blockStainlessSteel>]
]);
RecipeUtil.addShaped("thaumcraft_amber_block", <thaumcraft:amber_block>, [
    [<thaumcraft:amber>, <thaumcraft:amber>, null],
    [<thaumcraft:amber>, <thaumcraft:amber>, null],
    [null, null, null]
]);
RecipeUtil.addShaped("aa_quartztypedark", <actuallyadditions:block_misc:2>, [
    [<ore:gemQuartzBlack>, <ore:gemQuartzBlack>, null],
    [<ore:gemQuartzBlack>, <ore:gemQuartzBlack>, null],
    [null, null, null]
]);
RecipeUtil.addShaped("botania_quartztypedark", <botania:quartztypedark>, [
    [null, <ore:gemQuartzBlack>, <ore:gemQuartzBlack>],
    [null, <ore:gemQuartzBlack>, <ore:gemQuartzBlack>],
    [null, null, null]
]);
RecipeUtil.addShaped("thaumictinkerer_black_quartz_block", <thaumictinkerer:black_quartz_block>, [
    [null, null, null],
    [null, <ore:gemQuartzBlack>, <ore:gemQuartzBlack>],
    [null, <ore:gemQuartzBlack>, <ore:gemQuartzBlack>]
]);
RecipeUtil.addShaped("circuit_dreamic", <additions:dreamic_control_circuit>, [
    [null, <ore:ingotBalancedMatrix>, null],
    [<ore:alloyImitate>, <additions:arcane_control_circuit>, <ore:alloyImitate>],
    [null, <ore:ingotBalancedMatrix>, null]
]);
RecipeUtil.addShaped("mana_speed_card_plus", <crazyae:upgrade:1>, [
    [<appliedenergistics2:quartz_glass>, <additions:calculation_processor_2>, <appliedenergistics2:quartz_glass>],
    [<crazyae:upgrade:2>, <appliedenergistics2:material:47>, <crazyae:upgrade:2>],
    [<appliedenergistics2:quartz_glass>, <crazyae:upgrade:2>, <appliedenergistics2:quartz_glass>]
]);
RecipeUtil.addShaped("infinity_cell_water", <extendedae:infinity_cell>.withTag({r: {FluidName: "water", Craft: 0 as byte, Cnt: 1 as long, Count: 0 as byte, Req: 0 as long}, t: "f"}), [
    [<minecraft:water_bucket>, <minecraft:water_bucket>, <minecraft:water_bucket>],
    [<minecraft:water_bucket>, <appliedenergistics2:material:39>, <minecraft:water_bucket>],
    [<minecraft:water_bucket>, <minecraft:water_bucket>, <minecraft:water_bucket>]
]);
RecipeUtil.addShaped("infinity_cell_cobblestone", <extendedae:infinity_cell>.withTag({r: {Craft: 0 as byte, Cnt: 1 as long, id: "minecraft:cobblestone", Count: 1, Damage: 0 as short, Req: 0 as long}, t: "i"}), [
    [<extrautils2:compressedcobblestone:7>, <extrautils2:compressedcobblestone:7>, <extrautils2:compressedcobblestone:7>],
    [<extrautils2:compressedcobblestone:7>, <appliedenergistics2:material:39>, <extrautils2:compressedcobblestone:7>],
    [<extrautils2:compressedcobblestone:7>, <extrautils2:compressedcobblestone:7>, <extrautils2:compressedcobblestone:7>]
]);
RecipeUtil.addShaped("primordial_stonebrick", <gct_mobs:primordial_stonebrick> * 4, [
    [<gct_mobs:primordial_stone>, <gct_mobs:primordial_stone>, null],
    [<gct_mobs:primordial_stone>, <gct_mobs:primordial_stone>, null],
    [null, null, null]
]);
RecipeUtil.addShaped("primordial_stonebrick_stairs", <gct_mobs:primordial_stonebrick_stairs> * 8, [
    [<gct_mobs:primordial_stonebrick>, null, null],
    [<gct_mobs:primordial_stonebrick>, <gct_mobs:primordial_stonebrick>, null],
    [<gct_mobs:primordial_stonebrick>, <gct_mobs:primordial_stonebrick>, <gct_mobs:primordial_stonebrick>]
]);
RecipeUtil.addShaped("primordial_stonebrick_slab", <gct_mobs:primordial_stonebrick_slab> * 6, [
    [null, null, null],
    [<gct_mobs:primordial_stonebrick>, <gct_mobs:primordial_stonebrick>, <gct_mobs:primordial_stonebrick>],
    [null, null, null]
]);
RecipeUtil.addShaped("primordial_stonebrick_wall", <gct_mobs:primordial_stonebrick_wall> * 6, [
    [null, null, null],
    [<gct_mobs:primordial_stonebrick>, <gct_mobs:primordial_stonebrick>, <gct_mobs:primordial_stonebrick>],
    [<gct_mobs:primordial_stonebrick>, <gct_mobs:primordial_stonebrick>, <gct_mobs:primordial_stonebrick>]
]);
RecipeUtil.addShaped("link_card", <whimcraft:link_card>, [
    [null, <crazyae:material:35>, null],
    [<crazyae:material:35>, <additions:wireless_processor>, <crazyae:material:35>],
    [null, <crazyae:material:35>, null]
]);
RecipeUtil.addShaped("ancient_collection", <additions:ancient_collection>, [
    [<additions:ancient_tome>, <additions:ancient_tome>, <additions:ancient_tome>],
    [<additions:ancient_tome>, <additions:ancient_tome>, <additions:ancient_tome>],
    [<additions:ancient_tome>, <additions:ancient_tome>, <additions:ancient_tome>]
]);