/*
Copyright Bob Bartsch, 2021

This code is governed by the
Creative Commons Attribution–NonCommercial License
https://creativecommons.org/licenses/by-nc/3.0/

(Meaning: credit me if you modify and/or redistribute
this code. Also, you may not sell this code.)
*/

#loader contenttweaker
import mods.contenttweaker.VanillaFactory;
import mods.contenttweaker.Fluid;
import mods.contenttweaker.Color;
import mods.contenttweaker.Item;
import mods.contenttweaker.Block;




/* -=-=-=-=-=-=-=-=- NC Fluids -=-=-=-=-=-=-=-=- */
var nakNames = ["steel","ferroboron","tough_alloy","limno2","mgb2","boron_arsenide","boron_nitride","rhodochrosite","zirconium","hard_carbon","extreme_alloy","thermoconducting_alloy","zircaloy","sic_sic_cmc","hsla","smore","liquid_oxygen","corium","tnt","sea_lantern","bone","milk","lava","sponge","bismuth","sic","magma_slime","brick","silicon","glowshroom"] as string[];
var colorsNamed = ["676767","636363","171221","616161","151109","aaaa95","86a87f","bc5769","ecedd2","174f5e","712a3c","6e7c59","ccccca","757167","8a8cac","6b430d","6ebbd7","5a5a5a","ff3300","00ccff","fffae6","ffffff","ff8000","dada69","b3b3b3","ac7339","cc3300","b30000","999999","e6e600"] as string[];

for i,name in nakNames{
	var zsFluid = VanillaFactory.createFluid(name~"_nak", Color.fromHex(colorsNamed[i]));
	zsFluid.setDensity(4000);
	zsFluid.setViscosity(1000);
	zsFluid.setTemperature(300);
	zsFluid.register();
	zsFluid = VanillaFactory.createFluid(name~"_nak_hot", Color.fromHex(colorsNamed[i]));
	zsFluid.setDensity(4000);
	zsFluid.setViscosity(1000);
	zsFluid.setTemperature(700);
	zsFluid.register();
	if(i==3||i==4||i==7||(i>=10 && i<=14)||(i==19)||(i==25)||
	   ((i==23) && !(loadedMods has "tconstruct"))||
	   ((i==24) && !(loadedMods has "jaopca"))||
	   ((i==20||i==21||i==26) && !(loadedMods has "tconstruct"))){
	zsFluid = VanillaFactory.createFluid(name, Color.fromHex(colorsNamed[i]));
	zsFluid.setDensity(4000);
	zsFluid.setViscosity(1000);
	zsFluid.setTemperature(400);
	zsFluid.register();
	}
}
if(!(loadedMods has "qmd") && !(loadedMods has "jaopca")){
	var zsFluid = VanillaFactory.createFluid("silicon", Color.fromHex("999999"));
	zsFluid.setDensity(4000);
	zsFluid.setViscosity(1000);
	zsFluid.setTemperature(400);
	zsFluid.register();
}
if(!(loadedMods has "tconstruct")){
	var zsFluid = VanillaFactory.createFluid(nakNames[27], Color.fromHex(colorsNamed[26]));
	zsFluid.setDensity(4000);
	zsFluid.setViscosity(1000);
	zsFluid.setTemperature(400);
	zsFluid.register();
}


/* -=-=-=-=-=-=-=-=- COFH Fluids -=-=-=-=-=-=-=-=- */
if(loadedMods has "thermalfoundation"){
nakNames = ["pyro","aero","petro","nickel","platinum","iridium","signalum","lumium","mana_dust","mithril","invar","constantan","bronze","electrum"] as string[];
colorsNamed = ["e68123","fadf18","524951","cccf91","6ca4c6","afafc3","b0380f","ebe881","9b71be","88bbd0","858b88","958f6b","cc8435","d9d26d"] as string[];

for i,name in nakNames{
	var zsFluid = VanillaFactory.createFluid(name~"_nak", Color.fromHex(colorsNamed[i]));
	zsFluid.setDensity(4000);
	zsFluid.setViscosity(1000);
	zsFluid.setTemperature(300);
	zsFluid.register();
	zsFluid = VanillaFactory.createFluid(name~"_nak_hot", Color.fromHex(colorsNamed[i]));
	zsFluid.setDensity(4000);
	zsFluid.setViscosity(1000);
	zsFluid.setTemperature(700);
	zsFluid.register();
	if(!(loadedMods has "tconstruct")){
		if(i==6||i==7||i==10||i==11){
		zsFluid = VanillaFactory.createFluid(name, Color.fromHex(colorsNamed[i]));
		zsFluid.setDensity(4000);
		zsFluid.setViscosity(1000);
		zsFluid.setTemperature(400);
		zsFluid.register();
		}
		if(!(loadedMods has "metallurgy")){
		if(i==12||i==13){
		zsFluid = VanillaFactory.createFluid(name, Color.fromHex(colorsNamed[i]));
		zsFluid.setDensity(4000);
		zsFluid.setViscosity(1000);
		zsFluid.setTemperature(400);
		zsFluid.register();
		}
		}
	}
}
if(!(loadedMods has "jaopca")&&!(loadedMods has "metallurgy")){
	var zsFluid = VanillaFactory.createFluid(nakNames[9], Color.fromHex(colorsNamed[9]));
	zsFluid.setDensity(4000);
	zsFluid.setViscosity(1000);
	zsFluid.setTemperature(400);
	zsFluid.register();
}
}

/* -=-=-=-=-=-=-=-=- Redstone Arsenal Fluids -=-=-=-=-=-=-=-=- */
if(loadedMods has "redstonearsenal"){
	nakNames = ["fluxed_electrum","flux_crystal"] as string[];
	colorsNamed = ["ffcc66","ff5c33"] as string[];
	for i,name in nakNames{
		var zsFluid = VanillaFactory.createFluid(name~"_nak", Color.fromHex(colorsNamed[i]));
		zsFluid.setDensity(4000);
		zsFluid.setViscosity(1000);
		zsFluid.setTemperature(300);
		zsFluid.register();
		zsFluid = VanillaFactory.createFluid(name~"_nak_hot", Color.fromHex(colorsNamed[i]));
		zsFluid.setDensity(4000);
		zsFluid.setViscosity(1000);
		zsFluid.setTemperature(700);
		zsFluid.register();
		zsFluid = VanillaFactory.createFluid(name, Color.fromHex(colorsNamed[i]));
		zsFluid.setDensity(4000);
		zsFluid.setViscosity(1000);
		zsFluid.setTemperature(400);
		zsFluid.register();
	}
}


/* -=-=-=-=-=-=-=-=- AE2 & LAE2 Fluids -=-=-=-=-=-=-=-=- */
if(loadedMods has "appliedenergistics2"){
nakNames = ["certus","fluix"] as string[];
colorsNamed = ["66c2ff","944dff","5c0099"] as string[];

for i,name in nakNames{
	var zsFluid = VanillaFactory.createFluid(name~"_nak", Color.fromHex(colorsNamed[i]));
	zsFluid.setDensity(4000);
	zsFluid.setViscosity(1000);
	zsFluid.setTemperature(300);
	zsFluid.register();
	zsFluid = VanillaFactory.createFluid(name~"_nak_hot", Color.fromHex(colorsNamed[i]));
	zsFluid.setDensity(4000);
	zsFluid.setViscosity(1000);
	zsFluid.setTemperature(700);
	zsFluid.register();
	zsFluid = VanillaFactory.createFluid(name, Color.fromHex(colorsNamed[i]));
	zsFluid.setDensity(4000);
	zsFluid.setViscosity(1000);
	zsFluid.setTemperature(400);
	zsFluid.register();
}
}
if(loadedMods has "threng"){
	var zsFluid = VanillaFactory.createFluid("fluix_steel_nak", Color.fromHex(colorsNamed[2]));
	zsFluid.setDensity(4000);
	zsFluid.setViscosity(1000);
	zsFluid.setTemperature(300);
	zsFluid.register();
	zsFluid = VanillaFactory.createFluid("fluix_steel_nak_hot", Color.fromHex(colorsNamed[2]));
	zsFluid.setDensity(4000);
	zsFluid.setViscosity(1000);
	zsFluid.setTemperature(700);
	zsFluid.register();
	zsFluid = VanillaFactory.createFluid("fluix_steel", Color.fromHex(colorsNamed[2]));
	zsFluid.setDensity(4000);
	zsFluid.setViscosity(1000);
	zsFluid.setTemperature(400);
	zsFluid.register();
}

if(!(loadedMods has "trinity")){
	var zsFluid = VanillaFactory.createFluid("tnt", Color.fromHex("ff3300"));
	zsFluid.setDensity(1654);
	zsFluid.setViscosity(1000);
	zsFluid.setTemperature(400);
	zsFluid.register();
}
