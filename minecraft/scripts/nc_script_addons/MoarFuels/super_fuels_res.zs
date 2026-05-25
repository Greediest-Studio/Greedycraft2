/*
Copyright Bob Bartsch, 2021

This code is governed by the
Creative Commons Attribution–NonCommercial License
https://creativecommons.org/licenses/by-nc/3.0/

(Meaning: credit me if you modify and/or redistribute
this code. Also, you may not sell this code.)
*/



// imports
import crafttweaker.item.IIngredient;
import crafttweaker.item.IItemStack;
import crafttweaker.oredict.IOreDictEntry;
import mods.nuclearcraft.FuelReprocessor;

val graphite = <ore:dustGraphite>;
val zirconium = <ore:dustZirconium>;

/* -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- LE Fuels -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- */
var dFuels = [[<nuclearcraft:depleted_fuel_californium:8>,<nuclearcraft:depleted_fuel_californium:9>,<nuclearcraft:depleted_fuel_californium:10>,<nuclearcraft:depleted_fuel_californium:11>]] as IIngredient[][];

// reprocessing the depleted fuels
var dIso = [[[<nuclearcraft:californium:16> * 2,<nuclearcraft:californium:16> * 2,<nuclearcraft:californium:16> * 2,<contenttweaker:californium53carbide> * 2], [<ore:ingotCalifornium252Oxide>.amount(2),<ore:ingotCalifornium252Oxide>.amount(2),<ore: ingotCalifornium252Oxide>.amount(2),<contenttweaker:californium53oxide> * 2], [<ore:ingotCalifornium252Nitride>.amount(2),<ore:ingotCalifornium252Nitride>.amount(2),<ore:ingotCalifornium252Nitride>.amount(2),<contenttweaker:californium53nitride> * 2], [<nuclearcraft:californium:19> * 2,<nuclearcraft:californium:19> * 2,<nuclearcraft:californium:19> * 2,<contenttweaker:californium53zirconium> * 2]] ] as IIngredient[][][];

var ru = mods.nuclearcraft.ChanceItemIngredient.create(<ore:dustRuthenium106>, 30);
var eu = mods.nuclearcraft.ChanceItemIngredient.create(<ore:dustEuropium155>, 20);

for i,array in dFuels{
	mods.nuclearcraft.FuelReprocessor.removeRecipeWithInput(array[0].amount(9));
	mods.nuclearcraft.FuelReprocessor.removeRecipeWithInput(array[1].amount(9));
	mods.nuclearcraft.FuelReprocessor.removeRecipeWithInput(array[2].amount(9));
	mods.nuclearcraft.FuelReprocessor.removeRecipeWithInput(array[3].amount(9));
	//triso
	mods.nuclearcraft.FuelReprocessor.addRecipe(array[0].amount(9), dIso[i][0][0], dIso[i][0][1], ru, graphite * 3, dIso[i][0][2], dIso[i][0][3], eu, <nuclearcraft:alloy:13>);
	//oxide
	mods.nuclearcraft.FuelReprocessor.addRecipe(array[1].amount(9), dIso[i][1][0], dIso[i][1][1], ru, null, dIso[i][1][2], dIso[i][1][3], eu, null);
	//nitride
	mods.nuclearcraft.FuelReprocessor.addRecipe(array[2].amount(9), dIso[i][2][0], dIso[i][2][1], ru, null, dIso[i][2][2], dIso[i][2][3], eu, null);
	//zirc
	mods.nuclearcraft.FuelReprocessor.addRecipe(array[3].amount(9), dIso[i][3][0], dIso[i][3][1], ru, zirconium, dIso[i][3][2], dIso[i][3][3], eu, null);
}


/* -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- HE Fuels -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- */
dFuels = [[<nuclearcraft:depleted_fuel_californium:12>,<nuclearcraft: depleted_fuel_californium:13>,<nuclearcraft: depleted_fuel_californium:14>,<nuclearcraft: depleted_fuel_californium:15>]] as IIngredient[][];

// reprocessing the depleted fuels
dIso = [[[<nuclearcraft:californium:16> * 2,<nuclearcraft:californium:16>,<nuclearcraft:californium:16>,<contenttweaker:californium53carbide> * 3], [<ore:ingotCalifornium252Oxide>.amount(2),<ore:ingotCalifornium252Oxide>,<ore: ingotCalifornium252Oxide>,<contenttweaker:californium53oxide> * 3], [<ore:ingotCalifornium252Nitride>.amount(2),<ore:ingotCalifornium252Nitride>,<ore: ingotCalifornium252Nitride>,<contenttweaker:californium53nitride> * 3], [<nuclearcraft:californium:19> * 2,<nuclearcraft:californium:19>,<nuclearcraft:californium:19>,<contenttweaker:californium53zirconium> * 3]] ];

ru = mods.nuclearcraft.ChanceItemIngredient.create(<ore:dustRuthenium106>, 90);
eu = mods.nuclearcraft.ChanceItemIngredient.create(<ore:dustEuropium155>, 60);

for i,array in dFuels{
	mods.nuclearcraft.FuelReprocessor.removeRecipeWithInput(array[0].amount(9));
	mods.nuclearcraft.FuelReprocessor.removeRecipeWithInput(array[1].amount(9));
	mods.nuclearcraft.FuelReprocessor.removeRecipeWithInput(array[2].amount(9));
	mods.nuclearcraft.FuelReprocessor.removeRecipeWithInput(array[3].amount(9));
	//triso
	mods.nuclearcraft.FuelReprocessor.addRecipe(array[0].amount(9), dIso[i][0][0], dIso[i][0][1], ru, graphite * 4, dIso[i][0][2], dIso[i][0][3], eu, <nuclearcraft:alloy:13>);
	//oxide
	mods.nuclearcraft.FuelReprocessor.addRecipe(array[1].amount(9), dIso[i][1][0], dIso[i][1][1], ru, null, dIso[i][1][2], dIso[i][1][3], eu, null);
	//nitride
	mods.nuclearcraft.FuelReprocessor.addRecipe(array[2].amount(9), dIso[i][2][0], dIso[i][2][1], ru, null, dIso[i][2][2], dIso[i][2][3], eu, null);
	//zirc
	mods.nuclearcraft.FuelReprocessor.addRecipe(array[3].amount(9), dIso[i][3][0], dIso[i][3][1], ru, zirconium * 2, dIso[i][3][2], dIso[i][3][3], eu, null);
}
