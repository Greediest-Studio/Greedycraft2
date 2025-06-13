/*
 * This script is created for the GreedyCraft modpack by TCreopargh.
 * You may NOT use this script in any other publicly distributed modpack without my permission. 
 */ 

#priority 30

import thaumcraft.aspect.CTAspect;

import mods.thaumcraft.Infusion;

Infusion.registerRecipe("energy_matter_core", "", <additions:energy_matter_core>, 16,
[<aspect:permutatio> * 50, <aspect:alienis> * 50, <aspect:praecantatio> * 50, <aspect:alkimia> * 50, <aspect:auram> * 50, <aspect:desiderium> * 50],
<projecte:item.pe_philosophers_stone>, [<mekanism:controlcircuit:3>, <projecte:item.pe_matter:1>, <thaumcraft:causality_collapser>, <appliedenergistics2:material:47>, <additions:matter_block>, <abyssalcraft:transmutationgem>, <abyssalcraft:oc>, <ore:ingotChromasteel>]);

Infusion.registerRecipe("wand_blueprint", "", <additions:blueprint_wand>, 55, 
[<aspect:praecantatio> * 10, <aspect:instrumentum> * 10, <aspect:aversio> * 10, <aspect:auram> * 10], <additions:blueprint>, 
[<thaumcraft:curio:1>, <thaumcraft:ingot>, <thaumcraft:mechanism_simple>, <thaumcraft:vis_resonator>]);

Infusion.registerRecipe("crimsonite_ingot", "", <additions:crimsonite_block>, 6, [<aspect:victus>*1000, <aspect:mortuus>*1000, <aspect:aversio>*1000, <aspect:desiderium>*1000], <bloodarsenal:blood_diamond:3>, [<additions:chromasteel_ingot>,<bloodmagic:item_demon_crystal:1>,<bloodmagic:item_demon_crystal:2>,<bloodmagic:item_demon_crystal:3>,<bloodmagic:item_demon_crystal:4>,<additions:chromasteel_ingot>,<bloodmagic:item_demon_crystal:1>,<bloodmagic:item_demon_crystal:2>,<bloodmagic:item_demon_crystal:3>,<bloodmagic:item_demon_crystal:4>,<additions:chromasteel_ingot>,<bloodmagic:item_demon_crystal:1>,<bloodmagic:item_demon_crystal:2>,<bloodmagic:item_demon_crystal:3>,<bloodmagic:item_demon_crystal:4>,<additions:chromasteel_ingot>,<bloodmagic:item_demon_crystal:1>,<bloodmagic:item_demon_crystal:2>,<bloodmagic:item_demon_crystal:3>,<bloodmagic:item_demon_crystal:4>]);
