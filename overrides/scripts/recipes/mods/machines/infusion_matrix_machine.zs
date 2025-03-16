/*
 * This script is created for the GreedyCraft Tweaks by 例外.
 */
 
#priority 20

import crafttweaker.data.IData;
import crafttweaker.item.IIngredient;

import mods.modularmachinery.RecipeBuilder;
import mods.modularmachinery.RecipeCheckEvent;
import mods.modularmachinery.FactoryRecipeStartEvent;
import mods.modularmachinery.RecipeModifierBuilder;
import mods.modularmachinery.MMEvents;
import mods.modularmachinery.MachineTickEvent;
import mods.modularmachinery.ControllerGUIRenderEvent;
import mods.modularmachinery.IMachineController;
import mods.modularmachinery.MachineModifier;
import mods.modularmachinery.SmartInterfaceType;
import mods.modularmachinery.FactoryRecipeThread;
import native.java.math.BigInteger;

import mods.modularmachinery.MachineUpgradeHelper;
import mods.modularmachinery.MachineUpgradeBuilder;

MachineModifier.setMaxParallelism("infusion_matrix_machine", 4);

MachineUpgradeHelper.registerSupportedItem(<additions:greedycraft-cursium_ingot>);
MachineUpgradeHelper.registerSupportedItem(<thaumadditions:mithminite_ingot>);

MachineUpgradeBuilder.newBuilder("thaumau", "§6模块化特化神秘研究证明1", 1 , 1)
    .addDescriptions(
        "§5证明你有制作咒缚锭的实力吧",
        "§5不对真的需要吗"
    )
    .addCompatibleMachines("infusion_matrix_machine")
    .buildAndRegister();
MachineUpgradeBuilder.newBuilder("thaumau_one", "§6模块化特化神秘研究证明2", 1, 1)
    .addDescriptions(
        "§5做一个看看实力",
        "§5做出来了？有实力"
    )
    .buildAndRegister();

MachineUpgradeHelper.addFixedUpgrade(<additions:greedycraft-cursium_ingot>, "thaumau");
MachineUpgradeHelper.addFixedUpgrade(<thaumadditions:mithminite_ingot>, "thaumau_one");

# 秘金锭
RecipeBuilder.newBuilder("thaumcraft", "infusion_matrix_machine", 500)
    .addItemInput(<packagedthaumic:clathrate_essence>.withTag({Aspect: "tempus"}) * 2000)
    .addItemInput(<packagedthaumic:clathrate_essence>.withTag({Aspect: "caeles"}) * 2000)
    .addItemInput(<packagedthaumic:clathrate_essence>.withTag({Aspect: "exitium"}) * 2000)
    .addItemInput(<packagedthaumic:clathrate_essence>.withTag({Aspect: "fluctus"}) * 2000)
    .addItemInput(<packagedthaumic:clathrate_essence>.withTag({Aspect: "coralos"}) * 2000)
    .addItemInput(<packagedthaumic:clathrate_essence>.withTag({Aspect: "dreadia"}) * 2000)
    .addItemInput(<thaumicwonders:alienist_stone>*2)
    .addItemInput(<additions:betwnite_ingot>*2)
    .addItemInput(<thaumicaugmentation:material:5>*2)
    .addItemInput(<thaumadditions:adaminite_fabric>*2)
    .addItemInput(<additions:cosmilite_ingot>)
    .addEnergyPerTickInput(100000000)
    .addRecipeTooltip("§1需要模块化特化神秘研究2")
    .addPostCheckHandler(function(event as RecipeCheckEvent){
        val ctrl = event.controller;

        if(!ctrl.hasMachineUpgrade("thaumau_one")){
            event.setFailed("缺少升级模块化特化神秘研究证明2");
            return;
        }
    })
    .addItemOutput(<thaumadditions:mithminite_ingot>)
    .build();
# 催生灯
RecipeBuilder.newBuilder("thaumcraft_2", "infusion_matrix_machine", 200)
    .addItemInput(<packagedthaumic:clathrate_essence>.withTag({Aspect: "herba"}) * 40)
    .addItemInput(<packagedthaumic:clathrate_essence>.withTag({Aspect: "lux"}) * 30)
    .addItemInput(<packagedthaumic:clathrate_essence>.withTag({Aspect: "victus"}) * 30)
    .addItemInput(<packagedthaumic:clathrate_essence>.withTag({Aspect: "instrumentum"})*30)
    .addItemInput(<thaumcraft:crystal_essence>.withTag({Aspects: [{amount: 1, key: "terra"}]}) * 2)
    .addItemInput(<thaumcraft:lamp_arcane>)
    .addItemInput(<minecraft:gold_ingot>*2)
    .addItemInput(<minecraft:dye:15>*2)
    .addEnergyPerTickInput(100000000)
    .addItemOutput(<thaumcraft:lamp_growth>)
    .build();
# 源质供应器
RecipeBuilder.newBuilder("thaumcraft_3", "infusion_matrix_machine", 200)
    .addItemInput(<packagedthaumic:clathrate_essence>.withTag({Aspect: "machina"}) * 100)
    .addItemInput(<packagedthaumic:clathrate_essence>.withTag({Aspect: "praecantatio"}) * 100)
    .addItemInput(<packagedthaumic:clathrate_essence>.withTag({Aspect: "permutatio"}) * 40)
    .addItemInput(<appliedenergistics2:interface>)
    .addItemInput(<thaumcraft:salis_mundus>*2)
    .addItemInput(<thaumicenergistics:coalescence_core>*2)
    .addEnergyPerTickInput(100000000)
    .addItemOutput(<thaumicenergistics:infusion_provider>)
    .build();
# 秘银锭
RecipeBuilder.newBuilder("thaumcraft_4", "infusion_matrix_machine", 600)
    .addItemInput(<packagedthaumic:clathrate_essence>.withTag({Aspect: "vitreus"}) * 800)
    .addItemInput(<packagedthaumic:clathrate_essence>.withTag({Aspect: "metallum"}) * 800)
    .addItemInput(<packagedthaumic:clathrate_essence>.withTag({Aspect: "potentia"}) * 640)
    .addItemInput(<packagedthaumic:clathrate_essence>.withTag({Aspect: "alienis"}) * 300)
    .addItemInput(<packagedthaumic:clathrate_essence>.withTag({Aspect: "praecantatio"}) * 300)
    .addItemInput(<packagedthaumic:clathrate_essence>.withTag({Aspect: "instrumentum"}) * 200)
    .addItemInput(<thaumcraft:primordial_pearl>*2).setChance(0.01)
    .addItemInput(<thaumicwonders:alchemist_stone>*2)
    .addItemInput(<thaumictinkerer:energetic_nitor>*2)
    .addItemInput(<thaumcraft:curio:1>*2)
    .addItemInput(<botania:manaresource:22>*2)
    .addItemInput(<additions:aeonsteel_ingot>)
    .addEnergyPerTickInput(100000000)
    .addRecipeTooltip("§1需要模块化特化神秘研究2")
    .addPostCheckHandler(function(event as RecipeCheckEvent){
        val ctrl = event.controller;

        if(!ctrl.hasMachineUpgrade("thaumau_one")){
            event.setFailed("§2缺少升级模块化特化神秘研究证明2");
            return;
        }
    })
    .addItemOutput(<thaumadditions:mithrillium_ingot>)
    .build();
# 四象之星
RecipeBuilder.newBuilder("thaumcraft_5", "infusion_matrix_machine", 500)
    .addItemInput(<packagedthaumic:clathrate_essence>.withTag({Aspect: "aversio"}) * 1000)
    .addItemInput(<packagedthaumic:clathrate_essence>.withTag({Aspect: "motus"}) * 1000)
    .addItemInput(<packagedthaumic:clathrate_essence>.withTag({Aspect: "vinculum"}) * 1000)
    .addItemInput(<packagedthaumic:clathrate_essence>.withTag({Aspect: "machina"}) * 1000)
    .addItemInput(<additions:greedycraft-solarium_star>)
    .addItemInput(<additions:greedycraft-canopy_star>)
    .addItemInput(<additions:greedycraft-ice_star>)
    .addItemInput(<additions:greedycraft-end_star>)
    .addEnergyPerTickInput(100000000)
    .addItemOutput(<additions:greedycraft-quardstate_star>)
    .build();
# 蓝图法杖
RecipeBuilder.newBuilder("thaumcraft_6", "infusion_matrix_machine", 200)
    .addItemInput(<packagedthaumic:clathrate_essence>.withTag({Aspect: "praecantatio"}) * 20)
    .addItemInput(<packagedthaumic:clathrate_essence>.withTag({Aspect: "instrumentum"}) * 20)
    .addItemInput(<packagedthaumic:clathrate_essence>.withTag({Aspect: "aversio"}) * 20)
    .addItemInput(<packagedthaumic:clathrate_essence>.withTag({Aspect: "auram"}) * 20)
    .addItemInput(<additions:greedycraft-blueprint>)
    .addItemInput(<thaumcraft:ingot>)
    .addItemInput(<thaumcraft:curio:1>)
    .addItemInput(<thaumcraft:mechanism_simple>)
    .addItemInput(<thaumcraft:vis_resonator>)
    .addEnergyPerTickInput(100000000)
    .addItemOutput(<additions:greedycraft-blueprint_wand>)
    .build();
# 源质水合物形成器
RecipeBuilder.newBuilder("thaumcraft_7", "infusion_matrix_machine", 200)
    .addItemInput(<packagedthaumic:clathrate_essence>.withTag({Aspect: "gelum"}) * 100)
    .addItemInput(<packagedthaumic:clathrate_essence>.withTag({Aspect: "machina"}) * 30)
    .addItemInput(<packagedthaumic:clathrate_essence>.withTag({Aspect: "aqua"}) * 20)
    .addItemInput(<packagedthaumic:clathrate_essence>.withTag({Aspect: "vitreus"}) * 10)
    .addItemInput(<packagedthaumic:clathrate_essence>.withTag({Aspect: "vinculum"}) * 10)
    .addItemInput(<packagedthaumic:porous_stone_plate>*2)
    .addItemInput(<thaumcraft:crucible>)
    .addItemInput(<thaumcraft:mechanism_simple>)
    .addItemInput(<thaumcraft:plate>*2)
    .addItemInput(<minecraft:packed_ice>*2)
    .addItemInput(<packagedthaumic:thaumic_package_component>)
    .addItemInput(<thaumcraft:morphic_resonator>)
    .addItemInput(<thaumcraft:everfull_urn>)
    .addEnergyPerTickInput(100000000)
    .addItemOutput(<packagedthaumic:clathrate_essence_former>)
   .build();
# 源质水合物实物化器
RecipeBuilder.newBuilder("thaumcraft_8", "infusion_matrix_machine", 200)
    .addItemInput(<packagedthaumic:clathrate_essence>.withTag({Aspect: "permutatio"}) * 100)
    .addItemInput(<packagedthaumic:clathrate_essence>.withTag({Aspect: "machina"}) * 100)
    .addItemInput(<packagedthaumic:clathrate_essence>.withTag({Aspect: "gelum"}) * 30)
    .addItemInput(<packagedthaumic:clathrate_essence>.withTag({Aspect: "alkimia"}) * 20)
    .addItemInput(<packagedthaumic:clathrate_essence>.withTag({Aspect: "vitreus"}) * 20)
    .addItemInput(<packagedthaumic:clathrate_essence_former>*4)
    .addItemInput(<appliedenergistics2:fluix_block>*2)
    .addItemInput(<thaumcraft:salis_mundus>)
    .addItemInput(<thaumcraft:mechanism_complex>)
    .addEnergyPerTickInput(100000000)
    .addItemOutput(<packagedthaumic:clathrate_essence_materializer>)
    .build();
# 天灾金属锭
RecipeBuilder.newBuilder("thaumcraft_9", "infusion_matrix_machine", 500)
    .addItemInput(<packagedthaumic:clathrate_essence>.withTag({Aspect: "herba"}) * 754)
    .addItemInput(<packagedthaumic:clathrate_essence>.withTag({Aspect: "vitium"}) * 600)
    .addItemInput(<packagedthaumic:clathrate_essence>.withTag({Aspect: "tenebrae"}) * 600)
    .addItemInput(<packagedthaumic:clathrate_essence>.withTag({Aspect: "draco"}) * 300)
    .addItemInput(<packagedthaumic:clathrate_essence>.withTag({Aspect: "coralos"}) * 300)
    .addItemInput(<packagedthaumic:clathrate_essence>.withTag({Aspect: "dreadia"}) * 300)
    .addItemInput(<tconevo:metal:20>)
    .addItemInput(<thaumicaugmentation:material:3>)
    .addItemInput(<thaumadditions:adaminite_ingot>)
    .addItemInput(<thaumicaugmentation:elytra_harness>)
    .addItemInput(<sakura:futon>)
    .addItemInput(<minecraft:bed:11>)
    .addItemInput(<tconevo:metal_block:1>)
    .addItemInput(<cfm:modern_bed_bottom:11>)
    .addItemInput(<taiga:nihilite_ingot>)
    .addEnergyPerTickInput(100000000)
    .addRecipeTooltip("§1需要模块化特化神秘研究2")
    .addPostCheckHandler(function(event as RecipeCheckEvent){
        val ctrl = event.controller;

        if(!ctrl.hasMachineUpgrade("thaumau_one")){
            event.setFailed("缺少升级模块化特化神秘研究证明2");
            return;
        }
    })
    .addItemOutput(<additions:link-disaster_metal_ingot>)
    .build();
# 元动能量单元
RecipeBuilder.newBuilder("infusion_matrix_machine0", "infusion_matrix_machine", 400)
    .addItemInput(<packagedthaumic:clathrate_essence>.withTag({Aspect: "potentia"}) * 200)
    .addItemInput(<packagedthaumic:clathrate_essence>.withTag({Aspect: "vacuos"}) * 100)
    .addItemInput(<packagedthaumic:clathrate_essence>.withTag({Aspect: "alienis"}) * 100)
    .addItemInput(<thaumcraft:crystal_essence>.withTag({Aspects: [{amount: 1, key: "alienis"}]}))
    .addItemInput(<thaumcraft:amber>)
    .addItemInput(<thaumcraft:plate:3>*4)
    .addItemInput(<thaumcraft:primordial_pearl>).setChance(0.01)
    .addItemInput(<minecraft:redstone>)
    .addItemInput(<thaumcraft:void_seed>)
    .addEnergyPerTickInput(100000000)
    .addItemOutput(<thaumicaugmentation:material:3>)
    .build();
# 邪术钢锭
RecipeBuilder.newBuilder("infusion_matrix_machine1", "infusion_matrix_machine", 400)
    .addItemInput(<packagedthaumic:clathrate_essence>.withTag({Aspect: "vitium"}) * 480)
    .addItemInput(<packagedthaumic:clathrate_essence>.withTag({Aspect: "metallum"}) * 320)
    .addItemInput(<packagedthaumic:clathrate_essence>.withTag({Aspect: "praecantatio"}) * 240)
    .addItemInput(<packagedthaumic:clathrate_essence>.withTag({Aspect: "instrumentum"}) * 240)
    .addItemInput(<additions:greedycraft-eldritch_slime>*4)
    .addItemInput(<additions:greedycraft-corruptium_ingot>)
    .addEnergyPerTickInput(100000000)
    .addRecipeTooltip("§1需要模块化特化神秘研究1")
    .addPostCheckHandler(function(event as RecipeCheckEvent){
        val ctrl = event.controller;

        if(!ctrl.hasMachineUpgrade("thaumau")){
            event.setFailed("§2缺少升级模块化特化神秘研究证明1");
            return;
        }
    })
    .addItemOutput(<additions:greedycraft-eldritch_steel_ingot>)
    .build();
# 1g——me源质存储元件
RecipeBuilder.newBuilder("infusion_matrix_machine3", "infusion_matrix_machine", 1000)
    .addItemInput(<packagedthaumic:clathrate_essence>.withTag({Aspect: "caeles"}) * 10000)
    .addItemInput(<packagedthaumic:clathrate_essence>.withTag({Aspect: "praecantatio"}) * 10000)
    .addItemInput(<packagedthaumic:clathrate_essence>.withTag({Aspect: "desiderium"}) * 10000)
    .addItemInput(<packagedthaumic:clathrate_essence>.withTag({Aspect: "machina"}) * 10000)
    .addItemInput(<additions:greedycraft-creative_shard>*4)
    .addItemInput(<gct_ores:order_crystal>)
    .addItemInput(<thaumicaugmentation:material:3>)
    .addItemInput(<additions:mekaddon-arcane_control_circuit>)
    .addItemInput(<thaumicenergistics:essentia_component_64k>)
    .addItemInput(<additions:greedycraft-extended_primal_metal_ingot>)
    .addEnergyPerTickInput(100000000)
    .addItemOutput(<thaumicenergistics:essentia_cell_1048576k>.withTag({filter: {}}))
    .build();
# 质能转换核心
RecipeBuilder.newBuilder("infusion_matrix_machine4", "infusion_matrix_machine", 400)
    .addItemInput(<packagedthaumic:clathrate_essence>.withTag({Aspect: "permutatio"}) * 100)
    .addItemInput(<packagedthaumic:clathrate_essence>.withTag({Aspect: "alienis"}) * 100)
    .addItemInput(<packagedthaumic:clathrate_essence>.withTag({Aspect: "praecantatio"}) * 100)
    .addItemInput(<packagedthaumic:clathrate_essence>.withTag({Aspect: "alkimia"}) * 100)
    .addItemInput(<packagedthaumic:clathrate_essence>.withTag({Aspect: "auram"}) * 100)
    .addItemInput(<packagedthaumic:clathrate_essence>.withTag({Aspect: "desiderium"}) *100)
    .addItemInput(<projecte:item.pe_philosophers_stone>.withTag({}))
    .addItemInput(<abyssalcraft:oc>)
    .addItemInput(<abyssalcraft:transmutationgem>).setChance(0.05)
    .addItemInput(<additions:greedycraft-matter_block>)
    .addItemInput(<appliedenergistics2:material:47>)
    .addItemInput(<projecte:item.pe_matter:1>)
    .addItemInput(<mekanism:controlcircuit:3>)
    .addItemInput(<additions:chromasteel_ingot>)
    .addItemInput(<thaumcraft:causality_collapser>)
    .addEnergyPerTickInput(100000000)
    .addItemOutput(<additions:greedycraft-energy_matter_core>)
    .build();
# 异形之石
RecipeBuilder.newBuilder("infusion_matrix_machine5", "infusion_matrix_machine", 400)
    .addItemInput(<packagedthaumic:clathrate_essence>.withTag({Aspect: "metallum"}) * 200)
    .addItemInput(<packagedthaumic:clathrate_essence>.withTag({Aspect: "vitium"}) * 200)
    .addItemInput(<packagedthaumic:clathrate_essence>.withTag({Aspect: "alkimia"}) * 50)
    .addItemInput(<thaumcraft:primordial_pearl>).setChance(0.01)
    .addItemInput(<thaumcraft:cluster:3>)
    .addItemInput(<thaumcraft:cluster:5>)
    .addItemInput(<thaumcraft:cluster:6>)
    .addItemInput(<thaumcraft:cluster>)
    .addItemInput(<thaumcraft:cluster:1>)
    .addItemInput(<thaumcraft:cluster:2>)
    .addItemInput(<thaumcraft:cluster:4>)
    .addItemInput(<thaumicwonders:alchemist_stone>)
    .addEnergyPerTickInput(100000000)
    .addItemOutput(<thaumicwonders:alienist_stone>)
    .build();
# 奥法鞘翅
RecipeBuilder.newBuilder("infusion_matrix_machine6", "infusion_matrix_machine", 400)
    .addItemInput(<packagedthaumic:clathrate_essence>.withTag({Aspect: "motus"}) * 150)
    .addItemInput(<packagedthaumic:clathrate_essence>.withTag({Aspect: "potentia"}) * 100)
    .addItemInput(<packagedthaumic:clathrate_essence>.withTag({Aspect: "volatus"}) * 100)
    .addItemInput(<thaumcraft:plate:3>)
    .addItemInput(<minecraft:elytra>.withTag({}))
    .addItemInput(<minecraft:feather>)
    .addItemInput(<thaumcraft:vis_resonator>)
    .addItemInput(<thaumicaugmentation:material:4>)
    .addEnergyPerTickInput(100000000)
    .addItemOutput(<thaumicaugmentation:elytra_harness>)
    .build();
# 悖论物质
RecipeBuilder.newBuilder("infusion_matrix_machine7", "infusion_matrix_machine", 400)
    .addItemInput(<packagedthaumic:clathrate_essence>.withTag({Aspect: "alienis"}) * 100)
    .addItemInput(<packagedthaumic:clathrate_essence>.withTag({Aspect: "vitium"}) * 100)
    .addItemInput(<thaumcraft:nitor_yellow>*2)
    .addItemInput(<minecraft:tnt>)
    .addItemInput(<thaumcraft:vis_resonator>)
    .addItemInput(<thaumcraft:morphic_resonator>)
    .addItemInput(<minecraft:redstone_block>*2)
    .addItemInput(<thaumcraft:alumentum>*2)
    .addEnergyPerTickInput(100000000)
    .addItemOutput(<thaumcraft:causality_collapser>)
    .build();
# 咒缚锭
RecipeBuilder.newBuilder("infusion_matrix_machine8", "infusion_matrix_machine", 600)
    .addItemInput(<packagedthaumic:clathrate_essence>.withTag({Aspect: "alkimia"}) * 1500)
    .addItemInput(<packagedthaumic:clathrate_essence>.withTag({Aspect: "vitium"}) * 1500)
    .addItemInput(<packagedthaumic:clathrate_essence>.withTag({Aspect: "alienis"}) * 1500)
    .addItemInput(<packagedthaumic:clathrate_essence>.withTag({Aspect: "auram"}) * 1500)
    .addItemInput(<packagedthaumic:clathrate_essence>.withTag({Aspect: "aversio"}) * 1500)
    .addItemInput(<packagedthaumic:clathrate_essence>.withTag({Aspect: "cognitio"}) * 1500)
    .addItemInput(<packagedthaumic:clathrate_essence>.withTag({Aspect: "desiderium"}) * 1500)
    .addItemInput(<packagedthaumic:clathrate_essence>.withTag({Aspect: "fabrico"}) * 1500)
    .addItemInput(<packagedthaumic:clathrate_essence>.withTag({Aspect: "humanus"}) * 1500)
    .addItemInput(<packagedthaumic:clathrate_essence>.withTag({Aspect: "machina"}) * 1500)
    .addItemInput(<packagedthaumic:clathrate_essence>.withTag({Aspect: "praemunio"}) * 1500)
    .addItemInput(<packagedthaumic:clathrate_essence>.withTag({Aspect: "sensus"}) * 1500)
    .addItemInput(<additions:greedycraft-eldritch_steel_ingot>*4)
    .addItemInput(<additions:greedycraft-impetusite_ingot>*2)
    .addItemInput(<additions:greedycraft-extended_primal_metal_ingot>*2)
    .addItemInput(<additions:bloody-darkest_core>*2)
    .addItemInput(<gct_ores:equipment_witherium_ingot>)
    .addItemInput(<gct_ores:balanced_matrix_ingot>)
    .addItemInput(<gct_ores:ruled_draconium_ingot>)
    .addEnergyPerTickInput(100000000)
    .addRecipeTooltip("§1需要模块化特化神秘研究1")
    .addPostCheckHandler(function(event as RecipeCheckEvent){
        val ctrl = event.controller;

        if(!ctrl.hasMachineUpgrade("thaumau")){
            event.setFailed("§2缺少升级模块化特化神秘研究证明1");
            return;
        }
    })
    .addItemOutput(<additions:greedycraft-cursium_ingot>)
    .build();
# 虚空种子
RecipeBuilder.newBuilder("infusion_matrix_machine9", "infusion_matrix_machine", 400)
    .addItemInput(<packagedthaumic:clathrate_essence>.withTag({Aspect: "tenebrae"}) * 200)
    .addItemInput(<packagedthaumic:clathrate_essence>.withTag({Aspect: "aer"}) * 40)
    .addItemInput(<packagedthaumic:clathrate_essence>.withTag({Aspect: "aqua"}) * 40)
    .addItemInput(<packagedthaumic:clathrate_essence>.withTag({Aspect: "ordo"}) * 40)
    .addItemInput(<packagedthaumic:clathrate_essence>.withTag({Aspect: "perditio"}) * 40)
    .addItemInput(<packagedthaumic:clathrate_essence>.withTag({Aspect: "ignis"}) * 40)
    .addItemInput(<packagedthaumic:clathrate_essence>.withTag({Aspect: "terra"}) * 40)
    .addItemInput(<packagedthaumic:clathrate_essence>.withTag({Aspect: "caeles"}) * 20)
    .addItemInput(<minecraft:wheat_seeds>)
    .addItemInput(<thaumcraft:primordial_pearl>).setChance(0.01)
    .addItemInput(<thaumcraft:metal_void>)
    .addItemInput(<thaumcraft:salis_mundus>)
    .addItemInput(<thaumcraft:void_seed>*3)
    .addEnergyPerTickInput(100000000)
    .addItemOutput(<thaumadditions:void_seed>)
    .build();
# 铿金锭
RecipeBuilder.newBuilder("thaumcraft_20", "infusion_matrix_machine", 500)
    .addItemInput(<packagedthaumic:clathrate_essence>.withTag({Aspect: "draco"}) * 1400)
    .addItemInput(<packagedthaumic:clathrate_essence>.withTag({Aspect: "infernum"}) * 900)
    .addItemInput(<packagedthaumic:clathrate_essence>.withTag({Aspect: "visum"}) * 800)
    .addItemInput(<packagedthaumic:clathrate_essence>.withTag({Aspect: "ordo"}) * 640)
    .addItemInput(<packagedthaumic:clathrate_essence>.withTag({Aspect: "spiritus"}) * 480)
    .addItemInput(<packagedthaumic:clathrate_essence>.withTag({Aspect: "cognitio"}) * 400)
    .addItemInput(<packagedthaumic:clathrate_essence>.withTag({Aspect: "alkimia"}) * 400)
    .addItemInput(<packagedthaumic:clathrate_essence>.withTag({Aspect: "fabrico"}) * 240)
    .addItemInput(<thaumadditions:mithrillium_resonator>*2)
    .addItemInput(<thaumicwonders:primordial_grain>*4)
    .addItemInput(<gct_ores:relifed_witherium_ingot>)
    .addItemInput(<thaumadditions:zeith_fur>*2)
    .addItemInput(<draconicevolution:draconic_ingot>)
    .addItemInput(<additions:chromasteel_ingot>)
    .addEnergyPerTickInput(100000000)
    .addRecipeTooltip("§1需要模块化特化神秘研究2")
    .addPostCheckHandler(function(event as RecipeCheckEvent){
        val ctrl = event.controller;

        if(!ctrl.hasMachineUpgrade("thaumau_one")){
            event.setFailed("§2缺少升级模块化特化神秘研究证明2");
            return;
        }
    })
    .addItemOutput(<thaumadditions:adaminite_ingot>)
    .build();
# 猩红快
RecipeBuilder.newBuilder("thaumcraft_21", "infusion_matrix_machine", 400)
    .addItemInput(<packagedthaumic:clathrate_essence>.withTag({Aspect: "victus"}) * 2000)
    .addItemInput(<packagedthaumic:clathrate_essence>.withTag({Aspect: "mortuus"}) * 2000)
    .addItemInput(<packagedthaumic:clathrate_essence>.withTag({Aspect: "aversio"}) * 2000)
    .addItemInput(<packagedthaumic:clathrate_essence>.withTag({Aspect: "desiderium"}) * 2000)
    .addItemInput(<bloodmagic:item_demon_crystal:1>*4)
    .addItemInput(<bloodmagic:item_demon_crystal:2>*4)
    .addItemInput(<bloodmagic:item_demon_crystal:3>*4)
    .addItemInput(<bloodmagic:item_demon_crystal:4>*4)
    .addItemInput(<additions:chromasteel_ingot>*4)
    .addItemInput(<bloodarsenal:blood_diamond:3>)
    .addEnergyPerTickInput(100000000)
    .addRecipeTooltip("§1需要模块化特化神秘研究1")
    .addPostCheckHandler(function(event as RecipeCheckEvent){
        val ctrl = event.controller;

        if(!ctrl.hasMachineUpgrade("thaumau")){
            event.setFailed("§2缺少升级模块化特化神秘研究证明1");
            return;
        }
    })
    .addItemOutput(<additions:greedycraft-crimsonite_block>)
    .build();
#风之结晶
RecipeBuilder.newBuilder("thaumcraft_22", "infusion_matrix_machine", 400)
    .addItemInput(<packagedthaumic:clathrate_essence>.withTag({Aspect: "aer"}) * 20)
    .addItemInput(<packagedthaumic:clathrate_essence>.withTag({Aspect: "vitreus"}) * 20)
    .addItemInput(<packagedthaumic:clathrate_essence>.withTag({Aspect: "vinculum"}) * 10)
    .addItemInput(<thaumcraft:salis_mundus>)
    .addItemInput(<minecraft:wheat_seeds>)
    .addItemInput(<thaumcraft:crystal_essence>.withTag({Aspects: [{amount: 1, key: "aer"}]}))
    .addEnergyPerTickInput(100000000)
    .addItemOutput(<thaumcraft:crystal_aer>)
    .build();
#火之结晶
RecipeBuilder.newBuilder("thaumcraft_23", "infusion_matrix_machine", 400)
    .addItemInput(<packagedthaumic:clathrate_essence>.withTag({Aspect: "lgnis"}) * 20)
    .addItemInput(<packagedthaumic:clathrate_essence>.withTag({Aspect: "vitreus"}) * 20)
    .addItemInput(<packagedthaumic:clathrate_essence>.withTag({Aspect: "vinculum"}) * 10)
    .addItemInput(<thaumcraft:salis_mundus>)
    .addItemInput(<minecraft:wheat_seeds>)
    .addItemInput(<thaumcraft:crystal_essence>.withTag({Aspects: [{amount: 1, key: "ignis"}]}))
    .addEnergyPerTickInput(100000000)
    .addItemOutput(<thaumcraft:crystal_ignis>)
    .build();
#水之结晶
RecipeBuilder.newBuilder("thaumcraft_24", "infusion_matrix_machine", 400)
    .addItemInput(<packagedthaumic:clathrate_essence>.withTag({Aspect: "aqua"}) * 20)
    .addItemInput(<packagedthaumic:clathrate_essence>.withTag({Aspect: "vitreus"}) * 20)
    .addItemInput(<packagedthaumic:clathrate_essence>.withTag({Aspect: "vinculum"}) * 10)
    .addItemInput(<thaumcraft:salis_mundus>)
    .addItemInput(<minecraft:wheat_seeds>)
    .addItemInput(<thaumcraft:crystal_essence>.withTag({Aspects: [{amount: 1, key: "aqua"}]}))
    .addEnergyPerTickInput(100000000)
    .addItemOutput(<thaumcraft:crystal_aqua>)
    .build();
#地之结晶
RecipeBuilder.newBuilder("thaumcraft_25", "infusion_matrix_machine", 400)
    .addItemInput(<packagedthaumic:clathrate_essence>.withTag({Aspect: "terra"}) * 20)
    .addItemInput(<packagedthaumic:clathrate_essence>.withTag({Aspect: "vitreus"}) * 20)
    .addItemInput(<packagedthaumic:clathrate_essence>.withTag({Aspect: "vinculum"}) * 10)
    .addItemInput(<thaumcraft:salis_mundus>)
    .addItemInput(<minecraft:wheat_seeds>)
    .addItemInput(<thaumcraft:crystal_essence>.withTag({Aspects: [{amount: 1, key: "terra"}]}))
    .addEnergyPerTickInput(100000000)
    .addItemOutput(<thaumcraft:crystal_terra>)
    .build();
#秩序结晶
RecipeBuilder.newBuilder("thaumcraft_26", "infusion_matrix_machine", 400)
    .addItemInput(<packagedthaumic:clathrate_essence>.withTag({Aspect: "ordo"}) * 20)
    .addItemInput(<packagedthaumic:clathrate_essence>.withTag({Aspect: "vitreus"}) * 20)
    .addItemInput(<packagedthaumic:clathrate_essence>.withTag({Aspect: "vinculum"}) * 10)
    .addItemInput(<thaumcraft:salis_mundus>)
    .addItemInput(<minecraft:wheat_seeds>)
    .addItemInput(<thaumcraft:crystal_essence>.withTag({Aspects: [{amount: 1, key: "ordo"}]}))
    .addEnergyPerTickInput(100000000)
    .addItemOutput(<thaumcraft:crystal_ordo>)
    .build();
#混沌结晶
RecipeBuilder.newBuilder("thaumcraft_27", "infusion_matrix_machine", 400)
    .addItemInput(<packagedthaumic:clathrate_essence>.withTag({Aspect: "perditio"}) * 20)
    .addItemInput(<packagedthaumic:clathrate_essence>.withTag({Aspect: "vitreus"}) * 20)
    .addItemInput(<packagedthaumic:clathrate_essence>.withTag({Aspect: "vinculum"}) * 10)
    .addItemInput(<thaumcraft:salis_mundus>)
    .addItemInput(<minecraft:wheat_seeds>)
    .addItemInput(<thaumcraft:crystal_essence>.withTag({Aspects: [{amount: 1, key: "perditio"}]}))
    .addEnergyPerTickInput(100000000)
    .addItemOutput(<thaumcraft:crystal_perditio>)
    .build();
#咒波结晶
RecipeBuilder.newBuilder("thaumcraft_28", "infusion_matrix_machine", 400)
    .addItemInput(<packagedthaumic:clathrate_essence>.withTag({Aspect: "lgnis"}) * 20)
    .addItemInput(<packagedthaumic:clathrate_essence>.withTag({Aspect: "vitreus"}) * 20)
    .addItemInput(<packagedthaumic:clathrate_essence>.withTag({Aspect: "vinculum"}) * 10)
    .addItemInput(<thaumcraft:salis_mundus>)
    .addItemInput(<minecraft:wheat_seeds>)
    .addItemInput(<thaumcraft:crystal_essence>.withTag({Aspects: [{amount: 1, key: "vitium"}]}))
    .addEnergyPerTickInput(100000000)
    .addItemOutput(<thaumcraft:crystal_vitium>)
    .build();
#增强元金锭
RecipeBuilder.newBuilder("thaumcraft_29", "infusion_matrix_machine", 400)
    .addItemInput(<packagedthaumic:clathrate_essence>.withTag({Aspect: "gelum"}) * 300)
    .addItemInput(<packagedthaumic:clathrate_essence>.withTag({Aspect: "lux"}) * 300)
    .addItemInput(<packagedthaumic:clathrate_essence>.withTag({Aspect: "metallum"}) * 300)
    .addItemInput(<packagedthaumic:clathrate_essence>.withTag({Aspect: "motus"}) * 300)
    .addItemInput(<packagedthaumic:clathrate_essence>.withTag({Aspect: "mortuus"}) * 300)
    .addItemInput(<packagedthaumic:clathrate_essence>.withTag({Aspect: "permutatio"}) * 300)
    .addItemInput(<packagedthaumic:clathrate_essence>.withTag({Aspect: "potentia"}) * 300)
    .addItemInput(<packagedthaumic:clathrate_essence>.withTag({Aspect: "victus"}) * 300)
    .addItemInput(<packagedthaumic:clathrate_essence>.withTag({Aspect: "vitreus"}) * 300)
    .addItemInput(<packagedthaumic:clathrate_essence>.withTag({Aspect: "vacuos"}) * 300)
    .addItemInput(<thaumcraft:primordial_pearl> * 6).setChance(0.01)
    .addItemInput(<thaumcraft:salis_mundus> * 2)
    .addItemInput(<gct_ores:everite_dust> * 2)
    .addItemInput(<tconevo:metal:20>)
    .addEnergyPerTickInput(100000000)
    .addRecipeTooltip("§1需要模块化特化神秘研究1")
    .addPostCheckHandler(function(event as RecipeCheckEvent){
        val ctrl = event.controller;

        if(!ctrl.hasMachineUpgrade("thaumau")){
            event.setFailed("§2缺少升级模块化特化神秘研究证明1");
            return;
        }
    })
    .addItemOutput(<additions:greedycraft-extended_primal_metal_ingot>)
    .build();
#巨型源质冶炼炉控制器
RecipeBuilder.newBuilder("thaumcraft_30", "infusion_matrix_machine", 400)
    .addItemInput(<packagedthaumic:clathrate_essence>.withTag({Aspect: "caeles"}) * 2000)
    .addItemInput(<packagedthaumic:clathrate_essence>.withTag({Aspect: "praecantatio"}) * 2000)
    .addItemInput(<packagedthaumic:clathrate_essence>.withTag({Aspect: "desiderium"}) * 2000)
    .addItemInput(<packagedthaumic:clathrate_essence>.withTag({Aspect: "machina"}) * 2000)
    .addItemInput(<additions:greedycraft-extended_primal_metal_ingot>)
    .addItemInput(<jaopca:gear.impetusite>)
    .addItemInput(<additions:greedycraft-creative_shard>)
    .addItemInput(<thaumicenergistics:essentia_component_64k>)
    .addItemInput(<additions:greedycraft-infernium_block>)
    .addItemInput(<jaopca:gear.flux>)
    .addItemInput(<thaumicaugmentation:material:3>)
    .addItemInput(<thaumadditions:mithrillium_smelter>)
    .addItemInput(<packagedthaumic:virial_chamber>)
    .addEnergyPerTickInput(100000000)
    .addItemOutput(<gct_mac:giant_smelter>)
    .build();
#木乃伊诱饵
RecipeBuilder.newBuilder("thaumcraft_31", "infusion_matrix_machine", 500)
    .addItemInput(<packagedthaumic:clathrate_essence>.withTag({Aspect: "victus"}) * 2400)
    .addItemInput(<packagedthaumic:clathrate_essence>.withTag({Aspect: "imperium"}) * 800)
    .addItemInput(<packagedthaumic:clathrate_essence>.withTag({Aspect: "exanimis"}) * 800)
    .addItemInput(<thebetweenlands:items_misc:13> * 4)
    .addItemInput(<thebetweenlands:items_misc:45>)
    .addItemInput(<thebetweenlands:items_misc:25>)
    .addItemInput(<thebetweenlands:items_misc:26> * 2)
    .addEnergyPerTickInput(100000000)
    .addItemInput(<thebetweenlands:dentrothyst_fluid_vial:1>.withTag({Fluid: {FluidName: "shallowbreath", Amount: 1000}}))
    .addItemOutput(<thebetweenlands:mummy_bait>)
    .build();
#奥数钻探机
RecipeBuilder.newBuilder("thaumcraft_32", "infusion_matrix_machine", 500)
    .addItemInput(<packagedthaumic:clathrate_essence>.withTag({Aspect: "machina"}) * 100)
    .addItemInput(<packagedthaumic:clathrate_essence>.withTag({Aspect: "potentia"}) * 50)
    .addItemInput(<packagedthaumic:clathrate_essence>.withTag({Aspect: "terra"}) * 50)
    .addItemInput(<packagedthaumic:clathrate_essence>.withTag({Aspect: "vacuos"}) * 50)
    .addItemInput(<packagedthaumic:clathrate_essence>.withTag({Aspect: "motus"}) * 50)
    .addItemInput(<thaumcraft:nugget:10>)
    .addItemInput(<thaumcraft:plank_greatwood> * 2)
    .addItemInput(<thaumcraft:mechanism_complex>)
    .addItemInput(<thaumcraft:plate>)
    .addItemInput(<minecraft:diamond_pickaxe>)
    .addItemInput(<minecraft:diamond_shovel>)
    .addItemInput(<thaumcraft:morphic_resonator>)
    .addItemInput(<thaumcraft:turret>)
    .addRecipeTooltip("§1需要模块化特化神秘研究1")
    .addPostCheckHandler(function(event as RecipeCheckEvent){
        val ctrl = event.controller;

        if(!ctrl.hasMachineUpgrade("thaumau")){
            event.setFailed("缺少升级模块化特化神秘研究证明1");
            return;
        }
    })
    .addEnergyPerTickInput(100000000)
    .addItemOutput(<thaumcraft:turret:2>)
    .build();
#开眼邪术拱顶石
RecipeBuilder.newBuilder("thaumcraft_33", "infusion_matrix_machine", 600)
    .addItemInput(<packagedthaumic:clathrate_essence>.withTag({Aspect: "vitium"}) * 1000)
    .addItemInput(<packagedthaumic:clathrate_essence>.withTag({Aspect: "machina"}) * 1000)
    .addItemInput(<packagedthaumic:clathrate_essence>.withTag({Aspect: "visum"}) * 600)
    .addItemInput(<packagedthaumic:clathrate_essence>.withTag({Aspect: "tenebrae"}) * 600)
    .addItemInput(<additions:greedycraft-extended_primal_metal_ingot> * 3)
    .addItemInput(<thaumadditions:mithrillium_ingot> * 3)
    .addItemInput(<thaumcraft:primordial_pearl>).setChance(0.01)
    .addItemInput(<thaumcraft:stone_eldritch_tile>)
    .addEnergyPerTickInput(100000000)
    .addItemOutput(<thaumicaugmentation:capstone:2>)
    .build();
#封包神秘炼金塔
RecipeBuilder.newBuilder("thaumcraft_34", "infusion_matrix_machine", 300)
    .addItemInput(<packagedthaumic:clathrate_essence>.withTag({Aspect: "fabrico"}) * 50)
    .addItemInput(<packagedthaumic:clathrate_essence>.withTag({Aspect: "machina"}) * 30)
    .addItemInput(<packagedthaumic:clathrate_essence>.withTag({Aspect: "alkimia"}) * 20)
    .addItemInput(<packagedthaumic:clathrate_essence>.withTag({Aspect: "lgnis"}) * 10)
    .addItemInput(<packagedthaumic:clathrate_essence>.withTag({Aspect: "ordo"}) * 10)
    .addItemInput(<thaumcraft:salis_mundus> * 2)
    .addItemInput(<thaumcraft:morphic_resonator>)
    .addItemInput(<thaumcraft:mechanism_simple> * 2)
    .addItemInput(<thaumcraft:metal_alchemical> * 2)
    .addItemInput(<packagedthaumic:thaumic_package_component>)
    .addItemInput(<thaumcraft:crucible>)
    .addEnergyPerTickInput(100000000)
    .addRecipeTooltip("§1需要模块化特化神秘研究1")
    .addPostCheckHandler(function(event as RecipeCheckEvent){
        val ctrl = event.controller;

        if(!ctrl.hasMachineUpgrade("thaumau")){
            event.setFailed("§2缺少升级模块化特化神秘研究证明1");
            return;
        }
    })
    .addItemOutput(<packagedthaumic:crucible_crafter>)
    .build();
#封包符文矩阵
RecipeBuilder.newBuilder("thaumcraft_35", "infusion_matrix_machine", 200)
    .addItemInput(<packagedthaumic:clathrate_essence>.withTag({Aspect: "fabrico"}) * 100)
    .addItemInput(<packagedthaumic:clathrate_essence>.withTag({Aspect: "machina"}) * 50)
    .addItemInput(<packagedthaumic:clathrate_essence>.withTag({Aspect: "alkimia"}) * 30)
    .addItemInput(<packagedthaumic:clathrate_essence>.withTag({Aspect: "lgnis"}) * 10)
    .addItemInput(<packagedthaumic:clathrate_essence>.withTag({Aspect: "ordo"}) * 20)
    .addItemInput(<packagedthaumic:clathrate_essence>.withTag({Aspect: "motus"}) * 40)
    .addItemInput(<packagedthaumic:clathrate_essence>.withTag({Aspect: "alienis"}) * 40)
    .addItemInput(<packagedthaumic:clathrate_essence>.withTag({Aspect: "auram"}) * 10)
    .addItemInput(<thaumcraft:mirror>)
    .addItemInput(<thaumcraft:tube_buffer> * 2)
    .addItemInput(<thaumcraft:mind:1>)
    .addItemInput(<thaumcraft:mechanism_complex> * 2)
    .addItemInput(<packagedthaumic:porous_stone_plate> * 4)
    .addItemInput(<packagedthaumic:thaumic_package_component>)
    .addItemInput(<thaumcraft:salis_mundus> * 2)
    .addItemInput(<thaumcraft:stabilizer>)
    .addItemInput(<thaumcraft:morphic_resonator>)
    .addItemInput(<thaumcraft:infusion_matrix>)
    .addEnergyPerTickInput(100000000)
    .addRecipeTooltip("§1需要模块化特化神秘研究1")
    .addPostCheckHandler(function(event as RecipeCheckEvent){
        val ctrl = event.controller;

        if(!ctrl.hasMachineUpgrade("thaumau")){
            event.setFailed("§2缺少升级模块化特化神秘研究证明1");
            return;
        }
    })
    .addItemOutput(<packagedthaumic:infusion_crafter>)
    .build();

