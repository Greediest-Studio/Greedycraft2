/*
Copyright Bob Bartsch, 2021

This code is governed by the
Creative Commons Attribution–NonCommercial License
https://creativecommons.org/licenses/by-nc/3.0/

(Meaning: credit me if you modify and/or redistribute
this code. Also, you may not sell this code.)
*/


// imports
#loader contenttweaker
import mods.contenttweaker.CreativeTab;
import mods.contenttweaker.VanillaFactory;
import mods.contenttweaker.Item;
import mods.contenttweaker.Fluid;
import mods.contenttweaker.Color;
import mods.contenttweaker.Block;



val zsTab = VanillaFactory.createCreativeTab("moar_fuels", <item:nuclearcraft:fuel_californium:3>);
zsTab.register();



// isotopes generation
val IsoNames= [["californium53","californium53carbide","californium53oxide","californium53nitride","californium53zirconium"],["californium54","californium54carbide","californium54oxide","californium54nitride","californium54zirconium"],["einsteinium54","einsteinium54carbide","einsteinium54oxide","einsteinium54nitride","einsteinium54zirconium"],["einsteinium55","einsteinium55carbide","einsteinium55oxide","einsteinium55nitride","einsteinium55zirconium"],["fermium57","fermium57carbide","fermium57oxide","fermium57nitride","fermium57zirconium"]] as string[][];
for i,array in IsoNames{
	for item in array{
		var temp = VanillaFactory.createItem(item);
		temp.creativeTab = <creativetab:moar_fuels>;
		temp.register();
	}
}

// fuels generation
var FuelNames= ["californium_fuel","californium_fuel_carbide","californium_fuel_triso","californium_fuel_oxide","californium_fuel_nitride","californium_fuel_zirconium","einsteinium_fuel","einsteinium_fuel_carbide","einsteinium_fuel_triso","einsteinium_fuel_oxide","einsteinium_fuel_nitride","einsteinium_fuel_zirconium","fermium_fuel","fermium_fuel_carbide","fermium_fuel_triso","fermium_fuel_oxide","fermium_fuel_nitride","fermium_fuel_zirconium","hcalifornium_fuel","hcalifornium_fuel_carbide","hcalifornium_fuel_triso","hcalifornium_fuel_oxide","hcalifornium_fuel_nitride","hcalifornium_fuel_zirconium","heinsteinium_fuel","heinsteinium_fuel_carbide","heinsteinium_fuel_triso","heinsteinium_fuel_oxide","heinsteinium_fuel_nitride","heinsteinium_fuel_zirconium","rplutonium_fuel","rplutonium_fuel_carbide","rplutonium_fuel_triso","rplutonium_fuel_oxide","rplutonium_fuel_nitride","rplutonium_fuel_zirconium","ramericium_fuel","ramericium_fuel_carbide","ramericium_fuel_triso","ramericium_fuel_oxide","ramericium_fuel_nitride","ramericium_fuel_zirconium","rcalifornium_fuel","rcalifornium_fuel_carbide","rcalifornium_fuel_triso","rcalifornium_fuel_oxide","rcalifornium_fuel_nitride","rcalifornium_fuel_zirconium"] as string[];
for item in FuelNames{
	var temp = VanillaFactory.createItem(item);
	temp.creativeTab = <creativetab:moar_fuels>;
	temp.register();
}

FuelNames=["dcalifornium_fuel_triso","dcalifornium_fuel_oxide","dcalifornium_fuel_nitride","dcalifornium_fuel_zirconium","deinsteinium_fuel_triso","deinsteinium_fuel_oxide","deinsteinium_fuel_nitride","deinsteinium_fuel_zirconium","dfermium_fuel_triso","dfermium_fuel_oxide","dfermium_fuel_nitride","dfermium_fuel_zirconium","dhcalifornium_fuel_triso","dhcalifornium_fuel_oxide","dhcalifornium_fuel_nitride","dhcalifornium_fuel_zirconium","dheinsteinium_fuel_triso","dheinsteinium_fuel_oxide","dheinsteinium_fuel_nitride","dheinsteinium_fuel_zirconium","drplutonium_fuel_triso","drplutonium_fuel_oxide","drplutonium_fuel_nitride","drplutonium_fuel_zirconium","dramericium_fuel_triso","dramericium_fuel_oxide","dramericium_fuel_nitride","dramericium_fuel_zirconium","drcalifornium_fuel_triso","drcalifornium_fuel_oxide","drcalifornium_fuel_nitride","drcalifornium_fuel_zirconium","curium_244","curium_250"];
for item in FuelNames{
	var temp = VanillaFactory.createItem(item);
	temp.creativeTab = <creativetab:moar_fuels>;
	temp.register();
}


FuelNames=["cbc","cbcf"];
val fuelEnds = ["_tr","_ox","_ni","_za"] as string[];

for iso in FuelNames{
	//items
	var temp = VanillaFactory.createItem(iso);
	temp.creativeTab = <creativetab:moar_fuels>;
	temp.register();
	temp = VanillaFactory.createItem(iso~"_c");
	temp.creativeTab = <creativetab:moar_fuels>;
	temp.register();
	for ender in fuelEnds{
		temp = VanillaFactory.createItem(iso~ender);
		temp.creativeTab = <creativetab:moar_fuels>;
		temp.register();
		temp = VanillaFactory.createItem("d_"~iso~ender);
		temp.creativeTab = <creativetab:moar_fuels>;
		temp.register();
	}
}


//liquid fuels & isotopes
var liquidsNamed= ["californium_253","californium_254","einsteinium_254","einsteinium_255","fermium_257","curium_244"] as string[];
var colorsNamed= ["4A000B","4A000B","001A4F","001A4F","4F004A","800080","800080","AAAAAA","382B0A","4A000B"] as string[];

for i,name in liquidsNamed{
	var zsFluid = VanillaFactory.createFluid(name, Color.fromHex(colorsNamed[i]));
	zsFluid.setDensity(4000);
	zsFluid.setViscosity(1000);
	zsFluid.setTemperature(400);
	zsFluid.register();
}

liquidsNamed = ["lecf_253","hecf_253","lee_254","hee_254","mix_257","cbc","cbcf","rep_238","rea_241","rec_250"] as string[];
for i,name in liquidsNamed{
	var zsFluid = VanillaFactory.createFluid(name, Color.fromHex(colorsNamed[i]));
	zsFluid.setDensity(4000);
	zsFluid.setViscosity(1000);
	zsFluid.setTemperature(400);
	zsFluid.register();
	zsFluid = VanillaFactory.createFluid(name~"_fluoride", Color.fromHex(colorsNamed[i]));
	zsFluid.setDensity(4000);
	zsFluid.setViscosity(1000);
	zsFluid.setTemperature(400);
	zsFluid.register();
	zsFluid = VanillaFactory.createFluid(name~"_fluoride_flibe", Color.fromHex(colorsNamed[i]));
	zsFluid.setDensity(4000);
	zsFluid.setViscosity(1000);
	zsFluid.setTemperature(400);
	zsFluid.register();

	zsFluid = VanillaFactory.createFluid("depleted_"~name, Color.fromHex(colorsNamed[i]));
	zsFluid.setDensity(4000);
	zsFluid.setViscosity(1000);
	zsFluid.setTemperature(400);
	zsFluid.register();
	zsFluid = VanillaFactory.createFluid("depleted_"~name~"_fluoride", Color.fromHex(colorsNamed[i]));
	zsFluid.setDensity(4000);
	zsFluid.setViscosity(1000);
	zsFluid.setTemperature(400);
	zsFluid.register();
	zsFluid = VanillaFactory.createFluid("depleted_"~name~"_fluoride_flibe", Color.fromHex(colorsNamed[i]));
	zsFluid.setDensity(4000);
	zsFluid.setViscosity(1000);
	zsFluid.setTemperature(400);
	zsFluid.register();
}




//RTG & CANDU stuff
val itemNames=["gemgermanium","si_ge","uranium_oxide","pre_candu","candu","thorium_oxide","dcandu","pre_aneel","aneel","daneel"] as string[];
for item in itemNames{
	var temp = VanillaFactory.createItem(item);
	temp.creativeTab = <creativetab:moar_fuels>;
	temp.register();
}
var rtgNames = ["rtg_sr","rtg_sr_done","rtg_ru","rtg_ru_done","rtg_cs","rtg_cs_done","rtg_pm","rtg_pm_done","rtg_eu","rtg_eu_done","rtg_po","rtg_po_done","rtg_ra","rtg_ra_done","rtg_pu","rtg_pu_done","rtg_am","rtg_am_done","rtg_cf","rtg_cf_done"] as string[];
for item in rtgNames{
	var zsBlock = VanillaFactory.createBlock(item, <blockmaterial:rock>);
	zsBlock.setBlockHardness(2.0);
	zsBlock.setBlockResistance(5.0);
	zsBlock.setToolClass("pickaxe");
	zsBlock.setToolLevel(0);
	zsBlock.setBlockSoundType(<soundtype:stone>);
	zsBlock.creativeTab = <creativetab:moar_fuels>;
	zsBlock.register();
}



// Crazy High Enrichment Stuff
val enrich= ["me","vhe","xe","se","ue","wg","ip"] as string[];
//val enrich= ["xe","ue","ip"] as string[];
val isos= ["u_233","u_235","n_236","p_239","p_241","a_242","cm_243","cm_245","cm_247","b_248","cf_249","cf_251","cf_253","e_254"] as string[];

colorsNamed= ["008000","008000","009999","AAAAAA","AAAAAA","382B0A","800080","800080","800080","86592D","4A000B","4A000B","4A000B","001A4F"] as string[];

for enr in enrich{
	for i,iso in isos{
	//items
	var temp = VanillaFactory.createItem(enr~iso);
	temp.creativeTab = <creativetab:moar_fuels>;
	temp.register();
	temp = VanillaFactory.createItem(enr~iso~"_c");
	temp.creativeTab = <creativetab:moar_fuels>;
	temp.register();
	for ender in fuelEnds{
		temp = VanillaFactory.createItem(enr~iso~ender);
		temp.creativeTab = <creativetab:moar_fuels>;
		temp.register();
		temp = VanillaFactory.createItem("d_"~enr~iso~ender);
		temp.creativeTab = <creativetab:moar_fuels>;
		temp.register();
	}

	//fluids
	var zsFluid = VanillaFactory.createFluid(enr~iso, Color.fromHex(colorsNamed[i]));
	zsFluid.setDensity(4000);
	zsFluid.setViscosity(1000);
	zsFluid.setTemperature(400);
	zsFluid.register();
	zsFluid = VanillaFactory.createFluid(enr~iso~"_fluoride", Color.fromHex(colorsNamed[i]));
	zsFluid.setDensity(4000);
	zsFluid.setViscosity(1000);
	zsFluid.setTemperature(400);
	zsFluid.register();
	zsFluid = VanillaFactory.createFluid(enr~iso~"_fluoride_flibe", Color.fromHex(colorsNamed[i]));
	zsFluid.setDensity(4000);
	zsFluid.setViscosity(1000);
	zsFluid.setTemperature(400);
	zsFluid.register();

	zsFluid = VanillaFactory.createFluid("depleted_"~enr~iso, Color.fromHex(colorsNamed[i]));
	zsFluid.setDensity(4000);
	zsFluid.setViscosity(1000);
	zsFluid.setTemperature(400);
	zsFluid.register();
	zsFluid = VanillaFactory.createFluid("depleted_"~enr~iso~"_fluoride", Color.fromHex(colorsNamed[i]));
	zsFluid.setDensity(4000);
	zsFluid.setViscosity(1000);
	zsFluid.setTemperature(400);
	zsFluid.register();
	zsFluid = VanillaFactory.createFluid("depleted_"~enr~iso~"_fluoride_flibe", Color.fromHex(colorsNamed[i]));
	zsFluid.setDensity(4000);
	zsFluid.setViscosity(1000);
	zsFluid.setTemperature(400);
	zsFluid.register();
	}
}







//special QMD additions
if(loadedMods has "qmd"){
	val IsoNames2= [["thorium229","thorium229carbide","thorium229oxide","thorium229nitride","thorium229zirconium"],["mendelevium58","mendelevium58carbide","mendelevium58oxide","mendelevium58nitride","mendelevium58zirconium"],["flerovium98","flerovium98carbide","flerovium98oxide","flerovium98nitride","flerovium98zirconium"],["darmstadtium294","darmstadtium294carbide","darmstadtium294oxide","darmstadtium294nitride","darmstadtium294zirconium"]] as string[][];
	for i,array in IsoNames2{
		for item in array{
			var temp = VanillaFactory.createItem(item);
			temp.creativeTab = <creativetab:moar_fuels>;
			temp.register();
		}
	}
	FuelNames= ["protactinium_fuel","protactinium_fuel_carbide","protactinium_fuel_triso","protactinium_fuel_oxide","protactinium_fuel_nitride","protactinium_fuel_zirconium","hprotactinium_fuel","hprotactinium_fuel_carbide","hprotactinium_fuel_triso","hprotactinium_fuel_oxide","hprotactinium_fuel_nitride","hprotactinium_fuel_zirconium","mendelevium_fuel","mendelevium_fuel_carbide","mendelevium_fuel_triso","mendelevium_fuel_oxide","mendelevium_fuel_nitride","mendelevium_fuel_zirconium","flerovium_fuel","flerovium_fuel_carbide","flerovium_fuel_triso","flerovium_fuel_oxide","flerovium_fuel_nitride","flerovium_fuel_zirconium","darmstadtium_fuel","darmstadtium_fuel_carbide","darmstadtium_fuel_triso","darmstadtium_fuel_oxide","darmstadtium_fuel_nitride","darmstadtium_fuel_zirconium","ubu_fuel","ubu_fuel_carbide","ubu_fuel_triso","ubu_fuel_oxide","ubu_fuel_nitride","ubu_fuel_zirconium"] as string[];
	for item in FuelNames{
		var temp = VanillaFactory.createItem(item);
		temp.creativeTab = <creativetab:moar_fuels>;
		temp.register();
	}
	FuelNames= ["dprotactinium_fuel_triso","dprotactinium_fuel_oxide","dprotactinium_fuel_nitride","dprotactinium_fuel_zirconium","dhprotactinium_fuel_triso","dhprotactinium_fuel_oxide","dhprotactinium_fuel_nitride","dhprotactinium_fuel_zirconium","dmendelevium_fuel_triso","dmendelevium_fuel_oxide","dmendelevium_fuel_nitride","dmendelevium_fuel_zirconium","dflerovium_fuel_triso","dflerovium_fuel_oxide","dflerovium_fuel_nitride","dflerovium_fuel_zirconium","ddarmstadtium_fuel_triso","ddarmstadtium_fuel_oxide","ddarmstadtium_fuel_nitride","ddarmstadtium_fuel_zirconium","dubu_fuel_triso","dubu_fuel_oxide","dubu_fuel_nitride","dubu_fuel_zirconium","uranium_232"/*,"th_pellet_slow","th_pellet_fast","pa_pellet_slow","pa_pellet_fast"*/] as string[];
	for item in FuelNames{
		var temp = VanillaFactory.createItem(item);
		temp.creativeTab = <creativetab:moar_fuels>;
		temp.register();
	}


	FuelNames=["pbu","luf"];

	for iso in FuelNames{
		//items
		var temp = VanillaFactory.createItem(iso);
		temp.creativeTab = <creativetab:moar_fuels>;
		temp.register();
		temp = VanillaFactory.createItem(iso~"_c");
		temp.creativeTab = <creativetab:moar_fuels>;
		temp.register();
		for ender in fuelEnds{
			temp = VanillaFactory.createItem(iso~ender);
			temp.creativeTab = <creativetab:moar_fuels>;
			temp.register();
			temp = VanillaFactory.createItem("d_"~iso~ender);
			temp.creativeTab = <creativetab:moar_fuels>;
			temp.register();
		}
	}

	var temp = VanillaFactory.createItem("mysterymix");
	temp.creativeTab = <creativetab:moar_fuels>;
	temp.register();
	temp = VanillaFactory.createItem("actinium");
	temp.creativeTab = <creativetab:moar_fuels>;
	temp.register();
	temp = VanillaFactory.createItem("purethorium229");
	temp.creativeTab = <creativetab:moar_fuels>;
	temp.register();


//liquid fuels & isotopes
var liquidsNamed= ["uranium_234"] as string[];

val colorsNamed= ["008000","ff8080","00b33c","8B4000","BBA100","E6E600","353233","423A3C"] as string[];

for i,name in liquidsNamed{
	var zsFluid = VanillaFactory.createFluid(name, Color.fromHex(colorsNamed[i]));
	zsFluid.setDensity(4000);
	zsFluid.setViscosity(1000);
	zsFluid.setTemperature(400);
	zsFluid.register();
}



liquidsNamed = ["ubu","pbu","luf","mix_258","mix_298","mix_294","lam_231","eam_231"] as string[];
for i,name in liquidsNamed{
	var zsFluid = VanillaFactory.createFluid(name, Color.fromHex(colorsNamed[i]));
	zsFluid.setDensity(4000);
	zsFluid.setViscosity(1000);
	zsFluid.setTemperature(400);
	zsFluid.register();
	zsFluid = VanillaFactory.createFluid(name~"_fluoride", Color.fromHex(colorsNamed[i]));
	zsFluid.setDensity(4000);
	zsFluid.setViscosity(1000);
	zsFluid.setTemperature(400);
	zsFluid.register();
	zsFluid = VanillaFactory.createFluid(name~"_fluoride_flibe", Color.fromHex(colorsNamed[i]));
	zsFluid.setDensity(4000);
	zsFluid.setViscosity(1000);
	zsFluid.setTemperature(400);
	zsFluid.register();

	zsFluid = VanillaFactory.createFluid("depleted_"~name, Color.fromHex(colorsNamed[i]));
	zsFluid.setDensity(4000);
	zsFluid.setViscosity(1000);
	zsFluid.setTemperature(400);
	zsFluid.register();
	zsFluid = VanillaFactory.createFluid("depleted_"~name~"_fluoride", Color.fromHex(colorsNamed[i]));
	zsFluid.setDensity(4000);
	zsFluid.setViscosity(1000);
	zsFluid.setTemperature(400);
	zsFluid.register();
	zsFluid = VanillaFactory.createFluid("depleted_"~name~"_fluoride_flibe", Color.fromHex(colorsNamed[i]));
	zsFluid.setDensity(4000);
	zsFluid.setViscosity(1000);
	zsFluid.setTemperature(400);
	zsFluid.register();
}

//RTG stuff
rtgNames = ["rtg_co","rtg_co_done","rtg_ac","rtg_ac_done"];
for item in rtgNames{
	var zsBlock = VanillaFactory.createBlock(item, <blockmaterial:rock>);
	zsBlock.setBlockHardness(2.0);
	zsBlock.setBlockResistance(5.0);
	zsBlock.setToolClass("pickaxe");
	zsBlock.setToolLevel(0);
	zsBlock.setBlockSoundType(<soundtype:stone>);
	zsBlock.creativeTab = <creativetab:moar_fuels>;
	zsBlock.register();
}

}

//special Trinity additions

if(loadedMods has "trinity"){
	val triNames = ["u233sphere","u235sphere","n237sphere","p239sphere","a242sphere","cm247sphere","b248sphere","cf249sphere","cf251sphere","du233sphere","du235sphere","dn237sphere","dp239sphere","da242sphere","dcm247sphere","db248sphere","dcf249sphere","dcf251sphere","plutonium236","pbp_fuel","pbp_fuel_carbide","pbp_fuel_triso","pbp_fuel_oxide","pbp_fuel_nitride","pbp_fuel_zirconium","dpbp_fuel_triso","dpbp_fuel_oxide","dpbp_fuel_nitride","dpbp_fuel_zirconium"] as string[];
	for item in triNames{
		var temp = VanillaFactory.createItem(item);
		temp.creativeTab = <creativetab:moar_fuels>;
		temp.register();
	}
	var liquidsNamed = ["pbp"] as string[];
	var colorsNamed= ["cccccc"] as string[];
	for i,name in liquidsNamed{
	var zsFluid = VanillaFactory.createFluid(name, Color.fromHex(colorsNamed[i]));
	zsFluid.setDensity(4000);
	zsFluid.setViscosity(1000);
	zsFluid.setTemperature(400);
	zsFluid.register();
	zsFluid = VanillaFactory.createFluid(name~"_fluoride", Color.fromHex(colorsNamed[i]));
	zsFluid.setDensity(4000);
	zsFluid.setViscosity(1000);
	zsFluid.setTemperature(400);
	zsFluid.register();
	zsFluid = VanillaFactory.createFluid(name~"_fluoride_flibe", Color.fromHex(colorsNamed[i]));
	zsFluid.setDensity(4000);
	zsFluid.setViscosity(1000);
	zsFluid.setTemperature(400);
	zsFluid.register();

	zsFluid = VanillaFactory.createFluid("depleted_"~name, Color.fromHex(colorsNamed[i]));
	zsFluid.setDensity(4000);
	zsFluid.setViscosity(1000);
	zsFluid.setTemperature(400);
	zsFluid.register();
	zsFluid = VanillaFactory.createFluid("depleted_"~name~"_fluoride", Color.fromHex(colorsNamed[i]));
	zsFluid.setDensity(4000);
	zsFluid.setViscosity(1000);
	zsFluid.setTemperature(400);
	zsFluid.register();
	zsFluid = VanillaFactory.createFluid("depleted_"~name~"_fluoride_flibe", Color.fromHex(colorsNamed[i]));
	zsFluid.setDensity(4000);
	zsFluid.setViscosity(1000);
	zsFluid.setTemperature(400);
	zsFluid.register();
	}

}
