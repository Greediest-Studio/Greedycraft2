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
import mods.modularmachinery.MMEvents;
import mods.modularmachinery.MachineTickEvent;
import mods.modularmachinery.RecipeTickEvent;
import mods.modularmachinery.MachineModifier;
import mods.modularmachinery.ControllerGUIRenderEvent;
import mods.ctutils.utils.Math;
import mods.jei.JEI;

MachineModifier.setMaxThreads("element_118_mixer", 1);
MachineModifier.setMaxParallelism("element_118_mixer", 256);
MachineModifier.setInternalParallelism("element_118_mixer", 1);

MMEvents.onControllerGUIRender("element_118_mixer", function(event as ControllerGUIRenderEvent) {
    var info as string[] = ["§a///超元共振混合机控制面板///", "§a机器名称：§eLV6 - 超元共振混合机"];
    event.extraInfo = info;
});

RecipeBuilder.newBuilder("element_mix", "element_118_mixer", 500)
    .addItemInputs([
        <ore:ingotHydrogen>,
        <ore:ingotHelium>,
        <ore:ingotLithium>,
        <ore:ingotBeryllium>,
        <ore:ingotBoron>,
        <ore:ingotCarbon>,
        <ore:ingotNitrogen>,
        <ore:ingotOxygen>,
        <ore:ingotFluorine>,
        <ore:ingotNeon>,
        <ore:ingotSodium>,
        <ore:ingotMagnesium>,
        <ore:ingotAluminum>,
        <ore:ingotSilicon>,
        <ore:ingotPhosphorus>,
        <ore:ingotSulfur>,
        <ore:ingotChlorine>,
        <ore:ingotArgon>,
        <ore:ingotPotassium>,
        <ore:ingotCalcium>,
        <ore:ingotScandium>,
        <ore:ingotTitanium>,
        <ore:ingotVanadium>,
        <ore:ingotChromium>,
        <ore:ingotManganese>,
        <ore:ingotIron>,
        <ore:ingotCobalt>,
        <ore:ingotNickel>,
        <ore:ingotCopper>,
        <ore:ingotZinc>,
        <ore:ingotGallium>,
        <ore:ingotGermanium>,
        <ore:ingotArsenic>,
        <ore:ingotSelenium>,
        <ore:ingotBromine>,
        <ore:ingotKrypton>,
        <ore:ingotRubidium>,
        <ore:ingotStrontium>,
        <ore:ingotYttrium>,
        <ore:ingotZirconium>,
        <ore:ingotNiobium>,
        <ore:ingotMolybdenum>,
        <ore:ingotTechnetium>,
        <ore:ingotRuthenium>,
        <ore:ingotRhodium>,
        <ore:ingotPalladium>,
        <ore:ingotSilver>,
        <ore:ingotCadmium>,
        <ore:ingotIndium>,
        <ore:ingotTin>,
        <ore:ingotAntimony>,
        <ore:ingotTellurium>,
        <ore:ingotIodine>,
        <ore:ingotXenon>,
        <ore:ingotCaesium>,
        <ore:ingotBarium>,
        <ore:ingotLanthanum>,
        <ore:ingotCerium>,
        <ore:ingotPraseodymium>,
        <ore:ingotNeodymium>,
        <ore:ingotPromethium>,
        <ore:ingotSamarium>,
        <ore:ingotEuropium>,
        <ore:ingotGadolinium>,
        <ore:ingotTerbium>,
        <ore:ingotDysprosium>,
        <ore:ingotHolmium>,
        <ore:ingotErbium>,
        <ore:ingotThullium>,
        <ore:ingotYtterbium>,
        <ore:ingotLutetium>,
        <ore:ingotHafnium>,
        <ore:ingotTantalum>,
        <ore:ingotTungsten>,
        <ore:ingotRhenium>,
        <ore:ingotOsmium>,
        <ore:ingotIridium>,
        <ore:ingotPlatinum>,
        <ore:ingotGold>,
        <ore:ingotMercury>,
        <ore:ingotThallium>,
        <ore:ingotLead>,
        <ore:ingotBismuth>,
        <ore:ingotPolonium>,
        <ore:ingotAstatine>,
        <ore:ingotRadon>,
        <ore:ingotFrancium>,
        <ore:ingotRadium>,
        <ore:ingotActinium>,
        <ore:ingotThorium>,
        <ore:ingotProtactinium>,
        <ore:ingotUranium>,
        <ore:ingotNeptunium>,
        <ore:ingotPlutonium>,
        <ore:ingotAmericium>,
        <ore:ingotCurium>,
        <ore:ingotBerkelium>,
        <ore:ingotCalifornium>,
        <ore:ingotEinsteinium>,
        <ore:ingotFermium>,
        <ore:ingotMendelevium>,
        <ore:ingotNobelium>,
        <ore:ingotLawrencium>,
        <ore:ingotRutherfordium>,
        <ore:ingotDubnium>,
        <ore:ingotSeaborgium>,
        <ore:ingotBohrium>,
        <ore:ingotHassium>,
        <ore:ingotMeitnerium>,
        <ore:ingotDarmstadtium>,
        <ore:ingotRoentgenium>,
        <ore:ingotCopernicium>,
        <ore:ingotNihonium>,
        <ore:ingotFlerovium>,
        <ore:ingotMoscovium>,
        <ore:ingotLivermorium>,
        <ore:ingotTennessine>,
        <ore:ingotOganesson>
    ])
    .addEnergyPerTickInput(2147483647)
    .addItemOutput(<additions:extraelement_ingot> * 8)
    .build();