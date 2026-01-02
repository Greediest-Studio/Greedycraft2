import crafttweaker.player.IPlayer;
import crafttweaker.item.IItemStack;

import native.erebus.events.PlayerMudWalkEvent;

events.register(function(event as PlayerMudWalkEvent) {
    var player as IPlayer = event.getPlayer().wrapper;
    var pass as bool = false;
    if (!(isNull(player.armorInventory) || isNull(player.armorInventory.length == 0))) {
        for armor in player.armorInventory {
            if (TicTraitLib.hasTicTrait(armor, "erebus_walker_armor")) {
                pass = true;
                break;
            }
        }
    }
    if (pass) {
        event.setApplyMud(false);
    } else {
        event.setApplyMud(true);
    }
});