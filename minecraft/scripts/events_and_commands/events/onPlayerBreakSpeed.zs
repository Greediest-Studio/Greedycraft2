/*
 * This script is created for the GreedyCraft modpack by TCreopargh.
 * You may NOT use this script in any other publicly distributed modpack without my permission.
 */

#priority 90

import crafttweaker.event.PlayerBreakSpeedEvent;
import crafttweaker.player.IPlayer;
import crafttweaker.item.IItemStack;
import crafttweaker.block.IBlock;
import crafttweaker.block.IBlockState;
import crafttweaker.world.IWorld;
import crafttweaker.world.IBlockPos;
import crafttweaker.util.Position3f;

import mods.ctutils.utils.Math;

events.onPlayerBreakSpeed(function(event as PlayerBreakSpeedEvent) {
    var player as IPlayer = event.player;
    var block as IBlock = event.block;
    var blockState as IBlockState = event.blockState;
    var world as IWorld = player.world;
    var pos as IBlockPos = event.position;
    var newPos as IBlockPos = pos;
    if (!world.remote) {
        // Breedum Ore random teleportation
        if (block.definition.id == "additions:breedum_ore") {
            if (Math.random() < 0.01) {
                for i in -3 to 4 {
                    for j in -3 to 4 {
                        for k in -3 to 4 {
                            var targetPos as IBlockPos = Position3f.create(pos.x + i, pos.y + j, pos.z + k) as IBlockPos;
                            if (world.getBlock(targetPos).definition.id == "minecraft:end_stone") {
                                newPos = targetPos;
                                break;
                            }
                        }
                    }
                }
                world.setBlockState(<blockstate:minecraft:end_stone>, pos);
                world.setBlockState(<blockstate:additions:breedum_ore>, newPos);
            }
        }

        // Ban non-Tinkers' Construct pickaxes with a harvest level greater than 5
        if (!isNull(player.currentItem)) {
            var pickaxe as IItemStack = player.currentItem;
            if (pickaxe.getHarvestLevel("pickaxe") > 5 && !(TicLib.isTicTool(pickaxe) || pickaxe.definition.id has "draconicevolution:" || pickaxe.definition.id has "avaritia:")) {
                event.newSpeed = 0;
                player.sendChat("§4你不能使用挖掘等级大于5的非匠魂镐子挖掘方块！");
                event.cancel();
            } 
        }
    }
});
