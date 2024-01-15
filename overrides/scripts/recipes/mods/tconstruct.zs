/*
 * This script is created for the GreedyCraft modpack by TCreopargh.
 * You may NOT use this script in any other publicly distributed modpack without my permission.
 */

#priority 1000

import crafttweaker.item.IItemStack;

import mods.tconstruct.Melting;
import mods.tconstruct.Casting;
import mods.tconstruct.Alloy;
import mods.tconstruct.Fuel;
import mods.tcomplement.highoven.HighOven;
import mods.tcomplement.highoven.MixRecipeBuilder;

val VOLUME_BLOCK = 1296;
val VOLUME_INGOT = 144;
val VOLUME_NUGGET = 16;

//Alloy.removeRecipe(<liquid:mirion> * 72, [<liquid:terrasteel> * 18, <liquid:manasteel> * 18, <liquid:elementium> * 18, <liquid:cobalt> * 18, <liquid:glass> * 125]);
//Alloy.removeRecipe(<liquid:mirion>);

Alloy.removeRecipe(<liquid:yrdeen_fluid>);
Alloy.removeRecipe(<liquid:decurrium>);
Alloy.removeRecipe(<liquid:liquidrotiron>);
Alloy.removeRecipe(<liquid:liquidrunesteel>);
Alloy.removeRecipe(<liquid:liquidrotiron>, [<liquid:rottensludge> * 1, <liquid:liquidsyrmorite> * 3]);
Alloy.removeRecipe(<liquid:solita>);
Alloy.removeRecipe(<liquid:steel>);

Alloy.addRecipe(<liquid:yrdeen_fluid> * 3, [<liquid:uru_fluid> * 3, <liquid:valyrium_fluid> * 3, <liquid:signalum>]);
Alloy.addRecipe(<liquid:adamant_fluid> * 3, [<liquid:nihilite_fluid> * 1, <liquid:iox_fluid> * 3]);
Alloy.addRecipe(<liquid:emerald> * 2, [<liquid:experience> * 3, <liquid:redstone> * 2, <liquid:glowstone> * 2]);
Alloy.addRecipe(<liquid:end_steel> * (VOLUME_INGOT * 2), [<liquid:obsidian> * (VOLUME_INGOT * 2), <liquid:dark_steel> * (VOLUME_INGOT * 2), <liquid:ender> * 250]);
Alloy.addRecipe(<liquid:experience> * 16, [<liquid:blood> * 8, <liquid:emerald> * 1, <liquid:gold> * 1]);
Alloy.addRecipe(<liquid:fierymetal> * 2, [<liquid:iron> * 2, <liquid:pyrotheum> * 1, <liquid:lava> * 1]);
Alloy.addRecipe(<liquid:fluxed_electrum> * (VOLUME_INGOT * 2), [<liquid:electrum> * (VOLUME_INGOT * 2), <liquid:redstone> * 100]);
Alloy.addRecipe(<liquid:fusion_matrix> * 2, [<liquid:manyullyn> * 2, <liquid:adamant_fluid> * 1, <liquid:enderium> * 2]);
Alloy.addRecipe(<liquid:liquid_chocolate> * 2, [<liquid:chocolate_liquor> * 1, <liquid:milk> * 1]);
Alloy.addRecipe(<liquid:modularium> * (VOLUME_INGOT * 2), [<liquid:conductive_iron> * VOLUME_INGOT, <liquid:bronze> * VOLUME_INGOT]);
Alloy.addRecipe(<liquid:modularium> * (VOLUME_INGOT * 2), [<liquid:iron> * VOLUME_INGOT, <liquid:bronze> * VOLUME_INGOT, <liquid:redstone> * 100]);
Alloy.addRecipe(<liquid:netherite> * VOLUME_INGOT, [<liquid:gold> * (VOLUME_INGOT * 4), <liquid:ancient_debris> * (VOLUME_INGOT * 4)]);
Alloy.addRecipe(<liquid:scorched> * VOLUME_INGOT, [<liquid:lava> * VOLUME_INGOT, <liquid:stone> * VOLUME_INGOT]);
Alloy.addRecipe(<liquid:stainless_steel> * (VOLUME_INGOT * 4), [<liquid:manganese_steel> * (VOLUME_INGOT * 4), <liquid:nickel> * VOLUME_INGOT, <liquid:chromium> * VOLUME_INGOT]);
Alloy.addRecipe(<liquid:manganese_steel> * (VOLUME_INGOT * 2), [<liquid:steel> * (VOLUME_INGOT * 2), <liquid:manganese> * VOLUME_INGOT]);
Alloy.addRecipe(<liquid:terra_alloy> * 2, [<liquid:cytosinite> * 1, <liquid:cryonium> * 1, <liquid:infernium> * 1, <liquid:titanium> * 1]);
//Alloy.addRecipe(<liquid:mirion> * 72, [<liquid:terrasteel> * 18, <liquid:manasteel> * 18, <liquid:elementium> * 18, <liquid:gaia> * 18]);
Alloy.addRecipe(<liquid:gelid_enderium> * 144, [<liquid:enderium> * 144, <liquid:cryotheum> * 1000]);
Alloy.addRecipe(<liquid:reditrite> * 4, [<liquid:obsidiorite_fluid> * 9, <liquid:osram_fluid> * 2]);
Alloy.addRecipe(<liquid:densite> * 1, [<liquid:osram_fluid> * 1, <liquid:seismum_fluid> * 1]); 
Alloy.addRecipe(<liquid:dyonite_fluid> * 3, [<liquid:triberium_fluid> * 3, <liquid:fractum_fluid> * 1, <liquid:densite> * 1]);
Alloy.addRecipe(<liquid:iox_fluid> * 1, [<liquid:eezo_fluid> * 2, <liquid:abyssum_fluid> * 2, <liquid:reditrite> * 4]);
Alloy.addRecipe(<liquid:sky_alloy> * 2, [<liquid:aetherium>, <liquid:mistium>, <liquid:canopium>, <liquid:thyminite>]);
Alloy.addRecipe(<liquid:fire_alloy> * 2, [<liquid:lavarite>, <liquid:plasmarite>, <liquid:bnightium>, <liquid:guaninite>]);
Alloy.addRecipe(<liquid:ice_alloy> * 2, [<liquid:snowingium>, <liquid:freezite>, <liquid:oceanium>, <liquid:adeninite>]);
Alloy.addRecipe(<liquid:everite> * 1, [<liquid:terra_alloy>, <liquid:sky_alloy>, <liquid:fire_alloy>, <liquid:ice_alloy>]);
Alloy.addRecipe(<liquid:blackiron> * 1, [<liquid:iron>, <liquid:neutronium>]);
Alloy.addRecipe(<liquid:heavenite> * 3, [<liquid:uru_fluid> * 3, <liquid:lighteum> * 2, <liquid:stripium> * 3]);
Alloy.addRecipe(<liquid:ghostite>, [<liquid:valyrium_fluid>, <liquid:manarium>]);
Alloy.addRecipe(<liquid:waringlium> * 3, [<liquid:swinium> * 2, <liquid:stripium> * 2, <liquid:obsidian> * 6]);
Alloy.addRecipe(<liquid:tierite> * 2, [<liquid:cloudite> * 3, <liquid:terrax_fluid> * 3, <liquid:vibranium_fluid> * 2]);
Alloy.addRecipe(<liquid:cheatieum> * 2, [<liquid:mangisite> * 2, <liquid:ghostite>, <liquid:manyullyn> * 3]);
Alloy.addRecipe(<liquid:idiessite>, [<liquid:soilium> * 3, <liquid:heavenite>, <liquid:adamant_fluid>]);
Alloy.addRecipe(<liquid:moltenium> * 2, [<liquid:osram_fluid> * 4, <liquid:heavenite> * 2, <liquid:dimesium>]);
Alloy.addRecipe(<liquid:ranglium>, [<liquid:idiessite>, <liquid:cheatieum>, <liquid:cloudite>]);
Alloy.addRecipe(<liquid:godiarite> * 3, [<liquid:adamant_fluid> * 3, <liquid:togrium> * 2, <liquid:yoggleseum> * 2]);
Alloy.addRecipe(<liquid:rainite> * 3, [<liquid:ranglium> * 2, <liquid:idiessite> * 2, <liquid:oneo> * 3]);
Alloy.addRecipe(<liquid:panloeseum> * 3, [<liquid:ghostite> * 4, <liquid:breakium>]);
Alloy.addRecipe(<liquid:typhoonite> * 2, [<liquid:moltenium> * 2, <liquid:godiarite> * 2, <liquid:xenidium>]);
Alloy.addRecipe(<liquid:fallenium> * 2, [<liquid:vanadium> * 2, <liquid:liquidgallium> * 3, <liquid:fenzium> * 2]);
Alloy.addRecipe(<liquid:phoenixite> * 2, [<liquid:fenzium> * 3, <liquid:dawnium> * 2]);
Alloy.addRecipe(<liquid:depthite> * 3, [<liquid:rainite> * 2, <liquid:breakium> * 4, <liquid:liquidgallium> * 2]);
Alloy.addRecipe(<liquid:lovaquite> * 2, [<liquid:fallenium> * 2, <liquid:molybdenum> * 2, <liquid:losessium>]);
Alloy.addRecipe(<liquid:rangolarite> * 2, [<liquid:phoenixite> * 3, <liquid:depthite>]);
Alloy.addRecipe(<liquid:clearite> * 3, [<liquid:indium> * 2, <liquid:sissidium> * 2, <liquid:typhoonite> * 2]);
Alloy.addRecipe(<liquid:wefenium> * 2, [<liquid:lovaquite> * 3, <liquid:ttwo> * 2, <liquid:tierite>]);
Alloy.addRecipe(<liquid:errorite> * 3, [<liquid:antimony> * 2, <liquid:circlium> * 3, <liquid:rangolarite> * 4]);
Alloy.addRecipe(<liquid:numbereum> * 2, [<liquid:rapesesium> * 2, <liquid:wefenium> * 3]);
Alloy.addRecipe(<liquid:treasurite> * 3, [<liquid:gold> * 7, <liquid:rubium> * 2, <liquid:clearite>]);
Alloy.addRecipe(<liquid:leadite> * 3, [<liquid:circlium> * 2, <liquid:technetium> * 1, <liquid:fallenium> * 6]);
Alloy.addRecipe(<liquid:martisite> * 3, [<liquid:cestium> * 4, <liquid:leadite> * 3, <liquid:numbereum> * 3]);
Alloy.addRecipe(<liquid:flashite> * 3, [<liquid:fraxinium> * 2, <liquid:treasurite> * 2, <liquid:errorite> * 2]);
Alloy.addRecipe(<liquid:overlaite>, [<liquid:martisite>, <liquid:clearite>]);
Alloy.addRecipe(<liquid:balancite> * 2, [<liquid:aqualite>, <liquid:aeroite>, <liquid:asgardium>, <liquid:meteor>]);
Alloy.addRecipe(<liquid:shadow_bar>, [<liquid:rupee>, <liquid:realmite>]);
Alloy.addRecipe(<liquid:glowing_signalum> * 144, [<liquid:signalum> * 144, <liquid:glowstone> * 1000]);
Alloy.addRecipe(<liquid:twilight_crystal>, [<liquid:eden>, <liquid:wildwood>, <liquid:apalachia>, <liquid:skythern>, <liquid:mortum>]);
Alloy.addRecipe(<liquid:daynight>, [<liquid:falsite>, <liquid:ventium>, <liquid:horizonite>]);
Alloy.addRecipe(<liquid:cthulhurite> * 2, [<liquid:moltenabyssalnite>, <liquid:moltenrefinedcoralium>, <liquid:moltendreadium>, <liquid:ethaxium>, <liquid:sanite>]);
Alloy.addRecipe(<liquid:steamium> * 2, [<liquid:steel> * 4, <liquid:tanatonium> * 3, <liquid:liquid_air> * 1]);
Alloy.addRecipe(<liquid:astronicium> * 2, [<liquid:oraclium>, <liquid:halleium>, <liquid:hothium>, <liquid:tonium>]);
Alloy.addRecipe(<liquid:raisium> * 3, [<liquid:steamium> * 3, <liquid:magiga> * 8, <liquid:imitatium> * 2]);
Alloy.addRecipe(<liquid:compressite> * 2, [<liquid:astronicium> * 2, <liquid:raisium> * 2, <liquid:stellarium>]);
Alloy.addRecipe(<liquid:porpezite> * 2, [<liquid:ruthenium>, <liquid:rhodium>, <liquid:palladium_fluid> * 3]);
Alloy.addRecipe(<liquid:decurrium> * 6, [<liquid:eucite> * 3, <liquid:corbite> * 2, <liquid:chloroplast> * 2, <liquid:irisia> * 3]);
Alloy.addRecipe(<liquid:irisia> * 3, [<liquid:shadium>, <liquid:lunium>, <liquid:shadow_bar> * 4]);
Alloy.addRecipe(<liquid:eucite> * 3, [<liquid:celestium>, <liquid:korite>, <liquid:mekyum> * 2, <liquid:storon> * 2]);
Alloy.addRecipe(<liquid:corbite> * 2, [<liquid:des> * 2, <liquid:flairium> * 2, <liquid:orbadite>]);
Alloy.addRecipe(<liquid:liquidrunesteel> * 5, [<liquid:flairium> * 1,<liquid:apocalypsium> * 4,<liquid:fusion_matrix> * 1]);
Alloy.addRecipe(<liquid:scientificite> * 432, [<liquid:hydrochloric_acid> * 1000, <liquid:sulfuric_acid> * 1000, <liquid:nitric_acid> * 1000, <liquid:porpezite> * 1296, <liquid:balanced_matrix> * 144]);
Alloy.addRecipe(<liquid:legendite> * 18, [<liquid:liquidlegend> * 125, <liquid:glass> * 250, <liquid:chromasteel> * 9]);
Alloy.addRecipe(<liquid:eugardite> * 4, [<liquid:decurrium> * 3, <liquid:photonium> * 2, <liquid:solita> * 1, <liquid:dullium> * 2]);
Alloy.addRecipe(<liquid:solita> * 3, [<liquid:reditrite> * 16, <liquid:soularium>, <liquid:adaminite>]);
Alloy.addRecipe(<liquid:shallowbreath> * 100, [<liquid:betweensludge> * 10, <liquid:stagnant_water> * 10000, <liquid:swamp_water> * 10000]);
Alloy.addRecipe(<liquid:zirconium_molybdenum> * 2, [<liquid:zirconium> * 1, <liquid:molybdenum> * 1]);
Alloy.addRecipe(<liquid:enderite> * 144, [<liquid:iridium> * 576, <liquid:resonant_debris> * 576]);
Alloy.addRecipe(<liquid:aetherite> * 144, [<liquid:asgardium> * 576, <liquid:gravity_debris> * 576]);
Alloy.addRecipe(<liquid:zircaloy> * 2, [<liquid:zirconium> * 2, <liquid:tin>]);
Alloy.addRecipe(<liquid:liquidirradium> * 2, [<liquid:iridium> * 1, <liquid:radium> * 1]);
Alloy.addRecipe(<liquid:ascensionite> * 2, [<liquid:limonite> * 4, <liquid:rosite> * 2, <liquid:emberstone> * 1]);
Alloy.addRecipe(<liquid:pruified> * 144, [<liquid:pruified_liquid> * 13, <liquid:betwnite> * 144, <liquid:xu_demonic_metal> * 144, <liquid:mithrillium> * 144]);

Casting.removeBasinRecipe(<tcomplement:scorched_block:10>);
Casting.removeBasinRecipe(<tcomplement:scorched_block:1>);
Casting.removeBasinRecipe(<tcomplement:scorched_block>);
Casting.removeBasinRecipe(<tiths:block_titanium>);
Casting.removeBasinRecipe(<moretcon:itemtrichromadentiumsponge:1>);
Casting.removeBasinRecipe(<moretcon:itemtrichromadentiumsponge:2>);
Casting.removeBasinRecipe(<moretcon:itemtrichromadentiumsponge:3>);
Casting.removeBasinRecipe(<journey:hellstoneblock>);

Casting.removeTableRecipe(<tcomplement:materials:1>);
Casting.removeTableRecipe(<tiths:ingot_titanium>);
Casting.removeTableRecipe(<tiths:nugget_titanium>);
Casting.removeTableRecipe(<journey:hellstoneingot>);
Casting.removeTableRecipe(<divinerpg:hellstone_ingot>);
Casting.removeTableRecipe(<moretcon:rawsteel>);

Casting.addBasinRecipe(<additions:greedycraft-astral_metal_block>, null, <liquid:astral_metal>, VOLUME_BLOCK, false, 300);
Casting.addBasinRecipe(<additions:greedycraft-compressed_experience_block>, <ore:blockExperience>, <liquid:experience>, 10368, true, 300);
Casting.addBasinRecipe(<additions:greedycraft-cosmilite_block>, null, <liquid:cosmilite>, VOLUME_BLOCK, false, 300);
Casting.addBasinRecipe(<additions:greedycraft-crimsonite_block>, null, <liquid:crimsonite>, VOLUME_BLOCK, false, 300);
Casting.addBasinRecipe(<additions:greedycraft-electronium_block>, null, <liquid:electronium>, VOLUME_BLOCK, false, 300);
Casting.addBasinRecipe(<additions:greedycraft-experience_block>, null, <liquid:experience>, VOLUME_BLOCK, false, 200);
Casting.addBasinRecipe(<additions:greedycraft-fusion_matrix_block>, null, <liquid:fusion_matrix>, VOLUME_BLOCK, false, 300);
Casting.addBasinRecipe(<additions:greedycraft-netherite_block>, null, <liquid:netherite>, VOLUME_BLOCK, false, 300);
Casting.addBasinRecipe(<additions:greedycraft-protonium_block>, null, <liquid:protonium>, VOLUME_BLOCK, false, 300);
Casting.addBasinRecipe(<additions:greedycraft-stainless_steel_block>, null, <liquid:stainless_steel>, VOLUME_BLOCK, false, 300);
Casting.addBasinRecipe(<additions:greedycraft-terra_alloy_block>, null, <liquid:terra_alloy>, VOLUME_BLOCK, false, 300);
Casting.addBasinRecipe(<additions:greedycraft-manganese_steel_block>, null, <liquid:manganese_steel>, VOLUME_BLOCK, false, 300);
Casting.addBasinRecipe(<candymod:chocolate_block>, null, <liquid:liquid_chocolate>, VOLUME_BLOCK, false, 300);
Casting.addBasinRecipe(<extrabotany:blockorichalcos>, null, <liquid:orichalcos>, VOLUME_BLOCK, false, 300);
Casting.addBasinRecipe(<nyx:meteor_block>, null, <liquid:meteor>, VOLUME_BLOCK, false, 300);
Casting.addBasinRecipe(<tcomplement:scorched_block>, null, <liquid:scorched>, VOLUME_BLOCK, false, 300);
Casting.addBasinRecipe(<additions:greedycraft-durasteel_block>, null, <liquid:durasteel>, VOLUME_BLOCK, false, 300);
Casting.addBasinRecipe(<additions:greedycraft-aeonsteel_block>, null, <liquid:aeonsteel>, VOLUME_BLOCK, false, 300);
Casting.addBasinRecipe(<additions:greedycraft-chromasteel_block>, null, <liquid:chromasteel>, VOLUME_BLOCK, false, 300);
Casting.addBasinRecipe(<botanicadds:gaiasteel_block>, null, <liquid:gaiasteel>, VOLUME_BLOCK, false, 300);
Casting.addBasinRecipe(<additions:greedycraft-modularium_block>, null, <liquid:modularium>, VOLUME_BLOCK, false, 300);
Casting.addBasinRecipe(<draconicevolution:draconic_block>, null, <liquid:awakened_draconium>, VOLUME_BLOCK, false, 300);
Casting.addBasinRecipe(<gct_ores:chaotic_draconium_block>, null, <liquid:chaotic_draconium>, VOLUME_BLOCK, false, 300);
Casting.addBasinRecipe(<gct_ores:genite_machine_frame>, <thermalexpansion:frame>, <liquid:genite>, 576, false, 100);
Casting.addBasinRecipe(<gct_ores:everite_machine_frame>, <thermalexpansion:frame>, <liquid:everite>, 576, false, 100);
Casting.addBasinRecipe(<gct_ores:balanced_matrix_block>, null, <liquid:balanced_matrix>, VOLUME_BLOCK, false, 300);
Casting.addBasinRecipe(<additions:greedycraft-titanium_block>, null, <liquid:titanium>, VOLUME_BLOCK, false, 300);
Casting.addBasinRecipe(<tiths:block_decurrium>, null, <liquid:decurrium>, VOLUME_BLOCK, false, 300);
Casting.addBasinRecipe(<tiths:block_oraclium>, null, <liquid:oraclium>, VOLUME_BLOCK, false, 300);
Casting.addBasinRecipe(<journey:hellstoneblock>, null, <liquid:bloodcrust>, VOLUME_BLOCK, false, 300);

Casting.addTableRecipe(<abyssalcraft:ethaxiumingot>, <tconstruct:cast_custom>, <liquid:ethaxium>, VOLUME_INGOT, false, 200);
Casting.addTableRecipe(<additions:astral_metal_ingot>, <tconstruct:cast_custom>, <liquid:astral_metal>, VOLUME_INGOT, false, 200);
Casting.addTableRecipe(<additions:cosmilite_ingot>, <tconstruct:cast_custom>, <liquid:cosmilite>, VOLUME_INGOT, false, 200);
Casting.addTableRecipe(<additions:crimsonite_ingot>, <tconstruct:cast_custom>, <liquid:crimsonite>, VOLUME_INGOT, false, 200);
Casting.addTableRecipe(<additions:electronium_ingot>, <tconstruct:cast_custom>, <liquid:electronium>, VOLUME_INGOT, false, 200);
Casting.addTableRecipe(<additions:greedycraft-cryonic_artifact>, <minecraft:emerald>, <liquid:cryotheum>, 10000, true, 200);
Casting.addTableRecipe(<additions:greedycraft-experience_ingot>, <tconstruct:cast_custom>, <liquid:experience>, VOLUME_INGOT, false, 80);
Casting.addTableRecipe(<additions:greedycraft-experience_nugget>, <tconstruct:cast_custom:1>, <liquid:experience>, 16, false, 20);
Casting.addTableRecipe(<additions:greedycraft-pearl_of_knowledge>, <minecraft:emerald>, <liquid:experience>, 944784, true, 600);
Casting.addTableRecipe(<additions:greedycraft-stainless_steel_ball>, <tconstruct:cast_custom:2>, <liquid:stainless_steel>, 30, false, 60);
Casting.addTableRecipe(<additions:netherite_ingot>, <tconstruct:cast_custom>, <liquid:netherite>, VOLUME_INGOT, false, 200);
Casting.addTableRecipe(<additions:netherite_scrap>, <tconstruct:cast_custom>, <liquid:ancient_debris>, 160, false, 200);
Casting.addTableRecipe(<additions:protonium_ingot>, <tconstruct:cast_custom>, <liquid:protonium>, VOLUME_INGOT, false, 200);
Casting.addTableRecipe(<additions:stainless_steel_ingot>, <tconstruct:cast_custom>, <liquid:stainless_steel>, VOLUME_INGOT, false, 200);
Casting.addTableRecipe(<additions:terra_alloy_ingot>, <tconstruct:cast_custom>, <liquid:terra_alloy>, VOLUME_INGOT, false, 200);
Casting.addTableRecipe(<additions:manganese_steel_ingot>, <tconstruct:cast_custom>, <liquid:manganese_steel>, VOLUME_INGOT, false, 200);
Casting.addTableRecipe(<botania:manaresource:14>, <tconstruct:cast_custom>, <liquid:gaia>, VOLUME_INGOT, false, 200);
Casting.addTableRecipe(<candymod:chocolate_bar>, <tconstruct:cast_custom>, <liquid:cosmilite>, VOLUME_INGOT, false, 200);
Casting.addTableRecipe(<defiledlands:ravaging_ingot>, <tconstruct:cast_custom>, <liquid:ravaging>, VOLUME_INGOT, false, 200);
Casting.addTableRecipe(<extrabotany:material:1>, <tconstruct:cast_custom>, <liquid:orichalcos>, VOLUME_INGOT, false, 200);
Casting.addTableRecipe(<harvestcraft:cheeseitem>, null, <liquid:milk>, 20, false, 200);
Casting.addTableRecipe(<harvestcraft:cheeseitem>, null, <liquid:milk>, 200, false);
Casting.addTableRecipe(<minecraft:coal>, <tconstruct:cast_custom:2>, <liquid:coal>, VOLUME_INGOT, false, 200);
Casting.addTableRecipe(<modularmachinery:itemmodularium>, <tconstruct:cast_custom>, <liquid:modularium>, VOLUME_INGOT, false, 200);
Casting.addTableRecipe(<nyx:meteor_ingot>, <tconstruct:cast_custom>, <liquid:meteor>, VOLUME_INGOT, false, 200);
Casting.addTableRecipe(<tcomplement:materials:1>, <tconstruct:cast_custom>, <liquid:scorched>, VOLUME_INGOT, false, 200);
Casting.addTableRecipe(<tconevo:material>, <tconstruct:cast_custom>, <liquid:fusion_matrix>, VOLUME_INGOT, false, 200);
Casting.addTableRecipe(<thaumadditions:adaminite_ingot>, <tconstruct:cast_custom>, <liquid:adaminite>, VOLUME_INGOT, false, 200);
Casting.addTableRecipe(<thaumadditions:mithminite_ingot>, <tconstruct:cast_custom>, <liquid:mithminite>, VOLUME_INGOT, false, 200);
Casting.addTableRecipe(<thaumadditions:mithrillium_ingot>, <tconstruct:cast_custom>, <liquid:mithrillium>, VOLUME_INGOT, false, 200);
Casting.addTableRecipe(<additions:durasteel_ingot>, <tconstruct:cast_custom>, <liquid:durasteel>, VOLUME_INGOT, false, 200);
Casting.addTableRecipe(<additions:aeonsteel_ingot>, <tconstruct:cast_custom>, <liquid:aeonsteel>, VOLUME_INGOT, false, 200);
Casting.addTableRecipe(<additions:chromasteel_ingot>, <tconstruct:cast_custom>, <liquid:chromasteel>, VOLUME_INGOT, false, 200);
Casting.addTableRecipe(<randomthings:ingredient:3>, <tconstruct:cast_custom>, <liquid:spectre>, VOLUME_INGOT, false, 200);
Casting.addTableRecipe(<botanicadds:gaiasteel_ingot>, <tconstruct:cast_custom>, <liquid:gaiasteel>, VOLUME_INGOT, false, 200);
Casting.addTableRecipe(<draconicevolution:draconic_ingot>, <tconstruct:cast_custom>, <liquid:awakened_draconium>, VOLUME_INGOT, false, 200);
Casting.addTableRecipe(<gct_ores:chaotic_draconium_ingot>, <tconstruct:cast_custom>, <liquid:chaotic_draconium>, VOLUME_INGOT, false, 200);
Casting.addTableRecipe(<gct_ores:balanced_matrix_ingot>, <tconstruct:cast_custom>, <liquid:balanced_matrix>, VOLUME_INGOT, false, 200);
Casting.addTableRecipe(<additions:titanium_ingot>, <tconstruct:cast_custom>, <liquid:titanium>, VOLUME_INGOT, false, 200);
Casting.addTableRecipe(<additions:greedycraft-titanium_nugget>, <tconstruct:cast_custom:1>, <liquid:titanium>, VOLUME_INGOT, false, 20);
Casting.addTableRecipe(<thaumcraft:quicksilver>, <tconstruct:cast_custom:2>, <liquid:mercury>, VOLUME_INGOT, false, 20);
Casting.addTableRecipe(<tiths:ingot_decurrium>, <tconstruct:cast_custom>, <liquid:decurrium>, VOLUME_INGOT, false, 200);
Casting.addTableRecipe(<tiths:ingot_oraclium>, <tconstruct:cast_custom>, <liquid:oraclium>, VOLUME_INGOT, false, 200);
Casting.addTableRecipe(<tiths:nugget_decurrium>, <tconstruct:cast_custom:1>, <liquid:decurrium>, VOLUME_NUGGET, false, 20);
Casting.addTableRecipe(<tiths:nugget_oraclium>, <tconstruct:cast_custom:1>, <liquid:oraclium>, VOLUME_NUGGET, false, 20);
Casting.addTableRecipe(<additions:moltenium_ingot>, <tconstruct:cast_custom>, <liquid:moltenium>, VOLUME_INGOT, false, 200);
Casting.addTableRecipe(<gct_mobs:resonated_scrap>, <tconstruct:cast_custom>, <liquid:resonant_debris>, 160, false, 200);
Casting.addTableRecipe(<journey:hellstoneingot>, <tconstruct:cast_custom>, <liquid:bloodcrust>, VOLUME_INGOT, false, 200);
Casting.addTableRecipe(<divinerpg:hellstone_ingot>, <tconstruct:cast_custom>, <liquid:hellstone>, VOLUME_INGOT, false, 200);
Casting.addTableRecipe(<blue_skies:falsite_ingot>, <tconstruct:cast_custom>, <liquid:falsite>, VOLUME_INGOT, false, 200);
Casting.addTableRecipe(<blue_skies:ventium_ingot>, <tconstruct:cast_custom>, <liquid:ventium>, VOLUME_INGOT, false, 200);
Casting.addTableRecipe(<blue_skies:horizonite_ingot>, <tconstruct:cast_custom>, <liquid:horizonite>, VOLUME_INGOT, false, 200);
Casting.addTableRecipe(<endreborn:item_raw_endorium>, <ore:ingotTungsten>, <liquid:enderium>, 72, true, 80);
Casting.addTableRecipe(<abyssalcraft:necronomicon>.withTag({PotEnergy: 5000.0 as float}), <ore:necronomiconOverworld>, <liquid:pe>, 72, true, 72);
Casting.addTableRecipe(<abyssalcraft:necronomicon_cor>.withTag({PotEnergy: 10000.0 as float}), <ore:necronomiconWasteland>, <liquid:pe>, 144, true, 144);
Casting.addTableRecipe(<abyssalcraft:necronomicon_dre>.withTag({PotEnergy: 20000.0 as float}), <ore:necronomiconDreadland>, <liquid:pe>, 288, true, 288);
Casting.addTableRecipe(<abyssalcraft:necronomicon_omt>.withTag({PotEnergy: 40000.0 as float}), <ore:necronomiconOmothol>, <liquid:pe>, 576, true, 576);
Casting.addTableRecipe(<abyssalcraft:abyssalnomicon>.withTag({PotEnergy: 100000.0 as float}), <ore:necronomiconAbyss>, <liquid:pe>, 1440, true, 1440);

Melting.removeRecipe(<liquid:gold>, <minecraft:golden_rail>);
Melting.removeRecipe(<liquid:iron>, <minecraft:activator_rail>);
Melting.removeRecipe(<liquid:iron>, <minecraft:bucket>);
Melting.removeRecipe(<liquid:iron>, <minecraft:detector_rail>);
Melting.removeRecipe(<liquid:iron>, <minecraft:rail>);
Melting.removeRecipe(<liquid:osmium>, <minecraft:rail>);
Melting.removeRecipe(<liquid:meteorite_fluid>, <taiga:obsidiorite_block>);
Melting.removeRecipe(<liquid:bloodcrust>, <divinerpg:hellstone_ingot>);
Melting.removeRecipe(<liquid:titanium>, <tiths:ingot_titanium>);
Melting.removeRecipe(<liquid:titanium>, <tiths:nugget_titanium>);
Melting.removeRecipe(<liquid:titanium>, <tiths:block_titanium>);

Melting.addEntityMelting(<entity:minecraft:cow>, <liquid:milk>);
Melting.addEntityMelting(<entity:minecraft:enderman>, <liquid:ender>);
Melting.addEntityMelting(<entity:minecraft:snowman>, <liquid:water>);
Melting.addEntityMelting(<entity:minecraft:villager_golem>, <liquid:iron>);
Melting.addEntityMelting(<entity:minecraft:zombie_pigman>, <liquid:gold>);

Melting.addRecipe(<liquid:adaminite> * VOLUME_INGOT, <ore:ingotAdaminite>, 1300);
Melting.addRecipe(<liquid:aerotheum> * 100, <ore:dustBlitz>, 200);
Melting.addRecipe(<liquid:aerotheum> * 250, <ore:dustAerotheum>, 200);
Melting.addRecipe(<liquid:ancient_debris> * 160, <ore:gemAncientDebris>, 1320);
Melting.addRecipe(<liquid:ancient_debris> * 320, <ore:oreAncientDebris>, 1320);
Melting.addRecipe(<liquid:astral_metal> * VOLUME_BLOCK, <ore:blockAstralMetal>, 1500);
Melting.addRecipe(<liquid:astral_metal> * VOLUME_INGOT, <ore:ingotAstralMetal>, 1500);
Melting.addRecipe(<liquid:blood> * 200, <ore:listAllmeatraw>, 200);
Melting.addRecipe(<liquid:coal> * VOLUME_INGOT, <ore:coal>, 600);
Melting.addRecipe(<liquid:cosmilite> * VOLUME_BLOCK, <ore:blockCosmilite>, 1500);
Melting.addRecipe(<liquid:cosmilite> * VOLUME_INGOT, <ore:ingotCosmilite>, 1500);
Melting.addRecipe(<liquid:crimsonite> * VOLUME_BLOCK, <ore:blockCrimsonite>, 1200);
Melting.addRecipe(<liquid:crimsonite> * VOLUME_INGOT, <ore:ingotCrimsonite>, 1200);
Melting.addRecipe(<liquid:cryotheum> * 100, <ore:dustBlizz>, 50);
Melting.addRecipe(<liquid:cryotheum> * 250, <ore:dustCryotheum>, 50);
Melting.addRecipe(<liquid:electronium> * VOLUME_BLOCK, <ore:blockElectronium>, 1200);
Melting.addRecipe(<liquid:electronium> * VOLUME_INGOT, <ore:ingotElectronium>, 1200);
Melting.addRecipe(<liquid:ethaxium> * VOLUME_INGOT, <ore:ingotEthaxium>, 1300);
Melting.addRecipe(<liquid:experience> * 11664, <ore:blockCompressedExperience>, 300);
Melting.addRecipe(<liquid:experience> * VOLUME_BLOCK, <ore:blockExperience>, 300);
Melting.addRecipe(<liquid:experience> * VOLUME_INGOT, <ore:ingotExperience>, 300);
Melting.addRecipe(<liquid:experience> * 16, <ore:nuggetExperience>, 300);
Melting.addRecipe(<liquid:experience> * 160, <actuallyadditions:item_solidified_experience>, 300);
Melting.addRecipe(<liquid:experience> * (VOLUME_INGOT * 2), <additions:greedycraft-experience_ore>, 100);
Melting.addRecipe(<liquid:experience> * 944784, <additions:greedycraft-pearl_of_knowledge>, 1200);
Melting.addRecipe(<liquid:fusion_matrix> * VOLUME_BLOCK, <ore:blockFusionMatrix>, 1300);
Melting.addRecipe(<liquid:fusion_matrix> * VOLUME_INGOT, <tconevo:material>, 1300);
Melting.addRecipe(<liquid:gaia> * VOLUME_INGOT, <ore:ingotGaia>, 700);
Melting.addRecipe(<liquid:insanium> * VOLUME_INGOT, <ore:ingotInsanium>, 1400);
Melting.addRecipe(<liquid:iron> * (VOLUME_INGOT * 2), <actuallyadditions:item_misc:20>, 1100);
Melting.addRecipe(<liquid:lava> * 200, <ore:netherrack>, 800);
Melting.addRecipe(<liquid:liquid_chocolate> * VOLUME_BLOCK, <ore:blockChocolate>, 300);
Melting.addRecipe(<liquid:liquid_chocolate> * VOLUME_INGOT, <ore:foodChocolate>, 300);
Melting.addRecipe(<liquid:meteor> * VOLUME_BLOCK, <ore:blockMeteor>, 900);
Melting.addRecipe(<liquid:meteor> * VOLUME_INGOT, <ore:dustMeteor>, 900);
Melting.addRecipe(<liquid:meteor> * VOLUME_INGOT, <ore:ingotMeteor>, 900);
Melting.addRecipe(<liquid:meteor> * VOLUME_INGOT, <ore:shardMeteor>, 900);
Melting.addRecipe(<liquid:mithminite> * VOLUME_INGOT, <ore:ingotMithminite>, 1100);
Melting.addRecipe(<liquid:mithrillium> * VOLUME_INGOT, <ore:ingotMithrillium>, 1500);
Melting.addRecipe(<liquid:modularium> * VOLUME_INGOT, <ore:ingotModularium>, 900);
Melting.addRecipe(<liquid:netherite> * VOLUME_BLOCK, <ore:blockNetherite>, 1500);
Melting.addRecipe(<liquid:netherite> * VOLUME_INGOT, <ore:ingotNetherite>, 1500);
Melting.addRecipe(<liquid:organic_fluid> * 100, <mysticalagriculture:fertilized_essence>, 400);
Melting.addRecipe(<liquid:organic_fluid> * 115, <ore:itemBioblendRich>, 400);
Melting.addRecipe(<liquid:organic_fluid> * 150, <mysticalagriculture:mystical_fertilizer>, 400);
Melting.addRecipe(<liquid:organic_fluid> * 25, <ore:itemBiomass>, 400);
Melting.addRecipe(<liquid:organic_fluid> * 45, <ore:itemBiomassRich>, 400);
Melting.addRecipe(<liquid:organic_fluid> * 90, <ore:itemBioblend>, 400);
Melting.addRecipe(<liquid:orichalcos> * VOLUME_BLOCK, <ore:blockOrichalcos>, 1400);
Melting.addRecipe(<liquid:orichalcos> * VOLUME_INGOT, <ore:ingotOrichalcos>, 1400);
Melting.addRecipe(<liquid:petrotheum> * 100, <ore:dustBasalz>, 900);
Melting.addRecipe(<liquid:petrotheum> * 250, <ore:dustPetrotheum>, 900);
Melting.addRecipe(<liquid:protonium> * VOLUME_BLOCK, <ore:blockProtonium>, 1200);
Melting.addRecipe(<liquid:protonium> * VOLUME_INGOT, <ore:ingotProtonium>, 1200);
Melting.addRecipe(<liquid:pyrotheum> * 100, <ore:dustBlaze>, 1300);
Melting.addRecipe(<liquid:pyrotheum> * 250, <ore:dustPyrotheum>, 1300);
Melting.addRecipe(<liquid:ravaging> * VOLUME_INGOT, <ore:ingotRavaging>, 900);
Melting.addRecipe(<liquid:sakura.food_oil> * 100, <ore:tallow>, 200);
Melting.addRecipe(<liquid:scorched> * VOLUME_INGOT, <ore:ingotBrickScorched>, 900);
Melting.addRecipe(<liquid:scorched> * (VOLUME_INGOT * 2), <ore:slabScorched>, 900);
Melting.addRecipe(<liquid:scorched> * 432, <ore:stairScorched>, 900);
Melting.addRecipe(<liquid:scorched> * (VOLUME_INGOT * 4), <ore:blockScorched>, 900);
Melting.addRecipe(<liquid:stainless_steel> * VOLUME_BLOCK, <ore:blockStainlessSteel>, 1200);
Melting.addRecipe(<liquid:stainless_steel> * VOLUME_INGOT, <ore:ingotStainlessSteel>, 1200);
Melting.addRecipe(<liquid:terra_alloy> * VOLUME_BLOCK, <ore:blockTerraAlloy>, 1500);
Melting.addRecipe(<liquid:terra_alloy> * VOLUME_INGOT, <ore:ingotTerraAlloy>, 1500);
Melting.addRecipe(<liquid:iron> * (VOLUME_INGOT * 2), <sakura:iron_sand>, 534);
Melting.addRecipe(<liquid:manganese_steel> * VOLUME_INGOT, <ore:ingotManganeseSteel>, 734);
Melting.addRecipe(<liquid:manganese_steel> * VOLUME_BLOCK, <ore:blockManganeseSteel>, 734);
Melting.addRecipe(<liquid:durasteel> * VOLUME_INGOT, <ore:ingotDurasteel>, 777);
Melting.addRecipe(<liquid:aeonsteel> * VOLUME_INGOT, <ore:ingotAeonsteel>, 1150);
Melting.addRecipe(<liquid:chromasteel> * VOLUME_INGOT, <ore:ingotChromasteel>, 1337);
Melting.addRecipe(<liquid:durasteel> * VOLUME_BLOCK, <ore:blockDurasteel>, 777);
Melting.addRecipe(<liquid:aeonsteel> * VOLUME_BLOCK, <ore:blockAeonsteel>, 1150);
Melting.addRecipe(<liquid:chromasteel> * VOLUME_BLOCK, <ore:blockChromasteel>, 1337);
Melting.addRecipe(<liquid:spectre> * VOLUME_INGOT, <ore:ingotSpectre>, 1111);
Melting.addRecipe(<liquid:gaiasteel> * VOLUME_INGOT, <ore:ingotGaiasteel>, 1024);
Melting.addRecipe(<liquid:gaiasteel> * VOLUME_BLOCK, <ore:blockGaiasteel>, 1024);
Melting.addRecipe(<liquid:modularium> * VOLUME_BLOCK, <ore:blockModularium>, 900);
Melting.addRecipe(<liquid:awakened_draconium> * VOLUME_INGOT, <ore:ingotDraconiumAwakened>, 775);
Melting.addRecipe(<liquid:awakened_draconium> * VOLUME_BLOCK, <ore:blockDraconiumAwakened>, 921);
Melting.addRecipe(<liquid:awakened_draconium> * VOLUME_INGOT, <ore:dustDraconiumAwakened>, 775);
Melting.addRecipe(<liquid:awakened_draconium> * VOLUME_NUGGET, <ore:nuggetDraconiumAwakened>, 627);
Melting.addRecipe(<liquid:chaotic_draconium> * VOLUME_INGOT, <ore:ingotDraconiumChaotic>, 960);
Melting.addRecipe(<liquid:chaotic_draconium> * VOLUME_BLOCK, <ore:blockDraconiumChaotic>, 1065);
Melting.addRecipe(<liquid:chaotic_draconium> * VOLUME_INGOT, <ore:dustDraconiumChaotic>, 960);
Melting.addRecipe(<liquid:chaotic_draconium> * VOLUME_NUGGET, <ore:nuggetDraconiumChaotic>, 898);
Melting.addRecipe(<liquid:balanced_matrix> * VOLUME_INGOT, <ore:ingotBalancedMatrix>, 1125);
Melting.addRecipe(<liquid:balanced_matrix> * VOLUME_BLOCK, <ore:blockBalancedMatrix>, 1350);
Melting.addRecipe(<liquid:lumixeium> * 100, <ore:dustBligtz>, 800);
Melting.addRecipe(<liquid:lumixeium> * 250, <ore:dustLumixeium>, 800);
Melting.addRecipe(<liquid:noxexeum> * 100, <ore:dustBninz>, 400);
Melting.addRecipe(<liquid:noxexeum> * 250, <ore:dustNoxexeum>, 400);
Melting.addRecipe(<liquid:tonitruium> * 100, <ore:dustBthdz>, 1000);
Melting.addRecipe(<liquid:tonitruium> * 250, <ore:dustTonitruium>, 1000);
Melting.addRecipe(<liquid:naturaeum> * 100, <ore:dustBnatuz>, 500);
Melting.addRecipe(<liquid:naturaeum> * 250, <ore:dustNaturaeum>, 500);
Melting.addRecipe(<liquid:liquidlegend> * 100, <twilightforest:trophy:0>, 800);
Melting.addRecipe(<liquid:liquidlegend> * 100, <twilightforest:trophy:1>, 800);
Melting.addRecipe(<liquid:liquidlegend> * 100, <twilightforest:trophy:2>, 800);
Melting.addRecipe(<liquid:liquidlegend> * 100, <twilightforest:trophy:3>, 800);
Melting.addRecipe(<liquid:liquidlegend> * 100, <twilightforest:trophy:4>, 800);
Melting.addRecipe(<liquid:liquidlegend> * 100, <twilightforest:trophy:5>, 800);
Melting.addRecipe(<liquid:liquidlegend> * 100, <twilightforest:trophy:6>, 800);
Melting.addRecipe(<liquid:liquidlegend> * 100, <twilightforest:trophy:7>, 800);
Melting.addRecipe(<liquid:liquidlegend> * 100, <twilightforest:trophy:8>, 800);
Melting.addRecipe(<liquid:liquidlegend> * 100, <journey:trophysoul>, 800);
Melting.addRecipe(<liquid:liquidlegend> * 100, <journey:trophyblaze>, 800);
Melting.addRecipe(<liquid:liquidlegend> * 100, <journey:trophyeudor>, 800);
Melting.addRecipe(<liquid:liquidlegend> * 100, <journey:trophycor>, 800);
Melting.addRecipe(<liquid:liquidlegend> * 100, <journey:trophyscale>, 800);
Melting.addRecipe(<liquid:liquidlegend> * 100, <journey:trophyroc>, 800);
Melting.addRecipe(<liquid:liquidlegend> * 100, <journey:trophysentry>, 800);
Melting.addRecipe(<liquid:liquidlegend> * 100, <journey:trophylogger>, 800);
Melting.addRecipe(<liquid:liquidlegend> * 100, <journey:trophyterra>, 800);
Melting.addRecipe(<liquid:liquidlegend> * 100, <journey:trophystalk>, 800);
Melting.addRecipe(<liquid:liquidlegend> * 100, <journey:trophynetherbeast>, 800);
Melting.addRecipe(<liquid:liquidlegend> * 100, <journey:trophywitherbeast>, 800);
Melting.addRecipe(<liquid:liquidlegend> * 200, <theaurorian:trophykeeper>, 800);
Melting.addRecipe(<liquid:liquidlegend> * 200, <theaurorian:trophymoonqueen>, 800);
Melting.addRecipe(<liquid:liquidlegend> * 200, <theaurorian:trophyspider>, 800);
Melting.addRecipe(<liquid:liquidlegend> * 75, <divinerpg:ayeraco_statue_blue>, 800);
Melting.addRecipe(<liquid:liquidlegend> * 75, <divinerpg:ayeraco_statue_red>, 800);
Melting.addRecipe(<liquid:liquidlegend> * 75, <divinerpg:ayeraco_statue_yellow>, 800);
Melting.addRecipe(<liquid:liquidlegend> * 75, <divinerpg:ayeraco_statue_green>, 800);
Melting.addRecipe(<liquid:liquidlegend> * 75, <divinerpg:ayeraco_statue_purple>, 800);
Melting.addRecipe(<liquid:liquidlegend> * 75, <divinerpg:densos_statue>, 800);
Melting.addRecipe(<liquid:liquidlegend> * 75, <divinerpg:dramix_statue>, 800);
Melting.addRecipe(<liquid:liquidlegend> * 75, <divinerpg:eternal_archer_statue>, 800);
Melting.addRecipe(<liquid:liquidlegend> * 75, <divinerpg:karot_statue>, 800);
Melting.addRecipe(<liquid:liquidlegend> * 75, <divinerpg:king_of_scorchers_statue>, 800);
Melting.addRecipe(<liquid:liquidlegend> * 75, <divinerpg:parasecta_statue>, 800);
Melting.addRecipe(<liquid:liquidlegend> * 75, <divinerpg:reyvor_statue>, 800);
Melting.addRecipe(<liquid:liquidlegend> * 75, <divinerpg:soul_fiend_statue>, 800);
Melting.addRecipe(<liquid:liquidlegend> * 75, <divinerpg:the_watcher_statue>, 800);
Melting.addRecipe(<liquid:liquidlegend> * 75, <divinerpg:twilight_demon_statue>, 800);
Melting.addRecipe(<liquid:liquidlegend> * 75, <divinerpg:vamacheron_statue>, 800);
Melting.addRecipe(<liquid:liquidlegend> * 75, <divinerpg:termasect_statue>, 800);
Melting.addRecipe(<liquid:liquidlegend> * 75, <divinerpg:sunstorm_statue>, 800);
Melting.addRecipe(<liquid:liquidlegend> * 75, <divinerpg:ancient_entity_statue>, 800);
Melting.addRecipe(<liquid:mercury> * VOLUME_INGOT, <ore:gemMercury>, 300);
Melting.addRecipe(<liquid:mercury> * VOLUME_NUGGET, <ore:nuggetMercury>, 260);
Melting.addRecipe(<liquid:mercury> * VOLUME_INGOT, <ore:quicksilver>, 300);
Melting.addRecipe(<liquid:mercury> * VOLUME_INGOT, <ore:gemQuicksilver>, 300);
Melting.addRecipe(<liquid:mercury> * VOLUME_NUGGET, <ore:nuggetQuicksilver>, 260);
Melting.addRecipe(<liquid:mercury> * VOLUME_INGOT, <ore:ingotMercury>, 300);
Melting.addRecipe(<liquid:mercury> * VOLUME_BLOCK, <ore:blockMercury>, 350);
Melting.addRecipe(<liquid:mercury> * VOLUME_INGOT, <ore:dustMercury>, 300);
Melting.addRecipe(<liquid:mercury> * VOLUME_INGOT, <ore:plateMercury>, 300);
Melting.addRecipe(<liquid:mercury> * 72, <ore:rodMercury>, 280);
Melting.addRecipe(<liquid:mercury> * (VOLUME_INGOT * 4), <ore:gearMercury>, 320);
Melting.addRecipe(<liquid:silicon> * 36, <ore:itemSilicon>, 1280);
Melting.addRecipe(<liquid:decurrium> * VOLUME_NUGGET, <ore:nuggetDecurrium>, 450);
Melting.addRecipe(<liquid:decurrium> * VOLUME_INGOT, <ore:ingotDecurrium>, 600);
Melting.addRecipe(<liquid:decurrium> * VOLUME_BLOCK, <ore:blockDecurrium>, 850);
Melting.addRecipe(<liquid:decurrium> * (VOLUME_INGOT * 4), <ore:gearDecurrium>, 750);
Melting.addRecipe(<liquid:decurrium> * VOLUME_INGOT, <ore:plateDecurrium>, 600);
Melting.addRecipe(<liquid:decurrium> * VOLUME_INGOT, <ore:dustDecurrium>, 600);
Melting.addRecipe(<liquid:oraclium> * VOLUME_NUGGET, <ore:nuggetOraclium>, 450);
Melting.addRecipe(<liquid:oraclium> * VOLUME_INGOT, <ore:ingotOraclium>, 600);
Melting.addRecipe(<liquid:oraclium> * VOLUME_BLOCK, <ore:blockOraclium>, 850);
Melting.addRecipe(<liquid:oraclium> * (VOLUME_INGOT * 4), <ore:gearOraclium>, 750);
Melting.addRecipe(<liquid:oraclium> * VOLUME_INGOT, <ore:plateOraclium>, 600);
Melting.addRecipe(<liquid:oraclium> * VOLUME_INGOT, <ore:dustOraclium>, 600);
Melting.addRecipe(<liquid:bloodcrust> * VOLUME_INGOT, <ore:ingotBloodcrust>, 500);
Melting.addRecipe(<liquid:bloodcrust> * 288, <ore:oreBloodcrust>, 611);
Melting.addRecipe(<liquid:titanium> * VOLUME_INGOT, <ore:ingotTitanium>, 1250);
Melting.addRecipe(<liquid:titanium> * VOLUME_BLOCK, <ore:blockTitanium>, 1980);
Melting.addRecipe(<liquid:titanium> * VOLUME_NUGGET, <ore:nuggetTitanium>, 1020);
Melting.addRecipe(<liquid:resonant_debris> * 160, <ore:gemResonantDebris>, 3540);
Melting.addRecipe(<liquid:resonant_debris> * 320, <ore:oreResonantDebris>, 3540);
Melting.addRecipe(<liquid:resonant_debris> * 160, <gct_mobs:resonate_debris_cracked>, 3540);
Melting.addRecipe(<liquid:gravity_debris> * 160, <ore:gemGravityDebris>, 4430);
Melting.addRecipe(<liquid:gravity_debris> * 320, <ore:oreGravityDebris>, 4430);
Melting.addRecipe(<liquid:falsite> * VOLUME_INGOT, <ore:ingotFalsite>, 780);
Melting.addRecipe(<liquid:horizonite> * VOLUME_INGOT, <ore:ingotHorizonite>, 780);
Melting.addRecipe(<liquid:ventium> * VOLUME_INGOT, <ore:ingotVentium>, 780);
Melting.addRecipe(<liquid:falsite> * VOLUME_BLOCK, <ore:blockFalsite>, 1050);
Melting.addRecipe(<liquid:horizonite> * VOLUME_BLOCK, <ore:blockHorizonite>, 1050);
Melting.addRecipe(<liquid:ventium> * VOLUME_BLOCK, <ore:blockVentium>, 1050);
Melting.addRecipe(<liquid:darkice> * 36, <betterendforge:darkice_cluster>, 900);
Melting.addRecipe(<liquid:unshapable_liquid> * 1000, <additions:bloody-unshapable_matter>, 200);
Melting.addRecipe(<liquid:pruified_liquid> * 13, <additions:greedycraft-pruified_matter>, 1250);
Melting.addRecipe(<liquid:fracturite> * 432, <twilightforest:mazebreaker_pickaxe>, 2500);

Fuel.registerFuel(<liquid:infernium> * 1, 600);
Fuel.registerFuel(<liquid:cosmilite> * 1, 2400);
Fuel.registerFuel(<liquid:finallium> * 1, 3600);
Fuel.registerFuel(<liquid:protonium> * 1, 100);
Fuel.registerFuel(<liquid:electronium> * 1, 200);
Fuel.registerFuel(<liquid:experience> * 1, 200);
Fuel.registerFuel(<liquid:ancient_debris> * 1, 200);
Fuel.registerFuel(<liquid:scorched> * 1, 200);
Fuel.registerFuel(<liquid:orichalcos> * 1, 200);
Fuel.registerFuel(<liquid:gaia> * 1, 200);
Fuel.registerFuel(<liquid:ravaging> * 1, 200);
Fuel.registerFuel(<liquid:mithminite> * 1, 200);
Fuel.registerFuel(<liquid:mithrillium> * 1, 200);
Fuel.registerFuel(<liquid:adaminite> * 1, 200);
Fuel.registerFuel(<liquid:netherite> * 1, 200);
Fuel.registerFuel(<liquid:terra_alloy> * 1, 200);
Fuel.registerFuel(<liquid:fierymetal> * 1, 200);
Fuel.registerFuel(<liquid:insanium> * 1, 200);
Fuel.registerFuel(<liquid:fusion_matrix> * 1, 200);
Fuel.registerFuel(<liquid:meteor> * 1, 200);
Fuel.registerFuel(<liquid:crimsonite> * 1, 200);
Fuel.registerFuel(<liquid:reditrite> * 1, 200);
Fuel.registerFuel(<liquid:lavarite> * 1, 200);
Fuel.registerFuel(<liquid:plasmarite> * 1, 200);
Fuel.registerFuel(<liquid:bnightium> * 1, 200);
Fuel.registerFuel(<liquid:fire_alloy> * 1, 200);
Fuel.registerFuel(<liquid:everite> * 1, 200);
Fuel.registerFuel(<liquid:balanced_matrix> * 1, 200);
Fuel.registerFuel(<liquid:moltenium> * 1, 1600);
Fuel.registerFuel(<liquid:thermallite> * 1, 2400);
Fuel.registerFuel(<liquid:photonium> * 1, 1200);
Fuel.registerFuel(<liquid:methane> * 1, 350);
Fuel.registerFuel(<liquid:undead> * 1, 200);
Fuel.registerFuel(<liquid:apollonium> * 1, 200);
Fuel.registerFuel(<liquid:flamium> * 1, 200);

HighOven.addFuel(<ore:ingotInfernium>, 600, 32);
HighOven.addFuel(<ore:blockInfernium>, 6000, 48);
HighOven.addFuel(<tinker_io:solidfuel>, 1800, 10);

var betwnite = HighOven.newMixRecipe(<liquid:betwnite> * 144, <liquid:liquidtrichromadentium> * 288, 2680);
betwnite.addOxidizer(<additions:greedycraft-valonitedruse>, 100);
betwnite.addReducer(<additions:greedycraft-gemundyingember>, 100);
betwnite.addPurifier(<ore:dustSwampsteel>, 100);
betwnite.register();

val removeToolPartCrafting as IItemStack[] = [
    <moretcon:blshovelblade>.withTag({Material: "moretcon.ferroherb"}),
    <moretcon:blpickhead>.withTag({Material: "moretcon.ferroherb"}),
    <plustic:pipe_piece>.withTag({Material: "moretcon.ferroherb"}),
    <tcomplement:chisel_head>.withTag({Material: "moretcon.ferroherb"}),
    <tconstruct:shard>.withTag({Material: "moretcon.ferroherb"}),
    <tconstruct:sharpening_kit>.withTag({Material: "moretcon.ferroherb"}),
    <tconstruct:pick_head>.withTag({Material: "moretcon.ferroherb"}),
    <tconstruct:shovel_head>.withTag({Material: "moretcon.ferroherb"}),
    <tconstruct:knife_blade>.withTag({Material: "moretcon.ferroherb"}),
    <conarm:helmet_core>.withTag({Material: "moretcon.ferroherb"}),
    <conarm:armor_trim>.withTag({Material: "moretcon.ferroherb"}),
    <conarm:armor_plate>.withTag({Material: "moretcon.ferroherb"}),
    <conarm:chest_core>.withTag({Material: "moretcon.ferroherb"}),
    <conarm:leggings_core>.withTag({Material: "moretcon.ferroherb"}),
    <conarm:boots_core>.withTag({Material: "moretcon.ferroherb"}),
    <conarm:polishing_kit>.withTag({Material: "moretcon.ferroherb"}),
    <moretcon:blaxehead>.withTag({Material: "moretcon.ferroherb"}),
    <moretcon:blswordblade>.withTag({Material: "moretcon.ferroherb"}),
    <tconstruct:axe_head>.withTag({Material: "moretcon.ferroherb"}),
    <tconstruct:broad_axe_head>.withTag({Material: "moretcon.ferroherb"}),
    <tconstruct:sword_blade>.withTag({Material: "moretcon.ferroherb"}),
    <tconstruct:large_sword_blade>.withTag({Material: "moretcon.ferroherb"}),
    <tconstruct:hammer_head>.withTag({Material: "moretcon.ferroherb"}),
    <tconstruct:excavator_head>.withTag({Material: "moretcon.ferroherb"}),
    <tconstruct:kama_head>.withTag({Material: "moretcon.ferroherb"}),
    <tconstruct:scythe_head>.withTag({Material: "moretcon.ferroherb"}),
    <tconstruct:pan_head>.withTag({Material: "moretcon.ferroherb"}),
    <tconstruct:sign_head>.withTag({Material: "moretcon.ferroherb"}),
    <tconstruct:tool_rod>.withTag({Material: "moretcon.ferroherb"}),
    <tconstruct:tough_tool_rod>.withTag({Material: "moretcon.ferroherb"}),
    <tconstruct:binding>.withTag({Material: "moretcon.ferroherb"}),
    <tconstruct:tough_binding>.withTag({Material: "moretcon.ferroherb"}),
    <tconstruct:wide_guard>.withTag({Material: "moretcon.ferroherb"}),
    <tconstruct:hand_guard>.withTag({Material: "moretcon.ferroherb"}),
    <tconstruct:cross_guard>.withTag({Material: "moretcon.ferroherb"}),
    <tconstruct:large_plate>.withTag({Material: "moretcon.ferroherb"}),
    <tconstruct:arrow_head>.withTag({Material: "moretcon.ferroherb"}),
    <tconstruct:arrow_shaft>.withTag({Material: "moretcon.ferroherb"}),
    <moretcon:blshovelblade>.withTag({Material: "moretcon.enderexamite"}),
    <moretcon:blpickhead>.withTag({Material: "moretcon.enderexamite"}),
    <plustic:pipe_piece>.withTag({Material: "moretcon.enderexamite"}),
    <tcomplement:chisel_head>.withTag({Material: "moretcon.enderexamite"}),
    <tconstruct:shard>.withTag({Material: "moretcon.enderexamite"}),
    <tconstruct:sharpening_kit>.withTag({Material: "moretcon.enderexamite"}),
    <tconstruct:pick_head>.withTag({Material: "moretcon.enderexamite"}),
    <tconstruct:shovel_head>.withTag({Material: "moretcon.enderexamite"}),
    <tconstruct:knife_blade>.withTag({Material: "moretcon.enderexamite"}),
    <conarm:helmet_core>.withTag({Material: "moretcon.enderexamite"}),
    <conarm:armor_trim>.withTag({Material: "moretcon.enderexamite"}),
    <conarm:armor_plate>.withTag({Material: "moretcon.enderexamite"}),
    <conarm:chest_core>.withTag({Material: "moretcon.enderexamite"}),
    <conarm:leggings_core>.withTag({Material: "moretcon.enderexamite"}),
    <conarm:boots_core>.withTag({Material: "moretcon.enderexamite"}),
    <conarm:polishing_kit>.withTag({Material: "moretcon.enderexamite"}),
    <moretcon:blaxehead>.withTag({Material: "moretcon.enderexamite"}),
    <moretcon:blswordblade>.withTag({Material: "moretcon.enderexamite"}),
    <tconstruct:axe_head>.withTag({Material: "moretcon.enderexamite"}),
    <tconstruct:broad_axe_head>.withTag({Material: "moretcon.enderexamite"}),
    <tconstruct:sword_blade>.withTag({Material: "moretcon.enderexamite"}),
    <tconstruct:large_sword_blade>.withTag({Material: "moretcon.enderexamite"}),
    <tconstruct:hammer_head>.withTag({Material: "moretcon.enderexamite"}),
    <tconstruct:excavator_head>.withTag({Material: "moretcon.enderexamite"}),
    <tconstruct:kama_head>.withTag({Material: "moretcon.enderexamite"}),
    <tconstruct:scythe_head>.withTag({Material: "moretcon.enderexamite"}),
    <tconstruct:pan_head>.withTag({Material: "moretcon.enderexamite"}),
    <tconstruct:sign_head>.withTag({Material: "moretcon.enderexamite"}),
    <tconstruct:tool_rod>.withTag({Material: "moretcon.enderexamite"}),
    <tconstruct:tough_tool_rod>.withTag({Material: "moretcon.enderexamite"}),
    <tconstruct:binding>.withTag({Material: "moretcon.enderexamite"}),
    <tconstruct:tough_binding>.withTag({Material: "moretcon.enderexamite"}),
    <tconstruct:wide_guard>.withTag({Material: "moretcon.enderexamite"}),
    <tconstruct:hand_guard>.withTag({Material: "moretcon.enderexamite"}),
    <tconstruct:cross_guard>.withTag({Material: "moretcon.enderexamite"}),
    <tconstruct:large_plate>.withTag({Material: "moretcon.enderexamite"}),
    <tconstruct:arrow_head>.withTag({Material: "moretcon.enderexamite"}),
    <tconstruct:arrow_shaft>.withTag({Material: "moretcon.enderexamite"})
];
for removeItem in removeToolPartCrafting {
    Casting.removeTableRecipe(removeItem);
}
