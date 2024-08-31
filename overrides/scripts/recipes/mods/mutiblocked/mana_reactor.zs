/*
 * This script is created for the GreedyCraft modpack by mc_Edwin.
 * You may NOT use this script in any other publicly distributed modpack without my permission.
 */

#priority 1750
#loader multiblocked

import crafttweaker.item.IIngredient;
import crafttweaker.item.IItemStack;

import mods.jaopca.JAOPCA;
import mods.mekanism.chemical.dissolution;
import mods.multiblocked.MBDRegistry;
import mods.multiblocked.definition.ControllerDefinition;
import mods.multiblocked.definition.ComponentDefinition;
import mods.multiblocked.recipe.RecipeMap;
import mods.ctutils.utils.Math;

var rac as ComponentDefinition = MBDRegistry.getDefinition("gct_mac:mana_reactor");
var racct = rac as ControllerDefinition;

var r1 = <additions:botaniaddon-metatron_rune>;
var r2 = <additions:botaniaddon-ratziel_rune>;
var r3 = <additions:botaniaddon-zaphkiel_rune>;
var r4 = <additions:botaniaddon-zadkiel_rune>;
var r5 = <additions:botaniaddon-chamael_rune>;
var r6 = <additions:botaniaddon-michael_rune>;
var r7 = <additions:botaniaddon-haniel_rune>;
var r8 = <additions:botaniaddon-raphael_rune>;
var r9 = <additions:botaniaddon-gabriel_rune>;
var r10 = <additions:botaniaddon-sandalphon_rune>;

var base as IItemStack[][] = [
    [<minecraft:iron_ingot>, <botania:manaresource>],
    [<minecraft:iron_block>, <botania:storage>],
    [<minecraft:diamond>, <botania:manaresource:2>],
    [<minecraft:diamond_block>, <botania:storage:3>],
    [<minecraft:ender_pearl>, <botania:manaresource:1>],
    [<minecraft:dye:4>, <botanicadds:mana_lapis>],
    [<minecraft:lapis_block>, <botanicadds:mana_lapis_block>],
    [<minecraft:string>, <botania:manaresource:16>],
    [<thermalfoundation:material:130>, <thermalfoundation:material:136>],
    [<thermalfoundation:storage:2>, <thermalfoundation:storage:8>],
    [<minecraft:gold_ingot>, <additions:botaniaddon-holium_ingot>],
    [<minecraft:gold_block>, <additions:botaniaddon-holium_block>],
    [<botania:manaresource:14> * 2, <extrabotany:material:1>]
];
var baseMana as float[] = [
    3.0f,
    27.0f,
    10.0f,
    90.0f,
    6.0f,
    5.0f,
    45.0f,
    5.0f,
    4.0f,
    36.0f,
    5.0f,
    45.0f,
    150.0f
];
var rune as IItemStack[][] = [
    [r1, r2, r3],
    [r2, r3, r4],
    [r2, r3, r5],
    [r2, r4, r5],
    [r3, r4, r5],
    [r4, r5, r6],
    [r4, r6, r8],
    [r5, r6, r7],
    [r6, r7, r8],
    [r6, r7, r9],
    [r6, r8, r9],
    [r7, r8, r9],
    [r7, r8, r10],
    [r7, r9, r10],
    [r8, r9, r10]
];
var mana as float[] = [1.6f, 1.8f, 1.4f, 0.8f, 1.2f, 0.9f, 1.5f, 1.4f, 2.0f, 1.5f, 1.5f, 2.0f, 1.7f, 1.8f, 1.35f];
var speed as float[] = [1.2f, 1.6f, 0.9f, 0.5f, 0.7f, 0.6f, 1.15f, 1.0f, 1.1f, 1.2f, 0.8f, 2.0f, 1.5f, 1.6f, 0.6f];
var fuel as IItemStack[] = [
    <aether_legacy:ambrosium_shard>,
    <divinerpg:ice_shards>,
    <divinerpg:molten_shards>,
    <additions:greedycraft-experience_ingot>,
    <thermalfoundation:material:772>,
    <astralsorcery:itemcraftingcomponent:1>,
    <taiga:dilithium_ingot>,
    <journey:firestoneclump>,
    <astralsorcery:itemcraftingcomponent>,
    <biomesoplenty:gem>,
    <taiga:triberium_ingot>,
    <thermalfoundation:material:133>,
    <appliedenergistics2:material:7>,
    <tofucraft:material:18>,
    <additions:titanium_ingot>
];
for i in 0 to 15 {
    for j in 0 to baseMana.length {
        var manacost = Math.ceil(baseMana[j] * mana[i]) as int;
        var timecost = Math.ceil(speed[i] * 300.0f) as int;
        if (base[j][1].definition.id has "extrabotany:material") {
            racct.recipeMap.start()
                .duration(timecost)
                .inputItems(rune[i][0])
                .inputItems(rune[i][1])
                .inputItems(rune[i][2])
                .inputItems(base[j][1])
                .inputItems(fuel[i])
                .inputItems(<botania:manaresource:5> * 2)
                .outputItems(rune[i][0])
                .outputItems(rune[i][1])
                .outputItems(rune[i][2])
                .outputItems(base[j][0])
                .outputFluids(<liquid:mana> * manacost)
                .buildAndRegister();
        } else {
            racct.recipeMap.start()
                .duration(timecost)
                .inputItems(rune[i][0])
                .inputItems(rune[i][1])
                .inputItems(rune[i][2])
                .inputItems(base[j][1])
                .inputItems(fuel[i])
                .inputFE(baseMana[j] * 666)
                .outputItems(rune[i][0])
                .outputItems(rune[i][1])
                .outputItems(rune[i][2])
                .outputItems(base[j][0])
                .outputFluids(<liquid:mana> * manacost)
                .buildAndRegister();
        }
    }
}