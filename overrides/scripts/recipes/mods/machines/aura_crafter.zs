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

import scripts.util.machines as MMUtil;

RecipeBuilder.newBuilder("aurune_craft", "aura_crafter", 240)
    .addItemInput(<ore:ingotSky> * 2)
    .addItemInput(<ore:ingotEarth> * 2)
    .addItemInput(<ore:ingotEverite> * 1)
    .addItemInput(<naturesaura:gold_powder> * 2)
    .addItemInput(<ore:gemAmbrosium> * 4)
    .addAuraInput(1000, true)
    .addItemOutput(<additions:greedycraft-aurune_ingot> * 3)
    .build();

RecipeBuilder.newBuilder("aurune_craft_one", "aura_crafter", 100)
    .addItemInput(<naturesaura:infused_iron>* 3)
    .addItemInput(<naturesaura:calling_spirit>).setChance(0.5)
    .addItemInput(<naturesaura:offering_table>).setChance(0)
    .addAuraInput(200, true)
    .addItemOutput(<naturesaura:sky_ingot>)
    .build();

RecipeBuilder.newBuilder("aurune_craft_two", "aura_crafter", 100)
    .addItemInput(<minecraft:skull:1> * 3)
    .addItemInput(<minecraft:obsidian> * 2)
    .addItemInput(<naturesaura:sky_ingot> * 2)
    .addItemInput(<minecraft:nether_star>)
    .addItemInput(<minecraft:sapling:2>).setChance(0)
    .addItemInput(<minecraft:dye:15>)
    .addItemInput(<naturesaura:wood_stand> * 8).setChance(0)
    .addAuraInput(200, true)
    .addItemOutput(<auraddons:block_wither_proofer>)
    .build();

RecipeBuilder.newBuilder("aurune_craft_three", "aura_crafter", 100)
    .addItemInput(<naturesaura:wood_stand> * 8).setChance(0)
    .addItemInput(<minecraft:iron_bars> * 4)
    .addItemInput(<naturesaura:sky_ingot> * 3)
    .addItemInput(<naturesaura:aura_bottle>.withTag({stored_type: "naturesaura:end"}))
    .addItemInput(<naturesaura:ancient_sapling>)
    .addItemInput(<minecraft:dye:15>)
    .addAuraInput(200, true)
    .addItemOutput(<auraddons:block_aura_transporter>)
    .build();

RecipeBuilder.newBuilder("aurune_craft_four", "aura_crafter", 100)
    .addItemInput(<naturesaura:wood_stand> * 8).setChance(0)
    .addItemInput(<naturesaura:token_fear>)
    .addItemInput(<naturesaura:token_rage>)
    .addItemInput(<naturesaura:token_grief>)
    .addItemInput(<naturesaura:token_terror>)
    .addItemInput(<naturesaura:token_euphoria>)
    .addItemInput(<naturesaura:token_sorrow>)
    .addItemInput(<naturesaura:token_joy>)
    .addItemInput(<naturesaura:token_anger>)
    .addItemInput(<minecraft:sapling>).setChance(0)
    .addItemInput(<minecraft:dye:15>)
    .addAuraInput(200, true)
    .addItemOutput(<additions:greedycraft-token_emotion>)
    .build();

RecipeBuilder.newBuilder("aurune_craft_five", "aura_crafter", 100)
    .addItemInput(<naturesaura:wood_stand> * 8).setChance(0)
    .addItemInput(<minecraft:dye:15>)
    .addItemInput(<minecraft:sapling:2>).setChance(0)
    .addItemInput(<minecraft:tnt> * 2)
    .addItemInput(<naturesaura:infused_stone>)
    .addItemInput(<naturesaura:sky_ingot>)
    .addItemInput(<minecraft:gunpowder>)
    .addItemInput(<naturesaura:gold_leaf>)
    .addAuraInput(200, true)
    .addItemOutput(<auraddons:block_disruption_catalyst>)
    .build();

RecipeBuilder.newBuilder("aurune_craft_six", "aura_crafter", 100)
    .addItemInput(<naturesaura:wood_stand> * 8).setChance(0)
    .addItemInput(<minecraft:sapling>).setChance(0)
    .addItemInput(<minecraft:dye:15>)
    .addItemInput(<minecraft:stone> * 3)
    .addItemInput(<minecraft:gold_ingot>)
    .addItemInput(<naturesaura:gold_leaf>)
    .addItemInput(<naturesaura:token_joy>)
    .addAuraInput(200, true)
    .addItemOutput(<naturesaura:nature_altar>)
    .build();

RecipeBuilder.newBuilder("aurune_craft_seven", "aura_crafter", 100)
    .addItemInput(<naturesaura:wood_stand> * 8).setChance(0)
    .addItemInput(<minecraft:sapling>).setChance(0)
    .addItemInput(<minecraft:dye:15>)
    .addItemInput(<naturesaura:infused_iron> * 2)
    .addItemInput(<minecraft:fire_charge>)
    .addItemInput(<naturesaura:infused_stone> * 2)
    .addItemInput(<minecraft:magma>)
    .addItemInput(<minecraft:flint>)
    .addItemInput(<naturesaura:token_fear>)
    .addAuraInput(200, true)
    .addItemOutput(<naturesaura:furnace_heater>)
    .build();

RecipeBuilder.newBuilder("aurune_craft_eight", "aura_crafter", 100)
    .addItemInput(<naturesaura:wood_stand> * 8).setChance(0)
    .addItemInput(<minecraft:sapling>).setChance(0)
    .addItemInput(<minecraft:dye:15>)
    .addItemInput(<naturesaura:gold_leaf> * 2)
    .addItemInput(<minecraft:gold_ingot>)
    .addItemInput(<minecraft:spider_eye>)
    .addAuraInput(200, true)
    .addItemOutput(<naturesaura:eye>)
    .build();

RecipeBuilder.newBuilder("aurune_craft_nine", "aura_crafter", 100)
    .addItemInput(<naturesaura:wood_stand> * 8).setChance(0)
    .addItemInput(<minecraft:sapling:3>).setChance(0)
    .addItemInput(<minecraft:dye:15>)
    .addItemInput(<naturesaura:infused_stone>)
    .addItemInput(<minecraft:glowstone>)
    .addItemInput(<naturesaura:sky_ingot>)
    .addItemInput(<minecraft:brewing_stand>)
    .addItemInput(<naturesaura:gold_leaf>)
    .addItemInput(<naturesaura:gold_brick>)
    .addAuraInput(200, true)
    .addItemOutput(<naturesaura:conversion_catalyst>)
    .build();

RecipeBuilder.newBuilder("aurune_craft_ten", "aura_crafter", 100)
    .addItemInput(<naturesaura:wood_stand> * 8).setChance(0)
    .addItemInput(<minecraft:sapling>).setChance(0)
    .addItemInput(<minecraft:dye:15>)
    .addItemInput(<naturesaura:sky_ingot> * 2)
    .addItemInput(<naturesaura:gold_leaf> * 2)
    .addItemInput(<naturesaura:end_flower>)
    .addItemInput(<naturesaura:eye>)
    .addAuraInput(200, true)
    .addItemOutput(<naturesaura:eye_improved>)
    .build();

RecipeBuilder.newBuilder("aurune_craft_eleven", "aura_crafter", 100)
    .addItemInput(<naturesaura:wood_stand> * 8).setChance(0)
    .addItemInput(<minecraft:sapling> * 2).setChance(0)
    .addItemInput(<minecraft:dye:15>)
    .addItemInput(<minecraft:yellow_flower>)
    .addItemInput(<minecraft:red_flower>)
    .addItemInput(<minecraft:reeds>)
    .addItemInput(<naturesaura:gold_leaf>)
    .addItemInput(<minecraft:wheat_seeds>)
    .addAuraInput(200, true)
    .addItemOutput(<naturesaura:ancient_sapling>)
    .build();
    
RecipeBuilder.newBuilder("aurune_craft_twelve", "aura_crafter", 100)
    .addItemInput(<naturesaura:wood_stand> * 8).setChance(0)
    .addItemInput(<minecraft:sapling>).setChance(0)
    .addItemInput(<minecraft:dye:15>)
    .addItemInput(<naturesaura:infused_iron_block> * 2)
    .addItemInput(<naturesaura:sky_ingot> * 2)
    .addItemInput(<additions:greedycraft-twilight_crystal_ingot> * 2)
    .addItemInput(<additions:greedycraft-daynight_ingot> * 2)
    .addAuraInput(200, true)
    .addItemOutput(<additions:greedycraft-fabric_of_nature>)
    .build();

RecipeBuilder.newBuilder("aurune_craft_thirteen", "aura_crafter", 100)
    .addItemInput(<naturesaura:wood_stand> * 8).setChance(0)
    .addItemInput(<minecraft:sapling>).setChance(0)
    .addItemInput(<minecraft:dye:15>)
    .addItemInput(<botania:manaresource:3> * 4)
    .addItemInput(<additions:greedycraft-token_emotion> * 2)
    .addItemInput(<additions:greedycraft-terra_alloy_block>)
    .addItemInput(<additions:greedycraft-fusion_matrix_block>)
    .addAuraInput(200, true)
    .addItemOutput(<additions:greedycraft-fabric_of_nature>)
    .build();

RecipeBuilder.newBuilder("aurune_craft_fourteen", "aura_crafter", 100)
    .addItemInput(<naturesaura:wood_stand> * 8).setChance(0)
    .addItemInput(<minecraft:sapling>).setChance(0)
    .addItemInput(<minecraft:dye:15>)
    .addItemInput(<naturesaura:infused_stone>)
    .addItemInput(<minecraft:flint>)
    .addItemInput(<minecraft:piston>)
    .addItemInput(<naturesaura:gold_brick>)
    .addItemInput(<naturesaura:token_anger>)
    .addAuraInput(200, true)
    .addItemOutput(<naturesaura:crushing_catalyst>)
    .build();

RecipeBuilder.newBuilder("aurune_craft_fifteen", "aura_crafter", 100)
    .addItemInput(<naturesaura:wood_stand> * 8).setChance(0)
    .addItemInput(<minecraft:sapling>).setChance(0)
    .addItemInput(<minecraft:dye:15>)
    .addItemInput(<naturesaura:aura_cache>).setChance(0)
    .addItemInput(<naturesaura:gold_powder> * 2)
    .addItemInput(<naturesaura:sky_ingot>)
    .addAuraInput(200, true)
    .addItemOutput(<naturesaura:effect_powder>.withTag({effect: "naturesaura:cache_recharge"}) * 32)
    .build();

RecipeBuilder.newBuilder("aurune_craft_sixteen", "aura_crafter", 100)
    .addItemInput(<naturesaura:wood_stand> * 8).setChance(0)
    .addItemInput(<minecraft:sapling:3>).setChance(0)
    .addItemInput(<minecraft:dye:15>)
    .addItemInput(<naturesaura:sky_ingot>)
    .addItemInput(<naturesaura:gold_powder> * 2)
    .addItemInput(<minecraft:egg>)
    .addAuraInput(200, true)
    .addItemOutput(<naturesaura:effect_powder>.withTag({effect: "naturesaura:animal"}) * 8)
    .build();

RecipeBuilder.newBuilder("aurune_craft_seventeen", "aura_crafter", 100)
    .addItemInput(<naturesaura:wood_stand> * 8).setChance(0)
    .addItemInput(<minecraft:sapling>).setChance(0)
    .addItemInput(<minecraft:dye:15>)
    .addItemInput(<minecraft:wheat>)
    .addItemInput(<naturesaura:sky_ingot>)
    .addItemInput(<naturesaura:gold_powder> * 2)
    .addAuraInput(200, true)
    .addItemOutput(<naturesaura:effect_powder>.withTag({effect: "naturesaura:plant_boost"}) *24)
    .build();

RecipeBuilder.newBuilder("aurune_craft_eighteen", "aura_crafter", 100)
    .addItemInput(<naturesaura:wood_stand> * 8).setChance(0)
    .addItemInput(<minecraft:sapling>).setChance(0)
    .addItemInput(<minecraft:dye:15>)
    .addItemInput(<naturesaura:gold_powder> * 2)
    .addItemInput(<minecraft:redstone_ore>)
    .addItemInput(<minecraft:diamond_ore>)
    .addAuraInput(200, true)
    .addItemOutput(<naturesaura:effect_powder>.withTag({effect: "naturesaura:ore_spawn"}) *4)
    .build();

RecipeBuilder.newBuilder("aurune_craft_nineteen", "aura_crafter", 100)
    .addItemInput(<naturesaura:wood_stand> * 8).setChance(0)
    .addItemInput(<minecraft:sapling>).setChance(0)
    .addItemInput(<minecraft:dye:15>)
    .addItemInput(<minecraft:red_flower>)
    .addItemInput(<minecraft:torch>)
    .addItemInput(<minecraft:apple>)
    .addItemInput(<minecraft:iron_ingot>)
    .addItemInput(<naturesaura:gold_leaf>)
    .addItemInput(<naturesaura:aura_bottle>.withTag({stored_type: "naturesaura:overworld"}))
    .addAuraInput(200, true)
    .addItemOutput(<naturesaura:token_joy>)
    .build();

RecipeBuilder.newBuilder("aurune_craft_twenty", "aura_crafter", 100)
    .addItemInput(<naturesaura:wood_stand> * 8).setChance(0)
    .addItemInput(<minecraft:sapling>).setChance(0)
    .addItemInput(<minecraft:dye:15>)
    .addItemInput(<naturesaura:aura_bottle>.withTag({stored_type: "naturesaura:nether"}))
    .addItemInput(<minecraft:gunpowder>)
    .addItemInput(<minecraft:magma>)
    .addItemInput(<minecraft:blaze_powder>)
    .addItemInput(<minecraft:ender_pearl>)
    .addItemInput(<naturesaura:gold_leaf>)
    .addAuraInput(200, true)
    .addItemOutput(<naturesaura:token_anger>)
    .build();

RecipeBuilder.newBuilder("aurune_craft_twentyone", "aura_crafter", 100)
    .addItemInput(<naturesaura:wood_stand> * 8).setChance(0)
    .addItemInput(<minecraft:sapling>).setChance(0)
    .addItemInput(<minecraft:dye:15>)
    .addItemInput(<minecraft:ghast_tear>)
    .addItemInput(<minecraft:glass>)
    .addItemInput(<naturesaura:aura_bottle>.withTag({stored_type: "naturesaura:overworld"}))
    .addItemInput(<naturesaura:gold_leaf>)
    .addItemInput(<minecraft:chicken>)
    .addItemInput(<minecraft:fish>)
    .addAuraInput(200, true)
    .addItemOutput(<minecraft:fish>)
    .build();

RecipeBuilder.newBuilder("aurune_craft_twentytwo", "aura_crafter", 100)
    .addItemInput(<naturesaura:wood_stand> * 8).setChance(0)
    .addItemInput(<minecraft:sapling>).setChance(0)
    .addItemInput(<minecraft:dye:15>)
    .addItemInput(<naturesaura:aura_bottle>.withTag({stored_type: "naturesaura:nether"}))
    .addItemInput(<minecraft:bone>)
    .addItemInput(<minecraft:rotten_flesh>)
    .addItemInput(<naturesaura:gold_leaf>)
    .addItemInput(<minecraft:soul_sand>)
    .addItemInput(<minecraft:feather>)
    .addAuraInput(200, true)
    .addItemOutput(<naturesaura:token_fear>)
    .build();

RecipeBuilder.newBuilder("aurune_craft_twentythree", "aura_crafter", 100)
    .addItemInput(<naturesaura:offering_table>).setChance(0)
    .addItemInput(<naturesaura:calling_spirit>).setChance(0.5)
    .addItemInput(<naturesaura:token_anger>)
    .addAuraInput(200, true)
    .addItemOutput(<naturesaura:token_rage>)
    .build();
    
RecipeBuilder.newBuilder("aurune_craft_twentyfour", "aura_crafter", 100)
    .addItemInput(<naturesaura:offering_table>).setChance(0)
    .addItemInput(<naturesaura:calling_spirit>).setChance(0.5)
    .addItemInput(<naturesaura:token_sorrow>)
    .addAuraInput(200, true)
    .addItemOutput(<naturesaura:token_grief>)
    .build();

RecipeBuilder.newBuilder("aurune_craft_twentyfive", "aura_crafter", 100)
    .addItemInput(<naturesaura:offering_table>).setChance(0)
    .addItemInput(<naturesaura:calling_spirit>).setChance(0.5)
    .addItemInput(<naturesaura:token_fear>)
    .addAuraInput(200, true)
    .addItemOutput(<naturesaura:token_terror>)
    .build();

RecipeBuilder.newBuilder("aurune_craft_twentysix", "aura_crafter", 100)
    .addItemInput(<naturesaura:offering_table>).setChance(0)
    .addItemInput(<naturesaura:calling_spirit>).setChance(0.5)
    .addItemInput(<naturesaura:token_joy>)
    .addAuraInput(200, true)
    .addItemOutput(<naturesaura:token_euphoria>)
    .build();

RecipeBuilder.newBuilder("aurune_craft_twentyseven", "aura_crafter", 100)
    .addGasInput(<gas:air> * 1000)
    .addItemInput(<naturesaura:bottle_two_the_rebottling>)
    .addAuraInput(200, true)
    .addItemOutput(<naturesaura:aura_bottle>.withTag({stored_type: "naturesaura:overworld"}))
    .build();

RecipeBuilder.newBuilder("aurune_craft_twentyeight", "aura_crafter", 100)
    .addGasInput(<gas:airnether> * 1000)
    .addItemInput(<naturesaura:bottle_two_the_rebottling>)
    .addAuraInput(200, true)
    .addItemOutput(<naturesaura:aura_bottle>.withTag({stored_type: "naturesaura:nether"}))
    .build();

RecipeBuilder.newBuilder("aurune_craft_twentynine", "aura_crafter", 100)
    .addGasInput(<gas:airend> * 1000)
    .addItemInput(<naturesaura:bottle_two_the_rebottling>)
    .addAuraInput(200, true)
    .addItemOutput(<naturesaura:aura_bottle>.withTag({stored_type: "naturesaura:end"}))
    .build();

