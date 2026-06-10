/*
 * This script is created for the GreedyCraft Tweaks by 孤梦.
 */

#priority 0

import crafttweaker.world.IWorld;
import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;
import crafttweaker.block.IBlock;
import crafttweaker.block.IBlockDefinition;
import crafttweaker.world.IBlockPos;
import crafttweaker.liquid.ILiquidStack;
import crafttweaker.oredict.IOreDictEntry;
import crafttweaker.data.IData;
import crafttweaker.util.Math;

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

MachineModifier.setMaxThreads("elysia_reactor", 8);
MachineModifier.setInternalParallelism("elysia_reactor", 4);
MachineModifier.setMaxParallelism("elysia_reactor", 65536);

MMEvents.onControllerGUIRender("elysia_reactor", function(event as ControllerGUIRenderEvent) {
    var info as string[] = [
        "§e///大型反应单元控制面板///",
        "§a机器名称：§eELYSIA单元 - 大型反应单元"
    ];
    event.extraInfo = info;
});

RecipeAdapterBuilder.create("elysia_reactor", "nuclearcraft:chemical_reactor")
    .addRecipeTooltip("§d化学反应配方支持模块化电容升级，详情请查询“模块化电容”")
    //.setMaxThreads(1)
    .build();

function addExtraReactionRecipe(inputs as ILiquidStack[], outputs as ILiquidStack[]) {
    var builder = RecipeBuilder.newBuilder(inputs[0].definition.name + (inputs.length > 1 ? inputs[1].definition.name : "") + "_reaction", "elysia_reactor", 200);
    for input in inputs {
        builder.addFluidInput(input);
    }
    for output in outputs {
        builder.addFluidOutput(output);
    }
    builder.addEnergyPerTickInput(5);
    builder.addRecipeTooltip("§d化学反应配方支持模块化电容升级，详情请查询“模块化电容”");
    builder.addRecipeTooltip("§a该配方需要扩容升级，详情请查询“模块化电容-扩容”");
    builder.addPreCheckHandler(function(event as RecipeCheckEvent) {
        if (!event.controller.hasMachineUpgrade("expand_upg")) {
            event.setFailed("缺少扩容升级！");
        }
    });
    builder.setMaxThreads(1);
    builder.build();
}

addExtraReactionRecipe([<liquid:fluorobenzene> * 250, <liquid:carbon_tetrachloride> * 125, <liquid:naoh> * 333], [<liquid:c4_i4_difluorodiphenylmethanone> * 125, <liquid:sodium_chloride> * 333]);
addExtraReactionRecipe([<liquid:fluorobenzene> * 250, <liquid:carbon_tetrachloride> * 125, <liquid:koh> * 333], [<liquid:c4_i4_difluorodiphenylmethanone> * 125, <liquid:potassium_chloride> * 333]);    
addExtraReactionRecipe([<liquid:diethylenetriamine> * 500, <liquid:chloroacetic_acid> * 2500, <liquid:sodium_hydroxide_solution> * 3330], [<liquid:diethylenetriaminepentaacetic_acid_pentasodium_salt_solution> * 500, <liquid:sodium_chloride> * 1665, <liquid:water> * 5000]);
addExtraReactionRecipe([<liquid:polystyrene> * 144, <liquid:chlorosulfonic_acid> * 1000], [<liquid:sulfonated_polystyrene> * 144, <liquid:liquidhydrogenchloride> * 1000]);

addExtraReactionRecipe([<liquid:calcium_lactate_solution> * 1000, <liquid:sulfuric_acid> * 1000], [<liquid:lactic_acid> * 1332, <liquid:calcium_sulfate_solution> * 666]);
