/*
Copyright Bob Bartsch, 2023

This code is governed by the
Creative Commons Attribution–NonCommercial License
https://creativecommons.org/licenses/by-nc/3.0/

(Meaning: credit me if you modify and/or redistribute
this code. Also, you may not sell this code.)
*/

#loader contenttweaker
import mods.contenttweaker.CreativeTab;
import mods.contenttweaker.VanillaFactory;
import mods.contenttweaker.Fluid;
import mods.contenttweaker.Color;
import mods.contenttweaker.Item;
import mods.contenttweaker.Block;


val zsTab = VanillaFactory.createCreativeTab("moar_reactor_components", <item:contenttweaker:hydrocarbon_mod>);
zsTab.register();


/* -=-=-=-=-=-=-=-=- Extra Reactor Components -=-=-=-=-=-=-=-=- */
var zsBlock = VanillaFactory.createBlock("water_mod", <blockmaterial:rock>);
zsBlock.setBlockHardness(2.0);
zsBlock.setBlockResistance(5.0);
zsBlock.setToolClass("pickaxe");
zsBlock.setToolLevel(0);
zsBlock.setBlockSoundType(<soundtype:stone>);
zsBlock.setSlipperiness(0.7);
zsBlock.creativeTab = <creativetab:moar_reactor_components>;
zsBlock.register();

zsBlock = VanillaFactory.createBlock("pu_schmeared_be_mod", <blockmaterial:rock>);
zsBlock.setBlockHardness(2.0);
zsBlock.setBlockResistance(5.0);
zsBlock.setToolClass("pickaxe");
zsBlock.setToolLevel(0);
zsBlock.setBlockSoundType(<soundtype:stone>);
zsBlock.setSlipperiness(0.7);
zsBlock.creativeTab = <creativetab:moar_reactor_components>;
zsBlock.register();

zsBlock = VanillaFactory.createBlock("hydrocarbon_mod", <blockmaterial:rock>);
zsBlock.setBlockHardness(2.0);
zsBlock.setBlockResistance(5.0);
zsBlock.setToolClass("pickaxe");
zsBlock.setToolLevel(0);
zsBlock.setBlockSoundType(<soundtype:stone>);
zsBlock.setSlipperiness(0.7);
zsBlock.creativeTab = <creativetab:moar_reactor_components>;
zsBlock.register();

/* -=-=-=- QMD additions -=-=-=- */
if(loadedMods has "qmd"){
zsBlock = VanillaFactory.createBlock("yttriumhydride_mod", <blockmaterial:rock>);
zsBlock.setBlockHardness(2.0);
zsBlock.setBlockResistance(5.0);
zsBlock.setToolClass("pickaxe");
zsBlock.setToolLevel(0);
zsBlock.setBlockSoundType(<soundtype:stone>);
zsBlock.setSlipperiness(0.7);
zsBlock.creativeTab = <creativetab:moar_reactor_components>;
zsBlock.register();

var temp = VanillaFactory.createItem("yttrium_hydride");
temp.creativeTab = <creativetab:moar_reactor_components>;
temp.register();
}
var temp = VanillaFactory.createItem("gadolinium_dust");
temp.creativeTab = <creativetab:moar_reactor_components>;
temp.register();


zsBlock = VanillaFactory.createBlock("cf_neutron_multiplier", <blockmaterial:rock>);
zsBlock.setBlockHardness(2.0);
zsBlock.setBlockResistance(5.0);
zsBlock.setToolClass("pickaxe");
zsBlock.setToolLevel(0);
zsBlock.setBlockSoundType(<soundtype:stone>);
zsBlock.setSlipperiness(0.7);
zsBlock.creativeTab = <creativetab:moar_reactor_components>;
zsBlock.register();

zsBlock = VanillaFactory.createBlock("gold_reflector", <blockmaterial:rock>);
zsBlock.setBlockHardness(2.0);
zsBlock.setBlockResistance(5.0);
zsBlock.setToolClass("pickaxe");
zsBlock.setToolLevel(0);
zsBlock.setBlockSoundType(<soundtype:stone>);
zsBlock.setSlipperiness(0.7);
zsBlock.creativeTab = <creativetab:moar_reactor_components>;
zsBlock.register();
