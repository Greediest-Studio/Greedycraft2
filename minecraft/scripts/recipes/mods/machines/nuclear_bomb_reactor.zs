/*
 * This script is created for the GreedyCraft Tweaks by mc_Edwin.
 */

#priority 50

import crafttweaker.oredict.IOreDictEntry;
import crafttweaker.item.IItemStack;
import crafttweaker.data.IData;
import crafttweaker.item.IIngredient;
import crafttweaker.liquid.ILiquidStack;

import mods.modularmachinery.RecipeBuilder;
import mods.modularmachinery.MMEvents;
import mods.modularmachinery.MachineTickEvent;
import mods.modularmachinery.RecipeTickEvent;
import mods.modularmachinery.MachineModifier;
import mods.modularmachinery.ControllerGUIRenderEvent;
import mods.ctutils.utils.Math;
import mods.jei.JEI;

MachineModifier.setMaxThreads("nuclear_bomb_reactor", 1);
MachineModifier.setMaxParallelism("nuclear_bomb_reactor", 4096);
MachineModifier.setInternalParallelism("nuclear_bomb_reactor", 1);

MMEvents.onControllerGUIRender("nuclear_bomb_reactor", function(event as ControllerGUIRenderEvent) {
    var info as string[] = ["§a///重型核爆反应釜控制面板///", "§a机器名称：§eLV5 - 重型核爆反应釜"];
    event.extraInfo = info;
});

val nuclearBombList as int[IItemStack] = {
    <trinity:bomb_u233> : 1300,
    <trinity:bomb_u235> : 1080,
    <trinity:bomb_np237> : 800,
    <trinity:bomb_pu239> : 1400,
    <trinity:bomb_am242> : 1720,
    <trinity:bomb_cm247> : 1240,
    <trinity:bomb_bk248> : 1220,
    <trinity:bomb_cf249> : 1940,
    <trinity:bomb_cf251> : 2020,
    <trinity:bomb_cf253> : 2200,
    <trinity:bomb_es254> : 2360,
    <trinity:salted_bomb_u233> : 1300,
    <trinity:salted_bomb_u235> : 1080,
    <trinity:salted_bomb_np237> : 800,
    <trinity:salted_bomb_pu239> : 1400,
    <trinity:salted_bomb_am242> : 1720,
    <trinity:salted_bomb_cm247> : 1240,
    <trinity:salted_bomb_bk248> : 1220,
    <trinity:salted_bomb_cf249> : 1940,
    <trinity:salted_bomb_cf251> : 2020,
    <trinity:salted_bomb_cf253> : 2200,
    <trinity:salted_bomb_es254> : 2360
};

for bomb in nuclearBombList.keys {
    var builder = RecipeBuilder.newBuilder("nuclear_bomb_" + bomb.definition.id as string, "nuclear_bomb_reactor", 2000);
    builder.addItemInput(bomb);
    builder.addItemInput(<ore:sand> * (nuclearBombList[bomb] * 2));
    builder.addEnergyPerTickInput(10000000);
    builder.addItemOutput(<trinity:trinitite> * nuclearBombList[bomb]);
    if (bomb.definition.id has "salted") {
        builder.addRadiationOutput(1, 1);
    }
    builder.build();
}