/*
 * This script is created for the GreedyCraft modpack by TCreopargh.
 * You may NOT use this script in any other publicly distributed modpack without my permission.
 */

#priority 1000

import mods.MobStages;

import scripts.util.gamestages as GameStagesUtil;

val mobStages as string[string] = {
    "touhou_little_maid:entity.monster.fairy": "nether",
    "touhou_little_maid:entity.monster.rinnosuke": "nether",
    "minecraft:wither_skeleton": "twilight_shield",
    "thaumcraft:eldritchguardian": "novice_wizard",
    "thaumcraft:cultistportallesser": "novice_wizard",
    "mowziesmobs:barako": "wyvern",
    "mowziesmobs:frostmaw": "hardmode",
    "minecraft:wither": "abyssal_conquerer",
    "ageofminecraft:enderdragonhelpful": "disabled"
} as string[string];

for mob, stage in mobStages {
    MobStages.addStage(stage, mob);
    MobStages.addRange(mob, 256);
}
