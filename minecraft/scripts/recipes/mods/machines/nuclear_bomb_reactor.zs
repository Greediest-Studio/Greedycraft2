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
MachineModifier.setMaxParallelism("nuclear_bomb_reactor", 65536);

MMEvents.onControllerGUIRender("nuclear_bomb_reactor", function(event as ControllerGUIRenderEvent) {
    var info as string[] = ["§a///重型核爆反应釜控制面板///", "§a机器名称：§eLV5 - 重型核爆反应釜"];
    event.extraInfo = info;
});

val nuclearBombList as int[IItemStack] = {
    <trinity:bomb_u233> : 13000,
    <trinity:bomb_u235> : 10800,
    <trinity:bomb_np237> : 8000,
    <trinity:bomb_pu239> : 14000,
    <trinity:bomb_am242> : 17200,
    <trinity:bomb_cm247> : 12400,
    <trinity:bomb_bk248> : 12200,
    <trinity:bomb_cf249> : 19400,
    <trinity:bomb_cf251> : 20200,
    <trinity:bomb_cf253> : 22000,
    <trinity:bomb_es254> : 23600,
    <trinity:salted_bomb_u233> : 13000,
    <trinity:salted_bomb_u235> : 10800,
    <trinity:salted_bomb_np237> : 8000,
    <trinity:salted_bomb_pu239> : 14000,
    <trinity:salted_bomb_am242> : 17200,
    <trinity:salted_bomb_cm247> : 12400,
    <trinity:salted_bomb_bk248> : 12200,
    <trinity:salted_bomb_cf249> : 19400,
    <trinity:salted_bomb_cf251> : 20200,
    <trinity:salted_bomb_cf253> : 22000,
    <trinity:salted_bomb_es254> : 23600
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