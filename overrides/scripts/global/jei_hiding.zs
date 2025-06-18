import crafttweaker.mods.IMod;
import crafttweaker.oredict.IOreDictEntry;

import mods.jei.JEI;

val pewter as IMod = loadedMods["pewter"];
for fluidItems in pewter.items {
    JEI.hide(fluidItems);
}

val contenttweaker as IMod = loadedMods["contenttweaker"];
for oreItems in contenttweaker.items {
    if (!isNull(oreItems.ores)) {
        if (oreItems.ores.length != 0) {
            if (oreItems.ores[0].name has "ore") {
                JEI.hide(oreItems);
            }
        }
    }
}

JEI.hide(<thermalexpansion:florb>);
JEI.hide(<openblocks:tank>);
JEI.hide(<forestry:refractory>);

JEI.hideCategory("Painter");