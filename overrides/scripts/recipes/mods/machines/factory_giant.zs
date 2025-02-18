//by咕咕咕
//添加配方请按照注释添加

#priority 50
#reloadable

import crafttweaker.oredict.IOreDictEntry;
import crafttweaker.item.IItemStack;
import crafttweaker.data.IData;
import crafttweaker.item.IIngredient;
import crafttweaker.liquid.ILiquidStack;

import mods.modularmachinery.RecipePrimer;
import mods.modularmachinery.RecipeBuilder;

import mods.modularmachinery.IMachineController;
import mods.modularmachinery.RecipeModifierBuilder;
import mods.modularmachinery.ActiveMachineRecipe;
import mods.modularmachinery.RecipeAdapterBuilder;
import mods.modularmachinery.MachineModifier;

import mods.modularmachinery.MMEvents;
import mods.modularmachinery.FactoryRecipeThread;
import mods.modularmachinery.FactoryRecipeTickEvent;
import mods.modularmachinery.FactoryRecipeFinishEvent;

import mods.zenutils.DataUpdateOperation.OVERWRITE;
import mods.zenutils.DataUpdateOperation.APPEND;
import mods.zenutils.DataUpdateOperation.MERGE;
import mods.zenutils.DataUpdateOperation.REMOVE;
import mods.zenutils.DataUpdateOperation.BUMP;

MachineModifier.setMaxThreads("factory_giant", 64);
MachineModifier.setInternalParallelism("factory_giant", 16);

//添加物品
/*val add as IItemStack[] = [
    ];
    for item in add {
        JEI.addItem(item);
    }*/
//删除配方
val del as IItemStack[] = [
    <extendedae:infinity_cell>
];
for item in del {
    recipes.remove(item);
}


//ae相关
RecipeBuilder.newBuilder("fluix" , "factory_giant" , "1")
    .addItemInput(<appliedenergistics2:material:1> * 1)
    .addItemInput(<minecraft:redstone> * 1)
    .addItemInput(<minecraft:quartz> * 1)
    .addEnergyPerTickInput(1000)
    .addItemOutput(<appliedenergistics2:material:7> * 4)
    .build();

RecipeBuilder.newBuilder("ae1" , "factory_giant" , "1")
    .addItemInput(<appliedenergistics2:material:5> * 4)
    .addItemInput(<minecraft:gold_ingot> * 4)
    .addItemInput(<minecraft:redstone> * 4)
    .addEnergyPerTickInput(1000)
    .addItemOutput(<appliedenergistics2:material:22> * 8)
    .build();

RecipeBuilder.newBuilder("ae2" , "factory_giant" , "1")
    .addItemInput(<appliedenergistics2:material:10> * 4)
    .addItemInput(<appliedenergistics2:material:5> * 4)
    .addItemInput(<minecraft:redstone> * 4)
    .addEnergyPerTickInput(1000)
    .addItemOutput(<appliedenergistics2:material:23> * 8)
    .build();

RecipeBuilder.newBuilder("ae3" , "factory_giant" , "1")
    .addItemInput(<minecraft:diamond> * 4)
    .addItemInput(<appliedenergistics2:material:5> * 4)
    .addItemInput(<minecraft:redstone> * 4)
    .addEnergyPerTickInput(1000)
    .addItemOutput(<appliedenergistics2:material:24> * 8)
    .build();

RecipeBuilder.newBuilder("ae4" , "factory_giant" , "1")
    .addItemInput(<threng:material:5> * 4)
    .addItemInput(<appliedenergistics2:material:5> * 4)
    .addItemInput(<minecraft:redstone> * 4)
    .addEnergyPerTickInput(1000)
    .addItemOutput(<threng:material:6> * 8)
    .build();

RecipeBuilder.newBuilder("ae5" , "factory_giant" , "1")
    .addItemInput(<threng:material:13> * 4)
    .addItemInput(<appliedenergistics2:material:5> * 4)
    .addItemInput(<minecraft:redstone> * 4)
    .addEnergyPerTickInput(1000)
    .addItemOutput(<threng:material:14> * 8)
    .build();

RecipeBuilder.newBuilder("ae6" , "factory_giant" , "1")
    .addItemInput(<additions:elements-germanium_ingot> * 4)
    .addItemInput(<appliedenergistics2:material:5> * 4)
    .addItemInput(<minecraft:redstone> * 4)
    .addEnergyPerTickInput(1000)
    .addItemOutput(<additions:greedycraft-wireless_processor> * 8)
    .build();

RecipeBuilder.newBuilder("ae7" , "factory_giant" , "1")
    .addItemInput(<minecraft:iron_ingot> * 4)
    .addItemInput(<appliedenergistics2:material:7> * 4)
    .addItemInput(<minecraft:coal> * 4)
    .addEnergyPerTickInput(1000)
    .addItemOutput(<threng:material> * 8)
    .build();

RecipeBuilder.newBuilder("yuanshi" , "factory_giant" , "1000")
    .addItemInput(<appliedenergistics2:material:39> * 1)
    .addItemInput(<nuclearcraft:cobblestone_generator_dense> * 2048)
    .addRecipeTooltip("§4我超，圆(石)")
    .addEnergyPerTickInput(10000)
    .addItemOutput(<extendedae:infinity_cell>.withTag({r: {Craft: 0 as byte, Cnt: 1 as long, id: "minecraft:cobblestone", Count: 1, Damage: 0 as short, Req: 0 as long}, t: "i"}))
    .build();

RecipeBuilder.newBuilder("shuicao_zip" , "factory_giant" , "1000")
    .addItemInput(<appliedenergistics2:material:39> * 1)
    .addItemInput(<cookingforblockheads:sink> * 1)
    .addRecipeTooltip("§4所以为什么不用水槽呢")
    .addEnergyPerTickInput(10000)
    .addItemOutput(<extendedae:infinity_cell>.withTag({r: {FluidName: "water", Craft: 0 as byte, Cnt: 1 as long, Count: 0 as byte, Req: 0 as long}, t: "f"}))
    .build();

RecipeBuilder.newBuilder("ae8" , "factory_giant" , "1")
    .addItemInput(<appliedenergistics2:material:22> * 4)
    .addItemInput(<appliedenergistics2:material:24> * 4)
    .addItemInput(<appliedenergistics2:material:6> * 4)
    .addEnergyPerTickInput(1000)
    .addItemOutput(<crazyae:material:16> * 8)
    .build();

RecipeBuilder.newBuilder("ae9" , "factory_giant" , "1")
    .addItemInput(<actuallyadditions:item_crystal:4> * 4)
    .addItemInput(<additions:elements-germanium_ingot> * 4)
    .addItemInput(<minecraft:redstone> * 4)
    .addEnergyPerTickInput(1000)
    .addItemOutput(<additions:greedycraft-calculation_processor_2> * 8)
    .build();

RecipeBuilder.newBuilder("ae10" , "factory_giant" , "1")
    .addItemInput(<defiledlands:scarlite> * 4)
    .addItemInput(<additions:elements-germanium_ingot> * 4)
    .addItemInput(<minecraft:redstone> * 4)
    .addEnergyPerTickInput(1000)
    .addItemOutput(<additions:greedycraft-engineering_processor_2> * 8)
    .build();

RecipeBuilder.newBuilder("ae11" , "factory_giant" , "1")
    .addItemInput(<thermalfoundation:material:134> * 4)
    .addItemInput(<additions:elements-germanium_ingot> * 4)
    .addItemInput(<minecraft:redstone> * 4)
    .addEnergyPerTickInput(1000)
    .addItemOutput(<additions:greedycraft-logic_processor_2> * 8)
    .build();
RecipeBuilder.newBuilder("ae12" , "factory_giant" , "1")
    .addItemInput(<nae2:upgrade> * 64)
    .addEnergyPerTickInput(1000)
    .addItemOutput(<crazyae:upgrade:1> * 1)
    .build();
RecipeBuilder.newBuilder("ae13" , "factory_giant" , "1")
    .addItemInput(<crazyae:upgrade:1> * 64)
    .addEnergyPerTickInput(1000)
    .addItemOutput(<crazyae:upgrade:2> * 1)
    .build();
//合金
RecipeBuilder.newBuilder("balancite_ingot" , "factory_giant" , "1")
    .addItemInput(<additions:aeroite_ingot> * 1)
    .addItemInput(<additions:aqualite_ingot> * 1)
    .addItemInput(<additions:asgardium_ingot> * 1)
    .addItemInput(<additions:ignite_ingot> * 1)
    .addEnergyPerTickInput(1000)
    .addItemOutput(<additions:greedycraft-balancite_ingot> * 4)
    .build();

RecipeBuilder.newBuilder("bronze" , "factory_giant" , "1")
    .addItemInput(<thermalfoundation:material:128> * 3)
    .addItemInput(<thermalfoundation:material:129> * 1)
    .addEnergyPerTickInput(1000)
    .addItemOutput(<thermalfoundation:material:163> * 4)
    .build();

RecipeBuilder.newBuilder("invar" , "factory_giant" , "1")
    .addItemInput(<thermalfoundation:material:133> * 1)
    .addItemInput(<ore:ingotIron> * 2)
    .addEnergyPerTickInput(1000)
    .addItemOutput(<thermalfoundation:material:162> * 3)
    .build();

RecipeBuilder.newBuilder("steel" , "factory_giant" , "1")
    .addItemInput(<ore:ingotIron> * 1)
    .addItemInput(<ore:coal> * 1)
    .addEnergyPerTickInput(1000)
    .addItemOutput(<thermalfoundation:material:160> * 2)
    .build();
RecipeBuilder.newBuilder("manganese_steel" , "factory_giant" , "1")
    .addItemInput(<thermalfoundation:material:160> * 2)
    .addItemInput(<additions:manganese_ingot> * 1)
    .addEnergyPerTickInput(1000)
    .addItemOutput(<additions:manganese_steel_ingot> * 2)
    .build();
RecipeBuilder.newBuilder("stainless_steel_ingot" , "factory_giant" , "1")
    .addItemInput(<additions:manganese_steel_ingot> * 4)
    .addItemInput(<thermalfoundation:material:133> * 1)
    .addItemInput(<additions:chromium_ingot> * 1)
    .addEnergyPerTickInput(1000)
    .addItemOutput(<additions:stainless_steel_ingot> * 4)
    .build();

RecipeBuilder.newBuilder("ingotModularium" , "factory_giant" , "1")
    .addItemInput(<minecraft:iron_ingot> * 1)
    .addItemInput(<thermalfoundation:material:163> * 1)
    .addItemInput(<minecraft:redstone> * 1)
    .addEnergyPerTickInput(1000)
    .addItemOutput(<modularmachinery:itemmodularium> * 2)
    .build();

RecipeBuilder.newBuilder("eve_ium" , "factory_giant" , "1")
    .addItemInput(<additions:terra_alloy_ingot> * 1)
    .addItemInput(<gct_ores:sky_alloy_ingot> * 1)
    .addItemInput(<gct_ores:ice_alloy_ingot> * 1)
    .addItemInput(<gct_ores:fire_alloy_ingot> * 1)
    .addEnergyPerTickInput(1000)
    .addItemOutput(<gct_ores:everite_ingot> * 4)
    .build();
RecipeBuilder.newBuilder("eve_ium1" , "factory_giant" , "1")
    .addItemInput(<additions:cytosinite_ingot> * 1)
    .addItemInput(<additions:cryonium_ingot> * 1)
    .addItemInput(<additions:infernium_ingot> * 1)
    .addItemInput(<additions:titanium_ingot> * 1)
    .addEnergyPerTickInput(1000)
    .addItemOutput(<additions:terra_alloy_ingot> * 4)
    .build();
RecipeBuilder.newBuilder("eve_ium2" , "factory_giant" , "1")
    .addItemInput(<additions:greedycraft-aetherium_ingot> * 1)
    .addItemInput(<additions:greedycraft-mistium_ingot> * 1)
    .addItemInput(<additions:greedycraft-canopium_ingot> * 1)
    .addItemInput(<additions:greedycraft-thyminite_ingot> * 1)
    .addEnergyPerTickInput(1000)
    .addItemOutput(<gct_ores:sky_alloy_ingot> * 4)
    .build();
RecipeBuilder.newBuilder("eve_ium3" , "factory_giant" , "1")
    .addItemInput(<additions:greedycraft-lavarite_ingot> * 1)
    .addItemInput(<additions:greedycraft-plasmarite_ingot> * 1)
    .addItemInput(<additions:greedycraft-bnightium_ingot> * 1)
    .addItemInput(<additions:greedycraft-guaninite_ingot> * 1)
    .addEnergyPerTickInput(1000)
    .addItemOutput(<gct_ores:fire_alloy_ingot> * 4)
    .build();
RecipeBuilder.newBuilder("eve_ium4" , "factory_giant" , "1")
    .addItemInput(<additions:greedycraft-snowingium_ingot> * 1)
    .addItemInput(<additions:greedycraft-freezite_ingot> * 1)
    .addItemInput(<additions:greedycraft-oceanium_ingot> * 1)
    .addItemInput(<additions:greedycraft-adeninite_ingot> * 1)
    .addEnergyPerTickInput(1000)
    .addItemOutput(<gct_ores:ice_alloy_ingot> * 4)
    .build();

RecipeBuilder.newBuilder("astronicium_ingot" , "factory_giant" , "1")
    .addItemInput(<tiths:ingot_altairium> * 1)
    .addItemInput(<tiths:ingot_polarium> * 1)
    .addItemInput(<tiths:ingot_tonium> * 2)
    .addItemInput(<tiths:ingot_hothium> * 2)
    .addItemInput(<tiths:ingot_halleium> * 2)
    .addEnergyPerTickInput(1000)
    .addItemOutput(<additions:taigaddon-astronicium_ingot> * 2)
    .build();

RecipeBuilder.newBuilder("raisium_ingot" , "factory_giant" , "1")
    .addItemInput(<tiths:ingot_steamium> * 3)
    .addItemInput(<tiths:ingot_magiga> * 8)
    .addItemInput(<tiths:ingot_imitatium> * 2)
    .addEnergyPerTickInput(1000)
    .addItemOutput(<additions:taigaddon-raisium_ingot> * 3)
    .build();

RecipeBuilder.newBuilder("ingot_magiga" , "factory_giant" , "1")
    .addItemInput(<tconstruct:ingots:2> * 1)
    .addItemInput(<minecraft:iron_ingot> * 1)
    .addItemInput(<minecraft:gold_ingot> * 1)
    .addEnergyPerTickInput(1000)
    .addItemOutput(<tiths:ingot_magiga> * 1)
    .build();

RecipeBuilder.newBuilder("ingot_steamium" , "factory_giant" , "1")
    .addItemInput(<thermalfoundation:material:160> * 4)
    .addItemInput(<tiths:ingot_tanatonium> * 3)
    .addFluidInput(<liquid:liquid_air> * 144)
    .addEnergyPerTickInput(1000)
    .addItemOutput(<tiths:ingot_steamium> * 2)
    .build();

RecipeBuilder.newBuilder("compressite_ingot" , "factory_giant" , "1")
    .addItemInput(<additions:taigaddon-astronicium_ingot> * 2)
    .addItemInput(<additions:taigaddon-raisium_ingot> * 2)
    .addItemInput(<tiths:ingot_stellarium> * 1)
    .addEnergyPerTickInput(1000)
    .addItemOutput(<additions:taigaddon-compressite_ingot> * 2)
    .build();

RecipeBuilder.newBuilder("ingot_scientificite" , "factory_giant" , "1")
    .addFluidInput(<liquid:nitric_acid> * 1000)
    .addFluidInput(<liquid:sulfuric_acid> * 1000)
    .addFluidInput(<liquid:hydrochloric_acid> * 1000)
    .addItemInput(<additions:mekaddon-porpezite_ingot> * 9)
    .addItemInput(<gct_ores:balanced_matrix_ingot> * 1)
    .addEnergyPerTickInput(1000)
    .addItemOutput(<additions:mekaddon-scientificite_ingot> * 3)
    .build();

RecipeBuilder.newBuilder("eugardite_ingot" , "factory_giant" , "1")
    .addItemInput(<tiths:ingot_decurrium> * 3)
    .addItemInput(<extrabotany:material:8> * 2)
    .addItemInput(<tiths:ingot_solita> * 1)
    .addItemInput(<additions:greedycraft-dullium_ingot> * 2)
    .addEnergyPerTickInput(1000)
    .addItemOutput(<additions:greedycraft-eugardite_ingot> * 4)
    .build();

RecipeBuilder.newBuilder("eucite_ingot" , "factory_giant" , "1")
    .addItemInput(<journey:storoningot> * 2)
    .addItemInput(<journey:mekyumingot> * 2)
    .addItemInput(<journey:koriteingot> * 1)
    .addItemInput(<journey:celestiumingot> * 1)
    .addEnergyPerTickInput(1000)
    .addItemOutput(<additions:greedycraft-eucite_ingot> * 4)
    .build();

RecipeBuilder.newBuilder("decurrium_ingot" , "factory_giant" , "1")
    .addItemInput(<additions:greedycraft-eucite_ingot> * 3)
    .addItemInput(<additions:greedycraft-corbite_ingot> * 2)
    .addItemInput(<tiths:ingot_chloroplast> * 2)
    .addItemInput(<tiths:ingot_irisia> * 3)
    .addEnergyPerTickInput(1000)
    .addItemOutput(<tiths:ingot_decurrium> * 6)
    .build();

RecipeBuilder.newBuilder("corbite_ingot" , "factory_giant" , "1")
    .addItemInput(<journey:desingot> * 2)
    .addItemInput(<journey:flairiumingot> * 2)
    .addItemInput(<journey:orbaditeingot> * 1)
    .addEnergyPerTickInput(1000)
    .addItemOutput(<additions:greedycraft-corbite_ingot> * 2)
    .build();

RecipeBuilder.newBuilder("irisia_ingot" , "factory_giant" , "1")
    .addItemInput(<journey:shadiumingot> * 1)
    .addItemInput(<journey:luniumingot> * 1)
    .addItemInput(<divinerpg:shadow_bar> * 4)
    .addEnergyPerTickInput(1000)
    .addItemOutput(<tiths:ingot_irisia> * 3)
    .build();

RecipeBuilder.newBuilder("solita_ingot" , "factory_giant" , "1")
    .addItemInput(<thaumadditions:adaminite_ingot> * 1)
    .addItemInput(<enderio:item_alloy_ingot:7> * 1)
    .addItemInput(<gct_ores:reditrite_ingot> * 16)
    .addEnergyPerTickInput(1000)
    .addItemOutput(<tiths:ingot_solita> * 3)
    .build();

RecipeBuilder.newBuilder("cthulhurite_ingot" , "factory_giant" , "1")
    .addItemInput(<abyssalcraft:abyingot> * 1)
    .addItemInput(<abyssalcraft:cingot> * 1)
    .addItemInput(<abyssalcraft:dreadiumingot> * 1)
    .addItemInput(<abyssalcraft:ethaxiumingot> * 1)
    .addItemInput(<gct_mobs:sanite_ingot> * 1)
    .addEnergyPerTickInput(1000)
    .addItemOutput(<gct_mobs:cthulhurite_ingot> * 2)
    .build();

RecipeBuilder.newBuilder("husturite_ingot" , "factory_giant" , "1")
    .addItemInput(<gct_mobs:cthulhurite_ingot> * 1)
    .addFluidInput(<liquid:aerotheum> * 6400)
    .addEnergyPerTickInput(1000)
    .addItemOutput(<additions:taigaddon-husturite_ingot> * 1)
    .build();
//龙研
//核心
RecipeBuilder.newBuilder("wyvern_core" , "factory_giant" , "20")
    .addItemInput(<minecraft:nether_star> * 1)
    .addItemInput(<draconicevolution:draconic_core> * 4)
    .addItemInput(<enderio:item_alloy_endergy_ingot:3> * 1)
    .addItemInput(<journey:orbaditeingot> * 1)
    .addItemInput(<ore:metalWyvern> * 2)
    .addEnergyPerTickInput(100000)
    .addItemOutput(<draconicevolution:wyvern_core> * 1)
    .build();
RecipeBuilder.newBuilder("fallen_core" , "factory_giant" , "20")
    .addItemInput(<minecraft:nether_star> * 1)
    .addItemInput(<gct_ores:witheric_core> * 4)
    .addItemInput(<enderio:item_alloy_endergy_ingot:3> * 1)
    .addItemInput(<journey:orbaditeingot> * 1)
    .addItemInput(<ore:metalWyvern> * 2)
    .addEnergyPerTickInput(100000)
    .addItemOutput(<gct_ores:fallen_core> * 1)
    .build();

RecipeBuilder.newBuilder("awakened_core" , "factory_giant" , "40")
    .addItemInput(<minecraft:nether_star> * 1)
    .addItemInput(<ore:coreExcellent> * 2)
    .addItemInput(<draconicevolution:draconic_ingot> * 2)
    .addItemInput(<additions:aeonsteel_ingot> * 2)
    .addItemInput(<ore:metalAwakened> * 2)
    .addEnergyPerTickInput(100000)
    .addItemOutput(<draconicevolution:awakened_core> * 1)
    .build();
RecipeBuilder.newBuilder("relifed_core" , "factory_giant" , "40")
    .addItemInput(<minecraft:nether_star> * 1)
    .addItemInput(<ore:coreExcellent> * 2)
    .addItemInput(<gct_ores:relifed_witherium_ingot> * 2)
    .addItemInput(<additions:aeonsteel_ingot> * 2)
    .addItemInput(<ore:metalAwakened> * 2)
    .addEnergyPerTickInput(100000)
    .addItemOutput(<gct_ores:relifed_core> * 1)
    .build();

RecipeBuilder.newBuilder("chaotic_core" , "factory_giant" , "100")
    .addItemInput(<draconicevolution:chaos_shard> * 1)
    .addItemInput(<tconevo:metal> * 2)
    .addItemInput(<tconevo:metal:5> * 2)
    .addItemInput(<avaritia:resource:4> * 2)
    .addItemInput(<additions:chromasteel_ingot> * 2)
    .addEnergyPerTickInput(10000000)
    .addItemOutput(<draconicevolution:chaotic_core> * 1)
    .build();
RecipeBuilder.newBuilder("stormy_core" , "factory_giant" , "100")
    .addItemInput(<gct_ores:stormy_shard> * 1)
    .addItemInput(<tconevo:metal> * 2)
    .addItemInput(<tconevo:metal:5> * 2)
    .addItemInput(<avaritia:resource:4> * 2)
    .addItemInput(<additions:chromasteel_ingot> * 2)
    .addEnergyPerTickInput(10000000)
    .addItemOutput(<gct_ores:stormy_core> * 1)
    .build();

//块
RecipeBuilder.newBuilder("draconic_block" , "factory_giant" , "10")
    .addItemInput(<draconicevolution:draconium_block> * 4)
    .addItemInput(<draconicevolution:draconic_core> * 6)
    .addItemInput(<draconicevolution:dragon_heart> * 1)
    .addEnergyPerTickInput(1000000)
    .addItemOutput(<draconicevolution:draconic_block> * 4)
    .build();
RecipeBuilder.newBuilder("wither_block" , "factory_giant" , "10")
    .addItemInput(<tiths:block_witherium> * 4)
    .addItemInput(<gct_ores:witheric_core> * 6)
    .addItemInput(<minecraft:nether_star> * 1)
    .addEnergyPerTickInput(1000000)
    .addItemOutput(<gct_ores:relifed_witherium_block> * 4)
    .build();

RecipeBuilder.newBuilder("chaotic_draconium_block" , "factory_giant" , "40")
    .addItemInput(<draconicevolution:draconic_block> * 4)
    .addItemInput(<gct_ores:everite_ingot> * 2)
    .addItemInput(<draconicevolution:chaos_shard> * 2)
    .addItemInput(<draconicadditions:chaos_heart> * 2)
    .addItemInput(<ore:metalChaotic> * 2)
    .addEnergyPerTickInput(100000000)
    .addItemOutput(<gct_ores:chaotic_draconium_block> * 4)
    .build();
RecipeBuilder.newBuilder("stormy_witherium_block" , "factory_giant" , "40")
    .addItemInput(<gct_ores:relifed_witherium_block> * 4)
    .addItemInput(<gct_ores:stormy_shard> * 2)
    .addItemInput(<draconicevolution:chaos_shard> * 2)
    .addItemInput(<ageofminecraft:withered_nether_star> * 2)
    .addItemInput(<ore:metalChaotic> * 2)
    .addEnergyPerTickInput(100000000)
    .addItemOutput(<gct_ores:stormy_witherium_block> * 4)
    .build();

RecipeBuilder.newBuilder("ruled_draconium_block" , "factory_giant" , "100")
    .addItemInput(<gct_ores:chaotic_draconium_block> * 4)
    .addItemInput(<draconicevolution:chaotic_core> * 1)
    .addItemInput(<gct_ores:chaos_shard_block> * 1)
    .addItemInput(<jaopca:block.adamantium> * 2)
    .addItemInput(<draconicadditions:chaos_heart> * 2)
    .addItemInput(<gct_ores:everite_block> * 2)
    .addEnergyPerTickInput(100000000)
    .addItemOutput(<gct_ores:ruled_draconium_block> * 4)
    .build();
RecipeBuilder.newBuilder("equipment_witherium_block" , "factory_giant" , "100")
    .addItemInput(<gct_ores:stormy_witherium_block> * 4)
    .addItemInput(<gct_ores:stormy_core> * 1)
    .addItemInput(<gct_ores:stormy_shard_block> * 1)
    .addItemInput(<jaopca:block.adamantium> * 2)
    .addItemInput(<ageofminecraft:withered_nether_star> * 2)
    .addItemInput(<gct_ores:everite_block> * 2)
    .addEnergyPerTickInput(100000000)
    .addItemOutput(<gct_ores:equipment_witherium_block> * 4)
    .build();

//金属
RecipeBuilder.newBuilder("wyvern_ingot" , "factory_giant" , "20")
    .addItemInput(<tconevo:material> * 1)
    .addItemInput(<minecraft:diamond> * 2)
    .addItemInput(<ore:blockRedstone> * 1)
    .addItemInput(<draconicevolution:wyvern_core> * 1)
    .addEnergyPerTickInput(10000)
    .addItemOutput(<tconevo:metal> * 1)
    .build();
RecipeBuilder.newBuilder("fallen_metal_ingot" , "factory_giant" , "20")
    .addItemInput(<tconevo:material> * 1)
    .addItemInput(<minecraft:diamond> * 2)
    .addItemInput(<ore:blockRedstone> * 1)
    .addItemInput(<gct_ores:fallen_core> * 1)
    .addEnergyPerTickInput(10000)
    .addItemOutput(<gct_ores:fallen_metal_ingot> * 1)
    .build();

RecipeBuilder.newBuilder("draconic_ingot" , "factory_giant" , "40")
    .addItemInput(<tconevo:material> * 1)
    .addItemInput(<minecraft:nether_star> * 2)
    .addItemInput(<draconicevolution:wyvern_energy_core> * 1)
    .addItemInput(<draconicevolution:awakened_core> * 1)
    .addEnergyPerTickInput(100000)
    .addItemOutput(<tconevo:metal:5> * 1)
    .build();
RecipeBuilder.newBuilder("relifed_metal_ingot" , "factory_giant" , "40")
    .addItemInput(<tconevo:material> * 1)
    .addItemInput(<minecraft:nether_star> * 2)
    .addItemInput(<draconicevolution:wyvern_energy_core> * 1)
    .addItemInput(<gct_ores:relifed_core> * 1)
    .addEnergyPerTickInput(100000)
    .addItemOutput(<gct_ores:relifed_metal_ingot> * 1)
    .build();

RecipeBuilder.newBuilder("chaoticmetal" , "factory_giant" , "100")
    .addItemInput(<tconevo:material> * 1)
    .addItemInput(<minecraft:dragon_egg> * 2)
    .addItemInput(<draconicevolution:draconic_energy_core> * 1)
    .addItemInput(<draconicevolution:chaotic_core> * 1)
    .addEnergyPerTickInput(1000000)
    .addItemOutput(<tconevo:metal:10> * 1)
    .build();
RecipeBuilder.newBuilder("stormy_metal_ingot" , "factory_giant" , "100")
    .addItemInput(<tconevo:material> * 1)
    .addItemInput(<minecraft:dragon_egg> * 2)
    .addItemInput(<draconicevolution:draconic_energy_core> * 1)
    .addItemInput(<gct_ores:stormy_core> * 1)
    .addEnergyPerTickInput(1000000)
    .addItemOutput(<gct_ores:stormy_metal_ingot> * 1)
    .build();

//太阳能
RecipeBuilder.newBuilder("solar_panel_wyvern" , "factory_giant" , "100")
    .addItemInput(<solarflux:solar_panel_8> * 1)
    .addItemInput(<tconevo:metal> * 4)
    .addItemInput(<draconicevolution:wyvern_energy_core> * 4)
    .addEnergyPerTickInput(100000)
    .addItemOutput(<solarflux:solar_panel_wyvern> * 1)
    .build();
RecipeBuilder.newBuilder("solar_panel_draconic" , "factory_giant" , "100")
    .addItemInput(<solarflux:solar_panel_wyvern> * 1)
    .addItemInput(<tconevo:metal:5> * 4)
    .addItemInput(<draconicevolution:draconic_energy_core> * 4)
    .addEnergyPerTickInput(10000000)
    .addItemOutput(<solarflux:solar_panel_draconic> * 1)
    .build();
RecipeBuilder.newBuilder("solar_panel_chaotic" , "factory_giant" , "100")
    .addItemInput(<draconicevolution:chaotic_core> * 1)
    .addItemInput(<solarflux:solar_panel_draconic> * 3)
    .addItemInput(<solarflux:custom_solar_panel_solar_panel_10> * 1)
    .addItemInput(<draconicevolution:awakened_core> * 4)
    .addEnergyPerTickInput(1000000000)
    .addItemOutput(<solarflux:solar_panel_chaotic> * 4)
    .build();

//注入装置
RecipeBuilder.newBuilder("crafting_injector_wyv" , "factory_giant" , "100")
    .addItemInput(<draconicevolution:crafting_injector> * 1)
    .addItemInput(<minecraft:diamond> * 4)
    .addItemInput(<draconicevolution:draconium_block> * 1)
    .addItemInput(<draconicevolution:draconic_core> * 1)
    .addItemInput(<draconicevolution:wyvern_core> * 1)
    .addEnergyPerTickInput(10000)
    .addItemOutput(<draconicevolution:crafting_injector:1> * 1)
    .build();
RecipeBuilder.newBuilder("crafting_injector_dra" , "factory_giant" , "100")
    .addItemInput(<draconicevolution:crafting_injector:1> * 1)
    .addItemInput(<minecraft:diamond> * 4)
    .addItemInput(<draconicevolution:draconic_block> * 1)
    .addItemInput(<draconicevolution:draconic_core> * 1)
    .addItemInput(<draconicevolution:wyvern_core> * 1)
    .addEnergyPerTickInput(100000)
    .addItemOutput(<draconicevolution:crafting_injector:2> * 1)
    .build();
RecipeBuilder.newBuilder("crafting_injector_chaos" , "factory_giant" , "100")
    .addItemInput(<draconicevolution:crafting_injector:2> * 1)
    .addItemInput(<minecraft:diamond> * 4)
    .addItemInput(<draconicevolution:chaotic_core> * 1)
    .addItemInput(<minecraft:dragon_egg> * 1)
    .addEnergyPerTickInput(10000000)
    .addItemOutput(<draconicevolution:crafting_injector:3> * 1)
    .build();

//合成组件
RecipeBuilder.newBuilder("craft1" , "factory_giant" , "10")
    .addItemInput(<extendedcrafting:material:2> * 1)
    .addItemInput(<taiga:vibranium_ingot> * 2)
    .addItemInput(<extendedcrafting:material:7> * 2)
    .addEnergyPerTickInput(100000)
    .addItemOutput(<extendedcrafting:material:14> * 1)
    .build();
RecipeBuilder.newBuilder("craft2" , "factory_giant" , "10")
    .addItemInput(<extendedcrafting:material:2> * 1)
    .addItemInput(<tconevo:material> * 2)
    .addItemInput(<extendedcrafting:material:7> * 2)
    .addEnergyPerTickInput(100000)
    .addItemOutput(<extendedcrafting:material:15> * 1)
    .build();
RecipeBuilder.newBuilder("craft3" , "factory_giant" , "10")
    .addItemInput(<extendedcrafting:material:2> * 1)
    .addItemInput(<gct_ores:balanced_matrix_ingot> * 2)
    .addItemInput(<extendedcrafting:material:7> * 2)
    .addEnergyPerTickInput(1000000)
    .addItemOutput(<extendedcrafting:material:16> * 1)
    .build();
RecipeBuilder.newBuilder("craft4" , "factory_giant" , "10")
    .addItemInput(<extendedcrafting:material:2> * 1)
    .addItemInput(<additions:greedycraft-radiation_matrix> * 2)
    .addItemInput(<extendedcrafting:material:7> * 2)
    .addEnergyPerTickInput(1000000)
    .addItemOutput(<extendedcrafting:material:17> * 1)
    .build();
RecipeBuilder.newBuilder("craft5" , "factory_giant" , "10")
    .addItemInput(<extendedcrafting:material:2> * 1)
    .addItemInput(<extendedcrafting:material:24> * 2)
    .addItemInput(<extendedcrafting:material:7> * 2)
    .addEnergyPerTickInput(1000000)
    .addItemOutput(<extendedcrafting:material:18> * 1)
    .build();
RecipeBuilder.newBuilder("craft_ava" , "factory_giant" , "10")
    .addItemInput(<extendedcrafting:table_ultimate> * 1)
    .addItemInput(<avaritia:block_resource:2> * 2)
    .addItemInput(<avaritia:resource:1> * 2)
    .addItemInput(<ore:coreExcellent> * 2)
    .addItemInput(<additions:greedycraft-ancient_tome_fragment> * 2)
    .addEnergyPerTickInput(10000000)
    .addItemOutput(<avaritia:extreme_crafting_table> * 1)
    .build();

//秩序相关
RecipeBuilder.newBuilder("stormy_crystal_gem" , "factory_giant" , "10")
    .addItemInput(<gct_ores:stormy_shard_block> * 1)
    .addItemInput(<gct_ores:shalloite> * 2)
    .addItemInput(<biomesoplenty:terrestrial_artifact> * 2)
    .addEnergyPerTickInput(100000)
    .addItemOutput(<additions:greedycraft-stormy_crystal_gem> * 1)
    .build();
RecipeBuilder.newBuilder("chaotic_crystal_gem" , "factory_giant" , "10")
    .addItemInput(<gct_ores:chaos_shard_block> * 1)
    .addItemInput(<gct_ores:shalloite> * 2)
    .addItemInput(<biomesoplenty:terrestrial_artifact> * 2)
    .addEnergyPerTickInput(100000)
    .addItemOutput(<additions:greedycraft-chaotic_crystal_gem> * 1)
    .build();
RecipeBuilder.newBuilder("ordered_fusion_core" , "factory_giant" , "100")
    .addItemInput(<draconicevolution:fusion_crafting_core> * 1)
    .addItemInput(<gct_ores:order_crystal> * 2)
    .addItemInput(<draconicevolution:crafting_injector:3> * 14)
    .addEnergyPerTickInput(10000000)
    .addItemOutput(<gct_ores:ordered_fusion_core> * 1)
    .build();

//龙研杂项(龙研相关配方实在不知道加哪请加这里)
RecipeBuilder.newBuilder("electronium_ingot" , "factory_giant" , "10")
    .addItemInput(<tconevo:material> * 1)
    .addItemInput(<redstonerepository:material:1> * 4)
    .addItemInput(<redstonearsenal:material:32> * 4)
    .addEnergyPerTickInput(100000)
    .addItemOutput(<additions:electronium_ingot> * 1)
    .build();
RecipeBuilder.newBuilder("creative_shard" , "factory_giant" , "100")
    .addItemInput(<draconicevolution:chaotic_core> * 1)
    .addItemInput(<additions:cosmilite_ingot> * 4)
    .addItemInput(<additions:greedycraft-ancient_tome_page> * 2)
    .addItemInput(<additions:greedycraft-bounty_hunter_medal> * 1)
    .addItemInput(<additions:greedycraft-sand_of_time> * 1)
    .addEnergyPerTickInput(10000000)
    .addItemOutput(<additions:greedycraft-creative_shard> * 1)
    .build();
RecipeBuilder.newBuilder("mythsteel_plate" , "factory_giant" , "100")
    .addItemInput(<botanicadds:gaia_plate> * 1)
    .addItemInput(<additions:botaniaddon-mythsteel_ingot> * 4)
    .addItemInput(<additions:cosmilite_ingot> * 4)
    .addItemInput(<additions:botaniaddon-reversed_orichalcos> * 4)
    .addItemInput(<gct_mobs:botanical_ingot> * 2)
    .addItemInput(<gct_mobs:mana_block> * 2)
    .addEnergyPerTickInput(1000000)
    .addItemOutput(<gct_mac:mythsteel_plate> * 1)
    .build();
RecipeBuilder.newBuilder("barrier" , "factory_giant" , "100")
    .addItemInput(<minecraft:glass> * 4)
    .addItemInput(<gct_ores:cosmilite_nugget> * 3)
    .addItemInput(<minecraft:bedrock> * 3)
    .addEnergyPerTickInput(1000000)
    .addItemOutput(<minecraft:barrier> * 4)
    .build();
RecipeBuilder.newBuilder("energy_crystal" , "factory_giant" , "10")
    .addItemInput(<draconicevolution:energy_crystal:1> * 4)
    .addItemInput(<draconicevolution:wyvern_energy_core> * 4)
    .addItemInput(<minecraft:diamond> * 4)
    .addItemInput(<draconicevolution:wyvern_core> * 1)
    .addEnergyPerTickInput(100000)
    .addItemOutput(<draconicevolution:energy_crystal:2> * 4)
    .build();
RecipeBuilder.newBuilder("chaos_crystal_stable" , "factory_giant" , "100")
    .addItemInput(<draconicevolution:chaos_shard> * 5)
    .addEnergyPerTickInput(1000000)
    .addItemOutput(<draconicadditions:chaos_crystal_stable>.withTag({isStable: 1 as byte}) * 1)
    .build();
RecipeBuilder.newBuilder("reactor_core" , "factory_giant" , "100")
    .addItemInput(<draconicevolution:chaos_shard> * 1)
    .addItemInput(<additions:cosmilite_ingot> * 2)
    .addItemInput(<tconevo:metal:5> * 2)
    .addItemInput(<draconicadditions:chaotic_energy_core> * 2)
    .addItemInput(<ore:metalEvery> * 2)
    .addEnergyPerTickInput(1000000)
    .addItemOutput(<draconicevolution:reactor_core> * 1)
    .build();
RecipeBuilder.newBuilder("chaos_stabilizer_core" , "factory_giant" , "100")
    .addItemInput(<draconicevolution:reactor_core> * 1)
    .addItemInput(<draconicevolution:infused_obsidian> * 2)
    .addItemInput(<draconicevolution:chaos_shard:1> * 2)
    .addItemInput(<draconicadditions:chaotic_energy_core> * 2)
    .addEnergyPerTickInput(1000000)
    .addItemOutput(<draconicadditions:chaos_stabilizer_core> * 1)
    .build();
RecipeBuilder.newBuilder("reactor_component" , "factory_giant" , "100")
    .addItemInput(<draconicevolution:reactor_part> * 1)
    .addItemInput(<draconicevolution:chaotic_core> * 1)
    .addItemInput(<draconicevolution:draconic_ingot> * 4)
    .addItemInput(<draconicevolution:reactor_part:4> * 1)
    .addItemInput(<draconicevolution:reactor_part:3> * 1)
    .addItemInput(<draconicevolution:draconic_energy_core> * 1)
    .addEnergyPerTickInput(100000)
    .addItemOutput(<draconicevolution:reactor_component> * 1)
    .build();
RecipeBuilder.newBuilder("reactor_component1" , "factory_giant" , "100")
    .addItemInput(<draconicevolution:wyvern_core> * 1)
    .addItemInput(<draconicevolution:reactor_part:1> * 4)
    .addItemInput(<draconicevolution:draconium_ingot> * 4)
    .addItemInput(<minecraft:iron_ingot> * 2)
    .addEnergyPerTickInput(100000)
    .addItemOutput(<draconicevolution:reactor_component:1> * 1)
    .build();
RecipeBuilder.newBuilder("draconium_chest" , "factory_giant" , "100")
    .addItemInput(<minecraft:chest> * 1)
    .addItemInput(<minecraft:furnace> * 5)
    .addItemInput(<draconicevolution:draconic_core> * 2)
    .addItemInput(<ore:workbench> * 2)
    .addItemInput(<draconicevolution:draconium_block> * 1)
    .addEnergyPerTickInput(100000)
    .addItemOutput(<draconicevolution:draconium_chest> * 1)
    .build();
RecipeBuilder.newBuilder("dislocator_advanced" , "factory_giant" , "100")
    .addItemInput(<draconicevolution:dislocator> * 1)
    .addItemInput(<draconicevolution:draconium_ingot> * 4)
    .addItemInput(<draconicevolution:wyvern_core> * 1)
    .addItemInput(<minecraft:ender_pearl> * 3)
    .addEnergyPerTickInput(10000)
    .addItemOutput(<draconicevolution:dislocator_advanced> * 1)
    .build();
RecipeBuilder.newBuilder("command_core" , "factory_giant" , "100")
    .addItemInput(<mekanism:controlcircuit:3> * 1)
    .addItemInput(<additions:taigaddon-harcadium_ingot> * 4)
    .addItemInput(<additions:taigaddon-void_essence> * 4)
    .addItemInput(<additions:taigaddon-adamantium_ingot> * 4)
    .addItemInput(<gct_ores:chaotic_draconium_block> * 1)
    .addItemInput(<additions:chromasteel_ingot> * 1)
    .addItemInput(<thaumadditions:adaminite_ingot> * 1)
    .addItemInput(<additions:crimsonite_ingot> * 1)
    .addEnergyPerTickInput(10000000)
    .addItemOutput(<gct_ores:command_core> * 1)
    .build();
RecipeBuilder.newBuilder("command_block" , "factory_giant" , "100")
    .addItemInput(<gct_ores:command_core> * 1)
    .addItemInput(<gct_ores:relifed_core> * 8)
    .addItemInput(<draconicevolution:chaotic_core> * 1)
    .addItemInput(<jaopca:block.adamantium> * 1)
    .addItemInput(<minecraft:bedrock> * 2)
    .addEnergyPerTickInput(100000000)
    .addItemOutput(<minecraft:command_block> * 1)
    .build();
RecipeBuilder.newBuilder("rng_relinquisher" , "factory_giant" , "100")
    .addItemInput(<draconicevolution:chaotic_core> * 1)
    .addItemInput(<additions:taigaddon-harcadium_ingot> * 2)
    .addItemInput(<additions:taigaddon-void_essence> * 2)
    .addItemInput(<ore:metalChaotic> * 4)
    .addEnergyPerTickInput(100000)
    .addItemOutput(<gct_ores:rng_relinquisher> * 1)
    .build();
RecipeBuilder.newBuilder("creepy_wither_doll" , "factory_giant" , "100")
    .addItemInput(<additions:taigaddon-harcadium_block> * 1)
    .addItemInput(<minecraft:skull:1> * 4)
    .addItemInput(<minecraft:soul_sand> * 4)
    .addEnergyPerTickInput(100000)
    .addItemOutput(<gct_ores:creepy_wither_doll> * 1)
    .build();
RecipeBuilder.newBuilder("creepy_witherstorm_doll" , "factory_giant" , "100")
    .addItemInput(<gct_ores:creepy_wither_doll> * 1)
    .addItemInput(<gct_ores:stormy_core> * 2)
    .addItemInput(<mysticalagradditions:storage> * 1)
    .addItemInput(<minecraft:command_block> * 1)
    .addEnergyPerTickInput(100000)
    .addItemOutput(<gct_ores:creepy_witherstorm_doll> * 1)
    .build();