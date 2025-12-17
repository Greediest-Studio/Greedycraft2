/*
 * This script is created for the GreedyCraft Tweaks by mc_Edwin.
 */

#priority 50

import crafttweaker.oredict.IOreDictEntry;
import crafttweaker.item.IItemStack;
import crafttweaker.data.IData;
import crafttweaker.item.IIngredient;
import crafttweaker.liquid.ILiquidStack;

import mods.modularmachinery.RecipePrimer;
import mods.modularmachinery.RecipeBuilder;
import mods.modularmachinery.RecipeCheckEvent;
import mods.modularmachinery.FactoryRecipeStartEvent;
import mods.modularmachinery.FactoryRecipeTickEvent;
import mods.modularmachinery.FactoryRecipeFinishEvent;
import mods.modularmachinery.RecipeModifierBuilder;
import mods.modularmachinery.RecipeAdapterBuilder;
import mods.modularmachinery.MMEvents;
import mods.modularmachinery.ControllerGUIRenderEvent;
import mods.modularmachinery.IMachineController;
import mods.modularmachinery.MachineModifier;
import mods.modularmachinery.FactoryRecipeThread;

MachineModifier.setMaxThreads("elysia_polymer", 8);
MachineModifier.setInternalParallelism("elysia_polymer", 4);
MachineModifier.setMaxParallelism("elysia_polymer", 65536);

MMEvents.onControllerGUIRender("elysia_polymer", function(event as ControllerGUIRenderEvent) {
    var info as string[] = [
        "§e///大型液化单元控制面板///",
        "§a机器名称：§eELYSIA单元 - 大型聚合单元"
    ];
    event.extraInfo = info;
});

function addPolymerRecipe(inputs as ILiquidStack[], outputs as ILiquidStack[]) {
    var builder = RecipeBuilder.newBuilder(outputs[0].definition.name + "_poly", "elysia_polymer", 20);
    for input in inputs {
        builder.addFluidInput(input);
    }
    for output in outputs {
        builder.addFluidOutput(output);
    }
    builder.addEnergyPerTickInput(480000);
    builder.addRecipeTooltip("§d聚合配方支持模块化电容升级，详情请查询“模块化电容”");
    builder.build();
}

//加聚
addPolymerRecipe([<liquid:ethene> * 1000], [<liquid:polyethylene_low_density> * 144]);
addPolymerRecipe([<liquid:tetrafluoroethene> * 1000], [<liquid:polytetrafluoroethene> * 144]);

//缩聚
addPolymerRecipe([<liquid:dfdps> * 666, <liquid:sodium_hydroquinone_solution> * 666], [<liquid:polyethersulfone> * 144, <liquid:sodium_fluoride_solution> * 1332]);
addPolymerRecipe([<liquid:dfdps> * 666, <liquid:potassium_hydroquinone_solution> * 666], [<liquid:polyethersulfone> * 144, <liquid:potassium_fluoride_solution> * 1332]);
addPolymerRecipe([<liquid:dimethyldifluorosilane> * 1000, <liquid:sodium> * 288], [<liquid:polydimethylsilylene> * 144, <liquid:sodium_fluoride_solution> * 1332]);
addPolymerRecipe([<liquid:dimethyldifluorosilane> * 1000, <liquid:potassium> * 288], [<liquid:polydimethylsilylene> * 144, <liquid:potassium_fluoride_solution> * 1332]);