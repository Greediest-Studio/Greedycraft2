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
import mods.modularmachinery.SmartInterfaceType;
import mods.modularmachinery.IngredientArrayBuilder;
import mods.modularmachinery.IMachineController;
import mods.modularmachinery.MachineModifier;
import mods.modularmachinery.FactoryRecipeThread;
import mods.modularmachinery.MachineUpgrade;
import mods.modularmachinery.MachineUpgradeBuilder;
import mods.modularmachinery.MachineUpgradeHelper;

MachineModifier.setMaxThreads("elysia_centrifuge", 1);
MachineModifier.setInternalParallelism("elysia_centrifuge", 4);
MachineModifier.setMaxParallelism("elysia_centrifuge", 65536);

MachineUpgradeBuilder.newBuilder("nature_centrifuge_upg", "自然离心升级", 1, 1)
    .addDescriptions("§b允许离心单元使用自然离心配方")
    .buildAndRegister();

MachineUpgradeHelper.addFixedUpgrade(<additions:upgrade_nature>, "nature_centrifuge_upg");

RecipeAdapterBuilder.create("elysia_centrifuge", "nuclearcraft:separator")
    .addRecipeTooltip("§d离心配方支持模块化电容升级，详情请查询“模块化电容”")
    .build();

RecipeAdapterBuilder.create("elysia_centrifuge", "thermalexpansion:centrifuge")
    .addRecipeTooltip("§d离心配方支持模块化电容升级，详情请查询“模块化电容”")
    .build();

RecipeBuilder.newBuilder("centrifuge_nature_stone", "elysia_centrifuge", 20)
    .addPreCheckHandler(function (event as RecipeCheckEvent) {
        if (!event.controller.hasMachineUpgrade("nature_centrifuge_upg")) {
            event.setFailed("缺少自然离心升级模块！");
        }
    })
    .addIngredientArrayInput(
        IngredientArrayBuilder.newBuilder()
            .addIngredients([
                <ore:stone>,
                <ore:cobblestone>
            ])
    )
    .addEnergyPerTickInput(100)
    .addFluidInput(<liquid:water> * 50)
    .addItemOutput(<minecraft:iron_ore>).setChance(0.015f)
    .addItemOutput(<minecraft:gold_ore>).setChance(0.0035f)
    .addItemOutput(<thermalfoundation:ore>).setChance(0.0125f)
    .addItemOutput(<thermalfoundation:ore:1>).setChance(0.01f)
    .addItemOutput(<thermalfoundation:ore:2>).setChance(0.002f)
    .addItemOutput(<thermalfoundation:ore:3>).setChance(0.0025f)
    .addItemOutput(<thermalfoundation:ore:4>).setChance(0.0035f)
    .addItemOutput(<thermalfoundation:ore:5>).setChance(0.0025f)
    .addItemOutput(<thermalfoundation:ore:6>).setChance(0.0015f)
    .addItemOutput(<thermalfoundation:ore:7>).setChance(0.0005f)
    .addItemOutput(<additions:chromium_ore>).setChance(0.0025f)
    .addItemOutput(<mekanism:oreblock>).setChance(0.003f)
    .addItemOutput(<divinerpg:rupee_ore>).setChance(0.001f)
    .addItemOutput(<divinerpg:realmite_ore>).setChance(0.001f)
    .addItemOutput(<divinerpg:arlemite_ore>).setChance(0.0005f)
    .addItemOutput(<actuallyadditions:block_misc:3>).setChance(0.0015f)
    .addItemOutput(<thermalfoundation:material:893>).setChance(0.02f)
    .addItemOutput(<minecraft:redstone>).setChance(0.0045f)
    .addItemOutput(<minecraft:coal>).setChance(0.025f)
    .addItemOutput(<minecraft:dye:4>).setChance(0.0035f)
    .addItemOutput(<minecraft:diamond>).setChance(0.0008f)
    .addItemOutput(<minecraft:emerald>).setChance(0.0003f)
    .addItemOutput(<thermalfoundation:material:2053>).setChance(0.006f)
    .addRecipeTooltip("§d离心配方支持模块化电容升级，详情请查询“模块化电容”")
    .addRecipeTooltip("§e需要自然离心升级模块才能使用此配方！")
    .build();

RecipeBuilder.newBuilder("centrifuge_nature_leave", "elysia_centrifuge", 20)
    .addPreCheckHandler(function (event as RecipeCheckEvent) {
        if (!event.controller.hasMachineUpgrade("nature_centrifuge_upg")) {
            event.setFailed("缺少自然离心升级模块！");
        }
    })
    .addItemInput(<ore:treeLeaves>)
    .addEnergyPerTickInput(100)
    .addFluidInput(<liquid:water> * 50)
    .addItemOutput(<minecraft:stick>).setChance(0.25f)
    .addItemOutput(<minecraft:sapling>).setChance(0.125f)
    .addItemOutput(<additions:plant_fibre>).setChance(0.15f)
    .addItemOutput(<minecraft:apple>).setChance(0.025f)
    .addItemOutput(<forestry:honey_drop>).setChance(0.015f)
    .addItemOutput(<enderio:item_material:46>).setChance(0.065f)
    .addItemOutput(<thermalfoundation:material:800>).setChance(0.3f)
    .addItemOutput(<mysticalagriculture:nature_essence>).setChance(0.05f)
    .addRecipeTooltip("§d离心配方支持模块化电容升级，详情请查询“模块化电容”")
    .addRecipeTooltip("§e需要自然离心升级模块才能使用此配方！")
    .build();

RecipeBuilder.newBuilder("centrifuge_nature_log", "elysia_centrifuge", 20)
    .addPreCheckHandler(function (event as RecipeCheckEvent) {
        if (!event.controller.hasMachineUpgrade("nature_centrifuge_upg")) {
            event.setFailed("缺少自然离心升级模块！");
        }
    })
    .addItemInput(<ore:logWood>)
    .addEnergyPerTickInput(100)
    .addFluidInput(<liquid:water> * 50)
    .addItemOutput(<thermalfoundation:material:800> * 6).setChance(0.8f)
    .addItemOutput(<thermalfoundation:material:832>).setChance(0.05f)
    .addItemOutput(<minecraft:stick>).setChance(0.4f)
    .addItemOutput(<mysticalagriculture:wood_essence>).setChance(0.05f)
    .addRecipeTooltip("§d离心配方支持模块化电容升级，详情请查询“模块化电容”")
    .addRecipeTooltip("§e需要自然离心升级模块才能使用此配方！")
    .build();

RecipeBuilder.newBuilder("centrifuge_nature_gravel", "elysia_centrifuge", 20)
    .addPreCheckHandler(function (event as RecipeCheckEvent) {
        if (!event.controller.hasMachineUpgrade("nature_centrifuge_upg")) {
            event.setFailed("缺少自然离心升级模块！");
        }
    })
    .addItemInput(<ore:gravel>)
    .addEnergyPerTickInput(100)
    .addFluidInput(<liquid:water> * 50)
    .addItemOutput(<minecraft:flint>).setChance(0.4f)
    .addItemOutput(<appliedenergistics2:material:5>).setChance(0.03f)
    .addItemOutput(<minecraft:coal>).setChance(0.055f)
    .addItemOutput(<minecraft:iron_ore>).setChance(0.040f)
    .addItemOutput(<minecraft:gold_ore>).setChance(0.0125f)
    .addItemOutput(<thermalfoundation:ore>).setChance(0.05f)
    .addItemOutput(<thermalfoundation:ore:1>).setChance(0.04f)
    .addItemOutput(<thermalfoundation:ore:2>).setChance(0.008f)
    .addItemOutput(<thermalfoundation:ore:3>).setChance(0.01f)
    .addItemOutput(<thermalfoundation:ore:4>).setChance(0.009f)
    .addItemOutput(<thermalfoundation:ore:5>).setChance(0.004f)
    .addItemOutput(<thermalfoundation:ore:6>).setChance(0.0015f)
    .addItemOutput(<thermalfoundation:ore:7>).setChance(0.001f)
    .addItemOutput(<minecraft:diamond>).setChance(0.0035f)
    .addItemOutput(<minecraft:emerald>).setChance(0.002f)
    .addItemOutput(<thermalfoundation:material:2053>).setChance(0.005f)
    .addRecipeTooltip("§d离心配方支持模块化电容升级，详情请查询“模块化电容”")
    .addRecipeTooltip("§e需要自然离心升级模块才能使用此配方！")
    .build();

RecipeBuilder.newBuilder("centrifuge_nature_sand", "elysia_centrifuge", 20)
    .addPreCheckHandler(function (event as RecipeCheckEvent) {
        if (!event.controller.hasMachineUpgrade("nature_centrifuge_upg")) {
            event.setFailed("缺少自然离心升级模块！");
        }
    })
    .addItemInput(<ore:sand>)
    .addEnergyPerTickInput(100)
    .addFluidInput(<liquid:water> * 50)
    .addItemOutput(<minecraft:flint>).setChance(0.03f)
    .addItemOutput(<minecraft:bone>).setChance(0.05f)
    .addItemOutput(<appliedenergistics2:material:5>).setChance(0.08f)
    .addItemOutput(<thermalfoundation:material:833>).setChance(0.005f)
    .addItemOutput(<thermalfoundation:material:2051>).setChance(0.0075f)
    .addItemOutput(<thermalfoundation:material:892>).setChance(0.01f)
    .addItemOutput(<enderio:item_material:47>).setChance(0.05f)
    .addItemOutput(<minecraft:deadbush>).setChance(0.025f)
    .addItemOutput(<thermalfoundation:material:864>).setChance(0.025f)
    .addItemOutput(<thermalfoundation:material:865>).setChance(0.0125f)
    .addItemOutput(<thermalfoundation:material:866>).setChance(0.0075f)
    .addRecipeTooltip("§d离心配方支持模块化电容升级，详情请查询“模块化电容”")
    .addRecipeTooltip("§e需要自然离心升级模块才能使用此配方！")
    .build();

RecipeBuilder.newBuilder("centrifuge_nature_sandstone", "elysia_centrifuge", 20)
    .addPreCheckHandler(function (event as RecipeCheckEvent) {
        if (!event.controller.hasMachineUpgrade("nature_centrifuge_upg")) {
            event.setFailed("缺少自然离心升级模块！");
        }
    })
    .addItemInput(<ore:sandstone>)
    .addEnergyPerTickInput(100)
    .addFluidInput(<liquid:water> * 50)
    .addItemOutput(<minecraft:flint>).setChance(0.03f)
    .addItemOutput(<minecraft:bone>).setChance(0.05f)
    .addItemOutput(<appliedenergistics2:material:5>).setChance(0.08f)
    .addItemOutput(<thermalfoundation:material:833>).setChance(0.005f)
    .addItemOutput(<thermalfoundation:material:2051>).setChance(0.0075f)
    .addItemOutput(<thermalfoundation:material:892>).setChance(0.01f)
    .addItemOutput(<enderio:item_material:47>).setChance(0.05f)
    .addItemOutput(<minecraft:deadbush>).setChance(0.025f)
    .addItemOutput(<thermalfoundation:material:864>).setChance(0.025f)
    .addItemOutput(<thermalfoundation:material:865>).setChance(0.0125f)
    .addItemOutput(<thermalfoundation:material:866>).setChance(0.0075f)
    .addRecipeTooltip("§d离心配方支持模块化电容升级，详情请查询“模块化电容”")
    .addRecipeTooltip("§e需要自然离心升级模块才能使用此配方！")
    .build();

RecipeBuilder.newBuilder("centrifuge_nature_netherrack", "elysia_centrifuge", 20)
    .addPreCheckHandler(function (event as RecipeCheckEvent) {
        if (!event.controller.hasMachineUpgrade("nature_centrifuge_upg")) {
            event.setFailed("缺少自然离心升级模块！");
        }
    })
    .addItemInput(<ore:netherrack>)
    .addEnergyPerTickInput(100)
    .addFluidInput(<liquid:water> * 50)
    .addItemOutput(<minecraft:magma>).setChance(0.01f)
    .addItemOutput(<minecraft:magma_cream>).setChance(0.006f)
    .addItemOutput(<thermalfoundation:material:771>).setChance(0.1f)
    .addItemOutput(<thermalfoundation:material:772>).setChance(0.05f)
    .addItemOutput(<tconstruct:ore>).setChance(0.003f)
    .addItemOutput(<tconstruct:ore:1>).setChance(0.003f)
    .addItemOutput(<minecraft:glowstone_dust>).setChance(0.01f)
    .addItemOutput(<thermalfoundation:material:894>).setChance(0.003f)
    .addItemOutput(<minecraft:quartz>).setChance(0.015f)
    .addItemOutput(<minecraft:blaze_powder>).setChance(0.002f)
    .addItemOutput(<minecraft:ghast_tear>).setChance(0.001f)
    .addItemOutput(<additions:netherite_scrap>).setChance(0.00025f)
    .addRecipeTooltip("§d离心配方支持模块化电容升级，详情请查询“模块化电容”")
    .addRecipeTooltip("§e需要自然离心升级模块才能使用此配方！")
    .build();

RecipeBuilder.newBuilder("centrifuge_nature_endstone", "elysia_centrifuge", 20)
    .addPreCheckHandler(function (event as RecipeCheckEvent) {
        if (!event.controller.hasMachineUpgrade("nature_centrifuge_upg")) {
            event.setFailed("缺少自然离心升级模块！");
        }
    })
    .addItemInput(<ore:endstone>)
    .addEnergyPerTickInput(100)
    .addFluidInput(<liquid:water> * 50)
    .addItemOutput(<minecraft:ender_pearl>).setChance(0.007f)
    .addItemOutput(<minecraft:purpur_block>).setChance(0.001f)
    .addItemOutput(<minecraft:chorus_fruit>).setChance(0.002f)
    .addItemOutput(<minecraft:chorus_fruit_popped>).setChance(0.003f)
    .addItemOutput(<thermalfoundation:material:895>).setChance(0.01f)
    .addItemOutput(<quark:biotite>).setChance(0.002f)
    .addItemOutput(<minecraft:obsidian>).setChance(0.005f)
    .addItemOutput(<minecraft:elytra>).setChance(0.000003f)
    .addRecipeTooltip("§d离心配方支持模块化电容升级，详情请查询“模块化电容”")
    .addRecipeTooltip("§e需要自然离心升级模块才能使用此配方！")
    .build();

RecipeBuilder.newBuilder("centrifuge_nature_dirt", "centrifuge_nature", 20)
    .addItemInput(<ore:dirt>)
    .addEnergyPerTickInput(50)
    .addFluidInput(<liquid:water> * 50)
    .addItemOutput(<minecraft:sapling>).setChance(0.02f)
    .addItemOutput(<minecraft:stick>).setChance(0.06f)
    .addItemOutput(<additions:plant_fibre>).setChance(0.15f)
    .addItemOutput(<additions:poop>).setChance(0.00125f)
    .addItemOutput(<biomesoplenty:mudball>).setChance(0.01f)
    .addItemOutput(<minecraft:slime_ball>).setChance(0.006f)
    .addItemOutput(<minecraft:coal>).setChance(0.009f)
    .addItemOutput(<minecraft:diamond>).setChance(0.0002f)
    .addItemOutput(<minecraft:wheat_seeds>).setChance(0.06f)
    .addItemOutput(<actuallyadditions:item_worm>).setChance(0.0003f)
    .addItemOutput(<minecraft:beetroot_seeds>).setChance(0.01f)
    .addItemOutput(<minecraft:pumpkin_seeds>).setChance(0.008f)
    .addItemOutput(<minecraft:melon_seeds>).setChance(0.006f)
    .addItemOutput(<minecraft:potato>).setChance(0.004f)
    .addItemOutput(<minecraft:carrot>).setChance(0.003f)
    .addItemOutput(<additions:delivery_order>).setChance(0.000375f)
    .addRecipeTooltip("§d离心配方支持模块化电容升级，详情请查询“模块化电容”")
    .build();

RecipeBuilder.newBuilder("centrifuge_nature_grass", "centrifuge_nature", 20)
    .addItemInput(<ore:grass>)
    .addEnergyPerTickInput(50)
    .addFluidInput(<liquid:water> * 50)
    .addItemOutput(<minecraft:sapling>).setChance(0.02f)
    .addItemOutput(<minecraft:stick>).setChance(0.06f)
    .addItemOutput(<additions:plant_fibre>).setChance(0.15f)
    .addItemOutput(<additions:poop>).setChance(0.00125f)
    .addItemOutput(<biomesoplenty:mudball>).setChance(0.01f)
    .addItemOutput(<minecraft:slime_ball>).setChance(0.006f)
    .addItemOutput(<minecraft:coal>).setChance(0.009f)
    .addItemOutput(<minecraft:diamond>).setChance(0.0002f)
    .addItemOutput(<minecraft:wheat_seeds>).setChance(0.06f)
    .addItemOutput(<actuallyadditions:item_worm>).setChance(0.0003f)
    .addItemOutput(<minecraft:beetroot_seeds>).setChance(0.01f)
    .addItemOutput(<minecraft:pumpkin_seeds>).setChance(0.008f)
    .addItemOutput(<minecraft:melon_seeds>).setChance(0.006f)
    .addItemOutput(<minecraft:potato>).setChance(0.004f)
    .addItemOutput(<minecraft:carrot>).setChance(0.003f)
    .addItemOutput(<additions:lucky_clover>).setChance(0.001f)
    .addItemOutput(<additions:delivery_order>).setChance(0.000625f)
    .addRecipeTooltip("§d离心配方支持模块化电容升级，详情请查询“模块化电容”")
    .build();

RecipeBuilder.newBuilder("centrifuge_nature_snow", "centrifuge_nature", 20)
    .addItemInput(<minecraft:snow>)
    .addEnergyPerTickInput(50)
    .addFluidInput(<liquid:water> * 50)
    .addItemOutput(<minecraft:snowball>).setChance(0.6f)
    .addItemOutput(<minecraft:snow_layer>).setChance(0.1f)
    .addItemOutput(<minecraft:ice>).setChance(0.2f)
    .addItemOutput(<minecraft:packed_ice>).setChance(0.1f)
    .addItemOutput(<mysticalagriculture:water_essence>).setChance(0.025f)
    .addItemOutput(<thermalfoundation:material:2049>).setChance(0.0125f)
    .addRecipeTooltip("§d离心配方支持模块化电容升级，详情请查询“模块化电容”")
    .build();

RecipeBuilder.newBuilder("centrifuge_nature_ice", "centrifuge_nature", 20)
    .addItemInput(<ore:ice>)
    .addEnergyPerTickInput(50)
    .addFluidInput(<liquid:water> * 50)
    .addItemOutput(<minecraft:snowball>).setChance(0.15f)
    .addItemOutput(<minecraft:snow_layer>).setChance(0.1f)
    .addItemOutput(<minecraft:ice>).setChance(0.4f)
    .addItemOutput(<minecraft:packed_ice>).setChance(0.3f)
    .addItemOutput(<mysticalagriculture:water_essence>).setChance(0.025f)
    .addItemOutput(<thermalfoundation:material:2049>).setChance(0.0125f)
    .addRecipeTooltip("§d离心配方支持模块化电容升级，详情请查询“模块化电容”")
    .build();

RecipeBuilder.newBuilder("centrifuge_nature_jasper", "centrifuge_nature", 20)
    .addItemInput(<ore:stoneJasper>)
    .addEnergyPerTickInput(50)
    .addFluidInput(<liquid:water> * 50)
    .addItemOutput(<minecraft:sandstone>).setChance(0.25f)
    .addItemOutput(<minecraft:sand>).setChance(0.15f)
    .addItemOutput(<thermalfoundation:material:772>).setChance(0.02f)
    .addItemOutput(<thermalfoundation:material:771>).setChance(0.005f)
    .addItemOutput(<appliedenergistics2:material:5>).setChance(0.02f)
    .addRecipeTooltip("§d离心配方支持模块化电容升级，详情请查询“模块化电容”")
    .build();

RecipeBuilder.newBuilder("centrifuge_nature_brimstone", "centrifuge_nature", 20)
    .addItemInput(<ore:stoneBrimstone>)
    .addEnergyPerTickInput(50)
    .addFluidInput(<liquid:water> * 50)
    .addItemOutput(<minecraft:blaze_powder>).setChance(0.075f)
    .addItemOutput(<minecraft:magma_cream>).setChance(0.025f)
    .addItemOutput(<thermalfoundation:material:772>).setChance(0.005f)
    .addItemOutput(<thermalfoundation:material:771>).setChance(0.02f)
    .addItemOutput(<appliedenergistics2:material:5>).setChance(0.02f)
    .addRecipeTooltip("§d离心配方支持模块化电容升级，详情请查询“模块化电容”")
    .build();

RecipeBuilder.newBuilder("centrifuge_nature_permafrost", "centrifuge_nature", 20)
    .addItemInput(<ore:stonePermafrost>)
    .addEnergyPerTickInput(50)
    .addFluidInput(<liquid:water> * 50)
    .addItemOutput(<thermalfoundation:material:2049>).setChance(0.075f)
    .addItemOutput(<minecraft:ice>).setChance(0.25f)
    .addItemOutput(<minecraft:packed_ice>).setChance(0.05f)
    .addItemOutput(<minecraft:snowball>).setChance(0.1f)
    .addItemOutput(<appliedenergistics2:material:5>).setChance(0.02f)
    .addRecipeTooltip("§d离心配方支持模块化电容升级，详情请查询“模块化电容”")
    .build();

RecipeBuilder.newBuilder("centrifuge_nature_limestone", "centrifuge_nature", 20)
    .addItemInput(<ore:stoneLimestone>)
    .addEnergyPerTickInput(50)
    .addFluidInput(<liquid:water> * 50)
    .addItemOutput(<minecraft:clay_ball>).setChance(0.075f)
    .addItemOutput(<minecraft:gravel>).setChance(0.025f)
    .addItemOutput(<thermalfoundation:material:772>).setChance(0.005f)
    .addItemOutput(<thermalfoundation:material:771>).setChance(0.0025f)
    .addItemOutput(<appliedenergistics2:material:5>).setChance(0.02f)
    .addRecipeTooltip("§d离心配方支持模块化电容升级，详情请查询“模块化电容”")
    .build();

RecipeBuilder.newBuilder("centrifuge_nature_prismarine", "centrifuge_nature", 20)
    .addItemInput(<ore:prismarine>)
    .addEnergyPerTickInput(50)
    .addFluidInput(<liquid:water> * 50)
    .addItemOutput(<minecraft:prismarine_shard>).setChance(0.08f)
    .addItemOutput(<minecraft:prismarine_crystals>).setChance(0.03f)
    .addItemOutput(<minecraft:fish>).setChance(0.01f)
    .addItemOutput(<minecraft:sponge>).setChance(0.005f)
    .addItemOutput(<appliedenergistics2:material:5>).setChance(0.02f)
    .addRecipeTooltip("§d离心配方支持模块化电容升级，详情请查询“模块化电容”")
    .build();

