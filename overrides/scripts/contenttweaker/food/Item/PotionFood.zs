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

var jelly as ItemFood = VanillaFactory.createItemFood("jelly", 4);
jelly.creativeTab = <creativetab:foodcore>;
jelly.saturation = 0.6;
jelly.alwaysEdible = true;
jelly.onItemFoodEaten = function(stack, world, player) {
    if (!world.remote) {
        player.addPotionEffect(<potion:minecraft:nausea>.makePotionEffect(200, 0));
    }
};
jelly.register();

var batwing as ItemFood = VanillaFactory.createItemFood("batwing", 1);
batwing.creativeTab = <creativetab:foodcore>;
batwing.saturation = 0.1;
batwing.alwaysEdible = true;
batwing.onItemFoodEaten = function(stack, world, player) {
    if (!world.remote) {
        player.addPotionEffect(<potion:minecraft:hunger>.makePotionEffect(200, 0));
    }
};
batwing.register();

var cookedbatwing as ItemFood = VanillaFactory.createItemFood("cookedbatwing", 3);
cookedbatwing.creativeTab = <creativetab:foodcore>;
cookedbatwing.saturation = 0.2;
cookedbatwing.alwaysEdible = true;
cookedbatwing.onItemFoodEaten = function(stack, world, player) {
    if (!world.remote) {
        player.addPotionEffect(<potion:minecraft:hunger>.makePotionEffect(200, 0));
    }
};
cookedbatwing.register();

//烈焰汤
var blazecream as ItemFood = VanillaFactory.createItemFood("blazecream", 4);
blazecream.creativeTab = <creativetab:foodcore>;
blazecream.saturation = 0.4;
blazecream.alwaysEdible = true;
blazecream.onItemFoodEaten = function(stack, world, player) {
    if (!world.remote) {
        player.give(<item:minecraft:bowl>);
        player.addPotionEffect(<potion:minecraft:fire_resistance>.makePotionEffect(300, 0));
    }
};
blazecream.register();

//蜘蛛汤
var spidersoup as ItemFood = VanillaFactory.createItemFood("spidersoup", 3);
spidersoup.creativeTab = <creativetab:foodcore>;
spidersoup.saturation = 0.4;
spidersoup.alwaysEdible = true;
spidersoup.onItemFoodEaten = function(stack, world, player) {
    if (!world.remote) {
        player.give(<item:minecraft:bowl>);
        player.addPotionEffect(<potion:minecraft:night_vision>.makePotionEffect(200, 0));
        player.addPotionEffect(<potion:minecraft:poison>.makePotionEffect(100, 0));
    }
};
spidersoup.register();

//地狱疣汤
var netherwartsoup as ItemFood = VanillaFactory.createItemFood("netherwartsoup", 4);
netherwartsoup.creativeTab = <creativetab:foodcore>;
netherwartsoup.saturation = 0.4;
netherwartsoup.alwaysEdible = true;
netherwartsoup.onItemFoodEaten = function(stack, world, player) {
    if (!world.remote) {
        player.give(<item:minecraft:bowl>);
        player.setFire(5);
    }
};
netherwartsoup.register();

//饿果
var starvingfruit as ItemFood = VanillaFactory.createItemFood("starvingfruit", 0);
starvingfruit.creativeTab = <creativetab:foodcore>;
starvingfruit.saturation = 0;
starvingfruit.alwaysEdible = true;
starvingfruit.onItemFoodEaten = function(stack, world, player) {
    if (!world.remote) {
        player.foodStats.addStats(-20,-20);
    }
};
starvingfruit.register();

