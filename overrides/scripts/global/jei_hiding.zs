import crafttweaker.mods.IMod;
import mods.jei.JEI;

val pewter as IMod = loadedMods["pewter"];
for fluidItems in pewter.items {
    JEI.hide(fluidItems);
}

JEI.hide(<thermalexpansion:florb>);
JEI.hide(<openblocks:tank>);
JEI.hide(<aeadditions:pattern.fluid>);
JEI.hide(<forestry:refractory>);

JEI.hideCategory("Painter");

JEI.addDescription(<aeble:bubble_ring>,"装备时，提供常驻的水下呼吸");
JEI.addDescription(<aeble:obsidian_ring>,"装备时，提供常驻的防火和抗性1");
JEI.addDescription(<aeble:air_ring>,"装备时，免疫摔落伤害");
JEI.addDescription(<aeble:regeneration_ring>,"装备时，提供常驻的生命恢复1");