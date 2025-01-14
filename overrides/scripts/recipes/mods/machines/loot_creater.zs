/*
 * This script is created for the GreedyCraft Tweaks by 咕咕咕.
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

RecipeBuilder.newBuilder("gaia1" , "loot_creater" , "500")
    .addFluidInput(<liquid:lifeessence> * 10000)
    .addItemInput(<botania:manaresource:4> * 1)
    .addEnergyPerTickInput(10000)
    .addItemOutput(<botania:manaresource:5> * 8)
    .build();

RecipeBuilder.newBuilder("gaia2" , "loot_creater" , "700")
    .addFluidInput(<liquid:lifeessence> * 25000)
    .addItemInput(<botania:manaresource:14> * 1)
    .addEnergyPerTickInput(20000)
    .addItemOutput(<botania:manaresource:5> * 16)
    .addItemOutput(<botania:dice>)
    .build();

RecipeBuilder.newBuilder("gaia3" , "loot_creater" , "850")
    .addFluidInput(<liquid:lifeessence> * 50000)
    .addItemInput(<extrabotany:material:6> * 1)
    .addEnergyPerTickInput(50000)
    .addItemOutput(<extrabotany:treasurebox> * 1)
    .build();

RecipeBuilder.newBuilder("gaia3ex" , "loot_creater" , "850")
    .addFluidInput(<liquid:lifeessence> * 100000)
    .addItemInput(<extrabotany:material:6> * 1)
    .addItemInput(<gct_mobs:gaia_heart> * 1).setChance(0.0)
    .addEnergyPerTickInput(75000)
    .addItemOutput(<extrabotany:treasurebox> * 1)
    .addItemOutput(<gct_mobs:gaia_heart> * 1)
    .addItemOutput(<gct_mobs:gaia_heart> * 1).setChance(0.5)
    .build();


RecipeBuilder.newBuilder("kiana" , "loot_creater" , "900")
    .addFluidInput(<liquid:lifeessence> * 100000)
    .addItemInput(<extrabotany:material:9> * 1)
    .addEnergyPerTickInput(100000)
    .addItemOutput(<extrabotany:treasurebox> * 1)
    .addItemOutput(<extrabotany:specialbag> * 3)
    .build();

RecipeBuilder.newBuilder("kianaex" , "loot_creater" , "900")
    .addFluidInput(<liquid:lifeessence> * 250000)
    .addItemInput(<extrabotany:material:9> * 1)
    .addItemInput(<gct_ores:ordered_core> * 1).setChance(0.0)
    .addEnergyPerTickInput(200000)
    .addItemOutput(<extrabotany:treasurebox> * 1)
    .addItemOutput(<extrabotany:specialbag> * 3)
    .addItemOutput(<additions:botaniaddon-kianate_ingot> * 1)
    .addItemOutput(<additions:botaniaddon-kianate_ingot> * 1).setChance(0.5)
    .build();

RecipeBuilder.newBuilder("chaos" , "loot_creater" , "1500")
    .addFluidInput(<liquid:lifeessence> * 1000000)
    .addItemInput(<draconicevolution:chaotic_core> * 1)
    .addEnergyPerTickInput(1000000)
    .addItemOutput(<draconicevolution:chaos_shard> * 5)
    .addItemOutput(<draconicadditions:chaos_heart> * 1)
    .build();

RecipeBuilder.newBuilder("storm" , "loot_creater" , "1750")
    .addFluidInput(<liquid:lifeessence> * 2500000)
    .addItemInput(<gct_ores:creepy_witherstorm_doll> * 1)
    .addEnergyPerTickInput(2500000)
    .addItemOutput(<gct_ores:stormy_shard> * 5)
    .addItemOutput(<ageofminecraft:withered_nether_star> * 5)
    .build();

RecipeBuilder.newBuilder("blackstone" , "loot_creater" , "500")
    .addFluidInput(<liquid:lifeessence> * 250000)
    .addItemInput(<gct_ores:senterian_builder_lab> * 1)
    .addItemInput(<journey:lament_deconstructor_nether> * 1).setChance(0.0)
    .addItemInput(<journey:lament_deconstructor_boil> * 1).setChance(0.0)
    .addItemInput(<journey:lament_deconstructor_euca> * 1).setChance(0.0)
    .addItemInput(<journey:lament_deconstructor_depths> * 1).setChance(0.0)
    .addItemInput(<journey:lament_deconstructor_corba> * 1).setChance(0.0)
    .addItemInput(<journey:lament_deconstructor_terrania> * 1).setChance(0.0)
    .addItemInput(<journey:lament_deconstructor_cloudia> * 1).setChance(0.0)
    .addItemInput(<journey:lament_deconstructor_sentry> * 1).setChance(0.0)
    .addItemInput(<gct_ores:senterian_wrench> * 1).setChance(0.0)
    .addEnergyPerTickInput(250000)
    .addItemOutput(<additions:greedycraft-dullium_ingot> * 48)
    .build();

RecipeBuilder.newBuilder("destroyer" , "loot_creater" , "500")
    .addFluidInput(<liquid:lifeessence> * 10000)
    .addItemInput(<defiledlands:calling_stone> * 1)
    .addEnergyPerTickInput(10000)
    .addItemOutput(<defiledlands:essence_destroyer> * 16)
    .build();

RecipeBuilder.newBuilder("mourner" , "loot_creater" , "750")
    .addFluidInput(<liquid:lifeessence> * 50000)
    .addItemInput(<defiledlands:idol_sorrow> * 1)
    .addEnergyPerTickInput(50000)
    .addItemOutput(<defiledlands:essence_mourner> * 16)
    .build();

RecipeBuilder.newBuilder("rod" , "loot_creater" , "200")
    .addFluidInput(<liquid:lifeessence> * 250000)
    .addEnergyPerTickInput(100000)
    .addItemInput(<jaopca:gear.thermallite> * 1).setChance(0.0)
    .addItemOutput(<gct_mobs:bthdz_rod> * 1).setChance(0.3)
    .addItemOutput(<gct_mobs:bligtz_rod> * 1).setChance(0.3)
    .addItemOutput(<gct_mobs:bninz_rod> * 1).setChance(0.3)
    .addItemOutput(<gct_mobs:bnatuz_rod> * 1).setChance(0.3)
    .addItemOutput(<thermalfoundation:material:2048> * 1).setChance(0.3)
    .addItemOutput(<thermalfoundation:material:2050> * 1).setChance(0.3)
    .addItemOutput(<thermalfoundation:material:2052> * 1).setChance(0.3)
    .build();

RecipeBuilder.newBuilder("betwnite" , "loot_creater" , "250")
    .addFluidInput(<liquid:lifeessence> * 100000)
    .addItemInput(<jaopca:block.betwnite> * 1).setChance(0.0)
    .addEnergyPerTickInput(50000)
    .addItemOutput(<additions:greedycraft-rotiron_scrap> * 1).setChance(0.5)
    .addItemOutput(<additions:greedycraft-dirtshape> * 1)
    .addItemOutput(<additions:greedycraft-bone_shard> * 1)
    .addItemOutput(<thebetweenlands:sap_spit> *1)
    .build();

RecipeBuilder.newBuilder("twilit" , "loot_creater" , "250")
    .addFluidInput(<liquid:lifeessence> * 100000)
    .addItemInput(<jaopca:block.twilit> * 1).setChance(0.0)
    .addEnergyPerTickInput(50000)
    .addItemOutput(<divinerpg:arcanium> * 1)
    .addItemOutput(<additions:greedycraft-eden_ingot> * 1)
    .addItemOutput(<additions:greedycraft-wildwood_ingot> * 1)
    .addItemOutput(<additions:greedycraft-apalachia_ingot> *1)
    .addItemOutput(<additions:greedycraft-skythern_ingot> * 1)
    .addItemOutput(<additions:greedycraft-mortum_ingot> * 1)
    .build();

RecipeBuilder.newBuilder("blacksun" , "loot_creater" , "250")
    .addFluidInput(<liquid:lifeessence> * 50000)
    .addItemInput(<additions:bloody-gloomy_passport> * 1)
    .addEnergyPerTickInput(50000)
    .addItemOutput(<additions:bloody-darkest_core> * 16)
    .build();
