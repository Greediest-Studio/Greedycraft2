/*
 * This script is created for the GreedyCraft modpack by TCreopargh.
 * You may NOT use this script in any other publicly distributed modpack without my permission.
 */

#priority 3000

import crafttweaker.item.IItemStack;
import crafttweaker.data.IData;
import crafttweaker.item.IIngredient;

import mods.avaritia.ExtremeCrafting;
import mods.avaritia.Compressor;
import mods.ctintegration.util.RecipePattern;

var catalystRecipe as IIngredient[] = [
    <avaritia:resource:0>, <avaritia:resource:1>, <avaritia:resource:2>, <avaritia:resource:3>, <avaritia:resource:4>, <avaritia:cosmic_meatballs>, <avaritia:ultimate_stew>, <avaritia:endest_pearl>, <avaritia:resource:7>, <additions:pearl_of_knowledge>, <additions:wither_soul>, <additions:dragon_soul>, <additions:city_defender_medal>,<additions:ancient_tome>, <additions:creative_shard>, <additions:poop>, <additions:aurora_heart>, <minecraft:nether_star>, <draconicevolution:dragon_heart>, <draconicevolution:chaotic_core>, <projectex:matter:3>, <additions:cosmilite_block>, <additions:cryonic_artifact>,  <additions:bounty_hunter_medal>, <additions:perfectly_generic_item>, <additions:sand_of_time>, <additions:anti_entropy_matter>
 ] as IIngredient[];

ExtremeCrafting.remove(<avaritia:resource:5>);
var outputCount = 3;
var ingredients as IIngredient[][] = [];
var counter = 0;
var row as IIngredient[] = [];
for i in 0 to 81 {
    var item as IIngredient = null;
    if (i < catalystRecipe.length) {
        item = catalystRecipe[i];
    }
    if (counter == 9) {
        counter = 0;
        ingredients += row;
        row = [];
    }
    row += item;
    counter += 1;
}

ExtremeCrafting.addShapeless("custom_avaritia_recipe_catalyst_shapeless", <avaritia:resource:5> * outputCount, catalystRecipe);
ExtremeCrafting.addShaped("custom_avaritia_recipe_catalyst_shaped", <avaritia:resource:5> * outputCount, ingredients);

// 创造转换套件
recipes.remove(<thermalfoundation:upgrade:256>);
ExtremeCrafting.addShaped("custom_avaritia_recipe_0", <thermalfoundation:upgrade:256> * 1, [[<additions:creative_soul>, <additions:creative_soul>, <additions:creative_soul>, <additions:creative_soul>, <additions:creative_soul>, <additions:creative_soul>, <additions:creative_soul>, <additions:creative_soul>, <additions:creative_soul>], [<additions:creative_soul>, <avaritia:resource:6>, <avaritia:resource:6>, <avaritia:resource:6>, <avaritia:resource:6>, <avaritia:resource:6>, <avaritia:resource:6>, <avaritia:resource:6>, <additions:creative_soul>],[<additions:creative_soul>, <avaritia:resource:6>, <additions:creative_soul>, <additions:creative_soul>, <additions:creative_soul>, <additions:creative_soul>, <additions:creative_soul>, <avaritia:resource:6>, <additions:creative_soul>],[<additions:creative_soul>, <avaritia:resource:6>, <avaritia:resource:6>, <avaritia:resource:6>, <avaritia:resource:6>, <avaritia:resource:6>, <avaritia:resource:6>, <avaritia:resource:6>, <additions:creative_soul>],[<additions:creative_soul>, <avaritia:resource:6>, <avaritia:resource:6>, <avaritia:resource:6>, <additions:creative_soul>, <avaritia:resource:6>, <avaritia:resource:6>, <avaritia:resource:6>, <additions:creative_soul>],[<additions:creative_soul>, <avaritia:resource:6>, <avaritia:resource:6>, <additions:creative_soul>, <avaritia:resource:6>, <additions:creative_soul>, <avaritia:resource:6>, <avaritia:resource:6>, <additions:creative_soul>],[<additions:creative_soul>, <avaritia:resource:6>, <additions:creative_soul>, <avaritia:resource:6>, <avaritia:resource:6>, <avaritia:resource:6>, <additions:creative_soul>, <avaritia:resource:6>, <additions:creative_soul>],[<additions:creative_soul>, <avaritia:resource:6>, <avaritia:resource:6>, <avaritia:resource:6>, <avaritia:resource:6>, <avaritia:resource:6>, <avaritia:resource:6>, <avaritia:resource:6>, <additions:creative_soul>],[<additions:creative_soul>, <additions:creative_soul>, <additions:creative_soul>, <additions:creative_soul>, <additions:creative_soul>, <additions:creative_soul>, <additions:creative_soul>, <additions:creative_soul>, <additions:creative_soul>]]);

// 创造模式强化头颅
recipes.remove(<tconstruct:materials:50>);

// 创造模式能量源
recipes.remove(<extrautils2:creativeenergy>);

// 创造模式发电机
recipes.remove(<extrautils2:passivegenerator:6>);

// 创造破坏之杖
recipes.remove(<extrautils2:itemcreativedestructionwand>);

// 创造建筑之杖
recipes.remove(<extrautils2:itemcreativebuilderswand>);

// 创造模式收割者
recipes.remove(<extrautils2:creativeharvest>);

// 创造通量容器
recipes.remove(<draconicevolution:draconium_capacitor:2>);
ExtremeCrafting.addShaped("custom_avaritia_recipe_12", <draconicevolution:draconium_capacitor:2> * 1, [[<tconevo:metal_block:1>, null, null, null, <draconicevolution:awakened_core>, null, null, null, <tconevo:metal_block:1>], [null, <additions:creative_soul>, <additions:creative_soul>, <additions:creative_soul>, <draconicevolution:awakened_core>, <additions:creative_soul>, <additions:creative_soul>, <additions:creative_soul>, null],[null, <additions:creative_soul>, <avaritia:resource:5>, <additions:creative_soul>, <draconicevolution:awakened_core>, <additions:creative_soul>, <avaritia:resource:5>, <additions:creative_soul>, null],[null, <additions:creative_soul>, <additions:creative_soul>, <avaritia:resource:5>, <draconicevolution:awakened_core>, <avaritia:resource:5>, <additions:creative_soul>, <additions:creative_soul>, null],[<draconicevolution:awakened_core>, <draconicevolution:awakened_core>, <draconicevolution:awakened_core>, <draconicevolution:awakened_core>, <draconicevolution:draconium_capacitor:1>, <draconicevolution:awakened_core>, <draconicevolution:awakened_core>, <draconicevolution:awakened_core>, <draconicevolution:awakened_core>],[null, <additions:creative_soul>, <additions:creative_soul>, <avaritia:resource:5>, <draconicevolution:awakened_core>, <avaritia:resource:5>, <additions:creative_soul>, <additions:creative_soul>, null],[null, <additions:creative_soul>, <avaritia:resource:5>, <additions:creative_soul>, <draconicevolution:awakened_core>, <additions:creative_soul>, <avaritia:resource:5>, <additions:creative_soul>, null],[null, <additions:creative_soul>, <additions:creative_soul>, <additions:creative_soul>, <draconicevolution:awakened_core>, <additions:creative_soul>, <additions:creative_soul>, <additions:creative_soul>, null],[<tconevo:metal_block:1>, null, null, null, <draconicevolution:awakened_core>, null, null, null, <tconevo:metal_block:1>]]);

// 创造型ME存储元件
recipes.remove(<appliedenergistics2:creative_storage_cell>);
ExtremeCrafting.addShaped("custom_avaritia_recipe_14", <appliedenergistics2:creative_storage_cell> * 1, [[null, null, null, null, <avaritia:resource:6>, null, null, null, null], [null, null, null, <avaritia:resource:6>, <avaritia:resource:6>, <avaritia:resource:6>, null, null, null],[null, null, <avaritia:resource:6>, <avaritia:block_resource:1>, <avaritia:block_resource:1>, <avaritia:block_resource:1>, <avaritia:resource:6>, null, null],[null, <avaritia:resource:6>, <avaritia:resource:6>, <avaritia:block_resource:1>, <additions:creative_soul>, <avaritia:block_resource:1>, <avaritia:resource:6>, <avaritia:resource:6>, null],[null, <additions:creative_soul>, <avaritia:resource:6>, <avaritia:block_resource:1>, <avaritia:block_resource:1>, <avaritia:block_resource:1>, <avaritia:resource:6>, <additions:creative_soul>, null],[null, <additions:creative_soul>, <additions:creative_soul>, <avaritia:resource:6>, <avaritia:resource:6>, <avaritia:resource:6>, <additions:creative_soul>, <additions:creative_soul>, null],[null, null, <additions:creative_soul>, <additions:creative_soul>, <avaritia:resource:6>, <additions:creative_soul>, <additions:creative_soul>, null, null],[null, null, null, <additions:creative_soul>, <additions:creative_soul>, <additions:creative_soul>, null, null, null],[null, null, null, null, <additions:creative_soul>, null, null, null, null]]);

// 洒水壶（创造）
recipes.remove(<thermalcultivation:watering_can:32000>);

// 药水注射器（创造）
recipes.remove(<thermalinnovation:injector:32000>);

// §c§l无尽块块
recipes.remove(<additions:infinity_block_block>);
ExtremeCrafting.addShaped("custom_avaritia_recipe_19", <additions:infinity_block_block> * 1, [[<avaritia:block_resource:1>, <avaritia:block_resource:1>, <avaritia:block_resource:1>, <avaritia:block_resource:1>, <avaritia:block_resource:1>, <avaritia:block_resource:1>, <avaritia:block_resource:1>, <avaritia:block_resource:1>, null], [<avaritia:block_resource:1>, <avaritia:block_resource:1>, <avaritia:block_resource:1>, <avaritia:block_resource:1>, <avaritia:block_resource:1>, <avaritia:block_resource:1>, <avaritia:block_resource:1>, <avaritia:block_resource:1>, null],[<avaritia:block_resource:1>, <avaritia:block_resource:1>, <avaritia:block_resource:1>, <avaritia:block_resource:1>, <avaritia:block_resource:1>, <avaritia:block_resource:1>, <avaritia:block_resource:1>, <avaritia:block_resource:1>, null],[<avaritia:block_resource:1>, <avaritia:block_resource:1>, <avaritia:block_resource:1>, <avaritia:block_resource:1>, <avaritia:block_resource:1>, <avaritia:block_resource:1>, <avaritia:block_resource:1>, <avaritia:block_resource:1>, null],[<avaritia:block_resource:1>, <avaritia:block_resource:1>, <avaritia:block_resource:1>, <avaritia:block_resource:1>, <avaritia:block_resource:1>, <avaritia:block_resource:1>, <avaritia:block_resource:1>, <avaritia:block_resource:1>, null],[<avaritia:block_resource:1>, <avaritia:block_resource:1>, <avaritia:block_resource:1>, <avaritia:block_resource:1>, <avaritia:block_resource:1>, <avaritia:block_resource:1>, <avaritia:block_resource:1>, <avaritia:block_resource:1>, null],[<avaritia:block_resource:1>, <avaritia:block_resource:1>, <avaritia:block_resource:1>, <avaritia:block_resource:1>, <avaritia:block_resource:1>, <avaritia:block_resource:1>, <avaritia:block_resource:1>, <avaritia:block_resource:1>, null],[<avaritia:block_resource:1>, <avaritia:block_resource:1>, <avaritia:block_resource:1>, <avaritia:block_resource:1>, <avaritia:block_resource:1>, <avaritia:block_resource:1>, <avaritia:block_resource:1>, <avaritia:block_resource:1>, null],[null, null, null, null, null, null, null, null, null]]);

//  §d§ka§r §c§o无尽块块块 §r§d§ka§r
recipes.remove(<additions:infinity_block_block_block>);
ExtremeCrafting.addShaped("custom_avaritia_recipe_20", <additions:infinity_block_block_block> * 1, [[<additions:infinity_block_block>, <additions:infinity_block_block>, <additions:infinity_block_block>, <additions:infinity_block_block>, <additions:infinity_block_block>, <additions:infinity_block_block>, <additions:infinity_block_block>, <additions:infinity_block_block>, null], [<additions:infinity_block_block>, <additions:infinity_block_block>, <additions:infinity_block_block>, <additions:infinity_block_block>, <additions:infinity_block_block>, <additions:infinity_block_block>, <additions:infinity_block_block>, <additions:infinity_block_block>, null],[<additions:infinity_block_block>, <additions:infinity_block_block>, <additions:infinity_block_block>, <additions:infinity_block_block>, <additions:infinity_block_block>, <additions:infinity_block_block>, <additions:infinity_block_block>, <additions:infinity_block_block>, null],[<additions:infinity_block_block>, <additions:infinity_block_block>, <additions:infinity_block_block>, <additions:infinity_block_block>, <additions:infinity_block_block>, <additions:infinity_block_block>, <additions:infinity_block_block>, <additions:infinity_block_block>, null],[<additions:infinity_block_block>, <additions:infinity_block_block>, <additions:infinity_block_block>, <additions:infinity_block_block>, <additions:infinity_block_block>, <additions:infinity_block_block>, <additions:infinity_block_block>, <additions:infinity_block_block>, null],[<additions:infinity_block_block>, <additions:infinity_block_block>, <additions:infinity_block_block>, <additions:infinity_block_block>, <additions:infinity_block_block>, <additions:infinity_block_block>, <additions:infinity_block_block>, <additions:infinity_block_block>, null],[<additions:infinity_block_block>, <additions:infinity_block_block>, <additions:infinity_block_block>, <additions:infinity_block_block>, <additions:infinity_block_block>, <additions:infinity_block_block>, <additions:infinity_block_block>, <additions:infinity_block_block>, null],[<additions:infinity_block_block>, <additions:infinity_block_block>, <additions:infinity_block_block>, <additions:infinity_block_block>, <additions:infinity_block_block>, <additions:infinity_block_block>, <additions:infinity_block_block>, <additions:infinity_block_block>, null],[null, null, null, null, null, null, null, null, null]]);

// §b难度调节器
recipes.remove(<additions:difficulty_changer>);
ExtremeCrafting.addShaped("custom_avaritia_recipe_21", <additions:difficulty_changer> * 1, [[null, <scalinghealth:difficultychanger:0>, <scalinghealth:difficultychanger:0>, null, null, null, <scalinghealth:difficultychanger:1>, <scalinghealth:difficultychanger:1>, null], [<scalinghealth:difficultychanger:0>, <scalinghealth:difficultychanger:0>, <scalinghealth:difficultychanger:0>, <scalinghealth:difficultychanger:0>, null, <scalinghealth:difficultychanger:1>, <scalinghealth:difficultychanger:1>, <scalinghealth:difficultychanger:1>, <scalinghealth:difficultychanger:1>],[<scalinghealth:difficultychanger:0>, <scalinghealth:difficultychanger:0>, <scalinghealth:difficultychanger:0>, <scalinghealth:difficultychanger:0>, <additions:creative_shard>, <scalinghealth:difficultychanger:1>, <scalinghealth:difficultychanger:1>, <scalinghealth:difficultychanger:1>, <scalinghealth:difficultychanger:1>],[<scalinghealth:difficultychanger:0>, <scalinghealth:difficultychanger:0>, <scalinghealth:difficultychanger:0>, <scalinghealth:difficultychanger:0>, <additions:creative_shard>, <scalinghealth:difficultychanger:1>, <scalinghealth:difficultychanger:1>, <scalinghealth:difficultychanger:1>, <scalinghealth:difficultychanger:1>],[null, <scalinghealth:difficultychanger:0>, <scalinghealth:difficultychanger:0>, <scalinghealth:difficultychanger:0>, <additions:creative_shard>, <scalinghealth:difficultychanger:1>, <scalinghealth:difficultychanger:1>, <scalinghealth:difficultychanger:1>, null],[null, null, <scalinghealth:difficultychanger:0>, <scalinghealth:difficultychanger:0>, <additions:creative_shard>, <scalinghealth:difficultychanger:1>, <scalinghealth:difficultychanger:1>, null, null],[null, null, null, <scalinghealth:difficultychanger:0>, <additions:creative_shard>, <scalinghealth:difficultychanger:1>, null, null, null],[null, null, null, null, <additions:creative_shard>, null, null, null, null],[null, null, null, null, null, null, null, null, null]]);


// 永恒魔力池
recipes.remove(<botania:pool:1>);
ExtremeCrafting.addShaped("custom_avaritia_recipe_22", <botania:pool:1> * 1, [[null, null, null, null, null, null, null, null, null], [null, null, null, null, null, null, null, null, null],[null, null, null, null, null, null, null, null, null],[null, null, null, null, null, null, null, null, null],[<botania:livingrock:0>, <botania:manaresource:4>, <additions:creative_soul>, <additions:creative_soul>, <additions:creative_soul>, <additions:creative_soul>, <additions:creative_soul>, <botania:manaresource:4>, <botania:livingrock:0>],[<botania:livingrock:0>, <botania:manaresource:4>, <additions:creative_soul>, <additions:creative_soul>, <additions:creative_soul>, <additions:creative_soul>, <additions:creative_soul>, <botania:manaresource:4>, <botania:livingrock:0>],[<botania:livingrock:0>, <botania:manaresource:4>, <additions:creative_soul>, <additions:creative_soul>, <additions:creative_soul>, <additions:creative_soul>, <additions:creative_soul>, <botania:manaresource:4>, <botania:livingrock:0>],[<botania:livingrock:0>, <botania:manaresource:4>, <botania:manaresource:4>, <botania:manaresource:4>, <botania:manaresource:4>, <botania:manaresource:4>, <botania:manaresource:4>, <botania:manaresource:4>, <botania:livingrock:0>],[<botania:livingrock:0>, <botania:livingrock:0>, <botania:livingrock:0>, <botania:livingrock:0>, <botania:livingrock:0>, <botania:livingrock:0>, <botania:livingrock:0>, <botania:livingrock:0>, <botania:livingrock:0>]]);

// 创造精华
recipes.remove(<mysticalagradditions:stuff:69>);

// §d创造模式控制器
recipes.remove(<additions:creative_controller>);
ExtremeCrafting.addShaped("custom_avaritia_recipe_24", <additions:creative_controller> * 1, [[<additions:creative_soul>, <additions:creative_soul>, <additions:creative_soul>, <additions:creative_soul>, <additions:creative_soul>, <additions:creative_soul>, <additions:infinity_block_block_block>, <additions:creative_soul>, <additions:creative_soul>], [<additions:creative_soul>, <additions:creative_soul>, <additions:creative_soul>, <additions:creative_soul>, <additions:creative_soul>, <additions:creative_soul>, <avaritia:resource:6>, <additions:creative_soul>, <additions:creative_soul>],[<additions:creative_soul>, <additions:creative_soul>, <avaritia:resource:6>, <avaritia:resource:6>, <avaritia:resource:6>, <avaritia:resource:6>, <avaritia:resource:6>, <additions:creative_soul>, <additions:creative_soul>],[<additions:creative_soul>, <additions:creative_soul>, <avaritia:resource:6>, <thermalfoundation:upgrade:256>, <thermalfoundation:upgrade:256>, <thermalfoundation:upgrade:256>, <avaritia:resource:6>, <additions:creative_soul>, <additions:creative_soul>],[<additions:creative_soul>, <additions:creative_soul>, <avaritia:resource:6>, <minecraft:redstone_block>, <minecraft:redstone_block>, <thermalfoundation:upgrade:256>, <avaritia:resource:6>, <additions:creative_soul>, <additions:creative_soul>],[<additions:creative_soul>, <additions:creative_soul>, <avaritia:resource:6>, <minecraft:redstone_block>, <minecraft:redstone_block>, <thermalfoundation:upgrade:256>, <avaritia:resource:6>, <additions:creative_soul>, <additions:creative_soul>],[<additions:creative_soul>, <additions:creative_soul>, <avaritia:resource:6>, <thermalfoundation:upgrade:256>, <thermalfoundation:upgrade:256>, <thermalfoundation:upgrade:256>, <avaritia:resource:6>, <additions:creative_soul>, <additions:creative_soul>],[<additions:creative_soul>, <additions:creative_soul>, <avaritia:resource:6>, <avaritia:resource:6>, <avaritia:resource:6>, <avaritia:resource:6>, <avaritia:resource:6>, <additions:creative_soul>, <additions:creative_soul>],[<additions:creative_soul>, <additions:creative_soul>, <additions:creative_soul>, <additions:creative_soul>, <additions:creative_soul>, <additions:creative_soul>, <additions:creative_soul>, <additions:creative_soul>, <additions:creative_soul>]]);

// /dank/null/创造
recipes.remove(<danknull:dank_null_6>);

// 终极之星
recipes.remove(<projectex:final_star>);
ExtremeCrafting.addShaped("custom_avaritia_recipe_26", <projectex:final_star> * 1, [[null, null, null, null, null, null, null, null, null], [null, null, null, <projectex:final_star_shard>, <projectex:final_star_shard>, <projectex:final_star_shard>, null, null, null],[null, null, <projectex:final_star_shard>, <additions:creative_soul>, <additions:creative_soul>, <additions:creative_soul>, <projectex:final_star_shard>, null, null],[null, <projectex:final_star_shard>, <additions:creative_soul>, <additions:creative_soul>, <additions:creative_soul>, <additions:creative_soul>, <additions:creative_soul>, <projectex:final_star_shard>, null],[null, <projectex:final_star_shard>, <additions:creative_soul>, <additions:creative_soul>, <avaritia:block_resource:1>, <additions:creative_soul>, <additions:creative_soul>, <projectex:final_star_shard>, null],[null, <projectex:final_star_shard>, <additions:creative_soul>, <additions:creative_soul>, <additions:creative_soul>, <additions:creative_soul>, <additions:creative_soul>, <projectex:final_star_shard>, null],[null, null, <projectex:final_star_shard>, <additions:creative_soul>, <additions:creative_soul>, <additions:creative_soul>, <projectex:final_star_shard>, null, null],[null, null, null, <projectex:final_star_shard>, <projectex:final_star_shard>, <projectex:final_star_shard>, null, null, null],[null, null, null, null, null, null, null, null, null]]);

// 时间洪流怀表
recipes.remove(<projecte:item.pe_time_watch>);

// 炼金术秘卷
recipes.remove(<projecte:item.pe_tome>);

//神龙权杖
recipes.remove(<draconicevolution:draconic_staff_of_power>);

// §a知识宝珠
ExtremeCrafting.addShaped("custom_avaritia_recipe_34", <additions:pearl_of_knowledge> * 1, [[<additions:compressed_experience_block>, <additions:compressed_experience_block>, <additions:compressed_experience_block>, <additions:compressed_experience_block>, <additions:compressed_experience_block>, <additions:compressed_experience_block>, <additions:compressed_experience_block>, <additions:compressed_experience_block>, <additions:compressed_experience_block>], [<additions:compressed_experience_block>, <additions:compressed_experience_block>, <additions:compressed_experience_block>, <additions:compressed_experience_block>, <additions:compressed_experience_block>, <additions:compressed_experience_block>, <additions:compressed_experience_block>, <additions:compressed_experience_block>, <additions:compressed_experience_block>],[<additions:compressed_experience_block>, <additions:compressed_experience_block>, <additions:compressed_experience_block>, <additions:compressed_experience_block>, <additions:compressed_experience_block>, <additions:compressed_experience_block>, <additions:compressed_experience_block>, <additions:compressed_experience_block>, <additions:compressed_experience_block>],[<additions:compressed_experience_block>, <additions:compressed_experience_block>, <additions:compressed_experience_block>, <additions:compressed_experience_block>, <additions:compressed_experience_block>, <additions:compressed_experience_block>, <additions:compressed_experience_block>, <additions:compressed_experience_block>, <additions:compressed_experience_block>],[<additions:compressed_experience_block>, <additions:compressed_experience_block>, <additions:compressed_experience_block>, <additions:compressed_experience_block>, <additions:compressed_experience_block>, <additions:compressed_experience_block>, <additions:compressed_experience_block>, <additions:compressed_experience_block>, <additions:compressed_experience_block>],[<additions:compressed_experience_block>, <additions:compressed_experience_block>, <additions:compressed_experience_block>, <additions:compressed_experience_block>, <additions:compressed_experience_block>, <additions:compressed_experience_block>, <additions:compressed_experience_block>, <additions:compressed_experience_block>, <additions:compressed_experience_block>],[<additions:compressed_experience_block>, <additions:compressed_experience_block>, <additions:compressed_experience_block>, <additions:compressed_experience_block>, <additions:compressed_experience_block>, <additions:compressed_experience_block>, <additions:compressed_experience_block>, <additions:compressed_experience_block>, <additions:compressed_experience_block>],[<additions:compressed_experience_block>, <additions:compressed_experience_block>, <additions:compressed_experience_block>, <additions:compressed_experience_block>, <additions:compressed_experience_block>, <additions:compressed_experience_block>, <additions:compressed_experience_block>, <additions:compressed_experience_block>, <additions:compressed_experience_block>],[<additions:compressed_experience_block>, <additions:compressed_experience_block>, <additions:compressed_experience_block>, <additions:compressed_experience_block>, <additions:compressed_experience_block>, <additions:compressed_experience_block>, <additions:compressed_experience_block>, <additions:compressed_experience_block>, <additions:compressed_experience_block>]]);

// 作弊者魔导手册
recipes.remove(<thaumcraft:thaumonomicon:1>);
ExtremeCrafting.addShaped("custom_avaritia_recipe_37", <thaumcraft:thaumonomicon:1> * 1, [
    [<thaumcraft:ingot:0>, <thaumcraft:ingot:0>, <thaumcraft:ingot:2>, <thaumcraft:ingot:2>, <thaumcraft:ingot:2>, <thaumcraft:ingot:2>, <thaumcraft:ingot:2>, <thaumcraft:ingot:0>, <thaumcraft:ingot:0>], 
    [<thaumcraft:ingot:0>, <tconevo:metal:20>, <thaumcraft:ingot:1>, <thaumcraft:ingot:1>, <thaumcraft:ingot:1>, <thaumcraft:ingot:1>, <thaumcraft:ingot:1>, <tconevo:metal:20>, <thaumcraft:ingot:0>],
    [<thaumcraft:ingot:2>, <thaumcraft:ingot:1>, <additions:creative_shard>, <thaumcraft:salis_mundus>, <thaumcraft:salis_mundus>, <thaumcraft:salis_mundus>, <additions:creative_shard>, <thaumcraft:ingot:1>, <thaumcraft:ingot:2>],
    [<thaumcraft:ingot:2>, <thaumcraft:ingot:1>, <thaumcraft:salis_mundus>, <additions:creative_shard>, <additions:creative_shard>, <additions:creative_shard>, <thaumcraft:salis_mundus>, <thaumcraft:ingot:1>, <thaumcraft:ingot:2>],
    [<thaumcraft:ingot:2>, <thaumcraft:ingot:1>, <thaumcraft:salis_mundus>, <additions:creative_shard>, <additions:creative_soul>, <additions:creative_shard>, <thaumcraft:salis_mundus>, <thaumcraft:ingot:1>, <thaumcraft:ingot:2>],
    [<thaumcraft:ingot:2>, <thaumcraft:ingot:1>, <thaumcraft:salis_mundus>, <additions:creative_shard>, <additions:creative_shard>, <additions:creative_shard>, <thaumcraft:salis_mundus>, <thaumcraft:ingot:1>, <thaumcraft:ingot:2>],
    [<thaumcraft:ingot:2>, <thaumcraft:ingot:1>, <additions:creative_shard>, <thaumcraft:salis_mundus>, <thaumcraft:salis_mundus>, <thaumcraft:salis_mundus>, <additions:creative_shard>, <thaumcraft:ingot:1>, <thaumcraft:ingot:2>],
    [<thaumcraft:ingot:0>, <tconevo:metal:20>, <thaumcraft:ingot:1>, <thaumcraft:ingot:1>, <thaumcraft:ingot:1>, <thaumcraft:ingot:1>, <thaumcraft:ingot:1>, <tconevo:metal:20>, <thaumcraft:ingot:0>],[<thaumcraft:ingot:0>, <thaumcraft:ingot:0>, <thaumcraft:ingot:2>, <thaumcraft:ingot:2>, <thaumcraft:ingot:2>, <thaumcraft:ingot:2>, <thaumcraft:ingot:2>, <thaumcraft:ingot:0>, <thaumcraft:ingot:0>]
]);

Compressor.add("pearl_compress_0", <additions:pearl_of_knowledge>, 7382, <actuallyadditions:item_solidified_experience>, true);
Compressor.add("pearl_compress_1", <additions:pearl_of_knowledge>, 6561, <ore:ingotExperience>, true);

Compressor.add("fluxed_singularity", <avaritia:singularity:12>, 128, <ore:blockElectrumFlux>, true);
Compressor.add("coal_to_diamond", <minecraft:diamond>, 64, <ore:coal>, true);

// 寰宇支配之剑
ExtremeCrafting.remove(<avaritia:infinity_sword>);
ExtremeCrafting.addShaped("custom_avaritia_recipe_sword", <avaritia:infinity_sword> * 1, [[null, null, null, null, null, null, null, <avaritia:resource:6>, <avaritia:resource:6>], [null, null, null, null, null, null, <avaritia:resource:6>, <avaritia:resource:5>, <avaritia:resource:6>],[null, null, null, null, null, <avaritia:resource:6>, <avaritia:resource:5>, <avaritia:resource:6>, null],[null, null, null, null, <avaritia:resource:6>, <avaritia:resource:5>, <avaritia:resource:6>, null, null],[null, <tconevo:metal:10>, null, <avaritia:resource:6>, <avaritia:resource:5>, <avaritia:resource:6>, null, null, null],[null, null, <tconevo:metal:10>, <avaritia:resource:6>, <avaritia:resource:6>, null, null, null, null],[null, null, <avaritia:resource:4>, <tconevo:metal:10>, null, null, null, null, null],[null, <avaritia:resource:4>, null, null, <tconevo:metal:10>, null, null, null, null],[<additions:creative_soul>, null, null, null, null, null, null, null, null]]);

ExtremeCrafting.addShaped("custom_avaritia_recipe_38", <additions:infinity_stone> * 1, [[<additions:infinity_block_block_block>, <additions:infinity_block_block_block>, <additions:infinity_block_block_block>, <additions:infinity_block_block_block>, <additions:infinity_block_block_block>, <additions:infinity_block_block_block>, <additions:infinity_block_block_block>, <additions:infinity_block_block_block>, <additions:infinity_block_block_block>], [<additions:infinity_block_block_block>, <additions:infinity_block_block_block>, <additions:infinity_block_block_block>, <additions:infinity_block_block_block>, <additions:infinity_block_block_block>, <additions:infinity_block_block_block>, <additions:infinity_block_block_block>, <additions:infinity_block_block_block>, <additions:infinity_block_block_block>],[<additions:infinity_block_block_block>, <additions:infinity_block_block_block>, <additions:infinity_block_block_block>, <additions:infinity_block_block_block>, <additions:infinity_block_block_block>, <additions:infinity_block_block_block>, <additions:infinity_block_block_block>, <additions:infinity_block_block_block>, <additions:infinity_block_block_block>],[<additions:infinity_block_block_block>, <additions:infinity_block_block_block>, <additions:infinity_block_block_block>, <additions:infinity_block_block_block>, <additions:infinity_block_block_block>, <additions:infinity_block_block_block>, <additions:infinity_block_block_block>, <additions:infinity_block_block_block>, <additions:infinity_block_block_block>],[<additions:infinity_block_block_block>, <additions:infinity_block_block_block>, <additions:infinity_block_block_block>, <additions:infinity_block_block_block>, <additions:infinity_block_block_block>, <additions:infinity_block_block_block>, <additions:infinity_block_block_block>, <additions:infinity_block_block_block>, <additions:infinity_block_block_block>],[<additions:infinity_block_block_block>, <additions:infinity_block_block_block>, <additions:infinity_block_block_block>, <additions:infinity_block_block_block>, <additions:infinity_block_block_block>, <additions:infinity_block_block_block>, <additions:infinity_block_block_block>, <additions:infinity_block_block_block>, <additions:infinity_block_block_block>],[<additions:infinity_block_block_block>, <additions:infinity_block_block_block>, <additions:infinity_block_block_block>, <additions:infinity_block_block_block>, <additions:infinity_block_block_block>, <additions:infinity_block_block_block>, <additions:infinity_block_block_block>, <additions:infinity_block_block_block>, <additions:infinity_block_block_block>],[<additions:infinity_block_block_block>, <additions:infinity_block_block_block>, <additions:infinity_block_block_block>, <additions:infinity_block_block_block>, <additions:infinity_block_block_block>, <additions:infinity_block_block_block>, <additions:infinity_block_block_block>, <additions:infinity_block_block_block>, <additions:infinity_block_block_block>],[<additions:infinity_block_block_block>, <additions:infinity_block_block_block>, <additions:infinity_block_block_block>, <additions:infinity_block_block_block>, <additions:infinity_block_block_block>, <additions:infinity_block_block_block>, <additions:infinity_block_block_block>, <additions:infinity_block_block_block>, <additions:infinity_block_block_block>]]);

// 创造模式取出升级
recipes.remove(<storagedrawers:upgrade_creative:1>);
ExtremeCrafting.addShaped("custom_avaritia_recipe_39", <storagedrawers:upgrade_creative:1> * 1, [[<additions:creative_soul>, <additions:creative_soul>, <additions:creative_soul>, <additions:creative_soul>, <additions:creative_soul>, <additions:creative_soul>, <additions:creative_soul>, <additions:creative_soul>, <additions:creative_soul>], [<additions:creative_soul>, <storagedrawers:upgrade_storage:4>, <storagedrawers:upgrade_storage:4>, <storagedrawers:upgrade_storage:4>, <storagedrawers:upgrade_storage:4>, <storagedrawers:upgrade_storage:4>, <storagedrawers:upgrade_storage:4>, <storagedrawers:upgrade_storage:4>, <additions:creative_soul>],[<additions:creative_soul>, <storagedrawers:upgrade_storage:4>, <storagedrawers:upgrade_storage:4>, <storagedrawers:upgrade_storage:4>, <storagedrawers:upgrade_storage:4>, <storagedrawers:upgrade_storage:4>, <storagedrawers:upgrade_storage:4>, <storagedrawers:upgrade_storage:4>, <additions:creative_soul>],[<additions:creative_soul>, <storagedrawers:upgrade_storage:4>, <storagedrawers:upgrade_storage:4>, <storagedrawers:upgrade_storage:4>, <storagedrawers:upgrade_storage:4>, <storagedrawers:upgrade_storage:4>, <storagedrawers:upgrade_storage:4>, <storagedrawers:upgrade_storage:4>, <additions:creative_soul>],[<additions:creative_soul>, <additions:creative_soul>, <additions:creative_soul>, <additions:creative_soul>, <additions:infinity_block_block>, <additions:creative_soul>, <additions:creative_soul>, <additions:creative_soul>, <additions:creative_soul>],[<additions:creative_soul>, <storagedrawers:upgrade_creative:0>, <storagedrawers:upgrade_creative:0>, <storagedrawers:upgrade_creative:0>, <storagedrawers:upgrade_creative:0>, <storagedrawers:upgrade_creative:0>, <storagedrawers:upgrade_creative:0>, <storagedrawers:upgrade_creative:0>, <additions:creative_soul>],[<additions:creative_soul>, <storagedrawers:upgrade_creative:0>, <storagedrawers:upgrade_creative:0>, <storagedrawers:upgrade_creative:0>, <storagedrawers:upgrade_creative:0>, <storagedrawers:upgrade_creative:0>, <storagedrawers:upgrade_creative:0>, <storagedrawers:upgrade_creative:0>, <additions:creative_soul>],[<additions:creative_soul>, <storagedrawers:upgrade_creative:0>, <storagedrawers:upgrade_creative:0>, <storagedrawers:upgrade_creative:0>, <storagedrawers:upgrade_creative:0>, <storagedrawers:upgrade_creative:0>, <storagedrawers:upgrade_creative:0>, <storagedrawers:upgrade_creative:0>, <additions:creative_soul>],[<additions:creative_soul>, <additions:creative_soul>, <additions:creative_soul>, <additions:creative_soul>, <additions:creative_soul>, <additions:creative_soul>, <additions:creative_soul>, <additions:creative_soul>, <additions:creative_soul>]]);

// 创造锥刺方块
recipes.remove(<extrautils2:spike_creative>);

// 创造模式箱子
recipes.remove(<extrautils2:creativechest>);

// 创造模式源质罐子
recipes.remove(<thaumicwonders:creative_essentia_jar>);
ExtremeCrafting.addShaped("custom_avaritia_recipe_43", <thaumicwonders:creative_essentia_jar> * 1, [[null, null, null, null, null, null, null, null, null], [null, null, null, null, null, null, null, null, null],[null, null, null, <additions:creative_soul>, <additions:creative_soul>, <additions:creative_soul>, null, null, null],[null, null, <avaritia:resource:6>, <avaritia:resource:6>, <avaritia:resource:6>, <avaritia:resource:6>, <avaritia:resource:6>, null, null],[null, null, <avaritia:resource:6>, <thaumadditions:jar_mithminite>, <thaumadditions:jar_mithminite>, <thaumadditions:jar_mithminite>, <avaritia:resource:6>, null, null],[null, null, <avaritia:resource:6>, <thaumadditions:jar_mithminite>, <thaumadditions:jar_mithminite>, <thaumadditions:jar_mithminite>, <avaritia:resource:6>, null, null],[null, null, <avaritia:resource:6>, <thaumadditions:jar_mithminite>, <thaumadditions:jar_mithminite>, <thaumadditions:jar_mithminite>, <avaritia:resource:6>, null, null],[null, null, <avaritia:resource:6>, <thaumadditions:jar_mithminite>, <thaumadditions:jar_mithminite>, <thaumadditions:jar_mithminite>, <avaritia:resource:6>, null, null],[null, null, <avaritia:resource:6>, <avaritia:resource:6>, <avaritia:resource:6>, <avaritia:resource:6>, <avaritia:resource:6>, null, null]]);

// 创造玩家接口
recipes.remove(<randomthings:creativeplayerinterface>);
ExtremeCrafting.addShaped("custom_avaritia_recipe_44", <randomthings:creativeplayerinterface> * 1, [[null, null, null, null, null, null, null, null, null], [null, <additions:creative_soul>, <additions:creative_soul>, <additions:creative_soul>, <additions:creative_soul>, <additions:creative_soul>, <additions:creative_soul>, <additions:creative_soul>, null],[null, <additions:creative_soul>, <additions:creative_shard>, <additions:creative_shard>, <additions:creative_shard>, <additions:creative_shard>, <additions:creative_shard>, <additions:creative_soul>, null],[null, <additions:creative_soul>, <additions:creative_shard>, <avaritia:resource:5>, <avaritia:resource:5>, <avaritia:resource:5>, <additions:creative_shard>, <additions:creative_soul>, null],[null, <additions:creative_soul>, <additions:creative_shard>, <avaritia:resource:5>, <avaritia:block_resource:1>, <avaritia:resource:5>, <additions:creative_shard>, <additions:creative_soul>, null],[null, <additions:creative_soul>, <additions:creative_shard>, <avaritia:resource:5>, <avaritia:resource:5>, <avaritia:resource:5>, <additions:creative_shard>, <additions:creative_soul>, null],[null, <additions:creative_soul>, <additions:creative_shard>, <additions:creative_shard>, <additions:creative_shard>, <additions:creative_shard>, <additions:creative_shard>, <additions:creative_soul>, null],[null, <additions:creative_soul>, <additions:creative_soul>, <additions:creative_soul>, <additions:creative_soul>, <additions:creative_soul>, <additions:creative_soul>, <additions:creative_soul>, null],[null, null, null, null, null, null, null, null, null]]);

// 创造方块转换器
recipes.remove(<draconicevolution:creative_exchanger>);
ExtremeCrafting.addShaped("custom_avaritia_recipe_45", <draconicevolution:creative_exchanger> * 1, [[<additions:creative_soul>, null, <tconevo:metal_block:1>, null, null, null, null, null, null], [null, <additions:infinity_block_block>, <tconevo:metal_block:1>, null, null, null, null, null, null],[<tconevo:metal_block:1>, <tconevo:metal_block:1>, <additions:creative_soul>, <tconevo:metal_block:1>, <tconevo:metal_block:1>, null, null, null, null],[null, null, <tconevo:metal_block:1>, <additions:creative_soul>, <additions:creative_soul>, <tconevo:metal_block:1>, null, null, null],[null, null, <tconevo:metal_block:1>, <additions:creative_soul>, <additions:creative_soul>, <tconevo:metal_block:1>, null, null, null],[null, null, null, <tconevo:metal_block:1>, <tconevo:metal_block:1>, <tconevo:metal_block:1>, <additions:creative_soul>, null, null],[null, null, null, null, null, <additions:creative_soul>, <tconevo:metal_block:1>, <tconevo:metal_block:1>, <tconevo:metal_block:1>],[null, null, null, null, null, null, <tconevo:metal_block:1>, <tconevo:metal_block:1>, null],[null, null, null, null, null, null, <tconevo:metal_block:1>, null, <additions:creative_soul>]]);

// [创造]牺牲匕首
recipes.remove(<bloodmagic:sacrificial_dagger:1>);
ExtremeCrafting.addShaped("custom_avaritia_recipe_46", <bloodmagic:sacrificial_dagger:1> * 1, [[null, null, null, null, null, null, null, null, null], [null, null, null, null, null, null, <minecraft:iron_ingot>, <minecraft:iron_ingot>, null],[null, null, null, null, null, <minecraft:iron_ingot>, <thermalfoundation:material:163>, <minecraft:iron_ingot>, null],[null, null, null, null, <minecraft:iron_ingot>, <thermalfoundation:material:163>, <minecraft:iron_ingot>, null, null],[null, null, <minecraft:obsidian>, <minecraft:iron_ingot>, <thermalfoundation:material:163>, <minecraft:iron_ingot>, null, null, null],[null, null, null, <additions:creative_soul>, <minecraft:iron_ingot>, null, null, null, null],[null, null, <astralsorcery:itemcraftingcomponent:1>, null, <minecraft:obsidian>, null, null, null, null],[null, <astralsorcery:itemcraftingcomponent:1>, null, null, null, null, null, null, null],[null, null, null, null, null, null, null, null, null]]);

ExtremeCrafting.addShaped("custom_avaritia_recipe_47", <thermalexpansion:capacitor:32000>.withTag({Energy: 25000000}), RecipePattern.init([
    "         ",
    " CCCCCCC ",    
    " CcccccC ",
    " CRCCCRC ",
    " CiccciC ",
    " CcicicC ",
    " CccRccC ",
    " CCCCCCC ",
    "         "
]).map({
    c: <additions:creative_shard>,
    C: <additions:creative_soul>,
    R: <avaritia:singularity:3>,
    i: <thermalfoundation:storage_alloy:2>
}).ingredients);

ExtremeCrafting.addShaped("custom_avaritia_recipe_48", <thermalinnovation:drill:32000>.withTag({Energy: 600000, Mode: 4}), RecipePattern.init([
    "    I    ",
    "   III   ",    
    "  IIIII  ",
    "  CCCCR  ",
    "  CCCCR  ",
    "   CCC   ",
    "   R     ",
    "  R      ",
    "         "
]).map({
    C: <additions:creative_soul>,
    R: <avaritia:singularity:3>,
    I: <thermalfoundation:storage_alloy:2>
}).ingredients);

ExtremeCrafting.addShaped("custom_avaritia_recipe_49", <thermalinnovation:saw:32000>.withTag({Energy: 600000, Mode: 4}), RecipePattern.init([
    "         ",
    "   III   ",    
    "  IIRII  ",
    "  CIIIC  ",
    "  CCCCC  ",
    "   CCC   ",
    "   R     ",
    "  R      ",
    "         "
]).map({
    C: <additions:creative_soul>,
    R: <avaritia:singularity:3>,
    I: <thermalfoundation:storage_alloy:2>
}).ingredients);

//中子素收集器
recipes.remove(<denseneutroncollectors:compressed_neutron_collector>);
recipes.remove(<denseneutroncollectors:double_compressed_neutron_collector>);
recipes.remove(<denseneutroncollectors:triple_compressed_neutron_collector>);

//炽焱高温裂解
mods.avaritia.ExtremeCrafting.addShaped("cygwlj", <thermalexpansion:augment:304> * 1, [[<minecraft:obsidian>, <minecraft:obsidian>, <minecraft:obsidian>, <minecraft:obsidian>, <minecraft:obsidian>, <minecraft:obsidian>, <minecraft:obsidian>, <minecraft:obsidian>, <minecraft:obsidian>], [<minecraft:obsidian>, <minecraft:obsidian>, <additions:stainless_steel_ingot>, <additions:stainless_steel_ingot>, <additions:stainless_steel_ingot>, <additions:stainless_steel_ingot>, <additions:stainless_steel_ingot>, <minecraft:obsidian>, <minecraft:obsidian>],[<minecraft:obsidian>, <additions:stainless_steel_ingot>, <additions:stainless_steel_ingot>, <minecraft:obsidian>, <minecraft:obsidian>, <minecraft:obsidian>, <additions:stainless_steel_ingot>, <additions:stainless_steel_ingot>, <minecraft:obsidian>],[<minecraft:obsidian>, <minecraft:obsidian>, <minecraft:obsidian>, <minecraft:blaze_powder>, <minecraft:blaze_powder>, <minecraft:blaze_powder>, <minecraft:obsidian>, <additions:stainless_steel_ingot>, <minecraft:obsidian>],[<minecraft:blaze_powder>, <minecraft:blaze_powder>, <minecraft:blaze_powder>, <minecraft:blaze_powder>, <minecraft:blaze_powder>, <minecraft:blaze_powder>, <minecraft:obsidian>, <additions:stainless_steel_ingot>, <minecraft:obsidian>],[<minecraft:obsidian>, <minecraft:obsidian>, <minecraft:obsidian>, <minecraft:blaze_powder>, <minecraft:blaze_powder>, <minecraft:blaze_powder>, <minecraft:obsidian>, <additions:stainless_steel_ingot>, <minecraft:obsidian>],[<minecraft:obsidian>, <additions:stainless_steel_ingot>, <additions:stainless_steel_ingot>, <minecraft:obsidian>, <minecraft:obsidian>, <minecraft:obsidian>, <additions:stainless_steel_ingot>, <additions:stainless_steel_ingot>, <minecraft:obsidian>],[<minecraft:obsidian>, <minecraft:obsidian>, <additions:stainless_steel_ingot>, <additions:stainless_steel_ingot>, <additions:stainless_steel_ingot>, <additions:stainless_steel_ingot>, <additions:stainless_steel_ingot>, <minecraft:obsidian>, <minecraft:obsidian>],[<minecraft:obsidian>, <minecraft:obsidian>, <minecraft:obsidian>, <minecraft:obsidian>, <minecraft:obsidian>, <minecraft:obsidian>, <minecraft:obsidian>, <minecraft:obsidian>, <minecraft:obsidian>]]);

//魔法蘑菇
recipes.remove(<toolprogression:magic_mushroom>);
mods.avaritia.ExtremeCrafting.addShaped("magic_mushroom", <toolprogression:magic_mushroom> * 1, [[null, null, <additions:creative_soul>, <additions:creative_soul>, <additions:creative_soul>, <additions:creative_soul>, <additions:creative_soul>, null, null], [null, <additions:creative_soul>, <avaritia:resource:6>, <additions:creative_soul>, <additions:creative_soul>, <additions:creative_soul>, <additions:creative_soul>, <additions:creative_soul>, null],[<additions:creative_soul>, <additions:creative_soul>, <additions:creative_soul>, <additions:creative_soul>, <additions:creative_soul>, <additions:creative_soul>, <avaritia:resource:6>, <additions:creative_soul>, <additions:creative_soul>],[<avaritia:resource:6>, <additions:creative_soul>, <additions:creative_soul>, <additions:creative_soul>, <avaritia:resource:6>, <additions:creative_soul>, <additions:creative_soul>, <additions:creative_soul>, <avaritia:resource:6>],[<additions:creative_soul>, <additions:creative_soul>, <additions:creative_soul>, <additions:creative_soul>, <additions:creative_soul>, <additions:creative_soul>, <additions:creative_soul>, <additions:creative_soul>, <additions:creative_soul>],[null, null, null, <gct_ores:finallium_ingot>, <minecraft:red_mushroom>, <gct_ores:finallium_ingot>, null, null, null],[null, null, null, <gct_ores:finallium_ingot>, <gct_ores:finallium_ingot>, <gct_ores:finallium_ingot>, null, null, null],[null, null, null, <gct_ores:finallium_ingot>, <gct_ores:finallium_ingot>, <gct_ores:finallium_ingot>, null, null, null],[null, null, null, <gct_ores:finallium_ingot>, <gct_ores:finallium_ingot>, <gct_ores:finallium_ingot>, null, null, null]]);

//药水停顿指环
recipes.remove(<redstonerepository:util.ring_effect>);

//创造之魂
mods.avaritia.ExtremeCrafting.addShaped("creative_soul", <additions:creative_soul> * 2, [[null, null, null, <additions:creative_shard>, <additions:creative_shard>, null, null, null, null], [null, null, <additions:creative_shard>, <additions:creative_shard>, <additions:creative_shard>, <additions:creative_shard>, null, null, null],[null, <additions:creative_shard>, <additions:creative_shard>, <additions:creative_shard>, <additions:creative_shard>, null, null, null, null],[<additions:creative_shard>, <additions:creative_shard>, <additions:creative_shard>, null, null, null, null, null, <additions:creative_shard>],[<additions:creative_shard>, <additions:creative_shard>, null, null, <avaritia:resource:5>, null, null, <additions:creative_shard>, <additions:creative_shard>],[<additions:creative_shard>, null, null, null, null, null, <additions:creative_shard>, <additions:creative_shard>, <additions:creative_shard>],[null, null, null, null, <additions:creative_shard>, <additions:creative_shard>, <additions:creative_shard>, <additions:creative_shard>, null],[null, null, null, <additions:creative_shard>, <additions:creative_shard>, <additions:creative_shard>, <additions:creative_shard>, null, null],[null, null, null, null, <additions:creative_shard>, <additions:creative_shard>, null, null, null]]);

//奇点压缩机
ExtremeCrafting.addShaped("compressor1", <extendedcrafting:compressor> * 1, [[<avaritia:resource:4>, <avaritia:resource:1>, <avaritia:resource:1>, <avaritia:resource:1>, <avaritia:resource:1>, <avaritia:resource:1>, <avaritia:resource:1>, <avaritia:resource:1>, <avaritia:resource:4>], [<avaritia:resource:4>, <avaritia:resource:4>, <avaritia:resource:4>, <avaritia:resource:4>, <avaritia:resource:4>, <avaritia:resource:4>, <avaritia:resource:4>, <avaritia:resource:4>, <avaritia:resource:4>],[<avaritia:resource:4>, <avaritia:resource:4>, <avaritia:resource:4>, <avaritia:resource:4>, <avaritia:resource:4>, <avaritia:resource:4>, <avaritia:resource:4>, <avaritia:resource:4>, <avaritia:resource:4>],[<avaritia:resource:4>, <extendedcrafting:material:18>, <extendedcrafting:material:18>, <extendedcrafting:material:18>, <avaritia:resource:4>, <extendedcrafting:material:18>, <extendedcrafting:material:18>, <extendedcrafting:material:18>, <avaritia:resource:4>],[<avaritia:resource:4>, <avaritia:resource:1>, <avaritia:resource:1>, <avaritia:resource:1>, <avaritia:resource:4>, <avaritia:resource:1>, <avaritia:resource:1>, <avaritia:resource:1>, <avaritia:resource:4>],[<avaritia:resource:4>, <avaritia:resource:1>, <avaritia:resource:1>, <avaritia:resource:1>, <avaritia:resource:4>, <avaritia:resource:1>, <avaritia:resource:1>, <avaritia:resource:1>, <avaritia:resource:4>],[<avaritia:resource:4>, <avaritia:resource:1>, <avaritia:block_resource:0>, <avaritia:block_resource:0>, <avaritia:block_resource:0>, <avaritia:block_resource:0>, <avaritia:block_resource:0>, <avaritia:resource:1>, <avaritia:resource:4>],[<avaritia:resource:4>, <avaritia:resource:1>, <avaritia:resource:1>, <avaritia:resource:1>, <avaritia:resource:1>, <avaritia:resource:1>, <avaritia:resource:1>, <avaritia:resource:1>, <avaritia:resource:4>],[<avaritia:resource:4>, <avaritia:resource:4>, <avaritia:resource:4>, <avaritia:resource:4>, <avaritia:resource:4>, <avaritia:resource:4>, <avaritia:resource:4>, <avaritia:resource:4>, <avaritia:resource:4>]]);
