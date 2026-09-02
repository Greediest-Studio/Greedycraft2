/*
 * This script is created for the GreedyCraft Tweaks by mc_Edwin.
 */

#priority 50

import crafttweaker.oredict.IOreDictEntry;
import crafttweaker.item.IItemStack;
import crafttweaker.data.IData;
import crafttweaker.item.IIngredient;
import crafttweaker.liquid.ILiquidStack;

import mods.modularmachinery.RecipeBuilder;
import mods.modularmachinery.RecipeModifierBuilder;
import mods.modularmachinery.FactoryRecipeStartEvent;
import mods.modularmachinery.MMEvents;
import mods.modularmachinery.MachineTickEvent;
import mods.modularmachinery.RecipeTickEvent;
import mods.modularmachinery.MachineModifier;
import mods.modularmachinery.ControllerGUIRenderEvent;
import mods.ctutils.utils.Math;
import mods.jei.JEI;

MachineModifier.setMaxThreads("ion_exchange_column", 1);
MachineModifier.setMaxParallelism("ion_exchange_column", 65536);

MMEvents.onControllerGUIRender("ion_exchange_column", function(event as ControllerGUIRenderEvent) {
    val pattern = event.controller.getDynamicPattern("column");
    var height as int = isNull(pattern) ? 0 : pattern.size;
    var x as float = height as float / 50.0f;
    var timeMultiplier as float = height == 0 ? 0.0f : pow(x as double, Math.log(10.0d) / Math.log(4.0d)) as float;
    var outputMultiplier as float = height == 0 ? 0.0f : pow(4.0d, Math.log(1.0d + 0.1d * (x as double - 1.0d)) / Math.log(1.3d)) as float;
    var info as string[] = [
        "§a///大型离子交换柱控制面板///",
        "§a机器名称：§eLV5 - 大型离子交换柱",
        "§a机器高度：§e" ~ height as string,
        "§a时间倍率：§e" ~ timeMultiplier as string,
        "§a产出倍率：§e" ~ outputMultiplier as string
    ];
    event.extraInfo = info;
});

function applyColumnScaling(event as FactoryRecipeStartEvent) {
    val pattern = event.controller.getDynamicPattern("column");
    if (!isNull(pattern)) {
        var height as int = pattern.size;
        var x as float = height as float / 50.0f;
        var timeMultiplier as float = pow(x as double, Math.log(10.0d) / Math.log(4.0d)) as float;
        var outputMultiplier as float = pow(4.0d, Math.log(1.0d + 0.1d * (x as double - 1.0d)) / Math.log(1.3d)) as float;
        var thread = event.factoryRecipeThread;

        thread.addModifier("ion_exchange_duration", RecipeModifierBuilder.create("modularmachinery:duration", "input", timeMultiplier, 1, false).build());
        thread.addModifier("ion_exchange_fluid_output", RecipeModifierBuilder.create("modularmachinery:fluid", "output", outputMultiplier, 1, false).build());
        thread.addModifier("ion_exchange_item_output", RecipeModifierBuilder.create("modularmachinery:item", "output", outputMultiplier, 1, false).build());
    }
}

RecipeBuilder.newBuilder("ion_exchange_trinite_solution", "ion_exchange_column", 1200)
    .addFluidInput(<liquid:actinide_solution> * 5000)
    .addFluidInput(<liquid:nitric_acid> * 5000)
    .addEnergyPerTickInput(60000000)
    .addFluidOutput(<liquid:uranyl_nitrate_solution> * 7500)
    .addFluidOutput(<liquid:neptunyl_nitrate_solution> * 1000)
    .addFluidOutput(<liquid:plutonyl_nitrate_solution> * 1000)
    .addFluidOutput(<liquid:heavy_actinide_nitrate_solution> * 500)
    .addRadiationOutput(1, 1)
    .addFactoryStartHandler(function(event as FactoryRecipeStartEvent) {
        applyColumnScaling(event);
    })
    .addRecipeTooltip("§b产出倍率和时间倍率会随着离子交换柱的高度而变化，")
    .addRecipeTooltip("§b最高可达§e4倍§b产出和§e10倍§b时间消耗。")
    .addRecipeTooltip("§c产出倍率公式：4^log₁.₃(1+0.1×(<高度>÷50-1))")
    .addRecipeTooltip("§c时间倍率公式：(<高度>÷50)^log₄(10)")
    .setMaxThreads(1)
    .build();

RecipeBuilder.newBuilder("ion_exchange_heavy_actinide_primary_cut", "ion_exchange_column", 1800)
    .addItemInput(<additions:sulfonated_polystyrene_resin>).setChance(0.5f)
    .addFluidInput(<liquid:heavy_actinide_nitrate_solution> * 1000)
    .addFluidInput(<liquid:ammonium_alpha_hydroxyisobutyrate_solution> * 4000)
    .addEnergyPerTickInput(80000000)
    .addFluidOutput(<liquid:americium_curium_nitrate_solution> * 600)
    .addFluidOutput(<liquid:transcurium_nitrate_solution> * 400)
    .addRadiationOutput(2, 1)
    .addFactoryStartHandler(function(event as FactoryRecipeStartEvent) {
        applyColumnScaling(event);
    })
    .addRecipeTooltip("§b产出倍率和时间倍率会随着离子交换柱的高度而变化，")
    .addRecipeTooltip("§b最高可达§e4倍§b产出和§e10倍§b时间消耗。")
    .addRecipeTooltip("§c产出倍率公式：4^log₁.₃(1+0.1×(<高度>÷50-1))")
    .addRecipeTooltip("§c时间倍率公式：(<高度>÷50)^log₄(10)")
    .setMaxThreads(1)
    .build();

RecipeBuilder.newBuilder("ion_exchange_americium_curium_cut", "ion_exchange_column", 1800)
    .addItemInput(<additions:sulfonated_polystyrene_resin>).setChance(0.5f)
    .addFluidInput(<liquid:americium_curium_nitrate_solution> * 1000)
    .addFluidInput(<liquid:ammonium_alpha_hydroxyisobutyrate_solution> * 4000)
    .addEnergyPerTickInput(80000000)
    .addFluidOutput(<liquid:americium_nitrate_solution> * 500)
    .addFluidOutput(<liquid:curium_nitrate_solution> * 500)
    .addRadiationOutput(2, 1)
    .addFactoryStartHandler(function(event as FactoryRecipeStartEvent) {
        applyColumnScaling(event);
    })
    .addRecipeTooltip("§b产出倍率和时间倍率会随着离子交换柱的高度而变化，")
    .addRecipeTooltip("§b最高可达§e4倍§b产出和§e10倍§b时间消耗。")
    .addRecipeTooltip("§c产出倍率公式：4^log₁.₃(1+0.1×(<高度>÷50-1))")
    .addRecipeTooltip("§c时间倍率公式：(<高度>÷50)^log₄(10)")
    .setMaxThreads(1)
    .build();

RecipeBuilder.newBuilder("ion_exchange_transcurium_cut", "ion_exchange_column", 2400)
    .addItemInput(<additions:chelated_cation_exchange_resin>).setChance(0.5f)
    .addFluidInput(<liquid:transcurium_nitrate_solution> * 1000)
    .addFluidInput(<liquid:diethylenetriaminepentaacetic_acid_lactic_acid_eluent> * 5000)
    .addEnergyPerTickInput(100000000)
    .addFluidOutput(<liquid:berkelium_nitrate_solution> * 500)
    .addFluidOutput(<liquid:californium_einsteinium_nitrate_solution> * 500)
    .addRadiationOutput(3, 1)
    .addFactoryStartHandler(function(event as FactoryRecipeStartEvent) {
        applyColumnScaling(event);
    })
    .addRecipeTooltip("§b产出倍率和时间倍率会随着离子交换柱的高度而变化，")
    .addRecipeTooltip("§b最高可达§e4倍§b产出和§e10倍§b时间消耗。")
    .addRecipeTooltip("§c产出倍率公式：4^log₁.₃(1+0.1×(<高度>÷50-1))")
    .addRecipeTooltip("§c时间倍率公式：(<高度>÷50)^log₄(10)")
    .setMaxThreads(1)
    .build();

RecipeBuilder.newBuilder("ion_exchange_einsteinium_252_tail_cut", "ion_exchange_column", 3600)
    .addItemInput(<additions:ultrafine_cation_exchange_resin>).setChance(0.5f)
    .addFluidInput(<liquid:californium_einsteinium_nitrate_solution> * 1000)
    .addFluidInput(<liquid:diethylenetriaminepentaacetic_acid_lactic_acid_eluent> * 8000)
    .addEnergyPerTickInput(120000000)
    .addFluidOutput(<liquid:californium_nitrate_solution> * 980)
    .addFluidOutput(<liquid:einsteinium_252_nitrate_solution> * 20)
    .addRadiationOutput(5, 1)
    .addFactoryStartHandler(function(event as FactoryRecipeStartEvent) {
        applyColumnScaling(event);
    })
    .addRecipeTooltip("§b产出倍率和时间倍率会随着离子交换柱的高度而变化，")
    .addRecipeTooltip("§b最高可达§e4倍§b产出和§e10倍§b时间消耗。")
    .addRecipeTooltip("§c产出倍率公式：4^log₁.₃(1+0.1×(<高度>÷50-1))")
    .addRecipeTooltip("§c时间倍率公式：(<高度>÷50)^log₄(10)")
    .setMaxThreads(1)
    .build();
