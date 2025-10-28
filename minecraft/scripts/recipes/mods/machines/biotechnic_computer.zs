/*
 * This script is created for the GreedyCraft Tweaks by mc_Edwin.
 */

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

import mods.ctutils.utils.Math;

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
import mods.modularmachinery.MachineUpgradeBuilder;
import mods.modularmachinery.MachineUpgradeHelper;

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

$expand IMachineController$getEntropy() as int {
    if (!isNull(this.customData.entropy)) {
        return this.customData.entropy as int;
    } else {
        return 0 as int;
    }
}

$expand IMachineController$setEntropy(entropy as int) {
    this.customData = this.customData.update({entropy: entropy});
}

$expand IMachineController$addEntropy(amount as int) {
    this.setEntropy(this.getEntropy() + amount);
}

$expand IMachineController$removeEntropy(amount as int) {
    this.setEntropy(this.getEntropy() - amount);
}

MachineUpgradeBuilder.newBuilder("decode_upgrade", "解码模块升级", 1, 1)
    .addDescriptions("§b使计算机的解码模块更加高效")
    .addCompatibleMachines("biotechnic_computer")
    .buildAndRegister();

MachineUpgradeHelper.addFixedUpgrade(<additions:decode_part>, "decode_upgrade");

MMEvents.onControllerGUIRender("biotechnic_computer", function(event as ControllerGUIRenderEvent) {
    var info as string[] = [
        "§a///超精密生物质计算机控制面板///",
        "§a机器名称：§eLV5 - 超精密生物质计算机",
        "§a营养储备：§e" + event.controller.getNutrition(),
        "§a熵含量：§e" + ((event.controller.getEntropy() > 100) ? (event.controller.getEntropy() > 150 ? "§c" : "§e") : "§a") + event.controller.getEntropy() + "/200"
    ];
    event.extraInfo = info;
});

MMEvents.onMachinePreTick("biotechnic_computer", function(event as MachineTickEvent) {
    var controller as IMachineController = event.controller;
    if (controller.getEntropy() >= 200) {
        controller.setEntropy(0);
        var pos as IBlockPos = controller.pos;
        var corePos as IBlockPos = pos.getOffset(controller.facing.opposite, 7).up(3);
        controller.world.setBlockState(<blockstate:minecraft:air>, corePos);
        controller.world.performExplosion(controller.ownerPlayer, corePos.x as double, corePos.y as double, corePos.z as double, 24.0f, true, true);
    }
    if (Math.random() < 0.05) {
        if (controller.getEntropy() > 0) {
            controller.removeEntropy(1);
        }
    }
});

MachineModifier.addCoreThread("biotechnic_computer", FactoryRecipeThread.createCoreThread("营养供给模块").addRecipe("nutrition_input"));
MachineModifier.addCoreThread("biotechnic_computer", FactoryRecipeThread.createCoreThread("解码模块"));

RecipeBuilder.newBuilder("nutrition_input", "biotechnic_computer", 1)
    .addFluidInput(<liquid:culture_medium>)
    .addFactoryFinishHandler(function(event as FactoryRecipeFinishEvent) {
        var parallelism as int = event.activeRecipe.parallelism;
        event.controller.addNutrition(parallelism as long);
    })
    .addRecipeTooltip("§e向缸中之脑容器内部输入培养液")
    .addRecipeTooltip("§c如果机器运行时无法获取足够多的培养液，机器会立即爆炸！")
    .setThreadName("营养供给模块")
    .build();

RecipeBuilder.newBuilder("decode_orderkey", "biotechnic_computer", 200)
    .addItemInput(<additions:ordered_bone_key>)
    .addItemOutput(<additions:ordered_bone_key_slate>)
    .addEnergyPerTickInput(1048576)
    .setParallelized(false)
    .addFactoryPostTickHandler(function(event as FactoryRecipeTickEvent) {
        var controller as IMachineController = event.controller;
        if (controller.getNutrition() > 0) {
            controller.removeNutrition(1);
        } else {
            controller.addEntropy(2);
        }
    })
    .build();

