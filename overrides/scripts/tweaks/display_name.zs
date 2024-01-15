/*
 * This script is created for the GreedyCraft modpack by TCreopargh.
 * You may NOT use this script in any other publicly distributed modpack without my permission.
 */

#priority 400

import crafttweaker.game.IGame;
import crafttweaker.item.IItemStack;
import crafttweaker.data.IData;
import crafttweaker.item.IIngredient;

import mods.jei.JEI;

import scripts.util.lang as LangUtil;

val names as string[IItemStack] = {
    <mysticalcreations:cake_essence> : "蛋糕精华",
    <mysticalcreations:cake_seeds> : "蛋糕种子",
    <mysticalcreations:witch_essence> : "女巫精华",
    <mysticalcreations:witch_seeds> : "女巫种子",
    <mysticalcreations:witch_chunk> : "女巫灵魂碎片",
    <mysticalcreations:stainless_steel_essence> : "不锈钢精华",
    <mysticalcreations:stainless_steel_seeds> : "不锈钢种子",
    <mysticalcreations:chromium_essence> : "铬精华",
    <mysticalcreations:chromium_seeds> : "铬种子",
    <mysticalcreations:titanium_essence> : "钛精华",
    <mysticalcreations:titanium_seeds> : "钛种子",
    <mysticalcreations:fusion_matrix_essence> : "聚合矩阵精华",
    <mysticalcreations:fusion_matrix_seeds> : "聚合矩阵种子",
    <mysticalcreations:meteor_essence> : "陨星精华",
    <mysticalcreations:meteor_seeds> : "陨星种子",
    <mysticalcreations:aetherium_seeds> : "以太种子",
    <mysticalcreations:aetherium_essence> : "以太精华",
    <mysticalcreations:canopium_seeds> : "苍穹种子",
    <mysticalcreations:canopium_essence> : "苍穹精华",
    <mysticalcreations:mistium_seeds> : "缥缈种子",
    <mysticalcreations:mistium_essence> : "缥缈精华",
    <mysticalcreations:lavarite_seeds> : "熔浆种子",
    <mysticalcreations:lavarite_essence> : "熔浆精华",
    <mysticalcreations:plasmarite_seeds> : "等离子种子",
    <mysticalcreations:plasmarite_essence> : "等离子精华",
    <mysticalcreations:bnightium_seeds> : "夜明种子",
    <mysticalcreations:bnightium_essence> : "夜明精华",
    <mysticalcreations:snowingium_seeds> : "碎雪种子",
    <mysticalcreations:snowingium_essence> : "碎雪精华",
    <mysticalcreations:freezite_seeds> : "封晶种子",
    <mysticalcreations:freezite_essence> : "封晶精华",
    <mysticalcreations:oceanium_seeds> : "浩瀚种子",
    <mysticalcreations:oceanium_essence> : "浩瀚精华",
    <mysticalcreations:cryonium_seeds> : "极寒种子",
    <mysticalcreations:cryonium_essence> : "极寒精华",
    <mysticalcreations:infernium_seeds> : "永燃种子",
    <mysticalcreations:infernium_essence> : "永燃精华",
    <mysticalcreations:cytosinite_seeds> : "胞嘧种子",
    <mysticalcreations:cytosinite_essence> : "胞嘧精华",
    <mysticalcreations:thyminite_seeds> : "胸腺嘧种子",
    <mysticalcreations:thyminite_essence> : "胸腺嘧精华",
    <mysticalcreations:guaninite_seeds> : "鸟嘌呤晶种子",
    <mysticalcreations:guaninite_essence> : "鸟嘌呤晶精华",
    <mysticalcreations:adeninite_seeds> : "腺嘌呤晶种子",
    <mysticalcreations:adeninite_essence> : "腺嘌呤晶精华"
} as string[IItemStack];

if (LangUtil.getLanguage() == "zh_cn") {
    for item in names {
        var name as string = names[item] as string;
        item.displayName = name;
        item.addTooltip("§e" + name);
        JEI.addDescription(item, "该物品的汉化名称是：" + name);
    }
}
