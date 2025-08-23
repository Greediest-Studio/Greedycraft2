/*
 * This script is created for the GreedyCraft modpack by mc_Edwin.
 * You may NOT use this script in any other publicly distributed modpack without my permission.
 */

#priority 1750

import mods.jaopca.JAOPCA;
import mods.mekanism.chemical.dissolution;
import mods.jei.JEI;

import mods.modularmachinery.RecipePrimer;
import mods.modularmachinery.RecipeBuilder;
import mods.modularmachinery.MachineModifier;
import mods.modularmachinery.MMEvents;
import mods.modularmachinery.ControllerGUIRenderEvent;

MMEvents.onControllerGUIRender("factory_arcanic_brewer", function(event as ControllerGUIRenderEvent) {
    var info as string[] = ["§a///自魔炼化工厂控制面板///", "§a机器名称：§eELYSIA工厂 - 自魔炼化工厂"];
    event.extraInfo = info;
});

MMEvents.onControllerGUIRender("factory_arcanic_infuser", function(event as ControllerGUIRenderEvent) {
    var info as string[] = ["§a///自魔注灵工厂控制面板///", "§a机器名称：§eELYSIA工厂 - 自魔注灵工厂"];
    event.extraInfo = info;
});

MMEvents.onControllerGUIRender("factory_arcanic_astrallizer", function(event as ControllerGUIRenderEvent) {
    var info as string[] = ["§a///自魔星引工厂控制面板///", "§a机器名称：§eELYSIA工厂 - 自魔星引工厂"];
    event.extraInfo = info;
});

MachineModifier.setMaxThreads("factory_arcanic_brewer", 512);
MachineModifier.setInternalParallelism("factory_arcanic_brewer", 4);
MachineModifier.setMaxParallelism("factory_arcanic_brewer", 1024);

MachineModifier.setMaxThreads("factory_arcanic_infuser", 512);
MachineModifier.setInternalParallelism("factory_arcanic_infuser", 4);
MachineModifier.setMaxParallelism("factory_arcanic_infuser", 1024);

MachineModifier.setMaxThreads("factory_arcanic_astrallizer", 512);
MachineModifier.setInternalParallelism("factory_arcanic_astrallizer", 4);
MachineModifier.setMaxParallelism("factory_arcanic_astrallizer", 1024);

var Entries = JAOPCA.getMaterialsForType("INGOT");

function lowerCase(str as string) as string {
    var output as string = "";
    for letter in str.split("") {
        if ("ABCDEFGHIJKLMNOPQRSTUVWXYZ" has letter && output != "") {
            output = output + "_" + letter.toLowerCase();
        } else if ("ABCDEFGHIJKLMNOPQRSTUVWXYZ" has letter && output == "") {
            output = output + letter.toLowerCase();
        } else {
            output = output + letter;
        }
    }
    return output;
}

for EntryItem in Entries {
    if (banList has EntryItem.name) {
        continue;
    }
    RecipeBuilder.newBuilder("inf_" + lowerCase(EntryItem.name), "factory_arcanic_infuser", 60)
        .addItemInput(EntryItem.getOreDictEntry("ore"))
        .addAuraInput(512, true)
        .addManaInput(40000)
        .addItemOutput(EntryItem.getOreDictEntry("infused") * 8)
        .build();
    RecipeBuilder.newBuilder("bre_" + lowerCase(EntryItem.name), "factory_arcanic_brewer", 10)
        .addItemInput(EntryItem.getOreDictEntry("infused"))
        .addFluidPerTickInput(<liquid:lifeessence> * 200)
        .addAspcetInput(5, "metallum")
        .addItemOutput(EntryItem.getOreDictEntry("brewed"))
        .build();
    RecipeBuilder.newBuilder("ast_" + lowerCase(EntryItem.name), "factory_arcanic_astrallizer", 20)
        .addItemInput(EntryItem.getOreDictEntry("brewed"))
        .addStarlightInput(4000)
        .addVisInput(1)
        .addItemOutput(EntryItem.getOreDictEntry("starlight"))
        .build();
}
