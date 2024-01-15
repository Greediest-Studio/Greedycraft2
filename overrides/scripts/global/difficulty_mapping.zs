/*
 * This script is created for the GreedyCraft modpack by TCreopargh.
 * You may NOT use this script in any other publicly distributed modpack without my permission. 
 */ 

#priority 32765
#packmode casual adventure

import crafttweaker.data.IData;

global stageMap as int[string] = {
    "getting_started" : 0,
    "twilight_forest" : 20,
    "nether" : 64,
    "abyssal_conquerer" : 128,
    "wither_slayer" : 256,
    "ender_charm" : 320,
    "hardmode" : 640,
    "wyvern" : 750,
    "awakened" : 900,
    "chaotic_dominator" : 1200,
    "chaotic" : 1400,
    "storm_breaker" : 1600,
    "stormy" : 1750,
    "cosmic" : 1900,
    "balanced_matrix" : 2150,
    "betweenland_traveller" : 2300,
    "abyss_guardian" : 2480,
    "order" : 2600,
    "final" : 3000,
    "wielder_of_infinity" : 4800,
    "super_hardmode" : 4800
} as int[string];
