/*
Copyright Bob Bartsch, 2023

This code is governed by the
Creative Commons Attribution–NonCommercial License
https://creativecommons.org/licenses/by-nc/3.0/

(Meaning: credit me if you modify and/or redistribute
this code. Also, you may not sell this code.)
*/

import mods.nuclearcraft.FissionIrradiator;

//neutron sources
mods.nuclearcraft.Radiation.setRadiationLevel(<nuclearcraft:fission_source:0>, 2.41E-04);
mods.nuclearcraft.Radiation.setRadiationLevel(<nuclearcraft:fission_source:1>, 4.58E-06);
mods.nuclearcraft.Radiation.setRadiationLevel(<nuclearcraft:fission_source:2>, 1.18E-01);

//rtgs
mods.nuclearcraft.Radiation.setRadiationLevel(<nuclearcraft:rtg_uranium>, 9.62E-11);
mods.nuclearcraft.Radiation.setRadiationLevel(<nuclearcraft:rtg_plutonium>, 5.51E-04);
mods.nuclearcraft.Radiation.setRadiationLevel(<nuclearcraft:rtg_americium>, 3.90E-04);
mods.nuclearcraft.Radiation.setRadiationLevel(<nuclearcraft:rtg_californium>, 2.23E-03);


//irradiator changes
mods.nuclearcraft.FissionIrradiator.removeRecipeWithInput(<ore:dustBismuth>);
mods.nuclearcraft.FissionIrradiator.addRecipe(<ore:dustBismuth>, <ore:dustPolonium>, 3220000, 0.0, 0.50, 253.0e-24);

if(loadedMods has "trinity"){
	mods.nuclearcraft.FissionIrradiator.removeRecipeWithOutput(<ore:dustGold198>);
	mods.nuclearcraft.FissionIrradiator.addRecipe(<ore:dustGold>|<ore:ingotGold>, <ore:dustGold198>, 214000, 0.0, 0.0, 0.0);
	mods.nuclearcraft.FissionIrradiator.addRecipe(<ore:dustCaesium137>, <ore:dustBarium>, 3099000, 0.0, 0.0, 4.81E-02);
	
	mods.nuclearcraft.Radiation.setRadiationLevel(<ore:dustGold198>, 7.64E+00);
	mods.nuclearcraft.Radiation.setRadiationLevel(<ore:ingotGold198>, 7.64E+00);
}

//irradiator additions
mods.nuclearcraft.FissionIrradiator.addRecipe(<ore:dustStrontium90>, <ore:dustZirconium>, 3314161, 0.0, 0.0, 1.74E-02);
mods.nuclearcraft.FissionIrradiator.addRecipe(<ore:ingotUranium238>, <ore:ingotMIX239>, 867342, 0.25, 0.0, 1.25E-09);
mods.nuclearcraft.FissionIrradiator.addRecipe(<ore:blockUranium238>, <ore:ingotMIX239>*9, 7806078, 2.25, 0.0, 11.25E-09);

mods.nuclearcraft.FissionIrradiator.addRecipe(<ore:ingotMIX239>, <ore:ingotPlutonium239>, 6938658, 0.25, 0.0, 5.94E-06);
mods.nuclearcraft.FissionIrradiator.addRecipe(<forge:bucketfilled>.withTag({FluidName: "hydrogen", Amount: 1000}), <forge:bucketfilled>.withTag({FluidName: "deuterium", Amount: 1000}), 3086000, 0.0, 0.0, 0.0);

// MoarFuels Integration
if (oreDict has "ingotEinsteinium255All") {
	mods.nuclearcraft.Radiation.setRadiationLevel(<ore:ingotCalifornium253All>, 3.49);
	mods.nuclearcraft.Radiation.setRadiationLevel(<ore:ingotCalifornium254All>, 9.07);
	mods.nuclearcraft.Radiation.setRadiationLevel(<ore:ingotEinsteinium254All>, 1.52);
	mods.nuclearcraft.Radiation.setRadiationLevel(<ore:ingotEinsteinium255All>, 2.63);
	mods.nuclearcraft.Radiation.setRadiationLevel(<ore:ingotFermium257All>, 1.46);

	mods.nuclearcraft.Radiation.setRadiationLevel(<ore:ingotLECf253All>, 1.31);
	mods.nuclearcraft.Radiation.setRadiationLevel(<ore:ingotHECf253All>, 1.86);
	mods.nuclearcraft.Radiation.setRadiationLevel(<ore:ingotLEE254All>, 2.51);
	mods.nuclearcraft.Radiation.setRadiationLevel(<ore:ingotHEE254All>, 2.26);
	mods.nuclearcraft.Radiation.setRadiationLevel(<ore:ingotMIX257All>, 1.61);
	
	mods.nuclearcraft.Radiation.setRadiationLevel(<ore:ingotDepletedLECf253All>, 1.39);
	mods.nuclearcraft.Radiation.setRadiationLevel(<ore:ingotDepletedHECf253All>, 2.30);
	mods.nuclearcraft.Radiation.setRadiationLevel(<ore:ingotDepletedLEE254All>, 2.09);
	mods.nuclearcraft.Radiation.setRadiationLevel(<ore:ingotDepletedHEE254All>, 1.67);
	mods.nuclearcraft.Radiation.setRadiationLevel(<ore:ingotDepletedMIX257All>, 5.55e-1);
	mods.nuclearcraft.Radiation.setRadiationLevel(<ore:ingotREP238All>, 3.79E-04);
	mods.nuclearcraft.Radiation.setRadiationLevel(<ore:ingotREA241All>, 1.99E-03);
	mods.nuclearcraft.Radiation.setRadiationLevel(<ore:ingotRECf250All>, 6.95E-01);
	mods.nuclearcraft.Radiation.setRadiationLevel(<ore:ingotDepletedREP238All>, 1.89E-02);
	mods.nuclearcraft.Radiation.setRadiationLevel(<ore:ingotDepletedREA241All>, 8.74E-04);
	mods.nuclearcraft.Radiation.setRadiationLevel(<ore:ingotDepletedRECf250All>, 1.03E+00);
	mods.nuclearcraft.Radiation.setRadiationLevel(<ore:ingotUraniumOxide>, 2.20e-9);
	mods.nuclearcraft.Radiation.setRadiationLevel(<ore:ingotCANDUAll>, 2.20e-9);
	mods.nuclearcraft.Radiation.setRadiationLevel(<ore:ingotDepletedCANDUAll>, 2.11E-03);

	if(loadedMods has "qmd"){
	mods.nuclearcraft.Radiation.setRadiationLevel(<ore:ingotMIX258All>, 4.17e-1);
	mods.nuclearcraft.Radiation.setRadiationLevel(<ore:ingotMIX294All>, 1.16e-6);
	mods.nuclearcraft.Radiation.setRadiationLevel(<ore:ingotMIX298All>, 3.20e-4);
	mods.nuclearcraft.Radiation.setRadiationLevel(<ore:ingotDepletedMIX258All>, 1.01e-2);
	mods.nuclearcraft.Radiation.setRadiationLevel(<ore:ingotDepletedMIX294All>, 1.32e-2);
	mods.nuclearcraft.Radiation.setRadiationLevel(<ore:ingotDepletedMIX298All>, 1.41e-2);
	mods.nuclearcraft.Radiation.setRadiationLevel(<ore:ingotUBUAll>, 1.65E-05);
	mods.nuclearcraft.Radiation.setRadiationLevel(<ore:ingotDepletedUBUAll>, 1.34E-03);
	mods.nuclearcraft.Radiation.setRadiationLevel(<ore:ingotLAM231All>, 1.82E-05);
	mods.nuclearcraft.Radiation.setRadiationLevel(<ore:ingotDepletedLAM231All>, 1.65E-03);
	mods.nuclearcraft.Radiation.setRadiationLevel(<ore:ingotEAM231All>, 5.27E-05);
	mods.nuclearcraft.Radiation.setRadiationLevel(<ore:ingotDepletedEAM231All>, 4.95E-03);
	mods.nuclearcraft.Radiation.setRadiationLevel(<ore:dustActinium227>, 1.27E-01);
	mods.nuclearcraft.Radiation.setRadiationLevel(<ore:ingotThorium229Pure>, 3.30E-04);
	mods.nuclearcraft.Radiation.setRadiationLevel(<ore:ingotThorium229All>, 3.30E-04);
	mods.nuclearcraft.Radiation.setRadiationLevel(<ore:ingotMendelevium258All>, 3.75E+00);
	mods.nuclearcraft.Radiation.setRadiationLevel(<ore:ingotFlerovium298All>, 2.39E-04);
	mods.nuclearcraft.Radiation.setRadiationLevel(<ore:ingotDarmstadtium294All>, 2.41E-07);
	}
	if(loadedMods has "trinity"){
	mods.nuclearcraft.Radiation.setRadiationLevel(<ore:ingotPlutonium236>, 1.11E-03);
	mods.nuclearcraft.Radiation.setRadiationLevel(<ore:ingotPBPAll>, 1.66E-02);
	mods.nuclearcraft.Radiation.setRadiationLevel(<ore:ingotDepletedPBPAll>, 6.16E-03);
	mods.nuclearcraft.FissionIrradiator.removeRecipeWithInput(<ore:ingotPlutonium236>);
	mods.nuclearcraft.FissionIrradiator.addRecipe(<ore:ingotPlutonium236>, <ore:ingotPBP>, 75692, 0.0, 0.0, 1.11E-03);

	mods.nuclearcraft.Radiation.setRadiationLevel(<ore:ingotU233Sphere>, 1.58E-05);
	mods.nuclearcraft.Radiation.setRadiationLevel(<ore:ingotDepletedU233Sphere>, 1.46E-02);
	mods.nuclearcraft.Radiation.setRadiationLevel(<ore:ingotU235Sphere>, 9.51E-09);
	mods.nuclearcraft.Radiation.setRadiationLevel(<ore:ingotDepletedU235Sphere>, 1.07E-02);
	mods.nuclearcraft.Radiation.setRadiationLevel(<ore:ingotN237Sphere>, 1.13E-06);
	mods.nuclearcraft.Radiation.setRadiationLevel(<ore:ingotDepletedN237Sphere>, 2.02E-03);
	mods.nuclearcraft.Radiation.setRadiationLevel(<ore:ingotP239Sphere>, 4.76E-05);
	mods.nuclearcraft.Radiation.setRadiationLevel(<ore:ingotDepletedP239Sphere>, 5.10E-02);
	mods.nuclearcraft.Radiation.setRadiationLevel(<ore:ingotA242Sphere>, 2.68E-04);
	mods.nuclearcraft.Radiation.setRadiationLevel(<ore:ingotDepletedA242Sphere>, 4.47E-02);
	mods.nuclearcraft.Radiation.setRadiationLevel(<ore:ingotCm247Sphere>, 2.16E-07);
	mods.nuclearcraft.Radiation.setRadiationLevel(<ore:ingotDepletedCm247Sphere>, 5.63E-02);
	mods.nuclearcraft.Radiation.setRadiationLevel(<ore:ingotB248Sphere>, 7.90E-02);
	mods.nuclearcraft.Radiation.setRadiationLevel(<ore:ingotDepletedB248Sphere>, 2.90E-01);
	mods.nuclearcraft.Radiation.setRadiationLevel(<ore:ingotCf249Sphere>, 2.60E-03);
	mods.nuclearcraft.Radiation.setRadiationLevel(<ore:ingotDepletedCf249Sphere>, 6.69E-01);
	mods.nuclearcraft.Radiation.setRadiationLevel(<ore:ingotCf251Sphere>, 1.54E-03);
	mods.nuclearcraft.Radiation.setRadiationLevel(<ore:ingotDepletedCf251Sphere>, 1.75E+00);
	}
}