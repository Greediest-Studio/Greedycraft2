/*
Copyright Bob Bartsch, 2021

This code is governed by the
Creative Commons Attribution–NonCommercial License
https://creativecommons.org/licenses/by-nc/3.0/

(Meaning: credit me if you modify and/or redistribute
this code. Also, you may not sell this code.)
*/

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

val ingotHeatSinks = [[<nuclearcraft:solid_fission_sink_steel>,<nuclearcraft:solid_fission_sink_ferroboron>,<nuclearcraft:solid_fission_sink_tough_alloy>,<nuclearcraft:solid_fission_sink_limno2>,<nuclearcraft:solid_fission_sink_mgb2>,<nuclearcraft:solid_fission_sink_zirconium>,<nuclearcraft:solid_fission_sink_hard_carbon>,<nuclearcraft:solid_fission_sink_extreme_alloy>,<nuclearcraft:solid_fission_sink_thermoconducting_alloy>,<nuclearcraft:solid_fission_sink_zircaloy>,<nuclearcraft:solid_fission_sink_sic_sic_cmc>,<nuclearcraft:solid_fission_sink_hsla>,<nuclearcraft:solid_fission_sink_sic>],[<nuclearcraft:salt_fission_heater_steel>,<nuclearcraft:salt_fission_heater_ferroboron>,<nuclearcraft:salt_fission_heater_tough_alloy>,<nuclearcraft:salt_fission_heater_limno2>,<nuclearcraft:salt_fission_heater_mgb2>,<nuclearcraft:salt_fission_heater_zirconium>,<nuclearcraft:salt_fission_heater_hard_carbon>,<nuclearcraft:salt_fission_heater_extreme_alloy>,<nuclearcraft:salt_fission_heater_thermoconducting_alloy>,<nuclearcraft:salt_fission_heater_zircaloy>,<nuclearcraft:salt_fission_heater_sic_sic_cmc>,<nuclearcraft:salt_fission_heater_hsla>,<nuclearcraft:salt_fission_heater_sic>],[<nuclearcraft:fission_heater_port_steel>,<nuclearcraft:fission_heater_port_ferroboron>,<nuclearcraft:fission_heater_port_tough_alloy>,<nuclearcraft:fission_heater_port_limno2>,<nuclearcraft:fission_heater_port_mgb2>,<nuclearcraft:fission_heater_port_zirconium>,<nuclearcraft:fission_heater_port_hard_carbon>,<nuclearcraft:fission_heater_port_extreme_alloy>,<nuclearcraft:fission_heater_port_thermoconducting_alloy>,<nuclearcraft:fission_heater_port_zircaloy>,<nuclearcraft:fission_heater_port_sic_sic_cmc>,<nuclearcraft:fission_heater_port_hsla>,<nuclearcraft:fission_heater_port_sic>]] as IItemStack[][];
val ingots = [<ore:ingotSteel>,<ore:ingotFerroboron>,<ore:ingotTough>,<ore:ingotLithiumManganeseDioxide>,<ore:ingotMagnesiumDiboride>,<ore:ingotZirconium>,<ore:ingotHardCarbon>,<ore:ingotExtreme>,<ore:ingotThermoconducting>,<ore:ingotZircaloy>,<ore:ingotSiCSiCCMC>,<ore:ingotHSLASteel>,<ore:ingotSiliconCarbide>] as IIngredient[];

for i,ingot in ingots{
	recipes.addShaped(ingotHeatSinks[0][i], [[null,ingot,null],[ingot,emptyHeat[0],ingot],[null,ingot,null]]);
	recipes.addShaped(ingotHeatSinks[1][i], [[null,ingot,null],[ingot,emptyHeat[1],ingot],[null,ingot,null]]);
	recipes.addShaped(ingotHeatSinks[2][i], [[null,ingot,null],[ingot,emptyHeat[2],ingot],[null,ingot,null]]);
}


val gemHeatSinks = [[<nuclearcraft:solid_fission_sink_boron_arsenide>,<nuclearcraft:solid_fission_sink_boron_nitride>,<nuclearcraft:solid_fission_sink_rhodochrosite>,<nuclearcraft:solid_fission_sink_tnt>,<nuclearcraft:solid_fission_sink_bone>,<nuclearcraft:solid_fission_sink_silicon>],[<nuclearcraft:salt_fission_heater_boron_arsenide>,<nuclearcraft:salt_fission_heater_boron_nitride>,<nuclearcraft:salt_fission_heater_rhodochrosite>,<nuclearcraft:salt_fission_heater_tnt>,<nuclearcraft:salt_fission_heater_bone>,<nuclearcraft:salt_fission_heater_silicon>],[<nuclearcraft:fission_heater_port_boron_arsenide>,<nuclearcraft:fission_heater_port_boron_nitride>,<nuclearcraft:fission_heater_port_rhodochrosite>,<nuclearcraft:fission_heater_port_tnt>,<nuclearcraft:fission_heater_port_bone>,<nuclearcraft:fission_heater_port_silicon>]] as IItemStack[][];
val gems = [<ore:gemBoronArsenide>,<ore:gemBoronNitride>,<ore:gemRhodochrosite>,<minecraft:tnt>,<ore:bone>,<ore:itemSilicon>] as IIngredient[];

for i,gem in gems{
	recipes.addShaped(gemHeatSinks[0][i], [[gem,gem,gem],[gem,emptyHeat[0],gem],[gem,gem,gem]]);
	recipes.addShaped(gemHeatSinks[1][i], [[gem,gem,gem],[gem,emptyHeat[1],gem],[gem,gem,gem]]);
	recipes.addShaped(gemHeatSinks[2][i], [[gem,gem,gem],[gem,emptyHeat[2],gem],[gem,gem,gem]]);
}


val doubSystemNames = ["sea_lantern","brick","magma_slime","sponge","blue_ice","bismuth","glowshroom"] as string[];
val system1 = [<minecraft:sea_lantern>,<minecraft:brick_block>,<minecraft:magma_cream>,<minecraft:sponge>,<minecraft:packed_ice>,<ore:dustBismuth>,<nuclearcraft:glowing_mushroom_block>] as IIngredient[];
val system2 = [<ore:dustPrismarine>,<ore:ingotBrick>,<minecraft:magma_cream>,<minecraft:sponge:1>,<minecraft:packed_ice>,null,<nuclearcraft:glowing_mushroom>] as IIngredient[];

for i,name in doubSystemNames{
	recipes.addShaped(itemUtils.getItem("nuclearcraft:solid_fission_sink_"~name), [[system2[i],system1[i],system2[i]],[system1[i],emptyHeat[0],system1[i]],[system2[i],system1[i],system2[i]]]);
	recipes.addShaped(itemUtils.getItem("nuclearcraft:salt_fission_heater_"~name), [[system2[i],system1[i],system2[i]],[system1[i],emptyHeat[1],system1[i]],[system2[i],system1[i],system2[i]]]);
	recipes.addShaped(itemUtils.getItem("nuclearcraft:fission_heater_port_"~name), [[system2[i],system1[i],system2[i]],[system1[i],emptyHeat[2],system1[i]],[system2[i],system1[i],system2[i]]]);
}


recipes.addShaped(<nuclearcraft:solid_fission_sink_smore>, [[<nuclearcraft:smore>,<nuclearcraft:foursmore>,<nuclearcraft:smore>],[<nuclearcraft:moresmore>,emptyHeat[0],<nuclearcraft:moresmore>],[<nuclearcraft:smore>,<nuclearcraft:foursmore>,<nuclearcraft:smore>]]);
recipes.addShaped(<nuclearcraft:salt_fission_heater_smore>, [[<nuclearcraft:smore>,<nuclearcraft:foursmore>,<nuclearcraft:smore>],[<nuclearcraft:moresmore>,emptyHeat[1],<nuclearcraft:moresmore>],[<nuclearcraft:smore>,<nuclearcraft:foursmore>,<nuclearcraft:smore>]]);
recipes.addShaped(<nuclearcraft:fission_heater_port_smore>, [[<nuclearcraft:smore>,<nuclearcraft:foursmore>,<nuclearcraft:smore>],[<nuclearcraft:moresmore>,emptyHeat[2],<nuclearcraft:moresmore>],[<nuclearcraft:smore>,<nuclearcraft:foursmore>,<nuclearcraft:smore>]]);

oreDict.QuantumTraverseWouldYouKindlyStuffASockInIt;
<ore:QuantumTraverseWouldYouKindlyStuffASockInIt>.add(<nuclearcraft:solid_fission_sink_smore>);



if(loadedMods has "qmd"){
	mods.nuclearcraft.Infuser.addRecipe(emptyHeat[0], <fluid:liquid_oxygen>*1000, <nuclearcraft:solid_fission_sink_liquid_oxygen>);
	mods.nuclearcraft.Infuser.addRecipe(emptyHeat[1], <fluid:liquid_oxygen>*1000, <nuclearcraft:salt_fission_heater_liquid_oxygen>);
	mods.nuclearcraft.Infuser.addRecipe(emptyHeat[2], <fluid:liquid_oxygen>*1000, <nuclearcraft:fission_heater_port_liquid_oxygen>);
} else {
	mods.nuclearcraft.Infuser.addRecipe(emptyHeat[0], <fluid:oxygen>*1000, <nuclearcraft:solid_fission_sink_liquid_oxygen>);
	mods.nuclearcraft.Infuser.addRecipe(emptyHeat[1], <fluid:oxygen>*1000, <nuclearcraft:salt_fission_heater_liquid_oxygen>);
	mods.nuclearcraft.Infuser.addRecipe(emptyHeat[2], <fluid:oxygen>*1000, <nuclearcraft:fission_heater_port_liquid_oxygen>);
}

val buckNames = ["corium","milk","lava"] as string[];
val buckets = [<fluid:corium>,<fluid:milk>,<fluid:lava>] as ILiquidStack[];

for i,flui in buckets{
	mods.nuclearcraft.Infuser.addRecipe(emptyHeat[0], flui*1000, itemUtils.getItem("nuclearcraft:solid_fission_sink_"~buckNames[i]));
	mods.nuclearcraft.Infuser.addRecipe(emptyHeat[1], flui*1000, itemUtils.getItem("nuclearcraft:salt_fission_heater_"~buckNames[i]));
	mods.nuclearcraft.Infuser.addRecipe(emptyHeat[2], flui*1000, itemUtils.getItem("nuclearcraft:fission_heater_port_"~buckNames[i]));
}

mods.nuclearcraft.Radiation.setRadiationLevel(<nuclearcraft:solid_fission_sink_corium>, 0.000114);


val noNakNames = [<fluid:steel>,<fluid:ferroboron>,<fluid:tough>,<fluid:limno2>,<fluid:mgb2>,<fluid:bas>,<fluid:boron_nitride_solution>,<fluid:rhodochrosite>,<fluid:zirconium>,<fluid:hard_carbon>,<fluid:extreme_alloy>,<fluid:thermoconducting_alloy>,<fluid:zircaloy>,<fluid:sic_sic_cmc>,<fluid:hsla>,<fluid:dark_chocolate>,<fluid:oxygen>,<fluid:corium>,<fluid:tnt>,<fluid:milk>,<fluid:lava>,<fluid:radaway>,<fluid:sea_lantern>,<fluid:bone>,<fluid:brick>,<fluid:magma_slime>,<fluid:sponge>,<fluid:bismuth>,<fluid:silicon>,<fluid:sic>] as ILiquidStack[];
if(loadedMods has "qmd"){
	noNakNames[16] = <fluid:liquid_oxygen>;
}

if(loadedMods has "tconstruct"){
	noNakNames[24] = <fluid:clay>;
}else{
	mods.nuclearcraft.Melter.addRecipe(<minecraft:brick>, <fluid:brick>*144);
	mods.nuclearcraft.IngotFormer.addRecipe(<fluid:brick>*144, <minecraft:brick>);
}

val nakNames = [<fluid:steel_nak>,<fluid:ferroboron_nak>,<fluid:tough_alloy_nak>,<fluid:limno2_nak>,<fluid:mgb2_nak>,<fluid:boron_arsenide_nak>,<fluid:boron_nitride_nak>,<fluid:rhodochrosite_nak>,<fluid:zirconium_nak>,<fluid:hard_carbon_nak>,<fluid:extreme_alloy_nak>,<fluid:thermoconducting_alloy_nak>,<fluid:zircaloy_nak>,<fluid:sic_sic_cmc_nak>,<fluid:hsla_nak>,<fluid:smore_nak>,<fluid:liquid_oxygen_nak>,<fluid:corium_nak>,<fluid:tnt_nak>,<fluid:milk_nak>,<fluid:lava_nak>,<fluid:glowshroom_nak>,<fluid:sea_lantern_nak>,<fluid:bone_nak>,<fluid:brick_nak>,<fluid:magma_slime_nak>,<fluid:sponge_nak>,<fluid:bismuth_nak>,<fluid:silicon_nak>,<fluid:sic_nak>] as ILiquidStack[];

for i,name in noNakNames{
	if(i==5 || i==6 || i==7||i==27){
		mods.nuclearcraft.SaltMixer.addRecipe(name*666, <fluid:nak>*144, nakNames[i]*144);
		mods.nuclearcraft.Centrifuge.addRecipe(nakNames[i]*144, name*666, <fluid:nak>*144, null, null, null, null);
	}else{
		if(i>=16 && i<=21){
		mods.nuclearcraft.SaltMixer.addRecipe(name*250, <fluid:nak>*144, nakNames[i]*144);
		mods.nuclearcraft.Centrifuge.addRecipe(nakNames[i]*144, name*250, <fluid:nak>*144, null, null, null, null);
		}else{
		mods.nuclearcraft.SaltMixer.addRecipe(name*144, <fluid:nak>*144, nakNames[i]*144);
		mods.nuclearcraft.Centrifuge.addRecipe(nakNames[i]*144, name*144, <fluid:nak>*144, null, null, null, null);
		}
	}
}

val meltItems = [<ore:ingotLithiumManganeseDioxide>,<ore:ingotMagnesiumDiboride>,<ore:gemRhodochrosite>,<ore:ingotExtreme>,<ore:ingotThermoconducting>,<ore:ingotZircaloy>,<ore:ingotSiCSiCCMC>,<ore:ingotHSLASteel>,<minecraft:sea_lantern>,<minecraft:bone>,<minecraft:magma_cream>,<minecraft:sponge>,<ore:dustBismuth>,<ore:ingotSiliconCarbide>] as IIngredient[];
val meltFluids = [<fluid:limno2>,<fluid:mgb2>,<fluid:rhodochrosite>,<fluid:extreme_alloy>,<fluid:thermoconducting_alloy>,<fluid:zircaloy>,<fluid:sic_sic_cmc>,<fluid:hsla>,<fluid:sea_lantern>,<fluid:bone>,<fluid:magma_slime>,<fluid:sponge>,<fluid:bismuth>,<fluid:sic>] as ILiquidStack[];

for i,item in meltItems{
	if(i==2){
		mods.nuclearcraft.Melter.addRecipe(item, meltFluids[i]*666);
		mods.nuclearcraft.IngotFormer.addRecipe(meltFluids[i]*666, item);
	}else{
		mods.nuclearcraft.Melter.addRecipe(item, meltFluids[i]*144);
		mods.nuclearcraft.IngotFormer.addRecipe(meltFluids[i]*144, item);
	}
}


if(!(loadedMods has "trinity")){
mods.nuclearcraft.Melter.addRecipe(<minecraft:tnt>, <fluid:tnt>*1000);
mods.nuclearcraft.IngotFormer.addRecipe(<fluid:tnt>*1000, <minecraft:tnt>);
}
