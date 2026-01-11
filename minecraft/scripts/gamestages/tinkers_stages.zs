/*
 * This script is created for the GreedyCraft modpack by TCreopargh.
 * You may NOT use this script in any other publicly distributed modpack without my permission. 
 */ 

#priority 299

import crafttweaker.item.IItemStack;
import mods.TinkerStages;

val materialStages as string[string] = {
    "ma.supremium": "hardmode",
    "insanium": "hardmode",
    "extremium": "hardmode",
    "godlikeum": "hardmode",
    "nonenium": "hardmode",
    "mirion": "abyssal_conquerer"
} as string[string];

val toolTypeStages as string[string] = {
    "tconevo:tool_sceptre": "wand_blueprint",
    "tconstruct:rapier": "tactic_blueprint",
    "tconstruct:longsword": "tactic_blueprint",
    "plustic:katana": "tactic_blueprint",
    "plustic:laser_gun": "laser_gun_blueprint",
    "tconstruct:cleaver": "tactic_blueprint",
    "tconstruct:shuriken": "shuriken_blueprint",
    "tcongreedyaddon:battleaxe": "tinkering_blueprint",
    "moretcon:gauntlet": "ring_blueprint",
    "moretcon:ring": "ring_blueprint",
    "moretcon:blaxe": "betweenland_traveller",
    "moretcon:blpick": "betweenland_traveller",
    "moretcon:blsword": "betweenland_traveller",
    "moretcon:blshovel": "betweenland_traveller",
    "moretcon:blbow": "betweenland_traveller",
    "tcongreedyaddon:greatblade": "awakened",
    "tcongreedyaddon:allinonetool": "awakened",
    "moretcon:bomb": "awakened"
} as string[string];

TinkerStages.addModifierStage("hardmode", "mending_moss");

for toolType in toolTypeStages {
    var stage as string = toolTypeStages[toolType] as string;
    TinkerStages.addToolTypeStage(stage, toolType);
}

for material in materialStages {
    var stage as string = materialStages[material] as string;
    TinkerStages.addMaterialStage(stage, material);
}
