/*
Copyright Bob Bartsch, 2021

This code is governed by the
Creative Commons Attribution–NonCommercial License
https://creativecommons.org/licenses/by-nc/3.0/

(Meaning: credit me if you modify and/or redistribute
this code. Also, you may not sell this code.)
*/

#loader contenttweaker

import crafttweaker.creativetabs.ICreativeTab;
import mods.contenttweaker.CreativeTab;
import mods.contenttweaker.VanillaFactory;
import mods.contenttweaker.Item;
import mods.contenttweaker.Fluid;
import mods.contenttweaker.Color;
import mods.contenttweaker.Block;

val zsTab as CreativeTab = VanillaFactory.createCreativeTab("moar_fuels", <item:nuclearcraft:fuel_californium:3>);
zsTab.register();

val moarTab as ICreativeTab = <creativetab:moar_fuels>;

function registerMoarItem(name as string, tab as ICreativeTab) as void {
    var temp as Item = VanillaFactory.createItem(name);
    temp.creativeTab = tab;
    temp.register();
}

function registerMoarBlock(name as string, tab as ICreativeTab) as void {
    var zsBlock as Block = VanillaFactory.createBlock(name, <blockmaterial:rock>);
    zsBlock.setBlockHardness(2.0);
    zsBlock.setBlockResistance(5.0);
    zsBlock.setToolClass("pickaxe");
    zsBlock.setToolLevel(0);
    zsBlock.setBlockSoundType(<soundtype:stone>);
    zsBlock.creativeTab = tab;
    zsBlock.register();
}

function registerMoarFluid(name as string, colorInt as int) as void {
    var zsFluid as Fluid = VanillaFactory.createFluid(name, colorInt);
    zsFluid.setDensity(4000);
    zsFluid.setViscosity(1000);
    zsFluid.setTemperature(400);
    zsFluid.register();
}

function registerMoltenFuelGroup(baseName as string, colorHex as string) as void {
    val colorInt as int = Color.fromHex(colorHex).getIntColor();
    val depletedPrefix as string = "depleted_" ~ baseName;
    registerMoarFluid(baseName, colorInt);
    registerMoarFluid(baseName ~ "_fluoride", colorInt);
    registerMoarFluid(baseName ~ "_fluoride_flibe", colorInt);
    registerMoarFluid(depletedPrefix, colorInt);
    registerMoarFluid(depletedPrefix ~ "_fluoride", colorInt);
    registerMoarFluid(depletedPrefix ~ "_fluoride_flibe", colorInt);
}

// isotopes generation
val isoNames as string[][] = [
    ["californium53", "californium53carbide", "californium53oxide", "californium53nitride", "californium53zirconium"],
    ["californium54", "californium54carbide", "californium54oxide", "californium54nitride", "californium54zirconium"],
    ["einsteinium54", "einsteinium54carbide", "einsteinium54oxide", "einsteinium54nitride", "einsteinium54zirconium"],
    ["einsteinium55", "einsteinium55carbide", "einsteinium55oxide", "einsteinium55nitride", "einsteinium55zirconium"],
    ["fermium57", "fermium57carbide", "fermium57oxide", "fermium57nitride", "fermium57zirconium"]
];
for array in isoNames {
    for item in array {
        registerMoarItem(item, moarTab);
    }
}

registerMoarItem("einsteinium52", moarTab);

// fuels generation
var fuelNames as string[] = [
    "californium_fuel", "californium_fuel_carbide", "californium_fuel_triso", "californium_fuel_oxide", "californium_fuel_nitride", "californium_fuel_zirconium",
    "einsteinium_fuel", "einsteinium_fuel_carbide", "einsteinium_fuel_triso", "einsteinium_fuel_oxide", "einsteinium_fuel_nitride", "einsteinium_fuel_zirconium",
    "fermium_fuel", "fermium_fuel_carbide", "fermium_fuel_triso", "fermium_fuel_oxide", "fermium_fuel_nitride", "fermium_fuel_zirconium",
    "hcalifornium_fuel", "hcalifornium_fuel_carbide", "hcalifornium_fuel_triso", "hcalifornium_fuel_oxide", "hcalifornium_fuel_nitride", "hcalifornium_fuel_zirconium",
    "heinsteinium_fuel", "heinsteinium_fuel_carbide", "heinsteinium_fuel_triso", "heinsteinium_fuel_oxide", "heinsteinium_fuel_nitride", "heinsteinium_fuel_zirconium",
    "rplutonium_fuel", "rplutonium_fuel_carbide", "rplutonium_fuel_triso", "rplutonium_fuel_oxide", "rplutonium_fuel_nitride", "rplutonium_fuel_zirconium",
    "ramericium_fuel", "ramericium_fuel_carbide", "ramericium_fuel_triso", "ramericium_fuel_oxide", "ramericium_fuel_nitride", "ramericium_fuel_zirconium",
    "rcalifornium_fuel", "rcalifornium_fuel_carbide", "rcalifornium_fuel_triso", "rcalifornium_fuel_oxide", "rcalifornium_fuel_nitride", "rcalifornium_fuel_zirconium"
];
for item in fuelNames {
    registerMoarItem(item, moarTab);
}

fuelNames = [
    "dcalifornium_fuel_triso", "dcalifornium_fuel_oxide", "dcalifornium_fuel_nitride", "dcalifornium_fuel_zirconium",
    "deinsteinium_fuel_triso", "deinsteinium_fuel_oxide", "deinsteinium_fuel_nitride", "deinsteinium_fuel_zirconium",
    "dfermium_fuel_triso", "dfermium_fuel_oxide", "dfermium_fuel_nitride", "dfermium_fuel_zirconium",
    "dhcalifornium_fuel_triso", "dhcalifornium_fuel_oxide", "dhcalifornium_fuel_nitride", "dhcalifornium_fuel_zirconium",
    "dheinsteinium_fuel_triso", "dheinsteinium_fuel_oxide", "dheinsteinium_fuel_nitride", "dheinsteinium_fuel_zirconium",
    "drplutonium_fuel_triso", "drplutonium_fuel_oxide", "drplutonium_fuel_nitride", "drplutonium_fuel_zirconium",
    "dramericium_fuel_triso", "dramericium_fuel_oxide", "dramericium_fuel_nitride", "dramericium_fuel_zirconium",
    "drcalifornium_fuel_triso", "drcalifornium_fuel_oxide", "drcalifornium_fuel_nitride", "drcalifornium_fuel_zirconium",
    "curium_244", "curium_250"
];
for item in fuelNames {
    registerMoarItem(item, moarTab);
}

fuelNames = ["cbc", "cbcf"];
val fuelEnds as string[] = ["_tr", "_ox", "_ni", "_za"];

for iso in fuelNames {
    registerMoarItem(iso, moarTab);
    registerMoarItem(iso ~ "_c", moarTab);
    for ender in fuelEnds {
        registerMoarItem(iso ~ ender, moarTab);
        registerMoarItem("d_" ~ iso ~ ender, moarTab);
    }
}

// liquid fuels & isotopes
var liquidsNamed as string[] = ["californium_253", "californium_254", "einsteinium_254", "einsteinium_255", "fermium_257", "curium_244"];
var colorsNamed as string[] = ["4A000B", "4A000B", "001A4F", "001A4F", "4F004A", "800080", "800080", "AAAAAA", "382B0A", "4A000B"];

for i, name in liquidsNamed {
    registerMoarFluid(name, Color.fromHex(colorsNamed[i]).getIntColor());
}

liquidsNamed = ["lecf_253", "hecf_253", "lee_254", "hee_254", "mix_257", "cbc", "cbcf", "rep_238", "rea_241", "rec_250"];
for i, name in liquidsNamed {
    registerMoltenFuelGroup(name, colorsNamed[i]);
}

// RTG & CANDU stuff
val itemNames as string[] = ["gemgermanium", "si_ge", "uranium_oxide", "pre_candu", "candu", "thorium_oxide", "dcandu", "pre_aneel", "aneel", "daneel"];
for item in itemNames {
    registerMoarItem(item, moarTab);
}

var rtgNames as string[] = [
    "rtg_sr", "rtg_sr_done", "rtg_ru", "rtg_ru_done", "rtg_cs", "rtg_cs_done", "rtg_pm", "rtg_pm_done",
    "rtg_eu", "rtg_eu_done", "rtg_po", "rtg_po_done", "rtg_ra", "rtg_ra_done", "rtg_pu", "rtg_pu_done",
    "rtg_am", "rtg_am_done", "rtg_cf", "rtg_cf_done"
];
for item in rtgNames {
    registerMoarBlock(item, moarTab);
}

// Crazy High Enrichment Stuff
val enrich as string[] = ["me", "vhe", "xe", "se", "ue", "wg", "ip"];
val isos as string[] = ["u_233", "u_235", "n_236", "p_239", "p_241", "a_242", "cm_243", "cm_245", "cm_247", "b_248", "cf_249", "cf_251", "cf_253", "e_254"];

colorsNamed = ["008000", "008000", "009999", "AAAAAA", "AAAAAA", "382B0A", "800080", "800080", "800080", "86592D", "4A000B", "4A000B", "4A000B", "001A4F"];

for enr in enrich {
    for i, iso in isos {
        val baseId as string = enr ~ iso;
        registerMoarItem(baseId, moarTab);
        registerMoarItem(baseId ~ "_c", moarTab);
        for ender in fuelEnds {
            registerMoarItem(baseId ~ ender, moarTab);
            registerMoarItem("d_" ~ baseId ~ ender, moarTab);
        }
        registerMoltenFuelGroup(baseId, colorsNamed[i]);
    }
}

// special QMD additions
if (loadedMods has "qmd") {
    val isoNames2 as string[][] = [
        ["thorium229", "thorium229carbide", "thorium229oxide", "thorium229nitride", "thorium229zirconium"],
        ["mendelevium58", "mendelevium58carbide", "mendelevium58oxide", "mendelevium58nitride", "mendelevium58zirconium"],
        ["flerovium98", "flerovium98carbide", "flerovium98oxide", "flerovium98nitride", "flerovium98zirconium"],
        ["darmstadtium294", "darmstadtium294carbide", "darmstadtium294oxide", "darmstadtium294nitride", "darmstadtium294zirconium"]
    ];
    for array in isoNames2 {
        for item in array {
            registerMoarItem(item, moarTab);
        }
    }
    fuelNames = [
        "protactinium_fuel", "protactinium_fuel_carbide", "protactinium_fuel_triso", "protactinium_fuel_oxide", "protactinium_fuel_nitride", "protactinium_fuel_zirconium",
        "hprotactinium_fuel", "hprotactinium_fuel_carbide", "hprotactinium_fuel_triso", "hprotactinium_fuel_oxide", "hprotactinium_fuel_nitride", "hprotactinium_fuel_zirconium",
        "mendelevium_fuel", "mendelevium_fuel_carbide", "mendelevium_fuel_triso", "mendelevium_fuel_oxide", "mendelevium_fuel_nitride", "mendelevium_fuel_zirconium",
        "flerovium_fuel", "flerovium_fuel_carbide", "flerovium_fuel_triso", "flerovium_fuel_oxide", "flerovium_fuel_nitride", "flerovium_fuel_zirconium",
        "darmstadtium_fuel", "darmstadtium_fuel_carbide", "darmstadtium_fuel_triso", "darmstadtium_fuel_oxide", "darmstadtium_fuel_nitride", "darmstadtium_fuel_zirconium",
        "ubu_fuel", "ubu_fuel_carbide", "ubu_fuel_triso", "ubu_fuel_oxide", "ubu_fuel_nitride", "ubu_fuel_zirconium"
    ];
    for item in fuelNames {
        registerMoarItem(item, moarTab);
    }
    fuelNames = [
        "dprotactinium_fuel_triso", "dprotactinium_fuel_oxide", "dprotactinium_fuel_nitride", "dprotactinium_fuel_zirconium",
        "dhprotactinium_fuel_triso", "dhprotactinium_fuel_oxide", "dhprotactinium_fuel_nitride", "dhprotactinium_fuel_zirconium",
        "dmendelevium_fuel_triso", "dmendelevium_fuel_oxide", "dmendelevium_fuel_nitride", "dmendelevium_fuel_zirconium",
        "dflerovium_fuel_triso", "dflerovium_fuel_oxide", "dflerovium_fuel_nitride", "dflerovium_fuel_zirconium",
        "ddarmstadtium_fuel_triso", "ddarmstadtium_fuel_oxide", "ddarmstadtium_fuel_nitride", "ddarmstadtium_fuel_zirconium",
        "dubu_fuel_triso", "dubu_fuel_oxide", "dubu_fuel_nitride", "dubu_fuel_zirconium",
        "uranium_232"
    ];
    for item in fuelNames {
        registerMoarItem(item, moarTab);
    }

    fuelNames = ["pbu", "luf"];
    for iso in fuelNames {
        registerMoarItem(iso, moarTab);
        registerMoarItem(iso ~ "_c", moarTab);
        for ender in fuelEnds {
            registerMoarItem(iso ~ ender, moarTab);
            registerMoarItem("d_" ~ iso ~ ender, moarTab);
        }
    }

    registerMoarItem("mysterymix", moarTab);
    registerMoarItem("actinium", moarTab);
    registerMoarItem("purethorium229", moarTab);

    var qmdLiquidsNamed as string[] = ["uranium_234"];
    val qmdColorsNamed as string[] = ["008000", "ff8080", "00b33c", "8B4000", "BBA100", "E6E600", "353233", "423A3C"];

    for i, name in qmdLiquidsNamed {
        registerMoarFluid(name, Color.fromHex(qmdColorsNamed[i]).getIntColor());
    }

    qmdLiquidsNamed = ["ubu", "pbu", "luf", "mix_258", "mix_298", "mix_294", "lam_231", "eam_231"];
    for i, name in qmdLiquidsNamed {
        registerMoltenFuelGroup(name, qmdColorsNamed[i]);
    }

    rtgNames = ["rtg_co", "rtg_co_done", "rtg_ac", "rtg_ac_done"];
    for item in rtgNames {
        registerMoarBlock(item, moarTab);
    }
}

// special Trinity additions
if (loadedMods has "trinity") {
    val triNames as string[] = [
        "u233sphere", "u235sphere", "n237sphere", "p239sphere", "a242sphere", "cm247sphere", "b248sphere", "cf249sphere", "cf251sphere",
        "du233sphere", "du235sphere", "dn237sphere", "dp239sphere", "da242sphere", "dcm247sphere", "db248sphere", "dcf249sphere", "dcf251sphere",
        "plutonium236",
        "pbp_fuel", "pbp_fuel_carbide", "pbp_fuel_triso", "pbp_fuel_oxide", "pbp_fuel_nitride", "pbp_fuel_zirconium",
        "dpbp_fuel_triso", "dpbp_fuel_oxide", "dpbp_fuel_nitride", "dpbp_fuel_zirconium"
    ];
    for item in triNames {
        registerMoarItem(item, moarTab);
    }
    val triLiquidsNamed as string[] = ["pbp"];
    val triColorsNamed as string[] = ["cccccc"];
    for i, name in triLiquidsNamed {
        registerMoltenFuelGroup(name, triColorsNamed[i]);
    }
}
