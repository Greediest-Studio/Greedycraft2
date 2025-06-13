/*
 * This script is created for the GreedyCraft modpack by TCreopargh.
 * You may NOT use this script in any other publicly distributed modpack without my permission.
 */

#priority 30

import mods.astralsorcery.Altar;

Altar.addConstellationAltarRecipe("philosophers_stone", <projecte:item.pe_philosophers_stone>.withTag({}), 2000, 400, [
            <astralsorcery:itemusabledust>, null, <astralsorcery:itemusabledust>,
            null, <ore:manaPearl>, null,
            <astralsorcery:itemusabledust>, null, <astralsorcery:itemusabledust>,
            <ore:dustAstralStarmetal>, <ore:dustAstralStarmetal>, <ore:dustAstralStarmetal>, <ore:dustAstralStarmetal>,
            <ore:dustBlaze>, <ore:dustBlaze>,
            <ore:dustBlaze>, <ore:dustBlaze>,
            <ore:dustBlaze>, <ore:dustBlaze>,
            <ore:dustBlaze>, <ore:dustBlaze>]);
            
Altar.addTraitAltarRecipe("arcane_crystal_ball", <additions:arcane_crystal_ball>, 4500, 400, [
<ore:ingotThaumium>, <ore:netherStar>, <ore:ingotThaumium>,
<ore:netherStar>, <thaumcraft:salis_mundus>, <ore:netherStar>,
<ore:ingotThaumium>, <ore:netherStar>, <ore:ingotThaumium>,
<astralsorcery:itemusabledust>, <astralsorcery:itemusabledust>, <astralsorcery:itemusabledust>, <astralsorcery:itemusabledust>,
<astralsorcery:itemcraftingcomponent:4>, <astralsorcery:itemcraftingcomponent:4>, <astralsorcery:itemcraftingcomponent:4>, <astralsorcery:itemcraftingcomponent:4>, <astralsorcery:itemcraftingcomponent:4>, <astralsorcery:itemcraftingcomponent:4>, <astralsorcery:itemcraftingcomponent:4>, <astralsorcery:itemcraftingcomponent:4>, 
<astralsorcery:itemcraftingcomponent:4>, <astralsorcery:itemcraftingcomponent:4>, <astralsorcery:itemcraftingcomponent:4>, <astralsorcery:itemcraftingcomponent:4>,
<ore:ingotAstralMetal>, <ore:ingotAstralMetal>, <ore:ingotAstralMetal>, <ore:ingotAstralMetal>, <ore:ingotAstralMetal>, <ore:ingotAstralMetal>
], "astralsorcery.constellation.evorsio");

Altar.removeAltarRecipe("astralsorcery:shaped/internal/altar/tool_exchange");

Altar.addTraitAltarRecipe("astral_metal", <additions:astral_metal_ingot> * 4, 3000, 200, [
<ore:ingotAstralStarmetal>, <astralsorcery:itemusabledust>, <ore:ingotAstralStarmetal>,
<astralsorcery:itemusabledust>, <ore:ingotFusionMatrix>, <astralsorcery:itemusabledust>,
<ore:ingotAstralStarmetal>, <astralsorcery:itemusabledust>, <ore:ingotAstralStarmetal>,
<astralsorcery:itemcraftingcomponent:4>, <astralsorcery:itemcraftingcomponent:4>, <astralsorcery:itemcraftingcomponent:4>, <astralsorcery:itemcraftingcomponent:4>,
null, null, null, null, null, null, null, null, 
<ore:ingotIgnite>, <ore:ingotIgnite>, <ore:ingotIgnite>, <ore:ingotIgnite>,
<additions:astral_star>, <additions:astral_star>, <additions:astral_star>, <additions:astral_star>
], "astralsorcery.constellation.aevitas");

