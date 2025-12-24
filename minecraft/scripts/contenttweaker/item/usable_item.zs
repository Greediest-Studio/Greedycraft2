#loader contenttweaker
import mods.contenttweaker.VanillaFactory;
import mods.contenttweaker.Item;

import crafttweaker.player.IPlayer;
import crafttweaker.world.IWorld;
import crafttweaker.item.IItemStack;

val dubhe_key = VanillaFactory.createItem("dubhe_key");
dubhe_key.maxStackSize = 1;
dubhe_key.itemRightClick = function(stack, world, user, hand) {
    var targetDim as int = 0;
    if (world.isDayTime()) {
        targetDim = 17;
    } else {
        targetDim = 66;
    }
    if (!world.remote && hand == "MAIN_HAND") {
        var player = user;
        if (world.dimension != targetDim) {
            var x = player.x as int;
            var y = 64 as int;
            var z = player.z as int;
            val destination = IWorld.getFromID(targetDim);
            var tp = true;
            if (destination.getBlock(x,y,z).definition.id == "minecraft:air" && destination.getBlock(x,y + 1,z).definition.id == "minecraft:air" && destination.getBlock(x,y - 1,z).definition.id != "minecraft:air" && destination.getBlock(x,y - 1,z).definition.id != "erebus:formic_acid") {
                server.commandManager.executeCommand(server, "/forge setdimension " ~ player.name ~ " " ~ (targetDim as string) ~ " " ~ (x as string) ~ " " ~ (y as string) ~ " " ~ (z as string));
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
                                server.commandManager.executeCommand(server, "/forge setdimension " ~ player.name ~ " " ~ (targetDim as string) ~ " " ~ (x + i) as string ~ " " ~ (y + j) as string ~ " " ~ (z + k) as string);
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
                                server.commandManager.executeCommand(server, "/forge setdimension " ~ player.name ~ " " ~ (targetDim as string) ~ " " ~ (x + i) as string ~ " " ~ (y + j) as string ~ " " ~ (z + k) as string);
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
    }
    return "Pass";
};
dubhe_key.register();