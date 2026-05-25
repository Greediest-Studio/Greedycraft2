/*
Copyright Bob Bartsch, 2023

This code is governed by the
Creative Commons Attribution–NonCommercial License
https://creativecommons.org/licenses/by-nc/3.0/

(Meaning: credit me if you modify and/or redistribute
this code. Also, you may not sell this code.)
*/

import crafttweaker.oredict.IOreDict;
import crafttweaker.oredict.IOreDictEntry;
import mods.nuclearcraft.Enricher;
import mods.nuclearcraft.ChemicalReactor;

import crafttweaker.item.IIngredient;
import mods.nuclearcraft.FissionHeating;
import mods.nuclearcraft.Turbine;
import mods.nuclearcraft.SolidFission;
import mods.nuclearcraft.Infuser;
import mods.nuclearcraft.FissionModerator;
import mods.nuclearcraft.FissionIrradiator;
import mods.nuclearcraft.FissionReflector;
import mods.nuclearcraft.FuelReprocessor;
import mods.nuclearcraft.Melter;
import mods.nuclearcraft.IngotFormer;



/* -=-=-=-=-=-=-=-=- Added Reactor Components -=-=-=-=-=-=-=-=- */
val chassis = <nuclearcraft:part:12>;
val plate = <nuclearcraft:part:0>;

//moderators
mods.nuclearcraft.Infuser.addRecipe(<nuclearcraft:part:0>, <fluid:water> * 1000, <contenttweaker:water_mod>);
mods.nuclearcraft.FissionModerator.add(<contenttweaker:water_mod>, 29, 0.95);

recipes.addShaped(<contenttweaker:pu_schmeared_be_mod>,[[<ore:ingotPlutonium238>, <ore:ingotBeryllium>, <ore:ingotPlutonium238>],[<ore:ingotBeryllium>, <ore:ingotBeryllium>, <ore:ingotBeryllium>],[<ore:ingotPlutonium238>,<ore:ingotBeryllium>,<ore:ingotPlutonium238>]]);
mods.nuclearcraft.FissionModerator.add(<contenttweaker:pu_schmeared_be_mod>, 49, 0.98);
oreDict.puBeModerator;
<ore:puBeModerator>.add(<contenttweaker:pu_schmeared_be_mod>);

var found = 0;
if (loadedMods has "pneumaticcraft"||loadedMods has "immersivepetroleum"||loadedMods has "galacticraft"||loadedMods has "buildcraft"){
mods.nuclearcraft.Infuser.addRecipe(<nuclearcraft:part:11>, <fluid:oil> * 1000, <contenttweaker:hydrocarbon_mod>);
found=1;
}
if (loadedMods has "thermalfoundation"){
mods.nuclearcraft.Infuser.addRecipe(<nuclearcraft:part:11>, <fluid:crude_oil> * 1000, <contenttweaker:hydrocarbon_mod>);
found=1;
}
if(found==0){
mods.nuclearcraft.Infuser.addRecipe(<nuclearcraft:part:11>, <fluid:coal> * 1000, <contenttweaker:hydrocarbon_mod>);
}
mods.nuclearcraft.FissionModerator.add(<contenttweaker:hydrocarbon_mod>, 3, 1.02);


//reflectors
recipes.addShaped(<contenttweaker:cf_neutron_multiplier>,[[<ore:ingotGraphite>, <ore:ingotCalifornium251>, <ore:ingotGraphite>],[<ore:ingotCalifornium251>, <ore:ingotCalifornium251>, <ore:ingotCalifornium251>],[<ore:ingotGraphite>,<ore:ingotCalifornium251>,<ore:ingotGraphite>]]);
mods.nuclearcraft.FissionReflector.add(<contenttweaker:cf_neutron_multiplier>, 0.65, 1.65);
oreDict.neutronMultiplierReflector;
<ore:neutronMultiplierReflector>.add(<contenttweaker:cf_neutron_multiplier>);

recipes.addShaped(<contenttweaker:gold_reflector>,[[<ore:ingotGold>, <ore:ingotGraphite>, <ore:ingotGold>],[<ore:ingotGraphite>, chassis, <ore:ingotGraphite>],[<ore:ingotGold>, <ore:ingotGraphite>, <ore:ingotGold>]]);
mods.nuclearcraft.FissionReflector.add(<contenttweaker:gold_reflector>, 0.6, 0.8);


/* -=-=-=-=-=-=-=-=- New Neutron Shields -=-=-=-=-=-=-=-=- */
oreDict.dustGadolinium;
<ore:dustGadolinium>.add(<contenttweaker:gadolinium_dust>);

// MRR Compat
if (oreDict has "QuantumTraverseIHaveHadEnoughOfYourSpaghettiCodeAndAbsurdNames"){
mods.nuclearcraft.FissionIrradiator.addRecipe(<ore:dustEuropium155>, <ore:dustGadolinium>, 196386, 0.0, 0.0, 1, 20000, 0.285);
}else{
mods.nuclearcraft.FissionIrradiator.addRecipe(<ore:dustEuropium155>, <ore:dustGadolinium>, 196386, 0.0, 0.0, 1, 20000, 0.210);
}
recipes.addShaped(<nuclearcraft:fission_shield_gadolinium>*2,[[plate, <ore:dustGadolinium>, plate],[<ore:dustGadolinium>, chassis, <ore:dustGadolinium>],[plate,<ore:dustGadolinium>, plate]]);


/* -=-=-=-=-=-=-=-=- New Neutron Sources -=-=-=-=-=-=-=-=- */

if (oreDict has "dustActinium227") {
	recipes.addShaped(<nuclearcraft:fission_source_actinium>*2,[[plate, <ore:dustActinium227>, plate],[<ore:dustBeryllium>, chassis, <ore:dustBeryllium>],[plate,<ore:dustActinium227>, plate]]);
	mods.nuclearcraft.FuelReprocessor.addRecipe(<nuclearcraft:fission_source_actinium>*2, <ore:dustActinium227>*2, <ore:dustBeryllium>*2, null, null, chassis, plate*4, null, null);
}else{
	mods.jei.JEI.hide(<nuclearcraft:fission_source_actinium>);
}

if (oreDict has "ingotCurium244") {
	recipes.addShaped(<nuclearcraft:fission_source_curium244>*2,[[plate, <ore:ingotCurium244>, plate],[<ore:dustBeryllium>, chassis, <ore:dustBeryllium>],[plate,<ore:ingotCurium244>, plate]]);
	mods.nuclearcraft.FuelReprocessor.addRecipe(<nuclearcraft:fission_source_curium244>*2, <ore:ingotCurium244>*2, <ore:dustBeryllium>*2, null, null, chassis, plate*4, null, null);
}else{
	mods.jei.JEI.hide(<nuclearcraft:fission_source_curium244>);
}

if (oreDict has "ingotCurium250") {
	recipes.addShaped(<nuclearcraft:fission_source_curium250>*2,[[plate, <ore:ingotCurium250>, plate],[<ore:ingotCurium250>, chassis, <ore:ingotCurium250>],[plate,<ore:ingotCurium250>, plate]]);
	mods.nuclearcraft.FuelReprocessor.addRecipe(<nuclearcraft:fission_source_curium250>*2, <ore:ingotCurium250>*2, <ore:ingotCurium250>*2, null, null, chassis, plate*4, null, null);
}else{
	mods.jei.JEI.hide(<nuclearcraft:fission_source_curium250>);
}

if (oreDict has "ingotFermium257All") {
	recipes.addShaped(<nuclearcraft:fission_source_fermium257>*2,[[plate, <ore:ingotFermium257All>, plate],[<ore:ingotFermium257All>, chassis, <ore:ingotFermium257All>],[plate,<ore:ingotFermium257All>, plate]]);
	mods.nuclearcraft.FuelReprocessor.addRecipe(<nuclearcraft:fission_source_fermium257>*2, <ore:ingotFermium257All>*2, <ore:ingotFermium257All>*2, null, null, chassis, plate*4, null, null);
}else{
	mods.jei.JEI.hide(<nuclearcraft:fission_source_fermium257>);
}

if (oreDict has "ingotCalifornium254All") {
	recipes.addShaped(<nuclearcraft:fission_source_californium254>*2,[[plate, <ore:ingotCalifornium254All>, plate],[<ore:ingotCalifornium254All>, chassis, <ore:ingotCalifornium254All>],[plate,<ore:ingotCalifornium254All>, plate]]);
	mods.nuclearcraft.FuelReprocessor.addRecipe(<nuclearcraft:fission_source_californium254>*2, <ore:ingotCalifornium254All>*2, <ore:ingotCalifornium254All>*2, null, null, chassis, plate*4, null, null);
}else{
	mods.jei.JEI.hide(<nuclearcraft:fission_source_californium254>);
}

// MRR Compat
if (oreDict has "QuantumTraverseIHaveHadEnoughOfYourSpaghettiCodeAndAbsurdNames") {

mods.nuclearcraft.Radiation.setRadiationLevel(<nuclearcraft:fission_source_actinium>, 1.15E-02);
mods.nuclearcraft.Radiation.setRadiationLevel(<nuclearcraft:fission_source_curium244>, 2.62E-06);
mods.nuclearcraft.Radiation.setRadiationLevel(<nuclearcraft:fission_source_curium250>, 6.98E-04);
mods.nuclearcraft.Radiation.setRadiationLevel(<nuclearcraft:fission_source_fermium257>, 2.99E-01);
mods.nuclearcraft.Radiation.setRadiationLevel(<nuclearcraft:fission_source_californium254>, 5.77E+00);
mods.nuclearcraft.Radiation.setRadiationLevel(<contenttweaker:pu_schmeared_be_mod>, 3.97E-03);
mods.nuclearcraft.Radiation.setRadiationLevel(<contenttweaker:cf_neutron_multiplier>, 2.60E-03);

}else{

mods.nuclearcraft.Radiation.setRadiationLevel(<nuclearcraft:fission_source_actinium>, 0.01148263825);
mods.nuclearcraft.Radiation.setRadiationLevel(<nuclearcraft:fission_source_curium244>, 0.013804527885);
mods.nuclearcraft.Radiation.setRadiationLevel(<nuclearcraft:fission_source_curium250>, 0.000030120481925);
mods.nuclearcraft.Radiation.setRadiationLevel(<nuclearcraft:fission_source_fermium257>, 0.9085820895);
mods.nuclearcraft.Radiation.setRadiationLevel(<nuclearcraft:fission_source_californium254>, 1.50929752075);
mods.nuclearcraft.Radiation.setRadiationLevel(<contenttweaker:pu_schmeared_be_mod>, 1.14E-02);
mods.nuclearcraft.Radiation.setRadiationLevel(<contenttweaker:cf_neutron_multiplier>, 0.001111111111);

}

/* -=-=-=-=-=-=-=-=- Normal Neutron Source Dissassembly -=-=-=-=-=-=-=-=- */
mods.nuclearcraft.FuelReprocessor.addRecipe(<nuclearcraft:fission_source:0>*2, <ore:dustRadium>*2, <ore:dustBeryllium>*2, null, null, chassis, plate*4, null, null);
mods.nuclearcraft.FuelReprocessor.addRecipe(<nuclearcraft:fission_source:1>*2, <ore:dustPolonium>*2, <ore:dustBeryllium>*2, null, null, chassis, plate*4, null, null);
mods.nuclearcraft.FuelReprocessor.addRecipe(<nuclearcraft:fission_source:2>*2, <ore:ingotCalifornium252>*2, <ore:ingotCalifornium252>*2, null, null, chassis, plate*4, null, null);
