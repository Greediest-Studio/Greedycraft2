#loader contenttweaker

import mods.contenttweaker.VanillaFactory;
import mods.contenttweaker.ItemFood;
import crafttweaker.world.IWorld;

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

//恶意果实
var malevolentfruit as ItemFood = VanillaFactory.createItemFood("malevolent_fruit", 2);
malevolentfruit.saturation = 0.2;
malevolentfruit.alwaysEdible = true;
malevolentfruit.onItemFoodEaten = function(stack, world, player) {
    if (!world.remote) {
        if (world.dimension != 66) {
            var x = player.x as int;
            var y = 64 as int;
            var z = player.z as int;
            val destination = IWorld.getFromID(66);
            var tp = true;
            if (destination.getBlock(x,y,z).definition.id == "minecraft:air" && destination.getBlock(x,y + 1,z).definition.id == "minecraft:air" && destination.getBlock(x,y - 1,z).definition.id != "minecraft:air" && destination.getBlock(x,y - 1,z).definition.id != "erebus:formic_acid") {
                server.commandManager.executeCommand(server, "/forge setdimension " ~ player.name ~ " 66 " ~ (x as string) ~ " " ~ (y as string) ~ " " ~ (z as string));
                tp = false;
            }
            if (tp) {
                var i as int = -16;
                var j as int = -16;
                var k as int = -16;
                while ((i <= 16) && tp) {
                    while ((j <= 16) && tp) {
                        while ((k <= 16) && tp) {
                            if (destination.getBlock(x + i,y + j,z + k).definition.id == "minecraft:air" && destination.getBlock(x + i,y + j + 1,z + k).definition.id == "minecraft:air" && destination.getBlock(x + i,y + j - 1,z + k).definition.id != "minecraft:air" && destination.getBlock(x,y - 1,z).definition.id != "erebus:formic_acid") {
                                server.commandManager.executeCommand(server, "/forge setdimension " ~ player.name ~ " 66 " ~ (x + i) as string ~ " " ~ (y + j) as string ~ " " ~ (z + k) as string);
                                tp = false;
                            }
                            k += 1;
                        }
                        k = -16;
                        j += 1;
                    }
                    j = -16;
                    i += 1;
                }
            }
            if (tp) {
                var i as int = -64;
                var j as int = -63;
                var k as int = -64;
                while ((i <= 64) && tp) {
                    while ((j <= 128) && tp) {
                        while ((k <= 64) && tp) {
                            if (destination.getBlock(x + i,y + j,z + k).definition.id == "minecraft:air" && destination.getBlock(x + i,y + j + 1,z + k).definition.id == "minecraft:air" && destination.getBlock(x + i,y + j - 1,z + k).definition.id != "minecraft:air" && destination.getBlock(x,y - 1,z).definition.id != "erebus:formic_acid") {
                                server.commandManager.executeCommand(server, "/forge setdimension " ~ player.name ~ " 66 " ~ (x + i) as string ~ " " ~ (y + j) as string ~ " " ~ (z + k) as string);
                                tp = false;
                            }
                            k += 1;
                        }
                        k = -64;
                        j += 1;
                    }
                    j = -64;
                    i += 1;
                }
            }
        }
        player.addPotionEffect(<potion:contenttweaker:erebus_protection>.makePotionEffect(2400, 0));
    }
};
malevolentfruit.register();