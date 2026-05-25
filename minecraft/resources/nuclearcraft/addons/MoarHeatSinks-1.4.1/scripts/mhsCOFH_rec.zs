/*
Copyright Bob Bartsch, 2021

This code is governed by the
Creative Commons Attribution–NonCommercial License
https://creativecommons.org/licenses/by-nc/3.0/

(Meaning: credit me if you modify and/or redistribute
this code. Also, you may not sell this code.)
*/

#modloaded thermalfoundation

import crafttweaker.item.IIngredient;
import crafttweaker.item.IItemStack;
import crafttweaker.liquid.ILiquidStack;
import mods.nuclearcraft.SaltMixer;
import mods.nuclearcraft.Centrifuge;

val emptyHeat = [<nuclearcraft:part:14>,<nuclearcraft:salt_fission_heater>,<nuclearcraft:fission_heater_port>] as IItemStack[];

//liquid recipes
val liquidHeatSinks = [[<nuclearcraft:solid_fission_sink_pyro>,<nuclearcraft:solid_fission_sink_aero>,<nuclearcraft:solid_fission_sink_petro>],[<nuclearcraft:salt_fission_heater_pyro>,<nuclearcraft:salt_fission_heater_aero>,<nuclearcraft:salt_fission_heater_petro>],[<nuclearcraft:fission_heater_port_pyro>,<nuclearcraft:fission_heater_port_aero>,<nuclearcraft:fission_heater_port_petro>]] as IItemStack[][];
val liquids = [<fluid:pyrotheum>,<fluid:aerotheum>,<fluid:petrotheum>] as IIngredient[];
for i, fluid in liquids{
	mods.nuclearcraft.Infuser.addRecipe(emptyHeat[0], fluid*1000, liquidHeatSinks[0][i]);
	mods.nuclearcraft.Infuser.addRecipe(emptyHeat[1], fluid*1000, liquidHeatSinks[1][i]);
	mods.nuclearcraft.Infuser.addRecipe(emptyHeat[2], fluid*1000, liquidHeatSinks[2][i]);
}

//ingot recipes
val ingotHeatSinks = [[<nuclearcraft:solid_fission_sink_nickel>,<nuclearcraft:solid_fission_sink_platinum>,<nuclearcraft:solid_fission_sink_iridium>,<nuclearcraft:solid_fission_sink_signalum>,<nuclearcraft:solid_fission_sink_lumium>,<nuclearcraft:solid_fission_sink_mana_dust>,<nuclearcraft:solid_fission_sink_mithril>,<nuclearcraft:solid_fission_sink_invar>,<nuclearcraft:solid_fission_sink_constantan>,<nuclearcraft:solid_fission_sink_bronze>,<nuclearcraft:solid_fission_sink_electrum>],[<nuclearcraft:salt_fission_heater_nickel>,<nuclearcraft:salt_fission_heater_platinum>,<nuclearcraft:salt_fission_heater_iridium>,<nuclearcraft:salt_fission_heater_signalum>,<nuclearcraft:salt_fission_heater_lumium>,<nuclearcraft:salt_fission_heater_mana_dust>,<nuclearcraft:salt_fission_heater_mithril>,<nuclearcraft:salt_fission_heater_invar>,<nuclearcraft:salt_fission_heater_constantan>,<nuclearcraft:salt_fission_heater_bronze>,<nuclearcraft:salt_fission_heater_electrum>],[<nuclearcraft:fission_heater_port_nickel>,<nuclearcraft:fission_heater_port_platinum>,<nuclearcraft:fission_heater_port_iridium>,<nuclearcraft:fission_heater_port_signalum>,<nuclearcraft:fission_heater_port_lumium>,<nuclearcraft:fission_heater_port_mana_dust>,<nuclearcraft:fission_heater_port_mithril>,<nuclearcraft:fission_heater_port_invar>,<nuclearcraft:fission_heater_port_constantan>,<nuclearcraft:fission_heater_port_bronze>,<nuclearcraft:fission_heater_port_electrum>]] as IItemStack[][];
val ingots = [<ore:ingotNickel>,<ore:ingotPlatinum>,<ore:ingotIridium>,<ore:ingotSignalum>,<ore:ingotLumium>,<ore:dustMana>,<ore:ingotMithril>,<ore:ingotInvar>,<ore:ingotConstantan>,<ore:ingotBronze>,<ore:ingotElectrum>] as IIngredient[];

for i,ingot in ingots{
	recipes.addShaped(ingotHeatSinks[0][i], [[null,ingot,null],[ingot,emptyHeat[0],ingot],[null,ingot,null]]);
	recipes.addShaped(ingotHeatSinks[1][i], [[null,ingot,null],[ingot,emptyHeat[1],ingot],[null,ingot,null]]);
	recipes.addShaped(ingotHeatSinks[2][i], [[null,ingot,null],[ingot,emptyHeat[2],ingot],[null,ingot,null]]);
}

val noNakNames =  [<fluid:pyrotheum>,<fluid:aerotheum>,<fluid:petrotheum>,<fluid:nickel>,<fluid:platinum>,<fluid:iridium>,<fluid:signalum>,<fluid:lumium>,<fluid:mana>,<fluid:mithril>,<fluid:invar>,<fluid:constantan>,<fluid:bronze>,<fluid:electrum>] as ILiquidStack[];
val nakNames = [<fluid:pyro_nak>,<fluid:aero_nak>,<fluid:petro_nak>,<fluid:nickel_nak>,<fluid:platinum_nak>,<fluid:iridium_nak>,<fluid:signalum_nak>,<fluid:lumium_nak>,<fluid:mana_dust_nak>,<fluid:mithril_nak>,<fluid:invar_nak>,<fluid:constantan_nak>,<fluid:bronze_nak>,<fluid:electrum_nak>] as ILiquidStack[];

for i,name in noNakNames{
	if(i<=2||i==8){
		mods.nuclearcraft.SaltMixer.addRecipe(name*250, <fluid:nak>*144, nakNames[i]*144);
		mods.nuclearcraft.Centrifuge.addRecipe(nakNames[i]*144, name*250, <fluid:nak>*144, null, null, null, null);
	}else{
		mods.nuclearcraft.SaltMixer.addRecipe(name*144, <fluid:nak>*144, nakNames[i]*144);
		mods.nuclearcraft.Centrifuge.addRecipe(nakNames[i]*144, name*144, <fluid:nak>*144, null, null, null, null);
	}
}