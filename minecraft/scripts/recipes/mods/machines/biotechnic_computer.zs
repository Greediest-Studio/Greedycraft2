#priority 50

import crafttweaker.world.IWorld;
import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;
import crafttweaker.block.IBlock;
import crafttweaker.block.IBlockDefinition;
import crafttweaker.world.IBlockPos;
import crafttweaker.liquid.ILiquidStack;
import crafttweaker.oredict.IOreDictEntry;
import crafttweaker.data.IData;
import crafttweaker.player.IPlayer;
import crafttweaker.util.Math;

import mods.modularmachinery.RecipePrimer;
import mods.modularmachinery.RecipeBuilder;
import mods.modularmachinery.RecipeCheckEvent;
import mods.modularmachinery.FactoryRecipeStartEvent;
import mods.modularmachinery.FactoryRecipeTickEvent;
import mods.modularmachinery.FactoryRecipeFinishEvent;
import mods.modularmachinery.FactoryRecipeEvent;
import mods.modularmachinery.RecipeModifierBuilder;
import mods.modularmachinery.SmartInterfaceUpdateEvent;
import mods.modularmachinery.Sync;

import mods.modularmachinery.MMEvents;
import mods.modularmachinery.ControllerGUIRenderEvent;
import mods.modularmachinery.MachineTickEvent;

import mods.modularmachinery.IMachineController;
import mods.modularmachinery.SmartInterfaceData;
import mods.modularmachinery.MachineModifier;
import mods.modularmachinery.SmartInterfaceType;
import mods.modularmachinery.FactoryRecipeThread;
import mods.modularmachinery.RecipeFinishEvent;
import mods.modularmachinery.RecipeTickEvent;

MachineModifier.setMaxThreads("biotechnic_computer", 0);
MachineModifier.setInternalParallelism("biotechnic_computer", 2147483647);
MachineModifier.setMaxParallelism("biotechnic_computer", 2147483647);

$expand IMachineController$getNutrition() as long {
    if (!isNull(this.customData.nutrition)) {
        return this.customData.nutrition as long;
    } else {
        return 0 as long;
    }
}

$expand IMachineController$setNutrition(nutrition as long) {
    this.customData = this.customData.update({nutrition: nutrition});
}

$expand IMachineController$addNutrition(amount as long) {
    this.setNutrition(this.getNutrition() + amount);
}

$expand IMachineController$removeNutrition(amount as long) {
    this.setNutrition(this.getNutrition() - amount);
}

MMEvents.onControllerGUIRender("biotechnic_computer", function(event as ControllerGUIRenderEvent) {
    var info as string[] = [
        "§a///超精密生物质计算机控制面板///",
        "§a机器名称：§eLV5 - 超精密生物质计算机",
        "§a营养储备：§e" + event.controller.getNutrition()
    ];
    event.extraInfo = info;
});

MachineModifier.addCoreThread("biotechnic_computer", FactoryRecipeThread.createCoreThread("营养供给模块").addRecipe("nutrition_input"));

RecipeBuilder.newBuilder("nutrition_input", "biotechnic_computer", 1)
    .addFluidInput(<liquid:culture_medium>)
    .addFactoryFinishHandler(function(event as FactoryRecipeFinishEvent) {
        var parallelism as int = event.activeRecipe.parallelism;
        event.controller.addNutrition(parallelism as long);
    })
    .addRecipeTooltip("§e向缸中之脑容器内部输入培养液")
    .addRecipeTooltip("§c如果机器运行时无法获取足够多的培养液，机器会立即爆炸！")
    .build();
