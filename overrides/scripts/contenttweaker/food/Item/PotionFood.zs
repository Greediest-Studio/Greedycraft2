#loader contenttweaker

import mods.contenttweaker.VanillaFactory;
import mods.contenttweaker.ItemFood;

//战斗卷饼
var battleburrito as ItemFood = VanillaFactory.createItemFood("battleburrito", 10);
battleburrito.saturation = 0.8;
battleburrito.alwaysEdible = true;
battleburrito.onItemFoodEaten = function(stack, world, player) {
    if (!world.remote) {
        player.addPotionEffect(<potion:minecraft:strength>.makePotionEffect(2400, 3));
        player.addPotionEffect(<potion:minecraft:absorption>.makePotionEffect(2400, 3));
        player.addPotionEffect(<potion:minecraft:resistance>.makePotionEffect(1200, 1));
        player.addPotionEffect(<potion:minecraft:regeneration>.makePotionEffect(480, 1));
        player.addPotionEffect(<potion:contenttweaker:rejuvenation>.makePotionEffect(200, 0));
    }
};
battleburrito.register();

