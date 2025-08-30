/*
 * This script is created for the GreedyCraft modpack by TCreopargh.
 * You may NOT use this script in any other publicly distributed modpack without my permission. 
 */


import crafttweaker.item.IItemStack;
import crafttweaker.data.IData;
import crafttweaker.item.IIngredient;
import crafttweaker.oredict.IOreDict;
import crafttweaker.oredict.IOreDictEntry;

import mods.jaopca.JAOPCA;

import scripts.util.recipes as RecipeUtil;

var compressingOreDict as string[] = [];
for name in JAOPCA.getAllMaterials() {
    var nameStr as string = name.name;
    if (!isNull(oreDict.get("ingot" ~ nameStr).firstItem) && !isNull(oreDict.get("block" ~ nameStr).firstItem)) {
        compressingOreDict += nameStr;
    }
}

for od in compressingOreDict {
    var ingotOd as IOreDictEntry = oreDict.get("ingot" + od);
    var blockOd as IOreDictEntry = oreDict.get("block" + od);
    var nuggetOd as IOreDictEntry = oreDict.get("nugget" + od);
    if (ingotOd.items.length != 0 && blockOd.items.length != 0) {
        var ingotItem as IItemStack = ingotOd.firstItem;
        var blockItem as IItemStack = blockOd.firstItem;
        if (blockOd.items.length > 1 && blockOd.firstItem.definition.id has "jaopca") {
            for item in blockOd.items {
                if (!(item.definition.id has "jaopca")) {
                    blockItem = item;
                    break;
                }
            }
        }
        recipes.addShapeless(blockItem, [
            ingotOd, ingotOd, ingotOd,
            ingotOd, ingotOd, ingotOd,
            ingotOd, ingotOd, ingotOd
        ]);
        recipes.addShapeless(ingotItem * 9, [blockOd]);
    }
    if (ingotOd.items.length != 0 && nuggetOd.items.length != 0) {
        var ingotItem as IItemStack = ingotOd.firstItem;
        var nuggetItem as IItemStack = nuggetOd.firstItem;
        if (nuggetOd.items.length > 1 && nuggetOd.firstItem.definition.id has "jaopca") {
            for item in nuggetOd.items {
                if (!(item.definition.id has "jaopca")) {
                    nuggetItem = item;
                    break;
                }
            }
        }
        recipes.addShapeless(ingotItem, [
            nuggetOd, nuggetOd, nuggetOd,
            nuggetOd, nuggetOd, nuggetOd,
            nuggetOd, nuggetOd, nuggetOd
        ]);
        recipes.addShapeless(nuggetItem * 9, [ingotOd]);
    }
}


val compressingRecipes as IItemStack[IItemStack] = {
    <additions:aqualite_ingot> : <additions:aqualite_block>,
    <additions:time_fragment> : <additions:time_shard>,
    <additions:time_shard> : <additions:sand_of_time>,
    <additions:manganese_steel_ingot> : <additions:manganese_steel_block>,
    <additions:durasteel_ingot> : <additions:durasteel_block>,
    <additions:aeonsteel_ingot> : <additions:aeonsteel_block>,
    <additions:chromasteel_ingot> : <additions:chromasteel_block>,
    <taiga:seismum_nugget> : <taiga:seismum_ingot>,
    <taiga:astrium_nugget> : <taiga:astrium_ingot>,
    <taiga:iox_nugget> : <taiga:iox_ingot>,
    <taiga:meteorite_nugget> : <taiga:meteorite_ingot>,
    <taiga:basalt_nugget> : <taiga:basalt_ingot>,
    <taiga:dilithium_nugget> : <taiga:dilithium_ingot>,
    <taiga:imperomite_nugget> : <taiga:imperomite_ingot>,
    <taiga:tiberium_nugget> : <taiga:tiberium_ingot>,
    <taiga:aurorium_nugget> : <taiga:aurorium_ingot>,
    <taiga:prometheum_nugget> : <taiga:prometheum_ingot>,
    <taiga:duranite_nugget> : <taiga:duranite_ingot>,
    <taiga:valyrium_nugget> : <taiga:valyrium_ingot>,
    <taiga:vibranium_nugget> : <taiga:vibranium_ingot>,
    <taiga:karmesine_nugget> : <taiga:karmesine_ingot>,
    <taiga:ovium_nugget> : <taiga:ovium_ingot>,
    <taiga:jauxum_nugget> : <taiga:jauxum_ingot>,
    <taiga:terrax_nugget> : <taiga:terrax_ingot>,
    <taiga:palladium_nugget> : <taiga:palladium_ingot>,
    <taiga:uru_nugget> : <taiga:uru_ingot>,
    <taiga:osram_nugget> : <taiga:osram_ingot>,
    <taiga:abyssum_nugget> : <taiga:abyssum_ingot>,
    <taiga:eezo_nugget> : <taiga:eezo_ingot>,
    <taiga:triberium_nugget> : <taiga:triberium_ingot>,
    <taiga:fractum_nugget> : <taiga:fractum_ingot>,
    <taiga:violium_nugget> : <taiga:violium_ingot>,
    <taiga:proxii_nugget> : <taiga:proxii_ingot>,
    <taiga:tritonite_nugget> : <taiga:tritonite_ingot>,
    <taiga:ignitz_nugget> : <taiga:ignitz_ingot>,
    <taiga:solarium_nugget> : <taiga:solarium_ingot>,
    <taiga:nihilite_nugget> : <taiga:nihilite_ingot>,
    <taiga:adamant_nugget> : <taiga:adamant_ingot>,
    <taiga:dyonite_nugget> : <taiga:dyonite_ingot>,
    <taiga:nucleum_nugget> : <taiga:nucleum_ingot>,
    <taiga:lumix_nugget> : <taiga:lumix_ingot>,
    <taiga:seismum_ingot> : <taiga:seismum_block>,
    <taiga:astrium_ingot> : <taiga:astrium_block>,
    <taiga:iox_ingot> : <taiga:iox_block>,
    <taiga:meteorite_ingot> : <taiga:meteorite_block>,
    <taiga:basalt_ingot> : <taiga:basalt_block>,
    <taiga:dilithium_ingot> : <taiga:dilithium_block>,
    <taiga:imperomite_ingot> : <taiga:imperomite_block>,
    <taiga:tiberium_ingot> : <taiga:tiberium_block>,
    <taiga:aurorium_ingot> : <taiga:aurorium_block>,
    <taiga:prometheum_ingot> : <taiga:prometheum_block>,
    <taiga:duranite_ingot> : <taiga:duranite_block>,
    <taiga:valyrium_ingot> : <taiga:valyrium_block>,
    <taiga:vibranium_ingot> : <taiga:vibranium_block>,
    <taiga:karmesine_ingot> : <taiga:karmesine_block>,
    <taiga:ovium_ingot> : <taiga:ovium_block>,
    <taiga:jauxum_ingot> : <taiga:jauxum_block>,
    <taiga:terrax_ingot> : <taiga:terrax_block>,
    <taiga:palladium_ingot> : <taiga:palladium_block>,
    <taiga:uru_ingot> : <taiga:uru_block>,
    <taiga:osram_ingot> : <taiga:osram_block>,
    <taiga:abyssum_ingot> : <taiga:abyssum_block>,
    <taiga:eezo_ingot> : <taiga:eezo_block>,
    <taiga:triberium_ingot> : <taiga:triberium_block>,
    <taiga:fractum_ingot> : <taiga:fractum_block>,
    <taiga:violium_ingot> : <taiga:violium_block>,
    <taiga:proxii_ingot> : <taiga:proxii_block>,
    <taiga:tritonite_ingot> : <taiga:tritonite_block>,
    <taiga:ignitz_ingot> : <taiga:ignitz_block>,
    <taiga:solarium_ingot> : <taiga:solarium_block>,
    <taiga:nihilite_ingot> : <taiga:nihilite_block>,
    <taiga:adamant_ingot> : <taiga:adamant_block>,
    <taiga:dyonite_ingot> : <taiga:dyonite_block>,
    <taiga:nucleum_ingot> : <taiga:nucleum_block>,
    <taiga:lumix_ingot> : <taiga:lumix_block>,
    <modularmachinery:itemmodularium> : <additions:modularium_block>,
    <additions:holium_ingot> : <additions:holium_block>,
    <additions:holium_nugget> : <additions:holium_ingot>,
    <additions:enderite_ingot> : <additions:enderite_block>,
    <additions:aetherite_ingot> : <additions:aetherite_block>,
    <additions:glowing_crystal> : <additions:glowing_crystal_block>,
    <gct_ores:fallen_metal_ingot> : <gct_ores:fallen_metal_block>,
    <gct_ores:relifed_metal_ingot> : <gct_ores:relifed_metal_block>,
    <gct_ores:stormy_metal_ingot> : <gct_ores:stormy_metal_block>,
    <gct_ores:ordered_metal_ingot> : <gct_ores:ordered_metal_block>,
    <gct_ores:fallen_metal_nugget> : <gct_ores:fallen_metal_ingot>,
    <gct_ores:relifed_metal_nugget> : <gct_ores:relifed_metal_ingot>,
    <gct_ores:stormy_metal_nugget> : <gct_ores:stormy_metal_ingot>,
    <gct_ores:ordered_metal_nugget> : <gct_ores:ordered_metal_ingot>,
    <additions:flux_nugget> : <additions:flux_ingot>,
    <additions:flux_ingot> : <additions:flux_block>,
    <gct_ores:finallium_ingot> : <additions:finallium_block>,
    <additions:queenslime_ingot> : <additions:queenslime_block>,
    <additions:queenslime_nugget> : <additions:queenslime_ingot>,
    <additions:godslime_ingot> : <additions:godslime_block>,
    <additions:godslime_nugget> : <additions:godslime_ingot>,
    <additions:emperorslime_ingot> : <additions:emperorslime_block>,
    <additions:emperorslime_nugget> : <additions:emperorslime_ingot>,
    <additions:scientificite_ingot> : <additions:scientificite_block>,
    <additions:extremium_essence> : <additions:extremium_essence_block>,
    <additions:godlikeum_essence> : <additions:godlikeum_essence_block>,
    <additions:nonenium_essence> : <additions:nonenium_essence_block>
} as IItemStack[IItemStack];

for original in compressingRecipes {
    var compressed = compressingRecipes[original] as IItemStack;
    RecipeUtil.addCompressingRecipe(original, compressed);
}