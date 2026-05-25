/*
Copyright Bob Bartsch, 2026

This code is governed by the
Creative Commons Attribution–NonCommercial License
https://creativecommons.org/licenses/by-nc/3.0/

(Meaning: credit me if you modify and/or redistribute
this code. Also, you may not sell this code.)
*/

#modloaded qmd

import crafttweaker.item.IIngredient;
import crafttweaker.item.IItemStack;
import crafttweaker.oredict.IOreDict;
import crafttweaker.oredict.IOreDictEntry;
import crafttweaker.liquid.ILiquidStack;
import mods.nuclearcraft.AlloyFurnace;
import mods.nuclearcraft.Assembler;
import mods.nuclearcraft.DecayHastener;
import mods.nuclearcraft.Infuser;
import mods.nuclearcraft.Separator;
import mods.nuclearcraft.FuelReprocessor;
import mods.nuclearcraft.PebbleFission;
import mods.nuclearcraft.SolidFission;
import mods.nuclearcraft.FissionIrradiator;

/* -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- QMD Processing -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- */

mods.qmd.target_chamber.addRecipe(<contenttweaker:einsteinium55>, ((<particle:alpha>*240000)^6000)~1.0, <contenttweaker:mendelevium58>, null, <particle:neutron>, null, 8000, 0.1, -3000 );
mods.qmd.target_chamber.addRecipe(<contenttweaker:fermium57>, ((<particle:heffalumpMatter>*1920000)^15000)~1.0, <contenttweaker:flerovium98>, null, <particle:neutron>*2, null, 25000, 0.01, -13000);
mods.qmd.target_chamber.addRecipe(<contenttweaker:fermium57>, ((<particle:heffalumpMatter>*3840000)^30000)~1.0, <contenttweaker:darmstadtium294>, <particle:proton>*2, <particle:alpha>, null, 50000, 0.01, -33000);

val stuff = <contenttweaker:mysterymix>;
if(false){ //loadedMods has "thermalfoundation"
	recipes.addShaped("mana",stuff,[[<ore:clathrateEnder>, <ore:dustPyrotheum>, <ore:clathrateOil>],[<ore:dustPetrotheum>, <ore:dustLead>, <ore:dustCryotheum>],[<ore:clathrateGlowstone>,<ore:dustAerotheum>,<ore:clathrateRedstone>]]);
	mods.qmd.target_chamber.addRecipe(stuff, ((<particle:positron>*120000)^8000)~2.6, <ore:dustLead>, null, <particle:heffalumpMatter>, null, 20000, 1.0, 0);
}else{
	recipes.addShaped("mana",stuff,[[<nuclearcraft:gem>, <nuclearcraft:gem:1>, <nuclearcraft:gem:2>],[<nuclearcraft:gem:6>, <ore:dustLead>, <nuclearcraft:gem:6>],[<nuclearcraft:gem:3>,<nuclearcraft:gem:4>,<nuclearcraft:gem:5>]]);
	mods.qmd.target_chamber.addRecipe(stuff, ((<particle:calcium_48_ion>*120000)^40000)~2.6, <ore:dustLead>, <particle:heffalumpMatter>, null, null, 50000, 1.0, -25000);
}


/* -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- QMD Fuels -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- */
// this is a separate/extra multiplier beyond NC's base multiplier
// (meaning this only affects MoarFuels' fuels, while NC's config
// affects both NC's & MoarFuels' fuels)
// only accepts an integer value
val lifetimeMultiplier = 1;

//does all liquid stuff except isotope mixing & separation
function superMelt(item as IItemStack, array as ILiquidStack[], prod as ILiquidStack[], doub as double[], integs as int[], selfPriming as bool){
	//array is molten, fluoride, FLiBe, dFLiBe, dF, dMolten
	//prod is 4 actinides, 2 fission products
	//doub is time, efficiency, radiation, decay factor
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
	mods.nuclearcraft.SaltFission.addRecipe(array[2], array[3], doub[0], integs[0], doub[1], integs[1], 0, doub[3], selfPriming, doub[2]);

	//reprocessing
	mods.nuclearcraft.Centrifuge.addRecipe(array[3]*72, array[4]*72, <fluid:flibe>*72, null, null, null, null);
	mods.nuclearcraft.Electrolyzer.addRecipe(array[4]*72, array[5]*72, <fluid:fluorine>*500, null, null);

	val fisProd1 = mods.nuclearcraft.ChanceFluidIngredient.create(prod[4]*16, integs[2], 16);
	val fisProd2 = mods.nuclearcraft.ChanceFluidIngredient.create(prod[5]*16, integs[3], 16);
	mods.nuclearcraft.Centrifuge.addRecipe(array[5]*144, prod[0], prod[1], fisProd1, prod[2], prod[3], fisProd2);
}

/* -=-=-=-=- MIX Fuels -=-=-=-=-*/
val graphite = <ore:ingotGraphite>|<ore:dustGraphite>;
val zirconium = <ore:ingotZirconium>|<ore:dustZirconium>;
var fis = [[<contenttweaker:mendelevium58>,<contenttweaker:mendelevium58carbide>,<contenttweaker:mendelevium58oxide>,<contenttweaker:mendelevium58nitride>,<contenttweaker:mendelevium58zirconium>],[<contenttweaker:flerovium98>,<contenttweaker:flerovium98carbide>,<contenttweaker:flerovium98oxide>,<contenttweaker:flerovium98nitride>,<contenttweaker:flerovium98zirconium>],[<contenttweaker:darmstadtium294>,<contenttweaker:darmstadtium294carbide>,<contenttweaker:darmstadtium294oxide>,<contenttweaker:darmstadtium294nitride>,<contenttweaker:darmstadtium294zirconium>]] as IIngredient[][];
var fer = [[<ore:ingotAmericium243>,<ore:ingotAmericium243Carbide>,<ore:ingotAmericium243Oxide>,<ore:ingotAmericium243Nitride>,<ore:ingotAmericium243ZA>],[<ore:ingotNeptunium237>,<nuclearcraft:neptunium:6>,<ore:ingotNeptunium237Oxide>,<ore:ingotNeptunium237Nitride>,<nuclearcraft:neptunium:9>],[<contenttweaker:thorium229>,<contenttweaker:thorium229carbide>,<contenttweaker:thorium229oxide>,<contenttweaker:thorium229nitride>,<contenttweaker:thorium229zirconium>]] as IIngredient[][];
var decayRad = [0.788146499,5.26E-07,1.12E-04,3.70E-06,1.04E-05,3.85E-06] as double[];
var decayFactor =[0.11,0.11,0.11] as double[];

var FuelNames = [["mendelevium_fuel","mendelevium_fuel_carbide","mendelevium_fuel_oxide","mendelevium_fuel_nitride","mendelevium_fuel_zirconium"],["flerovium_fuel","flerovium_fuel_carbide","flerovium_fuel_triso","flerovium_fuel_oxide","flerovium_fuel_nitride","flerovium_fuel_zirconium"],["darmstadtium_fuel","darmstadtium_fuel_carbide","darmstadtium_fuel_triso","darmstadtium_fuel_oxide","darmstadtium_fuel_nitride","darmstadtium_fuel_zirconium"]] as string[][];
var allFuels = [[<contenttweaker:mendelevium_fuel>,<contenttweaker:mendelevium_fuel_carbide>,<contenttweaker:mendelevium_fuel_oxide>,<contenttweaker:mendelevium_fuel_nitride>,<contenttweaker:mendelevium_fuel_zirconium>],[<contenttweaker:flerovium_fuel>,<contenttweaker:flerovium_fuel_carbide>,<contenttweaker:flerovium_fuel_oxide>,<contenttweaker:flerovium_fuel_nitride>,<contenttweaker:flerovium_fuel_zirconium>],[<contenttweaker:darmstadtium_fuel>,<contenttweaker:darmstadtium_fuel_carbide>,<contenttweaker:darmstadtium_fuel_oxide>,<contenttweaker:darmstadtium_fuel_nitride>,<contenttweaker:darmstadtium_fuel_zirconium>]] as IItemStack[][];
var fuelN2 = [<contenttweaker:mendelevium_fuel>,<contenttweaker:flerovium_fuel>,<contenttweaker:darmstadtium_fuel>] as IItemStack[];

// time, heat, criticality
var fuelStats = [[[lifetimeMultiplier*1200,3389,21],[lifetimeMultiplier*768,5295,14],[lifetimeMultiplier*864,4707,15]],[[lifetimeMultiplier*7100,1696,60],[lifetimeMultiplier*4544,2650,41],[lifetimeMultiplier*4176,5109,29]],[[lifetimeMultiplier*5800,3678,40],[lifetimeMultiplier*3712,5748,27],[lifetimeMultiplier*5112,2356,43]]] as int[][][];
var fuelCrits = [[17],[48],[32]] as int[][];
val fuelPrime = [true,true,true] as bool[];

var trisoFuels = [<contenttweaker:mendelevium_fuel_triso>,<contenttweaker:flerovium_fuel_triso>,<contenttweaker:darmstadtium_fuel_triso>] as IItemStack[];
var dFuels = [[<contenttweaker:dmendelevium_fuel_triso>,<contenttweaker:dmendelevium_fuel_oxide>,<contenttweaker:dmendelevium_fuel_nitride>,<contenttweaker:dmendelevium_fuel_zirconium>],[<contenttweaker:dflerovium_fuel_triso>,<contenttweaker:dflerovium_fuel_oxide>,<contenttweaker:dflerovium_fuel_nitride>,<contenttweaker:dflerovium_fuel_zirconium>],[<contenttweaker:ddarmstadtium_fuel_triso>,<contenttweaker:ddarmstadtium_fuel_oxide>,<contenttweaker:ddarmstadtium_fuel_nitride>,<contenttweaker:ddarmstadtium_fuel_zirconium>]] as IIngredient[][];
var dFuels2 = [[<contenttweaker:dmendelevium_fuel_triso>,<contenttweaker:dmendelevium_fuel_oxide>,<contenttweaker:dmendelevium_fuel_nitride>,<contenttweaker:dmendelevium_fuel_zirconium>],[<contenttweaker:dflerovium_fuel_triso>,<contenttweaker:dflerovium_fuel_oxide>,<contenttweaker:dflerovium_fuel_nitride>,<contenttweaker:dflerovium_fuel_zirconium>],[<contenttweaker:ddarmstadtium_fuel_triso>,<contenttweaker:ddarmstadtium_fuel_oxide>,<contenttweaker:ddarmstadtium_fuel_nitride>,<contenttweaker:ddarmstadtium_fuel_zirconium>]] as IItemStack[][];
// time, heat, criticality
var trisoStats = [[lifetimeMultiplier*960,4236,14],[lifetimeMultiplier*5680,2120,51],[lifetimeMultiplier*4640,4598,27]] as int[][];
// efficiency, radiation
var trisoStatsAlt = [[2.15,1.24E-02],[4.0,2.71E-04],[6.0,2.59E-04]] as double[][];

// MRR Compat
if (oreDict has "QuantumTraverseIHaveHadEnoughOfYourSpaghettiCodeAndAbsurdNames") {
	trisoStatsAlt = [[2.15,6.67E-03],[4.0,2.21E-04],[6.0,0.0002114613636]] as double[][];
}

var fisProd1 = mods.nuclearcraft.ChanceItemIngredient.create(<ore:dustCaesium137>, 25);
var fisProd2 = mods.nuclearcraft.ChanceItemIngredient.create(<ore:dustEuropium155>, 25);

var fluidFuelNames= [[<fluid:mix_258>,<fluid:mix_258_fluoride>,<fluid:mix_258_fluoride_flibe>,<fluid:depleted_mix_258_fluoride_flibe>,<fluid:depleted_mix_258_fluoride>,<fluid:depleted_mix_258>],[<fluid:mix_298>,<fluid:mix_298_fluoride>,<fluid:mix_298_fluoride_flibe>,<fluid:depleted_mix_298_fluoride_flibe>,<fluid:depleted_mix_298_fluoride>,<fluid:depleted_mix_298>],[<fluid:mix_294>,<fluid:mix_294_fluoride>,<fluid:mix_294_fluoride_flibe>,<fluid:depleted_mix_294_fluoride_flibe>,<fluid:depleted_mix_294_fluoride>,<fluid:depleted_mix_294>]] as ILiquidStack[][];
var fluidProd= [[<fluid:curium_245>*32,<fluid:curium_246>*48,<fluid:californium_249>*32,<fluid:californium_251>*16,<fluid:caesium_137>,<fluid:europium_155>],[<fluid:plutonium_239>*32,<fluid:americium_242>*16,<fluid:americium_243>*48,<fluid:curium_246>*32,<fluid:promethium_147>,<fluid:europium_155>],[<fluid:tbu>*16,<fluid:uranium_235>*16,<fluid:uranium_238>*48,<fluid:plutonium_239>*48,<fluid:promethium_147>,<fluid:europium_155>]] as ILiquidStack[][];
var moltenTimes = [8.333333333, 49.30555556, 40.27777778] as double[];

//oreDic
var oreDictList = ["ingotMIX258All","ingotMIX298All","ingotMIX294All","ingotDepletedMIX258All","ingotDepletedMIX298All","ingotDepletedMIX294All"] as string[];
for entry in oreDictList {
	oreDict.entry;
}
var realOreDictList = [<ore:ingotMIX258All>,<ore:ingotMIX298All>,<ore:ingotMIX294All>,<ore:ingotDepletedMIX258All>,<ore:ingotDepletedMIX298All>,<ore:ingotDepletedMIX294All>] as IOreDictEntry[];


for i,array in allFuels{
	for j,item in array{
		//crafting
		recipes.addShapeless(FuelNames[i][j],item * 9,[fis[i][j], fer[i][j], fer[i][j], fer[i][j], fer[i][j], fer[i][j], fer[i][j], fer[i][j], fer[i][j]]);
		mods.nuclearcraft.Radiation.setRadiationLevel(item, decayRad[i]);
		realOreDictList[i].add(item);
	}
	//non-crafting recipes
	mods.nuclearcraft.AlloyFurnace.addRecipe(array[0], graphite, array[1]);
	mods.nuclearcraft.Infuser.addRecipe(array[0], <fluid:oxygen>*1000, array[2]);
	mods.nuclearcraft.Infuser.addRecipe(array[0], <fluid:nitrogen>*1000, array[3]);
	mods.nuclearcraft.AlloyFurnace.addRecipe(array[0], zirconium, array[4]);
	furnace.addRecipe(fuelN2[i], array[3]);
	furnace.addRecipe(fuelN2[i], array[2]);
	mods.nuclearcraft.Separator.addRecipe(array[1], array[0], <nuclearcraft:dust:8>);
	mods.nuclearcraft.Separator.addRecipe(array[4], array[0], <nuclearcraft:dust:10>);
	mods.nuclearcraft.Separator.addRecipe(array[0]*9, fis[i][0], fer[i][0]*8);
	//pebbles
	mods.nuclearcraft.Assembler.addRecipe(array[1]*9, <ore:dustGraphite>, <nuclearcraft:part:15>, <nuclearcraft:alloy:13>, trisoFuels[i]*9);
	if (oreDict has "QuantumTraverseWhyCanISteamMyCrabs") {
		mods.nuclearcraft.SolidFission.addRecipe(trisoFuels[i], dFuels[i][0], fuelStats[i][2][0], fuelStats[i][2][1], trisoStatsAlt[i][0], fuelStats[i][2][2], 0, decayFactor[i], fuelPrime[i], trisoStatsAlt[i][1]);
	}else{
	mods.nuclearcraft.PebbleFission.addRecipe(trisoFuels[i], dFuels[i][0], trisoStats[i][0], trisoStats[i][1], trisoStatsAlt[i][0], trisoStats[i][2], 10, decayFactor[i], fuelPrime[i], trisoStatsAlt[i][1]);
	}
	mods.nuclearcraft.Radiation.setRadiationLevel(trisoFuels[i], decayRad[i]);
	realOreDictList[i].add(trisoFuels[i]);
	//oxide
	mods.nuclearcraft.SolidFission.addRecipe(array[2], dFuels[i][1], trisoStats[i][0], trisoStats[i][1], trisoStatsAlt[i][0], fuelCrits[i][0], 0, decayFactor[i], fuelPrime[i], trisoStatsAlt[i][1]);
	//nitride
	mods.nuclearcraft.SolidFission.addRecipe(array[3], dFuels[i][2], fuelStats[i][0][0], fuelStats[i][0][1], trisoStatsAlt[i][0], fuelStats[i][0][2], 0, decayFactor[i], fuelPrime[i], trisoStatsAlt[i][1]);
	//zirconium
	mods.nuclearcraft.SolidFission.addRecipe(array[4], dFuels[i][3], fuelStats[i][1][0], fuelStats[i][1][1], trisoStatsAlt[i][0], fuelStats[i][1][2], 0, decayFactor[i], fuelPrime[i], trisoStatsAlt[i][1]);
	//melting time
	superMelt(array[0], fluidFuelNames[i], fluidProd[i], [moltenTimes[i], trisoStatsAlt[i][0], trisoStatsAlt[i][1], decayFactor[i]] as double[], [fuelStats[i][0][1],fuelCrits[i][0],25,25] as int[], true);
}

// reprocessing
var ddecayRad = [7.61E-03,1.73E-02,1.64E-02,1.90E-03,5.69E-03,9.22E-04] as double[];
var dIso = [[[<nuclearcraft:curium:6>*2,<nuclearcraft:curium:11>*3,<ore:ingotCalifornium249Carbide>*2,<ore:ingotCalifornium251Carbide>], [<nuclearcraft:curium:7>*2,<nuclearcraft:curium:12>*3,<ore:ingotCalifornium249Oxide>*2,<ore:ingotCalifornium251Oxide>], [<nuclearcraft:curium:8>*2,<nuclearcraft:curium:13>*3,<ore:ingotCalifornium249Nitride>*2,<ore:ingotCalifornium251Nitride>], [<nuclearcraft:curium:9>*2,<nuclearcraft:curium:14>*3,<ore:ingotCalifornium249ZA>*2,<ore:ingotCalifornium251ZA>]], [[<nuclearcraft:plutonium:6>*2,<ore:ingotAmericium242Carbide>,<ore:ingotAmericium243Carbide>*3,<nuclearcraft:curium:11>*2],[<nuclearcraft:plutonium:7>*2,<ore:ingotAmericium242Oxide>,<ore:ingotAmericium243Oxide>*3,<nuclearcraft:curium:12>*2],[<nuclearcraft:curium:8>*2,<ore:ingotAmericium242Nitride>,<nuclearcraft:americium:13>*3,<nuclearcraft:curium:13>*2],[<nuclearcraft:curium:9>*2,<ore:ingotAmericium242ZA>,<ore:ingotAmericium243ZA>*3,<nuclearcraft:curium:14>*2]],[[<ore:ingotTBUCarbide>,<ore:ingotUranium235Carbide>,<nuclearcraft:uranium:11>*3,<nuclearcraft:plutonium:11>*3],[<ore:ingotTBUOxide>,<ore:ingotUranium235Oxide>,<nuclearcraft:uranium:12>*3,<nuclearcraft:plutonium:12>*3],[<ore:ingotTBUNitride>,<ore:ingotUranium235Nitride>,<nuclearcraft:uranium:13>*3,<nuclearcraft:plutonium:13>*3],[<ore:ingotTBUZA>,<ore:ingotUranium235ZA>,<nuclearcraft:uranium:14>*3,<nuclearcraft:plutonium:14>*3]]] as IIngredient[][][];

for i,array in dFuels{
	if(i==1){
		fisProd1 = mods.nuclearcraft.ChanceItemIngredient.create(<ore:dustPromethium147>, 25);
	}
	//triso
	mods.nuclearcraft.FuelReprocessor.addRecipe(array[0].amount(9), dIso[i][0][0], dIso[i][0][1], fisProd1, <ore:dustGraphite>.amount(3), dIso[i][0][2], dIso[i][0][3], fisProd2, <nuclearcraft:alloy:13>);
	//oxide
	mods.nuclearcraft.FuelReprocessor.addRecipe(array[1].amount(9), dIso[i][1][0], dIso[i][1][1], fisProd1, null, dIso[i][1][2], dIso[i][1][3], fisProd2, null);
	//nitride
	mods.nuclearcraft.FuelReprocessor.addRecipe(array[2].amount(9), dIso[i][2][0], dIso[i][2][1], fisProd1, null, dIso[i][2][2], dIso[i][2][3], fisProd2, null);
	//zirc
	mods.nuclearcraft.FuelReprocessor.addRecipe(array[3].amount(9), dIso[i][3][0], dIso[i][3][1], fisProd1, <nuclearcraft:dust:10>, dIso[i][3][2], dIso[i][3][3], fisProd2, null);
	for j,item in array{
		mods.nuclearcraft.Radiation.setRadiationLevel(item, ddecayRad[i]);
		realOreDictList[i+3].add(dFuels2[i][j]);
	}
}

/* -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- PBU & LUF Time -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- */
oreDict.ingotPBU;
<ore:ingotPBU>.add(<contenttweaker:pbu>);
oreDict.ingotPBUAll;

oreDict.ingotUranium232;
<ore:ingotUranium232>.add(<contenttweaker:uranium_232>);

oreDict.ingotLUF;
<ore:ingotLUF>.add(<contenttweaker:luf>);
oreDict.ingotLUFAll;


//<ore:dustProtactinium231>.add(<contenttweaker:pa_pellet_slow>);
//<ore:dustProtactinium231>.add(<contenttweaker:pa_pellet_fast>);
//recipes.addShaped(<contenttweaker:pa_pellet_slow>*3,[[<ore:dustProtactinium231>],[<ore:dustProtactinium231>],[<ore:dustProtactinium231>]]);
//recipes.addShaped(<contenttweaker:pa_pellet_fast>*3,[[<ore:dustProtactinium231>,<ore:dustProtactinium231>,<ore:dustProtactinium231>]]);

// MRR Compat
if (oreDict has "QuantumTraverseIHaveHadEnoughOfYourSpaghettiCodeAndAbsurdNames") {
	mods.nuclearcraft.Radiation.setRadiationLevel(<ore:ingotUranium232>, 2.12E-02);
	mods.nuclearcraft.DecayHastener.addRecipe(<ore:ingotUranium232>, <ore:dustLead>, 1.0, 1.0, 2.12E-02);

	mods.nuclearcraft.FissionIrradiator.removeRecipeWithInput(<ore:dustProtactinium231>);
	mods.nuclearcraft.FissionIrradiator.addRecipe(<ore:dustProtactinium231>, <ore:ingotPBU>, 5833, 0.8, 0.0, 3.05E-05);
	//mods.nuclearcraft.FissionIrradiator.addRecipe(<contenttweaker:pa_pellet_fast>, <ore:dustProtactinium233>, 151000, 0.05, 0.0, 3.05E-05);
	//mods.nuclearcraft.FissionIrradiator.addRecipe(<contenttweaker:pa_pellet_slow>, <ore:ingotPBU>, 5833, 2.5, 0.0, 3.05E-05);
	mods.nuclearcraft.FissionIrradiator.addRecipe(<ore:ingotPBU>, <ore:ingotUranium232>, 99167, 8.0, 0.0, 1.33E-03);
}else{
	mods.nuclearcraft.Radiation.setRadiationLevel(<ore:ingotUranium232>, 1.45E-02);
	mods.nuclearcraft.DecayHastener.addRecipe(<ore:ingotUranium232>, <ore:dustLead>, 1.0, 1.0, 1.45E-02);

	mods.nuclearcraft.FissionIrradiator.removeRecipeWithInput(<ore:dustProtactinium231>);
	mods.nuclearcraft.FissionIrradiator.addRecipe(<ore:dustProtactinium231>, <ore:ingotPBU>, 142222, 0.8, 0.0, 1.56E-04);
	//mods.nuclearcraft.FissionIrradiator.addRecipe(<contenttweaker:pa_pellet_fast>, <ore:dustProtactinium233>, 3840000, 0.05, 0.0, 1.56E-04);
	//mods.nuclearcraft.FissionIrradiator.addRecipe(<contenttweaker:pa_pellet_slow>, <ore:ingotPBU>, 142222, 2.5, 0.0, 1.56E-04);
	mods.nuclearcraft.FissionIrradiator.addRecipe(<ore:ingotPBU>, <ore:ingotUranium232>, 2417778, 8.0, 0.0, 8.35E-04);
}

mods.nuclearcraft.Assembler.addRecipe(<ore:ingotUranium232>, null, null, null, <ore:ingotLUF>);
recipes.addShapeless(<contenttweaker:luf>*9,[<ore:ingotUranium232>, <ore:ingotUranium232>, <ore:ingotUranium232>, <ore:ingotUranium232>, <ore:ingotUranium233>, <ore:ingotUranium232>, <ore:ingotUranium232>, <ore:ingotUranium232>, <ore:ingotUranium232>]);

// does all the needed things (with toggle-able reprocessing)
function theMediumCheeseWithFries(pellet as IItemStack[], triso as IItemStack, dpellet as IIngredient[], dpellet2 as IItemStack[], fuelInts as int[][], integs as int[], fuelDoubles as double[], array as ILiquidStack[], prod as ILiquidStack[], solidProd as IIngredient[][], selfPriming as bool, oreNames as IOreDictEntry[], reprocQ as bool){
	//fis/fert/pellet is [normal,carbide,oxide,nitride,za]
	//dpellet is [tr, ox, ni, za]
	//fuelInts is [time, heat, criticality] for [ox, ni, za, trisoSFR]
	//integs is [enrichment, fisProd1 base chance, fisProd2 base chance, affected chance reprocessing ingredient]
	//fuelDoubles is [efficiency, base radiation, burn radiation, depleted radiation, MSR time, decay factor]
	//array is molten, fluoride, FLiBe, dFLiBe, dF, dMolten
	//prod is 4 actinides, 2 fission products as liquids
	//solidProd is 4 actinides, 2 fission products as items
	//reprocQ determines whether reprocessing is done

	for i,item in pellet{
		mods.nuclearcraft.Radiation.setRadiationLevel(item, fuelDoubles[1]);
		oreNames[0].add(item);
	}

	//non-crafting recipes
	mods.nuclearcraft.AlloyFurnace.addRecipe(pellet[0], <ore:ingotGraphite>|<ore:dustGraphite>, pellet[1]);
	mods.nuclearcraft.Infuser.addRecipe(pellet[0], <fluid:oxygen>*1000, pellet[2]);
	mods.nuclearcraft.Infuser.addRecipe(pellet[0], <fluid:nitrogen>*1000, pellet[3]);
	mods.nuclearcraft.AlloyFurnace.addRecipe(pellet[0], <ore:ingotZirconium>|<ore:dustZirconium>, pellet[4]);
	furnace.addRecipe(pellet[0], pellet[3]);
	furnace.addRecipe(pellet[0], pellet[2]);
	mods.nuclearcraft.Separator.addRecipe(pellet[1], pellet[0], <nuclearcraft:dust:8>);
	mods.nuclearcraft.Separator.addRecipe(pellet[4], pellet[0], <nuclearcraft:dust:10>);

	//pebbles
	mods.nuclearcraft.Assembler.addRecipe(pellet[1]*9, <ore:dustGraphite>, <nuclearcraft:part:15>, <nuclearcraft:alloy:13>, triso*9);
	mods.nuclearcraft.Radiation.setRadiationLevel(triso, fuelDoubles[1]);
	oreNames[0].add(triso);
	if (oreDict has "QuantumTraverseWhyCanISteamMyCrabs") {
		mods.nuclearcraft.SolidFission.addRecipe(triso, dpellet[0], fuelInts[3][0], fuelInts[3][1], fuelDoubles[0], fuelInts[3][2], 0, fuelDoubles[5], selfPriming, fuelDoubles[2]);
	}else{
		mods.nuclearcraft.PebbleFission.addRecipe(triso, dpellet[0], fuelInts[0][0], fuelInts[0][1], fuelDoubles[0], fuelInts[2][2], 10, fuelDoubles[5], selfPriming, fuelDoubles[2]);
	}

	//oxide
	mods.nuclearcraft.SolidFission.addRecipe(pellet[2], dpellet[1], fuelInts[0][0], fuelInts[0][1], fuelDoubles[0], fuelInts[0][2], 0, fuelDoubles[5], selfPriming, fuelDoubles[2]);
	//nitride
	mods.nuclearcraft.SolidFission.addRecipe(pellet[3], dpellet[2], fuelInts[1][0], fuelInts[1][1], fuelDoubles[0], fuelInts[1][2], 0, fuelDoubles[5], selfPriming, fuelDoubles[2]);
	//zirconium
	mods.nuclearcraft.SolidFission.addRecipe(pellet[4], dpellet[3], fuelInts[2][0], fuelInts[2][1], fuelDoubles[0], fuelInts[2][2], 0, fuelDoubles[5], selfPriming, fuelDoubles[2]);

	//melting time
	superMelt(pellet[0], array, prod, [fuelDoubles[4], fuelDoubles[0], fuelDoubles[2], fuelDoubles[5]] as double[], [fuelInts[1][1],fuelInts[0][2], integs[1], integs[2]] as int[], selfPriming);


	//decayed fuel stuff
	for i,item in dpellet{
		mods.nuclearcraft.Radiation.setRadiationLevel(item, fuelDoubles[3]);
		oreNames[1].add(dpellet2[i]);
	}
	if(reprocQ){
		var num = 9-integs[0] as int;
		var num2 = integs[0] as int;
		var fisProd1 as IIngredient;
		var fisProd2 as IIngredient;
		fisProd1 = mods.nuclearcraft.ChanceItemIngredient.create(solidProd[0][4] * num2, integs[1]);
		fisProd2 = mods.nuclearcraft.ChanceItemIngredient.create(solidProd[0][5] * num2, integs[2]);
		//reprocessing time
		num = 1+integs[0] as int;
		num2 = 5+integs[0] as int;
		var graphite as IIngredient;
		var zirconium as IIngredient;
		graphite = mods.nuclearcraft.ChanceItemIngredient.create(<ore:dustGraphite> * num2, 50);
		zirconium = mods.nuclearcraft.ChanceItemIngredient.create(<nuclearcraft:dust:10> * num, 50);
		if(integs[0]==1){
			graphite = <ore:dustGraphite> * (num2/2);
			zirconium = <nuclearcraft:dust:10> * (num/2);
		}

		//triso
		mods.nuclearcraft.FuelReprocessor.addRecipe(dpellet[0] * 9, solidProd[0][0], solidProd[0][1], fisProd1, graphite, solidProd[0][2], solidProd[0][3], fisProd2, <nuclearcraft:alloy:13>);
		//oxide
		mods.nuclearcraft.FuelReprocessor.addRecipe(dpellet[1] * 9, solidProd[1][0], solidProd[1][1], fisProd1, null, solidProd[1][2], solidProd[1][3], fisProd2, null);
		//nitride
		mods.nuclearcraft.FuelReprocessor.addRecipe(dpellet[2] * 9, solidProd[2][0], solidProd[2][1], fisProd1, null, solidProd[2][2], solidProd[2][3], fisProd2, null);
		//zirc
		mods.nuclearcraft.FuelReprocessor.addRecipe(dpellet[3] * 9, solidProd[3][0], solidProd[3][1], fisProd1, zirconium, solidProd[3][2], solidProd[3][3], fisProd2, null);
	}
}

var pbu_rads = [8.35E-04,4.27E-05,1.90E-03] as double[];  //base, burn, depleted
var luf_rads = [1.45E-02,4.92E-04,1.70E-02] as double[];

if (oreDict has "QuantumTraverseIHaveHadEnoughOfYourSpaghettiCodeAndAbsurdNames") {
	pbu_rads = [1.33E-03,4.66E-05,1.66E-03];
	luf_rads = [2.12E-02,5.87E-04,1.64E-02];
}

theMediumCheeseWithFries([<contenttweaker:pbu>,<contenttweaker:pbu_c>,<contenttweaker:pbu_ox>,<contenttweaker:pbu_ni>,<contenttweaker:pbu_za>], <contenttweaker:pbu_tr>, [<contenttweaker:d_pbu_tr>,<contenttweaker:d_pbu_ox>,<contenttweaker:d_pbu_ni>,<contenttweaker:d_pbu_za>], [<contenttweaker:d_pbu_tr>,<contenttweaker:d_pbu_ox>,<contenttweaker:d_pbu_ni>,<contenttweaker:d_pbu_za>], [[7024,82,118],[8727,66,148],[5592,103,100],[6330,91,106]], [1, 30, 20, 4], [1.10, pbu_rads[0], pbu_rads[1], pbu_rads[2], 60.60416667, 0.050], [<fluid:pbu>,<fluid:pbu_fluoride>,<fluid:pbu_fluoride_flibe>,<fluid:depleted_pbu_fluoride_flibe>,<fluid:depleted_pbu_fluoride>,<fluid:depleted_pbu>], [<fluid:uranium_233>*32,<fluid:uranium_235>,<fluid:neptunium_236>*32,<fluid:neptunium_237>*48,<fluid:strontium_90>,<fluid:caesium_137>], [[<nuclearcraft:uranium:1>*2,<nuclearcraft:uranium:6>,<nuclearcraft:neptunium:1>*2,<nuclearcraft:neptunium:6>*3,<ore:dustStrontium90>,<ore:dustCaesium137>],[<nuclearcraft:uranium:2>*2,<nuclearcraft:uranium:7>,<nuclearcraft:neptunium:2>*2,<nuclearcraft:neptunium:7>*3,<ore:dustStrontium90>,<ore:dustCaesium137>],[<nuclearcraft:uranium:3>*2,<nuclearcraft:uranium:8>,<nuclearcraft:neptunium:3>*2,<nuclearcraft:neptunium:8>*3,<ore:dustStrontium90>,<ore:dustCaesium137>],[<nuclearcraft:uranium:4>*2,<nuclearcraft:uranium:9>,<nuclearcraft:neptunium:4>*2,<nuclearcraft:neptunium:9>*3,<ore:dustStrontium90>,<ore:dustCaesium137>]], false, [<ore:ingotPBUAll>,<ore:ingotDepletedPBUAll>], true);

//fis/fert/pellet is [normal,carbide,oxide,nitride,za]
//dpellet is [tr, ox, ni, za]
//fuelInts is [time, heat, criticality] for [ox, ni, za, trisoSFR]
//integs is [enrichment, fisProd1 base chance, fisProd2 base chance, affected chance reprocessing ingredient]
//fuelDoubles is [efficiency, base radiation, burn radiation, depleted radiation, MSR time, decay factor]
//array is molten, fluoride, FLiBe, dFLiBe, dF, dMolten
//prod is 4 actinides, 2 fission products as liquids
//solidProd is 4 actinides, 2 fission products as items

theMediumCheeseWithFries([<contenttweaker:luf>,<contenttweaker:luf_c>,<contenttweaker:luf_ox>,<contenttweaker:luf_ni>,<contenttweaker:luf_za>], <contenttweaker:luf_tr>, [<contenttweaker:d_luf_tr>,<contenttweaker:d_luf_ox>,<contenttweaker:d_luf_ni>,<contenttweaker:d_luf_za>], [<contenttweaker:d_luf_tr>,<contenttweaker:d_luf_ox>,<contenttweaker:d_luf_ni>,<contenttweaker:d_luf_za>], [[6063,855,24],[7580,684,30],[4840,1069,20],[5434,950,22]], [9, 25, 25, 4], [1.30, luf_rads[0], luf_rads[1], luf_rads[2], 52.63888889, 0.055], [<fluid:luf>,<fluid:luf_fluoride>,<fluid:luf_fluoride_flibe>,<fluid:depleted_luf_fluoride_flibe>,<fluid:depleted_luf_fluoride>,<fluid:depleted_luf>], [<fluid:uranium_234>*16,<fluid:uranium_235>*16,<fluid:neptunium_236>*16,<fluid:neptunium_237>*16,<fluid:strontium_90>,<fluid:caesium_137>], [[null]], false, [<ore:ingotLUFAll>,<ore:ingotDepletedLUFAll>], false);


//external processing
fisProd1 = mods.nuclearcraft.ChanceItemIngredient.create(<ore:dustStrontium90> * 9, 25);
fisProd2 = mods.nuclearcraft.ChanceItemIngredient.create(<ore:dustCaesium137> * 9, 25);

//triso
mods.nuclearcraft.FuelReprocessor.addRecipe(<contenttweaker:d_luf_tr> * 9, <ore:ingotUranium234>, <nuclearcraft:uranium:6>, fisProd1, <ore:dustGraphite>*8, <nuclearcraft:neptunium:1>, <nuclearcraft:neptunium:6>, fisProd2, <nuclearcraft:alloy:13>);
//oxide
mods.nuclearcraft.FuelReprocessor.addRecipe(<contenttweaker:d_luf_ox> * 9, <ore:ingotUranium234>, <nuclearcraft:uranium:7>, fisProd1, null, <nuclearcraft:neptunium:2>, <nuclearcraft:neptunium:7>, fisProd2, null);
//nitride
mods.nuclearcraft.FuelReprocessor.addRecipe(<contenttweaker:d_luf_ni> * 9, <ore:ingotUranium234>, <nuclearcraft:uranium:8>, fisProd1, null, <nuclearcraft:neptunium:3>, <nuclearcraft:neptunium:8>, fisProd2, null);
//zirc
mods.nuclearcraft.FuelReprocessor.addRecipe(<contenttweaker:d_luf_za> * 9, <ore:ingotUranium234>, <nuclearcraft:uranium:9>, fisProd1, <ore:dustZirconium>*6, <nuclearcraft:neptunium:4>, <nuclearcraft:neptunium:9>, fisProd2, null);

var fisliquidProd1 = mods.nuclearcraft.ChanceFluidIngredient.create(<fluid:strontium_90>*144, 25, 16);
var fisliquidProd2 = mods.nuclearcraft.ChanceFluidIngredient.create(<fluid:caesium_137>*144, 25, 16);
mods.nuclearcraft.Centrifuge.removeRecipeWithInput(<fluid:depleted_luf>*144);
mods.nuclearcraft.Centrifuge.addRecipe(<fluid:depleted_luf>*144, <fluid:uranium_234>*16,<fluid:uranium_235>*16,fisliquidProd1,<fluid:neptunium_236>*16,<fluid:neptunium_237>*16,fisliquidProd2);

/* -=-=-=-=- UBU & Pa-231 Based Fuels -=-=-=-=-*/
val paFuels = [[<contenttweaker:protactinium_fuel>,<contenttweaker:protactinium_fuel_carbide>,<contenttweaker:protactinium_fuel_oxide>,<contenttweaker:protactinium_fuel_nitride>,<contenttweaker:protactinium_fuel_zirconium>],[<contenttweaker:hprotactinium_fuel>,<contenttweaker:hprotactinium_fuel_carbide>,<contenttweaker:hprotactinium_fuel_oxide>,<contenttweaker:hprotactinium_fuel_nitride>,<contenttweaker:hprotactinium_fuel_zirconium>],[<contenttweaker:ubu_fuel>,<contenttweaker:ubu_fuel_carbide>,<contenttweaker:ubu_fuel_oxide>,<contenttweaker:ubu_fuel_nitride>,<contenttweaker:ubu_fuel_zirconium>]] as IItemStack[][];
val dpaFuels = [[<contenttweaker:dprotactinium_fuel_triso>,<contenttweaker:dprotactinium_fuel_oxide>,<contenttweaker:dprotactinium_fuel_nitride>,<contenttweaker:dprotactinium_fuel_zirconium>],[<contenttweaker:dhprotactinium_fuel_triso>,<contenttweaker:dhprotactinium_fuel_oxide>,<contenttweaker:dhprotactinium_fuel_nitride>,<contenttweaker:dhprotactinium_fuel_zirconium>],[<contenttweaker:dubu_fuel_triso>,<contenttweaker:dubu_fuel_oxide>,<contenttweaker:dubu_fuel_nitride>,<contenttweaker:dubu_fuel_zirconium>]] as IIngredient[][];
val dpaFuels2 = [[<contenttweaker:dprotactinium_fuel_triso>,<contenttweaker:dprotactinium_fuel_oxide>,<contenttweaker:dprotactinium_fuel_nitride>,<contenttweaker:dprotactinium_fuel_zirconium>],[<contenttweaker:dhprotactinium_fuel_triso>,<contenttweaker:dhprotactinium_fuel_oxide>,<contenttweaker:dhprotactinium_fuel_nitride>,<contenttweaker:dhprotactinium_fuel_zirconium>],[<contenttweaker:dubu_fuel_triso>,<contenttweaker:dubu_fuel_oxide>,<contenttweaker:dubu_fuel_nitride>,<contenttweaker:dubu_fuel_zirconium>]] as IItemStack[][];


val paeff = [1.25,1.3,1.2] as double[];
val paStats = [[[lifetimeMultiplier*9600,60,160],[lifetimeMultiplier*12000,48,200],[lifetimeMultiplier*7680,75,136],[lifetimeMultiplier*8597,67,144]],[[lifetimeMultiplier*9600,180,80],[lifetimeMultiplier*12000,144,100],[lifetimeMultiplier*7680,225,68],[lifetimeMultiplier*8597,201,72]],[[lifetimeMultiplier*4500,128,96],[lifetimeMultiplier*5647,102,120],[lifetimeMultiplier*3600,160,82],[lifetimeMultiplier*4056,142,86]]] as int[][][];
var burnrad = [2.97E-05,8.90E-05,1.45E-05] as double[];
decayFactor = [0.065,0.045,0.045];

// MRR Compat
if (oreDict has "QuantumTraverseIHaveHadEnoughOfYourSpaghettiCodeAndAbsurdNames") {
	burnrad = [2.61E-05,7.82E-05,2.12E-05] as double[];
}


val pebbles = [<contenttweaker:protactinium_fuel_triso>,<contenttweaker:hprotactinium_fuel_triso>,<contenttweaker:ubu_fuel_triso>] as IItemStack[];
fuelN2 = [<contenttweaker:protactinium_fuel>,<contenttweaker:hprotactinium_fuel>,<contenttweaker:ubu_fuel>] as IItemStack[];

fluidFuelNames= [[<fluid:lam_231>,<fluid:lam_231_fluoride>,<fluid:lam_231_fluoride_flibe>,<fluid:depleted_lam_231_fluoride_flibe>,<fluid:depleted_lam_231_fluoride>,<fluid:depleted_lam_231>],[<fluid:eam_231>,<fluid:eam_231_fluoride>,<fluid:eam_231_fluoride_flibe>,<fluid:depleted_eam_231_fluoride_flibe>,<fluid:depleted_eam_231_fluoride>,<fluid:depleted_eam_231>],[<fluid:ubu>,<fluid:ubu_fluoride>,<fluid:ubu_fluoride_flibe>,<fluid:depleted_ubu_fluoride_flibe>,<fluid:depleted_ubu_fluoride>,<fluid:depleted_ubu>]] as ILiquidStack[][];
fluidProd= [[<fluid:tbu>*64,<fluid:uranium_233>*16,<fluid:uranium_234>*16,<fluid:uranium_235>*32,<fluid:strontium_90>,<fluid:caesium_137>],[<fluid:uranium_233>*32,<fluid:uranium_234>*32,<fluid:uranium_235>*32,<fluid:neptunium_237>*16,<fluid:strontium_90>,<fluid:caesium_137>],[<fluid:uranium_235>*32,<fluid:neptunium_236>*16,<fluid:neptunium_237>*32,<fluid:uranium_238>*48,<fluid:molybdenum>,<fluid:caesium_137>]] as ILiquidStack[][];
moltenTimes = [83.33333333,83.33333333,39.21527778] as double[];
val fisProdChance = [[30,20],[90,60],[25,25]] as int[][];

//base recipe
mods.nuclearcraft.Assembler.addRecipe(<ore:ingotPBU>, <ore:ingotTBU>*8, null, null, paFuels[0][0]*9);
mods.nuclearcraft.Assembler.addRecipe(<ore:ingotPBU>*2, paFuels[0][0]*6, null, null, paFuels[1][0]*8);

oreDict.ingotUBU;
<ore:ingotUBU>.add(<contenttweaker:ubu_fuel>);
mods.nuclearcraft.FissionIrradiator.removeRecipeWithInput(<ore:ingotUranium234>);
mods.nuclearcraft.FissionIrradiator.addRecipe(<ore:ingotUranium234>, <ore:ingotUBU>, 106667, 0.0, 0.0, 4.07E-06);
mods.nuclearcraft.FissionIrradiator.addRecipe(<ore:ingotUBU>, <ore:ingotUranium235>, 1813333, 0.0, 0.0, 1.42E-09);

oreDictList = ["ingotLAM231All","ingotEAM231All","ingotUBUAll","ingotDepletedLAM231All","ingotDepletedEAM231All","ingotDepletedUBUAll"] as string[];
for entry in oreDictList {
	oreDict.entry;
}
realOreDictList = [<ore:ingotLAM231All>,<ore:ingotEAM231All>,<ore:ingotUBUAll>,<ore:ingotDepletedLAM231All>,<ore:ingotDepletedEAM231All>,<ore:ingotDepletedUBUAll>] as IOreDictEntry[];

//non-base recipes
for i, array in paFuels{
	for item in array{
		mods.nuclearcraft.Radiation.setRadiationLevel(item, decayRad[i+3]);
		realOreDictList[i].add(item);
	}
	mods.nuclearcraft.AlloyFurnace.addRecipe(array[0], graphite, array[1]);
	mods.nuclearcraft.Infuser.addRecipe(array[0], <fluid:oxygen>*1000, array[2]);
	mods.nuclearcraft.Infuser.addRecipe(array[0], <fluid:nitrogen>*1000, array[3]);
	mods.nuclearcraft.AlloyFurnace.addRecipe(array[0], zirconium, array[4]);
	furnace.addRecipe(fuelN2[i], array[3]);
	furnace.addRecipe(fuelN2[i], array[2]);
	mods.nuclearcraft.Separator.addRecipe(array[1], array[0], <nuclearcraft:dust:8>);
	mods.nuclearcraft.Separator.addRecipe(array[4], array[0], <nuclearcraft:dust:10>);
	//pebbles
	mods.nuclearcraft.Assembler.addRecipe(array[1]*9, <ore:dustGraphite>, <nuclearcraft:part:15>, <nuclearcraft:alloy:13>, pebbles[i]*9);
	if (oreDict has "QuantumTraverseWhyCanISteamMyCrabs") {
		mods.nuclearcraft.SolidFission.addRecipe(pebbles[i], dpaFuels[i][0], paStats[i][3][0], paStats[i][3][1], paeff[i], paStats[i][3][2], 0, decayFactor[i], false, burnrad[i]);
	}else{
		mods.nuclearcraft.PebbleFission.addRecipe(pebbles[i], dpaFuels[i][0], paStats[i][0][0], paStats[i][0][1], paeff[i], paStats[i][2][2], 10, decayFactor[i], false, burnrad[i]);
	}
	mods.nuclearcraft.Radiation.setRadiationLevel(pebbles[i], decayRad[i+2]);
	realOreDictList[i].add(trisoFuels[i]);
	//oxide
	mods.nuclearcraft.SolidFission.addRecipe(array[2], dpaFuels[i][1], paStats[i][0][0], paStats[i][0][1], paeff[i], paStats[i][0][2], 0, decayFactor[i], false, burnrad[i]);
	//nitride
	mods.nuclearcraft.SolidFission.addRecipe(array[3], dpaFuels[i][2], paStats[i][1][0], paStats[i][1][1], paeff[i], paStats[i][1][2], 0, decayFactor[i], false, burnrad[i]);
	//zirconium
	mods.nuclearcraft.SolidFission.addRecipe(array[4], dpaFuels[i][3], paStats[i][2][0], paStats[i][2][1], paeff[i], paStats[i][2][2], 0, decayFactor[i], false, burnrad[i]);
	//melting time
	superMelt(array[0], fluidFuelNames[i], fluidProd[i], [moltenTimes[i], paeff[i], burnrad[i], decayFactor[i]] as double[], [paStats[i][0][1],paStats[i][0][2], fisProdChance[i][0], fisProdChance[i][1]] as int[], false);
}

fisProd1 = mods.nuclearcraft.ChanceItemIngredient.create(<ore:dustStrontium90>, 30);
fisProd2 = mods.nuclearcraft.ChanceItemIngredient.create(<ore:dustCaesium137>, 20);

//reprocessing
//triso
mods.nuclearcraft.FuelReprocessor.addRecipe(dpaFuels[0][0] * 9, <ore:ingotTBUCarbide> * 4, <ore:ingotUranium233Carbide>, fisProd1, <ore:dustGraphite>.amount(4), <ore:ingotUranium234>, <nuclearcraft:uranium:6>*2, fisProd2, <nuclearcraft:alloy:13>);
//oxide
mods.nuclearcraft.FuelReprocessor.addRecipe(dpaFuels[0][1] * 9, <ore:ingotTBUOxide> * 4, <ore:ingotUranium233Oxide>, fisProd1, null, <ore:ingotUranium234>, <nuclearcraft:uranium:7>*2, fisProd2, null);
//nitride
mods.nuclearcraft.FuelReprocessor.addRecipe(dpaFuels[0][2] * 9, <ore:ingotTBUNitride> * 4, <ore:ingotUranium233Nitride>, fisProd1, null, <ore:ingotUranium234>, <nuclearcraft:uranium:8>*2, fisProd2, null);
//zirc
mods.nuclearcraft.FuelReprocessor.addRecipe(dpaFuels[0][3] * 9, <ore:ingotTBUZA> * 4, <ore:ingotUranium233ZA>, fisProd1, <nuclearcraft:dust:10> * 2, <ore:ingotUranium234>, <nuclearcraft:uranium:9>*2, fisProd2, null);

fisProd1 = mods.nuclearcraft.ChanceItemIngredient.create(<ore:dustStrontium90>, 90);
fisProd2 = mods.nuclearcraft.ChanceItemIngredient.create(<ore:dustCaesium137>, 60);

//triso
mods.nuclearcraft.FuelReprocessor.addRecipe(dpaFuels[1][0] * 9, <ore:ingotUranium233Carbide>*2, <ore:ingotUranium234>*2, fisProd1, <ore:dustGraphite>.amount(6), <nuclearcraft:uranium:6>*2, <ore:ingotNeptunium237Carbide>, fisProd2, <nuclearcraft:alloy:13>);
//oxide
mods.nuclearcraft.FuelReprocessor.addRecipe(dpaFuels[1][1] * 9, <ore:ingotUranium233Oxide>*2, <ore:ingotUranium234>*2, fisProd1, null, <nuclearcraft:uranium:7>*2, <ore:ingotNeptunium237Oxide>, fisProd2, null);
//nitride
mods.nuclearcraft.FuelReprocessor.addRecipe(dpaFuels[1][2] * 9, <ore:ingotUranium233Nitride>*2, <ore:ingotUranium234>*2, fisProd1, null, <nuclearcraft:uranium:8>*2, <ore:ingotNeptunium237Nitride>, fisProd2, null);
//zirc
mods.nuclearcraft.FuelReprocessor.addRecipe(dpaFuels[1][3] * 9, <ore:ingotUranium233ZA>*2, <ore:ingotUranium234>*2, fisProd1, <nuclearcraft:dust:10> * 4, <nuclearcraft:uranium:9>*2, <ore:ingotNeptunium237ZA>, fisProd2, null);

fisProd1 = mods.nuclearcraft.ChanceItemIngredient.create(<ore:dustMolybdenum>, 25);
fisProd2 = mods.nuclearcraft.ChanceItemIngredient.create(<ore:dustCaesium137>, 25);

//reprocessing
//triso
mods.nuclearcraft.FuelReprocessor.addRecipe(dpaFuels[2][0] * 9, <nuclearcraft:uranium:6> * 2, <ore:ingotNeptunium236Carbide>, fisProd1, <ore:dustGraphite>.amount(3), <nuclearcraft:neptunium:6> * 2, <nuclearcraft:uranium:11>*3, fisProd2, <nuclearcraft:alloy:13>);
//oxide
mods.nuclearcraft.FuelReprocessor.addRecipe(dpaFuels[2][1] * 9, <nuclearcraft:uranium:7> * 2, <ore:ingotNeptunium236Oxide>, fisProd1, null, <nuclearcraft:neptunium:7> * 2, <nuclearcraft:uranium:12>*3, fisProd2, null);
//nitride
mods.nuclearcraft.FuelReprocessor.addRecipe(dpaFuels[2][2] * 9, <nuclearcraft:uranium:8> * 2, <ore:ingotNeptunium236Nitride>, fisProd1, null, <nuclearcraft:neptunium:8> * 2, <nuclearcraft:uranium:13>*3, fisProd2, null);
//zirc
mods.nuclearcraft.FuelReprocessor.addRecipe(dpaFuels[2][3] * 9, <nuclearcraft:uranium:9> * 2, <ore:ingotNeptunium236ZA>, fisProd1, <nuclearcraft:dust:10>, <nuclearcraft:neptunium:9> * 2, <nuclearcraft:uranium:14>*3, fisProd2, null);

for i,array in dpaFuels{
	for j,item in array{
		mods.nuclearcraft.Radiation.setRadiationLevel(item, ddecayRad[i+3]);
		realOreDictList[i+3].add(dpaFuels2[i][j]);
	}
}


/* -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- Isotope Stuff -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-*/
val qIsoNames= [[<contenttweaker:thorium229>,<contenttweaker:thorium229carbide>,<contenttweaker:thorium229oxide>,<contenttweaker:thorium229nitride>,<contenttweaker:thorium229zirconium>],[<contenttweaker:mendelevium58>,<contenttweaker:mendelevium58carbide>,<contenttweaker:mendelevium58oxide>,<contenttweaker:mendelevium58nitride>,<contenttweaker:mendelevium58zirconium>],[<contenttweaker:flerovium98>,<contenttweaker:flerovium98carbide>,<contenttweaker:flerovium98oxide>,<contenttweaker:flerovium98nitride>,<contenttweaker:flerovium98zirconium>],[<contenttweaker:darmstadtium294>,<contenttweaker:darmstadtium294carbide>,<contenttweaker:darmstadtium294oxide>,<contenttweaker:darmstadtium294nitride>,<contenttweaker:darmstadtium294zirconium>]] as IIngredient[][];
val qIsoNames2= [[<contenttweaker:thorium229>,<contenttweaker:thorium229carbide>,<contenttweaker:thorium229oxide>,<contenttweaker:thorium229nitride>,<contenttweaker:thorium229zirconium>],[<contenttweaker:mendelevium58>,<contenttweaker:mendelevium58carbide>,<contenttweaker:mendelevium58oxide>,<contenttweaker:mendelevium58nitride>,<contenttweaker:mendelevium58zirconium>],[<contenttweaker:flerovium98>,<contenttweaker:flerovium98carbide>,<contenttweaker:flerovium98oxide>,<contenttweaker:flerovium98nitride>,<contenttweaker:flerovium98zirconium>],[<contenttweaker:darmstadtium294>,<contenttweaker:darmstadtium294carbide>,<contenttweaker:darmstadtium294oxide>,<contenttweaker:darmstadtium294nitride>,<contenttweaker:darmstadtium294zirconium>]] as IItemStack[][];
val qisoN2 = [<contenttweaker:thorium229>,<contenttweaker:mendelevium58>,<contenttweaker:flerovium98>,<contenttweaker:darmstadtium294>] as IItemStack[];

val qdecays = [<contenttweaker:einsteinium54>,<contenttweaker:einsteinium54carbide>,<contenttweaker:einsteinium54oxide>,<contenttweaker:einsteinium54nitride>,<contenttweaker:einsteinium54zirconium>] as IIngredient[];
decayRad = [1.26E-04,7.09,1.0e-6,1.0e-9] as double[];


oreDictList = ["ingotThorium229All","ingotMendelevium258All","ingotFlerovium298All","ingotDarmstadtium294All"] as string[];
for entry in oreDictList {
	oreDict.entry;
}
realOreDictList = [<ore:ingotThorium229All>,<ore:ingotMendelevium258All>,<ore:ingotFlerovium298All>,<ore:ingotDarmstadtium294All>] as IOreDictEntry[];


for i,array in qIsoNames{
	// adding carbides
	mods.nuclearcraft.AlloyFurnace.addRecipe(array[0], graphite, array[1]);
	// adding oxides
	mods.nuclearcraft.Infuser.addRecipe(array[0], <fluid:oxygen>*1000, array[2]);
	// adding nitrides
	mods.nuclearcraft.Infuser.addRecipe(array[0], <fluid:nitrogen>*1000, array[3]);
	// adding zirconium alloys
	mods.nuclearcraft.AlloyFurnace.addRecipe(array[0], zirconium, array[4]);
	// recipes for normal
	furnace.addRecipe(qisoN2[i], array[3]);
	furnace.addRecipe(qisoN2[i], array[2]);
	mods.nuclearcraft.Separator.addRecipe(array[1], array[0], <nuclearcraft:dust:8>);
	mods.nuclearcraft.Separator.addRecipe(array[4], array[0], <nuclearcraft:dust:10>);
	//adding decays
	for j,item in array{
		mods.nuclearcraft.Radiation.setRadiationLevel(item, decayRad[i]);
		realOreDictList[i].add(qIsoNames2[i][j]);
		if (i==1){
			mods.nuclearcraft.DecayHastener.addRecipe(item, qdecays[j],1.0,1.0,decayRad[i]);
		}
	}
}
var uran = <ore:ingotUranium235> as IIngredient;
mods.nuclearcraft.DecayHastener.removeRecipeWithInput(uran);
uran = <ore:ingotUranium235>|<ore:ingotUranium235Oxide>|<ore:ingotUranium235Nitride>;
mods.nuclearcraft.DecayHastener.addRecipe(uran, <ore:dustProtactinium231>,1.0,1.0,1.42e-9);


// Stuff for Actinium-227 & Thorium-229
oreDict.dustActinium227;
<ore:dustActinium227>.add(<contenttweaker:actinium>);
mods.nuclearcraft.FissionIrradiator.addRecipe(<ore:dustRadium>, <contenttweaker:actinium>, 1563000, 0.0, 0.0, 0.0);
mods.nuclearcraft.DecayHastener.addRecipe(<contenttweaker:actinium>, <ore:dustLead>,1.0,1.0,4.59E-02);
mods.nuclearcraft.Radiation.setRadiationLevel(<contenttweaker:actinium>, 4.59E-02);

oreDict.ingotThorium229Pure;
<ore:ingotThorium229Pure>.add(<contenttweaker:purethorium229>);
mods.nuclearcraft.Manufactory.addRecipe(<ore:ingotThorium229All>, <ore:ingotThorium229Pure>);
mods.nuclearcraft.Radiation.setRadiationLevel(<contenttweaker:purethorium229>, 1.26E-04);
mods.nuclearcraft.FissionIrradiator.addRecipe(<contenttweaker:actinium>, <contenttweaker:purethorium229>, 201000, 0.0, 0.0, 0.0);
mods.nuclearcraft.DecayHastener.addRecipe(<contenttweaker:purethorium229>|<contenttweaker:thorium229>|<contenttweaker:thorium229oxide>|<contenttweaker:thorium229nitride>, <ore:dustBismuth>,1.0,1.0,decayRad[0]);
//enhancements
mods.nuclearcraft.AlloyFurnace.addRecipe(<contenttweaker:purethorium229>*64, <contenttweaker:californium54>, <contenttweaker:thorium229>*64);
mods.nuclearcraft.AlloyFurnace.addRecipe(<contenttweaker:purethorium229>*8, <ore:ingotCalifornium252>, <contenttweaker:thorium229>*8);


// U-234 melting time
mods.nuclearcraft.Melter.addRecipe(<ore:ingotUranium234>, <fluid:uranium_234>*144);
mods.nuclearcraft.IngotFormer.addRecipe(<fluid:uranium_234>*144, <ore:ingotUranium234>);


//Special Thorium Pellet Stuff
if (oreDict has "QuantumTraverseIHaveHadEnoughOfYourSpaghettiCodeAndAbsurdNames") {
	//<ore:ingotThorium229Pure>.add(<contenttweaker:th_pellet_slow>);
	//<ore:ingotThorium229Pure>.add(<contenttweaker:th_pellet_fast>);
	//recipes.addShaped(<contenttweaker:th_pellet_slow>*3,[[<ore:ingotThorium229Pure>],[<ore:ingotThorium229Pure>],[<ore:ingotThorium229Pure>]]);
	//recipes.addShaped(<contenttweaker:th_pellet_fast>*3,[[<ore:ingotThorium229Pure>,<ore:ingotThorium229Pure>,<ore:ingotThorium229Pure>]]);

	mods.nuclearcraft.FissionIrradiator.addRecipe(<ore:ingotThorium229Pure>, <ore:dustProtactinium231>, 1185000, 7.5, 0.0, 3.30E-04);
	//mods.nuclearcraft.FissionIrradiator.addRecipe(<contenttweaker:th_pellet_slow>, <ore:dustProtactinium231>, 1185000, 7.5, 0.0, 3.30E-04);
	//mods.nuclearcraft.FissionIrradiator.addRecipe(<contenttweaker:th_pellet_fast>, <ore:dustThorium>, 1198000, 0.1, 0.0, 3.30E-04);
}else{
	//mods.jei.JEI.hide(<contenttweaker:th_pellet_slow>);
	//mods.jei.JEI.hide(<contenttweaker:th_pellet_fast>);
}


/* -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- Improved RTGs -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- */
val radioIso = [<ore:ingotCobalt60>,<contenttweaker:actinium>] as IIngredient[];
val decayIso = [<ore:dustNickel>,<ore:dustLead>] as IIngredient[];
val red = <ore:dustRedstone>;
val sige = <contenttweaker:si_ge>;
var input = [<contenttweaker:rtg_co>,<contenttweaker:rtg_ac>] as IIngredient[];
var output = [<contenttweaker:rtg_co_done>,<contenttweaker:rtg_ac_done>] as IIngredient[];
//mean lifetime, power, radiation
var rtgstats = [[126600.0,36.0,1.90E-01],[522000.0,1370.0,4.59E-02]] as double[][];

// MRR Compat
if (oreDict has "QuantumTraverseIHaveHadEnoughOfYourSpaghettiCodeAndAbsurdNames") {
	rtgstats = [[126600.0,36.0,3.50E-01],[522000.0,1370.0,5.90E-02]] as double[][];
}

for i,item in input{
	mods.nuclearcraft.Assembler.addRecipe(radioIso[i].amount(9), <nuclearcraft:rad_shielding:2>*4, red*2, sige*2, item);
	mods.nuclearcraft.DecayGenerator.addRecipe(item, output[i], rtgstats[i][0], rtgstats[i][1], rtgstats[i][2]);
	mods.nuclearcraft.FuelReprocessor.addRecipe(output[i], decayIso[i].amount(9), <nuclearcraft:rad_shielding:2>*4, null, null, red*2, sige*2, null, null);
	mods.nuclearcraft.Radiation.setRadiationLevel(item, rtgstats[i][2]);
}

/* -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- Clock Fun -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- */
val nClock = <minecraft:clock>.withTag({display: {Name: "Nuclear Clock", Lore: ["Somehow hundreds of times even more accurate than an atomic clock!"]}});
recipes.addShaped(nClock,[[null, <ore:ingotGold>, null],[<ore:ingotGold>, <contenttweaker:purethorium229>, <ore:ingotGold>],[null,<ore:ingotGold>,null]]);
