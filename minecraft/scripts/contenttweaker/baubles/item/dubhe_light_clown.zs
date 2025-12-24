#loader contenttweaker

import crafttweaker.player.IPlayer;
import crafttweaker.item.IItemStack;
import mods.contenttweaker.VanillaFactory;
import mods.ctutils.utils.Math;

var dubhe_light_clown = VanillaFactory.createBaubleItem("bauble_dubhe_light_clown");
dubhe_light_clown.rarity = "epic";
dubhe_light_clown.baubleType = "HEAD";
dubhe_light_clown.onWornTick = function(item, wearer) {
    if (wearer instanceof IPlayer && !wearer.world.remote) {
        var player as IPlayer = wearer;
        player.addPotionEffect(<potion:contenttweaker:atum_protection>.makePotionEffect(20, 0, false, false));
    }
};
dubhe_light_clown.register();