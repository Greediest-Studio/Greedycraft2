#loader contenttweaker

import crafttweaker.player.IPlayer;
import crafttweaker.item.IItemStack;
import mods.contenttweaker.VanillaFactory;
import mods.ctutils.utils.Math;

var bauble_source_of_swamp = VanillaFactory.createBaubleItem("bauble_source_of_swamp");
bauble_source_of_swamp.rarity = "epic";
bauble_source_of_swamp.baubleType = "TRINKET";
bauble_source_of_swamp.onWornTick = function(item, entity) {
    if (entity instanceof IPlayer) {
        var player as IPlayer = entity;
        if (player.isPotionActive(<potion:contenttweaker:malevolence_catalyst>)) {
            if (Math.random() < 0.003) {
                for i in 1 to 10 {
                    if (!isNull(player.getHotbarStack(i))) {
                        var consume as IItemStack = player.getHotbarStack(i);
                        if (consume.definition.id == "thebetweenlands:octine_ingot") {
                            consume.mutable().shrink(1);
                            player.give(<item:additions:malevolencite_ingot>);
                            break;
                        }
                    }
                }
            }
        } else if (Math.random() < 0.001) {
            for i in 1 to 10 {
                if (!isNull(player.getHotbarStack(i))) {
                    var consume as IItemStack = player.getHotbarStack(i);
                    if (consume.definition.id == "thebetweenlands:octine_ingot") {
                        consume.mutable().shrink(1);
                        player.give(<item:additions:malevolencite_ingot>);
                        break;
                    }
                }
            }
        }
    }
};
bauble_source_of_swamp.register();