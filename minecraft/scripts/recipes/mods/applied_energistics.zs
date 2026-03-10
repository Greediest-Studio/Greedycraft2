/*
 * This script is created for the GreedyCraft modpack by mc_Edwin.
 * You may NOT use this script in any other publicly distributed modpack without my permission.
 */

#priority 1000

import mods.appliedenergistics2.Inscriber;

Inscriber.removeRecipe(<cells:singularity_processor>);
Inscriber.removeRecipe(<cells:singularity_processor:1>);
Inscriber.removeRecipe(<cells:singularity_processor:2>);

Inscriber.addRecipe(<additions:germanium_plate>, <additions:germanium_ingot>, true, <additions:germanium_press>);
Inscriber.addRecipe(<additions:ga_in_p2_plate>, <additions:gallium_indium_phosphide>, true, <additions:ga_in_p2_press>);
Inscriber.addRecipe(<additions:wireless_processor>, <minecraft:redstone>, false, <additions:germanium_plate>, <appliedenergistics2:material:20>);
Inscriber.addRecipe(<cells:singularity_processor>, <avaritia:resource:4>, false, <cells:compressed_calculation_print:3>, <cells:compressed_silicon_print:3>);
Inscriber.addRecipe(<cells:singularity_processor:1>, <avaritia:resource:4>, false, <cells:compressed_engineering_print:3>, <cells:compressed_silicon_print:3>);
Inscriber.addRecipe(<cells:singularity_processor:2>, <avaritia:resource:4>, false, <cells:compressed_logic_print:3>, <cells:compressed_silicon_print:3>);

Inscriber.addRecipe(<additions:calculation_circuit_printed_2>, <actuallyadditions:item_crystal:4>, true, <additions:calculation_press_2>);
Inscriber.addRecipe(<additions:engineering_circuit_printed_2>, <defiledlands:scarlite>, true, <additions:engineering_press_2>);
Inscriber.addRecipe(<additions:logic_circuit_printed_2>, <thermalfoundation:material:134>, true, <additions:logic_press_2>);
Inscriber.addRecipe(<additions:calculation_processor_2>, <minecraft:redstone>, false, <additions:calculation_circuit_printed_2>, <additions:germanium_plate>);
Inscriber.addRecipe(<additions:engineering_processor_2>, <minecraft:redstone>, false, <additions:engineering_circuit_printed_2>, <additions:germanium_plate>);
Inscriber.addRecipe(<additions:logic_processor_2>, <minecraft:redstone>, false, <additions:logic_circuit_printed_2>, <additions:germanium_plate>);

Inscriber.addRecipe(<additions:calculation_circuit_printed_3>, <avaritia:resource:1>, true, <additions:calculation_press_3>);
Inscriber.addRecipe(<additions:engineering_circuit_printed_3>, <nuclearcraft:gem:1>, true, <additions:engineering_press_3>);
Inscriber.addRecipe(<additions:logic_circuit_printed_3>, <additions:porpezite_ingot>, true, <additions:logic_press_3>);
Inscriber.addRecipe(<additions:calculation_processor_3>, <minecraft:redstone>, false, <additions:calculation_circuit_printed_3>, <additions:ga_in_p2_plate>);
Inscriber.addRecipe(<additions:engineering_processor_3>, <minecraft:redstone>, false, <additions:engineering_circuit_printed_3>, <additions:ga_in_p2_plate>);
Inscriber.addRecipe(<additions:logic_processor_3>, <minecraft:redstone>, false, <additions:logic_circuit_printed_3>, <additions:ga_in_p2_plate>);