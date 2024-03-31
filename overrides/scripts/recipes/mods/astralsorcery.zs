/*
 * This script is created for the GreedyCraft modpack by TCreopargh.
 * You may NOT use this script in any other publicly distributed modpack without my permission.
 */
 
#priority 30

import crafttweaker.item.IItemStack;

import mods.astralsorcery.Altar;
import mods.astralsorcery.StarlightInfusion;
import mods.randomtweaker.astralsorcery.AttunementAltar;

import scripts.util.lang as LangUtil;

val errorStone = <minecraft:stone>.withTag({display: {Name: LangUtil.translate("greedycraft.misc.bug_stone.name"), Lore: [LangUtil.translate("greedycraft.misc.bug_stone.tooltip.1"), LangUtil.translate("greedycraft.misc.bug_stone.tooltip.2")]}}) as IItemStack;

StarlightInfusion.addInfusion(<biomesoplenty:gem:1>, <additions:greedycraft-resonating_ruby>, false, 0.7, 200);

AttunementAltar.addRecipe(<ore:toolTiC>, errorStone);
AttunementAltar.addRecipe(<ore:armorTiC>, errorStone);

Altar.removeAltarRecipe("astralsorcery:shaped/internal/altar/illuminationpowder");
Altar.removeAltarRecipe("astralsorcery:shaped/internal/altar/enchantment_amulet_craft");
Altar.removeAltarRecipe("astralsorcery:shaped/internal/altar/enchantment_amulet_reroll");

Altar.addDiscoveryAltarRecipe("shinydust", <astralsorcery:itemusabledust> * 16, 100, 100, [
    null, <ore:dustGlowstone>, null,
    <ore:dustGlowstone>, <ore:fallenStar>, <ore:dustGlowstone>,
    null, <ore:dustGlowstone>, null
]);
            
Altar.addConstellationAltarRecipe("shining_star", <additions:greedycraft-shining_star>, 1000, 200, [
    <astralsorcery:itemusabledust>, <ore:dustAstralStarmetal>, <astralsorcery:itemusabledust>,
    <ore:dustAstralStarmetal>, <ore:blockGold>, <ore:dustAstralStarmetal>,
    <astralsorcery:itemusabledust>, <ore:dustAstralStarmetal>, <astralsorcery:itemusabledust>,
    <ore:fallenStar>, <ore:fallenStar>, <ore:fallenStar>, <ore:fallenStar>,
    <ore:fallenStar>, <ore:fallenStar>,
    <ore:fallenStar>, <ore:fallenStar>,
    <ore:fallenStar>, <ore:fallenStar>,
    <ore:fallenStar>, <ore:fallenStar>
]);

Altar.addTraitAltarRecipe("heavite", <gct_mobs:heavite> * 14, 4000, 100, [
    <ore:stoneLerdite>, <ore:stoneAmeralite>, <ore:stoneLerdite>,
    <ore:stoneAmeralite>, <ore:blockDaynight>, <ore:stoneAmeralite>,
    <ore:stoneLerdite>, <ore:stoneAmeralite>, <ore:stoneLerdite>,
    <ore:stoneLerdite>, <ore:stoneLerdite>, <ore:stoneLerdite>, <ore:stoneLerdite>,
    <ore:stoneAmeralite>, <ore:stoneAmeralite>, <ore:stoneAmeralite>, <ore:stoneAmeralite>, 
    <ore:stoneAmeralite>, <ore:stoneAmeralite>, <ore:stoneAmeralite>, <ore:stoneAmeralite>, 
    <ore:stoneLerdite>, <ore:stoneLerdite>, <ore:stoneLerdite>, <ore:stoneLerdite>,
    <ore:fallenStar>, <ore:fallenStar>, <ore:fallenStar>, <ore:fallenStar>
], "astralsorcery.constellation.mineralis");

Altar.addTraitAltarRecipe("controller_altar", <modularmachinery:bright_altar_controller>, 7000, 140, [
    <ore:blockAstralMetal>, <ore:blockLunarine>, <ore:blockAstralMetal>,
    <ore:blockNasalum>, <ore:ingotCosmilite>, <ore:blockNasalum>,
    <ore:blockAstralMetal>, <ore:blockLunarine>, <ore:blockAstralMetal>,
    <additions:astral-astral_gem_01>, <additions:astral-astral_gem_02>, <additions:astral-astral_gem_03>,
    <additions:astral-astral_gem_04>, <additions:astral-astral_gem_05>, <additions:astral-astral_gem_06>,
    <additions:astral-astral_gem_07>, <additions:astral-astral_gem_08>, <additions:astral-astral_gem_09>,
    <additions:astral-astral_gem_10>, <additions:astral-astral_gem_11>, <additions:astral-astral_gem_12>,
    <ore:ingotEugardite>, <ore:ingotEugardite>, <ore:ingotEugardite>, <ore:ingotEugardite>,
    <ore:ingotEugardite>, <ore:ingotEugardite>, <ore:ingotEugardite>, <ore:ingotEugardite>
], "astralsorcery.constellation.lucerna");

Altar.addTraitAltarRecipe("astral_crystal", <additions:astral-astral_gem_00>, 6500, 100, [
    <ore:dustEverite>, <ore:dustAstralStarmetal>, <ore:dustDraconiumChaotic>,
    <ore:dustAstralStarmetal>, <ore:gemGlistenQuartzProcessed>, <ore:dustAstralStarmetal>,
    <ore:dustDraconiumChaotic>, <ore:dustAstralStarmetal>, <ore:dustEverite>,
    null, <ore:dustDraconiumChaotic>, <ore:dustDraconiumChaotic>, null,
    null, <ore:dustDraconiumChaotic>, null, <ore:dustDraconiumChaotic>,
    <ore:dustDraconiumChaotic>, null, <ore:dustDraconiumChaotic>, null,
    <ore:dustAstralStarmetal>, <ore:dustAstralStarmetal>, <ore:dustAstralStarmetal>, <ore:dustAstralStarmetal>,
    <ore:ingotAstralMetal>, <ore:ingotAstralMetal>
], "astralsorcery.constellation.octans");

Altar.addTraitAltarRecipe("controller_collector", <modularmachinery:astral_collector_controller> * 3, 7000, 140, [
    <ore:ingotChromasteel>, <ore:ingotNasalum>, <ore:ingotChromasteel>,
    <ore:ingotNasalum>, <modularmachinery:blockcontroller>, <ore:ingotNasalum>,
    <ore:ingotChromasteel>, <ore:ingotNasalum>, <ore:ingotChromasteel>,
    <astralsorcery:itemtunedcelestialcrystal>,
    <astralsorcery:itemtunedcelestialcrystal>,
    <astralsorcery:itemtunedcelestialcrystal>,
    <astralsorcery:itemtunedcelestialcrystal>,
    <astralsorcery:itemtunedcelestialcrystal>,
    <astralsorcery:itemtunedcelestialcrystal>,
    <astralsorcery:itemtunedcelestialcrystal>,
    <astralsorcery:itemtunedcelestialcrystal>,
    <astralsorcery:itemtunedcelestialcrystal>,
    <astralsorcery:itemtunedcelestialcrystal>,
    <astralsorcery:itemtunedcelestialcrystal>,
    <astralsorcery:itemtunedcelestialcrystal>,
    <ore:ingotLunarine>, <ore:ingotLunarine>, <ore:ingotLunarine>, <ore:ingotLunarine>,
    <astralsorcery:itemcraftingcomponent:4>, <ore:dustAstralMetal>,
    <astralsorcery:itemcraftingcomponent:4>, <ore:dustAstralMetal>,
    <astralsorcery:itemcraftingcomponent:4>, <ore:dustAstralMetal>
], "astralsorcery.constellation.lucerna");

