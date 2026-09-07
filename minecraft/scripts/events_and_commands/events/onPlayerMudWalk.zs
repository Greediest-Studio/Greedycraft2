import crafttweaker.player.IPlayer;
import crafttweaker.item.IItemStack;

import native.erebus.events.PlayerMudWalkEvent;
import mods.ticlib.TicTool;

events.register(function(event as PlayerMudWalkEvent) {
    var player as IPlayer = event.getPlayer().wrapper;
    if (player.hasArmorTrait("erebus_walker_armor")) {
        event.setApplyMud(false);
    }else {
        event.setApplyMud(true);
    }
});