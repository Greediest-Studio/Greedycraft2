#loader contenttweaker

import crafttweaker.player.IPlayer;
import crafttweaker.item.IItemStack;
import mods.contenttweaker.VanillaFactory;
import mods.ctutils.utils.Math;
import mods.randomtweaker.item.IManaItem;
import mods.randomtweaker.item.IManaBauble;
import mods.randomtweaker.botania.IManaItemHandler;

function getManaBaublesAndItems(player as IPlayer) as IItemStack[] {
    var outputList as IItemStack[] = [];
    if (!(isNull(IManaItemHandler.getManaItems(player)) || IManaItemHandler.getManaItems(player).length == 0)) {
        for manaItem in IManaItemHandler.getManaItems(player) {
            outputList += manaItem;
        }
    }
    if (!(isNull(IManaItemHandler.getManaBaubles(player)) || IManaItemHandler.getManaBaubles(player).length == 0)) {
        for manaBauble in IManaItemHandler.getManaBaubles(player).values {
            outputList += manaBauble;
        }
    }
    return outputList;
}

val core_of_22_pass = VanillaFactory.createBaubleItem("bauble_core_of_22_pass");
core_of_22_pass.rarity = "epic";
core_of_22_pass.baubleType = "TRINKET";
core_of_22_pass.onWornTick = function(item, wearer) {
    if (wearer instanceof IPlayer) {
        var player as IPlayer = wearer;
        if (!player.world.isRemote() && player.world.time % 20 == 0) {
            if (getManaBaublesAndItems(player).length > 0) {
                for manaItem in getManaBaublesAndItems(player) {
                    IManaItemHandler.dispatchMana(manaItem, player, 2200, true);
                }
            }
        }
    }
};
core_of_22_pass.register();