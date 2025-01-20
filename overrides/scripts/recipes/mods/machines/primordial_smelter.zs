/*
 * This script is created for the GreedyCraft Tweaks by 咕咕咕.
 */


#priority 30

import crafttweaker.oredict.IOreDictEntry;
import crafttweaker.item.IItemStack;
import crafttweaker.data.IData;
import crafttweaker.item.IIngredient;
import crafttweaker.liquid.ILiquidStack;
import thaumcraft.aspect.CTAspect;
import thaumcraft.aspect.CTAspectStack;
import crafttweaker.game.IGame;

import mods.modularmachinery.RecipeBuilder;
import mods.modularmachinery.MachineModifier;
import mods.modularmachinery.FactoryRecipeThread;
import mods.ctutils.utils.Math;
import mods.jei.JEI;

MachineModifier.setMaxThreads("primordial_smelter", 16);
MachineModifier.setInternalParallelism("primordial_smelter", 16);

var aspects = ["aer", "primitivus", "motus", "ignis", "herba", "instrumentum", "victus", "visum", "sonus", "fluctus", "draco", "exanimis", "permutatio", "potentia", "lux", "bestia", "vitium", "terra", "tenebrae", "vacuos", "coralos", "aqua", "praemunio", "abyss", "gelum", "auram", "imperium", "caeles", "dreadia", "machina", "sensus", "vapor", "desiderium", "mortuus", "structura", "cthulhu", "cognitio", "alienis", "sol", "spiritus", "volatus", "metallum", "exitium", "fabrico", "ordo", "vitreus", "ventus", "vinculum", "alkimia", "aversio", "tempestas", "humanus", "pulvis", "praecantatio", "tempus", "infernum", "perditio"] as string[];
var input as IItemStack = <thaumadditions:vis_pod>;

for asp in aspects {
    var input = input.updateTag({"Aspect":asp});
    RecipeBuilder.newBuilder(asp + "1", "primordial_smelter", 2)
        .addItemInput(input)
        .addEnergyPerTickInput(512)
        .addAspectOutput(asp as string, 5)
        .build();
}
