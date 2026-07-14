/*
 * This script is created for the GreedyCraft II modpack by mc_Edwin.
 * You may NOT use this script in any other publicly distributed modpack without my permission.
 */

#sideonly client

import crafttweaker.player.IPlayer;
import mods.zenutils.NetworkHandler;

import mods.eventtweaker.Minecraft;
import native.com.teammetallurgy.atum.utils.AtumRenderHelper;
import crafttweaker.event.PlayerTickEvent;

events.onPlayerTick(function(event as crafttweaker.event.PlayerTickEvent) {

    var player = event.player;

    if (player.dimension == 17 && player.hasArmorTrait("atum_vision_armor")) {
        AtumRenderHelper.setFogAndSandRenderFactor(player.native, 0.2f);
    } else {
        AtumRenderHelper.setFogAndSandRenderFactor(player.native, 1.0f);
    }

    if (event.player.world.getWorldTime() % 20 == 0) {
        var fps as int = Minecraft.getfps();
        NetworkHandler.sendToServer("fps", function(bytebuf) {
            bytebuf.writeInt(fps);
        });
    }}
);