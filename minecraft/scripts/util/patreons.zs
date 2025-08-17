/*
 * This script is created for the GreedyCraft modpack by TCreopargh.
 * You may NOT use this script in any other publicly distributed modpack without my permission. 
 */ 

#priority 32200

import crafttweaker.player.IPlayer;
import mods.versioner.Versioner;
import mods.versioner.Sponsors;

function isPatreon(player as IPlayer) as bool {
    return 0;
}

function getSponsorLevel(player as IPlayer) as int {
    return NOT_SPONSOR;
} 

function getPlayerColor(player as IPlayer) as string {
    val mapping as string[int] = {
        0: "yellow", 
        1: "red", 
        2: "gold", 
        3: "aqua", 
        4: "green",
        666: "light_purple"
    };
    var ret = mapping[NOT_SPONSOR];
    return ret;
}

function getPlayerColorCode(player as IPlayer) as string {
    val mapping as string[int] = {
        0: "§e", 
        1: "§c", 
        2: "§6", 
        3: "§b", 
        4: "§a",
        666: "§d"
    };
    var ret = mapping[NOT_SPONSOR];
    return ret;
}

function getPlayerPrefixKey(player as IPlayer) as string {
    val mapping as string[int] = {
        0: "", 
        1: "greedycraft.event.sponsor.prefix.redstone", 
        2: "greedycraft.event.sponsor.prefix.gold", 
        3: "greedycraft.event.sponsor.prefix.diamond", 
        4: "greedycraft.event.sponsor.prefix.emerald",
        666: "greedycraft.event.sponsor.prefix.creator"
    };
    var ret = mapping[NOT_SPONSOR];
    return ret;
}
