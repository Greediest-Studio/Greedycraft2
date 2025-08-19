/*
 * This script is created for the GreedyCraft Tweaks by mc_Edwin.
 */

#priority 50
#crafttweaker reloadable
#reloadable

import crafttweaker.oredict.IOreDictEntry;
import crafttweaker.item.IItemStack;
import crafttweaker.data.IData;
import crafttweaker.item.IIngredient;
import crafttweaker.liquid.ILiquidStack;

import mods.modularmachinery.RecipeBuilder;
import mods.modularmachinery.MMEvents;
import mods.modularmachinery.MachineTickEvent;
import mods.modularmachinery.RecipeTickEvent;
import mods.modularmachinery.MachineModifier;
import mods.modularmachinery.ControllerGUIRenderEvent;
import mods.modularmachinery.SmartInterfaceType;
import mods.ctutils.utils.Math;
import mods.jei.JEI;

MachineModifier.setMaxThreads("unitcell_builder", 1);
MachineModifier.setMaxParallelism("unitcell_builder", 256);
MachineModifier.setInternalParallelism("unitcell_builder", 1);

MachineModifier.addSmartInterfaceType("unitcell_builder", SmartInterfaceType.create("模式", 0.0f));

MMEvents.onControllerGUIRender("unitcell_builder", function(event as ControllerGUIRenderEvent) {
    var mode as string = "错误！";
    if (event.controller.getSmartInterfaceData("模式").value == 0.0f) {
        mode = "原子再构";
    } else if (event.controller.getSmartInterfaceData("模式").value == 1.0f) {
        mode = "共晶复制";
    }
    var info as string[] = [
        "§a///晶胞重塑器控制面板///",
        "§a机器名称：§eLV3 - 晶胞重塑器",
        "§a机器模式：§e" + mode
    ];
    event.extraInfo = info;
});

function addCFFusionRecipe(input as IIngredient, output as IItemStack, cost as int) {
    RecipeBuilder.newBuilder("cf_" + output.definition.id + output.metadata, "unitcell_builder", 10)
        .addItemInput(input)
        .addItemOutput(output)
        .addEnergyPerTickInput(cost / 10)
        .addSmartInterfaceDataInput("模式", 0)
        .addRecipeTooltip("§a运行模式：原子再构")
        .build();
}

addCFFusionRecipe(<ore:blockRedstone>, <actuallyadditions:block_crystal>, 400);
addCFFusionRecipe(<ore:blockLapis>, <actuallyadditions:block_crystal:1>, 400);
addCFFusionRecipe(<ore:blockDiamond>, <actuallyadditions:block_crystal:2>, 600);
addCFFusionRecipe(<ore:blockEmerald>, <actuallyadditions:block_crystal:4>, 1000);
addCFFusionRecipe(<ore:blockCoal>, <actuallyadditions:block_crystal:3>, 600);
addCFFusionRecipe(<ore:blockIron>, <actuallyadditions:block_crystal:5>, 800);
addCFFusionRecipe(<ore:dustRedstone>, <actuallyadditions:item_crystal>, 40);
addCFFusionRecipe(<ore:gemLapis>, <actuallyadditions:item_crystal:1>, 40);
addCFFusionRecipe(<ore:gemDiamond>, <actuallyadditions:item_crystal:2>, 60);
addCFFusionRecipe(<ore:gemEmerald>, <actuallyadditions:item_crystal:4>, 100);
addCFFusionRecipe(<ore:gemCoal>, <actuallyadditions:item_crystal:3>, 60);
addCFFusionRecipe(<ore:ingotIron>, <actuallyadditions:item_crystal:5>, 80);
addCFFusionRecipe(<actuallyadditions:item_misc:18>, <actuallyadditions:item_color_lens>, 5000);
addCFFusionRecipe(<actuallyadditions:item_color_lens>, <actuallyadditions:item_explosion_lens>, 5000);
addCFFusionRecipe(<actuallyadditions:item_explosion_lens>, <actuallyadditions:item_damage_lens>, 5000);
addCFFusionRecipe(<actuallyadditions:item_damage_lens>, <actuallyadditions:item_misc:18>, 5000);
addCFFusionRecipe(<actuallyadditions:block_laser_relay>, <actuallyadditions:block_laser_relay_fluids>, 2000);
addCFFusionRecipe(<actuallyadditions:block_laser_relay_fluids>, <actuallyadditions:block_laser_relay_item>, 2000);
addCFFusionRecipe(<actuallyadditions:block_laser_relay_item>, <actuallyadditions:block_laser_relay>, 2000);
addCFFusionRecipe(<ore:sand>, <minecraft:soul_sand>, 20000);
addCFFusionRecipe(<ore:rottenFlesh>, <minecraft:leather>, 8000);
addCFFusionRecipe(<minecraft:red_mushroom>, <minecraft:nether_wart>, 150000);
addCFFusionRecipe(<ore:gemQuartz>, <minecraft:prismarine_shard>, 30000);
addCFFusionRecipe(<ore:seedCanola>, <actuallyadditions:item_misc:23>, 2000);
addCFFusionRecipe(<minecraft:quartz_block>, <actuallyadditions:block_testifi_bucks_white_wall>, 10);
addCFFusionRecipe(<minecraft:quartz_block:1>, <actuallyadditions:block_testifi_bucks_green_wall>, 10);
addCFFusionRecipe(<ore:gemRedstone>, <thermalfoundation:material:893>, 4000);
addCFFusionRecipe(<ore:dustGlowstone>, <thermalfoundation:material:894>, 1500);
addCFFusionRecipe(<ore:enderpearl>, <thermalfoundation:material:895>, 2000);
addCFFusionRecipe(<ore:gemCertusQuartz>, <appliedenergistics2:material:1>, 1500);
addCFFusionRecipe(<ore:gemTofu>, <tofucraft:material:25>, 2500);

RecipeBuilder.newBuilder("cp_chaotic", "unitcell_builder", 400)
    .addItemInput(<ore:gemChaoticCocrystal>).setChance(0.0f)
    .addItemInput(<ore:ingotEverite> * 4)
    .addItemInput(<ore:gemTerrestrial> * 4)
    .addItemInput(<actuallyadditions:block_crystal_empowered:4> * 2)
    .addItemOutput(<draconicevolution:chaos_shard:2> * 2)
    .addItemOutput(<draconicevolution:chaos_shard:2>).setChance(0.5f)
    .addItemOutput(<draconicevolution:chaos_shard:2>).setChance(0.5f)
    .addItemOutput(<draconicevolution:chaos_shard:2>).setChance(0.5f)
    .addItemOutput(<draconicevolution:chaos_shard:2>).setChance(0.5f)
    .addSmartInterfaceDataInput("模式", 1)
    .addRecipeTooltip("§a运行模式：共晶复制")
    .build();
    
RecipeBuilder.newBuilder("cp_stormy", "unitcell_builder", 400)
    .addItemInput(<ore:gemStormyCocrystal>).setChance(0.0f)
    .addItemInput(<ore:ingotEverite> * 4)
    .addItemInput(<ore:gemTerrestrial> * 4)
    .addItemInput(<actuallyadditions:block_crystal_empowered:4> * 2)
    .addItemOutput(<gct_ores:stormy_fragment_small> * 2)
    .addItemOutput(<gct_ores:stormy_fragment_small>).setChance(0.5f)
    .addItemOutput(<gct_ores:stormy_fragment_small>).setChance(0.5f)
    .addItemOutput(<gct_ores:stormy_fragment_small>).setChance(0.5f)
    .addItemOutput(<gct_ores:stormy_fragment_small>).setChance(0.5f)
    .addSmartInterfaceDataInput("模式", 1)
    .addRecipeTooltip("§a运行模式：共晶复制")
    .build();
    