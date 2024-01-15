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
import mods.ctutils.utils.Math;
import mods.jei.JEI;
import mod.mekanism.gas.IGasStack;

import scripts.util.machines as MMUtil;

RecipeBuilder.newBuilder("liquid_hydrogen", "mek_changer", 1).addGasInput("hydrogen", 10).addFluidOutput(<fluid:hydrogen> * 10).build();
RecipeBuilder.newBuilder("gas_hydrogen", "mek_changer", 1).addFluidInput(<fluid:hydrogen> * 10).addGasOutput("hydrogen", 10).build();

RecipeBuilder.newBuilder("liquid_oxygen", "mek_changer", 1).addGasInput("oxygen", 10).addFluidOutput(<fluid:oxygen> * 10).build();
RecipeBuilder.newBuilder("gas_oxygen", "mek_changer", 1).addFluidInput(<fluid:oxygen> * 10).addGasOutput("oxygen", 10).build();

RecipeBuilder.newBuilder("liquid_water", "mek_changer", 1).addGasInput("water", 10).addFluidOutput(<fluid:water> * 10).build();
RecipeBuilder.newBuilder("gas_water", "mek_changer", 1).addFluidInput(<fluid:water> * 10).addGasOutput("water", 10).build();

RecipeBuilder.newBuilder("liquid_liquidchlorine", "mek_changer", 1).addGasInput("chlorine", 10).addFluidOutput(<fluid:liquidchlorine> * 10).build();
RecipeBuilder.newBuilder("gas_liquidchlorine", "mek_changer", 1).addFluidInput(<fluid:liquidchlorine> * 10).addGasOutput("chlorine", 10).build();

RecipeBuilder.newBuilder("liquid_sulfur_dioxide", "mek_changer", 1).addGasInput("sulfurdioxide", 10).addFluidOutput(<fluid:sulfur_dioxide> * 10).build();
RecipeBuilder.newBuilder("gas_sulfur_dioxide", "mek_changer", 1).addFluidInput(<fluid:sulfur_dioxide> * 10).addGasOutput("sulfurdioxide", 10).build();

RecipeBuilder.newBuilder("liquid_sulfur_trioxide", "mek_changer", 1).addGasInput("sulfurtrioxide", 10).addFluidOutput(<fluid:sulfur_trioxide> * 10).build();
RecipeBuilder.newBuilder("gas_sulfur_trioxide", "mek_changer", 1).addFluidInput(<fluid:sulfur_trioxide> * 10).addGasOutput("sulfurtrioxide", 10).build();

RecipeBuilder.newBuilder("liquid_sulfuric_acid", "mek_changer", 1).addGasInput("sulfuricacid", 10).addFluidOutput(<fluid:sulfuric_acid> * 10).build();
RecipeBuilder.newBuilder("gas_sulfuric_acid", "mek_changer", 1).addFluidInput(<fluid:sulfuric_acid> * 10).addGasOutput("sulfuricacid", 10).build();

RecipeBuilder.newBuilder("liquid_hydrogenchloride", "mek_changer", 1).addGasInput("hydrogenchloride", 10).addFluidOutput(<fluid:liquidhydrogenchloride> * 10).build();
RecipeBuilder.newBuilder("gas_hydrogenchloride", "mek_changer", 1).addFluidInput(<fluid:liquidhydrogenchloride> * 10).addGasOutput("hydrogenchloride", 10).build();

RecipeBuilder.newBuilder("liquid_ethene", "mek_changer", 1).addGasInput("ethene", 10).addFluidOutput(<fluid:ethene> * 10).build();
RecipeBuilder.newBuilder("gas_ethene", "mek_changer", 1).addFluidInput(<fluid:ethene> * 10).addGasOutput("ethene", 10).build();

RecipeBuilder.newBuilder("liquid_liquidsodium", "mek_changer", 1).addGasInput("sodium", 10).addFluidOutput(<fluid:liquidsodium> * 10).build();
RecipeBuilder.newBuilder("gas_liquidsodium", "mek_changer", 1).addFluidInput(<fluid:liquidsodium> * 10).addGasOutput("sodium", 10).build();

RecipeBuilder.newBuilder("liquid_brine", "mek_changer", 1).addGasInput("brine", 10).addFluidOutput(<fluid:brine> * 10).build();
RecipeBuilder.newBuilder("gas_brine", "mek_changer", 1).addFluidInput(<fluid:brine> * 10).addGasOutput("brine", 10).build();

RecipeBuilder.newBuilder("liquid_deuterium", "mek_changer", 1).addGasInput("deuterium", 10).addFluidOutput(<fluid:deuterium> * 10).build();
RecipeBuilder.newBuilder("gas_deuterium", "mek_changer", 1).addFluidInput(<fluid:deuterium> * 10).addGasOutput("deuterium", 10).build();

RecipeBuilder.newBuilder("liquid_tritium", "mek_changer", 1).addGasInput("tritium", 10).addFluidOutput(<fluid:tritium> * 10).build();
RecipeBuilder.newBuilder("gas_tritium", "mek_changer", 1).addFluidInput(<fluid:tritium> * 10).addGasOutput("tritium", 10).build();

RecipeBuilder.newBuilder("liquid_liquidfusionfuel", "mek_changer", 1).addGasInput("fusionfuel", 10).addFluidOutput(<fluid:liquidfusionfuel> * 10).build();
RecipeBuilder.newBuilder("gas_liquidfusionfuel", "mek_changer", 1).addFluidInput(<fluid:liquidfusionfuel> * 10).addGasOutput("fusionfuel", 10).build();

RecipeBuilder.newBuilder("liquid_liquidlithium", "mek_changer", 1).addGasInput("lithium", 10).addFluidOutput(<fluid:liquidlithium> * 10).build();
RecipeBuilder.newBuilder("gas_liquidlithium", "mek_changer", 1).addFluidInput(<fluid:liquidlithium> * 10).addGasOutput("lithium", 10).build();

RecipeBuilder.newBuilder("liquid_helium", "mek_changer", 1).addGasInput("helium", 10).addFluidOutput(<fluid:helium> * 10).build();
RecipeBuilder.newBuilder("gas_helium", "mek_changer", 1).addFluidInput(<fluid:helium> * 10).addGasOutput("helium", 10).build();

RecipeBuilder.newBuilder("liquid_nitrogen", "mek_changer", 1).addGasInput("nitrogen", 10).addFluidOutput(<fluid:nitrogen> * 10).build();
RecipeBuilder.newBuilder("gas_nitrogen", "mek_changer", 1).addFluidInput(<fluid:nitrogen> * 10).addGasOutput("nitrogen", 10).build();

RecipeBuilder.newBuilder("liquid_fluorine", "mek_changer", 1).addGasInput("fluorine", 10).addFluidOutput(<fluid:fluorine> * 10).build();
RecipeBuilder.newBuilder("gas_fluorine", "mek_changer", 1).addFluidInput(<fluid:fluorine> * 10).addGasOutput("fluorine", 10).build();

RecipeBuilder.newBuilder("liquid_carbon_dioxide", "mek_changer", 1).addGasInput("carbondioxide", 10).addFluidOutput(<fluid:carbon_dioxide> * 10).build();
RecipeBuilder.newBuilder("gas_carbon_dioxide", "mek_changer", 1).addFluidInput(<fluid:carbon_dioxide> * 10).addGasOutput("carbondioxide", 10).build();

RecipeBuilder.newBuilder("liquid_carbon_monoxide", "mek_changer", 1).addGasInput("carbonoxide", 10).addFluidOutput(<fluid:carbon_monoxide> * 10).build();
RecipeBuilder.newBuilder("gas_carbon_monoxide", "mek_changer", 1).addFluidInput(<fluid:carbon_monoxide> * 10).addGasOutput("carbonoxide", 10).build();

RecipeBuilder.newBuilder("liquid_ammonia", "mek_changer", 1).addGasInput("ammonia", 10).addFluidOutput(<fluid:ammonia> * 10).build();
RecipeBuilder.newBuilder("gas_ammonia", "mek_changer", 1).addFluidInput(<fluid:ammonia> * 10).addGasOutput("ammonia", 10).build();

RecipeBuilder.newBuilder("liquid_nitrogen_oxide", "mek_changer", 1).addGasInput("nitrogenoxide", 10).addFluidOutput(<fluid:nitrogen_oxide> * 10).build();
RecipeBuilder.newBuilder("gas_nitrogen_oxide", "mek_changer", 1).addFluidInput(<fluid:nitrogen_oxide> * 10).addGasOutput("nitrogenoxide", 10).build();

RecipeBuilder.newBuilder("liquid_nitrogen_dioxide", "mek_changer", 1).addGasInput("nitrogendioxide", 10).addFluidOutput(<fluid:nitrogen_dioxide> * 10).build();
RecipeBuilder.newBuilder("gas_nitrogen_dioxide", "mek_changer", 1).addFluidInput(<fluid:nitrogen_dioxide> * 10).addGasOutput("nitrogendioxide", 10).build();

RecipeBuilder.newBuilder("liquid_nitric_acid", "mek_changer", 1).addGasInput("nitricacid", 10).addFluidOutput(<fluid:nitric_acid> * 10).build();
RecipeBuilder.newBuilder("gas_nitric_acid", "mek_changer", 1).addFluidInput(<fluid:nitric_acid> * 10).addGasOutput("nitricacid", 10).build();

RecipeBuilder.newBuilder("liquid_hydrochloric_acid", "mek_changer", 1).addGasInput("hydrochloricacid", 10).addFluidOutput(<fluid:hydrochloric_acid> * 10).build();
RecipeBuilder.newBuilder("gas_hydrochloric_acid", "mek_changer", 1).addFluidInput(<fluid:hydrochloric_acid> * 10).addGasOutput("hydrochloricacid", 10).build();

RecipeBuilder.newBuilder("liquid_liquidhydrofluoricacid", "mek_changer", 1).addGasInput("hydrofluoricacid", 10).addFluidOutput(<fluid:liquidhydrofluoricacid> * 10).build();
RecipeBuilder.newBuilder("gas_liquidhydrofluoricacid", "mek_changer", 1).addFluidInput(<fluid:liquidhydrofluoricacid> * 10).addGasOutput("hydrofluoricacid", 10).build();

RecipeBuilder.newBuilder("liquid_hydrogen_fluoride", "mek_changer", 1).addGasInput("hydrogenfluoride", 10).addFluidOutput(<fluid:hydrogen_fluoride> * 10).build();
RecipeBuilder.newBuilder("gas_hydrogen_fluoride", "mek_changer", 1).addFluidInput(<fluid:hydrogen_fluoride> * 10).addGasOutput("hydrogenfluoride", 10).build();

RecipeBuilder.newBuilder("liquid_bromine_gas", "mek_changer", 1).addGasInput("bromine", 10).addFluidOutput(<fluid:bromine_gas> * 10).build();
RecipeBuilder.newBuilder("gas_bromine_gas", "mek_changer", 1).addFluidInput(<fluid:bromine_gas> * 10).addGasOutput("bromine", 10).build();

RecipeBuilder.newBuilder("liquid_sodium_hydroxide_solution", "mek_changer", 1).addGasInput("sodiumhydroxide", 10).addFluidOutput(<fluid:sodium_hydroxide_solution> * 10).build();
RecipeBuilder.newBuilder("gas_sodium_hydroxide_solution", "mek_changer", 1).addFluidInput(<fluid:sodium_hydroxide_solution> * 10).addGasOutput("sodiumhydroxide", 10).build();

RecipeBuilder.newBuilder("liquid_neon", "mek_changer", 1).addGasInput("neon", 10).addFluidOutput(<fluid:neon> * 10).build();
RecipeBuilder.newBuilder("gas_neon", "mek_changer", 1).addFluidInput(<fluid:neon> * 10).addGasOutput("neon", 10).build();

RecipeBuilder.newBuilder("liquid_argon", "mek_changer", 1).addGasInput("argon", 10).addFluidOutput(<fluid:argon> * 10).build();
RecipeBuilder.newBuilder("gas_argon", "mek_changer", 1).addFluidInput(<fluid:argon> * 10).addGasOutput("argon", 10).build();

RecipeBuilder.newBuilder("liquid_krypton", "mek_changer", 1).addGasInput("krypton", 10).addFluidOutput(<fluid:krypton> * 10).build();
RecipeBuilder.newBuilder("gas_krypton", "mek_changer", 1).addFluidInput(<fluid:krypton> * 10).addGasOutput("krypton", 10).build();

RecipeBuilder.newBuilder("liquid_xenon", "mek_changer", 1).addGasInput("xenon", 10).addFluidOutput(<fluid:xenon> * 10).build();
RecipeBuilder.newBuilder("gas_xenon", "mek_changer", 1).addFluidInput(<fluid:xenon> * 10).addGasOutput("xenon", 10).build();

RecipeBuilder.newBuilder("liquid_radon", "mek_changer", 1).addGasInput("radon", 10).addFluidOutput(<fluid:radon> * 10).build();
RecipeBuilder.newBuilder("gas_radon", "mek_changer", 1).addFluidInput(<fluid:radon> * 10).addGasOutput("radon", 10).build();