/*
 * This script is created for the GreedyCraft Tweaks by mc_Edwin.
 */


#priority 50
#reloadable

import crafttweaker.oredict.IOreDictEntry;
import crafttweaker.item.IItemStack;
import crafttweaker.data.IData;
import crafttweaker.item.IIngredient;
import crafttweaker.liquid.ILiquidStack;
import crafttweaker.player.IPlayer;

import mods.modularmachinery.RecipeBuilder;
import mods.modularmachinery.RecipePrimer;
import mods.ctutils.utils.Math;
import mods.modularmachinery.ControllerGUIRenderEvent;
import mods.modularmachinery.MMEvents;
import mods.modularmachinery.MachineModifier;
import mods.modularmachinery.RecipeCheckEvent;
import mods.modularmachinery.IMachineController;
import mods.modularmachinery.MachineTickEvent;
import mods.modularmachinery.FactoryRecipeTickEvent;
import mods.modularmachinery.FactoryRecipeFinishEvent;
import mods.jei.JEI;

import mods.zenutils.DataUpdateOperation.MERGE;
import mods.zenutils.DataUpdateOperation.REMOVE;

MMEvents.onControllerGUIRender("aspect_absorber", function(event as ControllerGUIRenderEvent) {
    var info as string[] = ["§a///要素汲取机控制面板///", "§a机器名称：§eLV4 - 要素汲取机"];
    event.extraInfo = info;
});

MachineModifier.setMaxThreads("aspect_absorber", 1);
MachineModifier.setMaxParallelism("aspect_absorber", 1);
MachineModifier.setInternalParallelism("aspect_absorber", 1);

val aspects as string[] = [
    "structura",
    "pulvis",
    "draco",
    "sol",
    "permutatio",
    "ventus",
    "tempestas",
    "aqua",
    "ordo",
    "gelum",
    "alkimia",
    "ignis",
    "metallum",
    "aversio",
    "instrumentum",
    "machina",
    "exitium",
    "motus",
    "bestia",
    "vitium",
    "alienis",
    "dreadia",
    "abyss",
    "spiritus",
    "aer",
    "auram",
    "cognitio",
    "lux",
    "imperium",
    "praecantatio",
    "vapor",
    "exanimis",
    "fluctus",
    "potentia",
    "infernum",
    "cthulhu",
    "vinculum",
    "vacuos",
    "herba",
    "volatus",
    "fabrico",
    "tempus",
    "perditio",
    "terra",
    "humanus",
    "sonus",
    "vitreus",
    "coralos",
    "victus",
    "desiderium",
    "mortuus",
    "sensus",
    "primitivus",
    "tenebrae",
    "caeles",
    "visum",
    "praemunio"
];

for aspect in aspects {
    RecipeBuilder.newBuilder("aspect_absorb_" + aspect, "aspect_absorber", 1)
        .addAspcetOutput(1, aspect)
        .addFactoryPreTickHandler(function(event as FactoryRecipeTickEvent) {
            var pos = event.controller.pos.up(2);
            var data as IData = event.controller.world.getBlock(pos).data;
            if (!isNull(data.Aspects)) {
                var aspList = data.Aspects;
                if (aspList.length > 0) {
                    val object as IData = aspList[0];
                    var type as string = object.key as string;
                    var amount as int = object.amount as int;
                    if (type == aspect) {
                        if (amount > 1) {
                            var newObject as IData = {key : type, amount : amount - 1};
                            var newList as IData = aspList.deepUpdate([object], REMOVE).deepUpdate([newObject], MERGE);
                            event.controller.world.setBlockState(<blockstate:thaumcraft:crucible>, data.update({Aspects : newList}), pos);
                        } else {
                            var newList as IData = aspList.deepUpdate([object], REMOVE);
                            event.controller.world.setBlockState(<blockstate:thaumcraft:crucible>, data.update({Aspects : newList}), pos);
                        }
                    }
                }
            }
        })
        .addPreCheckHandler(function(event as RecipeCheckEvent) {
            var pos = event.controller.pos.up(2);
            var data as IData = event.controller.world.getBlock(pos).data;
            if (!isNull(data.Aspects)) {
                var aspList = data.Aspects;
                if (aspList.length > 0) {
                    var object as IData = aspList[0];
                    var type as string = object.key as string;
                    if (type != aspect) {
                        event.setFailed("要素种类错误！");
                    }
                } else {
                    event.setFailed("坩埚是空的！");
                }
            } else {
                event.setFailed("坩埚是空的！");
            }
        })
        .addRecipeTooltip("§e将坩埚中的要素提取出来")
        .build();
}

