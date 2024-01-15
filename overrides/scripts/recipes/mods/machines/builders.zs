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
import mods.ctutils.utils.Math;
import mods.jei.JEI;

//强化装配室
for i in 1 to 7 {
    RecipeBuilder.newBuilder("controller_builder_refined" + i, "builder_" + i, 2400)
        .addFluidInput(<liquid:redstone> * 10000)
        .addItemInput(<appliedenergistics2:quartz_block> * 32)
        .addItemInput(<ore:gearIron> * 80)
        .addItemInput(<ore:gearCopper> * 80)
        .addItemInput(<ore:gearDiamond> * 20)
        .addItemInput(<ore:gearEmerald> * 20)
        .addItemInput(<ore:circuitBasic> * 10)
        .addItemInput(<ore:circuitAdvanced> * 5)
        .addEnergyPerTickInput(300)
        .addItemOutput(<modularmachinery:builder_2_controller>)
        .addItemOutput(<modularmachinery:itemblueprint>.withTag({dynamicmachine: "modularmachinery:builder_2"}))
        .build();
}
//进阶装配室
for i in 1 to 7 {
    RecipeBuilder.newBuilder("controller_builder_advanced" + i, "builder_" + i, 4000)
        .addFluidInput(<liquid:redstone> * 20000)
        .addItemInput(<betternether:cincinnasite_block> * 64)
        .addItemInput(<ore:gearManyullyn> * 30)
        .addItemInput(<ore:gearShadowBar> * 30)
        .addItemInput(<ore:gearDraconium> * 16)
        .addItemInput(<ore:gearWitherium> * 16)
        .addItemInput(<ore:circuitAdvanced> * 20)
        .addItemInput(<ore:circuitElite> * 8)
        .addEnergyPerTickInput(12000)
        .addItemOutput(<modularmachinery:builder_3_controller>)
        .addItemOutput(<modularmachinery:itemblueprint>.withTag({dynamicmachine: "modularmachinery:builder_3"}))
        .build();
}
//炫光装配室
for i in 1 to 7 {
    RecipeBuilder.newBuilder("controller_builder_chroma" + i, "builder_" + i, 6666)
        .addFluidInput(<liquid:redstone> * 30000)
        .addItemInput(<gct_ores:rainboquartz_block> * 96)
        .addItemInput(<ore:gearEverite> * 24)
        .addItemInput(<ore:gearDraconiumChaotic> * 12)
        .addItemInput(<ore:gearWitheriumStormy> * 12)
        .addItemInput(<ore:gearPrimordial> * 2)
        .addItemInput(<ore:gearOrichalcos> * 2)
        .addItemInput(<ore:gearChromasteel> * 2)
        .addItemInput(<ore:circuitElite> * 10)
        .addItemInput(<ore:circuitUltimate> * 4)
        .addItemInput(<ore:circuitFinal> * 1)
        .addEnergyPerTickInput(24000)
        .addItemOutput(<modularmachinery:builder_4_controller>) 
        .addItemOutput(<modularmachinery:itemblueprint>.withTag({dynamicmachine: "modularmachinery:builder_4"})) 
        .build();
}
//终极装配室
for i in 1 to 7 {
    RecipeBuilder.newBuilder("controller_builder_ultra" + i, "builder_" + i, 8888)
        .addFluidInput(<liquid:redstone> * 55000)
        .addItemInput(<gct_ores:shalloite_block> * 108)
        .addItemInput(<ore:gearCthulhurite> * 24)
        .addItemInput(<ore:gearBetwnite> * 10)
        .addItemInput(<ore:gearAbyssine> * 4)
        .addItemInput(<ore:gearBotanical> * 4)
        .addItemInput(<ore:gearGhostMetal> * 2)
        .addItemInput(<ore:gearOrderedMetal> * 1)
        .addItemInput(<ore:gearMithminite> * 1)
        .addItemInput(<ore:circuitUltimate> * 8)
        .addItemInput(<ore:circuitFinal> * 2)
        .addItemInput(<ore:circuitArcane> * 1)
        .addEnergyPerTickInput(88000)
        .addItemOutput(<modularmachinery:builder_5_controller>) 
        .addItemOutput(<modularmachinery:itemblueprint>.withTag({dynamicmachine: "modularmachinery:builder_5"})) 
        .build();
}
//耐钢熔合机
for i in 1 to 7 {
    RecipeBuilder.newBuilder("controller_durasteel_forge" + i, "builder_" + i, 1200)
        .addFluidInput(<liquid:redstone> * 38000)
        .addItemInput(<ore:plateElectrum> * 16)
        .addItemInput(<ore:plateInvar> * 16)
        .addItemInput(<ore:plateBrass> * 16)
        .addItemInput(<ore:ingotModularium> * 64)
        .addItemInput(<ore:plateStainlessSteel> * 8)
        .addItemInput(<thermalfoundation:material:514> * 8)
        .addItemInput(<thermalfoundation:material:513> * 8)
        .addEnergyPerTickInput(150)
        .addItemOutput(<modularmachinery:durasteel_forge_controller>)
        .addItemOutput(<modularmachinery:itemblueprint>.withTag({dynamicmachine: "modularmachinery:durasteel_forge"}))
        .build();
}
//恒钢熔合机
for i in 2 to 7 {
    RecipeBuilder.newBuilder("controller_aeonsteel_forge" + i, "builder_" + i, 2000)
        .addFluidInput(<liquid:redstone> * 108900)
        .addItemInput(<ore:ingotModularium> * 128)
        .addItemInput(<ore:plateDurasteel> * 16)
        .addItemInput(<ore:plateElectrumFlux> * 16)
        .addItemInput(<ore:plateGlowingSignalum> * 16)
        .addItemInput(<ore:plateGelidEnderium> * 16)
        .addItemInput(<ore:circuitBasic> * 20)
        .addItemInput(<ore:circuitAdvanced> * 10)
        .addEnergyPerTickInput(1200)
        .addItemOutput(<modularmachinery:aeonsteel_forge_controller>)
        .addItemOutput(<modularmachinery:itemblueprint>.withTag({dynamicmachine: "modularmachinery:aeonsteel_forge"}))
        .build();
}
//炫钢熔合机
for i in 3 to 7 {
    RecipeBuilder.newBuilder("controller_chromasteel_forge" + i, "builder_" + i, 2000)
        .addFluidInput(<liquid:redstone> * 275600)
        .addItemInput(<ore:ingotModularium> * 512)
        .addItemInput(<ore:plateAeonsteel> * 12)
        .addItemInput(<ore:plateEverite> * 16)
        .addItemInput(<ore:plateOsmiridium> * 16)
        .addItemInput(<ore:plateVoid> * 16)
        .addItemInput(<ore:circuitBasic> * 20)
        .addItemInput(<ore:circuitAdvanced> * 10)
        .addEnergyPerTickInput(2700)
        .addItemOutput(<modularmachinery:chromasteel_forge_controller>)
        .addItemOutput(<modularmachinery:itemblueprint>.withTag({dynamicmachine: "modularmachinery:chromasteel_forge"}))
        .build();
}
//寰宇熔合机
for i in 4 to 7 {
    RecipeBuilder.newBuilder("controller_cosmic_forge" + i, "builder_" + i, 2777)
        .addFluidInput(<liquid:redstone> * 577500)
        .addItemInput(<ore:ingotModularium> * 1024)
        .addItemInput(<ore:plateChromasteel> * 12)
        .addItemInput(<ore:plateCrimsonite> * 16)
        .addItemInput(<ore:plateAdaminite> * 2)
        .addItemInput(<ore:plateHarcadium> * 32)
        .addItemInput(<ore:plateVoidEssence> * 32)
        .addItemInput(<ore:circuitAdvanced> * 12)
        .addItemInput(<ore:circuitElite> * 8)
        .addItemInput(<ore:circuitUltimate> * 4)
        .addEnergyPerTickInput(6000)
        .addItemOutput(<modularmachinery:cosmic_forge_controller>) 
        .addItemOutput(<modularmachinery:itemblueprint>.withTag({dynamicmachine: "modularmachinery:cosmic_forge"})) 
        .build();
}
//终焉熔合机
for i in 4 to 7 {
    RecipeBuilder.newBuilder("controller_final_forge" + i, "builder_" + i, 3000)
        .addFluidInput(<liquid:redstone> * 1071000)
        .addFluidInput(<liquid:crystaltine> * 2880)
        .addItemInput(<ore:ingotModularium> * 2048)
        .addItemInput(<ore:plateCosmilite> * 8)
        .addItemInput(<ore:plateBetwnite> * 16)
        .addItemInput(<ore:plateThermallite> * 6)
        .addItemInput(<ore:plateCreativeAlloy> * 6)
        .addItemInput(<ore:plateScientificite> * 6)
        .addItemInput(<ore:circuitElite> * 16)
        .addItemInput(<ore:circuitUltimate> * 8)
        .addItemInput(<ore:circuitFinal> * 4)
        .addEnergyPerTickInput(18000)
        .addItemOutput(<modularmachinery:final_forge_controller>) 
        .addItemOutput(<modularmachinery:itemblueprint>.withTag({dynamicmachine: "modularmachinery:final_forge"})) 
        .build();
}
//固体离心机
for i in 1 to 7 {
    RecipeBuilder.newBuilder("controller_solid_centrifuge" + i, "builder_" + i, 600)
        .addFluidInput(<liquid:redstone> * 6000)
        .addItemInput(<ore:plateIron> * 8)
        .addItemInput(<ore:plateCopper> * 8)
        .addItemInput(<ore:plateAluminium> * 8)
        .addItemInput(<ore:plateTin> * 8)
        .addItemInput(<ore:plateNickel> * 8)
        .addItemInput(<ore:plateLead> * 8)
        .addItemInput(<ore:plateChromium> * 8)
        .addItemInput(<ore:plateGold> * 8)
        .addItemInput(<ore:plateSilver> * 8)
        .addItemInput(<ore:gearSteel> * 4)
        .addEnergyPerTickInput(120)
        .addItemOutput(<modularmachinery:solid_centrifuge_controller>)
        .addItemOutput(<modularmachinery:itemblueprint>.withTag({dynamicmachine: "modularmachinery:solid_centrifuge"}))
        .build();
}
//液体离心机
for i in 1 to 7 {
    RecipeBuilder.newBuilder("controller_liquid_centrifuge" + i, "builder_" + i, 1200)
        .addFluidInput(<liquid:redstone> * 13200)
        .addFluidInput(<liquid:water> * 1000)
        .addFluidInput(<liquid:lava> * 1000)
        .addFluidInput(<liquid:organic_fluid> * 1000)
        .addItemInput(<ore:gearElectrum> * 16)
        .addEnergyPerTickInput(120)
        .addItemOutput(<modularmachinery:liquid_centrifuge_controller>)
        .addItemOutput(<modularmachinery:itemblueprint>.withTag({dynamicmachine: "modularmachinery:liquid_centrifuge"}))
        .build();
}
//气体离心机
for i in 3 to 7 {
    RecipeBuilder.newBuilder("controller_gas_centrifuge" + i, "builder_" + i, 1600)
        .addFluidInput(<liquid:redstone> * 104400)
        .addGasInput("oxygen", 4000)
        .addGasInput("chlorine", 4000)
        .addGasInput("hydrogen", 4000)
        .addItemInput(<ore:gearGelidEnderium> * 8)
        .addEnergyPerTickInput(1200)
        .addItemOutput(<modularmachinery:gas_centrifuge_controller>)
        .addItemOutput(<modularmachinery:itemblueprint>.withTag({dynamicmachine: "modularmachinery:gas_centrifuge"}))
        .build();
}
//基础矿机
for i in 1 to 7 {
    RecipeBuilder.newBuilder("controller_miner_basic" + i, "builder_" + i, 1200)
        .addFluidInput(<liquid:redstone> * 30600)
        .addItemInput(<tconstruct:pick_head>.withTag({Material: "diamond"}) * 1)
        .addItemInput(<tconstruct:pick_head>.withTag({Material: "gold"}) * 2)
        .addItemInput(<tconstruct:binding>.withTag({Material: "tin"}) * 2)
        .addItemInput(<tconstruct:binding>.withTag({Material: "silver"}) * 1)
        .addItemInput(<tconstruct:tool_rod>.withTag({Material: "copper"}) * 2)
        .addItemInput(<tconstruct:tool_rod>.withTag({Material: "iron"}) * 1)
        .addEnergyPerTickInput(120)
        .addItemOutput(<modularmachinery:miner_basic_controller>)
        .addItemOutput(<modularmachinery:itemblueprint>.withTag({dynamicmachine: "modularmachinery:miner_basic"}))
        .build();
}
//暮色矿机
for i in 1 to 7 {
    RecipeBuilder.newBuilder("controller_miner_twilight" + i, "builder_" + i, 1200)
        .addFluidInput(<liquid:redstone> * 67500)
        .addItemInput(<tconstruct:pick_head>.withTag({Material: "refined_twilight_gem"}) * 1)
        .addItemInput(<tconstruct:pick_head>.withTag({Material: "fierymetal"}) * 2)
        .addItemInput(<tconstruct:binding>.withTag({Material: "steeleaf"}) * 3)
        .addItemInput(<tconstruct:tool_rod>.withTag({Material: "ironwood"}) * 2)
        .addItemInput(<tconstruct:tool_rod>.withTag({Material: "knightmetal"}) * 1)
        .addItemInput(<twilightforest:deadrock:2> * 64)
        .addEnergyPerTickInput(120)
        .addItemOutput(<modularmachinery:miner_twilight_controller>)
        .addItemOutput(<modularmachinery:itemblueprint>.withTag({dynamicmachine: "modularmachinery:miner_twilight"}))
        .build();
}
//一阶矿机
for i in 3 to 7 {
    RecipeBuilder.newBuilder("controller_miner_advanced" + i, "builder_" + i, 1200) 
        .addFluidInput(<liquid:redstone> * 30600)
        .addItemInput(<tconstruct:pick_head>.withTag({Material: "cobalt"}) * 2)
        .addItemInput(<tconstruct:pick_head>.withTag({Material: "aqualite"}) * 1)
        .addItemInput(<tconstruct:pick_head>.withTag({Material: "meteor"}) * 1)
        .addItemInput(<tconstruct:binding>.withTag({Material: "durasteel"}) * 4)
        .addItemInput(<tconstruct:tool_rod>.withTag({Material: "asgardium"}) * 2)
        .addItemInput(<tconstruct:tool_rod>.withTag({Material: "manganese_steel"}) * 2)
        .addEnergyPerTickInput(120)
        .addItemOutput(<modularmachinery:miner_advanced_controller>) 
        .addItemOutput(<modularmachinery:itemblueprint>.withTag({dynamicmachine: "modularmachinery:miner_advanced"})) 
        .build();
}
//二阶矿机
for i in 4 to 7 {
    RecipeBuilder.newBuilder("controller_miner_hardened" + i, "builder_" + i, 1200) 
        .addFluidInput(<liquid:redstone> * 133200)
        .addItemInput(<tconstruct:pick_head>.withTag({Material: "draconium"}) * 1)
        .addItemInput(<tconstruct:pick_head>.withTag({Material: "witherium"}) * 1)
        .addItemInput(<tconstruct:pick_head>.withTag({Material: "chromasteel"}) * 2)
        .addItemInput(<tconstruct:binding>.withTag({Material: "fusion_matrix"}) * 4)
        .addItemInput(<tconstruct:tool_rod>.withTag({Material: "wyvern_metal"}) * 2)
        .addItemInput(<tconstruct:tool_rod>.withTag({Material: "fallen_metal"}) * 2)
        .addEnergyPerTickInput(120)
        .addItemOutput(<modularmachinery:miner_hardened_controller>) 
        .addItemOutput(<modularmachinery:itemblueprint>.withTag({dynamicmachine: "modularmachinery:miner_hardened"})) 
        .build();
}
//下界矿机
for i in 3 to 7 {
    RecipeBuilder.newBuilder("controller_miner_nether" + i, "builder_" + i, 1200)
        .addFluidInput(<liquid:redstone> * 4500)
        .addItemInput(<tconstruct:pick_head>.withTag({Material: "mithril"}) * 1)
        .addItemInput(<tconstruct:pick_head>.withTag({Material: "cobalt"}) * 1)
        .addItemInput(<tconstruct:binding>.withTag({Material: "bloodcrust"}) * 1)
        .addItemInput(<tconstruct:binding>.withTag({Material: "lava_solid"}) * 1)
        .addItemInput(<tconstruct:tool_rod>.withTag({Material: "ardite"}) * 1)
        .addItemInput(<tconstruct:tool_rod>.withTag({Material: "hellstone"}) * 1)
        .addEnergyPerTickInput(120)
        .addItemOutput(<modularmachinery:miner_nether_controller>) 
        .addItemOutput(<modularmachinery:itemblueprint>.withTag({dynamicmachine: "modularmachinery:miner_nether"})) 
        .build();        
}
//极光矿机
for i in 3 to 7 {
    RecipeBuilder.newBuilder("controller_miner_aurorian" + i, "builder_" + i, 1200) 
        .addFluidInput(<liquid:redstone> * 4000)
        .addItemInput(<theaurorian:auroriansteelpickaxe>)
        .addItemInput(<tconstruct:pick_head>.withTag({Material: "auroriansteel"}) * 3)
        .addItemInput(<tconstruct:tool_rod>.withTag({Material: "aurorianite"}) * 1)
        .addItemInput(<tconstruct:tool_rod>.withTag({Material: "umbra"}) * 1)
        .addItemInput(<tconstruct:tool_rod>.withTag({Material: "crystalline"}) * 1)
        .addItemInput(<tconstruct:binding>.withTag({Material: "moonstone"}) * 1)
        .addItemInput(<tconstruct:binding>.withTag({Material: "cerulean"}) * 1)
        .addItemInput(<tconstruct:binding>.withTag({Material: "aurorianstone"}) * 1)
        .addItemInput(<theaurorian:aurorianstone> * 64)
        .addEnergyPerTickInput(120)
        .addItemOutput(<modularmachinery:miner_aurorian_controller>) 
        .addItemOutput(<modularmachinery:itemblueprint>.withTag({dynamicmachine: "modularmachinery:miner_aurorian"})) 
        .build();
}
//末地矿机
for i in 4 to 7 {
    RecipeBuilder.newBuilder("controller_miner_end" + i, "builder_" + i, 1200)
        .addFluidInput(<liquid:redstone> * 46200)
        .addItemInput(<tconstruct:pick_head>.withTag({Material: "draconium"}) * 1)
        .addItemInput(<tconstruct:pick_head>.withTag({Material: "witherium"}) * 1)
        .addItemInput(<tconstruct:pick_head>.withTag({Material: "palladium"}) * 1)
        .addItemInput(<tconstruct:pick_head>.withTag({Material: "aurorium"}) * 1)
        .addItemInput(<tconstruct:binding>.withTag({Material: "fusion_matrix"}) * 4)
        .addItemInput(<tconstruct:tool_rod>.withTag({Material: "genite"}) * 4)
        .addItemInput(<minecraft:ender_pearl> * 64)
        .addItemInput(<minecraft:end_stone> * 64)
        .addEnergyPerTickInput(120)
        .addItemOutput(<modularmachinery:miner_end_controller>)
        .addItemOutput(<modularmachinery:itemblueprint>.withTag({dynamicmachine: "modularmachinery:miner_end"}))
        .build();
}
//魔力矿机
for i in 2 to 7 {
    RecipeBuilder.newBuilder("controller_miner_mana" + i, "builder_" + i, 1200)
        .addFluidInput(<liquid:redstone> * 275600)
        .addItemInput(<tconstruct:pick_head>.withTag({Material: "manasteel"}) * 1)
        .addItemInput(<tconstruct:pick_head>.withTag({Material: "elementium"}) * 1)
        .addItemInput(<botania:manaresource:2> * 4)
        .addItemInput(<botania:quartz:1> * 16)
        .addItemInput(<additions:botaniaddon-manalapis_ore> * 32)
        .addItemInput(<gct_mobs:mana_cobble_stone> * 64)
        .addEnergyPerTickInput(120)
        .addItemOutput(<modularmachinery:miner_mana_controller>)
        .addItemOutput(<modularmachinery:itemblueprint>.withTag({dynamicmachine: "modularmachinery:miner_mana"}))
        .build();
}
//恐惧矿机
for i in 5 to 7 {
    RecipeBuilder.newBuilder("controller_miner_dread" + i, "builder_" + i, 1200)
        .addFluidInput(<liquid:redstone> * 87000)
        .addItemInput(<tconstruct:pick_head>.withTag({Material: "adeninite"}) * 1)
        .addItemInput(<tconstruct:pick_head>.withTag({Material: "dreadium"}) * 1)
        .addItemInput(<tconstruct:pick_head>.withTag({Material: "abyssalnite"}) * 1)
        .addItemInput(<tconstruct:binding>.withTag({Material: "abyssalnite"}) * 3)
        .addItemInput(<tconstruct:tool_rod>.withTag({Material: "dreadium"}) * 3)
        .addEnergyPerTickInput(120)
        .addItemOutput(<modularmachinery:miner_dread_controller>)
        .addItemOutput(<modularmachinery:itemblueprint>.withTag({dynamicmachine: "modularmachinery:miner_dread"}))
        .build();
}
//奥穆索矿机
for i in 5 to 7 {
    RecipeBuilder.newBuilder("controller_miner_omothol" + i, "builder_" + i, 1200)
        .addFluidInput(<liquid:redstone> * 225600)
        .addItemInput(<tconstruct:pick_head>.withTag({Material: "ethaxium"}) * 4)
        .addItemInput(<tconstruct:binding>.withTag({Material: "dreadium"}) * 4)
        .addItemInput(<tconstruct:tool_rod>.withTag({Material: "dreadium"}) * 4)
        .addItemInput(<abyssalcraft:stone:6> * 192)
        .addEnergyPerTickInput(120)
        .addItemOutput(<modularmachinery:miner_omothol_controller>)
        .addItemOutput(<modularmachinery:itemblueprint>.withTag({dynamicmachine: "modularmachinery:miner_omothol"}))
        .build();
}
//黑暗矿机
for i in 5 to 7 {
    RecipeBuilder.newBuilder("controller_miner_dark" + i, "builder_" + i, 1200)
        .addFluidInput(<liquid:redstone> * 225600)
        .addItemInput(<tconstruct:pick_head>.withTag({Material: "bnightium"}) * 4)
        .addItemInput(<tconstruct:binding>.withTag({Material: "dreadium"}) * 4)
        .addItemInput(<tconstruct:tool_rod>.withTag({Material: "ethaxium"}) * 4)
        .addItemInput(<abyssalcraft:cobblestone> * 192)
        .addEnergyPerTickInput(120)
        .addItemOutput(<modularmachinery:miner_dark_controller>)
        .addItemOutput(<modularmachinery:itemblueprint>.withTag({dynamicmachine: "modularmachinery:miner_dark"}))
        .build();
}
//深渊矿机
for i in 5 to 7 {
    RecipeBuilder.newBuilder("controller_miner_abyss" + i, "builder_" + i, 1200)
        .addFluidInput(<liquid:redstone> * 30600)
        .addItemInput(<tconstruct:pick_head>.withTag({Material: "guaninite"}) * 1)
        .addItemInput(<tconstruct:pick_head>.withTag({Material: "refined_coralium"}) * 1)
        .addItemInput(<tconstruct:binding>.withTag({Material: "refined_coralium"}) * 2)
        .addItemInput(<tconstruct:tool_rod>.withTag({Material: "shadow_bar"}) * 2)
        .addItemInput(<abyssalcraft:cobblestone:1> * 64)
        .addItemInput(<abyssalcraft:cobblestone:4> * 64)
        .addEnergyPerTickInput(120)
        .addItemOutput(<modularmachinery:miner_abyss_controller>)
        .addItemOutput(<modularmachinery:itemblueprint>.withTag({dynamicmachine: "modularmachinery:miner_abyss"}))
        .build();
}
//天境矿机
for i in 5 to 7 {
    RecipeBuilder.newBuilder("controller_miner_aether" + i, "builder_" + i, 1200)
        .addFluidInput(<liquid:redstone> * 30600)
        .addItemInput(<tconstruct:pick_head>.withTag({Material: "asgardium"}) * 2)
        .addItemInput(<tconstruct:binding>.withTag({Material: "gravitite"}) * 2)
        .addItemInput(<tconstruct:tool_rod>.withTag({Material: "zanite"}) * 2)
        .addItemInput(<aether_legacy:holystone> * 128)
        .addItemInput(<tinkersaether:valkyrie_ingot> * 2)
        .addEnergyPerTickInput(120)
        .addItemOutput(<modularmachinery:miner_aether_controller>)
        .addItemOutput(<modularmachinery:itemblueprint>.withTag({dynamicmachine: "modularmachinery:miner_aether"}))
        .build();
}
//共鸣矿机
for i in 5 to 7 {
    RecipeBuilder.newBuilder("controller_miner_chrome" + i, "builder_" + i, 1200)
        .addFluidInput(<liquid:redstone> * 396500)
        .addItemInput(<tconstruct:pick_head>.withTag({Material: "cthulhurite"}) * 1)
        .addItemInput(<tconstruct:pick_head>.withTag({Material: "compressite"}) * 1)
        .addItemInput(<tconstruct:pick_head>.withTag({Material: "dullium"}) * 1)
        .addItemInput(<tconstruct:binding>.withTag({Material: "neutronium"}) * 3)
        .addItemInput(<tconstruct:tool_rod>.withTag({Material: "bedrock"}) * 3)
        .addItemInput(<redstonearsenal:material:32> * 12)
        .addItemInput(<avaritia:resource:4> * 12)
        .addEnergyPerTickInput(120)
        .addItemOutput(<modularmachinery:miner_chrome_controller>)
        .addItemOutput(<modularmachinery:itemblueprint>.withTag({dynamicmachine: "modularmachinery:miner_chrome"}))
        .build();
}
//三阶矿机
for i in 5 to 7 {
    RecipeBuilder.newBuilder("controller_miner_excellent" + i, "builder_" + i, 1200)
        .addFluidInput(<liquid:redstone> * 483000)
        .addItemInput(<tconstruct:pick_head>.withTag({Material: "imitatium"}) * 1)
        .addItemInput(<tconstruct:pick_head>.withTag({Material: "draconic_metal"}) * 1)
        .addItemInput(<tconstruct:pick_head>.withTag({Material: "sanite"}) * 1)
        .addItemInput(<tconstruct:pick_head>.withTag({Material: "porpezite"}) * 1)
        .addItemInput(<tconstruct:pick_head>.withTag({Material: "chromasteel"}) * 1)
        .addItemInput(<tconstruct:binding>.withTag({Material: "aeonsteel"}) * 2)
        .addItemInput(<tconstruct:binding>.withTag({Material: "durasteel"}) * 3)
        .addItemInput(<tconstruct:tool_rod>.withTag({Material: "stainless_steel"}) * 5)
        .addEnergyPerTickInput(120)
        .addItemOutput(<modularmachinery:miner_excellent_controller>)
        .addItemOutput(<modularmachinery:itemblueprint>.withTag({dynamicmachine: "modularmachinery:miner_excellent"}))
        .build();
}
//雾霭矿机
for i in 4 to 7 {
    RecipeBuilder.newBuilder("controller_miner_foggy" + i, "builder_" + i, 1200)
        .addFluidInput(<liquid:redstone> * 180400)
        .addItemInput(<tconstruct:pick_head>.withTag({Material: "niobium"}) * 4)
        .addItemInput(<tconstruct:binding>.withTag({Material: "ruthenium"}) * 1)
        .addItemInput(<tconstruct:tool_rod>.withTag({Material: "rhodium"}) * 1)
        .addItemInput(<tconstruct:binding>.withTag({Material: "niobium"}) * 3)
        .addItemInput(<tconstruct:tool_rod>.withTag({Material: "niobium"}) * 3)
        .addItemInput(<mist:filter_coal> * 32)
        .addEnergyPerTickInput(120)
        .addItemOutput(<modularmachinery:miner_foggy_controller>)
        .addItemOutput(<modularmachinery:itemblueprint>.withTag({dynamicmachine: "modularmachinery:miner_foggy"}))
        .build();
}
//熔融矿机
for i in 5 to 7 {
    RecipeBuilder.newBuilder("controller_miner_molten" + i, "builder_" + i, 1200)
        .addFluidInput(<liquid:redstone> * 225600)
        .addItemInput(<tconstruct:pick_head>.withTag({Material: "lavarite"}) * 4)
        .addItemInput(<tconstruct:binding>.withTag({Material: "lava_solid"}) * 4)
        .addItemInput(<tconstruct:tool_rod>.withTag({Material: "hellite"}) * 4)
        .addItemInput(<additions:netherite_ingot> * 16)
        .addItemInput(<minecraft:netherrack> * 128)
        .addEnergyPerTickInput(120)
        .addItemOutput(<modularmachinery:miner_molten_controller>)
        .addItemOutput(<modularmachinery:itemblueprint>.withTag({dynamicmachine: "modularmachinery:miner_molten"}))
        .build();
}
//冰封矿机
for i in 3 to 7 {
    RecipeBuilder.newBuilder("controller_miner_frozen" + i, "builder_" + i, 1200)
        .addFluidInput(<liquid:redstone> * 30600)
        .addItemInput(<tconstruct:pick_head>.withTag({Material: "chillinium"}) * 2)
        .addItemInput(<tconstruct:binding>.withTag({Material: "iciricium"}) * 2)
        .addItemInput(<tconstruct:tool_rod>.withTag({Material: "alpha_fur"}) * 2)
        .addItemInput(<minecraft:snowball> * 256)
        .addEnergyPerTickInput(120)
        .addItemOutput(<modularmachinery:miner_frozen_controller>)
        .addItemOutput(<modularmachinery:itemblueprint>.withTag({dynamicmachine: "modularmachinery:miner_frozen"}))
        .build();
}
//机械高炉
for i in 2 to 7 {
    RecipeBuilder.newBuilder("controller_mechanical_blast_furnace" + i, "builder_" + i, 400)
        .addFluidInput(<liquid:redstone> * 23400)
        .addFluidInput(<liquid:lava> * 23400)
        .addItemInput(<ore:ingotBrickScorched> * 32)
        .addItemInput(<ore:ingotModularium> * 16)
        .addEnergyPerTickInput(300)
        .addItemOutput(<modularmachinery:mechanical_blast_furnace_controller>)
        .addItemOutput(<modularmachinery:itemblueprint>.withTag({dynamicmachine: "modularmachinery:mechanical_blast_furnace"}))
        .build();
}
//基因构造机
for i in 2 to 7 {
    RecipeBuilder.newBuilder("controller_gene_builder" + i, "builder_" + i, 1200)
        .addFluidInput(<liquid:redstone> * 38000)
        .addItemInput(<ore:plateCytosinite> * 4)
        .addItemInput(<ore:plateThyminite> * 4)
        .addItemInput(<ore:plateGuaninite> * 4)
        .addItemInput(<ore:plateAdeninite> * 4)
        .addItemInput(<ore:gearEmerald> * 20)
        .addItemInput(<ore:circuitBasic> * 20)
        .addItemInput(<ore:circuitAdvanced> * 10)
        .addEnergyPerTickInput(600)
        .addItemOutput(<modularmachinery:gene_builder_controller>)
        .addItemOutput(<modularmachinery:itemblueprint>.withTag({dynamicmachine: "modularmachinery:gene_builder"}))
        .build();
}
//有机灌注机
for i in 3 to 7 {
    RecipeBuilder.newBuilder("controller_organic_infuser" + i, "builder_" + i, 1600)
        .addFluidInput(<liquid:redstone> * 55200)
        .addFluidInput(<liquid:organic_fluid> * 55200)
        .addItemInput(<ore:plateInferium> * 12)
        .addItemInput(<ore:platePrudentium> * 10)
        .addItemInput(<ore:plateIntermedium> * 8)
        .addItemInput(<ore:plateSuperium> * 6)
        .addItemInput(<ore:plateSupremium> * 4)
        .addItemInput(<ore:plateInsanium> * 2)
        .addItemInput(<ore:gearInferium> * 32)
        .addItemInput(<ore:circuitBasic> * 8)
        .addItemInput(<ore:circuitAdvanced> * 4)
        .addEnergyPerTickInput(2400)
        .addItemOutput(<modularmachinery:organic_infuser_controller>)
        .addItemOutput(<modularmachinery:itemblueprint>.withTag({dynamicmachine: "modularmachinery:organic_infuser"}))
        .build();
}
//流体转换机
for i in 1 to 7 {
    RecipeBuilder.newBuilder("controller_liquid_converter" + i, "builder_" + i, 800)
        .addFluidInput(<liquid:redstone> * 2500)
        .addFluidInput(<liquid:experience> * 3000)
        .addItemInput(<ore:ingotModularium> * 32)
        .addItemInput(<minecraft:bucket> * 8)
        .addItemInput(<ore:gearAlubrass> * 8)
        .addEnergyPerTickInput(60)
        .addItemOutput(<modularmachinery:liquid_converter_controller>)
        .addItemOutput(<modularmachinery:itemblueprint>.withTag({dynamicmachine: "modularmachinery:liquid_converter"})) 
        .build();
}
//经验发电机
for i in 2 to 7 {
    RecipeBuilder.newBuilder("controller_exp_power_generater" + i, "builder_" + i, 1200)
        .addFluidInput(<liquid:redstone> * 2500)
        .addItemInput(<ore:ingotModularium> * 64)
        .addItemInput(<ore:plateExperience> * 32)
        .addItemInput(<ore:plateElementium> * 8)
        .addEnergyPerTickInput(300)
        .addItemOutput(<modularmachinery:exp_power_generator_controller>)
        .addItemOutput(<modularmachinery:itemblueprint>.withTag({dynamicmachine: "modularmachinery:exp_power_generator"})) 
        .build();
}
//不锈钢熔炉
for i in 1 to 7 {
    RecipeBuilder.newBuilder("controller_stainlesssteel_forge" + i, "builder_" + i, 800)
        .addFluidInput(<liquid:redstone> * 3500)
        .addItemInput(<ore:plateSteel> * 16)
        .addItemInput(<ore:plateManasteel> * 4)
        .addItemInput(<ore:plateTerrasteel> * 2)
        .addItemInput(<ore:gearManganese> * 8)
        .addItemInput(<ore:gearChromium> * 8)
        .addItemInput(<ore:gearNickel> * 8)
        .addItemInput(<ore:ingotModularium> * 32)
        .addEnergyPerTickInput(150)
        .addItemOutput(<modularmachinery:stainlesssteel_forge_controller>)
        .addItemOutput(<modularmachinery:itemblueprint>.withTag({dynamicmachine: "modularmachinery:stainlesssteel_forge"})) 
        .build();
}
//战利品发电机
for i in 2 to 7 {
    RecipeBuilder.newBuilder("controller_loot_power_generater" + i, "builder_" + i, 1200)
        .addFluidInput(<liquid:redstone> * 13200)
        .addItemInput(<ore:ingotModularium> * 64)
        .addItemInput(<ore:plateIron> * 32)
        .addItemInput(<ore:plateGold> * 8)
        .addEnergyPerTickInput(300)
        .addItemOutput(<modularmachinery:loot_power_generator_controller>)
        .addItemOutput(<modularmachinery:itemblueprint>.withTag({dynamicmachine: "modularmachinery:loot_power_generator"})) 
        .build();
}
//冷凝液化机
for i in 3 to 7 {
    RecipeBuilder.newBuilder("controller_condensation_liquefactor" + i, "builder_" + i, 1800)
        .addFluidInput(<liquid:redstone> * 18200)
        .addItemInput(<ore:gearCryonium> * 16)
        .addItemInput(<ore:gearOsmium> * 16)
        .addItemInput(<ore:gearPlatinum> * 16)
        .addItemInput(<ore:gearIridium> * 16)
        .addEnergyPerTickInput(1200)
        .addItemOutput(<modularmachinery:condensation_liquefactor_controller>)
        .addItemOutput(<modularmachinery:itemblueprint>.withTag({dynamicmachine: "modularmachinery:condensation_liquefactor"})) 
        .build();
}
//冷凝固化机
for i in 4 to 7 {
    RecipeBuilder.newBuilder("controller_condensation_solidificator" + i, "builder_" + i, 2000)
        .addFluidInput(<liquid:redstone> * 104400)
        .addItemInput(<ore:gearIceAlloy> * 16)
        .addItemInput(<ore:gearRuthenium> * 16)
        .addItemInput(<ore:gearRhodium> * 16)
        .addItemInput(<ore:gearPalladium> * 16)
        .addEnergyPerTickInput(2400)
        .addItemOutput(<modularmachinery:condensation_solidificator_controller>)
        .addItemOutput(<modularmachinery:itemblueprint>.withTag({dynamicmachine: "modularmachinery:condensation_solidificator"})) 
        .build();
}
//魔力液化机
for i in 3 to 7 {
    RecipeBuilder.newBuilder("controller_mana_liquefactor" + i, "builder_" + i, 1400)
        .addFluidInput(<liquid:redstone> * 50400)
        .addItemInput(<ore:gearManasteel> * 8)
        .addItemInput(<ore:gearTerrasteel> * 4)
        .addItemInput(<ore:gearMirion> * 4)
        .addItemInput(<ore:gearAeonsteel> * 1)
        .addEnergyPerTickInput(360)
        .addItemOutput(<modularmachinery:mana_liquefactor_controller>)
        .addItemOutput(<modularmachinery:itemblueprint>.withTag({dynamicmachine: "modularmachinery:mana_liquefactor"})) 
        .build();
}
//魔力释能机
for i in 4 to 7 {
    RecipeBuilder.newBuilder("controller_mana_powereducer" + i, "builder_" + i, 1666)
        .addFluidInput(<liquid:redstone> * 104400)
        .addItemInput(<ore:gearElementium> * 8)
        .addItemInput(<ore:gearElfsteel> * 4)
        .addItemInput(<ore:gearMirion> * 8)
        .addItemInput(<ore:gearChromasteel> * 1)
        .addEnergyPerTickInput(900)
        .addItemOutput(<modularmachinery:mana_powereducer_controller>)
        .addItemOutput(<modularmachinery:itemblueprint>.withTag({dynamicmachine: "modularmachinery:mana_powereducer"})) 
        .build();
}
//空气收集器
for i in 2 to 7 {
    RecipeBuilder.newBuilder("controller_air_collector" + i, "builder_" + i, 1333)
        .addFluidInput(<liquid:redstone> * 13200)
        .addItemInput(<ore:plateOsmium> * 32)
        .addItemInput(<ore:plateIridium> * 20)
        .addItemInput(<ore:platePlatinum> * 20)
        .addItemInput(<ore:plateOsgloglas> * 16)
        .addItemInput(<ore:plateSentientMetal> * 8)
        .addItemInput(<minecraft:bucket> * 16)
        .addEnergyPerTickInput(1200)
        .addItemOutput(<modularmachinery:air_collector_controller>)
        .addItemOutput(<modularmachinery:itemblueprint>.withTag({dynamicmachine: "modularmachinery:air_collector"})) 
        .build();
}
//矩阵稳定机
for i in 4 to 7 {
    RecipeBuilder.newBuilder("controller_matrix_balancer" + i, "builder_" + i, 2666)
        .addFluidInput(<liquid:redstone> * 454400)
        .addItemInput(<ore:gearFusionMatrix> * 8)
        .addItemInput(<ore:gearElectronium> * 8)
        .addItemInput(<ore:gearProtonium> * 8)
        .addItemInput(<ore:gearCosmilite> * 1)
        .addItemInput(<ore:plateRuthenium> * 16)
        .addItemInput(<ore:plateRhodium> * 16)
        .addItemInput(<ore:platePalladium> * 16)
        .addItemInput(<ore:plateOsmium> * 16)
        .addItemInput(<ore:plateIridium> * 16)
        .addItemInput(<ore:platePlatinum> * 16)
        .addItemInput(<ore:itemPurpleMatter> * 4)
        .addEnergyPerTickInput(6000)
        .addItemOutput(<modularmachinery:matrix_balancer_controller>)
        .addItemOutput(<modularmachinery:itemblueprint>.withTag({dynamicmachine: "modularmachinery:matrix_balancer"})) 
        .build();
}
//血灵祭坛
for i in 3 to 7 {
    RecipeBuilder.newBuilder("controller_blood_altar_mk7" + i, "builder_" + i, 1666)
        .addFluidInput(<liquid:redstone> * 275600)
        .addFluidInput(<liquid:lifeessence> * 16000)
        .addItemInput(<ore:plateCrimsonite> * 8)
        .addItemInput(<ore:plateChromasteel> * 4)
        .addItemInput(<ore:plateCthughate> * 12)
        .addItemInput(<ore:plateMithrillium> * 2)
        .addItemInput(<ore:plateAdaminite> * 1)
        .addItemInput(<ore:gearSentientMetal> * 3)
        .addItemInput(<ore:gearWigthium> * 2)
        .addItemInput(<additions:bloody-slate_6> * 4)
        .addEnergyPerTickInput(2400)
        .addItemOutput(<modularmachinery:blood_altar_mk7_controller>)
        .addItemOutput(<modularmachinery:itemblueprint>.withTag({dynamicmachine: "modularmachinery:blood_altar_mk7"})) 
        .build();
}
//血浴祭坛
for i in 4 to 7 {
    RecipeBuilder.newBuilder("controller_blood_altar_mk8" + i, "builder_" + i, 2000)
        .addFluidInput(<liquid:redstone> * 275600)
        .addFluidInput(<liquid:lifeessence> * 128000)
        .addItemInput(<ore:plateCrimsonite> * 8)
        .addItemInput(<ore:plateCosmilite> * 2)
        .addItemInput(<ore:plateDarkest> * 8)
        .addItemInput(<ore:plateWigthium> * 8)
        .addItemInput(<ore:gearGhostMetal> * 2)
        .addItemInput(<ore:gearBoundMetal> * 4)
        .addItemInput(<ore:gearSentientMetal> * 4)
        .addItemInput(<additions:bloody-slate_7> * 4)
        .addEnergyPerTickInput(3000)
        .addItemOutput(<modularmachinery:blood_altar_mk8_controller>)
        .addItemOutput(<modularmachinery:itemblueprint>.withTag({dynamicmachine: "modularmachinery:blood_altar_mk8"})) 
        .build();
}
//秩序注入器
for i in 4 to 7 {
    RecipeBuilder.newBuilder("controller_order_fusioner" + i, "builder_" + i, 2666)
        .addFluidInput(<liquid:redstone> * 523600)
        .addItemInput(<ore:gearDraconiumRuled> * 8)
        .addItemInput(<ore:gearWitheriumEquipment> * 8)
        .addItemInput(<ore:gearDraconium> * 64)
        .addItemInput(<ore:gearWitherium> * 64)
        .addItemInput(<ore:plateBetwnite> * 2)
        .addItemInput(<ore:plateAbyssine> * 2)
        .addItemInput(<ore:plateEugardite> * 16)
        .addItemInput(<ore:ingotBalancedMatrix> * 4)
        .addItemInput(<ore:stoneOrdered> * 64)
        .addItemInput(<ore:gemOrderCrystal> * 2)
        .addItemInput(<ore:blockChaosShard> * 1)
        .addItemInput(<ore:blockStormyShard> * 1)
        .addEnergyPerTickInput(6000)
        .addItemOutput(<modularmachinery:order_fusioner_controller>)
        .addItemOutput(<modularmachinery:itemblueprint>.withTag({dynamicmachine: "modularmachinery:order_fusioner"})) 
        .build();
}
//灵气熔炉
for i in 4 to 7 {
    RecipeBuilder.newBuilder("controller_aura_crafter" + i, "builder_" + i, 1200)
        .addFluidInput(<liquid:redstone> * 128000)
        .addItemInput(<naturesaura:infused_stone> * 24)
        .addItemInput(<ore:plateAuraIron> * 12)
        .addItemInput(<ore:plateSky> * 10)
        .addItemInput(<ore:plateEarth> * 10)
        .addItemInput(<additions:greedycraft-token_emotion> * 4)
        .addItemInput(<extrabotany:material:3> * 4)
        .addEnergyPerTickInput(2200)
        .addItemOutput(<modularmachinery:aura_crafter_controller>)
        .addItemOutput(<modularmachinery:itemblueprint>.withTag({dynamicmachine: "modularmachinery:aura_crafter"})) 
        .build();
}
//通量凝结装置
for i in 4 to 7 {
    RecipeBuilder.newBuilder("controller_flux_melter" + i, "builder_" + i, 2400)
        .addFluidInput(<liquid:redstone> * 384000)
        .addItemInput(<ore:blockRedstone> * 32)
        .addItemInput(<actuallyadditions:item_crystal_empowered> * 24)
        .addItemInput(<ore:gearGelidEnderium> * 4)
        .addItemInput(<ore:gearOsgloglas> * 4)
        .addItemInput(<ore:gearKillerAlloy> * 2)
        .addItemInput(<draconicevolution:draconium_capacitor:1>)
        .addEnergyPerTickInput(2500)
        .addItemOutput(<modularmachinery:flux_melter_controller>)
        .addItemOutput(<modularmachinery:itemblueprint>.withTag({dynamicmachine: "modularmachinery:flux_melter"})) 
        .build();
}
//通量还原装置
for i in 4 to 7 {
    RecipeBuilder.newBuilder("controller_flux_reducer" + i, "builder_" + i, 2400)
        .addFluidInput(<liquid:redstone> * 384000)
        .addItemInput(<ore:blockRedstone> * 32)
        .addItemInput(<actuallyadditions:item_crystal_empowered> * 24)
        .addItemInput(<ore:gearGelidEnderium> * 4)
        .addItemInput(<ore:gearPorpezite> * 4)
        .addItemInput(<ore:gearCreativeAlloy> * 1)
        .addItemInput(<draconicevolution:draconium_capacitor:1>)
        .addEnergyPerTickInput(2500)
        .addItemOutput(<modularmachinery:flux_reducer_controller>)
        .addItemOutput(<modularmachinery:itemblueprint>.withTag({dynamicmachine: "modularmachinery:flux_reducer"})) 
        .build();
}
