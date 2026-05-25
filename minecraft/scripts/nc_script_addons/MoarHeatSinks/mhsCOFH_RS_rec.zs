/*
Copyright Bob Bartsch, 2021

This code is governed by the
Creative Commons Attribution–NonCommercial License
https://creativecommons.org/licenses/by-nc/3.0/

(Meaning: credit me if you modify and/or redistribute
this code. Also, you may not sell this code.)
*/

#modloaded redstonearsenal

import crafttweaker.item.IIngredient;
import crafttweaker.item.IItemStack;
import crafttweaker.liquid.ILiquidStack;
import crafttweaker.oredict.IOreDict;
import crafttweaker.oredict.IOreDictEntry;
import mods.nuclearcraft.Infuser;
import mods.nuclearcraft.SaltMixer;
import mods.nuclearcraft.Centrifuge;
import mods.nuclearcraft.Melter;
import mods.nuclearcraft.IngotFormer;

val emptyHeat = [<nuclearcraft:part:14>,<nuclearcraft:salt_fission_heater>,<nuclearcraft:fission_heater_port>] as IItemStack[];

val doubSystemNames = ["fluxed_electrum", "flux_crystal"] as string[];
val system1 = [<ore:ingotElectrumFlux>,<ore:gemCrystalFlux>] as IIngredient[];
val system2 = [null,<ore:gemCrystalFlux>] as IIngredient[];
val noNakNames = [<fluid:fluxed_electrum>,<fluid:flux_crystal>] as ILiquidStack[];
val nakNames = [<fluid:fluxed_electrum_nak>,<fluid:flux_crystal_nak>] as ILiquidStack[];

for i,name in doubSystemNames{
	recipes.addShaped(itemUtils.getItem("nuclearcraft:solid_fission_sink_"~name), [[system2[i],system1[i],system2[i]],[system1[i],emptyHeat[0],system1[i]],[system2[i],system1[i],system2[i]]]);
	recipes.addShaped(itemUtils.getItem("nuclearcraft:salt_fission_heater_"~name), [[system2[i],system1[i],system2[i]],[system1[i],emptyHeat[1],system1[i]],[system2[i],system1[i],system2[i]]]);
	recipes.addShaped(itemUtils.getItem("nuclearcraft:fission_heater_port_"~name), [[system2[i],system1[i],system2[i]],[system1[i],emptyHeat[2],system1[i]],[system2[i],system1[i],system2[i]]]);
}

mods.nuclearcraft.SaltMixer.addRecipe(noNakNames[0]*144, <fluid:nak>*144, nakNames[0]*144);
mods.nuclearcraft.Centrifuge.addRecipe(nakNames[0]*144, noNakNames[0]*144, <fluid:nak>*144, null, null, null, null);
mods.nuclearcraft.SaltMixer.addRecipe(noNakNames[1]*666, <fluid:nak>*144, nakNames[1]*144);
mods.nuclearcraft.Centrifuge.addRecipe(nakNames[1]*144, noNakNames[1]*666, <fluid:nak>*144, null, null, null, null);


mods.nuclearcraft.Melter.addRecipe(system1[0], noNakNames[0]*144);
mods.nuclearcraft.IngotFormer.addRecipe(noNakNames[0]*144, system1[0]);

mods.nuclearcraft.Melter.addRecipe(system1[1], noNakNames[1]*666);
mods.nuclearcraft.IngotFormer.addRecipe(noNakNames[1]*666, system1[1]);