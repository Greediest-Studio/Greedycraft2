/*
 * This script is created for the GreedyCraft II modpack by mc_Edwin.
 * You may NOT use this script in any other publicly distributed modpack without my permission.
 */

#sideonly client

import crafttweaker.player.IPlayer;

import mods.zenutils.NetworkHandler;

import native.net.minecraft.client.Minecraft;

events.onPlayerTick(function(event as crafttweaker.event.PlayerTickEvent) {
    if (event.player.world.getWorldTime() % 20 == 0) {
        var fps as int = Minecraft.getDebugFPS();
        NetworkHandler.sendToServer("fps", function(bytebuf) {
            bytebuf.writeInt(fps);
        });
    }
});