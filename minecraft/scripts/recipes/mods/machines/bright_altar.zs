/*
 * This script is created for the GreedyCraft Tweaks by mc_Edwin.
 */

#priority 50
#crafttweaker reloadable
#reloadable

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

MachineModifier.setMaxThreads("bright_altar", 16);
MachineModifier.setMaxParallelism("bright_altar", 4);
MachineModifier.setInternalParallelism("bright_altar", 1);

MMEvents.onControllerGUIRender("bright_altar", function(event as ControllerGUIRenderEvent) {
    var info as string[] = ["§a///璀璨祭坛控制面板///", "§a机器名称：§eLV4 - 璀璨祭坛"];
    event.extraInfo = info;
});

MMEvents.onMachinePreTick("bright_altar", function(event as MachineTickEvent) {
    var x as int = event.controller.pos.x;
    var y as int = event.controller.pos.y;
    var z as int = event.controller.pos.z;
    if (!event.controller.world.isRemote()) {
        server.commandManager.executeCommandSilent(server, "particleex tickpolarparameter endRod " ~ x as string ~ " " ~ y as string ~ " " ~ z as string ~ " 0 0.8 1 1 240 0 0 0 -10 10 s1,s2,dis=t*100,t*PI/200,t%2+10 0.1 10 20 vy=0.05");
    }
});

RecipeBuilder.newBuilder("zodiacite", "bright_altar", 600)
    .addItemInput(<ore:ingotBalancedMatrix> * 1)
    .addItemInput(<ore:dustAstralMetal> * 12)
    .addItemInput(<ore:ingotLunarine> * 8)
    .addItemInput(<ore:ingotNasalum> * 8)
    .addItemInput(<ore:ingotIgnite> * 24)
    .addItemInput(<astralsorcery:itemusabledust:1> * 8)
    .addItemInput(<gct_mobs:polarisite> * 16)
    .addFluidInput(<liquid:astralsorcery.liquidstarlight> * 16000)
    .addStarlightInput(20000)
    .addItemOutput(<additions:zodiacite_ingot> * 2)
    .build();