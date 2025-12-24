/*
 * This script is created for the GreedyCraft by 咕咕咕 and mc_Edwin.
 * 你知道湮灭媒介之类的得一个个手搓有多麻烦吗(恼)
 * 给你一拳
 */

#priority 20

import crafttweaker.oredict.IOreDictEntry;
import crafttweaker.item.IItemStack;
import crafttweaker.data.IData;
import crafttweaker.item.IIngredient;
import crafttweaker.liquid.ILiquidStack;
import crafttweaker.entity.IEntityDefinition;
import crafttweaker.util.Position3f;

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
import mods.modularmachinery.IngredientArrayPrimer;
import mods.modularmachinery.IngredientArrayBuilder;
import mods.modularmachinery.MMEvents;
import mods.ctutils.utils.Math;

MachineModifier.setMaxParallelism("abyss_ceremony_executant", 256);
MachineModifier.setInternalParallelism("abyss_ceremony_executant", 1);
MachineModifier.setMaxThreads("abyss_ceremony_executant", 8);

$expand RecipePrimer$addSacrificeInput() {
    this.addIngredientArrayInput(IngredientArrayBuilder.newBuilder()
        .addIngredients([
            <minecraft:spawn_egg>.withTag({EntityTag: {id: "minecraft:sheep"}}),
            <minecraft:spawn_egg>.withTag({EntityTag: {id: "minecraft:cow"}}),
            <minecraft:spawn_egg>.withTag({EntityTag: {id: "minecraft:chicken"}}),
            <minecraft:spawn_egg>.withTag({EntityTag: {id: "minecraft:pig"}})
        ])
    );
}

function addRitualRecipe(output as IItemStack, inputs as IIngredient[], potEnergy as int, dim as int, sacrifice as bool) {
    var builder = RecipeBuilder.newBuilder(output.definition.id ~ (output.metadata as string), "abyss_ceremony_executant", 200);
    var pe as int = Math.floor(0.0144d * potEnergy) as int;
    builder.addFluidInput(<liquid:pe> * pe);
    for input in inputs {
        builder.addItemInput(input);
    }
    builder.addItemOutput(output);
    builder.addEnergyPerTickInput(4096);
    if (dim != -1) {
        builder.addDimensionInput(dim);
    }
    if (sacrifice) {
        builder.addSacrificeInput();
    }
    builder.build();
}

MMEvents.onControllerGUIRender("abyss_ceremony_executant", function(event as ControllerGUIRenderEvent) {
    var info as string[] = ["§a///深渊仪式执行者控制面板///", "§a机器名称：§eLV3 - 深渊仪式执行者"];
    event.extraInfo = info;
});

addRitualRecipe(<abyssalcraft:transmutationgem>, [
    <ore:dustBlaze> * 4,
    <ore:gemDiamond> * 2,
    <ore:enderpearl> * 2,
    <ore:materialCoraliumPearl>
], 300, -1, false);

addRitualRecipe(<abyssalcraft:oc>, [
    <ore:dustRedstone> * 4,
    <abyssalcraft:oblivionshard> * 4,
    <ore:pearlEnderEye>
], 5000, -1, true);

addRitualRecipe(<abyssalcraft:gatewaykeydl>, [
    <abyssalcraft:transmutationgem>,
    <abyssalcraft:eoa>,
    <abyssalcraft:gatewaykey>
], 10000, 50, false);

addRitualRecipe(<abyssalcraft:dreadaltarbottom>, [
    <abyssalcraft:stone:2> * 2,
    <ore:bone> * 2,
    <ore:ingotDreadium> * 2,
    <abyssalcraft:dreadcloth>,
    <abyssalcraft:gatewaykeydl>
], 20000, 51, true);

addRitualRecipe(<abyssalcraft:dreadaltartop>, [
    <ore:stickWood> * 2,
    <minecraft:bucket>,
    <abyssalcraft:dreadcloth> * 3,
    <ore:ingotDreadium> * 2
], 20000, 51, true);

addRitualRecipe(<abyssalcraft:interdimensionalcage>, [
    <ore:barsIron> * 8,
    <abyssalcraft:oblivionshard>
], 1000, -1, false);

addRitualRecipe(<abyssalcraft:configurator>, [
    <abyssalcraft:configurator_shard:*> * 4,
    <abyssalcraft:lifecrystal>
], 5000, -1, false);

addRitualRecipe(<abyssalcraft:spirit_altar>, [
    <abyssalcraft:cobblestone> * 5,
    <ore:ingotGold> * 3,
    <ore:gemShadow>
], 1000, 32767, true);

addRitualRecipe(<abyssalcraft:statue>, [
    <abyssalcraft:shoggothflesh> * 5,
    <abyssalcraft:essence>,
    <abyssalcraft:essence:1>,
    <abyssalcraft:essence:2>,
    <abyssalcraft:stone:7>
], 20000, -1, true);

addRitualRecipe(<abyssalcraft:statue:1>, [
    <abyssalcraft:shoggothflesh:1> * 5,
    <abyssalcraft:essence>,
    <abyssalcraft:essence:1>,
    <abyssalcraft:essence:2>,
    <abyssalcraft:stone:7>
], 20000, -1, true);

addRitualRecipe(<abyssalcraft:statue:2>, [
    <abyssalcraft:eldritchscale> * 5,
    <abyssalcraft:essence>,
    <abyssalcraft:essence:1>,
    <abyssalcraft:essence:2>,
    <abyssalcraft:stone:7>
], 20000, -1, true);

addRitualRecipe(<abyssalcraft:statue:3>, [
    <abyssalcraft:shoggothflesh:1> * 5,
    <abyssalcraft:essence>,
    <abyssalcraft:essence:1>,
    <abyssalcraft:essence:2>,
    <abyssalcraft:stone:7>
], 20000, -1, true);

addRitualRecipe(<abyssalcraft:statue:4>, [
    <abyssalcraft:shoggothflesh:2> * 5,
    <abyssalcraft:essence>,
    <abyssalcraft:essence:1>,
    <abyssalcraft:essence:2>,
    <abyssalcraft:stone:7>
], 20000, -1, true);

addRitualRecipe(<abyssalcraft:statue:5>, [
    <abyssalcraft:shoggothflesh:3> * 5,
    <abyssalcraft:essence>,
    <abyssalcraft:essence:1>,
    <abyssalcraft:essence:2>,
    <abyssalcraft:stone:7>
], 20000, -1, true);

addRitualRecipe(<abyssalcraft:statue:6>, [
    <abyssalcraft:shoggothflesh:4> * 5,
    <abyssalcraft:essence>,
    <abyssalcraft:essence:1>,
    <abyssalcraft:essence:2>,
    <abyssalcraft:stone:7>
], 20000, -1, true);

addRitualRecipe(<abyssalcraft:ethaxiumingot>, [
    <ore:ingotEthaxiumBrick> * 4,
    <abyssalcraft:lifecrystal>
], 1000, 52, false);

addRitualRecipe(<abyssalcraft:tieredenergypedestal>, [
    <ore:gemCoralium> * 2,
    <abyssalcraft:cobblestone> * 2,
    <ore:cobblestone> * 2,
    <abyssalcraft:shadowshard> * 2,
    <abyssalcraft:energypedestal>
], 400, -1, false);

addRitualRecipe(<abyssalcraft:tieredenergypedestal:1>, [
    <ore:gemCoralium> * 2,
    <abyssalcraft:abybrick> * 2,
    <abyssalcraft:cstonebrick> * 2,
    <abyssalcraft:shadowshard> * 2,
    <abyssalcraft:tieredenergypedestal>
], 800, -1, false);

addRitualRecipe(<abyssalcraft:tieredenergypedestal:2>, [
    <ore:gemCoralium> * 2,
    <abyssalcraft:dreadbrick> * 2,
    <abyssalcraft:abydreadbrick> * 2,
    <abyssalcraft:shadowshard> * 2,
    <abyssalcraft:tieredenergypedestal:1>
], 1200, -1, false);

addRitualRecipe(<abyssalcraft:tieredenergypedestal:3>, [
    <ore:gemCoralium> * 2,
    <abyssalcraft:ethaxiumbrick> * 2,
    <abyssalcraft:darkethaxiumbrick> * 2,
    <abyssalcraft:shadowshard> * 2,
    <abyssalcraft:tieredenergypedestal:2>
], 1600, -1, false);

addRitualRecipe(<abyssalcraft:tieredsacrificialaltar>, [
    <ore:gemCoralium> * 2,
    <abyssalcraft:cobblestone> * 2,
    <ore:cobblestone> * 2,
    <abyssalcraft:shadowshard> * 2,
    <abyssalcraft:sacrificialaltar>
], 400, -1, false);

addRitualRecipe(<abyssalcraft:tieredsacrificialaltar:1>, [
    <ore:gemCoralium> * 2,
    <abyssalcraft:abybrick> * 2,
    <abyssalcraft:cstonebrick> * 2,
    <abyssalcraft:shadowshard> * 2,
    <abyssalcraft:tieredsacrificialaltar>
], 800, -1, false);

addRitualRecipe(<abyssalcraft:tieredsacrificialaltar:2>, [
    <ore:gemCoralium> * 2,
    <abyssalcraft:dreadbrick> * 2,
    <abyssalcraft:abydreadbrick> * 2,
    <abyssalcraft:shadowshard> * 2,
    <abyssalcraft:tieredsacrificialaltar:1>
], 1200, -1, false);

addRitualRecipe(<abyssalcraft:tieredsacrificialaltar:3>, [
    <ore:gemCoralium> * 2,
    <abyssalcraft:ethaxiumbrick> * 2,
    <abyssalcraft:darkethaxiumbrick> * 2,
    <abyssalcraft:shadowshard> * 2,
    <abyssalcraft:tieredsacrificialaltar:2>
], 1600, -1, false);

addRitualRecipe(<abyssalcraft:tieredenergycollector>, [
    <ore:gemCoralium> * 2,
    <abyssalcraft:cobblestone> * 2,
    <ore:cobblestone> * 2,
    <abyssalcraft:shadowshard> * 2,
    <abyssalcraft:energycollector>
], 400, -1, false);

addRitualRecipe(<abyssalcraft:tieredenergycollector:1>, [
    <ore:gemCoralium> * 2,
    <abyssalcraft:abybrick> * 2,
    <abyssalcraft:cstonebrick> * 2,
    <abyssalcraft:shadowshard> * 2,
    <abyssalcraft:tieredenergycollector>
], 800, -1, false);

addRitualRecipe(<abyssalcraft:tieredenergycollector:2>, [
    <ore:gemCoralium> * 2,
    <abyssalcraft:dreadbrick> * 2,
    <abyssalcraft:abydreadbrick> * 2,
    <abyssalcraft:shadowshard> * 2,
    <abyssalcraft:tieredenergycollector:1>
], 1200, -1, false);

addRitualRecipe(<abyssalcraft:tieredenergycollector:3>, [
    <ore:gemCoralium> * 2,
    <abyssalcraft:ethaxiumbrick> * 2,
    <abyssalcraft:darkethaxiumbrick> * 2,
    <abyssalcraft:shadowshard> * 2,
    <abyssalcraft:tieredenergycollector:2>
], 1600, -1, false);

addRitualRecipe(<abyssalcraft:tieredenergyrelay>, [
    <ore:gemCoralium> * 2,
    <abyssalcraft:cobblestone> * 2,
    <ore:cobblestone> * 2,
    <abyssalcraft:shadowshard> * 2,
    <abyssalcraft:energyrelay>
], 400, -1, false);

addRitualRecipe(<abyssalcraft:tieredenergyrelay:1>, [
    <ore:gemCoralium> * 2,
    <abyssalcraft:abybrick> * 2,
    <abyssalcraft:cstonebrick> * 2,
    <abyssalcraft:shadowshard> * 2,
    <abyssalcraft:tieredenergyrelay>
], 800, -1, false);

addRitualRecipe(<abyssalcraft:tieredenergyrelay:2>, [
    <ore:gemCoralium> * 2,
    <abyssalcraft:dreadbrick> * 2,
    <abyssalcraft:abydreadbrick> * 2,
    <abyssalcraft:shadowshard> * 2,
    <abyssalcraft:tieredenergyrelay:1>
], 1200, -1, false);

addRitualRecipe(<abyssalcraft:tieredenergyrelay:3>, [
    <ore:gemCoralium> * 2,
    <abyssalcraft:ethaxiumbrick> * 2,
    <abyssalcraft:darkethaxiumbrick> * 2,
    <abyssalcraft:shadowshard> * 2,
    <abyssalcraft:tieredenergyrelay:2>
], 1600, -1, false);

addRitualRecipe(<abyssalcraft:energycontainer>, [
    <abyssalcraft:energycollector> * 4,
    <abyssalcraft:shadowshard> * 4,
    <abyssalcraft:energypedestal>
], 100, -1, false);

addRitualRecipe(<abyssalcraft:tieredenergycontainer>, [
    <ore:gemCoralium> * 2,
    <abyssalcraft:cobblestone> * 2,
    <ore:cobblestone> * 2,
    <abyssalcraft:shadowshard> * 2,
    <abyssalcraft:energycontainer>
], 400, -1, false);

addRitualRecipe(<abyssalcraft:tieredenergycontainer:1>, [
    <ore:gemCoralium> * 2,
    <abyssalcraft:abybrick> * 2,
    <abyssalcraft:cstonebrick> * 2,
    <abyssalcraft:shadowshard> * 2,
    <abyssalcraft:tieredenergycontainer>
], 800, -1, false);

addRitualRecipe(<abyssalcraft:tieredenergycontainer:2>, [
    <ore:gemCoralium> * 2,
    <abyssalcraft:dreadbrick> * 2,
    <abyssalcraft:abydreadbrick> * 2,
    <abyssalcraft:shadowshard> * 2,
    <abyssalcraft:tieredenergycontainer:1>
], 1200, -1, false);

addRitualRecipe(<abyssalcraft:tieredenergycontainer:3>, [
    <ore:gemCoralium> * 2,
    <abyssalcraft:ethaxiumbrick> * 2,
    <abyssalcraft:darkethaxiumbrick> * 2,
    <abyssalcraft:shadowshard> * 2,
    <abyssalcraft:tieredenergycontainer:2>
], 1600, -1, false);

addRitualRecipe(<abyssalcraft:drainstaff:1>, [
    <abyssalcraft:drainstaff>,
    <abyssalcraft:stone:1> * 4,
    <abyssalcraft:corflesh> * 3,
    <ore:gemShadow>
], 1000, 50, false);

addRitualRecipe(<abyssalcraft:drainstaff:2>, [
    <abyssalcraft:drainstaff:1>,
    <abyssalcraft:stone:2> * 4,
    <abyssalcraft:dreadfragment> * 3,
    <ore:gemShadow>
], 2000, 51, false);

addRitualRecipe(<abyssalcraft:drainstaff:3>, [
    <abyssalcraft:drainstaff:2>,
    <abyssalcraft:stone:6> * 4,
    <abyssalcraft:omotholflesh> * 3,
    <ore:gemShadow>
], 3000, 52, false);

addRitualRecipe(<abyssalcraft:staff>, [
    <abyssalcraft:drainstaff:3>,
    <abyssalcraft:essence>,
    <abyssalcraft:essence:1>,
    <abyssalcraft:essence:2>,
    <abyssalcraft:eldritchscale> * 2,
    <ore:ingotEthaxium> * 2,
    <abyssalcraft:gatewaykeyjzh>
], 15000, 52, false);

addRitualRecipe(<abyssalcraft:scroll>, [
    <minecraft:book> * 4
], 100, -1, false);

addRitualRecipe(<abyssalcraft:scroll:1>, [
    <minecraft:book> * 2,
    <abyssalcraft:wastelandsthorn>,
    <abyssalcraft:luminousthistle>
], 1000, -1, false);

addRitualRecipe(<abyssalcraft:scroll:2>, [
    <minecraft:book> * 2,
    <abyssalcraft:dreadshard>,
    <abyssalcraft:dreadfragment>
], 2000, -1, false);

addRitualRecipe(<abyssalcraft:abyore>, [
    <ore:oreIron>,
    <abyssalcraft:shadowshard> * 8
], 500, -1, false);

addRitualRecipe(<abyssalcraft:psdl>, [
    <ore:blockLiquifiedCoralium>,
    <abyssalcraft:powerstonetracker> * 8
], 10000, -1, true);

addRitualRecipe(<gct_ores:door_key_empty>, [
    <abyssalcraft:gatewaykey>,
    <ore:itemDarkMatter> * 8
], 10000, -1, false);

addRitualRecipe(<gct_ores:door_key_empty>, [
    <abyssalcraft:gatewaykeydl>,
    <ore:itemDarkMatter> * 8
], 10000, -1, false);

addRitualRecipe(<gct_ores:door_key_empty>, [
    <abyssalcraft:gatewaykeyjzh>,
    <ore:itemDarkMatter> * 8
], 10000, -1, false);

addRitualRecipe(<gct_ores:door_key_of_orderland>, [
    <ore:ingotCosmilite>,
    <ore:blockEverite>,
    <ore:blockDraconiumRuled>,
    <ore:blockWitheriumEquipment>,
    <ore:coreChaotic>,
    <ore:coreStormy>,
    <ore:ingotBalancedMatrix> * 2
], 100000, 53, true);

addRitualRecipe(<gct_aby:ancientmud>, [
    <ore:slimeball>,
    <ore:blockEthaxium>,
    <ore:blockSanite>,
    <gct_aby:essenceofdarkerrealm> * 2,
    <gct_aby:shoggothtancale> * 4
], 50000, 53, true);

addRitualRecipe(<thebetweenlands:swamp_talisman>, [
    <gct_ores:door_key_empty> * 4,
    <thebetweenlands:swamp_talisman:1>,
    <thebetweenlands:swamp_talisman:2>,
    <thebetweenlands:swamp_talisman:3>,
    <thebetweenlands:swamp_talisman:4>
], 100010, -1, false);

addRitualRecipe(<additions:living_fire>, [
    <ore:ingotFlamium> * 2,
    <ore:ingotMoltenium> * 2,
    <ore:ingotEvilMetal> * 2,
    <ore:ingotInfernium> * 2,
    <ore:ingotStellarium>
], 64000, -1, false);

addRitualRecipe(<gct_aby:key_of_warped>, [
    <ore:ingotCthulhurite> * 4,
    <gct_aby:shoggothtooth> * 2,
    <gct_ores:door_key_empty> * 2
], 100010, -1, false);

addRitualRecipe(<gct_aby:key_of_warped_active>, [
    <thebetweenlands:spirit_fruit>,
    <ore:ingotBalancedMatrix>,
    <ore:ingotCosmilite>,
    <gct_aby:key_of_warped>
], 100010, -1, true);

addRitualRecipe(<gct_aby:solid_pot_energy>, [
    <additions:sanite_ethaxium_capsule>
], 90000, -1, false);

addRitualRecipe(<additions:abyssine_block>, [
    <ore:ingotAzathothium>,
    <ore:ingotNyarlathotepium>,
    <ore:ingotYogsothothium>,
    <ore:ingotShubniggurathium>,
    <ore:ingotHusturite>,
    <ore:ingotCthughate>,
    <ore:ingotCthulhurite>,
    <ore:ingotBalancedMatrix> * 2
], 50000, -1, true);

addRitualRecipe(<gct_aby:eye_of_abyss>, [
    <ore:ingotFinallium>,
    <additions:awakened_eye>,
    <thaumadditions:adaminite_fabric>,
    <abyssalcraft:essence>,
    <abyssalcraft:essence:1>,
    <abyssalcraft:essence:2>,
    <gct_aby:essenceofdarkrealm>,
    <gct_aby:essenceofdarkerrealm>,
    <gct_aby:essence_of_warped_ruin>
], 100000, -1, true);

addRitualRecipe(<elementalend:void_eye>, [
    <abyssalcraft:stone> * 4,
    <ore:ingotLiquifiedCoralium> * 2,
    <ore:ingotDreadium> * 2,
    <ore:pearlEnderEye>
], 10000, -1, false);