/*
 * This script is created for the GreedyCraft 
 * 你知道湮灭媒介之类的得一个个手搓有多麻烦吗(恼)
 * 给你一拳
 */

#priority 20

import crafttweaker.oredict.IOreDictEntry;
import crafttweaker.item.IItemStack;
import crafttweaker.data.IData;
import crafttweaker.item.IIngredient;
import crafttweaker.liquid.ILiquidStack;
import crafttweaker.entity.IEntityDefinition;
import crafttweaker.util.Position3f;

import mods.modularmachinery.RecipeBuilder;
import mods.modularmachinery.MachineUpgradeBuilder;
import mods.modularmachinery.MachineUpgradeHelper;
import mods.modularmachinery.MachineModifier;
import mods.modularmachinery.IMachineController;
import mods.modularmachinery.RecipePrimer;
import mods.modularmachinery.RecipeModifier;
import mods.modularmachinery.RecipeModifierBuilder;
import mods.modularmachinery.FactoryRecipeThread;
import mods.modularmachinery.RecipeAdapterBuilder;
import mods.modularmachinery.RecipeCheckEvent;
import mods.modularmachinery.ControllerGUIRenderEvent;
import mods.modularmachinery.MMEvents;
import mods.ctutils.utils.Math;

MachineModifier.setMaxParallelism("abyss_ceremony_executant", 256);
MachineModifier.setInternalParallelism("abyss_ceremony_executant", 1);
MachineModifier.setMaxThreads("abyss_ceremony_executant", 8);

$expand RecipePrimer$addSacrificeInput() {
    this.addFactoryStartHandler(function(event as RecipeCheckEvent) {
        var x as float = event.controller.pos.x as float;
        var y as float = event.controller.pos.y as float;
        var z as float = event.controller.pos.z as float;
        var sacrificeList as IEntityDefinition[] = [
            <entity:minecraft:sheep>,
            <entity:minecraft:pig>,
            <entity:minecraft:cow>,
            <entity:minecraft:chicken>
        ];
        var entityList = event.controller.world.getEntitiesInArea(Position3f.create(x + 4, y + 1, z + 4), Position3f.create(x - 4, y - 1, z - 4));
        var pass as bool = false;
        for ent in entityList {
            if (!isNull(ent.definition)) {
                if (sacrificeList has ent.definition) {
                    event.controller.world.removeEntity(ent);
                    pass = true;
                    break;
                }
            }
        }
        if (!pass) {
            event.setFailed("缺少祭品输入");
        }
    });
    this.addRecipeTooltip("§4需要祭品");
}

function addRitualRecipe(output as IItemStack, inputs as IIngredient[], potEnergy as int, dim as int, sacrifice as bool) {
    var builder = RecipeBuilder.newBuilder(output.definition.id ~ (output.metadata as string), "abyss_ceremony_executant", 200);
    var pe as int = Math.floor(0.0144d * potEnergy) as int;
    builder.addFluidInput(<liquid:pe> * pe);
    for input in inputs {
        builder.addItemInput(input);
    }
    builder.addItemOutput(output);
    builder.addEnergyPerTickInput(4096);
    if (dim != -1) {
        builder.addDimensionInput(dim);
    }
    if (sacrifice) {
        builder.addSacrificeInput();
    }
    builder.build();
}

addRitualRecipe(<abyssalcraft:transmutationgem>, [
    <ore:dustBlaze> * 4,
    <ore:gemDiamond> * 2,
    <ore:enderpearl> * 2,
    <ore:materialCoraliumPearl>
], 300, -1, false);

addRitualRecipe(<abyssalcraft:oc>, [
    <ore:dustRedstone> * 4,
    <abyssalcraft:oblivionshard> * 4,
    <ore:pearlEnderEye>
], 5000, -1, true);