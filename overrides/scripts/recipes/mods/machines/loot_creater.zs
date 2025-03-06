/*
 * This script is created for the GreedyCraft Tweaks by 咕咕咕.
 */

#priority 50
#loader crafttweaker reloadable

import crafttweaker.oredict.IOreDictEntry;
import crafttweaker.item.IItemStack;
import crafttweaker.data.IData;
import crafttweaker.item.IIngredient;
import crafttweaker.liquid.ILiquidStack;

import mods.modularmachinery.RecipePrimer;
import mods.modularmachinery.RecipeBuilder;
import mods.modularmachinery.RecipeCheckEvent;
import mods.modularmachinery.FactoryRecipeStartEvent;
import mods.modularmachinery.FactoryRecipeTickEvent;
import mods.modularmachinery.FactoryRecipeFinishEvent;
import mods.modularmachinery.RecipeModifierBuilder;
import mods.modularmachinery.RecipeAdapterBuilder;
//import mods.modularmachinery.SmartInterfaceUpdateEvent;
import mods.modularmachinery.MMEvents;
import mods.modularmachinery.ControllerGUIRenderEvent;
import mods.modularmachinery.IMachineController;
import mods.modularmachinery.SmartInterfaceData;
import mods.modularmachinery.MachineModifier;
import mods.modularmachinery.MachineTickEvent;
import mods.modularmachinery.SmartInterfaceType;
import mods.modularmachinery.FactoryRecipeThread;

import mods.ctutils.utils.Math;
import mods.jei.JEI;

RecipeBuilder.newBuilder("gaia1" , "loot_creater" , 500, 2)
    .addFluidInput(<liquid:lifeessence> * 10000)
    .addItemInput(<botania:manaresource:4>)
    .addEnergyPerTickInput(10000)
    .addRecipeTooltip("虚空产物，总要付出些代价不是吗")
    .addItemOutput(<botania:manaresource:5> *6)
    .build();

RecipeBuilder.newBuilder("gaia2" , "loot_creater" , 700, 2)
    .addFluidInput(<liquid:lifeessence> * 25000)
    .addItemInput(<botania:manaresource:14>)
    .addEnergyPerTickInput(20000)
    .addRecipeTooltip("虚空产物，总要付出些代价不是吗")
    .addItemOutput(<botania:manaresource:5> * 8)
    .addItemOutput(<botania:dice>)
    .build();

RecipeBuilder.newBuilder("gaia3" , "loot_creater" , 850, 2)
    .addFluidInput(<liquid:lifeessence> * 50000)
    .addItemInput(<extrabotany:material:6>)
    .addEnergyPerTickInput(50000)
    .addItemOutput(<extrabotany:treasurebox> * 1)
    .build();

RecipeBuilder.newBuilder("gaia3ex" , "loot_creater" , 850, 2)
    .addFluidInput(<liquid:lifeessence> * 100000)
    .addItemInput(<extrabotany:material:6> * 1)
    .addItemInput(<gct_mobs:gaia_heart> * 1).setChance(0)
    .addEnergyPerTickInput(75000)
    .addItemOutput(<extrabotany:treasurebox> * 1)
    .addItemOutput(<gct_mobs:gaia_heart> * 1)
    .addItemOutput(<gct_mobs:gaia_heart> * 1).setChance(0.5)
    .build();

RecipeBuilder.newBuilder("kiana" , "loot_creater" , 900, 2)
    .addFluidInput(<liquid:lifeessence> * 100000)
    .addItemInput(<extrabotany:material:9>)
    .addEnergyPerTickInput(100000)
    .addItemOutput(<extrabotany:treasurebox> * 1)
    .addItemOutput(<extrabotany:specialbag> * 3)
    .build();

RecipeBuilder.newBuilder("kianaex" , "loot_creater" , 900, 2)
    .addFluidInput(<liquid:lifeessence> * 250000)
    .addItemInput(<extrabotany:material:9> * 1)
    .addItemInput(<gct_ores:ordered_core> * 1).setChance(0)
    .addEnergyPerTickInput(200000)
    .addItemOutput(<extrabotany:treasurebox> * 1)
    .addItemOutput(<extrabotany:specialbag> * 3)
    .addItemOutput(<additions:botaniaddon-kianate_ingot> * 1)
    .addItemOutput(<additions:botaniaddon-kianate_ingot> * 1).setChance(0.5)
    .build();

RecipeBuilder.newBuilder("chaos" , "loot_creater" , 1500, 2)
    .addFluidInput(<liquid:lifeessence> * 1000000)
    .addItemInput(<tconevo:metal_block:2> * 1).setChance(0.5)
    .addEnergyPerTickInput(1000000)
    .addItemOutput(<draconicevolution:chaos_shard> * 10)
    .addItemOutput(<contenttweaker:chaos_heart> * 3)
    .build();

RecipeBuilder.newBuilder("storm" , "loot_creater" , 1750, 2)
    .addFluidInput(<liquid:lifeessence> * 2500000)
    .addItemInput(<gct_ores:creepy_witherstorm_doll> * 1).setChance(0.5)
    .addEnergyPerTickInput(2500000)
    .addItemOutput(<gct_ores:stormy_shard> * 10)
    .addItemOutput(<ageofminecraft:withered_nether_star> * 5)
    .build();

RecipeBuilder.newBuilder("blackstone" , "loot_creater" , 500, 2)
    .addFluidInput(<liquid:lifeessence> * 250000)
    .addItemInput(<gct_ores:senterian_builder_lab> * 1).setChance(0)
    .addEnergyPerTickInput(250000)
    .addItemOutput(<additions:greedycraft-dullium_ingot> * 32)
    .build();

RecipeBuilder.newBuilder("destroyer" , "loot_creater" , 500, 2)
    .addFluidInput(<liquid:lifeessence> * 10000)
    .addItemInput(<defiledlands:calling_stone> * 1).setChance(0.1)
    .addEnergyPerTickInput(10000)
    .addItemOutput(<defiledlands:essence_destroyer> * 16)
    .build();

RecipeBuilder.newBuilder("mourner" , "loot_creater" , 750, 2)
    .addFluidInput(<liquid:lifeessence> * 50000)
    .addItemInput(<defiledlands:idol_sorrow> * 1).setChance(0.1)
    .addEnergyPerTickInput(50000)
    .addItemOutput(<defiledlands:essence_mourner> * 16)
    .build();

RecipeBuilder.newBuilder("rod" , "loot_creater" , 200, 2)
    .addFluidInput(<liquid:lifeessence> * 250000)
    .addEnergyPerTickInput(100000)
    .addItemInput(<jaopca:plate.thermallite> * 1).setChance(0)
    .addItemOutput(<gct_mobs:bthdz_rod> * 8)
    .addItemOutput(<gct_mobs:bligtz_rod> * 8)
    .addItemOutput(<gct_mobs:bninz_rod> * 8)
    .addItemOutput(<gct_mobs:bnatuz_rod> * 8)
    .addItemOutput(<thermalfoundation:material:2048> * 8)
    .addItemOutput(<thermalfoundation:material:2050> * 8)
    .addItemOutput(<thermalfoundation:material:2052> * 8)
    .addItemOutput(<minecraft:blaze_rod> * 8)
    .build();

RecipeBuilder.newBuilder("betwnite" , "loot_creater" , 250,2)
    .addFluidInput(<liquid:lifeessence> * 100000)
    .addItemInput(<jaopca:block.betwnite> * 1).setChance(0)
    .addEnergyPerTickInput(50000)
    .addItemOutput(<additions:greedycraft-rotiron_scrap> * 16)
    .addItemOutput(<additions:greedycraft-dirtshape> * 8)
    .addItemOutput(<additions:greedycraft-bone_shard> * 8)
    .addItemOutput(<thebetweenlands:sap_spit> * 8)
    .build();

RecipeBuilder.newBuilder("twilit" , "loot_creater" , 250, 2)
    .addFluidInput(<liquid:lifeessence> * 100000)
    .addItemInput(<jaopca:block.twilit> * 1).setChance(0)
    .addEnergyPerTickInput(50000)
    .addItemOutput(<divinerpg:arcanium> * 16)
    .addItemOutput(<additions:greedycraft-eden_ingot> * 8)
    .addItemOutput(<additions:greedycraft-wildwood_ingot> * 8)
    .addItemOutput(<additions:greedycraft-apalachia_ingot> * 8)
    .addItemOutput(<additions:greedycraft-skythern_ingot> * 8)
    .addItemOutput(<additions:greedycraft-mortum_ingot> * 8)
    .build();

RecipeBuilder.newBuilder("evilcraft" , "loot_creater" , 250, 2)
    .addFluidInput(<liquid:lifeessence> * 100000)
    .addItemInput(<additions:bloody-gloomy_passport> * 1).setChance(0.3)
    .addEnergyPerTickInput(50000)
    .addItemOutput(<additions:bloody-darkest_core>.withTag({display: {Name: "§0至暗之核"}}) * 8)
    .build();

