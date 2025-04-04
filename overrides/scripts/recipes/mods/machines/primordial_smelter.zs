/*
 * This script is created for the GreedyCraft Tweaks by 咕咕咕.
 * 请不要添加超过100种源质
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
import mods.modularmachinery.RecipeCheckEvent;
import mods.modularmachinery.RecipeFinishEvent;
import mods.modularmachinery.RecipePrimer;
import mods.ctutils.utils.Math;
import mods.jei.JEI;

MachineModifier.setMaxThreads("primordial_smelter", 100);
MachineModifier.setInternalParallelism("primordial_smelter", 16);

var aspectlist = ["aer", "primitivus", "motus", "ignis", "herba", "instrumentum", "victus", "visum", "sonus", "fluctus", "draco", "exanimis", "permutatio", "potentia", "lux", "bestia", "vitium", "terra", "tenebrae", "vacuos", "coralos", "aqua", "praemunio", "abyss", "gelum", "auram", "imperium", "caeles", "dreadia", "machina", "sensus", "vapor", "desiderium", "mortuus", "structura", "cthulhu", "cognitio", "alienis", "sol", "spiritus", "volatus", "metallum", "exitium", "fabrico", "ordo", "vitreus", "ventus", "vinculum", "alkimia", "aversio", "tempestas", "humanus", "pulvis", "praecantatio", "tempus", "infernum", "perditio"] as string[];
var input =<thaumadditions:vis_pod>.withTag({});
var thread = 1 as int;

/*
aer 1
primitivus 2
motus 3
ignis 4
herba 5
instrumentum 6
victus 7
visum 8
sonus 9
fluctus 10
draco 11
exanimis 12
permutatio 13
potentia 14
lux 15
bestia 16
vitium 17
terra 18
tenebrae 19
vacuos 20
coralos 21
aqua 22
praemunio 23
abyss 24
gelum 25
auram 26
imperium 27
caeles 28
dreadia 29
machina 30
sensus 31
vapor 32
desiderium 33
mortuus 34
structura 35
cthulhu 36
cognitio 37
alienis 38
sol 39
spiritus 40
volatus 41
metallum 42
exitium 43
fabrico 44
ordo 45
vitreus 46
ventus 47
vinculum 48
alkimia 49
aversio 50
tempestas 51
humanus 52
pulvis 53
praecantatio 54
tempus 55
infernum 56
perditio 57
*/

for asp in aspectlist {
    input = input.updateTag({"Aspect":asp});
    MachineModifier.addCoreThread("primordial_smelter", FactoryRecipeThread.createCoreThread("输出" ~ asp ~ "源质"));
    val builder as RecipePrimer = RecipeBuilder.newBuilder(asp ~ "1" , "primordial_smelter", 1 , thread , false);
    builder.addItemInput(input);
    builder.addEnergyPerTickInput(512);
    builder.addThaumcraftAspcetOutput(5, asp);
    builder.build();
    thread += 1;
}