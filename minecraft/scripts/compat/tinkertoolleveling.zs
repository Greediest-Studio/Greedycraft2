/*
 * This script is created for the GreedyCraft modpack by TCreopargh.
 * You may NOT use this script in any other publicly distributed modpack without my permission. 
 */

#sideonly server
#priority 800

for i in 0 to 4096 {
    var num as int = i;
    var str as string = ""; 
    while num >= 625 {
        str += "§c☯";
        num -= 625;
    }
    while num >= 125 {
        str += "§6⚜";
        num -= 100;
    }
    while num >= 25 {
        str += "§d♔";
        num -= 10;
    }
    while num >= 5 {
        str += "§b✪";
        num -= 5;
    }
    while num >= 1 {
        str += "§e★";
        num -= 1;
    }
    game.setLocalization("tooltip.level." + i, str);
}
