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

RecipeUtil.addShaped("calculator_subsystem_l4", <ecoaeextension:extendable_calculator_subsystem_l4>, [
    [<ecoaeextension:ecalculator_casing>, <additions:greedycraft-calculation_processor_2>, <ecoaeextension:ecalculator_casing>],
    [<additions:greedycraft-calculation_processor_2>, <projecte:item.pe_philosophers_stone>, <additions:greedycraft-calculation_processor_2>],
    [<ecoaeextension:ecalculator_casing>, <additions:greedycraft-calculation_processor_2>, <ecoaeextension:ecalculator_casing>]
]);
RecipeUtil.addShaped("extendable_calculator_subsystem_l6", <ecoaeextension:extendable_calculator_subsystem_l6>, [
    [<ecoaeextension:ecalculator_casing>, <additions:greedycraft-glowing_crystal_block>, <ecoaeextension:ecalculator_casing>],
    [<additions:greedycraft-glowing_crystal_block>, <ecoaeextension:extendable_calculator_subsystem_l4>, <additions:greedycraft-glowing_crystal_block>],
    [<ecoaeextension:ecalculator_casing>, <additions:greedycraft-glowing_crystal_block>, <ecoaeextension:ecalculator_casing>]
]);
RecipeUtil.addShaped("extendable_calculator_subsystem_l9>", <ecoaeextension:extendable_calculator_subsystem_l9>, [
    [<mekanism:controlcircuit:3>, <additions:greedycraft-durasteel_block>, <mekanism:controlcircuit:3>],
    [<additions:greedycraft-durasteel_block>, <ecoaeextension:extendable_calculator_subsystem_l6>, <additions:greedycraft-durasteel_block>],
    [<mekanism:controlcircuit:3>, <additions:greedycraft-durasteel_block>, <mekanism:controlcircuit:3>]
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
    [<ecoaeextension:ecalculator_casing>, <additions:greedycraft-cryonium_block>, null],
    [<ecoaeextension:ecalculator_casing>, <ecoaeextension:ecalculator_tail_l4>, null],
    [<ecoaeextension:ecalculator_casing>, <additions:greedycraft-cryonium_block>, null]
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