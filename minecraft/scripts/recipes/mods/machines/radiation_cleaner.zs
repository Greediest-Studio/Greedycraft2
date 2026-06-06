#priority 30

import crafttweaker.oredict.IOreDictEntry;
import crafttweaker.item.IItemStack;
import crafttweaker.data.IData;
import crafttweaker.item.IIngredient;
import crafttweaker.liquid.ILiquidStack;

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

MachineModifier.setMaxParallelism("radiation_cleaner", 4096);
MachineModifier.setInternalParallelism("radiation_cleaner", 1);
MachineModifier.setMaxThreads("radiation_cleaner", 1);

MMEvents.onControllerGUIRender("radiation_cleaner", function(event as ControllerGUIRenderEvent) {
    var info as string[] = [
        "§a///辐射清洁器控制面板///",
        "§a机器名称：§eLV5 - 辐射清洁器"
    ];
    event.extraInfo = info;
});

RecipeBuilder.newBuilder("clean_radiation", "radiation_cleaner", 1000)
    .addRadiationInput(1, 1)
    .addEnergyPerTickInput(124800000)
    .addItemOutput(<jaopca:nugget.electronium>).setChance(0.01f)
    .addItemOutput(<jaopca:nugget.protonium>).setChance(0.01f)
    .addItemOutput(<avaritia:resource:3>).setChance(0.01f)
    .build();