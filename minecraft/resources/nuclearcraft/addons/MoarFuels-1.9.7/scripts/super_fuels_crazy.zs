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
import mods.nuclearcraft.Manufactory;


//does all liquid stuff except isotope mixing & separation
function superMelt(item as IItemStack, array as ILiquidStack[], prod as ILiquidStack[], doub as double[], integs as int[], selfPriming as bool, enrich as int){
	//array is molten, fluoride, FLiBe, dFLiBe, dF, dMolten
	//prod is 4 actinides, 2 fission products
	//doub is time, efficiency, radiation, decay product
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

	val stackerino = 16*enrich;
	val fisProd1 = mods.nuclearcraft.ChanceFluidIngredient.create(prod[4]*stackerino, integs[2], 16);
	val fisProd2 = mods.nuclearcraft.ChanceFluidIngredient.create(prod[5]*stackerino, integs[3], 16);
	mods.nuclearcraft.Centrifuge.addRecipe(array[5]*144, prod[0], prod[1], fisProd1, prod[2], prod[3], fisProd2);
}



//does the crafting recipes, sets radiation, & adds the oreDict (does not declare)
function craftTime(fis as IIngredient[], fer as IIngredient[], pellet as IItemStack[], oreName as IOreDictEntry, enrich as int, radiation as double){
	for i,item in pellet{
		mods.nuclearcraft.Radiation.setRadiationLevel(item, radiation);
		oreName.add(item);
		if(enrich == 2){
			recipes.addShapeless(item * 9,[fis[i], fis[i], fer[i], fer[i], fer[i], fer[i], fer[i], fer[i], fer[i]]);
		}
		if(enrich == 4){
			recipes.addShapeless(item * 9,[fis[i], fis[i], fis[i], fis[i], fer[i], fer[i], fer[i], fer[i], fer[i]]);
		}
		if(enrich == 5){
			recipes.addShapeless(item * 9,[fis[i], fis[i], fis[i], fis[i], fis[i], fer[i], fer[i], fer[i], fer[i]]);
		}
		if(enrich == 6){
			recipes.addShapeless(item * 9,[fis[i], fis[i], fis[i], fis[i], fis[i], fis[i], fer[i], fer[i], fer[i]]);
		}
		if(enrich == 7){
			recipes.addShapeless(item * 9,[fis[i], fis[i], fis[i], fis[i], fis[i], fis[i], fis[i], fer[i], fer[i]]);
		}
		if(enrich == 8){
			recipes.addShapeless(item * 9,[fis[i], fis[i], fis[i], fis[i], fis[i], fis[i], fis[i], fis[i], fer[i]]);
		}
		if(enrich == 9){
			recipes.addShapeless(item * 9,[fis[i], fis[i], fis[i], fis[i], fis[i], fis[i], fis[i], fis[i], fis[i]]);
		}
	}
}

var secretStuff = [null] as ILiquidStack[];
if(oreDict has "QuantumTraverseHowCanYouPossiblyNotBeDoneYetWithTheStrangeNamingSystem"){
	secretStuff = [<fluid:nuf6>,<fluid:leuf6>,<fluid:meuf6>,<fluid:heuf6>,<fluid:vheuf6>,<fluid:xeuf6>,<fluid:seuf6>,<fluid:ueuf6>,<fluid:wguf6>,<fluid:ipuf6>] as ILiquidStack[];
}

// does the major lifting
function theBigCheese(fis as IIngredient[], fert as IIngredient[], pellet as IItemStack[], triso as IItemStack, dpellet as IIngredient[], dpellet2 as IItemStack[], fuelInts as int[][], integs as int[], fuelDoubles as double[], array as ILiquidStack[], prod as ILiquidStack[], solidProd as IIngredient[][], selfPriming as bool, oreNames as IOreDictEntry[], secretStuff as ILiquidStack[]){
	//fis/fert/pellet is [normal,carbide,oxide,nitride,za]
	//dpellet is [tr, ox, ni, za]
	//fuelInts is [time, heat, criticality] for [ox, ni, za, trisoSFR]
	//integs is [enrichment, fisProd1 base chance, fisProd2 base chance, affected chance reprocessing ingredient]
	//fuelDoubles is [efficiency, base radiation, burn radiation, depleted radiation, MSR time, decay factor]
	//array is molten, fluoride, FLiBe, dFLiBe, dF, dMolten
	//prod is 4 actinides, 2 fission products as liquids
	//solidProd is 4 actinides, 2 fission products as items

	//crafting
	craftTime(fis, fert, pellet, oreNames[0], integs[0], fuelDoubles[1]);

	//non-crafting recipes
	mods.nuclearcraft.AlloyFurnace.addRecipe(pellet[0], <ore:ingotGraphite>|<ore:dustGraphite>, pellet[1]);
	mods.nuclearcraft.Infuser.addRecipe(pellet[0], <fluid:oxygen>*1000, pellet[2]);
	mods.nuclearcraft.Infuser.addRecipe(pellet[0], <fluid:nitrogen>*1000, pellet[3]);
	mods.nuclearcraft.AlloyFurnace.addRecipe(pellet[0], <ore:ingotZirconium>|<ore:dustZirconium>, pellet[4]);
	furnace.addRecipe(pellet[0], pellet[3]);
	furnace.addRecipe(pellet[0], pellet[2]);
	mods.nuclearcraft.Separator.addRecipe(pellet[1], pellet[0], <nuclearcraft:dust:8>);
	mods.nuclearcraft.Separator.addRecipe(pellet[4], pellet[0], <nuclearcraft:dust:10>);
	var num = 9-integs[0] as int;
	var num2 = integs[0] as int;
	if(integs[0]!=9){
		if (!(oreDict has "QuantumTraverseHowCanYouPossiblyNotBeDoneYetWithTheStrangeNamingSystem") || fuelInts[0][0]!=4800) {
			mods.nuclearcraft.Separator.addRecipe(pellet[0]*9, fert[0]*num, fis[0]*num2);
		}
	}else{
		mods.nuclearcraft.Manufactory.addRecipe(pellet[0], fis[0], 0.01, 1.0);
	}

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
	superMelt(pellet[0], array, prod, [fuelDoubles[4], fuelDoubles[0], fuelDoubles[2], fuelDoubles[5]] as double[], [fuelInts[1][1],fuelInts[0][2], integs[1], integs[2]] as int[], selfPriming, integs[0]);


	//decayed fuel stuff
	for i,item in dpellet{
		mods.nuclearcraft.Radiation.setRadiationLevel(item, fuelDoubles[3]);
		oreNames[1].add(dpellet2[i]);
	}
	val fisProd1 = mods.nuclearcraft.ChanceItemIngredient.create(solidProd[0][4] * num2, integs[1]);
	val fisProd2 = mods.nuclearcraft.ChanceItemIngredient.create(solidProd[0][5] * num2, integs[2]);
	//reprocessing time
	num = 1+integs[0] as int;
	num2 = 5+integs[0] as int;
	var graphite as IIngredient;
	var zirconium as IIngredient;
	graphite = mods.nuclearcraft.ChanceItemIngredient.create(<ore:dustGraphite> * num2, 50);
	zirconium = mods.nuclearcraft.ChanceItemIngredient.create(<nuclearcraft:dust:10> * num, 50);
	if(integs[0]==5||integs[0]==7||integs[0]==9){
		graphite = <ore:dustGraphite> * (num2/2);
		zirconium = <nuclearcraft:dust:10> * (num/2);
	}

	var changed = null;
	if(integs[3]!=4){
	changed = mods.nuclearcraft.ChanceItemIngredient.create(solidProd[0][integs[3]], 50);
	}
	if(integs[3]==0){
	//triso
	mods.nuclearcraft.FuelReprocessor.addRecipe(dpellet[0] * 9, changed, solidProd[0][1], fisProd1, graphite, solidProd[0][2], solidProd[0][3], fisProd2, <nuclearcraft:alloy:13>);
	//oxide
	changed = mods.nuclearcraft.ChanceItemIngredient.create(solidProd[1][integs[3]], 50);
	mods.nuclearcraft.FuelReprocessor.addRecipe(dpellet[1] * 9, changed, solidProd[1][1], fisProd1, null, solidProd[1][2], solidProd[1][3], fisProd2, null);
	//nitride
	changed = mods.nuclearcraft.ChanceItemIngredient.create(solidProd[2][integs[3]], 50);
	mods.nuclearcraft.FuelReprocessor.addRecipe(dpellet[2] * 9, changed, solidProd[2][1], fisProd1, null, solidProd[2][2], solidProd[2][3], fisProd2, null);
	//zirc
	changed = mods.nuclearcraft.ChanceItemIngredient.create(solidProd[3][integs[3]], 50);
	mods.nuclearcraft.FuelReprocessor.addRecipe(dpellet[3] * 9, changed, solidProd[3][1], fisProd1, zirconium, solidProd[3][2], solidProd[3][3], fisProd2, null);
	}
	if(integs[3]==1){
	//triso
	mods.nuclearcraft.FuelReprocessor.addRecipe(dpellet[0] * 9, solidProd[0][0], changed, fisProd1, graphite, solidProd[0][2], solidProd[0][3], fisProd2, <nuclearcraft:alloy:13>);
	//oxide
	changed = mods.nuclearcraft.ChanceItemIngredient.create(solidProd[1][integs[3]], 50);
	mods.nuclearcraft.FuelReprocessor.addRecipe(dpellet[1] * 9, solidProd[1][0], changed, fisProd1, null, solidProd[1][2], solidProd[1][3], fisProd2, null);
	//nitride
	changed = mods.nuclearcraft.ChanceItemIngredient.create(solidProd[2][integs[3]], 50);
	mods.nuclearcraft.FuelReprocessor.addRecipe(dpellet[2] * 9, solidProd[2][0], changed, fisProd1, null, solidProd[2][2], solidProd[2][3], fisProd2, null);
	//zirc
	changed = mods.nuclearcraft.ChanceItemIngredient.create(solidProd[3][integs[3]], 50);
	mods.nuclearcraft.FuelReprocessor.addRecipe(dpellet[3] * 9, solidProd[3][0], changed, fisProd1, zirconium, solidProd[3][2], solidProd[3][3], fisProd2, null);
	}
	if(integs[3]==2){
	//triso
	mods.nuclearcraft.FuelReprocessor.addRecipe(dpellet[0] * 9, solidProd[0][0], solidProd[0][1], fisProd1, graphite, changed, solidProd[0][3], fisProd2, <nuclearcraft:alloy:13>);
	//oxide
	changed = mods.nuclearcraft.ChanceItemIngredient.create(solidProd[1][integs[3]], 50);
	mods.nuclearcraft.FuelReprocessor.addRecipe(dpellet[1] * 9, solidProd[1][0], solidProd[1][1], fisProd1, null, changed, solidProd[1][3], fisProd2, null);
	//nitride
	changed = mods.nuclearcraft.ChanceItemIngredient.create(solidProd[2][integs[3]], 50);
	mods.nuclearcraft.FuelReprocessor.addRecipe(dpellet[2] * 9, solidProd[2][0], solidProd[2][1], fisProd1, null, changed, solidProd[2][3], fisProd2, null);
	//zirc
	changed = mods.nuclearcraft.ChanceItemIngredient.create(solidProd[3][integs[3]], 50);
	mods.nuclearcraft.FuelReprocessor.addRecipe(dpellet[3] * 9, solidProd[3][0], solidProd[3][1], fisProd1, zirconium, changed, solidProd[3][3], fisProd2, null);
	}
	if(integs[3]==3){
	//triso
	mods.nuclearcraft.FuelReprocessor.addRecipe(dpellet[0] * 9, solidProd[0][0], solidProd[0][1], fisProd1, graphite, solidProd[0][2], changed, fisProd2, <nuclearcraft:alloy:13>);
	//oxide
	changed = mods.nuclearcraft.ChanceItemIngredient.create(solidProd[1][integs[3]], 50);
	mods.nuclearcraft.FuelReprocessor.addRecipe(dpellet[1] * 9, solidProd[1][0], solidProd[1][1], fisProd1, null, solidProd[1][2], changed, fisProd2, null);
	//nitride
	changed = mods.nuclearcraft.ChanceItemIngredient.create(solidProd[2][integs[3]], 50);
	mods.nuclearcraft.FuelReprocessor.addRecipe(dpellet[2] * 9, solidProd[2][0], solidProd[2][1], fisProd1, null, solidProd[2][2], changed, fisProd2, null);
	//zirc
	changed = mods.nuclearcraft.ChanceItemIngredient.create(solidProd[3][integs[3]], 50);
	mods.nuclearcraft.FuelReprocessor.addRecipe(dpellet[3] * 9, solidProd[3][0], solidProd[3][1], fisProd1, zirconium, solidProd[3][2], changed, fisProd2, null);
	}
	if(integs[3]==4){
	//triso
	mods.nuclearcraft.FuelReprocessor.addRecipe(dpellet[0] * 9, solidProd[0][0], solidProd[0][1], fisProd1, graphite, solidProd[0][2], solidProd[0][3], fisProd2, <nuclearcraft:alloy:13>);
	//oxide
	changed = mods.nuclearcraft.ChanceItemIngredient.create(solidProd[1][integs[3]], 50);
	mods.nuclearcraft.FuelReprocessor.addRecipe(dpellet[1] * 9, solidProd[1][0], solidProd[1][1], fisProd1, null, solidProd[1][2], solidProd[1][3], fisProd2, null);
	//nitride
	changed = mods.nuclearcraft.ChanceItemIngredient.create(solidProd[2][integs[3]], 50);
	mods.nuclearcraft.FuelReprocessor.addRecipe(dpellet[2] * 9, solidProd[2][0], solidProd[2][1], fisProd1, null, solidProd[2][2], solidProd[2][3], fisProd2, null);
	//zirc
	changed = mods.nuclearcraft.ChanceItemIngredient.create(solidProd[3][integs[3]], 50);
	mods.nuclearcraft.FuelReprocessor.addRecipe(dpellet[3] * 9, solidProd[3][0], solidProd[3][1], fisProd1, zirconium, solidProd[3][2], solidProd[3][3], fisProd2, null);
	}
}


/* -=-=-=-=-=-=-=-=-=-=-=-=-=-=- time to actually run now -=-=-=-=-=-=-=-=-=-=-=-=-=-=- */

val fuelLives = [[2666,3348,2134,2399],[4800,6000,3840,4320],[1972,2462,1574,1775],[4572,5760,3646,4115],[3164,3946,2526,2848],[1476,1846,1180,1328],[1500,1870,1200,1350],[2420,3032,1932,2178],[2150,2692,1714,1935],[2166,2716,1734,1949],[1066,1334,852,959],[2000,2504,1600,1800],[360,450,288,324],[440,550,352,396]] as int[][];
val fuelHeats = [[216,172,270,240],[120,96,150,133],[292,234,366,324],[126,100,158,140],[182,146,228,202],[390,312,488,433],[384,308,480,427],[238,190,298,264],[268,214,336,298],[266,212,332,296],[540,432,676,600],[288,230,360,320],[1600,1280,2000,1778],[1310,1048,1638,1456]] as int[][];
val criticalities = [[[52,62,44,47],[31,37,26,28],[26,31,22,23],[22,26,19,20],[20,24,17,18],[17,20,14,15],[16,19,14,14]],[[68,82,58,61],[41,49,35,37],[34,41,29,31],[29,35,25,26],[26,31,22,23],[23,28,20,21],[20,24,17,18]],[[47,56,40,42],[28,34,24,25],[23,28,20,21],[20,24,17,18],[18,22,15,16],[16,19,14,14],[14,17,12,13]],[[66,79,56,59],[40,48,34,36],[33,40,28,30],[28,34,24,25],[25,30,21,23],[22,26,19,20],[20,24,17,18]],[[56,67,48,50],[34,41,29,31],[28,34,24,25],[24,29,20,22],[21,25,18,19],[19,23,16,17],[17,20,14,15]],[[44,53,37,40],[26,31,22,23],[22,26,19,20],[19,23,16,17],[17,20,14,15],[15,18,13,14],[13,16,11,12]],[[50,60,43,45],[30,36,26,27],[25,30,21,23],[21,25,18,19],[19,23,16,17],[17,20,14,15],[15,18,13,14]],[[48,58,41,43],[29,35,25,26],[24,29,20,22],[21,25,18,19],[18,22,15,16],[16,19,14,14],[14,17,12,13]],[[49,59,42,44],[29,35,25,26],[24,29,20,22],[21,25,18,19],[18,22,15,16],[16,19,14,14],[15,18,13,14]],[[43,52,37,39],[26,31,22,23],[22,26,19,20],[19,23,16,17],[16,19,14,14],[14,17,12,13],[13,16,11,12]],[[30,36,26,27],[24,29,20,22],[20,24,17,18],[17,20,14,15],[15,18,13,14],[13,16,11,12],[12,14,10,11]],[[47,56,40,42],[28,34,24,25],[24,29,20,22],[20,24,17,18],[18,22,15,16],[16,19,14,14],[14,17,12,13]],[[13,16,11,12],[8,10,7,7],[7,8,6,6],[6,7,5,5],[5,6,4,5],[4,5,3,4],[4,5,3,4]],[[17,20,14,15],[10,12,9,9],[8,10,7,7],[7,8,6,6],[6,7,5,5],[6,7,5,5],[5,6,4,5,5]]] as int[][][];
val fuelDecayFactor = [0.065,0.065,0.070,0.075,0.075,0.08,0.085,0.085,0.085,0.090,0.10,0.10,0.10,0.105] as double[];


//all baseEff values are set to 0.025 below the LE fuel value for efficiency
val baseEff = [1.075,0.975,1.075,1.175,1.225,1.325,1.425,1.475,1.525,1.625,1.725,1.775,1.875,1.975] as double[];


//array is molten, fluoride, FLiBe, dFLiBe, dF, dMolten
//val array = [[<fluid:meu_233>,<fluid:meu_233_fluoride>,<fluid:meu_233_fluoride_flibe>,<fluid:depleted_meu_233_fluoride_flibe>,<fluid:depleted_meu_233_fluoride>,<fluid:depleted_meu_233>],[<fluid:vheu_233>,<fluid:vheu_233_fluoride>,<fluid:vheu_233_fluoride_flibe>,<fluid:depleted_vheu_233_fluoride_flibe>,<fluid:depleted_vheu_233_fluoride>,<fluid:depleted_vheu_233>],[<fluid:xeu_233>,<fluid:xeu_233_fluoride>,<fluid:xeu_233_fluoride_flibe>,<fluid:depleted_xeu_233_fluoride_flibe>,<fluid:depleted_xeu_233_fluoride>,<fluid:depleted_xeu_233>],[<fluid:seu_233>,<fluid:seu_233_fluoride>,<fluid:seu_233_fluoride_flibe>,<fluid:depleted_seu_233_fluoride_flibe>,<fluid:depleted_seu_233_fluoride>,<fluid:depleted_seu_233>],[<fluid:ueu_233>,<fluid:ueu_233_fluoride>,<fluid:ueu_233_fluoride_flibe>,<fluid:depleted_ueu_233_fluoride_flibe>,<fluid:depleted_ueu_233_fluoride>,<fluid:depleted_ueu_233>],[<fluid:wgu_233>,<fluid:wgu_233_fluoride>,<fluid:wgu_233_fluoride_flibe>,<fluid:depleted_wgu_233_fluoride_flibe>,<fluid:depleted_wgu_233_fluoride>,<fluid:depleted_wgu_233>],[<fluid:ipu_233>,<fluid:ipu_233_fluoride>,<fluid:ipu_233_fluoride_flibe>,<fluid:depleted_ipu_233_fluoride_flibe>,<fluid:depleted_ipu_233_fluoride>,<fluid:depleted_ipu_233>]] as ILiquidStack[][];

val array = [[[<fluid:meu_233>,<fluid:meu_233_fluoride>,<fluid:meu_233_fluoride_flibe>,<fluid:depleted_meu_233_fluoride_flibe>,<fluid:depleted_meu_233_fluoride>,<fluid:depleted_meu_233>],[<fluid:vheu_233>,<fluid:vheu_233_fluoride>,<fluid:vheu_233_fluoride_flibe>,<fluid:depleted_vheu_233_fluoride_flibe>,<fluid:depleted_vheu_233_fluoride>,<fluid:depleted_vheu_233>],[<fluid:xeu_233>,<fluid:xeu_233_fluoride>,<fluid:xeu_233_fluoride_flibe>,<fluid:depleted_xeu_233_fluoride_flibe>,<fluid:depleted_xeu_233_fluoride>,<fluid:depleted_xeu_233>],[<fluid:seu_233>,<fluid:seu_233_fluoride>,<fluid:seu_233_fluoride_flibe>,<fluid:depleted_seu_233_fluoride_flibe>,<fluid:depleted_seu_233_fluoride>,<fluid:depleted_seu_233>],[<fluid:ueu_233>,<fluid:ueu_233_fluoride>,<fluid:ueu_233_fluoride_flibe>,<fluid:depleted_ueu_233_fluoride_flibe>,<fluid:depleted_ueu_233_fluoride>,<fluid:depleted_ueu_233>],[<fluid:wgu_233>,<fluid:wgu_233_fluoride>,<fluid:wgu_233_fluoride_flibe>,<fluid:depleted_wgu_233_fluoride_flibe>,<fluid:depleted_wgu_233_fluoride>,<fluid:depleted_wgu_233>],[<fluid:ipu_233>,<fluid:ipu_233_fluoride>,<fluid:ipu_233_fluoride_flibe>,<fluid:depleted_ipu_233_fluoride_flibe>,<fluid:depleted_ipu_233_fluoride>,<fluid:depleted_ipu_233>]],[[<fluid:meu_235>,<fluid:meu_235_fluoride>,<fluid:meu_235_fluoride_flibe>,<fluid:depleted_meu_235_fluoride_flibe>,<fluid:depleted_meu_235_fluoride>,<fluid:depleted_meu_235>],[<fluid:vheu_235>,<fluid:vheu_235_fluoride>,<fluid:vheu_235_fluoride_flibe>,<fluid:depleted_vheu_235_fluoride_flibe>,<fluid:depleted_vheu_235_fluoride>,<fluid:depleted_vheu_235>],[<fluid:xeu_235>,<fluid:xeu_235_fluoride>,<fluid:xeu_235_fluoride_flibe>,<fluid:depleted_xeu_235_fluoride_flibe>,<fluid:depleted_xeu_235_fluoride>,<fluid:depleted_xeu_235>],[<fluid:seu_235>,<fluid:seu_235_fluoride>,<fluid:seu_235_fluoride_flibe>,<fluid:depleted_seu_235_fluoride_flibe>,<fluid:depleted_seu_235_fluoride>,<fluid:depleted_seu_235>],[<fluid:ueu_235>,<fluid:ueu_235_fluoride>,<fluid:ueu_235_fluoride_flibe>,<fluid:depleted_ueu_235_fluoride_flibe>,<fluid:depleted_ueu_235_fluoride>,<fluid:depleted_ueu_235>],[<fluid:wgu_235>,<fluid:wgu_235_fluoride>,<fluid:wgu_235_fluoride_flibe>,<fluid:depleted_wgu_235_fluoride_flibe>,<fluid:depleted_wgu_235_fluoride>,<fluid:depleted_wgu_235>],[<fluid:ipu_235>,<fluid:ipu_235_fluoride>,<fluid:ipu_235_fluoride_flibe>,<fluid:depleted_ipu_235_fluoride_flibe>,<fluid:depleted_ipu_235_fluoride>,<fluid:depleted_ipu_235>]],[[<fluid:men_236>,<fluid:men_236_fluoride>,<fluid:men_236_fluoride_flibe>,<fluid:depleted_men_236_fluoride_flibe>,<fluid:depleted_men_236_fluoride>,<fluid:depleted_men_236>],[<fluid:vhen_236>,<fluid:vhen_236_fluoride>,<fluid:vhen_236_fluoride_flibe>,<fluid:depleted_vhen_236_fluoride_flibe>,<fluid:depleted_vhen_236_fluoride>,<fluid:depleted_vhen_236>],[<fluid:xen_236>,<fluid:xen_236_fluoride>,<fluid:xen_236_fluoride_flibe>,<fluid:depleted_xen_236_fluoride_flibe>,<fluid:depleted_xen_236_fluoride>,<fluid:depleted_xen_236>],[<fluid:sen_236>,<fluid:sen_236_fluoride>,<fluid:sen_236_fluoride_flibe>,<fluid:depleted_sen_236_fluoride_flibe>,<fluid:depleted_sen_236_fluoride>,<fluid:depleted_sen_236>],[<fluid:uen_236>,<fluid:uen_236_fluoride>,<fluid:uen_236_fluoride_flibe>,<fluid:depleted_uen_236_fluoride_flibe>,<fluid:depleted_uen_236_fluoride>,<fluid:depleted_uen_236>],[<fluid:wgn_236>,<fluid:wgn_236_fluoride>,<fluid:wgn_236_fluoride_flibe>,<fluid:depleted_wgn_236_fluoride_flibe>,<fluid:depleted_wgn_236_fluoride>,<fluid:depleted_wgn_236>],[<fluid:ipn_236>,<fluid:ipn_236_fluoride>,<fluid:ipn_236_fluoride_flibe>,<fluid:depleted_ipn_236_fluoride_flibe>,<fluid:depleted_ipn_236_fluoride>,<fluid:depleted_ipn_236>]],[[<fluid:mep_239>,<fluid:mep_239_fluoride>,<fluid:mep_239_fluoride_flibe>,<fluid:depleted_mep_239_fluoride_flibe>,<fluid:depleted_mep_239_fluoride>,<fluid:depleted_mep_239>],[<fluid:vhep_239>,<fluid:vhep_239_fluoride>,<fluid:vhep_239_fluoride_flibe>,<fluid:depleted_vhep_239_fluoride_flibe>,<fluid:depleted_vhep_239_fluoride>,<fluid:depleted_vhep_239>],[<fluid:xep_239>,<fluid:xep_239_fluoride>,<fluid:xep_239_fluoride_flibe>,<fluid:depleted_xep_239_fluoride_flibe>,<fluid:depleted_xep_239_fluoride>,<fluid:depleted_xep_239>],[<fluid:sep_239>,<fluid:sep_239_fluoride>,<fluid:sep_239_fluoride_flibe>,<fluid:depleted_sep_239_fluoride_flibe>,<fluid:depleted_sep_239_fluoride>,<fluid:depleted_sep_239>],[<fluid:uep_239>,<fluid:uep_239_fluoride>,<fluid:uep_239_fluoride_flibe>,<fluid:depleted_uep_239_fluoride_flibe>,<fluid:depleted_uep_239_fluoride>,<fluid:depleted_uep_239>],[<fluid:wgp_239>,<fluid:wgp_239_fluoride>,<fluid:wgp_239_fluoride_flibe>,<fluid:depleted_wgp_239_fluoride_flibe>,<fluid:depleted_wgp_239_fluoride>,<fluid:depleted_wgp_239>],[<fluid:ipp_239>,<fluid:ipp_239_fluoride>,<fluid:ipp_239_fluoride_flibe>,<fluid:depleted_ipp_239_fluoride_flibe>,<fluid:depleted_ipp_239_fluoride>,<fluid:depleted_ipp_239>]],[[<fluid:mep_241>,<fluid:mep_241_fluoride>,<fluid:mep_241_fluoride_flibe>,<fluid:depleted_mep_241_fluoride_flibe>,<fluid:depleted_mep_241_fluoride>,<fluid:depleted_mep_241>],[<fluid:vhep_241>,<fluid:vhep_241_fluoride>,<fluid:vhep_241_fluoride_flibe>,<fluid:depleted_vhep_241_fluoride_flibe>,<fluid:depleted_vhep_241_fluoride>,<fluid:depleted_vhep_241>],[<fluid:xep_241>,<fluid:xep_241_fluoride>,<fluid:xep_241_fluoride_flibe>,<fluid:depleted_xep_241_fluoride_flibe>,<fluid:depleted_xep_241_fluoride>,<fluid:depleted_xep_241>],[<fluid:sep_241>,<fluid:sep_241_fluoride>,<fluid:sep_241_fluoride_flibe>,<fluid:depleted_sep_241_fluoride_flibe>,<fluid:depleted_sep_241_fluoride>,<fluid:depleted_sep_241>],[<fluid:uep_241>,<fluid:uep_241_fluoride>,<fluid:uep_241_fluoride_flibe>,<fluid:depleted_uep_241_fluoride_flibe>,<fluid:depleted_uep_241_fluoride>,<fluid:depleted_uep_241>],[<fluid:wgp_241>,<fluid:wgp_241_fluoride>,<fluid:wgp_241_fluoride_flibe>,<fluid:depleted_wgp_241_fluoride_flibe>,<fluid:depleted_wgp_241_fluoride>,<fluid:depleted_wgp_241>],[<fluid:ipp_241>,<fluid:ipp_241_fluoride>,<fluid:ipp_241_fluoride_flibe>,<fluid:depleted_ipp_241_fluoride_flibe>,<fluid:depleted_ipp_241_fluoride>,<fluid:depleted_ipp_241>]],[[<fluid:mea_242>,<fluid:mea_242_fluoride>,<fluid:mea_242_fluoride_flibe>,<fluid:depleted_mea_242_fluoride_flibe>,<fluid:depleted_mea_242_fluoride>,<fluid:depleted_mea_242>],[<fluid:vhea_242>,<fluid:vhea_242_fluoride>,<fluid:vhea_242_fluoride_flibe>,<fluid:depleted_vhea_242_fluoride_flibe>,<fluid:depleted_vhea_242_fluoride>,<fluid:depleted_vhea_242>],[<fluid:xea_242>,<fluid:xea_242_fluoride>,<fluid:xea_242_fluoride_flibe>,<fluid:depleted_xea_242_fluoride_flibe>,<fluid:depleted_xea_242_fluoride>,<fluid:depleted_xea_242>],[<fluid:sea_242>,<fluid:sea_242_fluoride>,<fluid:sea_242_fluoride_flibe>,<fluid:depleted_sea_242_fluoride_flibe>,<fluid:depleted_sea_242_fluoride>,<fluid:depleted_sea_242>],[<fluid:uea_242>,<fluid:uea_242_fluoride>,<fluid:uea_242_fluoride_flibe>,<fluid:depleted_uea_242_fluoride_flibe>,<fluid:depleted_uea_242_fluoride>,<fluid:depleted_uea_242>],[<fluid:wga_242>,<fluid:wga_242_fluoride>,<fluid:wga_242_fluoride_flibe>,<fluid:depleted_wga_242_fluoride_flibe>,<fluid:depleted_wga_242_fluoride>,<fluid:depleted_wga_242>],[<fluid:ipa_242>,<fluid:ipa_242_fluoride>,<fluid:ipa_242_fluoride_flibe>,<fluid:depleted_ipa_242_fluoride_flibe>,<fluid:depleted_ipa_242_fluoride>,<fluid:depleted_ipa_242>]],[[<fluid:mecm_243>,<fluid:mecm_243_fluoride>,<fluid:mecm_243_fluoride_flibe>,<fluid:depleted_mecm_243_fluoride_flibe>,<fluid:depleted_mecm_243_fluoride>,<fluid:depleted_mecm_243>],[<fluid:vhecm_243>,<fluid:vhecm_243_fluoride>,<fluid:vhecm_243_fluoride_flibe>,<fluid:depleted_vhecm_243_fluoride_flibe>,<fluid:depleted_vhecm_243_fluoride>,<fluid:depleted_vhecm_243>],[<fluid:xecm_243>,<fluid:xecm_243_fluoride>,<fluid:xecm_243_fluoride_flibe>,<fluid:depleted_xecm_243_fluoride_flibe>,<fluid:depleted_xecm_243_fluoride>,<fluid:depleted_xecm_243>],[<fluid:secm_243>,<fluid:secm_243_fluoride>,<fluid:secm_243_fluoride_flibe>,<fluid:depleted_secm_243_fluoride_flibe>,<fluid:depleted_secm_243_fluoride>,<fluid:depleted_secm_243>],[<fluid:uecm_243>,<fluid:uecm_243_fluoride>,<fluid:uecm_243_fluoride_flibe>,<fluid:depleted_uecm_243_fluoride_flibe>,<fluid:depleted_uecm_243_fluoride>,<fluid:depleted_uecm_243>],[<fluid:wgcm_243>,<fluid:wgcm_243_fluoride>,<fluid:wgcm_243_fluoride_flibe>,<fluid:depleted_wgcm_243_fluoride_flibe>,<fluid:depleted_wgcm_243_fluoride>,<fluid:depleted_wgcm_243>],[<fluid:ipcm_243>,<fluid:ipcm_243_fluoride>,<fluid:ipcm_243_fluoride_flibe>,<fluid:depleted_ipcm_243_fluoride_flibe>,<fluid:depleted_ipcm_243_fluoride>,<fluid:depleted_ipcm_243>]],[[<fluid:mecm_245>,<fluid:mecm_245_fluoride>,<fluid:mecm_245_fluoride_flibe>,<fluid:depleted_mecm_245_fluoride_flibe>,<fluid:depleted_mecm_245_fluoride>,<fluid:depleted_mecm_245>],[<fluid:vhecm_245>,<fluid:vhecm_245_fluoride>,<fluid:vhecm_245_fluoride_flibe>,<fluid:depleted_vhecm_245_fluoride_flibe>,<fluid:depleted_vhecm_245_fluoride>,<fluid:depleted_vhecm_245>],[<fluid:xecm_245>,<fluid:xecm_245_fluoride>,<fluid:xecm_245_fluoride_flibe>,<fluid:depleted_xecm_245_fluoride_flibe>,<fluid:depleted_xecm_245_fluoride>,<fluid:depleted_xecm_245>],[<fluid:secm_245>,<fluid:secm_245_fluoride>,<fluid:secm_245_fluoride_flibe>,<fluid:depleted_secm_245_fluoride_flibe>,<fluid:depleted_secm_245_fluoride>,<fluid:depleted_secm_245>],[<fluid:uecm_245>,<fluid:uecm_245_fluoride>,<fluid:uecm_245_fluoride_flibe>,<fluid:depleted_uecm_245_fluoride_flibe>,<fluid:depleted_uecm_245_fluoride>,<fluid:depleted_uecm_245>],[<fluid:wgcm_245>,<fluid:wgcm_245_fluoride>,<fluid:wgcm_245_fluoride_flibe>,<fluid:depleted_wgcm_245_fluoride_flibe>,<fluid:depleted_wgcm_245_fluoride>,<fluid:depleted_wgcm_245>],[<fluid:ipcm_245>,<fluid:ipcm_245_fluoride>,<fluid:ipcm_245_fluoride_flibe>,<fluid:depleted_ipcm_245_fluoride_flibe>,<fluid:depleted_ipcm_245_fluoride>,<fluid:depleted_ipcm_245>]],[[<fluid:mecm_247>,<fluid:mecm_247_fluoride>,<fluid:mecm_247_fluoride_flibe>,<fluid:depleted_mecm_247_fluoride_flibe>,<fluid:depleted_mecm_247_fluoride>,<fluid:depleted_mecm_247>],[<fluid:vhecm_247>,<fluid:vhecm_247_fluoride>,<fluid:vhecm_247_fluoride_flibe>,<fluid:depleted_vhecm_247_fluoride_flibe>,<fluid:depleted_vhecm_247_fluoride>,<fluid:depleted_vhecm_247>],[<fluid:xecm_247>,<fluid:xecm_247_fluoride>,<fluid:xecm_247_fluoride_flibe>,<fluid:depleted_xecm_247_fluoride_flibe>,<fluid:depleted_xecm_247_fluoride>,<fluid:depleted_xecm_247>],[<fluid:secm_247>,<fluid:secm_247_fluoride>,<fluid:secm_247_fluoride_flibe>,<fluid:depleted_secm_247_fluoride_flibe>,<fluid:depleted_secm_247_fluoride>,<fluid:depleted_secm_247>],[<fluid:uecm_247>,<fluid:uecm_247_fluoride>,<fluid:uecm_247_fluoride_flibe>,<fluid:depleted_uecm_247_fluoride_flibe>,<fluid:depleted_uecm_247_fluoride>,<fluid:depleted_uecm_247>],[<fluid:wgcm_247>,<fluid:wgcm_247_fluoride>,<fluid:wgcm_247_fluoride_flibe>,<fluid:depleted_wgcm_247_fluoride_flibe>,<fluid:depleted_wgcm_247_fluoride>,<fluid:depleted_wgcm_247>],[<fluid:ipcm_247>,<fluid:ipcm_247_fluoride>,<fluid:ipcm_247_fluoride_flibe>,<fluid:depleted_ipcm_247_fluoride_flibe>,<fluid:depleted_ipcm_247_fluoride>,<fluid:depleted_ipcm_247>]],[[<fluid:meb_248>,<fluid:meb_248_fluoride>,<fluid:meb_248_fluoride_flibe>,<fluid:depleted_meb_248_fluoride_flibe>,<fluid:depleted_meb_248_fluoride>,<fluid:depleted_meb_248>],[<fluid:vheb_248>,<fluid:vheb_248_fluoride>,<fluid:vheb_248_fluoride_flibe>,<fluid:depleted_vheb_248_fluoride_flibe>,<fluid:depleted_vheb_248_fluoride>,<fluid:depleted_vheb_248>],[<fluid:xeb_248>,<fluid:xeb_248_fluoride>,<fluid:xeb_248_fluoride_flibe>,<fluid:depleted_xeb_248_fluoride_flibe>,<fluid:depleted_xeb_248_fluoride>,<fluid:depleted_xeb_248>],[<fluid:seb_248>,<fluid:seb_248_fluoride>,<fluid:seb_248_fluoride_flibe>,<fluid:depleted_seb_248_fluoride_flibe>,<fluid:depleted_seb_248_fluoride>,<fluid:depleted_seb_248>],[<fluid:ueb_248>,<fluid:ueb_248_fluoride>,<fluid:ueb_248_fluoride_flibe>,<fluid:depleted_ueb_248_fluoride_flibe>,<fluid:depleted_ueb_248_fluoride>,<fluid:depleted_ueb_248>],[<fluid:wgb_248>,<fluid:wgb_248_fluoride>,<fluid:wgb_248_fluoride_flibe>,<fluid:depleted_wgb_248_fluoride_flibe>,<fluid:depleted_wgb_248_fluoride>,<fluid:depleted_wgb_248>],[<fluid:ipb_248>,<fluid:ipb_248_fluoride>,<fluid:ipb_248_fluoride_flibe>,<fluid:depleted_ipb_248_fluoride_flibe>,<fluid:depleted_ipb_248_fluoride>,<fluid:depleted_ipb_248>]],[[<fluid:mecf_249>,<fluid:mecf_249_fluoride>,<fluid:mecf_249_fluoride_flibe>,<fluid:depleted_mecf_249_fluoride_flibe>,<fluid:depleted_mecf_249_fluoride>,<fluid:depleted_mecf_249>],[<fluid:vhecf_249>,<fluid:vhecf_249_fluoride>,<fluid:vhecf_249_fluoride_flibe>,<fluid:depleted_vhecf_249_fluoride_flibe>,<fluid:depleted_vhecf_249_fluoride>,<fluid:depleted_vhecf_249>],[<fluid:xecf_249>,<fluid:xecf_249_fluoride>,<fluid:xecf_249_fluoride_flibe>,<fluid:depleted_xecf_249_fluoride_flibe>,<fluid:depleted_xecf_249_fluoride>,<fluid:depleted_xecf_249>],[<fluid:secf_249>,<fluid:secf_249_fluoride>,<fluid:secf_249_fluoride_flibe>,<fluid:depleted_secf_249_fluoride_flibe>,<fluid:depleted_secf_249_fluoride>,<fluid:depleted_secf_249>],[<fluid:uecf_249>,<fluid:uecf_249_fluoride>,<fluid:uecf_249_fluoride_flibe>,<fluid:depleted_uecf_249_fluoride_flibe>,<fluid:depleted_uecf_249_fluoride>,<fluid:depleted_uecf_249>],[<fluid:wgcf_249>,<fluid:wgcf_249_fluoride>,<fluid:wgcf_249_fluoride_flibe>,<fluid:depleted_wgcf_249_fluoride_flibe>,<fluid:depleted_wgcf_249_fluoride>,<fluid:depleted_wgcf_249>],[<fluid:ipcf_249>,<fluid:ipcf_249_fluoride>,<fluid:ipcf_249_fluoride_flibe>,<fluid:depleted_ipcf_249_fluoride_flibe>,<fluid:depleted_ipcf_249_fluoride>,<fluid:depleted_ipcf_249>]],[[<fluid:mecf_251>,<fluid:mecf_251_fluoride>,<fluid:mecf_251_fluoride_flibe>,<fluid:depleted_mecf_251_fluoride_flibe>,<fluid:depleted_mecf_251_fluoride>,<fluid:depleted_mecf_251>],[<fluid:vhecf_251>,<fluid:vhecf_251_fluoride>,<fluid:vhecf_251_fluoride_flibe>,<fluid:depleted_vhecf_251_fluoride_flibe>,<fluid:depleted_vhecf_251_fluoride>,<fluid:depleted_vhecf_251>],[<fluid:xecf_251>,<fluid:xecf_251_fluoride>,<fluid:xecf_251_fluoride_flibe>,<fluid:depleted_xecf_251_fluoride_flibe>,<fluid:depleted_xecf_251_fluoride>,<fluid:depleted_xecf_251>],[<fluid:secf_251>,<fluid:secf_251_fluoride>,<fluid:secf_251_fluoride_flibe>,<fluid:depleted_secf_251_fluoride_flibe>,<fluid:depleted_secf_251_fluoride>,<fluid:depleted_secf_251>],[<fluid:uecf_251>,<fluid:uecf_251_fluoride>,<fluid:uecf_251_fluoride_flibe>,<fluid:depleted_uecf_251_fluoride_flibe>,<fluid:depleted_uecf_251_fluoride>,<fluid:depleted_uecf_251>],[<fluid:wgcf_251>,<fluid:wgcf_251_fluoride>,<fluid:wgcf_251_fluoride_flibe>,<fluid:depleted_wgcf_251_fluoride_flibe>,<fluid:depleted_wgcf_251_fluoride>,<fluid:depleted_wgcf_251>],[<fluid:ipcf_251>,<fluid:ipcf_251_fluoride>,<fluid:ipcf_251_fluoride_flibe>,<fluid:depleted_ipcf_251_fluoride_flibe>,<fluid:depleted_ipcf_251_fluoride>,<fluid:depleted_ipcf_251>]],[[<fluid:mecf_253>,<fluid:mecf_253_fluoride>,<fluid:mecf_253_fluoride_flibe>,<fluid:depleted_mecf_253_fluoride_flibe>,<fluid:depleted_mecf_253_fluoride>,<fluid:depleted_mecf_253>],[<fluid:vhecf_253>,<fluid:vhecf_253_fluoride>,<fluid:vhecf_253_fluoride_flibe>,<fluid:depleted_vhecf_253_fluoride_flibe>,<fluid:depleted_vhecf_253_fluoride>,<fluid:depleted_vhecf_253>],[<fluid:xecf_253>,<fluid:xecf_253_fluoride>,<fluid:xecf_253_fluoride_flibe>,<fluid:depleted_xecf_253_fluoride_flibe>,<fluid:depleted_xecf_253_fluoride>,<fluid:depleted_xecf_253>],[<fluid:secf_253>,<fluid:secf_253_fluoride>,<fluid:secf_253_fluoride_flibe>,<fluid:depleted_secf_253_fluoride_flibe>,<fluid:depleted_secf_253_fluoride>,<fluid:depleted_secf_253>],[<fluid:uecf_253>,<fluid:uecf_253_fluoride>,<fluid:uecf_253_fluoride_flibe>,<fluid:depleted_uecf_253_fluoride_flibe>,<fluid:depleted_uecf_253_fluoride>,<fluid:depleted_uecf_253>],[<fluid:wgcf_253>,<fluid:wgcf_253_fluoride>,<fluid:wgcf_253_fluoride_flibe>,<fluid:depleted_wgcf_253_fluoride_flibe>,<fluid:depleted_wgcf_253_fluoride>,<fluid:depleted_wgcf_253>],[<fluid:ipcf_253>,<fluid:ipcf_253_fluoride>,<fluid:ipcf_253_fluoride_flibe>,<fluid:depleted_ipcf_253_fluoride_flibe>,<fluid:depleted_ipcf_253_fluoride>,<fluid:depleted_ipcf_253>]],[[<fluid:mee_254>,<fluid:mee_254_fluoride>,<fluid:mee_254_fluoride_flibe>,<fluid:depleted_mee_254_fluoride_flibe>,<fluid:depleted_mee_254_fluoride>,<fluid:depleted_mee_254>],[<fluid:vhee_254>,<fluid:vhee_254_fluoride>,<fluid:vhee_254_fluoride_flibe>,<fluid:depleted_vhee_254_fluoride_flibe>,<fluid:depleted_vhee_254_fluoride>,<fluid:depleted_vhee_254>],[<fluid:xee_254>,<fluid:xee_254_fluoride>,<fluid:xee_254_fluoride_flibe>,<fluid:depleted_xee_254_fluoride_flibe>,<fluid:depleted_xee_254_fluoride>,<fluid:depleted_xee_254>],[<fluid:see_254>,<fluid:see_254_fluoride>,<fluid:see_254_fluoride_flibe>,<fluid:depleted_see_254_fluoride_flibe>,<fluid:depleted_see_254_fluoride>,<fluid:depleted_see_254>],[<fluid:uee_254>,<fluid:uee_254_fluoride>,<fluid:uee_254_fluoride_flibe>,<fluid:depleted_uee_254_fluoride_flibe>,<fluid:depleted_uee_254_fluoride>,<fluid:depleted_uee_254>],[<fluid:wge_254>,<fluid:wge_254_fluoride>,<fluid:wge_254_fluoride_flibe>,<fluid:depleted_wge_254_fluoride_flibe>,<fluid:depleted_wge_254_fluoride>,<fluid:depleted_wge_254>],[<fluid:ipe_254>,<fluid:ipe_254_fluoride>,<fluid:ipe_254_fluoride_flibe>,<fluid:depleted_ipe_254_fluoride_flibe>,<fluid:depleted_ipe_254_fluoride>,<fluid:depleted_ipe_254>]]] as ILiquidStack[][][];

var enrich= ["ME","VHE","XE","SE","UE","WG","IP"] as string[];
var isos= ["U233","U235","N236","P239","P241","A242","Cm243","Cm245","Cm247","B248","Cf249","Cf251","Cf253","E254"] as string[];

//val oreDictStuff = [[<ore:ingotMEU233All>,<ore:ingotDepletedMEU233All>],[<ore:ingotVHEU233All>,<ore:ingotDepletedVHEU233All>],[<ore:ingotXEU233All>,<ore:ingotDepletedXEU233All>],[<ore:ingotSEU233All>,<ore:ingotDepletedSEU233All>],[<ore:ingotUEU233All>,<ore:ingotDepletedUEU233All>],[<ore:ingotWGU233All>,<ore:ingotDepletedWGU233All>],[<ore:ingotIPU233All>,<ore:ingotDepletedIPU233All>]] as IOreDictEntry[][];

val oreDictStuff = [[[<ore:ingotMEU233All>,<ore:ingotDepletedMEU233All>],[<ore:ingotVHEU233All>,<ore:ingotDepletedVHEU233All>],[<ore:ingotXEU233All>,<ore:ingotDepletedXEU233All>],[<ore:ingotSEU233All>,<ore:ingotDepletedSEU233All>],[<ore:ingotUEU233All>,<ore:ingotDepletedUEU233All>],[<ore:ingotWGU233All>,<ore:ingotDepletedWGU233All>],[<ore:ingotIPU233All>,<ore:ingotDepletedIPU233All>]],[[<ore:ingotMEU235All>,<ore:ingotDepletedMEU235All>],[<ore:ingotVHEU235All>,<ore:ingotDepletedVHEU235All>],[<ore:ingotXEU235All>,<ore:ingotDepletedXEU235All>],[<ore:ingotSEU235All>,<ore:ingotDepletedSEU235All>],[<ore:ingotUEU235All>,<ore:ingotDepletedUEU235All>],[<ore:ingotWGU235All>,<ore:ingotDepletedWGU235All>],[<ore:ingotIPU235All>,<ore:ingotDepletedIPU235All>]],[[<ore:ingotMEN236All>,<ore:ingotDepletedMEN236All>],[<ore:ingotVHEN236All>,<ore:ingotDepletedVHEN236All>],[<ore:ingotXEN236All>,<ore:ingotDepletedXEN236All>],[<ore:ingotSEN236All>,<ore:ingotDepletedSEN236All>],[<ore:ingotUEN236All>,<ore:ingotDepletedUEN236All>],[<ore:ingotWGN236All>,<ore:ingotDepletedWGN236All>],[<ore:ingotIPN236All>,<ore:ingotDepletedIPN236All>]],[[<ore:ingotMEP239All>,<ore:ingotDepletedMEP239All>],[<ore:ingotVHEP239All>,<ore:ingotDepletedVHEP239All>],[<ore:ingotXEP239All>,<ore:ingotDepletedXEP239All>],[<ore:ingotSEP239All>,<ore:ingotDepletedSEP239All>],[<ore:ingotUEP239All>,<ore:ingotDepletedUEP239All>],[<ore:ingotWGP239All>,<ore:ingotDepletedWGP239All>],[<ore:ingotIPP239All>,<ore:ingotDepletedIPP239All>]],[[<ore:ingotMEP241All>,<ore:ingotDepletedMEP241All>],[<ore:ingotVHEP241All>,<ore:ingotDepletedVHEP241All>],[<ore:ingotXEP241All>,<ore:ingotDepletedXEP241All>],[<ore:ingotSEP241All>,<ore:ingotDepletedSEP241All>],[<ore:ingotUEP241All>,<ore:ingotDepletedUEP241All>],[<ore:ingotWGP241All>,<ore:ingotDepletedWGP241All>],[<ore:ingotIPP241All>,<ore:ingotDepletedIPP241All>]],[[<ore:ingotMEA242All>,<ore:ingotDepletedMEA242All>],[<ore:ingotVHEA242All>,<ore:ingotDepletedVHEA242All>],[<ore:ingotXEA242All>,<ore:ingotDepletedXEA242All>],[<ore:ingotSEA242All>,<ore:ingotDepletedSEA242All>],[<ore:ingotUEA242All>,<ore:ingotDepletedUEA242All>],[<ore:ingotWGA242All>,<ore:ingotDepletedWGA242All>],[<ore:ingotIPA242All>,<ore:ingotDepletedIPA242All>]],[[<ore:ingotMECm243All>,<ore:ingotDepletedMECm243All>],[<ore:ingotVHECm243All>,<ore:ingotDepletedVHECm243All>],[<ore:ingotXECm243All>,<ore:ingotDepletedXECm243All>],[<ore:ingotSECm243All>,<ore:ingotDepletedSECm243All>],[<ore:ingotUECm243All>,<ore:ingotDepletedUECm243All>],[<ore:ingotWGCm243All>,<ore:ingotDepletedWGCm243All>],[<ore:ingotIPCm243All>,<ore:ingotDepletedIPCm243All>]],[[<ore:ingotMECm245All>,<ore:ingotDepletedMECm245All>],[<ore:ingotVHECm245All>,<ore:ingotDepletedVHECm245All>],[<ore:ingotXECm245All>,<ore:ingotDepletedXECm245All>],[<ore:ingotSECm245All>,<ore:ingotDepletedSECm245All>],[<ore:ingotUECm245All>,<ore:ingotDepletedUECm245All>],[<ore:ingotWGCm245All>,<ore:ingotDepletedWGCm245All>],[<ore:ingotIPCm245All>,<ore:ingotDepletedIPCm245All>]],[[<ore:ingotMECm247All>,<ore:ingotDepletedMECm247All>],[<ore:ingotVHECm247All>,<ore:ingotDepletedVHECm247All>],[<ore:ingotXECm247All>,<ore:ingotDepletedXECm247All>],[<ore:ingotSECm247All>,<ore:ingotDepletedSECm247All>],[<ore:ingotUECm247All>,<ore:ingotDepletedUECm247All>],[<ore:ingotWGCm247All>,<ore:ingotDepletedWGCm247All>],[<ore:ingotIPCm247All>,<ore:ingotDepletedIPCm247All>]],[[<ore:ingotMEB248All>,<ore:ingotDepletedMEB248All>],[<ore:ingotVHEB248All>,<ore:ingotDepletedVHEB248All>],[<ore:ingotXEB248All>,<ore:ingotDepletedXEB248All>],[<ore:ingotSEB248All>,<ore:ingotDepletedSEB248All>],[<ore:ingotUEB248All>,<ore:ingotDepletedUEB248All>],[<ore:ingotWGB248All>,<ore:ingotDepletedWGB248All>],[<ore:ingotIPB248All>,<ore:ingotDepletedIPB248All>]],[[<ore:ingotMECf249All>,<ore:ingotDepletedMECf249All>],[<ore:ingotVHECf249All>,<ore:ingotDepletedVHECf249All>],[<ore:ingotXECf249All>,<ore:ingotDepletedXECf249All>],[<ore:ingotSECf249All>,<ore:ingotDepletedSECf249All>],[<ore:ingotUECf249All>,<ore:ingotDepletedUECf249All>],[<ore:ingotWGCf249All>,<ore:ingotDepletedWGCf249All>],[<ore:ingotIPCf249All>,<ore:ingotDepletedIPCf249All>]],[[<ore:ingotMECf251All>,<ore:ingotDepletedMECf251All>],[<ore:ingotVHECf251All>,<ore:ingotDepletedVHECf251All>],[<ore:ingotXECf251All>,<ore:ingotDepletedXECf251All>],[<ore:ingotSECf251All>,<ore:ingotDepletedSECf251All>],[<ore:ingotUECf251All>,<ore:ingotDepletedUECf251All>],[<ore:ingotWGCf251All>,<ore:ingotDepletedWGCf251All>],[<ore:ingotIPCf251All>,<ore:ingotDepletedIPCf251All>]],[[<ore:ingotMECf253All>,<ore:ingotDepletedMECf253All>],[<ore:ingotVHECf253All>,<ore:ingotDepletedVHECf253All>],[<ore:ingotXECf253All>,<ore:ingotDepletedXECf253All>],[<ore:ingotSECf253All>,<ore:ingotDepletedSECf253All>],[<ore:ingotUECf253All>,<ore:ingotDepletedUECf253All>],[<ore:ingotWGCf253All>,<ore:ingotDepletedWGCf253All>],[<ore:ingotIPCf253All>,<ore:ingotDepletedIPCf253All>]],[[<ore:ingotMEE254All>,<ore:ingotDepletedMEE254All>],[<ore:ingotVHEE254All>,<ore:ingotDepletedVHEE254All>],[<ore:ingotXEE254All>,<ore:ingotDepletedXEE254All>],[<ore:ingotSEE254All>,<ore:ingotDepletedSEE254All>],[<ore:ingotUEE254All>,<ore:ingotDepletedUEE254All>],[<ore:ingotWGE254All>,<ore:ingotDepletedWGE254All>],[<ore:ingotIPE254All>,<ore:ingotDepletedIPE254All>]]] as IOreDictEntry[][][];

for enr in enrich{
	for iso in isos{
		var entry = "ingot"~enr~iso~"All";
		oreDict.entry;
		entry = "ingotDepleted"~enr~iso~"All";
		oreDict.entry;
	}
}

enrich= ["me","vhe","xe","se","ue","wg","ip"] as string[];
isos= ["u_233","u_235","n_236","p_239","p_241","a_242","cm_243","cm_245","cm_247","b_248","cf_249","cf_251","cf_253","e_254"] as string[];

val fisFertFinder = {
	"u_233" : ["u233","u238"],
	"u_235" : ["u235","u238"],
	"n_236" : ["np236","np237"],
	"p_239" : ["pu239","pu242"],
	"p_241" : ["pu241","pu242"],
	"a_242" : ["am242","am243"],
	"cm_243" : ["cm243","cm246"],
	"cm_245" : ["cm245","cm246"],
	"cm_247" : ["cm247","cm246"],
	"b_248" : ["bk248","bk247"],
	"cf_249" : ["cf249","cf252"],
	"cf_251" : ["cf251","cf252"],
	"cf_253" : ["cf253","cf252"],
	"e_254" : ["es254","es255"]
} as string[][string];

val isoFinder = {
	"sr90" : [<ore:dustStrontium90>,<ore:dustStrontium90>,<ore:dustStrontium90>,<ore:dustStrontium90>,<ore:dustStrontium90>],
	"mo99" : [<ore:dustMolybdenum>,<ore:dustMolybdenum>,<ore:dustMolybdenum>,<ore:dustMolybdenum>,<ore:dustMolybdenum>],
	"ru106" : [<ore:dustRuthenium106>,<ore:dustRuthenium106>,<ore:dustRuthenium106>,<ore:dustRuthenium106>,<ore:dustRuthenium106>],
	"cs137" : [<ore:dustCaesium137>,<ore:dustCaesium137>,<ore:dustCaesium137>,<ore:dustCaesium137>,<ore:dustCaesium137>],
	"pm147" : [<ore:dustPromethium147>,<ore:dustPromethium147>,<ore:dustPromethium147>,<ore:dustPromethium147>,<ore:dustPromethium147>],
	"eu155" : [<ore:dustEuropium155>,<ore:dustEuropium155>,<ore:dustEuropium155>,<ore:dustEuropium155>,<ore:dustEuropium155>],
	"u233" : [<nuclearcraft:uranium:0>,<nuclearcraft:uranium:1>,<nuclearcraft:uranium:2>,<nuclearcraft:uranium:3>,<nuclearcraft:uranium:4>],
	"u235" : [<nuclearcraft:uranium:5>,<nuclearcraft:uranium:6>,<nuclearcraft:uranium:7>,<nuclearcraft:uranium:8>,<nuclearcraft:uranium:9>],
	"u238" : [<nuclearcraft:uranium:10>,<nuclearcraft:uranium:11>,<nuclearcraft:uranium:12>,<nuclearcraft:uranium:13>,<nuclearcraft:uranium:14>],
	"np236" : [<nuclearcraft:neptunium:0>,<nuclearcraft:neptunium:1>,<nuclearcraft:neptunium:2>,<nuclearcraft:neptunium:3>,<nuclearcraft:neptunium:4>],
	"np237" : [<nuclearcraft:neptunium:5>,<nuclearcraft:neptunium:6>,<nuclearcraft:neptunium:7>,<nuclearcraft:neptunium:8>,<nuclearcraft:neptunium:9>],
	"pu238" : [<nuclearcraft:plutonium:0>,<nuclearcraft:plutonium:1>,<nuclearcraft:plutonium:2>,<nuclearcraft:plutonium:3>,<nuclearcraft:plutonium:4>],
	"pu239" : [<nuclearcraft:plutonium:5>,<nuclearcraft:plutonium:6>,<nuclearcraft:plutonium:7>,<nuclearcraft:plutonium:8>,<nuclearcraft:plutonium:9>],
	"pu241" : [<nuclearcraft:plutonium:10>,<nuclearcraft:plutonium:11>,<nuclearcraft:plutonium:12>,<nuclearcraft:plutonium:13>,<nuclearcraft:plutonium:14>],
	"pu242" : [<nuclearcraft:plutonium:15>,<nuclearcraft:plutonium:16>,<nuclearcraft:plutonium:17>,<nuclearcraft:plutonium:18>,<nuclearcraft:plutonium:19>],
	"am241" : [<nuclearcraft:americium:0>,<nuclearcraft:americium:1>,<nuclearcraft:americium:2>,<nuclearcraft:americium:3>,<nuclearcraft:americium:4>],
	"am242" : [<nuclearcraft:americium:5>,<nuclearcraft:americium:6>,<nuclearcraft:americium:7>,<nuclearcraft:americium:8>,<nuclearcraft:americium:9>],
	"am243" : [<nuclearcraft:americium:10>,<nuclearcraft:americium:11>,<nuclearcraft:americium:12>,<nuclearcraft:americium:13>,<nuclearcraft:americium:14>],
	"cm243" : [<nuclearcraft:curium:0>,<nuclearcraft:curium:1>,<nuclearcraft:curium:2>,<nuclearcraft:curium:3>,<nuclearcraft:curium:4>],
	"cm245" : [<nuclearcraft:curium:5>,<nuclearcraft:curium:6>,<nuclearcraft:curium:7>,<nuclearcraft:curium:8>,<nuclearcraft:curium:9>],
	"cm246" : [<nuclearcraft:curium:10>,<nuclearcraft:curium:11>,<nuclearcraft:curium:12>,<nuclearcraft:curium:13>,<nuclearcraft:curium:14>],
	"cm247" : [<nuclearcraft:curium:15>,<nuclearcraft:curium:16>,<nuclearcraft:curium:17>,<nuclearcraft:curium:18>,<nuclearcraft:curium:19>],
	"bk247" : [<nuclearcraft:berkelium:0>,<nuclearcraft:berkelium:1>,<nuclearcraft:berkelium:2>,<nuclearcraft:berkelium:3>,<nuclearcraft:berkelium:4>],
	"bk248" : [<nuclearcraft:berkelium:5>,<nuclearcraft:berkelium:6>,<nuclearcraft:berkelium:7>,<nuclearcraft:berkelium:8>,<nuclearcraft:berkelium:9>],
	"cf249" : [<nuclearcraft:californium:0>,<nuclearcraft:californium:1>,<nuclearcraft:californium:2>,<nuclearcraft:californium:3>,<nuclearcraft:californium:4>],
	"cf250" : [<nuclearcraft:californium:5>,<nuclearcraft:californium:6>,<nuclearcraft:californium:7>,<nuclearcraft:californium:8>,<nuclearcraft:californium:9>],
	"cf251" : [<nuclearcraft:californium:10>,<nuclearcraft:californium:11>,<nuclearcraft:californium:12>,<nuclearcraft:californium:13>,<nuclearcraft:californium:14>],
	"cf252" : [<nuclearcraft:californium:15>,<nuclearcraft:californium:16>,<nuclearcraft:californium:17>,<nuclearcraft:californium:18>,<nuclearcraft:californium:19>],
	"cf253" : [<contenttweaker:californium53>,<contenttweaker:californium53carbide>,<contenttweaker:californium53oxide>,<contenttweaker:californium53nitride>,<contenttweaker:californium53zirconium>],
	"cf254" : [<contenttweaker:californium54>,<contenttweaker:californium54carbide>,<contenttweaker:californium54oxide>,<contenttweaker:californium54nitride>,<contenttweaker:californium54zirconium>],
	"es254" : [<contenttweaker:einsteinium54>,<contenttweaker:einsteinium54carbide>,<contenttweaker:einsteinium54oxide>,<contenttweaker:einsteinium54nitride>,<contenttweaker:einsteinium54zirconium>],
	"es255" : [<contenttweaker:einsteinium55>,<contenttweaker:einsteinium55carbide>,<contenttweaker:einsteinium55oxide>,<contenttweaker:einsteinium55nitride>,<contenttweaker:einsteinium55zirconium>],
	"fm257" : [<contenttweaker:fermium57>,<contenttweaker:fermium57carbide>,<contenttweaker:fermium57oxide>,<contenttweaker:fermium57nitride>,<contenttweaker:fermium57zirconium>]
} as IIngredient[][string];

val liquidFinder = {
	"sr90" : <fluid:strontium_90>,
	"mo99" : <fluid:molybdenum>,
	"ru106" : <fluid:ruthenium_106>,
	"cs137" : <fluid:caesium_137>,
	"pm147" : <fluid:promethium_147>,
	"eu155" : <fluid:europium_155>,
	"u233" : <fluid:uranium_233>,
	"u235" : <fluid:uranium_235>,
	"u238" : <fluid:uranium_238>,
	"np236" : <fluid:neptunium_236>,
	"np237" : <fluid:neptunium_237>,
	"pu238" : <fluid:plutonium_238>,
	"pu239" : <fluid:plutonium_239>,
	"pu241" : <fluid:plutonium_241>,
	"pu242" : <fluid:plutonium_242>,
	"am241" : <fluid:americium_241>,
	"am242" : <fluid:americium_242>,
	"am243" : <fluid:americium_243>,
	"cm243" : <fluid:curium_243>,
	"cm245" : <fluid:curium_245>,
	"cm246" : <fluid:curium_246>,
	"cm247" : <fluid:curium_247>,
	"bk247" : <fluid:berkelium_247>,
	"bk248" : <fluid:berkelium_248>,
	"cf249" : <fluid:californium_249>,
	"cf250" : <fluid:californium_250>,
	"cf251" : <fluid:californium_251>,
	"cf252" : <fluid:californium_252>,
	"cf253" : <fluid:californium_253>,
	"cf254" : <fluid:californium_254>,
	"es254" : <fluid:einsteinium_254>,
	"es255" : <fluid:einsteinium_255>,
	"fm257" : <fluid:fermium_257>
} as ILiquidStack[string];

var radFinder = {
	"sr90" : 3.47E-02,
	"mo99" : 0.0,
	"ru106" : 9.77E-01,
	"cs137" : 3.31E-02,
	"pm147" : 3.81E-01,
	"eu155" : 2.10E-01,
	"u233" : 6.25E-06,
	"u235" : 1.42E-09,
	"u238" : 2.24E-10,
	"np236" : 6.49E-06,
	"np237" : 4.66E-07,
	"pu238" : 1.14E-02,
	"pu239" : 4.15E-05,
	"pu241" : 6.98E-02,
	"pu242" : 2.67E-06,
	"am241" : 2.31E-03,
	"am242" : 0.007092198582,
	"am243" : 0.0001356852103,
	"cm243" : 3.44E-02,
	"cm245" : 1.18E-04,
	"cm246" : 2.11E-04,
	"cm247" : 6.41E-08,
	"bk247" : 0.0007246376812,
	"bk248" : 0.1111111111,
	"cf249" : 0.002849002849,
	"cf250" : 0.07645259939,
	"cf251" : 0.001111111111,
	"cf252" : 0.3780718336,
	"cf253" : 20.50814149,
	"cf254" : 6.037190083,
	"es254" : 1.324809576,
	"es255" : 9.177135678,
	"fm257" : 3.634328358
} as double[string];

// MRR Compat
if (oreDict has "QuantumTraverseIHaveHadEnoughOfYourSpaghettiCodeAndAbsurdNames") {
radFinder = {
	"sr90" : 1.74E-02,
	"mo99" : 0.0,
	"ru106" : 4.88E-01,
	"cs137" : 4.81E-02,
	"pm147" : 1.91E-01,
	"eu155" : 2.85E-01,
	"u233" : 1.78E-05,
	"u235" : 1.07E-08,
	"u238" : 1.25E-09,
	"np236" : 1.62E-05,
	"np237" : 1.27E-06,
	"pu238" : 3.30E-03,
	"pu239" : 5.35E-05,
	"pu241" : 3.50E-02,
	"pu242" : 6.25E-07,
	"am241" : 2.34E-03,
	"am242" : 6.86E-03,
	"am243" : 3.02E-04,
	"cm243" : 4.00E-02,
	"cm245" : 1.76E-04,
	"cm246" : 4.16E-05,
	"cm247" : 2.43E-07,
	"bk247" : 1.42E-03,
	"bk248" : 8.89E-02,
	"cf249" : 2.92E-03,
	"cf250" : 1.78E-02,
	"cf251" : 1.73E-03,
	"cf252" : 1.04E+00,
	"cf253" : 3.49E+00,
	"cf254" : 9.07E+00,
	"es254" : 1.52E+00,
	"es255" : 2.63E+00,
	"fm257" : 1.46E+00
} as double[string];
}

val repIsoFinder = {
	"meu_233" : ["u238","pu239","pu242","am243","sr90","cs137"],
	"vheu_233" : ["u238","pu242","am242","am243","sr90","cs137"],
	"xeu_233" : ["u235","u238","np237","pu242","sr90","cs137"],
	"seu_233" : ["u235","u238","np237","pu241","sr90","cs137"],
	"ueu_233" : ["u235","u238","np237","pu239","sr90","cs137"],
	"wgu_233" : ["u235","u238","np236","np237","sr90","cs137"],
	"ipu_233" : ["u235","u238","np236","np237","sr90","cs137"],
	"meu_235" : ["u238","np237","pu242","am243","mo99","cs137"],
	"vheu_235" : ["u238","np236","np237","pu242","mo99","cs137"],
	"xeu_235" : ["u238","np237","pu239","pu242","mo99","cs137"],
	"seu_235" : ["u238","np237","pu239","pu241","mo99","cs137"],
	"ueu_235" : ["u238","np237","pu239","pu241","mo99","cs137"],
	"wgu_235" : ["u238","np236","np237","pu241","mo99","cs137"],
	"ipu_235" : ["u238","np236","np237","pu239","mo99","cs137"],
	"men_236" : ["u238","np237","pu241","pu242","mo99","cs137"],
	"vhen_236" : ["u238","np237","pu239","pu242","mo99","cs137"],
	"xen_236" : ["u238","np237","pu239","pu242","mo99","cs137"],
	"sen_236" : ["u238","np237","pu238","pu242","mo99","cs137"],
	"uen_236" : ["u238","np237","pu239","pu241","mo99","cs137"],
	"wgn_236" : ["u238","np237","pu239","pu241","mo99","cs137"],
	"ipn_236" : ["u238","np237","pu238","pu239","mo99","cs137"],
	"mep_239" : ["pu242","am242","am243","cm246","sr90","pm147"],
	"vhep_239" : ["pu241","pu242","am243","cm243","sr90","pm147"],
	"xep_239" : ["pu241","pu242","am243","cm243","sr90","pm147"],
	"sep_239" : ["pu241","pu242","am242","am243","sr90","pm147"],
	"uep_239" : ["pu241","pu242","am242","am243","sr90","pm147"],
	"wgp_239" : ["pu241","pu242","am242","am243","sr90","pm147"],
	"ipp_239" : ["pu241","pu242","am242","am243","sr90","pm147"],
	"mep_241" : ["pu242","am243","cm246","bk247","sr90","pm147"],
	"vhep_241" : ["am241","am242","am243","cm246","sr90","pm147"],
	"xep_241" : ["pu242","am242","am243","cm246","sr90","pm147"],
	"sep_241" : ["pu242","am242","am243","cm246","sr90","pm147"],
	"uep_241" : ["pu242","am242","am243","cm243","sr90","pm147"],
	"wgp_241" : ["pu242","am241","am242","am243","sr90","pm147"],
	"ipp_241" : ["pu242","am241","am242","am243","sr90","pm147"],
	"mea_242" : ["am243","cm245","cm246","bk248","mo99","pm147"],
	"vhea_242" : ["am243","cm246","cm247","bk247","mo99","pm147"],
	"xea_242" : ["am243","cm243","cm246","cm247","mo99","pm147"],
	"sea_242" : ["am243","cm243","cm245","cm246","mo99","pm147"],
	"uea_242" : ["am243","cm243","cm245","cm246","mo99","pm147"],
	"wga_242" : ["am243","cm243","cm245","cm246","mo99","pm147"],
	"ipa_242" : ["am243","cm243","cm245","cm246","mo99","pm147"],
	"mecm_243" : ["cm246","cm247","bk247","bk248","mo99","pm147"],
	"vhecm_243" : ["cm245","cm246","bk247","bk248","mo99","pm147"],
	"xecm_243" : ["cm245","cm246","bk247","bk248","mo99","pm147"],
	"secm_243" : ["cm245","cm246","bk247","bk248","mo99","pm147"],
	"uecm_243" : ["cm245","cm246","bk247","bk248","mo99","pm147"],
	"wgcm_243" : ["cm245","cm246","bk247","bk248","mo99","pm147"],
	"ipcm_243" : ["cm245","cm246","cm247","bk248","mo99","pm147"],
	"mecm_245" : ["cm246","cm247","bk247","cf249","mo99","eu155"],
	"vhecm_245" : ["cm246","cm247","bk247","cf249","mo99","eu155"],
	"xecm_245" : ["cm246","cm247","bk247","cf249","mo99","eu155"],
	"secm_245" : ["cm246","cm247","bk247","bk248","mo99","eu155"],
	"uecm_245" : ["cm246","cm247","bk247","bk248","mo99","eu155"],
	"wgcm_245" : ["cm246","cm247","bk247","bk248","mo99","eu155"],
	"ipcm_245" : ["cm246","cm247","bk247","bk248","mo99","eu155"],
	"mecm_247" : ["cm246","bk247","bk248","cf249","mo99","eu155"],
	"vhecm_247" : ["bk247","bk248","cf249","cf251","mo99","eu155"],
	"xecm_247" : ["bk247","bk248","cf249","cf251","mo99","eu155"],
	"secm_247" : ["bk247","bk248","cf249","cf251","mo99","eu155"],
	"uecm_247" : ["bk247","bk248","cf249","cf251","mo99","eu155"],
	"wgcm_247" : ["bk247","bk248","cf249","cf251","mo99","eu155"],
	"ipcm_247" : ["bk247","bk248","cf249","cf252","mo99","eu155"],
	"meb_248" : ["bk247","bk248","cf249","cf252","ru106","pm147"],
	"vheb_248" : ["bk248","cf249","cf251","cf252","ru106","pm147"],
	"xeb_248" : ["bk248","cf249","cf251","cf252","ru106","pm147"],
	"seb_248" : ["bk248","cf249","cf251","cf252","ru106","pm147"],
	"ueb_248" : ["bk248","cf249","cf251","cf252","ru106","pm147"],
	"wgb_248" : ["bk248","cf249","cf251","cf252","ru106","pm147"],
	"ipb_248" : ["bk248","cf249","cf251","cf252","ru106","pm147"],
	"mecf_249" : ["cf251","cf252","cf252","cf252","ru106","pm147"],
	"vhecf_249" : ["cf251","cf252","cf252","cf252","ru106","pm147"],
	"xecf_249" : ["cf252","cf252","cf252","cf253","ru106","pm147"],
	"secf_249" : ["cf251","cf252","cf252","cf253","ru106","pm147"],
	"uecf_249" : ["cf250","cf252","cf252","cf253","ru106","pm147"],
	"wgcf_249" : ["cf250","cf251","cf252","cf253","ru106","pm147"],
	"ipcf_249" : ["cf250","cf251","cf252","cf253","ru106","pm147"],
	"mecf_251" : ["cf252","cf252","cf252","cf253","ru106","eu155"],
	"vhecf_251" : ["cf252","cf252","cf252","cf253","ru106","eu155"],
	"xecf_251" : ["cf252","cf252","cf252","cf253","ru106","eu155"],
	"secf_251" : ["cf252","cf252","cf253","es254","ru106","eu155"],
	"uecf_251" : ["cf252","cf252","cf253","es254","ru106","eu155"],
	"wgcf_251" : ["cf252","cf252","cf253","cf254","ru106","eu155"],
	"ipcf_251" : ["cf252","cf252","cf253","cf254","ru106","eu155"],
	"mecf_253" : ["cf252","cf252","es254","es255","cs137","pm147"],
	"vhecf_253" : ["cf252","cf254","es254","es255","cs137","pm147"],
	"xecf_253" : ["cf252","cf253","es254","es255","cs137","pm147"],
	"secf_253" : ["cf252","cf253","es254","es255","cs137","pm147"],
	"uecf_253" : ["cf253","es254","es255","es255","cs137","pm147"],
	"wgcf_253" : ["cf254","es254","es255","es255","cs137","pm147"],
	"ipcf_253" : ["cf254","es254","es254","es255","cs137","pm147"],
	"mee_254" : ["es255","es255","es255","fm257","cs137","pm147"],
	"vhee_254" : ["es255","es255","es255","fm257","cs137","pm147"],
	"xee_254" : ["es255","es255","es255","fm257","cs137","pm147"],
	"see_254" : ["es255","es255","es255","fm257","cs137","pm147"],
	"uee_254" : ["es255","es255","fm257","fm257","cs137","pm147"],
	"wge_254" : ["es255","es255","fm257","fm257","cs137","pm147"],
	"ipe_254" : ["es255","es255","fm257","fm257","cs137","pm147"],
} as string[][string];

val repIsoCountFinder = {
	"meu_233" : [4,1,3,1,2],
	"vheu_233" : [2,2,3,1,2],
	"xeu_233" : [1,1,2,2,4],
	"seu_233" : [2,1,3,1,2],
	"ueu_233" : [2,1,1,1,4],
	"wgu_233" : [1,1,1,3,3],
	"ipu_233" : [1,1,1,1,4],
	"meu_235" : [3,2,3,1,2],
	"vheu_235" : [2,1,3,2,2],
	"xeu_235" : [2,1,1,2,4],
	"seu_235" : [2,1,3,1,2],
	"ueu_235" : [1,1,2,1,4],
	"wgu_235" : [1,1,3,1,2],
	"ipu_235" : [1,1,1,1,4],
	"men_236" : [4,1,3,1,2],
	"vhen_236" : [3,1,1,3,3],
	"xen_236" : [3,1,1,1,4],
	"sen_236" : [3,2,1,3,3],
	"uen_236" : [1,2,1,1,4],
	"wgn_236" : [1,3,1,1,1],
	"ipn_236" : [1,1,1,1,4],
	"mep_239" : [4,1,3,1,2],
	"vhep_239" : [1,2,5,1,2],
	"xep_239" : [1,1,3,1,4],
	"sep_239" : [1,1,1,5,3],
	"uep_239" : [1,1,1,2,4],
	"wgp_239" : [1,1,1,3,3],
	"ipp_239" : [1,1,1,1,4],
	"mep_241" : [4,1,3,1,2],
	"vhep_241" : [1,2,3,2,2],
	"xep_241" : [1,2,1,2,4],
	"sep_241" : [1,3,1,2,1],
	"uep_241" : [1,1,1,2,4],
	"wgp_241" : [1,1,1,3,3],
	"ipp_241" : [1,1,1,1,4],
	"mea_242" : [3,1,5,1,2],
	"vhea_242" : [2,5,1,1,1],
	"xea_242" : [2,1,2,1,4],
	"sea_242" : [3,1,1,2,0],
	"uea_242" : [1,1,1,2,4],
	"wga_242" : [1,1,1,3,3],
	"ipa_242" : [1,1,1,1,4],
	"mecm_243" : [3,3,2,1,1],
	"vhecm_243" : [1,5,2,1,1],
	"xecm_243" : [1,2,2,1,4],
	"secm_243" : [1,3,2,1,1],
	"uecm_243" : [1,1,2,1,4],
	"wgcm_243" : [1,1,3,1,2],
	"ipcm_243" : [1,1,1,1,4],
	"mecm_245" : [4,1,3,1,2],
	"vhecm_245" : [5,1,2,1,0],
	"xecm_245" : [2,1,2,1,4],
	"secm_245" : [3,1,2,1,0],
	"uecm_245" : [1,1,2,1,4],
	"wgcm_245" : [1,1,3,1,2],
	"ipcm_245" : [1,1,1,1,4],
	"mecm_247" : [3,5,1,1,1],
	"vhecm_247" : [3,3,1,1,1],
	"xecm_247" : [3,1,1,1,4],
	"secm_247" : [5,1,1,1,0],
	"uecm_247" : [2,1,1,1,4],
	"wgcm_247" : [3,1,1,1,0],
	"ipcm_247" : [1,1,1,1,4],
	"meb_248" : [3,1,5,1,2],
	"vheb_248" : [1,1,2,5,3],
	"xeb_248" : [1,1,2,2,4],
	"seb_248" : [1,1,3,2,2],
	"ueb_248" : [1,1,1,2,4],
	"wgb_248" : [1,1,1,3,3],
	"ipb_248" : [1,1,1,1,4],
	"mecf_249" : [1,2,5,2,2],
	"vhecf_249" : [1,2,3,2,2],
	"xecf_249" : [1,2,2,1,4],
	"secf_249" : [1,2,3,1,2],
	"uecf_249" : [1,2,1,1,4],
	"wgcf_249" : [1,1,3,1,2],
	"ipcf_249" : [1,1,1,1,4],
	"mecf_251" : [2,2,3,2,2],
	"vhecf_251" : [2,1,3,2,2],
	"xecf_251" : [1,1,1,3,4],
	"secf_251" : [1,3,2,1,1],
	"uecf_251" : [1,1,2,1,4],
	"wgcf_251" : [1,3,1,1,1],
	"ipcf_251" : [1,1,1,1,4],
	"mecf_253" : [2,3,2,2,1],
	"vhecf_253" : [2,1,1,5,3],
	"xecf_253" : [1,1,2,2,4],
	"secf_253" : [1,1,1,5,3],
	"uecf_253" : [1,1,1,2,4],
	"wgcf_253" : [1,3,1,1,1],
	"ipcf_253" : [1,1,1,1,4],
	"mee_254" : [2,2,1,3,3],
	"vhee_254" : [1,1,3,3,2],
	"xee_254" : [1,1,1,3,4],
	"see_254" : [1,1,1,5,3],
	"uee_254" : [1,1,1,2,4],
	"wge_254" : [1,1,1,3,3],
	"ipe_254" : [1,1,1,1,4]
} as int[][string];



val posEnr = [2,4,5,6,7,8,9] as int[];
val posEnr2 = [2.0,4.0,5.0,6.0,7.0,8.0,9.0] as double[];

for j,isotopic in isos{
	for i,enri in posEnr{
		var fissProdChancer = [25,25] as int[];
		var fissProdDouble = [0.25,0.25] as double[];
		if(j>=7){
			fissProdChancer = [30,20] as int[];
			fissProdDouble = [0.30,0.20] as double[];
		}

		//fis/fert/pellet is [normal,carbide,oxide,nitride,za]
		val fis = isoFinder[fisFertFinder[isos[j]][0]];
		val fert = isoFinder[fisFertFinder[isos[j]][1]];
		val rad = (posEnr2[i]*radFinder[fisFertFinder[isos[j]][0]]+(9.0-posEnr2[i])*radFinder[fisFertFinder[isos[j]][1]])/9.0;

		// reprocessing time
		val affectedReprocessing = repIsoCountFinder[enrich[i]~isos[j]][4] as int;
		var multipliers = [repIsoCountFinder[enrich[i]~isos[j]][0],repIsoCountFinder[enrich[i]~isos[j]][1],repIsoCountFinder[enrich[i]~isos[j]][2],repIsoCountFinder[enrich[i]~isos[j]][3]] as double[];
		if(affectedReprocessing!=4){
			multipliers[affectedReprocessing] = multipliers[affectedReprocessing]/2.0;
		}
		val drad = (multipliers[0]*radFinder[repIsoFinder[enrich[i]~isos[j]][0]]+multipliers[1]*radFinder[repIsoFinder[enrich[i]~isos[j]][1]]+multipliers[2]*radFinder[repIsoFinder[enrich[i]~isos[j]][2]]+multipliers[3]*radFinder[repIsoFinder[enrich[i]~isos[j]][3]]+fissProdDouble[0]*posEnr2[i]*radFinder[repIsoFinder[enrich[i]~isos[j]][4]]+fissProdDouble[1]*posEnr2[i]*radFinder[repIsoFinder[enrich[i]~isos[j]][5]])/9.0;
		val burnrad = (rad+drad)/64.0;

		//prods is 4 actinides, 2 fission products as liquids
		var intMultipliers = [16*repIsoCountFinder[enrich[i]~isos[j]][0],16*repIsoCountFinder[enrich[i]~isos[j]][1],16*repIsoCountFinder[enrich[i]~isos[j]][2],16*repIsoCountFinder[enrich[i]~isos[j]][3]] as int[];
		if(affectedReprocessing!=4){
			intMultipliers[affectedReprocessing] = intMultipliers[affectedReprocessing]/2;
		}
		val prods = [liquidFinder[repIsoFinder[enrich[i]~isos[j]][0]]*intMultipliers[0],liquidFinder[repIsoFinder[enrich[i]~isos[j]][1]]*intMultipliers[1],liquidFinder[repIsoFinder[enrich[i]~isos[j]][2]]*intMultipliers[2],liquidFinder[repIsoFinder[enrich[i]~isos[j]][3]]*intMultipliers[3],liquidFinder[repIsoFinder[enrich[i]~isos[j]][4]],liquidFinder[repIsoFinder[enrich[i]~isos[j]][5]]] as ILiquidStack[];
		//solidProd is 4 actinides, 2 fission products as items
		intMultipliers = [repIsoCountFinder[enrich[i]~isos[j]][0],repIsoCountFinder[enrich[i]~isos[j]][1],repIsoCountFinder[enrich[i]~isos[j]][2],repIsoCountFinder[enrich[i]~isos[j]][3]] as int[];
		val sprod = [[isoFinder[repIsoFinder[enrich[i]~isos[j]][0]][1]*intMultipliers[0],isoFinder[repIsoFinder[enrich[i]~isos[j]][1]][1]*intMultipliers[1],isoFinder[repIsoFinder[enrich[i]~isos[j]][2]][1]*intMultipliers[2],isoFinder[repIsoFinder[enrich[i]~isos[j]][3]][1]*intMultipliers[3],isoFinder[repIsoFinder[enrich[i]~isos[j]][4]][1],isoFinder[repIsoFinder[enrich[i]~isos[j]][5]][1]], [isoFinder[repIsoFinder[enrich[i]~isos[j]][0]][2]*intMultipliers[0],isoFinder[repIsoFinder[enrich[i]~isos[j]][1]][2]*intMultipliers[1],isoFinder[repIsoFinder[enrich[i]~isos[j]][2]][2]*intMultipliers[2],isoFinder[repIsoFinder[enrich[i]~isos[j]][3]][2]*intMultipliers[3],isoFinder[repIsoFinder[enrich[i]~isos[j]][4]][2],isoFinder[repIsoFinder[enrich[i]~isos[j]][5]][2]], [isoFinder[repIsoFinder[enrich[i]~isos[j]][0]][3]*intMultipliers[0],isoFinder[repIsoFinder[enrich[i]~isos[j]][1]][3]*intMultipliers[1],isoFinder[repIsoFinder[enrich[i]~isos[j]][2]][3]*intMultipliers[2],isoFinder[repIsoFinder[enrich[i]~isos[j]][3]][3]*intMultipliers[3],isoFinder[repIsoFinder[enrich[i]~isos[j]][4]][3],isoFinder[repIsoFinder[enrich[i]~isos[j]][5]][3]], [isoFinder[repIsoFinder[enrich[i]~isos[j]][0]][4]*intMultipliers[0],isoFinder[repIsoFinder[enrich[i]~isos[j]][1]][4]*intMultipliers[1],isoFinder[repIsoFinder[enrich[i]~isos[j]][2]][4]*intMultipliers[2],isoFinder[repIsoFinder[enrich[i]~isos[j]][3]][4]*intMultipliers[3],isoFinder[repIsoFinder[enrich[i]~isos[j]][4]][4],isoFinder[repIsoFinder[enrich[i]~isos[j]][5]][4]]] as IIngredient[][];

		var liqLife = fuelLives[j][1] as double;
		liqLife = liqLife/144.0;
		var selfPrimed = false;
		if(j>=10 && i!=6 && j<=11){
			selfPrimed = true;
		}
		if(j==12){
			selfPrimed = true;
		}
		if(j==13 && i<5){
			selfPrimed = true;
		}
		//if(i==2||i==4||i==6){
			theBigCheese(fis, fert, [itemUtils.getItem("contenttweaker:"~enrich[i]~isos[j]),itemUtils.getItem("contenttweaker:"~enrich[i]~isos[j]~'_c'),itemUtils.getItem("contenttweaker:"~enrich[i]~isos[j]~'_ox'),itemUtils.getItem("contenttweaker:"~enrich[i]~isos[j]~'_ni'),itemUtils.getItem("contenttweaker:"~enrich[i]~isos[j]~'_za')], itemUtils.getItem("contenttweaker:"~enrich[i]~isos[j]~'_tr'), [itemUtils.getItem("contenttweaker:d_"~enrich[i]~isos[j]~'_tr'),itemUtils.getItem("contenttweaker:d_"~enrich[i]~isos[j]~'_ox'),itemUtils.getItem("contenttweaker:d_"~enrich[i]~isos[j]~'_ni'),itemUtils.getItem("contenttweaker:d_"~enrich[i]~isos[j]~'_za')], [itemUtils.getItem("contenttweaker:d_"~enrich[i]~isos[j]~'_tr'),itemUtils.getItem("contenttweaker:d_"~enrich[i]~isos[j]~'_ox'),itemUtils.getItem("contenttweaker:d_"~enrich[i]~isos[j]~'_ni'),itemUtils.getItem("contenttweaker:d_"~enrich[i]~isos[j]~'_za')], [[fuelLives[j][0],fuelHeats[j][0]*posEnr[i],criticalities[j][i][0]], [fuelLives[j][1],fuelHeats[j][1]*posEnr[i],criticalities[j][i][1]], [fuelLives[j][2],fuelHeats[j][2]*posEnr[i],criticalities[j][i][2]], [fuelLives[j][3],fuelHeats[j][3]*posEnr[i],criticalities[j][i][3]]], [enri,fissProdChancer[0],fissProdChancer[1], affectedReprocessing], [baseEff[j]+0.025*posEnr2[i],rad,burnrad,drad,liqLife,fuelDecayFactor[j]], array[j][i], prods, sprod, selfPrimed, oreDictStuff[j][i], secretStuff);
		//}
	}
}

//dpellet is [tr, ox, ni, za]

//fuelInts is [time, heat, criticality] for [ox, ni, za]
//integs is [enrichment, fisProd1 chance, fisProd2 chance, affected chance reprocessing ingredient]
//fuelDoubles is [efficiency, base radiation, burn radiation, depleted radiation, MSR time]
