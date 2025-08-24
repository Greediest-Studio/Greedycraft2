/*
 * This script is created for the GreedyCraft Tweaks by mc_Edwin.
 */

#priority 50


import crafttweaker.oredict.IOreDictEntry;
import crafttweaker.item.IItemStack;
import crafttweaker.data.IData;
import crafttweaker.item.IIngredient;
import crafttweaker.liquid.ILiquidStack;

import mods.modularmachinery.RecipeBuilder;
import mods.modularmachinery.MachineModifier;
import mods.modularmachinery.MMEvents;
import mods.modularmachinery.ControllerGUIRenderEvent;
import mods.ctutils.utils.Math;
import mods.jei.JEI;
import mod.mekanism.gas.IGasStack;

import scripts.util.machines as MMUtil;

MachineModifier.setMaxParallelism("mek_changer", 2147483647);
MachineModifier.setMaxThreads("mek_changer", 16);
MachineModifier.setInternalParallelism("mek_changer", 2147483647);

MMEvents.onControllerGUIRender("mek_changer", function(event as ControllerGUIRenderEvent) {
    var info as string[] = ["§a///MEK气液转换机控制面板///", "§a机器名称：§eLV0 - MEK气液转换机"];
    event.extraInfo = info;
});

RecipeBuilder.newBuilder("liquid_hydrogen", "mek_changer", 1)
.addGasInput(<gas:hydrogen> * 10)
.addFluidOutput(<liquid:hydrogen> * 10)
.build();

RecipeBuilder.newBuilder("gas_hydrogen", "mek_changer", 1)
.addFluidInput(<liquid:hydrogen> * 10)
.addGasOutput(<gas:hydrogen> * 10)
.build();

RecipeBuilder.newBuilder("liquid_oxygen", "mek_changer", 1)
.addGasInput(<gas:oxygen> * 10)
.addFluidOutput(<liquid:oxygen> * 10)
.build();

RecipeBuilder.newBuilder("gas_oxygen", "mek_changer", 1)
.addFluidInput(<liquid:oxygen> * 10)
.addGasOutput(<gas:oxygen> * 10)
.build();

RecipeBuilder.newBuilder("liquid_water", "mek_changer", 1)
.addGasInput(<gas:water> * 10)
.addFluidOutput(<liquid:water> * 10)
.build();

RecipeBuilder.newBuilder("gas_water", "mek_changer", 1)
.addFluidInput(<liquid:water> * 10)
.addGasOutput(<gas:water> * 10)
.build();

RecipeBuilder.newBuilder("liquid_liquidchlorine", "mek_changer", 1)
.addGasInput(<gas:chlorine> * 10)
.addFluidOutput(<liquid:liquidchlorine> * 10)
.build();

RecipeBuilder.newBuilder("gas_liquidchlorine", "mek_changer", 1)
.addFluidInput(<liquid:liquidchlorine> * 10)
.addGasOutput(<gas:chlorine> * 10)
.build();

RecipeBuilder.newBuilder("liquid_sulfur_dioxide", "mek_changer", 1)
.addGasInput(<gas:sulfurdioxide> * 10)
.addFluidOutput(<liquid:sulfur_dioxide> * 10)
.build();

RecipeBuilder.newBuilder("gas_sulfur_dioxide", "mek_changer", 1)
.addFluidInput(<liquid:sulfur_dioxide> * 10)
.addGasOutput(<gas:sulfurdioxide> * 10)
.build();

RecipeBuilder.newBuilder("liquid_sulfur_trioxide", "mek_changer", 1)
.addGasInput(<gas:sulfurtrioxide> * 10)
.addFluidOutput(<liquid:sulfur_trioxide> * 10)
.build();

RecipeBuilder.newBuilder("gas_sulfur_trioxide", "mek_changer", 1)
.addFluidInput(<liquid:sulfur_trioxide> * 10)
.addGasOutput(<gas:sulfurtrioxide> * 10)
.build();

RecipeBuilder.newBuilder("liquid_sulfuric_acid", "mek_changer", 1)
.addGasInput(<gas:sulfuricacid> * 10)
.addFluidOutput(<liquid:sulfuric_acid> * 10)
.build();

RecipeBuilder.newBuilder("gas_sulfuric_acid", "mek_changer", 1)
.addFluidInput(<liquid:sulfuric_acid> * 10)
.addGasOutput(<gas:sulfuricacid> * 10)
.build();

RecipeBuilder.newBuilder("liquid_hydrogenchloride", "mek_changer", 1)
.addGasInput(<gas:hydrogenchloride> * 10)
.addFluidOutput(<liquid:liquidhydrogenchloride> * 10)
.build();

RecipeBuilder.newBuilder("gas_hydrogenchloride", "mek_changer", 1)
.addFluidInput(<liquid:liquidhydrogenchloride> * 10)
.addGasOutput(<gas:hydrogenchloride> * 10)
.build();

RecipeBuilder.newBuilder("liquid_ethene", "mek_changer", 1)
.addGasInput(<gas:ethene> * 10)
.addFluidOutput(<liquid:ethene> * 10)
.build();

RecipeBuilder.newBuilder("gas_ethene", "mek_changer", 1)
.addFluidInput(<liquid:ethene> * 10)
.addGasOutput(<gas:ethene> * 10)
.build();

RecipeBuilder.newBuilder("liquid_liquidsodium", "mek_changer", 1)
.addGasInput(<gas:sodium> * 10)
.addFluidOutput(<liquid:liquidsodium> * 10)
.build();

RecipeBuilder.newBuilder("gas_liquidsodium", "mek_changer", 1)
.addFluidInput(<liquid:liquidsodium> * 10)
.addGasOutput(<gas:sodium> * 10)
.build();

RecipeBuilder.newBuilder("liquid_brine", "mek_changer", 1)
.addGasInput(<gas:brine> * 10)
.addFluidOutput(<liquid:brine> * 10)
.build();

RecipeBuilder.newBuilder("gas_brine", "mek_changer", 1)
.addFluidInput(<liquid:brine> * 10)
.addGasOutput(<gas:brine> * 10)
.build();

RecipeBuilder.newBuilder("liquid_deuterium", "mek_changer", 1)
.addGasInput(<gas:deuterium> * 10)
.addFluidOutput(<liquid:deuterium> * 10)
.build();

RecipeBuilder.newBuilder("gas_deuterium", "mek_changer", 1)
.addFluidInput(<liquid:deuterium> * 10)
.addGasOutput(<gas:deuterium> * 10)
.build();

RecipeBuilder.newBuilder("liquid_tritium", "mek_changer", 1)
.addGasInput(<gas:tritium> * 10)
.addFluidOutput(<liquid:tritium> * 10)
.build();

RecipeBuilder.newBuilder("gas_tritium", "mek_changer", 1)
.addFluidInput(<liquid:tritium> * 10)
.addGasOutput(<gas:tritium> * 10)
.build();

RecipeBuilder.newBuilder("liquid_liquidfusionfuel", "mek_changer", 1)
.addGasInput(<gas:fusionfuel> * 10)
.addFluidOutput(<liquid:liquidfusionfuel> * 10)
.build();

RecipeBuilder.newBuilder("gas_liquidfusionfuel", "mek_changer", 1)
.addFluidInput(<liquid:liquidfusionfuel> * 10)
.addGasOutput(<gas:fusionfuel> * 10)
.build();

RecipeBuilder.newBuilder("liquid_liquidlithium", "mek_changer", 1)
.addGasInput(<gas:lithium> * 10)
.addFluidOutput(<liquid:liquidlithium> * 10)
.build();

RecipeBuilder.newBuilder("gas_liquidlithium", "mek_changer", 1)
.addFluidInput(<liquid:liquidlithium> * 10)
.addGasOutput(<gas:lithium> * 10)
.build();

RecipeBuilder.newBuilder("liquid_helium", "mek_changer", 1)
.addGasInput(<gas:helium> * 10)
.addFluidOutput(<liquid:helium> * 10)
.build();

RecipeBuilder.newBuilder("gas_helium", "mek_changer", 1)
.addFluidInput(<liquid:helium> * 10)
.addGasOutput(<gas:helium> * 10)
.build();

RecipeBuilder.newBuilder("liquid_nitrogen", "mek_changer", 1)
.addGasInput(<gas:nitrogen> * 10)
.addFluidOutput(<liquid:nitrogen> * 10)
.build();

RecipeBuilder.newBuilder("gas_nitrogen", "mek_changer", 1)
.addFluidInput(<liquid:nitrogen> * 10)
.addGasOutput(<gas:nitrogen> * 10)
.build();

RecipeBuilder.newBuilder("liquid_fluorine", "mek_changer", 1)
.addGasInput(<gas:fluorine> * 10)
.addFluidOutput(<liquid:fluorine> * 10)
.build();

RecipeBuilder.newBuilder("gas_fluorine", "mek_changer", 1).
addFluidInput(<liquid:fluorine> * 10)
.addGasOutput(<gas:fluorine> * 10)
.build();

RecipeBuilder.newBuilder("liquid_carbon_dioxide", "mek_changer", 1)
.addGasInput(<gas:carbondioxide> * 10)
.addFluidOutput(<liquid:carbon_dioxide> * 10)
.build();

RecipeBuilder.newBuilder("gas_carbon_dioxide", "mek_changer", 1)
.addFluidInput(<liquid:carbon_dioxide> * 10)
.addGasOutput(<gas:carbondioxide> * 10)
.build();

RecipeBuilder.newBuilder("liquid_carbon_monoxide", "mek_changer", 1)
.addGasInput(<gas:carbonoxide> * 10)
.addFluidOutput(<liquid:carbon_monoxide> * 10)
.build();

RecipeBuilder.newBuilder("gas_carbon_monoxide", "mek_changer", 1)
.addFluidInput(<liquid:carbon_monoxide> * 10)
.addGasOutput(<gas:carbonoxide> * 10)
.build();

RecipeBuilder.newBuilder("liquid_ammonia", "mek_changer", 1)
.addGasInput(<gas:ammonia> * 10)
.addFluidOutput(<liquid:ammonia> * 10)
.build();

RecipeBuilder.newBuilder("gas_ammonia", "mek_changer", 1)
.addFluidInput(<liquid:ammonia> * 10)
.addGasOutput(<gas:ammonia> * 10)
.build();

RecipeBuilder.newBuilder("liquid_nitrogen_oxide", "mek_changer", 1)
.addGasInput(<gas:nitrogenoxide> * 10)
.addFluidOutput(<liquid:nitrogen_oxide> * 10)
.build();

RecipeBuilder.newBuilder("gas_nitrogen_oxide", "mek_changer", 1)
.addFluidInput(<liquid:nitrogen_oxide> * 10)
.addGasOutput(<gas:nitrogenoxide> * 10)
.build();

RecipeBuilder.newBuilder("liquid_nitrogen_dioxide", "mek_changer", 1)
.addGasInput(<gas:nitrogendioxide> * 10)
.addFluidOutput(<liquid:nitrogen_dioxide> * 10)
.build();

RecipeBuilder.newBuilder("gas_nitrogen_dioxide", "mek_changer", 1)
.addFluidInput(<liquid:nitrogen_dioxide> * 10)
.addGasOutput(<gas:nitrogendioxide> * 10)
.build();

RecipeBuilder.newBuilder("liquid_nitric_acid", "mek_changer", 1)
.addGasInput(<gas:nitricacid> * 10)
.addFluidOutput(<liquid:nitric_acid> * 10)
.build();

RecipeBuilder.newBuilder("gas_nitric_acid", "mek_changer", 1)
.addFluidInput(<liquid:nitric_acid> * 10)
.addGasOutput(<gas:nitricacid> * 10)
.build();

RecipeBuilder.newBuilder("liquid_hydrochloric_acid", "mek_changer", 1)
.addGasInput(<gas:hydrochloricacid> * 10)
.addFluidOutput(<liquid:hydrochloric_acid> * 10)
.build();

RecipeBuilder.newBuilder("gas_hydrochloric_acid", "mek_changer", 1)
.addFluidInput(<liquid:hydrochloric_acid> * 10)
.addGasOutput(<gas:hydrochloricacid> * 10)
.build();

RecipeBuilder.newBuilder("liquid_liquidhydrofluricacid", "mek_changer", 1)
.addGasInput(<gas:hydrofluoricacid> * 10)
.addFluidOutput(<liquid:liquidhydrofluricacid> * 10)
.build();

RecipeBuilder.newBuilder("gas_liquidhydrofluricacid", "mek_changer", 1)
.addFluidInput(<liquid:liquidhydrofluricacid> * 10)
.addGasOutput(<gas:hydrofluoricacid> * 10)
.build();

RecipeBuilder.newBuilder("liquid_hydrogen_fluoride", "mek_changer", 1)
.addGasInput(<gas:hydrogenfluoride> * 10)
.addFluidOutput(<liquid:hydrogen_fluoride> * 10)
.build();

RecipeBuilder.newBuilder("gas_hydrogen_fluoride", "mek_changer", 1)
.addFluidInput(<liquid:hydrogen_fluoride> * 10)
.addGasOutput(<gas:hydrogenfluoride> * 10)
.build();

RecipeBuilder.newBuilder("liquid_bromine_gas", "mek_changer", 1)
.addGasInput(<gas:bromine> * 10)
.addFluidOutput(<liquid:bromine_gas> * 10)
.build();

RecipeBuilder.newBuilder("gas_bromine_gas", "mek_changer", 1)
.addFluidInput(<liquid:bromine_gas> * 10)
.addGasOutput(<gas:bromine> * 10)
.build();

RecipeBuilder.newBuilder("liquid_sodium_hydroxide_solution", "mek_changer", 1)
.addGasInput(<gas:sodiumhydroxide> * 10)
.addFluidOutput(<liquid:sodium_hydroxide_solution> * 10)
.build();

RecipeBuilder.newBuilder("gas_sodium_hydroxide_solution", "mek_changer", 1)
.addFluidInput(<liquid:sodium_hydroxide_solution> * 10)
.addGasOutput(<gas:sodiumhydroxide> * 10)
.build();

RecipeBuilder.newBuilder("liquid_neon", "mek_changer", 1)
.addGasInput(<gas:neon> * 10)
.addFluidOutput(<liquid:neon> * 10)
.build();

RecipeBuilder.newBuilder("gas_neon", "mek_changer", 1)
.addFluidInput(<liquid:neon> * 10)
.addGasOutput(<gas:neon> * 10)
.build();

RecipeBuilder.newBuilder("liquid_argon", "mek_changer", 1)
.addGasInput(<gas:argon> * 10)
.addFluidOutput(<liquid:argon> * 10)
.build();

RecipeBuilder.newBuilder("gas_argon", "mek_changer", 1)
.addFluidInput(<liquid:argon> * 10)
.addGasOutput(<gas:argon> * 10)
.build();

RecipeBuilder.newBuilder("liquid_krypton", "mek_changer", 1)
.addGasInput(<gas:krypton> * 10)
.addFluidOutput(<liquid:krypton> * 10)
.build();

RecipeBuilder.newBuilder("gas_krypton", "mek_changer", 1)
.addFluidInput(<liquid:krypton> * 10)
.addGasOutput(<gas:krypton> * 10)
.build();

RecipeBuilder.newBuilder("liquid_xenon", "mek_changer", 1)
.addGasInput(<gas:xenon> * 10)
.addFluidOutput(<liquid:xenon> * 10)
.build();

RecipeBuilder.newBuilder("gas_xenon", "mek_changer", 1)
.addFluidInput(<liquid:xenon> * 10)
.addGasOutput(<gas:xenon> * 10)
.build();

RecipeBuilder.newBuilder("liquid_radon", "mek_changer", 1)
.addGasInput(<gas:radon> * 10)
.addFluidOutput(<liquid:radon> * 10)
.build();

RecipeBuilder.newBuilder("gas_radon", "mek_changer", 1)
.addFluidInput(<liquid:radon> * 10)
.addGasOutput(<gas:radon> * 10)
.build();

RecipeBuilder.newBuilder("liquid_phosphine", "mek_changer", 1)
.addGasInput(<gas:phosphine> * 10)
.addFluidOutput(<liquid:phosphine> * 10)
.build();

RecipeBuilder.newBuilder("gas_phosphine", "mek_changer", 1)
.addFluidInput(<liquid:phosphine> * 10)
.addGasOutput(<gas:phosphine> * 10)
.build();