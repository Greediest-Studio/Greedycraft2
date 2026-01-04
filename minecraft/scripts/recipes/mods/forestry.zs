/*
 * This script is created for the GreedyCraft modpack by TCreopargh.
 * You may NOT use this script in any other publicly distributed modpack without my permission.
 */

#priority 800
// Powered by TCreopargh

import crafttweaker.item.IItemStack;
import crafttweaker.data.IData;
import crafttweaker.item.IIngredient;
import crafttweaker.oredict.IOreDictEntry;
import mods.jei.JEI;

import mods.forestry.Carpenter;
import mods.forestry.Centrifuge;

import mods.zenutils.I18n;

Centrifuge.removeRecipe(<extrabees:honey_comb:26>);

val base as IIngredient[] = [
    <mysticalagriculture:crafting:16>,
    <mysticalagriculture:crafting:17>,
    <mysticalagriculture:crafting:18>,
    <mysticalagriculture:crafting:19>,
    <mysticalagriculture:crafting:20>,
    <mysticalagriculture:crafting:21>,
    <mysticalagradditions:insanium:1>,
    <additions:seed_tier_7>,
    <additions:seed_tier_8>,
    <additions:seed_tier_9>
];
val essence as IIngredient[] = [
    <mysticalagriculture:crafting:5>,
    <ore:essenceInferium>,
    <ore:essencePrudentium>,
    <ore:essenceIntermedium>,
    <ore:essenceSuperium>,
    <ore:essenceSupremium>,
    <ore:essenceInsanium>,
    <ore:essenceExtremium>,
    <ore:essenceGodlikeum>,
    <ore:essenceNonenium>
];

val seedRecipes as IIngredient[][][IItemStack] = {
    <mysticalagriculture:soularium_seeds> : [
        [<ore:ingotSoularium>, essence[4], <ore:ingotSoularium>], 
        [essence[4], base[4], essence[4]], 
        [<ore:ingotSoularium>, essence[4], <ore:ingotSoularium>]
    ],
    <mysticalagriculture:quicksilver_seeds> : [
        [<ore:quicksilver>, essence[3], <ore:quicksilver>], 
        [essence[3], base[3], essence[3]], 
        [<ore:quicksilver>, essence[3], <ore:quicksilver>]
    ],
    <mysticalagriculture:vibrant_alloy_seeds> : [
        [<ore:ingotVibrantAlloy>, essence[5], <ore:ingotVibrantAlloy>], 
        [essence[5], base[5], essence[5]], 
        [<ore:ingotVibrantAlloy>, essence[5], <ore:ingotVibrantAlloy>]
    ],
    <mysticalagriculture:draconium_seeds> : [
        [<ore:ingotDraconium>, essence[5], <ore:ingotDraconium>], 
        [essence[5], base[5], essence[5]], 
        [<ore:ingotDraconium>, essence[5], <ore:ingotDraconium>]
    ],
    <mysticalagriculture:blizz_seeds> : [
        [<mysticalagriculture:chunk:21>, essence[3], <mysticalagriculture:chunk:21>], 
        [essence[3], base[3], essence[3]], 
        [<mysticalagriculture:chunk:21>, essence[3], <mysticalagriculture:chunk:21>]
    ],
    <mysticalagriculture:dark_steel_seeds> : [
        [<ore:ingotDarkSteel>, essence[4], <ore:ingotDarkSteel>], 
        [essence[4], base[4], essence[4]], 
        [<ore:ingotDarkSteel>, essence[4], <ore:ingotDarkSteel>]
    ],
    <mysticalagriculture:ironwood_seeds> : [
        [<ore:ingotIronwood>, essence[3], <ore:ingotIronwood>], 
        [essence[3], base[3], essence[3]], 
        [<ore:ingotIronwood>, essence[3], <ore:ingotIronwood>]
    ],
    <mysticalagriculture:coralium_seeds> : [
        [<ore:gemCoralium>, essence[3], <ore:gemCoralium>], 
        [essence[3], base[3], essence[3]], 
        [<ore:gemCoralium>, essence[3], <ore:gemCoralium>]
    ],
    <mysticalagriculture:slate_seeds> : [
        [<rustic:slate>, essence[2], <rustic:slate>], 
        [essence[2], base[2], essence[2]], 
        [<rustic:slate>, essence[2], <rustic:slate>]
    ],
    <mysticalagriculture:saltpeter_seeds> : [
        [<ore:dustSaltpeter>, essence[3], <ore:dustSaltpeter>], 
        [essence[3], base[3], essence[3]], 
        [<ore:dustSaltpeter>, essence[3], <ore:dustSaltpeter>]
    ],
    <mysticalagriculture:elementium_seeds> : [
        [<botania:manaresource:7>, essence[4], <botania:manaresource:7>], 
        [essence[4], base[4], essence[4]], 
        [<botania:manaresource:7>, essence[4], <botania:manaresource:7>]
    ],
    <mysticalagriculture:rabbit_seeds> : [
        [<mysticalagriculture:chunk:15>, essence[3], <mysticalagriculture:chunk:15>], 
        [essence[3], base[3], essence[3]], 
        [<mysticalagriculture:chunk:15>, essence[3], <mysticalagriculture:chunk:15>]
    ],
    <mysticalagriculture:void_metal_seeds> : [
        [<ore:ingotVoid>, essence[4], <ore:ingotVoid>], 
        [essence[4], base[4], essence[4]], 
        [<ore:ingotVoid>, essence[4], <ore:ingotVoid>]
    ],
    <mysticalagriculture:fire_seeds> : [
        [<minecraft:lava_bucket>, essence[2], <minecraft:lava_bucket>], 
        [essence[2], base[2], essence[2]], 
        [<minecraft:lava_bucket>, essence[2], <minecraft:lava_bucket>]
    ],
    <mysticalagriculture:nether_quartz_seeds> : [
        [<minecraft:quartz>, essence[3], <minecraft:quartz>], 
        [essence[3], base[3], essence[3]], 
        [<minecraft:quartz>, essence[3], <minecraft:quartz>]
    ],
    <mysticalagriculture:redstone_seeds> : [
        [<minecraft:redstone>, essence[3], <minecraft:redstone>], 
        [essence[3], base[3], essence[3]], 
        [<minecraft:redstone>, essence[3], <minecraft:redstone>]
    ],
    <mysticalagriculture:aluminum_seeds> : [
        [<ore:ingotAluminum>, essence[2], <ore:ingotAluminum>], 
        [essence[2], base[2], essence[2]], 
        [<ore:ingotAluminum>, essence[2], <ore:ingotAluminum>]
    ],
    <mysticalagriculture:tin_seeds> : [
        [<ore:ingotTin>, essence[3], <ore:ingotTin>], 
        [essence[3], base[3], essence[3]], 
        [<ore:ingotTin>, essence[3], <ore:ingotTin>]
    ],
    <mysticalagriculture:lapis_lazuli_seeds> : [
        [<minecraft:dye:4>, essence[4], <minecraft:dye:4>], 
        [essence[4], base[4], essence[4]], 
        [<minecraft:dye:4>, essence[4], <minecraft:dye:4>]
    ],
    <mysticalagriculture:basalz_seeds> : [
        [<mysticalagriculture:chunk:23>, essence[3], <mysticalagriculture:chunk:23>], 
        [essence[3], base[3], essence[3]], 
        [<mysticalagriculture:chunk:23>, essence[3], <mysticalagriculture:chunk:23>]
    ],
    <mysticalagriculture:amber_seeds> : [
        [<ore:gemAmber>, essence[4], <ore:gemAmber>], 
        [essence[4], base[4], essence[4]], 
        [<ore:gemAmber>, essence[4], <ore:gemAmber>]
    ],
    <mysticalagriculture:refined_obsidian_seeds> : [
        [<ore:ingotRefinedObsidian>, essence[5], <ore:ingotRefinedObsidian>], 
        [essence[5], base[5], essence[5]], 
        [<ore:ingotRefinedObsidian>, essence[5], <ore:ingotRefinedObsidian>]
    ],
    <mysticalagriculture:abyssalnite_seeds> : [
        [<ore:ingotAbyssalnite>, essence[4], <ore:ingotAbyssalnite>], 
        [essence[4], base[4], essence[4]], 
        [<ore:ingotAbyssalnite>, essence[4], <ore:ingotAbyssalnite>]
    ],
    <mysticalagriculture:chicken_seeds> : [
        [<mysticalagriculture:chunk:8>, essence[2], <mysticalagriculture:chunk:8>], 
        [essence[2], base[2], essence[2]], 
        [<mysticalagriculture:chunk:8>, essence[2], <mysticalagriculture:chunk:8>]
    ],
    <mysticalagriculture:steel_seeds> : [
        [<ore:ingotSteel>, essence[5], <ore:ingotSteel>], 
        [essence[5], base[5], essence[5]], 
        [<ore:ingotSteel>, essence[5], <ore:ingotSteel>]
    ],
    <mysticalagriculture:slime_seeds> : [
        [<mysticalagriculture:chunk:11>, essence[2], <mysticalagriculture:chunk:11>], 
        [essence[2], base[2], essence[2]], 
        [<mysticalagriculture:chunk:11>, essence[2], <mysticalagriculture:chunk:11>]
    ],
    <mysticalagriculture:blitz_seeds> : [
        [<mysticalagriculture:chunk:22>, essence[3], <mysticalagriculture:chunk:22>], 
        [essence[3], base[3], essence[3]], 
        [<mysticalagriculture:chunk:22>, essence[3], <mysticalagriculture:chunk:22>]
    ],
    <mysticalagriculture:platinum_seeds> : [
        [<ore:ingotPlatinum>, essence[5], <ore:ingotPlatinum>], 
        [essence[5], base[5], essence[5]], 
        [<ore:ingotPlatinum>, essence[5], <ore:ingotPlatinum>]
    ],
    <mysticalagriculture:fluix_seeds> : [
        [<ore:crystalFluix>, essence[4], <ore:crystalFluix>], 
        [essence[4], base[4], essence[4]], 
        [<ore:crystalFluix>, essence[4], <ore:crystalFluix>]
    ],
    <mysticalagriculture:bronze_seeds> : [
        [<ore:ingotBronze>, essence[3], <ore:ingotBronze>], 
        [essence[3], base[3], essence[3]], 
        [<ore:ingotBronze>, essence[3], <ore:ingotBronze>]
    ],
    <mysticalagriculture:copper_seeds> : [
        [<ore:ingotCopper>, essence[2], <ore:ingotCopper>], 
        [essence[2], base[2], essence[2]], 
        [<ore:ingotCopper>, essence[2], <ore:ingotCopper>]
    ],
    <mysticalagriculture:end_steel_seeds> : [
        [<ore:ingotEndSteel>, essence[5], <ore:ingotEndSteel>], 
        [essence[5], base[5], essence[5]], 
        [<ore:ingotEndSteel>, essence[5], <ore:ingotEndSteel>]
    ],
    <mysticalagriculture:creeper_seeds> : [
        [<mysticalagriculture:chunk:13>, essence[3], <mysticalagriculture:chunk:13>], 
        [essence[3], base[3], essence[3]], 
        [<mysticalagriculture:chunk:13>, essence[3], <mysticalagriculture:chunk:13>]
    ],
    <mysticalagriculture:enderman_seeds> : [
        [<mysticalagriculture:chunk:19>, essence[4], <mysticalagriculture:chunk:19>], 
        [essence[4], base[4], essence[4]], 
        [<mysticalagriculture:chunk:19>, essence[4], <mysticalagriculture:chunk:19>]
    ],
    <mysticalagriculture:lead_seeds> : [
        [<ore:ingotLead>, essence[3], <ore:ingotLead>], 
        [essence[3], base[3], essence[3]], 
        [<ore:ingotLead>, essence[3], <ore:ingotLead>]
    ],
    <mysticalagriculture:dye_seeds> : [
        [<mysticalagriculture:crafting:7>, essence[2], <mysticalagriculture:crafting:7>], 
        [essence[2], base[2], essence[2]], 
        [<mysticalagriculture:crafting:7>, essence[2], <mysticalagriculture:crafting:7>]
    ],
    <mysticalagriculture:ender_amethyst_seeds> : [
        [<biomesoplenty:gem>, essence[5], <biomesoplenty:gem>], 
        [essence[5], base[5], essence[5]], 
        [<biomesoplenty:gem>, essence[5], <biomesoplenty:gem>]
    ],
    <mysticalagriculture:starmetal_seeds> : [
        [<astralsorcery:itemcraftingcomponent:1>, essence[5], <astralsorcery:itemcraftingcomponent:1>], 
        [essence[5], base[5], essence[5]], 
        [<astralsorcery:itemcraftingcomponent:1>, essence[5], <astralsorcery:itemcraftingcomponent:1>]
    ],
    <mysticalagriculture:knightmetal_seeds> : [
        [<ore:ingotKnightmetal>, essence[4], <ore:ingotKnightmetal>], 
        [essence[4], base[4], essence[4]], 
        [<ore:ingotKnightmetal>, essence[4], <ore:ingotKnightmetal>]
    ],
    <mysticalagriculture:nickel_seeds> : [
        [<ore:ingotNickel>, essence[4], <ore:ingotNickel>], 
        [essence[4], base[4], essence[4]], 
        [<ore:ingotNickel>, essence[4], <ore:ingotNickel>]
    ],
    <mysticalagriculture:ender_biotite_seeds> : [
        [<ore:gemEnderBiotite>, essence[3], <ore:gemEnderBiotite>], 
        [essence[3], base[3], essence[3]], 
        [<ore:gemEnderBiotite>, essence[3], <ore:gemEnderBiotite>]
    ],
    <mysticalagriculture:steeleaf_seeds> : [
        [<ore:ingotSteeleaf>, essence[3], <ore:ingotSteeleaf>], 
        [essence[3], base[3], essence[3]], 
        [<ore:ingotSteeleaf>, essence[3], <ore:ingotSteeleaf>]
    ],
    <mysticalagriculture:marble_seeds> : [
        [<chisel:marble2:7>, essence[2], <chisel:marble2:7>], 
        [essence[2], base[2], essence[2]], 
        [<chisel:marble2:7>, essence[2], <chisel:marble2:7>]
    ],
    <mysticalagriculture:conductive_iron_seeds> : [
        [<ore:ingotConductiveIron>, essence[3], <ore:ingotConductiveIron>], 
        [essence[3], base[3], essence[3]], 
        [<ore:ingotConductiveIron>, essence[3], <ore:ingotConductiveIron>]
    ],
    <mysticalagriculture:black_quartz_seeds> : [
        [<ore:gemQuartzBlack>, essence[3], <ore:gemQuartzBlack>], 
        [essence[3], base[3], essence[3]], 
        [<ore:gemQuartzBlack>, essence[3], <ore:gemQuartzBlack>]
    ],
    <mysticalagriculture:tanzanite_seeds> : [
        [<ore:gemTanzanite>, essence[4], <ore:gemTanzanite>], 
        [essence[4], base[4], essence[4]], 
        [<ore:gemTanzanite>, essence[4], <ore:gemTanzanite>]
    ],
    <mysticalagriculture:mithril_seeds> : [
        [<ore:ingotMithril>, essence[4], <ore:ingotMithril>], 
        [essence[4], base[4], essence[4]], 
        [<ore:ingotMithril>, essence[4], <ore:ingotMithril>]
    ],
    <mysticalagriculture:alumite_seeds> : [
        [<ore:ingotAlumite>, essence[4], <ore:ingotAlumite>], 
        [essence[4], base[4], essence[4]], 
        [<ore:ingotAlumite>, essence[4], <ore:ingotAlumite>]
    ],
    <mysticalagriculture:iron_seeds> : [
        [<ore:ingotIron>, essence[3], <ore:ingotIron>], 
        [essence[3], base[3], essence[3]], 
        [<ore:ingotIron>, essence[3], <ore:ingotIron>]
    ],
    <mysticalagriculture:manasteel_seeds> : [
        [<botania:manaresource>, essence[3], <botania:manaresource>], 
        [essence[3], base[3], essence[3]], 
        [<botania:manaresource>, essence[3], <botania:manaresource>]
    ],
    <mysticalagriculture:basalt_seeds> : [
        [<chisel:basalt2:7>, essence[2], <chisel:basalt2:7>], 
        [essence[2], base[2], essence[2]], 
        [<chisel:basalt2:7>, essence[2], <chisel:basalt2:7>]
    ],
    <mysticalagriculture:aquamarine_seeds> : [
        [<astralsorcery:itemcraftingcomponent>, essence[3], <astralsorcery:itemcraftingcomponent>], 
        [essence[3], base[3], essence[3]], 
        [<astralsorcery:itemcraftingcomponent>, essence[3], <astralsorcery:itemcraftingcomponent>]
    ],
    <mysticalagriculture:malachite_seeds> : [
        [<ore:gemMalachite>, essence[4], <ore:gemMalachite>], 
        [essence[4], base[4], essence[4]], 
        [<ore:gemMalachite>, essence[4], <ore:gemMalachite>]
    ],
    <mysticalagriculture:thaumium_seeds> : [
        [<ore:ingotThaumium>, essence[3], <ore:ingotThaumium>], 
        [essence[3], base[3], essence[3]], 
        [<ore:ingotThaumium>, essence[3], <ore:ingotThaumium>]
    ],
    <mysticalagriculture:aluminum_brass_seeds> : [
        [<tconstruct:ingots:5>, essence[2], <tconstruct:ingots:5>], 
        [essence[2], base[2], essence[2]], 
        [<tconstruct:ingots:5>, essence[2], <tconstruct:ingots:5>]
    ],
    <mysticalagriculture:invar_seeds> : [
        [<ore:ingotInvar>, essence[4], <ore:ingotInvar>], 
        [essence[4], base[4], essence[4]], 
        [<ore:ingotInvar>, essence[4], <ore:ingotInvar>]
    ],
    <mysticalagriculture:gold_seeds> : [
        [<ore:ingotGold>, essence[4], <ore:ingotGold>], 
        [essence[4], base[4], essence[4]], 
        [<ore:ingotGold>, essence[4], <ore:ingotGold>]
    ],
    <mysticalagriculture:experience_seeds> : [
        [<mysticalagriculture:chunk:5>, essence[4], <mysticalagriculture:chunk:5>], 
        [essence[4], base[4], essence[4]], 
        [<mysticalagriculture:chunk:5>, essence[4], <mysticalagriculture:chunk:5>]
    ],
    <mysticalagriculture:obsidian_seeds> : [
        [<minecraft:obsidian>, essence[3], <minecraft:obsidian>], 
        [essence[3], base[3], essence[3]], 
        [<minecraft:obsidian>, essence[3], <minecraft:obsidian>]
    ],
    <mysticalagriculture:skeleton_seeds> : [
        [<mysticalagriculture:chunk:12>, essence[3], <mysticalagriculture:chunk:12>], 
        [essence[3], base[3], essence[3]], 
        [<mysticalagriculture:chunk:12>, essence[3], <mysticalagriculture:chunk:12>]
    ],
    <mysticalagriculture:dreadium_seeds> : [
        [<ore:ingotDreadium>, essence[5], <ore:ingotDreadium>], 
        [essence[5], base[5], essence[5]], 
        [<ore:ingotDreadium>, essence[5], <ore:ingotDreadium>]
    ],
    <mysticalagriculture:cow_seeds> : [
        [<mysticalagriculture:chunk:9>, essence[2], <mysticalagriculture:chunk:9>], 
        [essence[2], base[2], essence[2]], 
        [<mysticalagriculture:chunk:9>, essence[2], <mysticalagriculture:chunk:9>]
    ],
    <mysticalagriculture:emerald_seeds> : [
        [<minecraft:emerald>, essence[5], <minecraft:emerald>], 
        [essence[5], base[5], essence[5]], 
        [<minecraft:emerald>, essence[5], <minecraft:emerald>]
    ],
    <mysticalagriculture:certus_quartz_seeds> : [
        [<ore:crystalCertusQuartz>, essence[3], <ore:crystalCertusQuartz>], 
        [essence[3], base[3], essence[3]], 
        [<ore:crystalCertusQuartz>, essence[3], <ore:crystalCertusQuartz>]
    ],
    <mysticalagriculture:apatite_seeds> : [
        [<ore:gemApatite>, essence[2], <ore:gemApatite>], 
        [essence[2], base[2], essence[2]], 
        [<ore:gemApatite>, essence[2], <ore:gemApatite>]
    ],
    <mysticalagriculture:wither_skeleton_seeds> : [
        [<mysticalagriculture:chunk:20>, essence[5], <mysticalagriculture:chunk:20>], 
        [essence[5], base[5], essence[5]], 
        [<mysticalagriculture:chunk:20>, essence[5], <mysticalagriculture:chunk:20>]
    ],
    <mysticalagriculture:coal_seeds> : [
        [<minecraft:coal>, essence[2], <minecraft:coal>], 
        [essence[2], base[2], essence[2]], 
        [<minecraft:coal>, essence[2], <minecraft:coal>]
    ],
    <mysticalagriculture:peridot_seeds> : [
        [<ore:gemPeridot>, essence[4], <ore:gemPeridot>], 
        [essence[4], base[4], essence[4]], 
        [<ore:gemPeridot>, essence[4], <ore:gemPeridot>]
    ],
    <mysticalagriculture:redstone_alloy_seeds> : [
        [<ore:ingotRedstoneAlloy>, essence[3], <ore:ingotRedstoneAlloy>], 
        [essence[3], base[3], essence[3]], 
        [<ore:ingotRedstoneAlloy>, essence[3], <ore:ingotRedstoneAlloy>]
    ],
    <mysticalagriculture:silicon_seeds> : [
        [<ore:itemSilicon>, essence[2], <ore:itemSilicon>], 
        [essence[2], base[2], essence[2]], 
        [<ore:itemSilicon>, essence[2], <ore:itemSilicon>]
    ],
    <mysticalagriculture:energetic_alloy_seeds> : [
        [<ore:ingotEnergeticAlloy>, essence[4], <ore:ingotEnergeticAlloy>], 
        [essence[4], base[4], essence[4]], 
        [<ore:ingotEnergeticAlloy>, essence[4], <ore:ingotEnergeticAlloy>]
    ],
    <mysticalagriculture:constantan_seeds> : [
        [<ore:ingotConstantan>, essence[4], <ore:ingotConstantan>], 
        [essence[4], base[4], essence[4]], 
        [<ore:ingotConstantan>, essence[4], <ore:ingotConstantan>]
    ],
    <mysticalagriculture:sapphire_seeds> : [
        [<ore:gemSapphire>, essence[4], <ore:gemSapphire>], 
        [essence[4], base[4], essence[4]], 
        [<ore:gemSapphire>, essence[4], <ore:gemSapphire>]
    ],
    <mysticalagriculture:graphite_seeds> : [
        [<ore:ingotGraphite>, essence[3], <ore:ingotGraphite>], 
        [essence[3], base[3], essence[3]], 
        [<ore:ingotGraphite>, essence[3], <ore:ingotGraphite>]
    ],
    <mysticalagriculture:ruby_seeds> : [
        [<ore:gemRuby>, essence[4], <ore:gemRuby>], 
        [essence[4], base[4], essence[4]], 
        [<ore:gemRuby>, essence[4], <ore:gemRuby>]
    ],
    <mysticalagriculture:iridium_seeds> : [
        [<ore:ingotIridium>, essence[5], <ore:ingotIridium>], 
        [essence[5], base[5], essence[5]], 
        [<ore:ingotIridium>, essence[5], <ore:ingotIridium>]
    ],
    <mysticalagriculture:electrum_seeds> : [
        [<ore:ingotElectrum>, essence[4], <ore:ingotElectrum>], 
        [essence[4], base[4], essence[4]], 
        [<ore:ingotElectrum>, essence[4], <ore:ingotElectrum>]
    ],
    <mysticalagriculture:topaz_seeds> : [
        [<ore:gemTopaz>, essence[4], <ore:gemTopaz>], 
        [essence[4], base[4], essence[4]], 
        [<ore:gemTopaz>, essence[4], <ore:gemTopaz>]
    ],
    <mysticalagriculture:limestone_seeds> : [
        [<chisel:limestone2:7>, essence[2], <chisel:limestone2:7>], 
        [essence[2], base[2], essence[2]], 
        [<chisel:limestone2:7>, essence[2], <chisel:limestone2:7>]
    ],
    <mysticalagriculture:glowstone_seeds> : [
        [<minecraft:glowstone>, essence[3], <minecraft:glowstone>], 
        [essence[3], base[3], essence[3]], 
        [<minecraft:glowstone>, essence[3], <minecraft:glowstone>]
    ],
    <mysticalagriculture:ghast_seeds> : [
        [<mysticalagriculture:chunk:18>, essence[4], <mysticalagriculture:chunk:18>], 
        [essence[4], base[4], essence[4]], 
        [<mysticalagriculture:chunk:18>, essence[4], <mysticalagriculture:chunk:18>]
    ],
    <mysticalagriculture:fluxed_electrum_seeds> : [
        [<ore:ingotElectrumFlux>, essence[4], <ore:ingotElectrumFlux>], 
        [essence[4], base[4], essence[4]], 
        [<ore:ingotElectrumFlux>, essence[4], <ore:ingotElectrumFlux>]
    ],
    <mysticalagriculture:sheep_seeds> : [
        [<mysticalagriculture:chunk:10>, essence[2], <mysticalagriculture:chunk:10>], 
        [essence[2], base[2], essence[2]], 
        [<mysticalagriculture:chunk:10>, essence[2], <mysticalagriculture:chunk:10>]
    ],
    <mysticalagriculture:diamond_seeds> : [
        [<minecraft:diamond>, essence[5], <minecraft:diamond>], 
        [essence[5], base[5], essence[5]], 
        [<minecraft:diamond>, essence[5], <minecraft:diamond>]
    ],
    <mysticalagriculture:cobalt_seeds> : [
        [<tconstruct:ingots>, essence[4], <tconstruct:ingots>], 
        [essence[4], base[4], essence[4]], 
        [<tconstruct:ingots>, essence[4], <tconstruct:ingots>]
    ],
    <mysticalagriculture:knightslime_seeds> : [
        [<tconstruct:ingots:3>, essence[3], <tconstruct:ingots:3>], 
        [essence[3], base[3], essence[3]], 
        [<tconstruct:ingots:3>, essence[3], <tconstruct:ingots:3>]
    ],
    <mysticalagriculture:marble_seeds> : [
        [<astralsorcery:blockmarble>, essence[2], <astralsorcery:blockmarble>], 
        [essence[2], base[2], essence[2]], 
        [<astralsorcery:blockmarble>, essence[2], <astralsorcery:blockmarble>]
    ],
    <mysticalagriculture:grains_of_infinity_seeds> : [
        [<ore:dustBedrock>, essence[2], <ore:dustBedrock>], 
        [essence[2], base[2], essence[2]], 
        [<ore:dustBedrock>, essence[2], <ore:dustBedrock>]
    ],
    <mysticalagriculture:pig_seeds> : [
        [<mysticalagriculture:chunk:7>, essence[2], <mysticalagriculture:chunk:7>], 
        [essence[2], base[2], essence[2]], 
        [<mysticalagriculture:chunk:7>, essence[2], <mysticalagriculture:chunk:7>]
    ],
    <mysticalagriculture:guardian_seeds> : [
        [<mysticalagriculture:chunk:16>, essence[3], <mysticalagriculture:chunk:16>], 
        [essence[3], base[3], essence[3]], 
        [<mysticalagriculture:chunk:16>, essence[3], <mysticalagriculture:chunk:16>]
    ],
    <mysticalagriculture:terrasteel_seeds> : [
        [<botania:manaresource:4>, essence[5], <botania:manaresource:4>], 
        [essence[5], base[5], essence[5]], 
        [<botania:manaresource:4>, essence[5], <botania:manaresource:4>]
    ],
    <mysticalagriculture:signalum_seeds> : [
        [<ore:ingotSignalum>, essence[4], <ore:ingotSignalum>], 
        [essence[4], base[4], essence[4]], 
        [<ore:ingotSignalum>, essence[4], <ore:ingotSignalum>]
    ],
    <mysticalagriculture:glowstone_ingot_seeds> : [
        [<ore:ingotRefinedGlowstone>, essence[4], <ore:ingotRefinedGlowstone>], 
        [essence[4], base[4], essence[4]], 
        [<ore:ingotRefinedGlowstone>, essence[4], <ore:ingotRefinedGlowstone>]
    ],
    <mysticalagriculture:ardite_seeds> : [
        [<tconstruct:ingots:1>, essence[3], <tconstruct:ingots:1>], 
        [essence[3], base[3], essence[3]], 
        [<tconstruct:ingots:1>, essence[3], <tconstruct:ingots:1>]
    ],
    <mysticalagriculture:blaze_seeds> : [
        [<mysticalagriculture:chunk:17>, essence[4], <mysticalagriculture:chunk:17>], 
        [essence[4], base[4], essence[4]], 
        [<mysticalagriculture:chunk:17>, essence[4], <mysticalagriculture:chunk:17>]
    ],
    <mysticalagriculture:spider_seeds> : [
        [<mysticalagriculture:chunk:14>, essence[3], <mysticalagriculture:chunk:14>], 
        [essence[3], base[3], essence[3]], 
        [<mysticalagriculture:chunk:14>, essence[3], <mysticalagriculture:chunk:14>]
    ],
    <mysticalagriculture:manyullyn_seeds> : [
        [<tconstruct:ingots:2>, essence[5], <tconstruct:ingots:2>], 
        [essence[5], base[5], essence[5]], 
        [<tconstruct:ingots:2>, essence[5], <tconstruct:ingots:2>]
    ],
    <mysticalagriculture:osmium_seeds> : [
        [<ore:ingotOsmium>, essence[4], <ore:ingotOsmium>], 
        [essence[4], base[4], essence[4]], 
        [<ore:ingotOsmium>, essence[4], <ore:ingotOsmium>]
    ],
    <mysticalagriculture:pulsating_iron_seeds> : [
        [<ore:ingotPulsatingIron>, essence[4], <ore:ingotPulsatingIron>], 
        [essence[4], base[4], essence[4]], 
        [<ore:ingotPulsatingIron>, essence[4], <ore:ingotPulsatingIron>]
    ],
    <mysticalagriculture:mystical_flower_seeds> : [
        [<mysticalagriculture:crafting:10>, essence[2], <mysticalagriculture:crafting:10>], 
        [essence[2], base[2], essence[2]], 
        [<mysticalagriculture:crafting:10>, essence[2], <mysticalagriculture:crafting:10>]
    ],
    <mysticalagriculture:sulfur_seeds> : [
        [<ore:dustSulfur>, essence[2], <ore:dustSulfur>], 
        [essence[2], base[2], essence[2]], 
        [<ore:dustSulfur>, essence[2], <ore:dustSulfur>]
    ],
    <mysticalagriculture:lumium_seeds> : [
        [<ore:ingotLumium>, essence[4], <ore:ingotLumium>], 
        [essence[4], base[4], essence[4]], 
        [<ore:ingotLumium>, essence[4], <ore:ingotLumium>]
    ],
    <mysticalagriculture:rock_crystal_seeds> : [
        [<astralsorcery:blockcustomore:0>, essence[5], <astralsorcery:blockcustomore:0>], 
        [essence[5], base[5], essence[5]], 
        [<astralsorcery:blockcustomore:0>, essence[5], <astralsorcery:blockcustomore:0>]
    ],
    <mysticalagriculture:end_seeds> : [
        [<mysticalagriculture:crafting:9>, essence[4], <mysticalagriculture:crafting:9>], 
        [essence[4], base[4], essence[4]], 
        [<mysticalagriculture:crafting:9>, essence[4], <mysticalagriculture:crafting:9>]
    ],
    <mysticalagriculture:electrical_steel_seeds> : [
        [<ore:ingotElectricalSteel>, essence[3], <ore:ingotElectricalSteel>], 
        [essence[3], base[3], essence[3]], 
        [<ore:ingotElectricalSteel>, essence[3], <ore:ingotElectricalSteel>]
    ],
    <mysticalagriculture:silver_seeds> : [
        [<ore:ingotSilver>, essence[3], <ore:ingotSilver>], 
        [essence[3], base[3], essence[3]], 
        [<ore:ingotSilver>, essence[3], <ore:ingotSilver>]
    ],
    <mysticalagriculture:sky_stone_seeds> : [
        [<appliedenergistics2:sky_stone_block>, essence[3], <appliedenergistics2:sky_stone_block>], 
        [essence[3], base[3], essence[3]], 
        [<appliedenergistics2:sky_stone_block>, essence[3], <appliedenergistics2:sky_stone_block>]
    ],
    <mysticalagriculture:brass_seeds> : [
        [<ore:ingotBrass>, essence[3], <ore:ingotBrass>], 
        [essence[3], base[3], essence[3]], 
        [<ore:ingotBrass>, essence[3], <ore:ingotBrass>]
    ],
    <mysticalagriculture:enderium_seeds> : [
        [<ore:ingotEnderium>, essence[5], <ore:ingotEnderium>], 
        [essence[5], base[5], essence[5]], 
        [<ore:ingotEnderium>, essence[5], <ore:ingotEnderium>]
    ],
    <mysticalagriculture:nether_seeds> : [
        [<mysticalagriculture:crafting:8>, essence[2], <mysticalagriculture:crafting:8>], 
        [essence[2], base[2], essence[2]], 
        [<mysticalagriculture:crafting:8>, essence[2], <mysticalagriculture:crafting:8>]
    ],
    <mysticalagriculture:dirt_seeds> : [
        [<ore:dirt>, essence[1], <ore:dirt>], 
        [essence[1], base[1], essence[1]], 
        [<ore:dirt>, essence[1], <ore:dirt>]
    ],
    <mysticalagriculture:stone_seeds> : [
        [<ore:stone>, essence[1], <ore:stone>], 
        [essence[1], base[1], essence[1]], 
        [<ore:stone>, essence[1], <ore:stone>]
    ],
    <mysticalagriculture:nature_seeds> : [
        [<mysticalagriculture:crafting:6>, essence[1], <mysticalagriculture:crafting:6>], 
        [essence[1], base[1], essence[1]], 
        [<mysticalagriculture:crafting:6>, essence[1], <mysticalagriculture:crafting:6>]
    ],
    <mysticalagriculture:wood_seeds> : [
        [<ore:logWood>, essence[1], <ore:logWood>], 
        [essence[1], base[1], essence[1]], 
        [<ore:logWood>, essence[1], <ore:logWood>]
    ],
    <mysticalagriculture:water_seeds> : [
        [<minecraft:water_bucket>, essence[1], <minecraft:water_bucket>], 
        [essence[1], base[1], essence[1]], 
        [<minecraft:water_bucket>, essence[1], <minecraft:water_bucket>]
    ],
    <mysticalagriculture:zombie_seeds> : [
        [<mysticalagriculture:chunk:6>, essence[1], <mysticalagriculture:chunk:6>], 
        [essence[1], base[1], essence[1]], 
        [<mysticalagriculture:chunk:6>, essence[1], <mysticalagriculture:chunk:6>]
    ],
    <mysticalagriculture:ice_seeds> : [
        [<ore:ice>, essence[1], <ore:ice>], 
        [essence[1], base[1], essence[1]], 
        [<ore:ice>, essence[1], <ore:ice>]
    ],
    <mysticalagradditions:awakened_draconium_seeds> : [
        [<ore:ingotDraconiumAwakened>, essence[6], <ore:ingotDraconiumAwakened>], 
        [essence[6], base[6], essence[6]], 
        [<ore:ingotDraconiumAwakened>, essence[6], <ore:ingotDraconiumAwakened>]
    ],
    <mysticalagradditions:dragon_egg_seeds> : [
        [<mysticalagradditions:stuff:3>, essence[6], <mysticalagradditions:stuff:3>], 
        [essence[6], base[6], essence[6]], 
        [<mysticalagradditions:stuff:3>, essence[6], <mysticalagradditions:stuff:3>]
    ],
    <mysticalagradditions:tier6_inferium_seeds> : [
        [essence[6], essence[6], essence[6]], 
        [essence[6], <mysticalagriculture:tier5_inferium_seeds>, essence[6]], 
        [essence[6], essence[6], essence[6]]
    ],
    <mysticalagradditions:nether_star_seeds> : [
        [<minecraft:nether_star>, essence[6], <minecraft:nether_star>], 
        [essence[6], base[6], essence[6]], 
        [<minecraft:nether_star>, essence[6], <minecraft:nether_star>]
    ],
    <mysticalagradditions:neutronium_seeds> : [
        [<ore:ingotCosmicNeutronium>, essence[6], <ore:ingotCosmicNeutronium>], 
        [essence[6], base[6], essence[6]], 
        [<ore:ingotCosmicNeutronium>, essence[6], <ore:ingotCosmicNeutronium>]
    ],
    <mysticalagriculture:tier4_inferium_seeds> : [
        [essence[4], essence[4], essence[4]], 
        [essence[4], <mysticalagriculture:tier3_inferium_seeds>, essence[4]], 
        [essence[4], essence[4], essence[4]]
    ],
    <mysticalagriculture:tier2_inferium_seeds> : [
        [essence[2], essence[2], essence[2]], 
        [essence[2], <mysticalagriculture:tier1_inferium_seeds>, essence[2]], 
        [essence[2], essence[2], essence[2]]
    ],
    <mysticalagriculture:tier1_inferium_seeds> : [
        [essence[1], essence[1], essence[1]], 
        [essence[1], <minecraft:wheat_seeds>, essence[1]], 
        [essence[1], essence[1], essence[1]]
    ],
    <mysticalagriculture:tier5_inferium_seeds> : [
        [essence[5], essence[5], essence[5]], 
        [essence[5], <mysticalagriculture:tier4_inferium_seeds>, essence[5]], 
        [essence[5], essence[5], essence[5]]
    ],
    <mysticalagriculture:tier3_inferium_seeds> : [
        [essence[3], essence[3], essence[3]], 
        [essence[3], <mysticalagriculture:tier2_inferium_seeds>, essence[3]], 
        [essence[3], essence[3], essence[3]]
    ],
    <mysticalagriculture:uranium_seeds> : [
        [<ore:ingotUranium>, essence[5], <ore:ingotUranium>], 
        [essence[5], base[5], essence[5]], 
        [<ore:ingotUranium>, essence[5], <ore:ingotUranium>]
    ],
    <mysticalagriculture:valonite_seeds> : [
        [<ore:gemValonite>, essence[5], <ore:gemValonite>], 
        [essence[5], base[5], essence[5]], 
        [<ore:gemValonite>, essence[5], <ore:gemValonite>]
    ],
    <mysticalagriculture:lithium_seeds> : [
        [<ore:ingotLithium>, essence[4], <ore:ingotLithium>], 
        [essence[4], base[4], essence[4]], 
        [<ore:ingotLithium>, essence[4], <ore:ingotLithium>]
    ],
    <mysticalagriculture:magnesium_seeds> : [
        [<ore:ingotMagnesium>, essence[4], <ore:ingotMagnesium>], 
        [essence[4], base[4], essence[4]], 
        [<ore:ingotMagnesium>, essence[4], <ore:ingotMagnesium>]
    ],
    <mysticalagriculture:thorium_seeds> : [
        [<ore:ingotThorium>, essence[4], <ore:ingotThorium>], 
        [essence[4], base[4], essence[4]], 
        [<ore:ingotThorium>, essence[4], <ore:ingotThorium>]
    ],
    <mysticalagriculture:fiery_ingot_seeds> : [
        [<twilightforest:fiery_ingot>, essence[4], <twilightforest:fiery_ingot>], 
        [essence[4], base[4], essence[4]], 
        [<twilightforest:fiery_ingot>, essence[4], <twilightforest:fiery_ingot>]
    ],
    <mysticalagriculture:boron_seeds> : [
        [<ore:ingotBoron>, essence[4], <ore:ingotBoron>], 
        [essence[4], base[4], essence[4]], 
        [<ore:ingotBoron>, essence[4], <ore:ingotBoron>]
    ],
    <mysticalagriculture:dark_gem_seeds> : [
        [<ore:gemDark>, essence[3], <ore:gemDark>], 
        [essence[3], base[3], essence[3]], 
        [<ore:gemDark>, essence[3], <ore:gemDark>]
    ],
    <mysticalagriculture:octine_seeds> : [
        [<ore:ingotOctine>, essence[3], <ore:ingotOctine>], 
        [essence[3], base[3], essence[3]], 
        [<ore:ingotOctine>, essence[3], <ore:ingotOctine>]
    ],
    <mysticalagriculture:syrmorite_seeds> : [
        [<ore:ingotSyrmorite>, essence[3], <ore:ingotSyrmorite>], 
        [essence[3], base[3], essence[3]], 
        [<ore:ingotSyrmorite>, essence[3], <ore:ingotSyrmorite>]
    ],
    <mysticalagriculture:slimy_bone_seeds> : [
        [<ore:gemSlimyBone>, essence[2], <ore:gemSlimyBone>], 
        [essence[2], base[2], essence[2]], 
        [<ore:gemSlimyBone>, essence[2], <ore:gemSlimyBone>]
    ],
    <mysticalagriculture:jade_seeds> : [
        [<ore:gemJade>, essence[4], <ore:gemJade>], 
        [essence[4], base[4], essence[4]], 
        [<ore:gemJade>, essence[4], <ore:gemJade>]
    ]
} as IIngredient[][][IItemStack];

for seed in seedRecipes {
    recipes.remove(seed);
    var baseItemName as string = game.localize("greedycraft.mysticalagriculture.base_item");
    var grid as IIngredient[][] = seedRecipes[seed] as IIngredient[][];
    if (grid.length > 0 && grid[0].length > 0) {
        baseItemName = grid[0][0].items[0].displayName;
    }
    seed.addTooltip(I18n.format("greedycraft.mysticalagriculture.seed_tooltip", baseItemName));
    mods.jei.JEI.addDescription(seed, I18n.format("greedycraft.mysticalagriculture.jei_info", baseItemName));
    var time = [60, 75, 80, 100, 140, 210, 1200, 6400, 20000, 60000] as int[];
    var fluid = [600, 750, 900, 1200, 1600, 2400, 10000, 10000, 10000] as int[];
    var fertilizer = [
        <thermalfoundation:fertilizer>,
        <thermalfoundation:fertilizer>,
        <thermalfoundation:fertilizer:1>,
        <thermalfoundation:fertilizer:1>,
        <thermalfoundation:fertilizer:2>,
        <thermalfoundation:fertilizer:2>,
        <mysticalagriculture:mystical_fertilizer>,
        <additions:between_essence>,
        <additions:solid_culture_medium>
    ] as IItemStack[];
    var tier = 0;
    if (<ore:seedsTier1> has seed) {
        tier = 1;
    } else if (<ore:seedsTier2> has seed) {
        tier = 2;
    } else if (<ore:seedsTier3> has seed) {
        tier = 3;
    } else if (<ore:seedsTier4> has seed) {
        tier = 4;
    } else if (<ore:seedsTier5> has seed) {
        tier = 5;
    } else if (<ore:seedsTier6> has seed) {
        tier = 6;
    } else if (<ore:seedsTier7> has seed) {
        tier = 7;
    } else if (<ore:seedsTier8> has seed) {
        tier = 8;
    } else if (<ore:seedsTier9> has seed) {
        tier = 9;
    }
    Carpenter.addRecipe(seed, grid, time[tier], <liquid:organic_fluid> * fluid[tier], fertilizer[tier]);
}

Carpenter.addRecipe(<morebees:diamondfragment>, [
    [null, <morebees:graincrystal>, null],
    [<morebees:graincrystal>, <morebees:graincrystal>, <morebees:graincrystal>],
    [null, <morebees:graincrystal>, null]
], 100, <liquid:water> * 1000, null);

val List = [
    <minecraft:apple:0>,
    <forestry:bee_combs:14>,
    <forestry:bee_combs:10>,
    <forestry:bee_combs:16>,
    <forestry:bee_combs:15>,
    <forestry:mulch:0>,
    <minecraft:coal:0>,
    <minecraft:coal:1>,
    <natura:redwood_sapling:0>,
    <minecraft:cookie:0>,
    <minecraft:nether_wart:0>,
    <minecraft:sandstone:0>,
    <minecraft:sapling:0>,
    <minecraft:sapling:1>,
    <minecraft:sapling:4>,
    <minecraft:sapling:5>,
    <minecraft:sapling:2>,
    <minecraft:sapling:3>,
    <minecraft:brick_block:0>,
    <natura:overworld_logs2:2>,
    <natura:overworld_logs2:3>,
    <natura:overworld_logs2:0>,
    <natura:overworld_logs2:1>,
    <natura:edibles:1>,
    <natura:edibles:0>,
    <natura:edibles:3>,
    <natura:edibles:2>,
    <natura:edibles:5>,
    <natura:edibles:4>,
    <natura:edibles:7>,
    <natura:edibles:6>,
    <natura:edibles:9>,
    <natura:edibles:8>,
    <forestry:fertilizer_compound:0>,
    <natura:materials:8>,
    <natura:materials:6>,
    <natura:materials:7>,
    <natura:materials:0>,
    <natura:materials:1>,
    <natura:materials:4>,
    <natura:materials:5>,
    <natura:materials:2>,
    <natura:materials:3>,
    <forestry:refractory_wax:0>,
    <natura:saguaro_fruit_item:0>,
    <forestry:pollen:1>,
    <forestry:pollen:0>,
    <natura:overworld_sapling2:3>,
    <natura:overworld_sapling2:2>,
    <natura:overworld_sapling2:1>,
    <natura:overworld_sapling2:0>,
    <forestry:royal_jelly:0>,
    <minecraft:log2:0>,
    <minecraft:log2:1>,
    <natura:nether_sapling:0>,
    <natura:nether_sapling:1>,
    <natura:nether_sapling:2>,
    <minecraft:mycelium:0>,
    <forestry:honeydew:0>,
    <forestry:phosphor:0>,
    <natura:edibles:10>,
    <natura:edibles:11>,
    <minecraft:dye:4>,
    <natura:apple_sapling:0>,
    <natura:nether_glowshroom:2>,
    <natura:nether_glowshroom:0>,
    <natura:nether_glowshroom:1>,
    <minecraft:clay_ball:0>,
    <forestry:apatite:0>,
    <forestry:peat:0>,
    <natura:overworld_logs:0>,
    <natura:overworld_logs:1>,
    <natura:overworld_logs:2>,
    <natura:overworld_logs:3>,
    <forestry:beeswax:0>,
    <forestry:bog_earth:0>,
    <forestry:fruits:5>,
    <forestry:fruits:4>,
    <forestry:fruits:6>,
    <forestry:fruits:1>,
    <forestry:fruits:0>,
    <forestry:fruits:3>,
    <forestry:fruits:2>,
    <natura:redwood_logs:2>,
    <natura:redwood_logs:1>,
    <natura:redwood_logs:0>,
    <forestry:humus:0>,
    <natura:overworld_seeds:0>,
    <natura:overworld_seeds:1>,
    <natura:nether_logs2:0>,
    <natura:nether_sapling2:0>,
    <minecraft:log:1>,
    <minecraft:log:0>,
    <minecraft:log:3>,
    <minecraft:log:2>,
    <natura:nether_logs:1>,
    <natura:nether_logs:0>,
    <natura:nether_logs:2>,
    <minecraft:soul_sand:0>,
    <minecraft:wheat_seeds:0>,
    <forestry:propolis:0>,
    <minecraft:sand:1>,
    <minecraft:sand:0>,
    <minecraft:nether_brick:0>,
    <natura:nether_logs2:15>,
    <minecraft:dirt:2>,
    <forestry:ash:0>,
    <natura:overworld_sapling:0>,
    <natura:overworld_sapling:2>,
    <natura:overworld_sapling:1>,
    <natura:overworld_sapling:3>,
    <forestry:bee_combs:3>,
    <forestry:bee_combs:2>,
    <forestry:bee_combs:1>,
    <forestry:bee_combs:0>,
    <forestry:bee_combs:7>,
    <forestry:bee_combs:6>,
    <forestry:bee_combs:5>,
    <forestry:bee_combs:4>,
    <forestry:bee_combs:8>,
    <minecraft:dirt>,
    <minecraft:prismarine:1>,
    <minecraft:stone>,
    <thermalfoundation:material:771>
];

for i in List {
    Carpenter.removeRecipe(i);
}
for i in loadedMods["forestry"].items {
    if (i.definition.id has "crated") {
        Carpenter.removeRecipe(i);
    }
}

val ODList = [
    <ore:cropPotato>,
    <ore:dustRedstone>,
    <ore:cobblestone>,
    <ore:obsidian>,
    <ore:stoneGranite>,
    <ore:netherrack>,
    <ore:sugarcane>,
    <ore:stoneAndesite>,
    <ore:blockPrismarine>,
    <ore:ingotTin>,
    <ore:stoneDiorite>,
    <ore:cropCactus>,
    <ore:blockPrismarineDark>,
    <ore:ingotBronze>,
    <ore:cropWheat>,
    <ore:ingotCopper>,
    <ore:gravel>,
    <ore:cropCarrot>,
    <ore:dustGlowstone>
] as IOreDictEntry[];

for od in ODList {
    for i in od.items {
        Carpenter.removeRecipe(i);
    }
    Carpenter.removeRecipe(itemUtils.getItem("forestry:crated." + od.name.toLowerCase().replace("ore:", "")));
}