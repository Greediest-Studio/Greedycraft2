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

StarlightInfusion.addInfusion(<biomesoplenty:gem:1>, <additions:resonating_ruby>, false, 0.7, 200);
StarlightInfusion.addInfusion(<astralsorcery:blockmarble>, <gct_mobs:astral_portal_core>, true, 1.0, 400);

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

