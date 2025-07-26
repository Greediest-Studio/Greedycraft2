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

StarlightInfusion.addInfusion(<biomesoplenty:gem:1>, <additions:resonating_ruby>, false, 0.7, 200);

//AttunementAltar.addRecipe(<ore:toolTiC>, errorStone);
//AttunementAltar.addRecipe(<ore:armorTiC>, errorStone);

Altar.removeAltarRecipe("astralsorcery:shaped/internal/altar/illuminationpowder");
Altar.removeAltarRecipe("astralsorcery:shaped/internal/altar/enchantment_amulet_craft");
Altar.removeAltarRecipe("astralsorcery:shaped/internal/altar/enchantment_amulet_reroll");
Altar.removeAltarRecipe("astralsorcery:shaped/internal/altar/tool_exchange");
Altar.removeAltarRecipe("astralsorcery:shaped/internal/altar/bore_head_vortex");

Altar.addDiscoveryAltarRecipe("shinydust", <astralsorcery:itemusabledust> * 16, 100, 100, [
    null, <ore:dustGlowstone>, null,
    <ore:dustGlowstone>, <additions:astral_star>, <ore:dustGlowstone>,
    null, <ore:dustGlowstone>, null
]);
            
Altar.addTraitAltarRecipe("heavite", <gct_mobs:heavite> * 14, 4000, 100, [
    <ore:stoneLerdite>, <ore:stoneAmeralite>, <ore:stoneLerdite>,
    <ore:stoneAmeralite>, <ore:blockDaynight>, <ore:stoneAmeralite>,
    <ore:stoneLerdite>, <ore:stoneAmeralite>, <ore:stoneLerdite>,
    <ore:stoneLerdite>, <ore:stoneLerdite>, <ore:stoneLerdite>, <ore:stoneLerdite>,
    <ore:stoneAmeralite>, <ore:stoneAmeralite>, <ore:stoneAmeralite>, <ore:stoneAmeralite>, 
    <ore:stoneAmeralite>, <ore:stoneAmeralite>, <ore:stoneAmeralite>, <ore:stoneAmeralite>, 
    <ore:stoneLerdite>, <ore:stoneLerdite>, <ore:stoneLerdite>, <ore:stoneLerdite>,
    <additions:astral_star>, <additions:astral_star>, <additions:astral_star>, <additions:astral_star>
], "astralsorcery.constellation.mineralis");

Altar.addTraitAltarRecipe("controller_altar", <modularmachinery:bright_altar_factory_controller>, 7000, 140, [
    <ore:blockAstralMetal>, <ore:blockLunarine>, <ore:blockAstralMetal>,
    <ore:blockNasalum>, <ore:ingotCosmilite>, <ore:blockNasalum>,
    <ore:blockAstralMetal>, <ore:blockLunarine>, <ore:blockAstralMetal>,
    <additions:astral_gem_01>, <additions:astral_gem_02>, <additions:astral_gem_03>,
    <additions:astral_gem_04>, <additions:astral_gem_05>, <additions:astral_gem_06>,
    <additions:astral_gem_07>, <additions:astral_gem_08>, <additions:astral_gem_09>,
    <additions:astral_gem_10>, <additions:astral_gem_11>, <additions:astral_gem_12>,
    <ore:ingotEugardite>, <ore:ingotEugardite>, <ore:ingotEugardite>, <ore:ingotEugardite>,
    <ore:ingotEugardite>, <ore:ingotEugardite>, <ore:ingotEugardite>, <ore:ingotEugardite>
], "astralsorcery.constellation.lucerna");

Altar.addTraitAltarRecipe("astral_crystal", <additions:astral_gem_00>, 6500, 100, [
    <ore:dustEverite>, <ore:dustAstralStarmetal>, <ore:dustDraconiumChaotic>,
    <ore:dustAstralStarmetal>, <ore:gemGlistenQuartzProcessed>, <ore:dustAstralStarmetal>,
    <ore:dustDraconiumChaotic>, <ore:dustAstralStarmetal>, <ore:dustEverite>,
    null, <ore:dustDraconiumChaotic>, <ore:dustDraconiumChaotic>, null,
    null, <ore:dustDraconiumChaotic>, null, <ore:dustDraconiumChaotic>,
    <ore:dustDraconiumChaotic>, null, <ore:dustDraconiumChaotic>, null,
    <ore:dustAstralStarmetal>, <ore:dustAstralStarmetal>, <ore:dustAstralStarmetal>, <ore:dustAstralStarmetal>,
    <ore:ingotAstralMetal>, <ore:ingotAstralMetal>
], "astralsorcery.constellation.octans");

Altar.addTraitAltarRecipe("controller_collector", <modularmachinery:astral_collector_factory_controller> * 3, 7000, 140, [
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

Altar.addTraitAltarRecipe("arcane_crystal_ball", <additions:arcane_crystal_ball>, 4500, 400, [
<ore:ingotThaumium>, <ore:netherStar>, <ore:ingotThaumium>,
<ore:netherStar>, <thaumcraft:salis_mundus>, <ore:netherStar>,
<ore:ingotThaumium>, <ore:netherStar>, <ore:ingotThaumium>,
<astralsorcery:itemusabledust>, <astralsorcery:itemusabledust>, <astralsorcery:itemusabledust>, <astralsorcery:itemusabledust>,
<astralsorcery:itemcraftingcomponent:4>, <astralsorcery:itemcraftingcomponent:4>, <astralsorcery:itemcraftingcomponent:4>, <astralsorcery:itemcraftingcomponent:4>, <astralsorcery:itemcraftingcomponent:4>, <astralsorcery:itemcraftingcomponent:4>, <astralsorcery:itemcraftingcomponent:4>, <astralsorcery:itemcraftingcomponent:4>, 
<astralsorcery:itemcraftingcomponent:4>, <astralsorcery:itemcraftingcomponent:4>, <astralsorcery:itemcraftingcomponent:4>, <astralsorcery:itemcraftingcomponent:4>,
<ore:ingotAstralMetal>, <ore:ingotAstralMetal>, <ore:ingotAstralMetal>, <ore:ingotAstralMetal>, <ore:ingotAstralMetal>, <ore:ingotAstralMetal>
], "astralsorcery.constellation.evorsio");

Altar.addTraitAltarRecipe("astral_metal", <additions:astral_metal_ingot> * 4, 3000, 200, [
<ore:ingotAstralStarmetal>, <astralsorcery:itemusabledust>, <ore:ingotAstralStarmetal>,
<astralsorcery:itemusabledust>, <ore:ingotFusionMatrix>, <astralsorcery:itemusabledust>,
<ore:ingotAstralStarmetal>, <astralsorcery:itemusabledust>, <ore:ingotAstralStarmetal>,
<astralsorcery:itemcraftingcomponent:4>, <astralsorcery:itemcraftingcomponent:4>, <astralsorcery:itemcraftingcomponent:4>, <astralsorcery:itemcraftingcomponent:4>,
null, null, null, null, null, null, null, null, 
<ore:ingotIgnite>, <ore:ingotIgnite>, <ore:ingotIgnite>, <ore:ingotIgnite>,
<additions:astral_star>, <additions:astral_star>, <additions:astral_star>, <additions:astral_star>
], "astralsorcery.constellation.aevitas");

Altar.addConstellationAltarRecipe("philosophers_stone", <projecte:item.pe_philosophers_stone>.withTag({}), 2000, 400, [
            <astralsorcery:itemusabledust>, null, <astralsorcery:itemusabledust>,
            null, <ore:manaPearl>, null,
            <astralsorcery:itemusabledust>, null, <astralsorcery:itemusabledust>,
            <ore:dustAstralStarmetal>, <ore:dustAstralStarmetal>, <ore:dustAstralStarmetal>, <ore:dustAstralStarmetal>,
            <ore:dustBlaze>, <ore:dustBlaze>,
            <ore:dustBlaze>, <ore:dustBlaze>,
            <ore:dustBlaze>, <ore:dustBlaze>,
            <ore:dustBlaze>, <ore:dustBlaze>]);

