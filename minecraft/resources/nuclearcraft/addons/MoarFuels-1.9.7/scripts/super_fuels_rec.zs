/*
Copyright Bob Bartsch, 2026

This code is governed by the
Creative Commons Attribution–NonCommercial License
https://creativecommons.org/licenses/by-nc/3.0/

(Meaning: credit me if you modify and/or redistribute
this code. Also, you may not sell this code.)
*/

// imports
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
/* import mods.nuclearcraft.FissionIrradiator; */
import mods.nuclearcraft.PebbleFission;
import mods.nuclearcraft.SolidFission;
import mods.nuclearcraft.RockCrusher;
import mods.nuclearcraft.Melter;
import mods.nuclearcraft.IngotFormer;
import mods.nuclearcraft.ChemicalReactor;
import mods.nuclearcraft.SaltMixer;
import mods.nuclearcraft.Electrolyzer;
import mods.nuclearcraft.Centrifuge;
import mods.nuclearcraft.SaltFission;


// this is a separate/extra multiplier beyond NC's base multiplier
// (meaning this only affects MoarFuels' fuels, while NC's config
// affects both NC's & MoarFuels' fuels)
// only accepts an integer value
val lifetimeMultiplier = 1;

// isotopes recipes
val IsoNames= [[<contenttweaker:californium53>,<contenttweaker:californium53carbide>,<contenttweaker:californium53oxide>,<contenttweaker:californium53nitride>,<contenttweaker:californium53zirconium>],[<contenttweaker:californium54>,<contenttweaker:californium54carbide>,<contenttweaker:californium54oxide>,<contenttweaker:californium54nitride>,<contenttweaker:californium54zirconium>],[<contenttweaker:einsteinium54>,<contenttweaker:einsteinium54carbide>,<contenttweaker:einsteinium54oxide>,<contenttweaker:einsteinium54nitride>,<contenttweaker:einsteinium54zirconium>],[<contenttweaker:einsteinium55>,<contenttweaker:einsteinium55carbide>,<contenttweaker:einsteinium55oxide>,<contenttweaker:einsteinium55nitride>,<contenttweaker:einsteinium55zirconium>],[<contenttweaker:fermium57>,<contenttweaker:fermium57carbide>,<contenttweaker:fermium57oxide>,<contenttweaker:fermium57nitride>,<contenttweaker:fermium57zirconium>]] as IIngredient[][];
val IsoNames2= [[<contenttweaker:californium53>,<contenttweaker:californium53carbide>,<contenttweaker:californium53oxide>,<contenttweaker:californium53nitride>,<contenttweaker:californium53zirconium>],[<contenttweaker:californium54>,<contenttweaker:californium54carbide>,<contenttweaker:californium54oxide>,<contenttweaker:californium54nitride>,<contenttweaker:californium54zirconium>],[<contenttweaker:einsteinium54>,<contenttweaker:einsteinium54carbide>,<contenttweaker:einsteinium54oxide>,<contenttweaker:einsteinium54nitride>,<contenttweaker:einsteinium54zirconium>],[<contenttweaker:einsteinium55>,<contenttweaker:einsteinium55carbide>,<contenttweaker:einsteinium55oxide>,<contenttweaker:einsteinium55nitride>,<contenttweaker:einsteinium55zirconium>],[<contenttweaker:fermium57>,<contenttweaker:fermium57carbide>,<contenttweaker:fermium57oxide>,<contenttweaker:fermium57nitride>,<contenttweaker:fermium57zirconium>]] as IItemStack[][];
var fluidNames= [<fluid:californium_253>,<fluid:californium_254>,<fluid:einsteinium_254>,<fluid:einsteinium_255>,<fluid:fermium_257>] as ILiquidStack[];

//val radName= [<ore:Californium253>,<ore:Californium254>,<ore:Einsteinium254>,<ore:Einsteinium255>,<ore:Fermium257>] as IOreDictEntry[];
val isoN2 = [<contenttweaker:californium53>,<contenttweaker:californium54>,<contenttweaker:einsteinium54>,<contenttweaker:einsteinium55>,<contenttweaker:fermium57>] as IItemStack[];

val decays = [[<ore:ingotCalifornium249>,<ore:ingotCalifornium249Carbide>,<ore:ingotCalifornium249Oxide>,<ore:ingotCalifornium249Nitride>,<ore:ingotCalifornium249ZA>],[<ore:dustPromethium147>,<ore:dustPromethium147>,<ore:dustPromethium147>,<ore:dustPromethium147>,<ore:dustPromethium147>],[<ore:ingotCurium246>,<ore:ingotCurium246Carbide>,<ore:ingotCurium246Oxide>,<ore:ingotCurium246Nitride>,<ore:ingotCurium246ZA>], [<ore:ingotCalifornium251>,<ore:ingotCalifornium251Carbide>,<ore:ingotCalifornium251Oxide>,<ore:ingotCalifornium251Nitride>,<ore:ingotCalifornium251ZA>],[<contenttweaker:californium53>,<contenttweaker:californium53carbide>,<contenttweaker:californium53oxide>,<contenttweaker:californium53nitride>,<contenttweaker:californium53zirconium>]] as IIngredient[][];
var decayRad = [20.5, 6.04, 1.32, 9.18, 3.63] as double[];
//cf-250 skipped over due to balancing concerns

//oreDic
var oreDictList = ["dustGermanium","ingotCalifornium253All","ingotCalifornium254All","ingotEinsteinium254All","ingotEinsteinium255All","ingotFermium257All"] as string[];

for entry in oreDictList {
	oreDict.entry;
}
<ore:dustGermanium>.add(<contenttweaker:gemgermanium>);
var realOreDictList = [<ore:ingotCalifornium253All>,<ore:ingotCalifornium254All>,<ore:ingotEinsteinium254All>,<ore:ingotEinsteinium255All>,<ore:ingotFermium257All>] as IOreDictEntry[];

val graphite = <ore:ingotGraphite>|<ore:dustGraphite>;
val zirconium = <ore:ingotZirconium>|<ore:dustZirconium>;
for i,array in IsoNames{
	// adding carbides
	mods.nuclearcraft.AlloyFurnace.addRecipe(array[0], graphite, array[1]);
	// adding oxides
	mods.nuclearcraft.Infuser.addRecipe(array[0], <fluid:oxygen>*1000, array[2]);
	// adding nitrides
	mods.nuclearcraft.Infuser.addRecipe(array[0], <fluid:nitrogen>*1000, array[3]);
	// adding zirconium alloys
	mods.nuclearcraft.AlloyFurnace.addRecipe(array[0], zirconium, array[4]);
	// recipes for normal
	furnace.addRecipe(isoN2[i], array[3]);
	furnace.addRecipe(isoN2[i], array[2]);
	mods.nuclearcraft.Separator.addRecipe(array[1], array[0], <nuclearcraft:dust:8>);
	mods.nuclearcraft.Separator.addRecipe(array[4], array[0], <nuclearcraft:dust:10>);
	//adding decays
	for j,item in array{
		mods.nuclearcraft.Radiation.setRadiationLevel(item, decayRad[i]);
		realOreDictList[i].add(IsoNames2[i][j]);
		if (i!=1 | (j!=1 & j!=4)){
			mods.nuclearcraft.DecayHastener.addRecipe(item, decays[i][j],1.0,1.0,decayRad[i]);
		}
	}
	// melting time
	mods.nuclearcraft.Melter.addRecipe(array[0], fluidNames[i]*144);
	mods.nuclearcraft.IngotFormer.addRecipe(fluidNames[i]*144, array[0]);
}



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


// fuels recipes
/* -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- LE Fuels -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- */
var fis = [[<contenttweaker:californium53>,<contenttweaker:californium53carbide>,<contenttweaker:californium53oxide>,<contenttweaker:californium53nitride>,<contenttweaker:californium53zirconium>],[<contenttweaker:einsteinium54>,<contenttweaker:einsteinium54carbide>,<contenttweaker:einsteinium54oxide>,<contenttweaker:einsteinium54nitride>,<contenttweaker:einsteinium54zirconium>]] as IIngredient[][];
var fer = [[<ore:ingotCalifornium252>,<nuclearcraft:californium:16>,<ore:ingotCalifornium252Oxide>,<ore:ingotCalifornium252Nitride>,<nuclearcraft:californium:19>],[<contenttweaker:einsteinium55>,<contenttweaker:einsteinium55carbide>,<contenttweaker:einsteinium55oxide>,<contenttweaker:einsteinium55nitride>,<contenttweaker:einsteinium55zirconium>]] as IIngredient[][];

var FuelNames = [["californium_fuel","californium_fuel_carbide","californium_fuel_oxide","californium_fuel_nitride","californium_fuel_zirconium"],["einsteinium_fuel","einsteinium_fuel_carbide","einsteinium_fuel_oxide","einsteinium_fuel_nitride","einsteinium_fuel_zirconium"]] as string[][];
var allFuels = [[<contenttweaker:californium_fuel>,<contenttweaker:californium_fuel_carbide>,<contenttweaker:californium_fuel_oxide>,<contenttweaker:californium_fuel_nitride>,<contenttweaker:californium_fuel_zirconium>],[<contenttweaker:einsteinium_fuel>,<contenttweaker:einsteinium_fuel_carbide>,<contenttweaker:einsteinium_fuel_oxide>,<contenttweaker:einsteinium_fuel_nitride>,<contenttweaker:einsteinium_fuel_zirconium>]] as IItemStack[][];
var fuelN2 = [<contenttweaker:californium_fuel>,<contenttweaker:einsteinium_fuel>] as IItemStack[];
decayRad =[2.61,8.3,1.92,7.09,6.56] as double[];
var decayFactor =[0.10,0.105] as double[];

var fluidFuelNames= [[<fluid:lecf_253>,<fluid:lecf_253_fluoride>,<fluid:lecf_253_fluoride_flibe>,<fluid:depleted_lecf_253_fluoride_flibe>,<fluid:depleted_lecf_253_fluoride>,<fluid:depleted_lecf_253>],[<fluid:lee_254>,<fluid:lee_254_fluoride>,<fluid:lee_254_fluoride_flibe>,<fluid:depleted_lee_254_fluoride_flibe>,<fluid:depleted_lee_254_fluoride>,<fluid:depleted_lee_254>]] as ILiquidStack[][];

var fluidProd= [[<fluid:californium_252>*32,<fluid:californium_252>*32,<fluid:einsteinium_254>*32,<fluid:einsteinium_255>*32,<fluid:caesium_137>,<fluid:promethium_147>],[<fluid:einsteinium_254>*16,<fluid:einsteinium_255>*48,<fluid:einsteinium_255>*48,<fluid:fermium_257>*16,<fluid:caesium_137>,<fluid:promethium_147>]] as ILiquidStack[][];

var fluidComp= [[<fluid:californium_252>*128,<fluid:californium_253>*16],[<fluid:einsteinium_255>*128,<fluid:einsteinium_254>*16]] as IIngredient[][];

// time, heat, criticality
var fuelStats = [[[lifetimeMultiplier*450,1280,25],[lifetimeMultiplier*288,2000,17],[lifetimeMultiplier*324,1778,18]],[[lifetimeMultiplier*550,1048,31],[lifetimeMultiplier*352,1638,21],[lifetimeMultiplier*396,1456,23]]] as int[][][];
var fuelCrits = [[20],[25]] as int[][];

var trisoFuels = [<contenttweaker:californium_fuel_triso>,<contenttweaker:einsteinium_fuel_triso>] as IItemStack[];
var dFuels = [[<contenttweaker:dcalifornium_fuel_triso>,<contenttweaker:dcalifornium_fuel_oxide>,<contenttweaker:dcalifornium_fuel_nitride>,<contenttweaker:dcalifornium_fuel_zirconium>],[<contenttweaker:deinsteinium_fuel_triso>,<contenttweaker:deinsteinium_fuel_oxide>,<contenttweaker:deinsteinium_fuel_nitride>,<contenttweaker:deinsteinium_fuel_zirconium>]] as IIngredient[][];
var dFuels2 = [[<contenttweaker:dcalifornium_fuel_triso>,<contenttweaker:dcalifornium_fuel_oxide>,<contenttweaker:dcalifornium_fuel_nitride>,<contenttweaker:dcalifornium_fuel_zirconium>],[<contenttweaker:deinsteinium_fuel_triso>,<contenttweaker:deinsteinium_fuel_oxide>,<contenttweaker:deinsteinium_fuel_nitride>,<contenttweaker:deinsteinium_fuel_zirconium>]] as IItemStack[][];
// time, heat, criticality
var trisoStats = [[lifetimeMultiplier*360,1600,17],[lifetimeMultiplier*440,1310,21]] as int[][];
// efficiency, radiation
var trisoStatsAlt = [[1.9,8.01E-02],[2.0,2.34E-01]] as double[][];
var moltenTimes = [3.125,3.819444444] as double[];

// MRR Compat
if (oreDict has "QuantumTraverseIHaveHadEnoughOfYourSpaghettiCodeAndAbsurdNames") {
	trisoStatsAlt = [[1.9,4.22E-02],[2.0,7.18E-02]] as double[][];
}

var fisProd1 = mods.nuclearcraft.ChanceItemIngredient.create(<ore:dustCaesium137>, 30);
var fisProd2 = mods.nuclearcraft.ChanceItemIngredient.create(<ore:dustPromethium147>, 20);


oreDictList = ["ingotLECf253All","ingotLEE254All","ingotDepletedLECf253All","ingotDepletedLEE254All"] as string[];
for entry in oreDictList {
	oreDict.entry;
}
realOreDictList = [<ore:ingotLECf253All>,<ore:ingotLEE254All>,<ore:ingotDepletedLECf253All>,<ore:ingotDepletedLEE254All>] as IOreDictEntry[];


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
		mods.nuclearcraft.SolidFission.addRecipe(trisoFuels[i], dFuels[i][0], fuelStats[i][2][0], fuelStats[i][2][1], trisoStatsAlt[i][0], fuelStats[i][2][2], 0, decayFactor[i], true, trisoStatsAlt[i][1]);
	}else{
		mods.nuclearcraft.PebbleFission.addRecipe(trisoFuels[i], dFuels[i][0], trisoStats[i][0], trisoStats[i][1], trisoStatsAlt[i][0], trisoStats[i][2], 10, decayFactor[i], true, trisoStatsAlt[i][1]);
	}
	mods.nuclearcraft.Radiation.setRadiationLevel(trisoFuels[i], decayRad[i]);
	realOreDictList[i].add(trisoFuels[i]);
	//oxide
	mods.nuclearcraft.SolidFission.addRecipe(array[2], dFuels[i][1], trisoStats[i][0], trisoStats[i][1], trisoStatsAlt[i][0], fuelCrits[i][0], 0, decayFactor[i], true, trisoStatsAlt[i][1]);
	//nitride
	mods.nuclearcraft.SolidFission.addRecipe(array[3], dFuels[i][2], fuelStats[i][0][0], fuelStats[i][0][1], trisoStatsAlt[i][0], fuelStats[i][0][2], 0, decayFactor[i], true, trisoStatsAlt[i][1]);
	//zirconium
	mods.nuclearcraft.SolidFission.addRecipe(array[4], dFuels[i][3], fuelStats[i][1][0], fuelStats[i][1][1], trisoStatsAlt[i][0], fuelStats[i][1][2], 0, decayFactor[i], true, trisoStatsAlt[i][1]);
	//melting time
	mods.nuclearcraft.SaltMixer.addRecipe(fluidComp[i][0], fluidComp[i][1], fluidFuelNames[i][0]*144);
	mods.nuclearcraft.Centrifuge.addRecipe(fluidFuelNames[i][0]*144, fluidComp[i][0], fluidComp[i][1], null, null, null, null);
	superMelt(array[0], fluidFuelNames[i], fluidProd[i], [moltenTimes[i], trisoStatsAlt[i][0], trisoStatsAlt[i][1], decayFactor[i]] as double[], [fuelStats[i][0][1],fuelCrits[i][0],30,20] as int[], true);
}

// reprocessing the depleted fuels
var dIso = [[[fer[0][1].amount(2),fer[0][1].amount(2),fer[1][1].amount(2),fis[1][1]], [fer[0][2].amount(2),fer[0][2].amount(2),fer[1][2].amount(2),fis[1][2]], [fer[0][3].amount(2),fer[0][3].amount(2),fer[1][3].amount(2),fis[1][3]], [fer[0][4].amount(2),fer[0][4].amount(2),fer[1][4].amount(2),fis[1][4]]], [[fis[1][1],fer[1][1].amount(3),fer[1][1].amount(3),<contenttweaker:fermium57carbide>],[fis[1][2],fer[1][2].amount(3),fer[1][2].amount(3),<contenttweaker:fermium57oxide>],[fis[1][3],fer[1][3].amount(3),fer[1][3].amount(3),<contenttweaker:fermium57nitride>],[fis[1][4],fer[1][4].amount(3),fer[1][4].amount(3),<contenttweaker:fermium57zirconium>]] ] as IIngredient[][][];

var ddecayRad = [2.51,6.68,1.14,3.99,5.32] as double[];
for i,array in dFuels{
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
		realOreDictList[i+2].add(dFuels2[i][j]);
	}
}


/* -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- MX Fuels -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- */
val mxFuelNames = ["fermium_fuel","fermium_fuel_carbide","fermium_fuel_oxide","fermium_fuel_nitride","fermium_fuel_zirconium"] as string[];
val mxFuels = [<contenttweaker:fermium_fuel>,<contenttweaker:fermium_fuel_carbide>,<contenttweaker:fermium_fuel_oxide>,<contenttweaker:fermium_fuel_nitride>,<contenttweaker:fermium_fuel_zirconium>] as IItemStack[];

fluidNames= [<fluid:mix_257>] as ILiquidStack[];

val fm257 = [<contenttweaker:fermium57>,<contenttweaker:fermium57carbide>,<contenttweaker:fermium57oxide>,<contenttweaker:fermium57nitride>,<contenttweaker:fermium57zirconium>] as IItemStack[];
val am243 = [<ore:ingotAmericium243>,<ore:ingotAmericium243Carbide>,<ore:ingotAmericium243Oxide>,<ore:ingotAmericium243Nitride>,<ore:ingotAmericium243ZA>] as IIngredient[];
val bk247 = [<ore:ingotBerkelium247>,<ore:ingotBerkelium247Carbide>,<ore:ingotBerkelium247Oxide>,<ore:ingotBerkelium247Nitride>,<ore:ingotBerkelium247ZA>] as IIngredient[];
val cf254 = [<contenttweaker:californium54>,<contenttweaker:californium54carbide>,<contenttweaker:californium54oxide>,<contenttweaker:californium54nitride>,<contenttweaker:californium54zirconium>] as IItemStack[];


oreDict.ingotMIX257All;
oreDict.ingotDepletedMIX257All;


for j,item in mxFuels{
	//crafting
	recipes.addShapeless(mxFuelNames[j],item * 9,[fm257[j], fm257[j], fm257[j], am243[j], am243[j], bk247[j], bk247[j], fer[0][j], cf254[j]]);
	mods.nuclearcraft.Radiation.setRadiationLevel(item, decayRad[2]);
	<ore:ingotMIX257All>.add(item);
}
//non-crafting recipes
mods.nuclearcraft.AlloyFurnace.addRecipe(mxFuels[0], graphite, mxFuels[1]);
mods.nuclearcraft.Infuser.addRecipe(mxFuels[0], <fluid:oxygen>*1000, mxFuels[2]);
mods.nuclearcraft.Infuser.addRecipe(mxFuels[0], <fluid:nitrogen>*1000, mxFuels[3]);
mods.nuclearcraft.AlloyFurnace.addRecipe(mxFuels[0], zirconium, mxFuels[4]);
furnace.addRecipe(<contenttweaker:fermium_fuel>, mxFuels[3]);
furnace.addRecipe(<contenttweaker:fermium_fuel>, mxFuels[2]);
mods.nuclearcraft.Separator.addRecipe(mxFuels[1], mxFuels[0], <nuclearcraft:dust:8>);
mods.nuclearcraft.Separator.addRecipe(mxFuels[4], mxFuels[0], <nuclearcraft:dust:10>);

val dmxFuels = [<contenttweaker:dfermium_fuel_triso>,<contenttweaker:dfermium_fuel_oxide>,<contenttweaker:dfermium_fuel_nitride>,<contenttweaker:dfermium_fuel_zirconium>] as IItemStack[];

val mxeff = 2.1;
var mxrad = 4.79E-02;

// MRR Compat
if (oreDict has "QuantumTraverseIHaveHadEnoughOfYourSpaghettiCodeAndAbsurdNames") {
	mxrad = 3.38E-02;
}

//pebbles
mods.nuclearcraft.Assembler.addRecipe(mxFuels[1]*9, <ore:dustGraphite>, <nuclearcraft:part:15>, <nuclearcraft:alloy:13>, <contenttweaker:fermium_fuel_triso>*9);
if (oreDict has "QuantumTraverseWhyCanISteamMyCrabs") {
	mods.nuclearcraft.SolidFission.addRecipe(<contenttweaker:fermium_fuel_triso>, dmxFuels[0], (lifetimeMultiplier*684), 2700, mxeff, 40, 0, 0.11, true, mxrad);
}else{
	mods.nuclearcraft.PebbleFission.addRecipe(<contenttweaker:fermium_fuel_triso>, dmxFuels[0], (lifetimeMultiplier*760), 2430, mxeff, 37, 10, 0.11, true, mxrad);
}
mods.nuclearcraft.Radiation.setRadiationLevel(<contenttweaker:fermium_fuel_triso>, decayRad[2]);
<ore:ingotMIX257All>.add(<contenttweaker:fermium_fuel_triso>);
//oxide
mods.nuclearcraft.SolidFission.addRecipe(mxFuels[2], dmxFuels[1], (lifetimeMultiplier*760), 2430, mxeff, 44, 0, 0.11, true, mxrad);
//nitride
mods.nuclearcraft.SolidFission.addRecipe(mxFuels[3], dmxFuels[2], (lifetimeMultiplier*950), 1944, mxeff, 55, 0, 0.11, true, mxrad);
//zirconium
mods.nuclearcraft.SolidFission.addRecipe(mxFuels[4], dmxFuels[3], (lifetimeMultiplier*608), 3088, mxeff, 37, 0, 0.11, true, mxrad);

fisProd1 = mods.nuclearcraft.ChanceItemIngredient.create(<ore:dustCaesium137>, 75);
fisProd2 = mods.nuclearcraft.ChanceItemIngredient.create(<ore:dustEuropium155>, 75);

//reprocessing
//triso
mods.nuclearcraft.FuelReprocessor.addRecipe(dmxFuels[0] * 9, <nuclearcraft:curium:6> * 2, <ore:ingotCalifornium250Carbide> * 2, fisProd1, <ore:dustGraphite>.amount(4), fer[0][1] * 2, fis[1][1], fisProd2, <nuclearcraft:alloy:13>);
//oxide
mods.nuclearcraft.FuelReprocessor.addRecipe(dmxFuels[1] * 9, <nuclearcraft:curium:7> * 2, <ore:ingotCalifornium250Oxide> * 2, fisProd1, null, fer[0][2] * 2, fis[1][2], fisProd2, null);
//nitride
mods.nuclearcraft.FuelReprocessor.addRecipe(dmxFuels[2] * 9, <nuclearcraft:curium:8>* 2, <ore:ingotCalifornium250Nitride> * 2, fisProd1, null, fer[0][3] * 2, fis[1][3], fisProd2, null);
//zirc
mods.nuclearcraft.FuelReprocessor.addRecipe(dmxFuels[3] * 9, <nuclearcraft:curium:9> * 2, <ore:ingotCalifornium250ZA> * 2, fisProd1, <nuclearcraft:dust:10> * 2, fer[0][4] * 2, fis[1][4], fisProd2, null);
for item in dmxFuels{
	mods.nuclearcraft.Radiation.setRadiationLevel(item, ddecayRad[2]);
	<ore:ingotDepletedMIX257All>.add(item);
}

//MSR Stuff
fluidFuelNames= [[<fluid:mix_257>,<fluid:mix_257_fluoride>,<fluid:mix_257_fluoride_flibe>,<fluid:depleted_mix_257_fluoride_flibe>,<fluid:depleted_mix_257_fluoride>,<fluid:depleted_mix_257>]] as ILiquidStack[][];
fluidProd= [[<fluid:californium_252>*32,<fluid:californium_254>*16,<fluid:einsteinium_254>*16,<fluid:einsteinium_255>*48,<fluid:caesium_137>,<fluid:europium_155>]] as ILiquidStack[][];

superMelt(mxFuels[0], fluidFuelNames[0], fluidProd[0], [6.597222222, mxeff, mxrad, 0.11] as double[], [1944, 44, 75, 75] as int[], true);


/* -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- HE Fuels -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- */
FuelNames = [["hcalifornium_fuel","hcalifornium_fuel_carbide","hcalifornium_fuel_oxide","hcalifornium_fuel_nitride","hcalifornium_fuel_zirconium"],["heinsteinium_fuel","heinsteinium_fuel_carbide","heinsteinium_fuel_oxide","heinsteinium_fuel_nitride","heinsteinium_fuel_zirconium"]];
allFuels = [[<contenttweaker:hcalifornium_fuel>,<contenttweaker:hcalifornium_fuel_carbide>,<contenttweaker:hcalifornium_fuel_oxide>,<contenttweaker:hcalifornium_fuel_nitride>,<contenttweaker:hcalifornium_fuel_zirconium>],[<contenttweaker:heinsteinium_fuel>,<contenttweaker:heinsteinium_fuel_carbide>,<contenttweaker:heinsteinium_fuel_oxide>,<contenttweaker:heinsteinium_fuel_nitride>,<contenttweaker:heinsteinium_fuel_zirconium>]];
fuelN2 = [<contenttweaker:hcalifornium_fuel>,<contenttweaker:heinsteinium_fuel>];

fluidFuelNames= [[<fluid:hecf_253>,<fluid:hecf_253_fluoride>,<fluid:hecf_253_fluoride_flibe>,<fluid:depleted_hecf_253_fluoride_flibe>,<fluid:depleted_hecf_253_fluoride>,<fluid:depleted_hecf_253>],[<fluid:hee_254>,<fluid:hee_254_fluoride>,<fluid:hee_254_fluoride_flibe>,<fluid:depleted_hee_254_fluoride_flibe>,<fluid:depleted_hee_254_fluoride>,<fluid:depleted_hee_254>]] as ILiquidStack[][];

fluidProd= [[<fluid:californium_252>*32,<fluid:californium_254>*16,<fluid:einsteinium_254>*16,<fluid:einsteinium_255>*48,<fluid:caesium_137>,<fluid:promethium_147>],[<fluid:einsteinium_255>*16,<fluid:einsteinium_255>*16,<fluid:einsteinium_255>*32,<fluid:fermium_257>*48,<fluid:caesium_137>,<fluid:promethium_147>]] as ILiquidStack[][];

fluidComp= [[<fluid:californium_252>,<fluid:californium_253>,<fluid:lecf_253>],[<fluid:einsteinium_255>,<fluid:einsteinium_254>,<fluid:lee_254>]] as IIngredient[][];
moltenTimes = [3.125,3.819444444] as double[];

fuelCrits = [[9,10,13,9],[11,13,16,12]];

trisoFuels = [<contenttweaker:hcalifornium_fuel_triso>,<contenttweaker:heinsteinium_fuel_triso>];
dFuels = [[<contenttweaker:dhcalifornium_fuel_triso>,<contenttweaker:dhcalifornium_fuel_oxide>,<contenttweaker:dhcalifornium_fuel_nitride>,<contenttweaker:dhcalifornium_fuel_zirconium>],[<contenttweaker:dheinsteinium_fuel_triso>,<contenttweaker:dheinsteinium_fuel_oxide>,<contenttweaker:dheinsteinium_fuel_nitride>,<contenttweaker:dheinsteinium_fuel_zirconium>]];
dFuels2 = [[<contenttweaker:dhcalifornium_fuel_triso>,<contenttweaker:dhcalifornium_fuel_oxide>,<contenttweaker:dhcalifornium_fuel_nitride>,<contenttweaker:dhcalifornium_fuel_zirconium>],[<contenttweaker:dheinsteinium_fuel_triso>,<contenttweaker:dheinsteinium_fuel_oxide>,<contenttweaker:dheinsteinium_fuel_nitride>,<contenttweaker:dheinsteinium_fuel_zirconium>]];

trisoStatsAlt = [[1.95,1.73E-01],[2.05,1.86E-01]] as double[][];

// MRR Compat
if (oreDict has "QuantumTraverseIHaveHadEnoughOfYourSpaghettiCodeAndAbsurdNames") {
	trisoStatsAlt = [[1.9,6.50E-02],[2.0,6.15E-02]] as double[][];
}

fisProd1 = mods.nuclearcraft.ChanceItemIngredient.create(<ore:dustCaesium137>, 90);
fisProd2 = mods.nuclearcraft.ChanceItemIngredient.create(<ore:dustPromethium147>, 60);


oreDictList = ["ingotHECf253All","ingotHEE254All","ingotDepletedHECf253All","ingotDepletedHEE254All"] as string[];
for entry in oreDictList {
	oreDict.entry;
}
realOreDictList = [<ore:ingotHECf253All>,<ore:ingotHEE254All>,<ore:ingotDepletedHECf253All>,<ore:ingotDepletedHEE254All>] as IOreDictEntry[];


for i,array in allFuels{
	for j,item in array{
		//crafting
		recipes.addShapeless(FuelNames[i][j],item  * 9,[fis[i][j], fis[i][j], fis[i][j], fer[i][j], fer[i][j], fer[i][j], fer[i][j], fer[i][j], fer[i][j]]);
		mods.nuclearcraft.Radiation.setRadiationLevel(item, decayRad[3+i]);
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
	mods.nuclearcraft.Separator.addRecipe(array[0]*9, fis[i][0]*3, fer[i][0]*6);
	//pebbles
	mods.nuclearcraft.Assembler.addRecipe(array[1]*9, <ore:dustGraphite>, <nuclearcraft:part:15>, <nuclearcraft:alloy:13>, trisoFuels[i]*9);
	if (oreDict has "QuantumTraverseWhyCanISteamMyCrabs") {
		mods.nuclearcraft.SolidFission.addRecipe(trisoFuels[i], dFuels[i][0], fuelStats[i][2][0], (3 * fuelStats[i][2][1]), fuelCrits[i][3], fuelStats[i][2][2], 0, decayFactor[i], true, trisoStatsAlt[i][1]);
	}else{
		mods.nuclearcraft.PebbleFission.addRecipe(trisoFuels[i], dFuels[i][0], trisoStats[i][0], (3 * trisoStats[i][1]), trisoStatsAlt[i][0], fuelCrits[i][0], 10, decayFactor[i], true, trisoStatsAlt[i][1]);
	}
	mods.nuclearcraft.Radiation.setRadiationLevel(trisoFuels[i], decayRad[3+i]);
	realOreDictList[i].add(trisoFuels[i]);
	//oxide
	mods.nuclearcraft.SolidFission.addRecipe(array[2], dFuels[i][1], trisoStats[i][0], (3 * trisoStats[i][1]), trisoStatsAlt[i][0], fuelCrits[i][1], 0, decayFactor[i], true, trisoStatsAlt[i][1]);
	//nitride
	mods.nuclearcraft.SolidFission.addRecipe(array[3], dFuels[i][2], fuelStats[i][0][0], (3 * fuelStats[i][0][1]), trisoStatsAlt[i][0], fuelCrits[i][2], 0, decayFactor[i], true, trisoStatsAlt[i][1]);
	//zirconium
	mods.nuclearcraft.SolidFission.addRecipe(array[4], dFuels[i][3], fuelStats[i][1][0], (3 * fuelStats[i][1][1]), trisoStatsAlt[i][0], fuelCrits[i][0], 0, decayFactor[i], true, trisoStatsAlt[i][1]);

	//melting time
	mods.nuclearcraft.SaltMixer.addRecipe(fluidComp[i][2]*48, fluidComp[i][1]*16, fluidFuelNames[i][0]*64);
	mods.nuclearcraft.Centrifuge.addRecipe(fluidFuelNames[i][0]*144, fluidComp[i][0]*96, fluidComp[i][1]*48, null, null, null, null);
	superMelt(array[0], fluidFuelNames[i], fluidProd[i], [moltenTimes[i], trisoStatsAlt[i][0], trisoStatsAlt[i][1], decayFactor[i]] as double[], [(3*fuelStats[i][0][1]), fuelCrits[i][0], 90, 60] as int[], true);
}

// reprocessing the depleted fuels
dIso = [[[fer[0][1].amount(2),<contenttweaker:californium54carbide>,fer[1][1],fis[1][1].amount(3)], [fer[0][2].amount(2),<contenttweaker:californium54oxide>,fer[1][2],fis[1][2].amount(3)], [fer[0][3].amount(2),<contenttweaker:californium54nitride>,fer[1][3],fis[1][3].amount(3)], [fer[0][4].amount(2),<contenttweaker:californium54zirconium>,fer[1][4],fis[1][4].amount(3)]], [[fer[1][1],fer[1][1],fer[1][1].amount(2),<contenttweaker:fermium57carbide> * 3],[fer[1][2],fer[1][2],fer[1][2].amount(2),<contenttweaker:fermium57oxide> * 3],[fer[1][3],fer[1][3],fer[1][3].amount(2),<contenttweaker:fermium57nitride> * 3],[fer[1][4],fer[1][4],fer[1][4].amount(2),<contenttweaker:fermium57zirconium> *3 ]]] as IIngredient[][][];

for i,array in dFuels{
	//triso
	mods.nuclearcraft.FuelReprocessor.addRecipe(array[0].amount(9), dIso[i][0][0], dIso[i][0][1], fisProd1, <ore:dustGraphite>.amount(4), dIso[i][0][2], dIso[i][0][3], fisProd2, <nuclearcraft:alloy:13>);
	//oxide
	mods.nuclearcraft.FuelReprocessor.addRecipe(array[1].amount(9), dIso[i][1][0], dIso[i][1][1], fisProd1, null, dIso[i][1][2], dIso[i][1][3], fisProd2, null);
	//nitride
	mods.nuclearcraft.FuelReprocessor.addRecipe(array[2].amount(9), dIso[i][2][0], dIso[i][2][1], fisProd1, null, dIso[i][2][2], dIso[i][2][3], fisProd2, null);
	//zirc
	mods.nuclearcraft.FuelReprocessor.addRecipe(array[3].amount(9), dIso[i][3][0], dIso[i][3][1], fisProd1, <nuclearcraft:dust:10> * 2, dIso[i][3][2], dIso[i][3][3], fisProd2, null);
	for j,item in array{
		mods.nuclearcraft.Radiation.setRadiationLevel(item, ddecayRad[3+i]);
		realOreDictList[i+2].add(dFuels2[i][j]);
	}
}

/* -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- CBCm Time -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- */
oreDict.ingotCurium244;
<ore:ingotCurium244>.add(<contenttweaker:curium_244>);

oreDict.ingotCBCm;
<ore:ingotCBCm>.add(<contenttweaker:cbc>);
oreDict.ingotCBCmAll;


// MRR Compat
if (oreDict has "QuantumTraverseIHaveHadEnoughOfYourSpaghettiCodeAndAbsurdNames") {
	mods.nuclearcraft.Radiation.setRadiationLevel(<ore:ingotCurium244>, 1.94E-05);
	mods.nuclearcraft.DecayHastener.addRecipe(<ore:ingotCurium244>, <ore:dustThorium>, 1.0, 1.0, 1.94E-05);

	mods.nuclearcraft.FissionIrradiator.addRecipe(<ore:ingotCurium244>, <ore:ingotCBCm>, 78388, 0.0, 0.0, 1.94E-05);
	mods.nuclearcraft.FissionIrradiator.addRecipe(<ore:ingotCBCm>, <ore:ingotCurium245>, 1332612, 0.0, 0.0, 2.81E-05);
}else{
	mods.nuclearcraft.Radiation.setRadiationLevel(<ore:ingotCurium244>, 5.52E-02);
	mods.nuclearcraft.DecayHastener.addRecipe(<ore:ingotCurium244>, <ore:dustThorium>, 1.0, 1.0, 5.52E-02);

	mods.nuclearcraft.FissionIrradiator.addRecipe(<ore:ingotCurium244>, <ore:ingotCBCm>, 78388, 0.0, 0.0, 5.52E-02);
	mods.nuclearcraft.FissionIrradiator.addRecipe(<ore:ingotCBCm>, <ore:ingotCurium245>, 1332612, 0.0, 0.0, 5.22E-02);
}

// does all the needed things
function theMediumCheese(pellet as IItemStack[], triso as IItemStack, dpellet as IIngredient[], dpellet2 as IItemStack[], fuelInts as int[][], integs as int[], fuelDoubles as double[], array as ILiquidStack[], prod as ILiquidStack[], solidProd as IIngredient[][], selfPriming as bool, oreNames as IOreDictEntry[]){
	//fis/fert/pellet is [normal,carbide,oxide,nitride,za]
	//dpellet is [tr, ox, ni, za]
	//fuelInts is [time, heat, criticality] for [ox, ni, za, trisoSFR]
	//integs is [enrichment, fisProd1 base chance, fisProd2 base chance, affected chance reprocessing ingredient]
	//fuelDoubles is [efficiency, base radiation, burn radiation, depleted radiation, MSR time, decay factor]
	//array is molten, fluoride, FLiBe, dFLiBe, dF, dMolten
	//prod is 4 actinides, 2 fission products as liquids
	//solidProd is 4 actinides, 2 fission products as items

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
	var num = 9-integs[0] as int;
	var num2 = integs[0] as int;

	val fisProd1 = mods.nuclearcraft.ChanceItemIngredient.create(solidProd[0][4] * num2, integs[1]);
	val fisProd2 = mods.nuclearcraft.ChanceItemIngredient.create(solidProd[0][5] * num2, integs[2]);
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

var cbc_rads = [5.22E-02,4.96E-03,2.65E-01] as double[];  //base, burn, depleted
if (oreDict has "QuantumTraverseIHaveHadEnoughOfYourSpaghettiCodeAndAbsurdNames") {
	cbc_rads = [2.81E-05,3.68E-03,2.35E-01];
}

theMediumCheese([<contenttweaker:cbc>,<contenttweaker:cbc_c>,<contenttweaker:cbc_ox>,<contenttweaker:cbc_ni>,<contenttweaker:cbc_za>], <contenttweaker:cbc_tr>, [<contenttweaker:d_cbc_tr>,<contenttweaker:d_cbc_ox>,<contenttweaker:d_cbc_ni>,<contenttweaker:d_cbc_za>], [<contenttweaker:d_cbc_tr>,<contenttweaker:d_cbc_ox>,<contenttweaker:d_cbc_ni>,<contenttweaker:d_cbc_za>], [[2560,225,77],[3200,180,96],[2050,281,65],[2304,250,69]], [1, 30, 20, 4], [1.50, cbc_rads[0], cbc_rads[1], cbc_rads[2], 22.22222222, 0.085], [<fluid:cbc>,<fluid:cbc_fluoride>,<fluid:cbc_fluoride_flibe>,<fluid:depleted_cbc_fluoride_flibe>,<fluid:depleted_cbc_fluoride>,<fluid:depleted_cbc>], [<fluid:curium_245>*32,<fluid:curium_246>*48,<fluid:curium_247>*16,<fluid:berkelium_248>*32,<fluid:molybdenum>,<fluid:europium_155>], [[<nuclearcraft:curium:6>*2,<nuclearcraft:curium:11>*3,<nuclearcraft:curium:16>,<nuclearcraft:berkelium:6>*2,<ore:dustMolybdenum>,<ore:dustEuropium155>],[<nuclearcraft:curium:7>*2,<nuclearcraft:curium:12>*3,<nuclearcraft:curium:17>,<nuclearcraft:berkelium:7>*2,<ore:dustMolybdenum>,<ore:dustEuropium155>],[<nuclearcraft:curium:8>*2,<nuclearcraft:curium:13>*3,<nuclearcraft:curium:18>,<nuclearcraft:berkelium:8>*2,<ore:dustMolybdenum>,<ore:dustEuropium155>],[<nuclearcraft:curium:9>*2,<nuclearcraft:curium:14>*3,<nuclearcraft:curium:19>,<nuclearcraft:berkelium:9>*2,<ore:dustMolybdenum>,<ore:dustEuropium155>]], false, [<ore:ingotCBCmAll>,<ore:ingotDepletedCBCAll>]);
	//fis/fert/pellet is [normal,carbide,oxide,nitride,za]
	//dpellet is [tr, ox, ni, za]
	//fuelInts is [time, heat, criticality] for [ox, ni, za, trisoSFR]
	//integs is [enrichment, fisProd1 base chance, fisProd2 base chance, affected chance reprocessing ingredient]
	//fuelDoubles is [efficiency, base radiation, burn radiation, depleted radiation, MSR time, decay factor]
	//array is molten, fluoride, FLiBe, dFLiBe, dF, dMolten
	//prod is 4 actinides, 2 fission products as liquids
	//solidProd is 4 actinides, 2 fission products as items

/* -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- REF Fuels -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- */
fis = [[<ore:ingotPlutonium239>,<nuclearcraft:plutonium:6>,<ore:ingotPlutonium239Oxide>,<ore:ingotPlutonium239Nitride>,<nuclearcraft:plutonium:9>],[<ore:ingotAmericium242>,<nuclearcraft:americium:6>,<ore:ingotAmericium242Oxide>,<ore:ingotAmericium242Nitride>,<nuclearcraft:americium:9>],[<ore:ingotCalifornium251>,<nuclearcraft:californium:11>,<ore:ingotCalifornium251Oxide>,<ore:ingotCalifornium251Nitride>,<nuclearcraft:californium:14>]] as IIngredient[][];
fer = [[<ore:ingotPlutonium242>,<nuclearcraft:plutonium:16>,<ore:ingotPlutonium242Oxide>,<ore:ingotPlutonium242Nitride>,<nuclearcraft:plutonium:19>],[<ore:ingotAmericium243>,<nuclearcraft:americium:11>,<ore:ingotAmericium243Oxide>,<ore:ingotAmericium243Nitride>,<nuclearcraft:americium:14>],[<ore:ingotCalifornium252>,<nuclearcraft:californium:16>,<ore:ingotCalifornium252Oxide>,<ore:ingotCalifornium252Nitride>,<nuclearcraft:californium:19>]] as IIngredient[][];
var rad = [[<ore:ingotPlutonium238>,<nuclearcraft:plutonium:1>,<ore:ingotPlutonium238Oxide>,<ore:ingotPlutonium238Nitride>,<nuclearcraft:plutonium:4>],[<ore:ingotAmericium241>,<nuclearcraft:americium:1>,<ore:ingotAmericium241Oxide>,<ore:ingotAmericium241Nitride>,<nuclearcraft:americium:4>],[<ore:ingotCalifornium250>,<nuclearcraft:californium:6>,<ore:ingotCalifornium250Oxide>,<ore:ingotCalifornium250Nitride>,<nuclearcraft:californium:9>]] as IIngredient[][];

fluidFuelNames= [[<fluid:rep_238>,<fluid:rep_238_fluoride>,<fluid:rep_238_fluoride_flibe>,<fluid:depleted_rep_238_fluoride_flibe>,<fluid:depleted_rep_238_fluoride>,<fluid:depleted_rep_238>],[<fluid:rea_241>,<fluid:rea_241_fluoride>,<fluid:rea_241_fluoride_flibe>,<fluid:depleted_rea_241_fluoride_flibe>,<fluid:depleted_rea_241_fluoride>,<fluid:depleted_rea_241>],[<fluid:rec_250>,<fluid:rec_250_fluoride>,<fluid:rec_250_fluoride_flibe>,<fluid:depleted_rec_250_fluoride_flibe>,<fluid:depleted_rec_250_fluoride>,<fluid:depleted_rec_250>]] as ILiquidStack[][];
fluidProd= [[<fluid:plutonium_239>*16,<fluid:plutonium_242>*48,<fluid:americium_242>*32,<fluid:americium_243>*32,<fluid:strontium_90>,<fluid:promethium_147>],[<fluid:americium_242>*16,<fluid:americium_243>*48,<fluid:curium_244>*16,<fluid:curium_246>*32,<fluid:molybdenum>,<fluid:promethium_147>],[<fluid:californium_251>*16,<fluid:californium_252>*32,<fluid:californium_252>*48,<fluid:californium_253>*16,<fluid:ruthenium_106>,<fluid:europium_155>]] as ILiquidStack[][];
moltenTimes = [34.72222222,13.88888889,19.47916667] as double[];
val fissionProdChance = [[75,75],[75,75],[90,60]] as int[][];

allFuels = [[<contenttweaker:rplutonium_fuel>,<contenttweaker:rplutonium_fuel_carbide>,<contenttweaker:rplutonium_fuel_oxide>,<contenttweaker:rplutonium_fuel_nitride>,<contenttweaker:rplutonium_fuel_zirconium>],[<contenttweaker:ramericium_fuel>,<contenttweaker:ramericium_fuel_carbide>,<contenttweaker:ramericium_fuel_oxide>,<contenttweaker:ramericium_fuel_nitride>,<contenttweaker:ramericium_fuel_zirconium>],[<contenttweaker:rcalifornium_fuel>,<contenttweaker:rcalifornium_fuel_carbide>,<contenttweaker:rcalifornium_fuel_oxide>,<contenttweaker:rcalifornium_fuel_nitride>,<contenttweaker:rcalifornium_fuel_zirconium>]];
fuelN2 = [<contenttweaker:rplutonium_fuel>,<contenttweaker:ramericium_fuel>,<contenttweaker:rcalifornium_fuel>];

trisoFuels = [<contenttweaker:rplutonium_fuel_triso>,<contenttweaker:ramericium_fuel_triso>,<contenttweaker:rcalifornium_fuel_triso>];
dFuels = [[<contenttweaker:drplutonium_fuel_triso>,<contenttweaker:drplutonium_fuel_oxide>,<contenttweaker:drplutonium_fuel_nitride>,<contenttweaker:drplutonium_fuel_zirconium>],[<contenttweaker:dramericium_fuel_triso>,<contenttweaker:dramericium_fuel_oxide>,<contenttweaker:dramericium_fuel_nitride>,<contenttweaker:dramericium_fuel_zirconium>],[<contenttweaker:drcalifornium_fuel_triso>,<contenttweaker:drcalifornium_fuel_oxide>,<contenttweaker:drcalifornium_fuel_nitride>,<contenttweaker:drcalifornium_fuel_zirconium>]];
dFuels2 = [[<contenttweaker:drplutonium_fuel_triso>,<contenttweaker:drplutonium_fuel_oxide>,<contenttweaker:drplutonium_fuel_nitride>,<contenttweaker:drplutonium_fuel_zirconium>],[<contenttweaker:dramericium_fuel_triso>,<contenttweaker:dramericium_fuel_oxide>,<contenttweaker:dramericium_fuel_nitride>,<contenttweaker:dramericium_fuel_zirconium>],[<contenttweaker:drcalifornium_fuel_triso>,<contenttweaker:drcalifornium_fuel_oxide>,<contenttweaker:drcalifornium_fuel_nitride>,<contenttweaker:drcalifornium_fuel_zirconium>]];

// time, heat, criticality
fuelStats = [[[lifetimeMultiplier*250*20,346,53],[lifetimeMultiplier*160*20,540,42],[lifetimeMultiplier*180,480,38]],[[lifetimeMultiplier*100*20,864,43],[lifetimeMultiplier*64*20,1350,34],[lifetimeMultiplier*72*20,1200,31]],[[lifetimeMultiplier*2805,616,63],[lifetimeMultiplier*1795,963,50],[lifetimeMultiplier*40371,856,45]]] as int[][][];
val primer=[false,false,true] as bool[];

// time, heat, criticality
trisoStats = [[lifetimeMultiplier*200*20,432,36],[lifetimeMultiplier*80*20,1080,29],[lifetimeMultiplier*2244,770,43]] as int[][];

// efficiency, radiation
trisoStatsAlt = [[1.35,5.87E-04],[1.45,5.43E-04],[1.90,4.47E-02]] as double[][];

decayFactor=[0.075,0.080,0.10];


// MRR Compat
if (oreDict has "QuantumTraverseIHaveHadEnoughOfYourSpaghettiCodeAndAbsurdNames") {
	trisoStatsAlt = [[1.35,3.02E-04],[1.45,2.98E-04],[1.90,2.70E-02]] as double[][];
}

decayRad =[1.28e-3,1.92e-3,0.261] as double[];
ddecayRad =[3.63E-02,3.28E-02,2.60] as double[];


oreDictList = ["ingotREP238All","ingotREA241All","ingotRECf250All","ingotDepletedREP238All","ingotDepletedREA241All","ingotDepletedRECf250All"] as string[];
for entry in oreDictList {
	oreDict.entry;
}
realOreDictList = [<ore:ingotREP238All>,<ore:ingotREA241All>,<ore:ingotRECf250All>,<ore:ingotDepletedREP238All>,<ore:ingotDepletedREA241All>,<ore:ingotDepletedRECf250All>] as IOreDictEntry[];


for i,array in allFuels{
	for j,item in array{
		//crafting
		recipes.addShapeless(item  * 9,[rad[i][j], fis[i][j], fis[i][j], fer[i][j], fer[i][j], fer[i][j], fer[i][j], fer[i][j], fer[i][j]]);
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
	mods.nuclearcraft.Separator.addRecipe(array[0]*9, fis[i][0]*3, fer[i][0]*6);
	//pebbles
	mods.nuclearcraft.Assembler.addRecipe(array[1]*9, <ore:dustGraphite>, <nuclearcraft:part:15>, <nuclearcraft:alloy:13>, trisoFuels[i]*9);
	if (oreDict has "QuantumTraverseWhyCanISteamMyCrabs") {
		mods.nuclearcraft.SolidFission.addRecipe(trisoFuels[i], dFuels[i][0], fuelStats[i][2][0], fuelStats[i][2][1], trisoStatsAlt[i][0], fuelStats[i][2][2], 0, decayFactor[i], primer[i], trisoStatsAlt[i][1]);
	}else{
		mods.nuclearcraft.PebbleFission.addRecipe(trisoFuels[i], dFuels[i][0], trisoStats[i][0], trisoStats[i][1], trisoStatsAlt[i][0], trisoStats[i][2], 10, decayFactor[i], primer[i], trisoStatsAlt[i][1]);
	}
	mods.nuclearcraft.Radiation.setRadiationLevel(trisoFuels[i], decayRad[i]);
	realOreDictList[i].add(trisoFuels[i]);
	//oxide
	mods.nuclearcraft.SolidFission.addRecipe(array[2], dFuels[i][1], trisoStats[i][0], trisoStats[i][1], trisoStatsAlt[i][0], fuelStats[i][1][2], 0, decayFactor[i], primer[i], trisoStatsAlt[i][1]);
	//nitride
	mods.nuclearcraft.SolidFission.addRecipe(array[3], dFuels[i][2], fuelStats[i][0][0], fuelStats[i][0][1], trisoStatsAlt[i][0], fuelStats[i][0][2], 0, decayFactor[i], primer[i], trisoStatsAlt[i][1]);
	//zirconium
	mods.nuclearcraft.SolidFission.addRecipe(array[4], dFuels[i][3], fuelStats[i][1][0], fuelStats[i][1][1], trisoStatsAlt[i][0], trisoStats[i][2], 0, decayFactor[i], primer[i], trisoStatsAlt[i][1]);
	//melting time
	superMelt(array[0], fluidFuelNames[i], fluidProd[i], [moltenTimes[i], trisoStatsAlt[i][0], trisoStatsAlt[i][1], decayFactor[i]] as double[], [fuelStats[i][0][1], fuelStats[i][1][2], fissionProdChance[i][0], fissionProdChance[i][1]] as int[], true);
}

// reprocessing the depleted fuels
dIso = [[[fis[0][1],fer[0][1].amount(2),fis[1][1].amount(2),fer[1][1].amount(2)],[fis[0][2],<nuclearcraft:plutonium:17>*2,fis[1][2].amount(2),fer[1][2].amount(2)],[fis[0][3],fer[0][3].amount(2),fis[1][3].amount(2),<nuclearcraft:americium:13>*2],[fis[0][4],fer[0][4].amount(2),fis[1][4].amount(2),fer[1][4].amount(2)]],[[fis[1][1],fer[1][1].amount(3),<ore:ingotCurium244>,<nuclearcraft:curium:11>*2],[fis[1][2],fer[1][2].amount(3),<ore:ingotCurium244>,<nuclearcraft:curium:12>*2],[fis[1][3],<nuclearcraft:americium:13>*3,<ore:ingotCurium244>,<nuclearcraft:curium:13>*2],[fis[1][4],<nuclearcraft:americium:14>*3,<ore:ingotCurium244>,<nuclearcraft:curium:14>*2]],[[fis[2][1],fer[2][1].amount(2),fer[2][1].amount(3),<contenttweaker:californium53carbide>],[fis[2][2],fer[2][2].amount(2),fer[2][2].amount(3),<contenttweaker:californium53oxide>],[fis[2][3],fer[2][3].amount(2),fer[2][3].amount(3),<contenttweaker:californium53nitride>],[fis[2][4],fer[2][4].amount(2),fer[2][4].amount(3),<contenttweaker:californium53zirconium>]]] as IIngredient[][][];

for i,array in dFuels{
	if(i==0){
		fisProd1 = mods.nuclearcraft.ChanceItemIngredient.create(<ore:dustStrontium90>, 75);
		fisProd2 = mods.nuclearcraft.ChanceItemIngredient.create(<ore:dustPromethium147>, 75);
	}
	if(i==1){
		fisProd1 = mods.nuclearcraft.ChanceItemIngredient.create(<ore:dustMolybdenum>, 75);
		fisProd2 = mods.nuclearcraft.ChanceItemIngredient.create(<ore:dustPromethium147>, 75);
	}
	if(i==2){
		fisProd1 = mods.nuclearcraft.ChanceItemIngredient.create(<ore:dustRuthenium106>, 75);
		fisProd2 = mods.nuclearcraft.ChanceItemIngredient.create(<ore:dustEuropium155>, 75);
	}
	if(i==1){

		//triso
		mods.nuclearcraft.FuelReprocessor.addRecipe(array[0].amount(9), dIso[i][0][0], dIso[i][0][1], fisProd1, <ore:dustGraphite>.amount(5), dIso[i][0][2], dIso[i][0][3], fisProd2, <nuclearcraft:alloy:13>);
		//oxide
		mods.nuclearcraft.FuelReprocessor.addRecipe(array[1].amount(9), dIso[i][1][0], dIso[i][1][1], fisProd1, null, dIso[i][1][2], dIso[i][1][3], fisProd2, null);
		//nitride
		mods.nuclearcraft.FuelReprocessor.addRecipe(array[2].amount(9), dIso[i][2][0], dIso[i][2][1], fisProd1, null, dIso[i][2][2], dIso[i][2][3], fisProd2, null);
		//zirc
		mods.nuclearcraft.FuelReprocessor.addRecipe(array[3].amount(9), dIso[i][3][0], dIso[i][3][1], fisProd1, <nuclearcraft:dust:10> * 3, dIso[i][3][2], dIso[i][3][3], fisProd2, null);


	}else{

		//triso
		mods.nuclearcraft.FuelReprocessor.addRecipe(array[0].amount(9), dIso[i][0][0], dIso[i][0][1], fisProd1, <ore:dustGraphite>.amount(4), dIso[i][0][2], dIso[i][0][3], fisProd2, <nuclearcraft:alloy:13>);
		//oxide
		mods.nuclearcraft.FuelReprocessor.addRecipe(array[1].amount(9), dIso[i][1][0], dIso[i][1][1], fisProd1, null, dIso[i][1][2], dIso[i][1][3], fisProd2, null);
		//nitride
		mods.nuclearcraft.FuelReprocessor.addRecipe(array[2].amount(9), dIso[i][2][0], dIso[i][2][1], fisProd1, null, dIso[i][2][2], dIso[i][2][3], fisProd2, null);
		//zirc
		mods.nuclearcraft.FuelReprocessor.addRecipe(array[3].amount(9), dIso[i][3][0], dIso[i][3][1], fisProd1, <nuclearcraft:dust:10> * 2, dIso[i][3][2], dIso[i][3][3], fisProd2, null);

	}
	for j,item in array{
		mods.nuclearcraft.Radiation.setRadiationLevel(item, ddecayRad[i]);
		realOreDictList[i+3].add(dFuels2[i][j]);
	}
}

/* -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- Improved RTGs -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- */
val radioIso = [<ore:dustStrontium90>,<ore:dustRuthenium106>,<ore:dustCaesium137>,<ore:dustPromethium147>,<ore:dustEuropium155>,<ore:dustPolonium>,<ore:dustRadium>,<ore:ingotPlutonium238>,<ore:ingotAmericium241>,<ore:ingotCalifornium250>] as IIngredient[];
val decayIso = [<ore:dustZirconium>,<ore:dustSilver>,<ore:dustTin>,<ore:dustLead>,<ore:dustTin>,<ore:dustLead>,<ore:dustLead>,<ore:dustRadium>,<ore:ingotNeptunium237>,<ore:ingotCurium246>] as IIngredient[];
if (oreDict has "dustPalladium") {
	decayIso[1] = <ore:dustPalladium>;
}
if (oreDict has "dustBarium") {
	decayIso[2] = <ore:dustBarium>;
}
if (oreDict has "ingotNeodymium") {
	decayIso[3] = <ore:ingotNeodymium>;
}else{
	if(oreDict has "dustBarium"){
		decayIso[3] = <ore:dustBarium>;
	}else{
		decayIso[3] = <ore:dustTin>;
	}
}
if (oreDict has "dustGadolinium") {
	decayIso[4] = <ore:dustGadolinium>;
}
if(loadedMods has "qmd"){
	decayIso[7] = <ore:ingotUranium234>;
}

val shielding = [<nuclearcraft:rad_shielding:2>,<nuclearcraft:rad_shielding:2>,<nuclearcraft:rad_shielding:2>,<nuclearcraft:rad_shielding:2>,<nuclearcraft:rad_shielding:2>,<nuclearcraft:rad_shielding>,<nuclearcraft:rad_shielding:2>,<nuclearcraft:rad_shielding>,<nuclearcraft:rad_shielding:1>,<nuclearcraft:rad_shielding:2>] as IIngredient[];
val red = <ore:dustRedstone>;
val sige = <contenttweaker:si_ge>;
mods.nuclearcraft.RockCrusher.addRecipe(<ore:oreLead>*5,<ore:dustLead>*10, <contenttweaker:gemgermanium>, null);
mods.nuclearcraft.AlloyFurnace.addRecipe(<contenttweaker:gemgermanium>, <ore:itemSilicon>, sige);

val input = [<contenttweaker:rtg_sr>,<contenttweaker:rtg_ru>,<contenttweaker:rtg_cs>,<contenttweaker:rtg_pm>,<contenttweaker:rtg_eu>,<contenttweaker:rtg_po>,<contenttweaker:rtg_ra>,<contenttweaker:rtg_pu>,<contenttweaker:rtg_am>,<contenttweaker:rtg_cf>] as IIngredient[];
val output = [<contenttweaker:rtg_sr_done>,<contenttweaker:rtg_ru_done>,<contenttweaker:rtg_cs_done>,<contenttweaker:rtg_pm_done>,<contenttweaker:rtg_eu_done>,<contenttweaker:rtg_po_done>,<contenttweaker:rtg_ra_done>,<contenttweaker:rtg_pu_done>,<contenttweaker:rtg_am_done>,<contenttweaker:rtg_cf_done>] as IIngredient[];
//mean lifetime, power, radiation
var rtgstats = [[690000.0,44.0,3.47e-2],[24600.0,1550,9.77e-1],[724000.0,7.0,3.32e-2],[63000.0,26.0,3.81e-1],[114200.0,7.1,2.10e-1],[9100.0,11200.0,3.26e-2],[38400000.0,20.0,6.25e-4],[2104800.0,50.0,1.14e-2],[10380000.0,10.0,2.31e-3],[314000.0,370.0,7.65e-2]] as double[][];

// MRR Compat
if (oreDict has "QuantumTraverseIHaveHadEnoughOfYourSpaghettiCodeAndAbsurdNames") {
	rtgstats = [[690000.0,44.0,1.56E-03],[24600.0,1550,4.39E-02],[724000.0,7.0,2.98E-02],[63000.0,26.0,1.72E-02],[114200.0,7.1,1.71E-01],[9100.0,11200.0,8.23E-05],[38400000.0,20.0,3.47E-05],[2104800.0,50.0,9.91E-03],[10380000.0,10.0,3.51E-03],[314000.0,370.0,1.20E-02]] as double[][];
}

for i,item in input{
	mods.nuclearcraft.Assembler.addRecipe(radioIso[i].amount(9), shielding[i].amount(4), red*2, sige*2, item);
	mods.nuclearcraft.DecayGenerator.addRecipe(item, output[i], rtgstats[i][0], rtgstats[i][1], rtgstats[i][2]);
	mods.nuclearcraft.FuelReprocessor.addRecipe(output[i], decayIso[i].amount(9), shielding[i].amount(4), null, null, red*2, sige*2, null, null);
	mods.nuclearcraft.Radiation.setRadiationLevel(item, rtgstats[i][2]);
}
/* -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- Clock Fun -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- */

val aClock = <minecraft:clock>.withTag({display: {Name: "Atomic Clock", Lore: ["Trillions of times more accurate than a normal clock!"]}});
recipes.addShaped(aClock,[[null, <ore:ingotGold>, null],[<ore:ingotGold>, <ore:dustCaesium137>, <ore:ingotGold>],[null,<ore:ingotGold>,null]]);

/* -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- Cm-250 Stuff -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- */

oreDict.ingotCurium250;
<ore:ingotCurium250>.add(<contenttweaker:curium_250>);
oreDict.ingotCBCf;
<ore:ingotCBCf>.add(<contenttweaker:cbcf>);
oreDict.ingotCBCfAll;

// MRR Compat
if (oreDict has "QuantumTraverseIHaveHadEnoughOfYourSpaghettiCodeAndAbsurdNames") {
	mods.nuclearcraft.Radiation.setRadiationLevel(<ore:ingotCurium250>, 6.80E-03);
	mods.nuclearcraft.DecayHastener.addRecipe(<ore:ingotCurium250>, <ore:dustPromethium147>, 1.0, 1.0, 6.80E-03);

	mods.nuclearcraft.FissionIrradiator.addRecipe(<ore:ingotCurium250>, <ore:ingotCBCf>, 14556, 0.0, 0.0, 6.80E-03);
	mods.nuclearcraft.FissionIrradiator.addRecipe(<ore:ingotCBCf>, <ore:ingotCalifornium251>, 247444, 0.0, 0.0, 6.52E-03);
}else{
	mods.nuclearcraft.Radiation.setRadiationLevel(<ore:ingotCurium250>, 1.20E-04);
	mods.nuclearcraft.DecayHastener.addRecipe(<ore:ingotCurium250>, <ore:dustPromethium147>, 1.0, 1.0, 1.20E-04);

	mods.nuclearcraft.FissionIrradiator.addRecipe(<ore:ingotCurium250>, <ore:ingotCBCf>, 14556, 0.0, 0.0, 1.20E-04);
	mods.nuclearcraft.FissionIrradiator.addRecipe(<ore:ingotCBCf>, <ore:ingotCalifornium251>, 247444, 0.0, 0.0, 1.76E-04);
}

if (oreDict has "blockHighlyRadioactiveEarth") {
	val gold = mods.nuclearcraft.ChanceItemIngredient.create(<ore:dustGold198>, 64);
	mods.nuclearcraft.FuelReprocessor.addRecipe(<ore:blockHighlyRadioactiveEarth>*64, <ore:dustEuropium155>*12, <ore:dustPromethium147>*16, gold, <ore:ingotPlutonium239>*12, <ore:ingotPlutonium242>*6, <ore:ingotAmericium243>*4, <ore:ingotCurium245>*2, <ore:ingotCurium250>);
	mods.nuclearcraft.FuelReprocessor.addRecipe(<ore:blockHighlyRadioactiveSand>*64, <ore:dustEuropium155>*12, <ore:dustPromethium147>*16, gold, <ore:ingotPlutonium239>*12, <ore:ingotPlutonium242>*6, <ore:ingotAmericium243>*4, <ore:ingotCurium245>*2, <ore:ingotCurium250>);
}else{
	val cure = <ore:ingotCurium250>;

	if (oreDict has "QuantumTraverseIHaveHadEnoughOfYourSpaghettiCodeAndAbsurdNames") {
		mods.nuclearcraft.FissionIrradiator.addRecipe(<ore:ingotCurium247All>, cure, 6249000, 0.0, 0.75, 1.90E-03);
	}else{
		mods.nuclearcraft.FissionIrradiator.addRecipe(<ore:ingotCurium247All>, cure, 6249000, 0.0, 0.75, 0.0003744);
	}
}

//CBCf time

cbc_rads = [1.76E-04,3.94E-02,2.52E+00] as double[];  //base, burn, depleted
if (oreDict has "QuantumTraverseIHaveHadEnoughOfYourSpaghettiCodeAndAbsurdNames") {
	cbc_rads = [6.52E-03,1.55E-02,9.83E-01];
}

theMediumCheese([<contenttweaker:cbcf>,<contenttweaker:cbcf_c>,<contenttweaker:cbcf_ox>,<contenttweaker:cbcf_ni>,<contenttweaker:cbcf_za>], <contenttweaker:cbcf_tr>, [<contenttweaker:d_cbcf_tr>,<contenttweaker:d_cbcf_ox>,<contenttweaker:d_cbcf_ni>,<contenttweaker:d_cbcf_za>], [<contenttweaker:d_cbcf_tr>,<contenttweaker:d_cbcf_ox>,<contenttweaker:d_cbcf_ni>,<contenttweaker:d_cbcf_za>], [[2304,250,75],[2880,200,94],[1840,313,64],[2072,278,68]], [1, 30, 20, 4], [1.75, cbc_rads[0], cbc_rads[1], cbc_rads[2], 20.0, 0.085], [<fluid:cbcf>,<fluid:cbcf_fluoride>,<fluid:cbcf_fluoride_flibe>,<fluid:depleted_cbcf_fluoride_flibe>,<fluid:depleted_cbcf_fluoride>,<fluid:depleted_cbcf>], [<fluid:californium_251>*32,<fluid:californium_252>*32,<fluid:californium_252>*48,<fluid:californium_253>,<fluid:ruthenium_106>,<fluid:promethium_147>], [[<nuclearcraft:californium:11>*2,<nuclearcraft:californium:16>*2,<nuclearcraft:californium:16>*3,<contenttweaker:californium53carbide>,<ore:dustRuthenium106>,<ore:dustPromethium147>],[<nuclearcraft:californium:12>*2,<nuclearcraft:californium:17>*2,<nuclearcraft:californium:17>*3,<contenttweaker:californium53oxide>,<ore:dustRuthenium106>,<ore:dustPromethium147>],[<nuclearcraft:californium:13>*2,<nuclearcraft:californium:18>*2,<nuclearcraft:californium:18>*3,<contenttweaker:californium53nitride>,<ore:dustRuthenium106>,<ore:dustPromethium147>],[<nuclearcraft:californium:14>*2,<nuclearcraft:californium:19>*2,<nuclearcraft:californium:19>*3,<contenttweaker:californium53zirconium>,<ore:dustRuthenium106>,<ore:dustPromethium147>]], false, [<ore:ingotCBCfAll>,<ore:ingotDepletedCBCfAll>]);
	//fis/fert/pellet is [normal,carbide,oxide,nitride,za]
	//dpellet is [tr, ox, ni, za]
	//fuelInts is [time, heat, criticality] for [ox, ni, za, trisoSFR]
	//integs is [enrichment, fisProd1 base chance, fisProd2 base chance, affected chance reprocessing ingredient]
	//fuelDoubles is [efficiency, base radiation, burn radiation, depleted radiation, MSR time, decay factor]
	//array is molten, fluoride, FLiBe, dFLiBe, dF, dMolten
	//prod is 4 actinides, 2 fission products as liquids
	//solidProd is 4 actinides, 2 fission products as items

/* -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- CANDU+ Stuff -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- */
oreDict.ingotUraniumOxide;
<ore:ingotUraniumOxide>.add(<contenttweaker:uranium_oxide>);
oreDict.ingotCANDUAll;
<ore:ingotCANDUAll>.add(<contenttweaker:pre_candu>);
<ore:ingotCANDUAll>.add(<contenttweaker:candu>);
oreDict.ingotDepletedCANDUAll;
<ore:ingotDepletedCANDUAll>.add(<contenttweaker:dcandu>);

oreDict.ingotThoriumOxide;
<ore:ingotThoriumOxide>.add(<contenttweaker:thorium_oxide>);
oreDict.ingotANEELAll;
<ore:ingotANEELAll>.add(<contenttweaker:pre_aneel>);
<ore:ingotANEELAll>.add(<contenttweaker:aneel>);
oreDict.ingotDepletedANEELAll;
<ore:ingotDepletedANEELAll>.add(<contenttweaker:daneel>);

// CANDU recipe time
if (oreDict has "dustUraniumOxide") {
	furnace.addRecipe(<contenttweaker:uranium_oxide>, <ore:dustUraniumOxide>);
}
mods.nuclearcraft.Infuser.addRecipe(<ore:ingotUranium>, <fluid:oxygen>*1000, <ore:ingotUraniumOxide>);
furnace.addRecipe(<nuclearcraft:ingot:4>, <ore:ingotUraniumOxide>);
mods.nuclearcraft.Assembler.addRecipe(<ore:ingotUraniumOxide>*9, <ore:ingotZircaloy>, null, null, <contenttweaker:pre_candu>*9);
mods.nuclearcraft.Infuser.addRecipe(<contenttweaker:pre_candu>, <fluid:carbon_dioxide>*5, <contenttweaker:candu>);
mods.nuclearcraft.Radiation.setRadiationLevel(<ore:ingotCANDUAll>, 3.44E-10);
mods.nuclearcraft.Radiation.setRadiationLevel(<ore:ingotDepletedCANDUAll>, 1.72E-03);

// ANEEL recipe time
mods.nuclearcraft.Infuser.addRecipe(<ore:ingotThorium>, <fluid:oxygen>*1000, <ore:ingotThoriumOxide>);
furnace.addRecipe(<nuclearcraft:ingot:3>, <ore:ingotThoriumOxide>);
mods.nuclearcraft.Assembler.addRecipe(<ore:ingotHEU235Oxide>*3, <ore:ingotThoriumOxide>*6, <ore:ingotZircaloy>, null, <contenttweaker:pre_aneel>*9);
mods.nuclearcraft.Infuser.addRecipe(<contenttweaker:pre_aneel>, <fluid:carbon_dioxide>*5, <contenttweaker:aneel>);

// Fission & Rads
if (oreDict has "QuantumTraverseIHaveHadEnoughOfYourSpaghettiCodeAndAbsurdNames") {
mods.nuclearcraft.SolidFission.addRecipe(<contenttweaker:candu>, <ore:ingotDepletedCANDUAll>, 7200, 80, 1.25, 345, 0, 0.065, false, 3.30E-05);
mods.nuclearcraft.SolidFission.addRecipe(<contenttweaker:aneel>, <ore:ingotDepletedANEELAll>, 9000, 64, 1.25, 418, 0, 0.045, false, 8.17E-05);

mods.nuclearcraft.Radiation.setRadiationLevel(<ore:ingotANEELAll>, 1.47E-09);
mods.nuclearcraft.Radiation.setRadiationLevel(<ore:ingotThoriumOxide>, 2.70E-10);
mods.nuclearcraft.Radiation.setRadiationLevel(<ore:ingotDepletedANEELAll>, 5.23E-03);

}else{
mods.nuclearcraft.SolidFission.addRecipe(<contenttweaker:candu>, <ore:ingotDepletedCANDUAll>, 7200, 80, 1.25, 345, 0, 0.065, false, 2.68E-05);
mods.nuclearcraft.SolidFission.addRecipe(<contenttweaker:aneel>, <ore:ingotDepletedANEELAll>, 9000, 64, 1.25, 418, 0, 0.045, false, 1.36E-04);

mods.nuclearcraft.Radiation.setRadiationLevel(<ore:ingotANEELAll>, 2.55E-10);
mods.nuclearcraft.Radiation.setRadiationLevel(<ore:ingotThoriumOxide>, 7.12E-11);
mods.nuclearcraft.Radiation.setRadiationLevel(<ore:ingotDepletedANEELAll>, 8.68E-03);
}

// reprocessing
fisProd1 = mods.nuclearcraft.ChanceItemIngredient.create(<ore:dustMolybdenum>, 25);
fisProd2 = mods.nuclearcraft.ChanceItemIngredient.create(<ore:dustCaesium137>, 25);

mods.nuclearcraft.FuelReprocessor.addRecipe(<ore:ingotDepletedCANDUAll>*9, <nuclearcraft:uranium:12>*4, <ore:ingotPlutonium239Oxide>*2, fisProd1, <ore:ingotZircaloy>, <ore:ingotPlutonium242Oxide>, <ore:ingotAmericium242Oxide>, fisProd2, null);

if(loadedMods has "qmd"){
	mods.nuclearcraft.FuelReprocessor.addRecipe(<ore:ingotDepletedANEELAll>*9, <ore:ingotUranium234>, <nuclearcraft:uranium:7>, fisProd1, <ore:ingotZircaloy>, <nuclearcraft:uranium:12>*4, <nuclearcraft:neptunium:7>, fisProd2, <nuclearcraft:plutonium:12>);
} else {
	mods.nuclearcraft.FuelReprocessor.addRecipe(<ore:ingotDepletedANEELAll>*9, null, <nuclearcraft:uranium:7>, fisProd1, <ore:ingotZircaloy>, <nuclearcraft:uranium:12>*4, <nuclearcraft:neptunium:7>, fisProd2, <nuclearcraft:plutonium:12>);
}
