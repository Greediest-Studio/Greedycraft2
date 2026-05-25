/*
Copyright Bob Bartsch, 2021

This code is governed by the
Creative Commons Attribution–NonCommercial License
https://creativecommons.org/licenses/by-nc/3.0/

(Meaning: credit me if you modify and/or redistribute
this code. Also, you may not sell this code.)
*/

#modloaded threng

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

val doubSystemNames = ["fluix_steel"] as string[];
val system1 = [<threng:material>] as IIngredient[];
val system2 = [null] as IIngredient[];
val noNakNames = [<fluid:fluix_steel>] as ILiquidStack[];
val nakNames = [<fluid:fluix_steel_nak>] as ILiquidStack[];

for i,name in doubSystemNames{
	recipes.addShaped(itemUtils.getItem("nuclearcraft:solid_fission_sink_"~name), [[system2[i],system1[i],system2[i]],[system1[i],emptyHeat[0],system1[i]],[system2[i],system1[i],system2[i]]]);
	recipes.addShaped(itemUtils.getItem("nuclearcraft:salt_fission_heater_"~name), [[system2[i],system1[i],system2[i]],[system1[i],emptyHeat[1],system1[i]],[system2[i],system1[i],system2[i]]]);
	recipes.addShaped(itemUtils.getItem("nuclearcraft:fission_heater_port_"~name), [[system2[i],system1[i],system2[i]],[system1[i],emptyHeat[2],system1[i]],[system2[i],system1[i],system2[i]]]);
	mods.nuclearcraft.SaltMixer.addRecipe(noNakNames[i]*144, <fluid:nak>*144, nakNames[i]*144);
	mods.nuclearcraft.Centrifuge.addRecipe(nakNames[i]*144, noNakNames[i]*144, <fluid:nak>*144, null, null, null, null);
	mods.nuclearcraft.Melter.addRecipe(system1[i], noNakNames[i]*144);
mods.nuclearcraft.IngotFormer.addRecipe(noNakNames[i]*144, system1[i]);
}