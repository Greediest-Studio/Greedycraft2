#loader contenttweaker

import crafttweaker.player.IPlayer;
import crafttweaker.item.IItemStack;
import mods.contenttweaker.VanillaFactory;
import mods.ctutils.utils.Math;

var crimson_ring = VanillaFactory.createBaubleItem("bauble_crimson_ring");
crimson_ring.rarity = "epic";
crimson_ring.baubleType = "RING";
crimson_ring.onWornTick = function(item, wearer) {
    if (isNull(item.tag.crimsonPower)) {
        item.mutable().updateTag({crimsonPower : 0 as int});
    }
};
crimson_ring.register();