/*
 * This script is created for the GreedyCraft modpack by mc_Edwin.
 * You may NOT use this script in any other publicly distributed modpack without my permission.
 */

#priority 1000

import mods.appliedenergistics2.Inscriber;

Inscriber.addRecipe(<additions:greedycraft-germanium_plate>, <additions:elements-germanium_ingot>, true, <additions:greedycraft-germanium_press>);
Inscriber.addRecipe(<additions:greedycraft-wireless_processor>, <minecraft:redstone>, false, <additions:greedycraft-germanium_plate>, <appliedenergistics2:material:20>);
Inscriber.addRecipe(<additions:greedycraft-calculation_circuit_printed_2>, <actuallyadditions:item_crystal:4>, true, <additions:greedycraft-calculation_press_2>);
Inscriber.addRecipe(<additions:greedycraft-engineering_circuit_printed_2>, <defiledlands:scarlite>, true, <additions:greedycraft-engineering_press_2>);
Inscriber.addRecipe(<additions:greedycraft-logic_circuit_printed_2>, <thermalfoundation:material:134>, true, <additions:greedycraft-logic_press_2>);
Inscriber.addRecipe(<additions:greedycraft-calculation_processor_2>, <minecraft:redstone>, false, <additions:greedycraft-calculation_circuit_printed_2>, <additions:greedycraft-germanium_plate>);
Inscriber.addRecipe(<additions:greedycraft-engineering_processor_2>, <minecraft:redstone>, false, <additions:greedycraft-engineering_circuit_printed_2>, <additions:greedycraft-germanium_plate>);
Inscriber.addRecipe(<additions:greedycraft-logic_processor_2>, <minecraft:redstone>, false, <additions:greedycraft-logic_circuit_printed_2>, <additions:greedycraft-germanium_plate>);

