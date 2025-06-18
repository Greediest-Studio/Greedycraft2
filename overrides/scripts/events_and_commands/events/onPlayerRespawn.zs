/*
 * This script is created for the GreedyCraft modpack by TCreopargh.
 * You may NOT use this script in any other publicly distributed modpack without my permission.
 */

#priority 90

import crafttweaker.event.PlayerLoggedInEvent;
import crafttweaker.event.IPlayerEvent;
import crafttweaker.event.PlayerRespawnEvent;
import crafttweaker.event.PlayerTickEvent;
import crafttweaker.data.IData;
import crafttweaker.damage.IDamageSource;
import crafttweaker.entity.IEntityLivingBase;
import crafttweaker.player.IPlayer;
import crafttweaker.util.Position3f;
import crafttweaker.block.IBlock;
import crafttweaker.world.IBlockPos;
import crafttweaker.block.IBlockState;
import crafttweaker.potions.IPotionEffect;
import crafttweaker.world.IFacing;
import crafttweaker.command.ICommandSender;

import mods.ctutils.utils.Math;
import mods.ctutils.world.IGameRules;

val killEntities as string[] = [
    "mowziesmobs:barako",
    "mowziesmobs:barakoaya",
    "mowziesmobs:barakoana",
    "mowziesmobs:frostmaw",
    "twilightforest:yeti",
    "dungeonsmod:kraken",
    "gct_mobs:zethur",
    "gct_mobs:weather_eyevil",
    "aether_legacy:zephyr",
    "gct_mobs:weather_water_rod",
    "endreborn:endlord",
    "endreborn:endguard",
    "minecraft:ghast",
    "netherex:ghast_queen",
    "dungeonsmod:ironslime",
    "minecraft:slime",
    "dungeonsmod:kraken",
    "minecraft:guardian"
];

events.onPlayerRespawn(function (event as crafttweaker.event.PlayerRespawnEvent) {

    for entity in killEntities {
        server.commandManager.executeCommand(server, "/ctrlkill " + entity + " 0");
    }
});
