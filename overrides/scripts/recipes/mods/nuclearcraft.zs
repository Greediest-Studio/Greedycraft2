/*
 * This script is created for the GreedyCraft modpack by TCreopargh.
 * You may NOT use this script in any other publicly distributed modpack without my permission.
 */

#priority 800

import crafttweaker.item.IItemStack;
import crafttweaker.data.IData;
import crafttweaker.item.IIngredient;
import crafttweaker.liquid.ILiquidStack;
import crafttweaker.oredict.IOreDictEntry;

import mods.nuclearcraft.Melter;
import mods.nuclearcraft.ChemicalReactor;
import mods.nuclearcraft.Supercooler;
import mods.nuclearcraft.Electrolyzer;
import mods.nuclearcraft.Pressurizer;
import mods.nuclearcraft.RadiationScrubber;
import mods.nuclearcraft.Radiation;
import mods.nuclearcraft.Crystallizer;
import mods.nuclearcraft.Separator;
import mods.nuclearcraft.Enricher;
import mods.nuclearcraft.Centrifuge;
import mods.nuclearcraft.SaltMixer;
import mods.nuclearcraft.IngotFormer;
import mods.nuclearcraft.Registration;
import mods.tconstruct.Alloy;

var NaCl as IItemStack = <additions:sodium_chloride>;
var KCl as IItemStack = <additions:potassium_chloride>;
var RbCl as IItemStack = <additions:rubidium_chloride>;
var CsCl as IItemStack = <additions:cesium_chloride>;
var PtCl4 as IItemStack = <additions:platinum_chloride>;
var CaCl2 as IItemStack = <additions:calcium_chloride>;
var SrCl2 as IItemStack = <additions:strontium_chloride>;
var BaCl2 as IItemStack = <additions:barium_chloride>;

function CreateElementMixer(inputIngot as IIngredient, inputDust as IIngredient, output1 as IItemStack, output2 as IItemStack, liquid as ILiquidStack, liquid1 as ILiquidStack, liquid2 as ILiquidStack, out1 as int, out2 as int) as void {
    var isotopeNum as int = out1 + out2;
    Separator.addRecipe(inputIngot * isotopeNum, output1 * out1, output2 * out2, isotopeNum as float / 2.0f);
    Separator.addRecipe(inputDust * isotopeNum, output1 * out1, output2 * out2, isotopeNum as float / 2.0f);
    Centrifuge.addRecipe(liquid * (16 * isotopeNum), liquid1 * (16 * out1), liquid2 * (16 * out2), null, null, null, null);
    Alloy.addRecipe(liquid * isotopeNum, [liquid1 * out1, liquid2 * out2]);
}

Alloy.addRecipe(<liquid:uranium> * 10, [<liquid:uranium_238> * 9, <liquid:uranium_235> * 1]);

CreateElementMixer(<ore:ingotNeptunium>, <ore:dustNeptunium>, <nuclearcraft:neptunium:5>, <nuclearcraft:neptunium>, <liquid:neptunium>, <liquid:neptunium_237>, <liquid:neptunium_236>, 5, 1);
CreateElementMixer(<ore:ingotPlutonium>, <ore:dustPlutonium>, <nuclearcraft:plutonium:15>, <nuclearcraft:plutonium:5>, <liquid:plutonium>, <liquid:plutonium_242>, <liquid:plutonium_239>, 5, 1);

Melter.removeRecipeWithInput(<nuclearcraft:gem_dust:10>);
Melter.removeRecipeWithInput(<nuclearcraft:gem:6>);

var removeMb as int[] = [16, 144, 1296];
for mb in removeMb {
    Melter.removeRecipeWithOutput(<liquid:hydrogen> * mb);
    Melter.removeRecipeWithOutput(<liquid:helium> * mb);
    Melter.removeRecipeWithOutput(<liquid:nitrogen> * mb);
    Melter.removeRecipeWithOutput(<liquid:oxygen> * mb);
    Melter.removeRecipeWithOutput(<liquid:fluorine> * mb);
    Melter.removeRecipeWithOutput(<liquid:neon> * mb);
    Melter.removeRecipeWithOutput(<liquid:argon> * mb);
    Melter.removeRecipeWithOutput(<liquid:krypton> * mb);
    Melter.removeRecipeWithOutput(<liquid:xenon> * mb);
    Melter.removeRecipeWithOutput(<liquid:radon> * mb);
}

Melter.addRecipe(<ore:ingotHydrogen>, <liquid:hydrogen> * 46080);
Melter.addRecipe(<ore:dustHydrogen>, <liquid:hydrogen> * 46080);
Melter.addRecipe(<ore:nuggetHydrogen>, <liquid:hydrogen> * 5120);
Melter.addRecipe(<ore:blockHydrogen>, <liquid:hydrogen> * 414720);
Melter.addRecipe(<ore:ingotHelium>, <liquid:helium> * 46080);
Melter.addRecipe(<ore:dustHelium>, <liquid:helium> * 46080);
Melter.addRecipe(<ore:nuggetHelium>, <liquid:helium> * 5120);
Melter.addRecipe(<ore:blockHelium>, <liquid:helium> * 414720);
Melter.addRecipe(<ore:ingotNitrogen>, <liquid:nitrogen> * 46080);
Melter.addRecipe(<ore:dustNitrogen>, <liquid:nitrogen> * 46080);
Melter.addRecipe(<ore:nuggetNitrogen>, <liquid:nitrogen> * 5120);
Melter.addRecipe(<ore:blockNitrogen>, <liquid:nitrogen> * 414720);
Melter.addRecipe(<ore:ingotOxygen>, <liquid:oxygen> * 46080);
Melter.addRecipe(<ore:dustOxygen>, <liquid:oxygen> * 46080);
Melter.addRecipe(<ore:nuggetOxygen>, <liquid:oxygen> * 5120);
Melter.addRecipe(<ore:blockOxygen>, <liquid:oxygen> * 414720);
Melter.addRecipe(<ore:ingotFluorine>, <liquid:fluorine> * 46080);
Melter.addRecipe(<ore:dustFluorine>, <liquid:fluorine> * 46080);
Melter.addRecipe(<ore:nuggetFluorine>, <liquid:fluorine> * 5120);
Melter.addRecipe(<ore:blockFluorine>, <liquid:fluorine> * 414720);
Melter.addRecipe(<ore:ingotNeon>, <liquid:neon> * 46080);
Melter.addRecipe(<ore:dustNeon>, <liquid:neon> * 46080);
Melter.addRecipe(<ore:nuggetNeon>, <liquid:neon> * 5120);
Melter.addRecipe(<ore:blockNeon>, <liquid:neon> * 414720);
Melter.addRecipe(<ore:ingotArgon>, <liquid:argon> * 46080);
Melter.addRecipe(<ore:dustArgon>, <liquid:argon> * 46080);
Melter.addRecipe(<ore:nuggetArgon>, <liquid:argon> * 5120);
Melter.addRecipe(<ore:blockArgon>, <liquid:argon> * 414720);
Melter.addRecipe(<ore:ingotKrypton>, <liquid:krypton> * 46080);
Melter.addRecipe(<ore:dustKrypton>, <liquid:krypton> * 46080);
Melter.addRecipe(<ore:nuggetKrypton>, <liquid:krypton> * 5120);
Melter.addRecipe(<ore:blockKrypton>, <liquid:krypton> * 414720);
Melter.addRecipe(<ore:ingotXenon>, <liquid:xenon> * 46080);
Melter.addRecipe(<ore:dustXenon>, <liquid:xenon> * 46080);
Melter.addRecipe(<ore:nuggetXenon>, <liquid:xenon> * 5120);
Melter.addRecipe(<ore:blockXenon>, <liquid:xenon> * 414720);
Melter.addRecipe(<ore:ingotRadon>, <liquid:radon> * 46080);
Melter.addRecipe(<ore:dustRadon>, <liquid:radon> * 46080);
Melter.addRecipe(<ore:nuggetRadon>, <liquid:radon> * 5120);
Melter.addRecipe(<ore:blockRadon>, <liquid:radon> * 414720);
Melter.addRecipe(<ore:ingotChlorine>, <liquid:liquidchlorine> * 46080);
Melter.addRecipe(<ore:dustChlorine>, <liquid:liquidchlorine> * 46080);
Melter.addRecipe(<ore:nuggetChlorine>, <liquid:liquidchlorine> * 5120);
Melter.addRecipe(<ore:blockChlorine>, <liquid:liquidchlorine> * 414720);

Melter.addRecipe(<ore:dustSulfur>, <liquid:burningsulfurflow> * 144, 1.0, 1.0, 0.0);
Melter.addRecipe(<ore:ingotSulfur>, <liquid:burningsulfurflow> * 144, 1.0, 1.0, 0.0);
Melter.addRecipe(NaCl, <liquid:sodium_chloride> * 666);
Melter.addRecipe(KCl, <liquid:potassium_chloride> * 666);
Melter.addRecipe(RbCl, <liquid:rubidium_chloride> * 666);
Melter.addRecipe(CsCl, <liquid:cesium_chloride> * 666);
Melter.addRecipe(PtCl4, <liquid:platinum_chloride> * 666);
Melter.addRecipe(CaCl2, <liquid:calcium_chloride> * 666);
Melter.addRecipe(SrCl2, <liquid:strontium_chloride> * 666);
Melter.addRecipe(BaCl2, <liquid:barium_chloride> * 666);
Melter.addRecipe(<ore:materialMethane>, <liquid:methane> * 200);
/*Melter.addRecipe(<ore:gemAncientDebris>, <liquid:ancient_debris> * 160);
Melter.addRecipe(<ore:oreAncientDebris>, <liquid:ancient_debris> * 320);
Melter.addRecipe(<ore:gemResonantDebris>, <liquid:resonant_debris> * 160);
Melter.addRecipe(<ore:oreResonantDebris>, <liquid:resonant_debris> * 320);
Melter.addRecipe(<gct_mobs:resonate_debris_cracked>, <liquid:resonant_debris> * 160);
Melter.addRecipe(<ore:gemGravityDebris>, <liquid:gravity_debris> * 160);
Melter.addRecipe(<ore:oreGravityDebris>, <liquid:gravity_debris> * 320);
Melter.addRecipe(<ore:stairScorched>, <liquid:scorched> * 432);
Melter.addRecipe(<ore:blockScorched>, <liquid:scorched> * 576);
Melter.addRecipe(<ore:slabScorched>, <liquid:scorched> * 288);
Melter.addRecipe(<ore:ingotBrickScorched>, <liquid:scorched> * 144);
Melter.addRecipe(<ore:itemSilicon>, <liquid:silicon> * 36);
Melter.addRecipe(<twilightforest:mazebreaker_pickaxe>, <liquid:fracturite> * 432);*/
/*
var meltingStack as ILiquidStack[string] = {
    "Arsenic" : <liquid:arsenic>,
    "Everite" : <liquid:everite>,
    "Genite" : <liquid:genite>,
    "TerraAlloy" : <liquid:terra_alloy>,
    "SkyAlloy" : <liquid:sky_alloy>,
    "FireAlloy" : <liquid:fire_alloy>,
    "IceAlloy" : <liquid:ice_alloy>,
    "DraconiumAwakened" : <liquid:awakened_draconium>,
    "DraconiumChaotic" : <liquid:chaotic_draconium>,
    "DraconiumRuled" : <liquid:ruled_draconium>,
    "WitheriumRelifed" : <liquid:relifed_witherium>,
    "WitheriumStormy" : <liquid:stormy_witherium>,
    "WitheriumEquipment" : <liquid:equipment_witherium>,
    "OrderedMetal" : <liquid:ordered_metal>,
    "Densite" : <liquid:densite>,
    "Reditrite" : <liquid:reditrite>,
    "FusionMatrix" : <liquid:fusion_matrix>,
    "Modularium" : <liquid:modularium>,
    "StainlessSteel" : <liquid:stainless_steel>,
    "ManganeseSteel" : <liquid:manganese_steel>,
    "ShadowBar" : <liquid:shadow_bar>,
    "Hellstone" : <liquid:hellstone>,
    "LavaSolid" : <liquid:lava_solid>,
    "GlowingSignalum" : <liquid:glowing_signalum>,
    "TwilightCrystal" : <liquid:twilight_crystal>,
    "Hellcrust" : <liquid:hellcrust>,
    "Aurorianite" : <liquid:aurorianite>,
    "Apocalypsium" : <liquid:apocalypsium>,
    "VoidEssence" : <liquid:void_essence>,
    "BlackholeAlloy" : <liquid:blackhole_alloy>,
    "CreativeAlloy" : <liquid:creative_alloy>,
    "GhostMetal" : <liquid:ghost_metal>,
    "EldritchSteel" : <liquid:eldritch_steel>,
    "BotanicalAwakened" : <liquid:botanical_awakened>,
    "ClockAlloy" : <liquid:clock_alloy>,
    "TwilitAlloy" : <liquid:twilit_alloy>,
    "MistAlloy" : <liquid:mist_alloy>,
    "SharpenAlloy" : <liquid:sharpen_alloy>,
    "KillerAlloy" : <liquid:killer_alloy>,
    "CurseAlloy" : <liquid:curse_alloy>,
    "Silicon" : <liquid:silicon>,
    "EndestSteel" : <liquid:endest_steel>,
    "RoseGold" : <liquid:rose_gold>
};

for liquid in meltingStack {
    CreateMeltingRecipe(liquid, meltingStack[liquid] as ILiquidStack);
    IngotFormer.addRecipe(meltingStack[liquid] * 144, oreDict.get("ingot" ~ liquid).firstItem);
}
*/
SaltMixer.removeRecipeWithInput(<liquid:arsenic> * 1332, <liquid:nak> * 144);

SaltMixer.addRecipe(<liquid:arsenic> * 288, <liquid:nak> * 144, <liquid:arsenic_nak> * 144);
SaltMixer.addRecipe(<liquid:hydrogen_fluoride> * 250, <liquid:water> * 250, <liquid:hydrofluoric_acid> * 250);
SaltMixer.addRecipe(<liquid:liquidhydrogenchloride> * 250, <liquid:water> * 250, <liquid:hydrochloric_acid> * 250);
SaltMixer.addRecipe(<liquid:cryotheum> * 250, <liquid:liquid_helium> * 1000, <liquid:hecryo_liquid> * 1000);
SaltMixer.addRecipe(<liquid:nitric_acid> * 250, <liquid:hydrofluoric_acid> * 750, <liquid:aqua_fluoride> * 1000);
SaltMixer.addRecipe(<liquid:orichalcos> * 72, <liquid:mana> * 20, <liquid:photonium> * 288);

ChemicalReactor.removeRecipeWithInput(<liquid:boron> * 72, <liquid:arsenic> * 333);
ChemicalReactor.removeRecipeWithInput(<liquid:liquidhydrogen> * 250, <liquid:fluorine> * 250);

ChemicalReactor.addRecipe(<liquid:hydrogen> * 250, <liquid:liquidchlorine> * 250, <liquid:liquidhydrogenchloride> * 500, null);
ChemicalReactor.addRecipe(<liquid:hydrogen> * 250, <liquid:fluorine> * 250, <liquid:hydrogen_fluoride> * 500, null);
ChemicalReactor.addRecipe(<liquid:boron> * 72, <liquid:arsenic> * 72, <liquid:bas> * 333, null);
ChemicalReactor.addRecipe(<liquid:burningsulfurflow> * 36, <liquid:oxygen> * 250, <liquid:sulfur_dioxide> * 250, null);
ChemicalReactor.addRecipe(<liquid:ammonia> * 400, <liquid:oxygen> * 500, <liquid:nitrogen_oxide> * 400, <liquid:water> * 600);
ChemicalReactor.addRecipe(<liquid:nitrogen_oxide> * 500, <liquid:oxygen> * 250, <liquid:nitrogen_dioxide> * 500, null);
ChemicalReactor.addRecipe(<liquid:nitrogen_dioxide> * 750, <liquid:water> * 250, <liquid:nitric_acid> * 500, <liquid:nitrogen_oxide> * 250);
ChemicalReactor.addRecipe(<liquid:methane> * 250, <liquid:fluorine> * 250, <liquid:fluoromethane> * 250, <liquid:hydrogen_fluoride> * 250);
ChemicalReactor.addRecipe(<liquid:methane> * 250, <liquid:liquidchlorine> * 250, <liquid:chloromethane> * 250, <liquid:liquidhydrogenchloride> * 250);
ChemicalReactor.addRecipe(<liquid:chloromethane> * 250, <liquid:liquidchlorine> * 250, <liquid:dichloromethane> * 250, <liquid:liquidhydrogenchloride> * 250);
ChemicalReactor.addRecipe(<liquid:dichloromethane> * 250, <liquid:liquidchlorine> * 250, <liquid:trichloromethane> * 250, <liquid:liquidhydrogenchloride> * 250);
ChemicalReactor.addRecipe(<liquid:trichloromethane> * 250, <liquid:liquidchlorine> * 250, <liquid:carbon_tetrachloride> * 250, <liquid:liquidhydrogenchloride> * 250);
ChemicalReactor.addRecipe(<liquid:rich_brine> * 1000, <liquid:liquidchlorine> * 500, <liquid:poor_brine> * 750, <liquid:halogen_brine> * 250);
ChemicalReactor.addRecipe(<liquid:iodine_solution> * 1000, <liquid:carbon_tetrachloride> * 200, <liquid:water> * 1000, <liquid:iodine_carbon_tetrachloride_solution> * 200);
ChemicalReactor.addRecipe(<liquid:halogen_brine> * 100, <liquid:sulfur_dioxide> * 100, <liquid:bromine_gas> * 800, <liquid:iodine_solution> * 100);
ChemicalReactor.addRecipe(<liquid:platinum> * 72, <liquid:liquidchlorine> * 1000, <liquid:platinum_chloride> * 333, null);
ChemicalReactor.addRecipe(<liquid:platinum_chloride> * 333, <liquid:hydrochloric_acid> * 1000, <liquid:chloroplatinic_acid_solution> * 333, null);
ChemicalReactor.addRecipe(<liquid:chloroplatinic_acid_solution> * 333, <liquid:sodium_hydroxide_solution> * 666, <liquid:sodium_chloroplatinate_solution> * 333, null);
ChemicalReactor.addRecipe(<liquid:calcium_hydroxide_solution> * 333, <liquid:hydrochloric_acid> * 1000, <liquid:calcium_chloride_solution> * 333, null);
ChemicalReactor.addRecipe(<liquid:strontium_sulfide_solution> * 333, <liquid:hydrochloric_acid> * 1000, <liquid:strontium_chloride_solution> * 333, <liquid:hydrogen_sulfide> * 500);
ChemicalReactor.addRecipe(<liquid:barium_sulfide_solution> * 333, <liquid:hydrochloric_acid> * 1000, <liquid:barium_chloride_solution> * 333, <liquid:hydrogen_sulfide> * 500);
ChemicalReactor.addRecipe(<liquid:hydrogen_sulfide> * 250, <liquid:oxygen> * 375, <liquid:water> * 250, <liquid:sulfur_dioxide> * 250);

Crystallizer.addRecipe(<liquid:iodine_carbon_tetrachloride_solution> * 200, <jaopca:dust.iodine>);
Crystallizer.addRecipe(<liquid:chloroplatinic_acid_solution> * 666, <additions:chloroplatinic_acid>);
Crystallizer.addRecipe(<liquid:sodium_chloroplatinate_solution> * 666, <additions:sodium_chloroplatinate>);
Crystallizer.addRecipe(<liquid:calcium_hydroxide_solution> * 666, <additions:calcium_hydroxide>);
Crystallizer.addRecipe(<liquid:strontium_sulfide_solution> * 666, <additions:strontium_sulfide>);
Crystallizer.addRecipe(<liquid:barium_sulfide_solution> * 666, <additions:barium_sulfide>);
Crystallizer.addRecipe(<liquid:calcium_chloride_solution> * 666, CaCl2);
Crystallizer.addRecipe(<liquid:strontium_chloride_solution> * 666, SrCl2);
Crystallizer.addRecipe(<liquid:barium_chloride_solution> * 666, BaCl2);

Enricher.addRecipe(<ore:dustIodine>, <liquid:carbon_tetrachloride> * 200, <liquid:iodine_carbon_tetrachloride_solution> * 200);
Enricher.addRecipe(<ore:ingotIodine>, <liquid:carbon_tetrachloride> * 200, <liquid:iodine_carbon_tetrachloride_solution> * 200);
Enricher.addRecipe(<ore:dustChloroplatinicAcid>, <liquid:water> * 1000, <liquid:chloroplatinic_acid_solution> * 666);
Enricher.addRecipe(<ore:dustSodiumChloroplatinate>, <liquid:water> * 1000, <liquid:sodium_chloroplatinate_solution> * 666);
Enricher.addRecipe(<ore:dustCalciumOxide>, <liquid:water> * 1500, <liquid:calcium_hydroxide_solution> * 666);
Enricher.addRecipe(<ore:dustCalciumHydroxide>, <liquid:water> * 1000, <liquid:calcium_hydroxide_solution> * 666);
Enricher.addRecipe(<ore:dustCalciumChloride>, <liquid:water> * 1000, <liquid:calcium_chloride_solution> * 666);
Enricher.addRecipe(<ore:dustStrontiumChloride>, <liquid:water> * 1000, <liquid:strontium_chloride_solution> * 666);
Enricher.addRecipe(<ore:dustBariumChloride>, <liquid:water> * 1000, <liquid:barium_chloride_solution> * 666);
Enricher.addRecipe(<ore:dustStrontiumSulfide>, <liquid:water> * 1000, <liquid:strontium_sulfide_solution> * 666);
Enricher.addRecipe(<ore:dustBariumSulfide>, <liquid:water> * 1000, <liquid:barium_sulfide_solution> * 666);
Enricher.addRecipe(<ore:dustCryotheum>, <liquid:liquid_helium> * 1000, <liquid:hecryo_liquid> * 1000);

Electrolyzer.addRecipe(<liquid:brine> * 1000, <liquid:sodium_hydroxide_solution> * 666, <liquid:hydrogen> * 500, <liquid:liquidchlorine> * 500, null, 1.0d, 1.0d, 0.0d);
Electrolyzer.addRecipe(<liquid:sodium_chloride> * 333, <liquid:sodium> * 72, <liquid:liquidchlorine> * 250, null, null);
Electrolyzer.addRecipe(<liquid:potassium_chloride> * 333, <liquid:potassium> * 72, <liquid:liquidchlorine> * 250, null, null, 1.5d, 2.0d);
Electrolyzer.addRecipe(<liquid:rubidium_chloride> * 333, <liquid:rubidium> * 72, <liquid:liquidchlorine> * 250, null, null, 5.0d, 15.0d);
Electrolyzer.addRecipe(<liquid:cesium_chloride> * 333, <liquid:caesium> * 72, <liquid:liquidchlorine> * 250, null, null, 7.0d, 20.0d);
Electrolyzer.addRecipe(<liquid:platinum_chloride> * 333, <liquid:platinum> * 72, <liquid:liquidchlorine> * 1000, null, null);
Electrolyzer.addRecipe(<liquid:hydrochloric_acid> * 500, <liquid:hydrogen> * 250, <liquid:liquidchlorine> * 250, null, null);
Electrolyzer.addRecipe(<liquid:calcium_chloride> * 333, <liquid:calcium> * 72, <liquid:liquidchlorine> * 500, null, null, 1.5d, 2.0d);
Electrolyzer.addRecipe(<liquid:strontium_chloride> * 333, <liquid:strontium> * 72, <liquid:liquidchlorine> * 500, null, null, 3.0d, 6.0d);
Electrolyzer.addRecipe(<liquid:barium_chloride> * 333, <liquid:barium> * 72, <liquid:liquidchlorine> * 500, null, null, 4.5d, 10.0d);

Centrifuge.removeRecipeWithInput(<liquid:arsenic_nak> * 144);

Centrifuge.addRecipe(<liquid:arsenic_nak> * 144, <liquid:arsenic> * 288, <liquid:nak> * 144, null, null, null, null);
Centrifuge.addRecipe(<liquid:mixed_hydrocarbon> * 1000, <liquid:methane> * 500, <liquid:ethene> * 250, <liquid:ethylene> * 250, null, null, null);

Supercooler.addRecipe(<liquid:bromine_gas> * 8000, <liquid:bromine> * 25, 0.9d, 1.0d, 0.0d);
Supercooler.addRecipe(<liquid:hydrogen> * 8000, <liquid:liquid_hydrogen> * 25, 1.0d, 1.0d, 0.0d);
Supercooler.addRecipe(<liquid:nitrogen> * 8000, <liquid:liquid_nitrogen> * 25, 1.0d, 1.0d, 0.0d);
Supercooler.addRecipe(<liquid:oxygen> * 8000, <liquid:liquid_oxygen> * 25, 1.0d, 1.0d, 0.0d);
Supercooler.addRecipe(<liquid:fluorine> * 8000, <liquid:liquid_fluorine> * 25, 1.0d, 1.0d, 0.0d);
Supercooler.addRecipe(<liquid:neon> * 8000, <liquid:liquid_neon> * 25, 1.0d, 1.0d, 0.0d);
Supercooler.addRecipe(<liquid:liquidchlorine> * 8000, <liquid:liquid_chlorine> * 25, 1.0d, 1.0d, 0.0d);
Supercooler.addRecipe(<liquid:argon> * 8000, <liquid:liquid_argon> * 25, 1.0d, 1.0d, 0.0d);
Supercooler.addRecipe(<liquid:krypton> * 8000, <liquid:liquid_krypton> * 25, 1.0d, 1.0d, 0.0d);
Supercooler.addRecipe(<liquid:xenon> * 8000, <liquid:liquid_xenon> * 25, 1.0d, 1.0d, 0.0d);
Supercooler.addRecipe(<liquid:radon> * 8000, <liquid:liquid_radon> * 25, 1.0d, 1.0d, 0.000004d);

Separator.addRecipe(<ore:dustSodiumChloroplatinate>, PtCl4, NaCl * 2);
Separator.addRecipe(<ore:dustPotassiumChloroplatinate>, PtCl4, KCl * 2);
Separator.addRecipe(<ore:dustRubidiumChloroplatinate>, PtCl4, RbCl * 2);
Separator.addRecipe(<ore:dustCesiumChloroplatinate>, PtCl4, CsCl * 2);

IngotFormer.removeRecipeWithOutput(<additions:hydrogen_ingot>);
IngotFormer.removeRecipeWithOutput(<additions:helium_ingot>);
IngotFormer.removeRecipeWithOutput(<additions:nitrogen_ingot>);
IngotFormer.removeRecipeWithOutput(<additions:oxygen_ingot>);
IngotFormer.removeRecipeWithOutput(<additions:fluorine_ingot>);
IngotFormer.removeRecipeWithOutput(<additions:neon_ingot>);
IngotFormer.removeRecipeWithOutput(<additions:argon_ingot>);
IngotFormer.removeRecipeWithOutput(<additions:krypton_ingot>);
IngotFormer.removeRecipeWithOutput(<additions:xenon_ingot>);
IngotFormer.removeRecipeWithOutput(<additions:radon_ingot>);

Radiation.setMaterialRadiationLevel("Technetium", 0.000000000985d);
Radiation.setMaterialRadiationLevel("Promethium", 0.064d);
Radiation.setMaterialRadiationLevel("Astatine", 1.28d);
Radiation.setMaterialRadiationLevel("Radon", 0.000032d);
Radiation.setMaterialRadiationLevel("Francium", 0.144d);
Radiation.setMaterialRadiationLevel("Actinium", 0.00054d);
Radiation.setMaterialRadiationLevel("Protactinium", 1.4d);
Radiation.setMaterialRadiationLevel("Neptunium", 0.00000025d);
Radiation.setMaterialRadiationLevel("Americium", 0.00086d);
Radiation.setMaterialRadiationLevel("Curium", 0.00027d);
Radiation.setMaterialRadiationLevel("Berkelium", 0.00095d);
Radiation.setMaterialRadiationLevel("Californium", 0.004d);
Radiation.setMaterialRadiationLevel("Einsteinium", 0.006d);
Radiation.setMaterialRadiationLevel("Fermium", 0.0085d);
Radiation.setMaterialRadiationLevel("Mendelevium", 0.009d);
Radiation.setMaterialRadiationLevel("Nobelium", 0.015d);
Radiation.setMaterialRadiationLevel("Lawrencium", 0.02d);
Radiation.setMaterialRadiationLevel("Rutherfordium", 0.032d);
Radiation.setMaterialRadiationLevel("Dubnium", 0.048d);
Radiation.setMaterialRadiationLevel("Seaborgium", 0.06d);

Radiation.setMaterialRadiationLevel("Oganesson", 0.64d);
