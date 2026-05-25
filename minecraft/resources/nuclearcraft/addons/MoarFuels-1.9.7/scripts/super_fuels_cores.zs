/*
Copyright Bob Bartsch, 2026

This code is governed by the
Creative Commons Attribution–NonCommercial License
https://creativecommons.org/licenses/by-nc/3.0/

(Meaning: credit me if you modify and/or redistribute
this code. Also, you may not sell this code.)
*/

#modloaded trinity

import crafttweaker.item.IIngredient;
import crafttweaker.item.IItemStack;
import crafttweaker.liquid.ILiquidStack;
import crafttweaker.oredict.IOreDict;
import crafttweaker.oredict.IOreDictEntry;
import mods.nuclearcraft.FuelReprocessor;
import mods.nuclearcraft.SolidFission;
import mods.nuclearcraft.Assembler;
import mods.nuclearcraft.DecayHastener;

/* -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- Subcritical Spheres -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- */

//oreDic
var oreDictList = ["ingotU233Sphere","ingotU235Sphere","ingotP239Sphere","ingotA242Sphere","ingotCm247Sphere","ingotB248Sphere","ingotCf249Sphere","ingotCf251Sphere","ingotDepletedU233Sphere","ingotDepletedU235Sphere","ingotDepletedP239Sphere","ingotDepletedA242Sphere","ingotDepletedCm247Sphere","ingotDepletedB248Sphere","ingotDepletedCf249Sphere","ingotDepletedCf251Sphere","ingotPlutonium236"] as string[];
for entry in oreDictList {
	oreDict.entry;
}

var realOreDictList = [<ore:ingotDepletedU233Sphere>,<ore:ingotDepletedU235Sphere>,<ore:ingotDepletedP239Sphere>,<ore:ingotDepletedA242Sphere>,<ore:ingotDepletedCm247Sphere>,<ore:ingotDepletedB248Sphere>,<ore:ingotDepletedCf249Sphere>,<ore:ingotDepletedCf251Sphere>] as IOreDictEntry[];
val realOreDictList2 = [<ore:ingotU233Sphere>,<ore:ingotU235Sphere>,<ore:ingotP239Sphere>,<ore:ingotA242Sphere>,<ore:ingotCm247Sphere>,<ore:ingotB248Sphere>,<ore:ingotCf249Sphere>,<ore:ingotCf251Sphere>] as IOreDictEntry[];
val fuelList = [<contenttweaker:u233sphere>,<contenttweaker:u235sphere>,<contenttweaker:p239sphere>,<contenttweaker:a242sphere>,<contenttweaker:cm247sphere>,<contenttweaker:b248sphere>,<contenttweaker:cf249sphere>,<contenttweaker:cf251sphere>] as IItemStack[];
val pitList = [<trinity:u233_pit>,<trinity:u235_pit>,<trinity:pu239_pit>,<trinity:am242_pit>,<trinity:cm247_pit>,<trinity:bk248_pit>,<trinity:cf249_pit>,<trinity:cf251_pit>] as IItemStack[];
val dFuelList = [<contenttweaker:du233sphere>,<contenttweaker:du235sphere>,<contenttweaker:dp239sphere>,<contenttweaker:da242sphere>,<contenttweaker:dcm247sphere>,<contenttweaker:db248sphere>,<contenttweaker:dcf249sphere>,<contenttweaker:dcf251sphere>] as IItemStack[];

// time, heat, criticality, fisProd1 chance, fisProd2 chance
val intStats = [[2666,1728,16,200,200],[4800,960,20,200,200],[4572,1008,20,200,200],[1476,3210,13,200,200],[2150,2144,15,80,80],[2166,2128,13,80,80],[1066,4320,12,80,80],[2000,2304,14,80,80]] as int[][];
// efficiency, process radiation, depleted radiation, starter radiation
var doubleStats = [[1.3,2.36E-04,1.51E-02,5.56E-06],[1.2,1.15E-04,7.37E-03,1.26E-09],[1.4,1.58E-03,1.01E-01,3.69E-05],[1.55,1.36E-03,8.67E-02,1.21E-04],[1.75,6.88E-04,4.40E-02,5.70E-08],[1.85,7.52E-03,3.83E-01,9.88E-02],[1.95,4.16E-02,2.66E+00,2.53E-03],[2.00,5.17E-02,3.31E+00,9.88E-04]] as double[][];
var fuelDF = [0.065,0.065,0.075,0.08,0.085,0.090,0.10,0.10] as double[];

//MoarRealisticRadiation Compatability
if (oreDict has "QuantumTraverseIHaveHadEnoughOfYourSpaghettiCodeAndAbsurdNames") {
	doubleStats = [[1.3,2.28E-04,1.51E-02,5.56E-06],[1.2,1.67E-04,7.37E-03,1.26E-09],[1.4,7.98E-04,1.01E-01,3.69E-05],[1.55,7.03E-04,8.67E-02,1.21E-04],[1.75,8.79E-04,4.40E-02,5.70E-08],[1.85,5.76E-03,3.83E-01,9.88E-02],[1.95,1.05E-02,2.66E+00,2.53E-03],[2.00,2.74E-02,3.31E+00,9.88E-04]] as double[][];
}


val reprocessing = [[<ore:ingotUranium235>,<ore:ingotUranium238>,<ore:ingotNeptunium236>,<ore:ingotNeptunium237>,<ore:dustStrontium90>,<ore:dustCaesium137>],[<ore:ingotUranium238>,<ore:ingotNeptunium236>,<ore:ingotNeptunium237>,<ore:ingotPlutonium239>,<ore:dustMolybdenum>,<ore:dustCaesium137>],[<ore:ingotPlutonium241>,<ore:ingotPlutonium242>,<ore:ingotAmericium242>,<ore:ingotAmericium243>,<ore:dustStrontium90>,<ore:dustPromethium147>],[<ore:ingotAmericium243>,<ore:ingotCurium243>,<ore:ingotCurium245>,<ore:ingotCurium246>,<ore:dustStrontium90>,<ore:dustPromethium147>],[<ore:ingotBerkelium247>,<ore:ingotBerkelium248>,<ore:ingotCalifornium249>,<ore:ingotCalifornium251>,<ore:dustMolybdenum>,<ore:dustEuropium155>],[<ore:ingotBerkelium248>,<ore:ingotCalifornium249>,<ore:ingotCalifornium251>,<ore:ingotCalifornium252>,<ore:dustRuthenium106>,<ore:dustPromethium147>],[<ore:ingotCalifornium250>,<ore:ingotCalifornium251>,<ore:ingotCalifornium252>,<contenttweaker:californium53>,<ore:dustRuthenium106>,<ore:dustPromethium147>],[<ore:ingotCalifornium252>,<ore:ingotCalifornium252>,<contenttweaker:californium53>,<contenttweaker:californium54>,<ore:dustRuthenium106>,<ore:dustEuropium155>]] as IIngredient[][];

for i,entry in realOreDictList {
	realOreDictList2[i].add(fuelList[i]);
	entry.add(dFuelList[i]);

	mods.nuclearcraft.Assembler.addRecipe(pitList[i], null, null, null, fuelList[i]*9);
	mods.nuclearcraft.SolidFission.addRecipe(fuelList[i], dFuelList[i], intStats[i][0], intStats[i][1], doubleStats[i][0], intStats[i][2], 0, fuelDF[i], true, doubleStats[i][1]);

	val actProd = mods.nuclearcraft.ChanceItemIngredient.create(reprocessing[i][1], 50);
	var fisProd1 = mods.nuclearcraft.ChanceItemIngredient.create(reprocessing[i][4]*2, intStats[i][3]);
	if(intStats[i][3]!=200){
	fisProd1 = mods.nuclearcraft.ChanceItemIngredient.create(reprocessing[i][4]*3, intStats[i][3]);
	}
	val fisProd2 = mods.nuclearcraft.ChanceItemIngredient.create(reprocessing[i][5]*2, intStats[i][4]);
	mods.nuclearcraft.FuelReprocessor.addRecipe(dFuelList[i]*9, reprocessing[i][0], actProd, fisProd1, <ore:dustBeryllium>.amount(4), reprocessing[i][2], reprocessing[i][3], fisProd2, null);

	mods.nuclearcraft.Radiation.setRadiationLevel(dFuelList[i], doubleStats[i][2]);
	mods.nuclearcraft.Radiation.setRadiationLevel(fuelList[i], doubleStats[i][3]);
}

// Np-237 Stuff
<ore:ingotN237Sphere>.add(<contenttweaker:n237sphere>);
<ore:ingotDepletedN237Sphere>.add(<contenttweaker:dn237sphere>);
<ore:ingotPlutonium236>.add(<contenttweaker:plutonium236>);

mods.nuclearcraft.Assembler.addRecipe(<trinity:np237_pit>, null, null, null, <contenttweaker:n237sphere>*9);

if (oreDict has "QuantumTraverseIHaveHadEnoughOfYourSpaghettiCodeAndAbsurdNames") {
	mods.nuclearcraft.FissionIrradiator.addRecipe(<contenttweaker:n237sphere>, <contenttweaker:dn237sphere>, 283968, 2.03, 1.05, 3.16E-05);
}else{
	mods.nuclearcraft.FissionIrradiator.addRecipe(<contenttweaker:n237sphere>, <contenttweaker:dn237sphere>, 283968, 2.03, 1.05, 6.52E-04);
}

val actProd = mods.nuclearcraft.ChanceItemIngredient.create(<ore:ingotPlutonium238>*2, 75);
var fisProd1 = mods.nuclearcraft.ChanceItemIngredient.create(<ore:dustMolybdenum>, 25);
var fisProd2 = mods.nuclearcraft.ChanceItemIngredient.create(<ore:dustCaesium137>, 25);

mods.nuclearcraft.FuelReprocessor.addRecipe(<contenttweaker:dn237sphere>*9, <contenttweaker:plutonium236>, <ore:ingotNeptunium237>*3, fisProd1, <ore:dustBeryllium>.amount(4), actProd, <ore:ingotPlutonium239>*2, fisProd2, null);
mods.nuclearcraft.Radiation.setRadiationLevel(<contenttweaker:dn237sphere>, 4.17E-02);
mods.nuclearcraft.Radiation.setRadiationLevel(<contenttweaker:n237sphere>, 4.15E-07);



/* -=-=-=-=-=-=-=-=-=- PBP Fuels -=-=-=-=-=-=-=-=-=- */
val graphite = <ore:ingotGraphite>|<ore:dustGraphite>;
val zirconium = <ore:ingotZirconium>|<ore:dustZirconium>;


//does all liquid stuff except isotope mixing & separation
function superMelt(item as IItemStack, array as ILiquidStack[], prod as ILiquidStack[], doub as double[], integs as int[], selfPriming as bool){
	//array is molten, fluoride, FLiBe, dFLiBe, dF, dMolten
	//prod is 4 actinides, 2 fission products
	//doub is time, efficiency, radiation
	//integs is heat, criticality, fission product1 chance, fission product2 chance

	//basic melter
	mods.nuclearcraft.Melter.addRecipe(item, array[0]*144);
	mods.nuclearcraft.IngotFormer.addRecipe(array[0]*144, item);

	//fuel making
	mods.nuclearcraft.ChemicalReactor.addRecipe(array[0]*72, <fluid:fluorine>*500, array[1]*72, null);
	mods.nuclearcraft.Electrolyzer.addRecipe(array[1]*72, array[0]*72, <fluid:fluorine>*500, null, null);
	mods.nuclearcraft.SaltMixer.addRecipe(array[1]*72, <fluid:flibe>*72, array[2]*72);
	mods.nuclearcraft.Centrifuge.addRecipe(array[2]*72, array[1]*72, <fluid:flibe>*72, null, null, null, null);

	//MSR recipe
	mods.nuclearcraft.SaltFission.addRecipe(array[2], array[3], doub[0], integs[0], doub[1], integs[1], 0, 0.075, selfPriming, doub[2]);

	//reprocessing
	mods.nuclearcraft.Centrifuge.addRecipe(array[3]*72, array[4]*72, <fluid:flibe>*72, null, null, null, null);
	mods.nuclearcraft.Electrolyzer.addRecipe(array[4]*72, array[5]*72, <fluid:fluorine>*500, null, null);

	val fissProd1 = mods.nuclearcraft.ChanceFluidIngredient.create(prod[4]*16, integs[2], 16);
	val fissProd2 = mods.nuclearcraft.ChanceFluidIngredient.create(prod[5]*16, integs[3], 16);
	mods.nuclearcraft.Centrifuge.addRecipe(array[5]*144, prod[0], prod[1], fissProd1, prod[2], prod[3], fissProd2);
}

val pbpFuels = [<contenttweaker:pbp_fuel>,<contenttweaker:pbp_fuel_carbide>,<contenttweaker:pbp_fuel_oxide>,<contenttweaker:pbp_fuel_nitride>,<contenttweaker:pbp_fuel_zirconium>] as IItemStack[];
val dpbpFuels = [<contenttweaker:dpbp_fuel_triso>,<contenttweaker:dpbp_fuel_oxide>,<contenttweaker:dpbp_fuel_nitride>,<contenttweaker:dpbp_fuel_zirconium>] as IIngredient[];
val dpbpFuels2 = [<contenttweaker:dpbp_fuel_triso>,<contenttweaker:dpbp_fuel_oxide>,<contenttweaker:dpbp_fuel_nitride>,<contenttweaker:dpbp_fuel_zirconium>] as IItemStack[];

val eff = 1.25;
val stats = [[2200,262,73],[2750,210,91],[1760,328,62],[1981,291,66]] as int[][];
var burnrad = 1.23E-02;
val pebble = <contenttweaker:pbp_fuel_triso>;
val fuelN2 = <contenttweaker:pbp_fuel>;

// MRR Compat
if (oreDict has "QuantumTraverseIHaveHadEnoughOfYourSpaghettiCodeAndAbsurdNames") {
	burnrad = 3.56E-04;
}

val fluidFuelNames= [<fluid:pbp>,<fluid:pbp_fluoride>,<fluid:pbp_fluoride_flibe>,<fluid:depleted_pbp_fluoride_flibe>,<fluid:depleted_pbp_fluoride>,<fluid:depleted_pbp>] as ILiquidStack[];
val fluidProd= [<fluid:neptunium_237>*16,<fluid:plutonium_238>*16,<fluid:plutonium_239>*32,<fluid:plutonium_242>*64,<fluid:strontium_90>,<fluid:promethium_147>] as ILiquidStack[];
val moltenTimes = 19.09722222;
val fisProdChance = [25,25] as int[];
val ddecayRad=1.28E-02;

oreDict.ingotPBP;
<ore:ingotPBP>.add(<contenttweaker:pbp_fuel>);

var pu236rad=3.50E-01;
var pu236decay=<ore:dustLead>;
if (oreDict has "QuantumTraverseIHaveHadEnoughOfYourSpaghettiCodeAndAbsurdNames") {
	pu236rad=1.11E-03;
}
if (loadedMods has "qmd") {
	pu236decay=<ore:ingotUranium232>;
}

mods.nuclearcraft.FissionIrradiator.addRecipe(<ore:ingotPlutonium236>, <ore:ingotPBP>, 75692, 0.0, 0.0, 3.50E-01);
mods.nuclearcraft.DecayHastener.addRecipe(<ore:ingotPlutonium236>, <ore:dustLead>,1.0,1.0,3.50E-01);


oreDictList = ["ingotPBPAll","ingotDepletedPBPAll"] as string[];
for entry in oreDictList {
	oreDict.entry;
}
realOreDictList = [<ore:ingotPBPAll>,<ore:ingotDepletedPBPAll>] as IOreDictEntry[];

//non-base recipes
for i,item in pbpFuels{
	mods.nuclearcraft.Radiation.setRadiationLevel(item, 7.75E-01);
	realOreDictList[0].add(item);
}
mods.nuclearcraft.AlloyFurnace.addRecipe(pbpFuels[0], graphite, pbpFuels[1]);
mods.nuclearcraft.Infuser.addRecipe(pbpFuels[0], <fluid:oxygen>*1000, pbpFuels[2]);
mods.nuclearcraft.Infuser.addRecipe(pbpFuels[0], <fluid:nitrogen>*1000, pbpFuels[3]);
mods.nuclearcraft.AlloyFurnace.addRecipe(pbpFuels[0], zirconium, pbpFuels[4]);
furnace.addRecipe(fuelN2, pbpFuels[3]);
furnace.addRecipe(fuelN2, pbpFuels[2]);
mods.nuclearcraft.Separator.addRecipe(pbpFuels[1], pbpFuels[0], <nuclearcraft:dust:8>);
mods.nuclearcraft.Separator.addRecipe(pbpFuels[4], pbpFuels[0], <nuclearcraft:dust:10>);
//pebbles
mods.nuclearcraft.Assembler.addRecipe(pbpFuels[1]*9, <ore:dustGraphite>, <nuclearcraft:part:15>, <nuclearcraft:alloy:13>, pebble*9);
if (oreDict has "QuantumTraverseWhyCanISteamMyCrabs") {
	mods.nuclearcraft.SolidFission.addRecipe(pebble, dpbpFuels[0], stats[3][0], stats[3][1], eff, stats[3][2], 0, 0.075, false, burnrad);
}else{
	mods.nuclearcraft.PebbleFission.addRecipe(pebble, dpbpFuels[0], stats[0][0], stats[0][1], eff, stats[2][2], 10, 0.075, false, burnrad);
}
mods.nuclearcraft.Radiation.setRadiationLevel(pebble, 7.75E-01);
realOreDictList[0].add(pebble);
//oxide
mods.nuclearcraft.SolidFission.addRecipe(pbpFuels[2], dpbpFuels[1], stats[0][0], stats[0][1], eff, stats[0][2], 0, 0.075, false, burnrad);
//nitride
mods.nuclearcraft.SolidFission.addRecipe(pbpFuels[3], dpbpFuels[2], stats[1][0], stats[1][1], eff, stats[1][2], 0, 0.075, false, burnrad);
//zirconium
mods.nuclearcraft.SolidFission.addRecipe(pbpFuels[4], dpbpFuels[3], stats[2][0], stats[2][1], eff, stats[2][2], 0, 0.075, false, burnrad);
//melting time
superMelt(pbpFuels[0], fluidFuelNames, fluidProd, [moltenTimes, eff, burnrad] as double[], [stats[0][1],stats[0][2], fisProdChance[0], fisProdChance[1]] as int[], false);


fisProd1 = mods.nuclearcraft.ChanceItemIngredient.create(<ore:dustStrontium90>, 25);
fisProd2 = mods.nuclearcraft.ChanceItemIngredient.create(<ore:dustPromethium147>, 25);

//reprocessing
//triso
mods.nuclearcraft.FuelReprocessor.addRecipe(dpbpFuels[0] * 9, <nuclearcraft:neptunium:6>, <nuclearcraft:plutonium:1>, fisProd1, <ore:dustGraphite>.amount(3), <nuclearcraft:plutonium:6> * 2, <nuclearcraft:plutonium:16>*4, fisProd2, <nuclearcraft:alloy:13>);
//oxide
mods.nuclearcraft.FuelReprocessor.addRecipe(dpbpFuels[1] * 9, <nuclearcraft:neptunium:7>, <nuclearcraft:plutonium:2>, fisProd1, null, <nuclearcraft:plutonium:7> * 2, <nuclearcraft:plutonium:17>*4, fisProd2, null);
//nitride
mods.nuclearcraft.FuelReprocessor.addRecipe(dpbpFuels[2] * 9, <nuclearcraft:neptunium:8>, <nuclearcraft:plutonium:3>, fisProd1, null, <nuclearcraft:plutonium:8> * 2, <nuclearcraft:plutonium:18>*4, fisProd2, null);
//zirc
mods.nuclearcraft.FuelReprocessor.addRecipe(dpbpFuels[3] * 9, <nuclearcraft:neptunium:9>, <nuclearcraft:plutonium:4>, fisProd1, <nuclearcraft:dust:10>, <nuclearcraft:plutonium:9> * 2, <nuclearcraft:plutonium:19>*4, fisProd2, null);


for j,item in dpbpFuels{
	mods.nuclearcraft.Radiation.setRadiationLevel(item, ddecayRad);
	realOreDictList[1].add(dpbpFuels2[j]);
}
