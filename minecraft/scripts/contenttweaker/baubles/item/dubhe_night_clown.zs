#loader contenttweaker

import crafttweaker.player.IPlayer;
import crafttweaker.item.IItemStack;
import mods.contenttweaker.VanillaFactory;
import mods.ctutils.utils.Math;

var dubhe_night_clown = VanillaFactory.createBaubleItem("bauble_dubhe_night_clown");
dubhe_night_clown.rarity = "epic";
dubhe_night_clown.baubleType = "HEAD";
dubhe_night_clown.onWornTick = function(item, wearer) {
    if (wearer instanceof IPlayer && !wearer.world.remote) {
        var player as IPlayer = wearer;
        player.addPotionEffect(<potion:contenttweaker:erebus_protection>.makePotionEffect(20, 0, false, false));
    }
};
dubhe_night_clown.register();