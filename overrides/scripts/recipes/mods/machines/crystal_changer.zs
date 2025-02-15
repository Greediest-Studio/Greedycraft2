/*
 * This script is created for the GreedyCraft Tweaks by 咕咕咕.
 */

#priority 100
#loader crafttweaker reloadable

import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;
import crafttweaker.liquid.ILiquidStack;
import crafttweaker.data.IData;

import mods.modularmachinery.RecipePrimer;
import mods.modularmachinery.RecipeBuilder;
import mods.modularmachinery.RecipeCheckEvent;
import mods.modularmachinery.FactoryRecipeStartEvent;
import mods.modularmachinery.FactoryRecipeTickEvent;
import mods.modularmachinery.FactoryRecipeFinishEvent;
import mods.modularmachinery.RecipeModifierBuilder;
import mods.modularmachinery.SmartInterfaceUpdateEvent;
import mods.modularmachinery.RecipeTickEvent;

import mods.modularmachinery.MMEvents;
import mods.modularmachinery.ControllerGUIRenderEvent;

import mods.modularmachinery.IMachineController;
import mods.modularmachinery.SmartInterfaceData;
import mods.modularmachinery.MachineModifier;
import mods.modularmachinery.SmartInterfaceType;
import mods.modularmachinery.FactoryRecipeThread;

import mods.zenutils.DataUpdateOperation.OVERWRITE;
import mods.zenutils.DataUpdateOperation.MERGE;
import mods.zenutils.DataUpdateOperation.APPEND;

MachineModifier.addSmartInterfaceType("crystal_changer", 
    SmartInterfaceType.create("mode",1)
    .setHeaderInfo("§e///配方模式切换///")
    .setValueInfo("§e当前模式：%.2")
    .setJeiTooltip("配方模式：§a%.2", 1)
    .setNotEqualMessage("无效模式")
    .setFooterInfo("§e/////////////////")
);
/*
//复制 
RecipeBuilder.newBuilder("crycopy1", "crystal_changer", 1)
    .addSmartInterfaceDataInput("mode", 1, 1)
    .addItemInput(<astralsorcery:itemrockcrystalsimple>).setNBTChecker(function(ctrl as IMachineController, item as IItemStack) {
        val data = ctrl.customData;
        val map = data.asMap();
        map["astralsorcery"] = item.tag.astralsorcery;
        ctrl.customData = data;
        return true;
    })
    .addFluidInput(<fluid:astralsorcery.liquidstarlight> * 10000)
    .addItemOutput(<astralsorcery:itemrockcrystalsimple> * 2).addItemModifier(function(ctrl as IMachineController, oldItem as IItemStack) as IItemStack {
        val data = ctrl.customData;
        val map = data.asMap();
        return <astralsorcery:itemrockcrystalsimple>.withTag({astralsorcery: map["astralsorcery"]});
    })
    .addRecipeTooltip("§2复制水晶石")
    .build();

RecipeBuilder.newBuilder("crycopy2", "crystal_changer", 1)
    .addSmartInterfaceDataInput("mode", 1, 1)
    .addItemInput(<astralsorcery:itemtunedrockcrystal>).setNBTChecker(function(ctrl as IMachineController, item as IItemStack) {
        val data = ctrl.customData;
        val map = data.asMap();
        map["astralsorcery"] = item.tag.astralsorcery;
        ctrl.customData = data;
        return true;
    })
    .addFluidInput(<fluid:astralsorcery.liquidstarlight> * 20000)
    .addItemOutput(<astralsorcery:itemtunedrockcrystal> * 2).addItemModifier(function(ctrl as IMachineController, oldItem as IItemStack) as IItemStack {
        val data = ctrl.customData;
        val map = data.asMap();
        return <astralsorcery:itemtunedrockcrystal>.withTag({astralsorcery: map["astralsorcery"]});
    })
    .addRecipeTooltip("§2复制共鸣水晶石")
    .build();

RecipeBuilder.newBuilder("crycopy3", "crystal_changer", 1)
    .addSmartInterfaceDataInput("mode", 1, 1)
    .addItemInput(<astralsorcery:itemcelestialcrystal>).setNBTChecker(function(ctrl as IMachineController, item as IItemStack) {
        val data = ctrl.customData;
        val map = data.asMap();
        map["astralsorcery"] = item.tag.astralsorcery;
        ctrl.customData = data;
        return true;
    })
    .addFluidInput(<fluid:astralsorcery.liquidstarlight> * 25000)
    .addItemOutput(<astralsorcery:itemcelestialcrystal> * 2).addItemModifier(function(ctrl as IMachineController, oldItem as IItemStack) as IItemStack {
        val data = ctrl.customData;
        val map = data.asMap();
        return <astralsorcery:itemcelestialcrystal>.withTag({astralsorcery: map["astralsorcery"]});
    })
    .addRecipeTooltip("§2复制天体水晶石")
    .build();

RecipeBuilder.newBuilder("crycopy4", "crystal_changer", 1)
    .addSmartInterfaceDataInput("mode", 1, 1)
    .addItemInput(<astralsorcery:itemtunedcelestialcrystal>).setNBTChecker(function(ctrl as IMachineController, item as IItemStack) {
        val data = ctrl.customData;
        val map = data.asMap();
        map["astralsorcery"] = item.tag.astralsorcery;
        ctrl.customData = data;
        return true;
    })
    .addFluidInput(<fluid:astralsorcery.liquidstarlight> * 35000)
    .addItemOutput(<astralsorcery:itemtunedcelestialcrystal> * 2).addItemModifier(function(ctrl as IMachineController, oldItem as IItemStack) as IItemStack {
        val data = ctrl.customData;
        val map = data.asMap();
        return <astralsorcery:itemtunedcelestialcrystal>.withTag({astralsorcery: map["astralsorcery"]});
    })
    .addRecipeTooltip("§2复制共鸣天体水晶石")
    .build();

//充满

RecipeBuilder.newBuilder("cryupgread1", "crystal_changer", 1)
    .addSmartInterfaceDataInput("mode", 2, 2)
    .addItemInput(<astralsorcery:itemrockcrystalsimple>)
    .addFluidInput(<fluid:astralsorcery.liquidstarlight> * 16000)
    .addItemOutput(<astralsorcery:itemrockcrystalsimple>.withTag({astralsorcery: {crystalProperties: {collectiveCapability: 100, size: 400, fract: 0, purity: 100, sizeOverride: -1}}}))
    .addRecipeTooltip("§2制造三属性全满水晶石")
    .build();

RecipeBuilder.newBuilder("cryupgread2", "crystal_changer", 1)
    .addSmartInterfaceDataInput("mode", 2, 2)
    .addItemInput(<astralsorcery:itemcelestialcrystal>)
    .addFluidInput(<fluid:astralsorcery.liquidstarlight> * 64000)
    .addItemOutput(<astralsorcery:itemcelestialcrystal>.withTag({astralsorcery: {crystalProperties: {collectiveCapability: 100, size: 900, fract: 0, purity: 100, sizeOverride: -1}}}))
    .addRecipeTooltip("§2制造三属性全满天体水晶石")
    .build();

//嬗变
RecipeBuilder.newBuilder("crycraft1", "crystal_changer", 1)
    .addSmartInterfaceDataInput("mode", 3, 3)
    .addItemInput(<astralsorcery:itemrockcrystalsimple>).setNBTChecker(function(ctrl as IMachineController, item as IItemStack) {
        val data = ctrl.customData;
        val map = data.asMap();
        map["astralsorcery"] = item.tag.astralsorcery;
        ctrl.customData = data;
        return true;
    })
    .addItemInput(<astralsorcery:itemcraftingcomponent:2>)
    .addFluidInput(<fluid:astralsorcery.liquidstarlight> * 1000)
    .addItemOutput(<astralsorcery:itemcelestialcrystal> * 1).addItemModifier(function(ctrl as IMachineController, oldItem as IItemStack) as IItemStack {
        val data = ctrl.customData;
        val map = data.asMap();
        return <astralsorcery:itemcelestialcrystal>.withTag({astralsorcery: map["astralsorcery"]});
    })
    .addRecipeTooltip("§2合成天体水晶石")
    .build();
*/
/*
//以上为废稿
//标记
RecipeBuilder.newBuilder("crystal_mark","crystal_changer",1)
    .addItemInput(<ore:CrystalAstral>).setPreViewNBT({}).setNBTChecker(function(ctrl as IMachineController, item as IItemStack) {
        val data = ctrl.customData;
        val map = data.asMap();
        map["astralsorcery"] = item.tag.astralsorcery;
        ctrl.customData = data;
        return true;
    }).setTag("mark").setChance(0.0f)
    .addPostTickHandler(function(event as RecipeTickEvent) {
        event.setFailed(false,"§2标记完成");
    })
    .addRecipeTooltip("§2标记水晶石属性，此过程不消耗")
    .build();

//复制

RecipeBuilder.newBuilder("crycopy1", "crystal_changer", 1)
    .addSmartInterfaceDataInput("mode", 1, 1)
    .addItemInput(<astralsorcery:itemrockcrystalsimple>)
    .addFluidInput(<fluid:astralsorcery.liquidstarlight> * 10000)
    .addItemOutput(<astralsorcery:itemrockcrystalsimple>).addItemModifier(function(ctrl as IMachineController, oldItem as IItemStack) as IItemStack {
        val data = ctrl.customData;
        val map = data.asMap();
        return <astralsorcery:itemrockcrystalsimple>;.withTag({astralsorcery: map["astralsorcery"]});
    }).setTag("output")
    .addRecipeTooltip("§2产出两块与标记属性相同水晶石")
    .build();
 */
//充满


//合成

