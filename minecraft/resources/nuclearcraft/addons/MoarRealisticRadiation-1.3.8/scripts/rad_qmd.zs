/*
Copyright Bob Bartsch, 2021

This code is governed by the
Creative Commons Attribution–NonCommercial License
https://creativecommons.org/licenses/by-nc/3.0/

(Meaning: credit me if you modify and/or redistribute
this code. Also, you may not sell this code.)
*/

#modloaded qmd

import mods.nuclearcraft.FissionIrradiator;

mods.nuclearcraft.Radiation.setRadiationLevel(<ore:dustBeryllium7>, 5.20e-1);
mods.nuclearcraft.Radiation.setRadiationLevel(<ore:dustSodium22>, 1.17);
mods.nuclearcraft.Radiation.setRadiationLevel(<ore:dustCalcium48>, 4.45e-20);
mods.nuclearcraft.Radiation.setRadiationLevel(<ore:dustCobalt60>, 4.74e-1);
mods.nuclearcraft.Radiation.setRadiationLevel(<ore:dustIridium192>, 3.46);
mods.nuclearcraft.Radiation.setRadiationLevel(<ore:dustProtactinium231>, 1.56e-4);
mods.nuclearcraft.Radiation.setRadiationLevel(<ore:ingotUranium234>, 1.75e-5);
mods.nuclearcraft.Radiation.setRadiationLevel(<ore:ingotCoperniciumAll>, 8.57e-2);

//irradiator stuff
mods.nuclearcraft.FissionIrradiator.removeRecipeWithInput(<ore:ingotCobalt>);
mods.nuclearcraft.FissionIrradiator.addRecipe(<ore:ingotCobalt>, <ore:ingotCobalt60>, 571000, 0.0, 0.0, 0.0);

mods.nuclearcraft.FissionIrradiator.addRecipe(<ore:dustProtactinium233>, <ore:ingotUranium234>, 545000, 0.0, 0.0, 4.35E+00);


if (!(oreDict has "ingotUBU")) {
	mods.nuclearcraft.FissionIrradiator.removeRecipeWithInput(<ore:ingotUranium234>);
	mods.nuclearcraft.FissionIrradiator.addRecipe(<ore:ingotUranium234>, <ore:ingotUranium235>, 215000, 0.0, 0.0, 1.75E-05);
	mods.nuclearcraft.FissionIrradiator.removeRecipeWithInput(<ore:dustProtactinium231>);
	mods.nuclearcraft.FissionIrradiator.addRecipe(<ore:dustProtactinium231>, <ore:dustProtactinium233>, 151000, 0.0, 0.0, 1.56E-04);
} else {
	mods.nuclearcraft.FissionIrradiator.removeRecipeWithInput(<ore:ingotUranium234>);
	mods.nuclearcraft.FissionIrradiator.addRecipe(<ore:ingotUranium234>, <ore:ingotUBU>, 11944, 0.0, 0.0, 1.75E-05);
	mods.nuclearcraft.FissionIrradiator.removeRecipeWithInput(<ore:ingotUBU>);
	mods.nuclearcraft.FissionIrradiator.addRecipe(<ore:ingotUBU>, <ore:ingotUranium235>, 203056, 0.0, 0.0, 1.65E-05);
}