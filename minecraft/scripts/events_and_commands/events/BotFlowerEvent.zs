#reloadable


import crafttweaker.world.IWorld;
import crafttweaker.world.IBlockPos;
import crafttweaker.world.IFacing;

import crafttweaker.data.IData;

import crafttweaker.item.IItemStack;

import crafttweaker.text.ITextComponent;

import crafttweaker.event.CropGrowPreEvent;
import crafttweaker.events.IEventManager;

import crafttweaker.player.IPlayer;

import crafttweaker.server.IServer;

import crafttweaker.block.IBlock;
import crafttweaker.block.IBlockState;

import mods.randomtweaker.cote.SubTileEntityInGame;

import mods.eventtweaker.event.ManaChangeEvent;

import mods.contenttweaker.Commands;

import mods.zenutils.ftbq.Reward;
import mods.zenutils.ftbq.CustomRewardEvent;
import mods.zenutils.ftbq.QuestCompletedEvent;


events.onCropGrowPre(function(event as CropGrowPreEvent) {
    var flowerworld as IWorld = event.world;
    var blockstate as IBlockState = flowerworld.getBlockState(event.position);

    if (!isNull(flowerworld.getCustomWorldData().agriculturalposstr)){
        var agricultural_flowers_pos as IData = flowerworld.getCustomWorldData();
        var agricultural_flowers_posstr as string = agricultural_flowers_pos.agriculturalposstr.asString();
        for a in agricultural_flowers_posstr.split("/"){
            var pos as IBlockPos = IBlockPos.create(a.split("~")[0] as int, a.split("~")[1] as int, a.split("~")[2] as int);
            if(isNull(flowerworld.getSubTileEntityInGame(pos))){
                var str as string = (pos.x as string  + "~" + pos.y as string  + "~" + pos.z as string);
                val data as IData = {
                    agriculturalposstr : (agricultural_flowers_posstr.replace(("/" + str), ""))
                };
                flowerworld.updateCustomWorldData(data);
            }else if ((blockstate.getPropertyNames() has "age") && (blockstate.getAllowedValuesForProperty("age").length != 0)) {
                // var cropage as int = blockstate.getPropertyValue("age") as int;
                // var cropallage as string[] = blockstate.getAllowedValuesForProperty("age");
                if(blockstate.getPropertyValue("age") == blockstate.getAllowedValuesForProperty("age")[blockstate.getAllowedValuesForProperty("age").length - 1]){
                    flowerworld.getSubTileEntityInGame(pos).addMana(350);
                }else{
                    flowerworld.getSubTileEntityInGame(pos).addMana(50);
                }
            }
        }
    }
});

events.onQuestCompleted(function(event as QuestCompletedEvent) {
    var player as IPlayer = event.onlineMembers[0];
    var flowerworld as IWorld = player.world;

    if (!isNull(flowerworld.getCustomWorldData().questposstr)){
        var quest_flowers_pos as IData = flowerworld.getCustomWorldData();
        var quest_flowers_posstr as string = quest_flowers_pos.questposstr.asString();
        for a in quest_flowers_posstr.split("/"){
            var pos as IBlockPos = IBlockPos.create(a.split("~")[0] as int, a.split("~")[1] as int, a.split("~")[2] as int);
            if(isNull(flowerworld.getSubTileEntityInGame(pos))){
                var str as string = (pos.x as string  + "~" + pos.y as string  + "~" + pos.z as string);
                val data as IData = {
                    questposstr : (quest_flowers_posstr.replace(("/" + str), ""))
                };
                flowerworld.updateCustomWorldData(data);
            }else{
                flowerworld.getSubTileEntityInGame(pos).addMana(2000);
            }
        }
    }
});

events.onManaChange(function(event as ManaChangeEvent) {
    var pos as IBlockPos = event.getPosition();
    var block as IBlock = event.getBlock();
    var blockState as IBlockState = event.getBlockState();
    var world as IWorld = event.getWorld();
    if (!isNull(world.getSubTileEntityInGame(pos))){
        var tile as SubTileEntityInGame = world.getSubTileEntityInGame(pos);
        if (!isNull(tile.getCustomData().mirrorpos)){
            var mirrorposstr as string = tile.getCustomData().mirrorpos.asString();
            var mirrorpos as IBlockPos = getPosFromStr(mirrorposstr);
            if (!isNull(world.getSubTileEntityInGame(mirrorpos))){
                var mirrorpostile as SubTileEntityInGame = world.getSubTileEntityInGame(mirrorpos);
                var str0 as string = mirrorpostile.getCustomData().tilepos.asString();
                var str1 as string = getStrFromPos(pos);
                if(str0 == str1){
                    mirrorpostile.addMana((event.getMana() / 2) as int);
                }else{
                    if (!world.remote) {say("§d[作者姬]§r§f：§r§e链接出现错误，已断开");}
                    tile.setCustomData({mirrorpos : "null"});
                }
            }
        }
    }
});


events.onPlayerInteractBlock(function(event as crafttweaker.event.PlayerInteractBlockEvent){
    var player as IPlayer = event.player;
    var blockpos as IBlockPos = event.position;
    var world as IWorld = event.world;
    var data as IData = world.getBlock(blockpos).data;

    var x as int = blockpos.getX();
    var y as int = blockpos.getY();
    var z as int = blockpos.getZ();

    if(world.isRemote()) return;
    if(isNull(player.currentItem)) return;
    if(player.currentItem.definition.id != "minecraft:diamond") return;

    if(world.getBlock(blockpos).definition.id == "botania:specialflower"){
        var amount as int = player.currentItem.amount;
        if(isNull(player.currentItem.tag.itemmirrorpos)){
            if(data.subTileName.asString() == "mirror"){
                var tile as SubTileEntityInGame = world.getSubTileEntityInGame(blockpos);
                if(isNull(tile.getCustomData().tilepos)){
                    if(isNull(player.currentItem.tag.ench) && isNull(player.currentItem.tag.itemmirrorpos)){
                        if(isNull(tile.getCustomData().diamond)){
                            var str as string = getStrFromPos(blockpos);
                            player.give(<minecraft:diamond>.withTag({ench: [{lvl: 1 as short, id: 71}], itemmirrorpos: str}));
                            tile.updateCustomData({diamond : true as bool});
                        }else{
                            var pass as bool = (tile.getCustomData().diamond.asInt() == 1);
                            if(pass){
                                if (!world.remote) {player.sendMessage("§d[作者姬]§r§f：§r§e绑定钻石已给出");}
                            }else{
                                var str as string = getStrFromPos(blockpos);
                                player.currentItem.mutable().shrink(1);
                                player.give(<minecraft:diamond>.withTag({ench: [{lvl: 1 as short, id: 71}], itemmirrorpos: str}));
                                tile.updateCustomData({diamond : 1 as int});
                            }
                        }
                    }
                }else{
                    var posstr0 as string = tile.getCustomData().tilepos.asString();
                    var pos0 as IBlockPos = getPosFromStr(posstr0);
                    if (!isNull(world.getSubTileEntityInGame(pos0))){
                        var tile0 as SubTileEntityInGame = world.getSubTileEntityInGame(pos0);
                        if(!isNull(tile0.getCustomData().mirrorpos)){
                            var str0 as string = tile0.getCustomData().mirrorpos.asString();
                            if(str0 != posstr0){
                                var pass as bool = (tile.getCustomData().diamond.asInt() == 1);
                                if(pass){
                                    if (!world.remote) {player.sendMessage("§d[作者姬]§r§f：§r§e绑定钻石已给出");}
                                }else{
                                    var str as string = getStrFromPos(blockpos);
                                    player.currentItem.mutable().shrink(1);
                                    player.give(<minecraft:diamond>.withTag({ench: [{lvl: 1 as short, id: 71}], itemmirrorpos: str}));
                                    tile.updateCustomData({diamond : 1 as int});
                                }
                            }else{
                                if (!world.remote) {player.sendMessage("§d[作者姬]§r§f：§r§e已经被链接了...");}
                            }
                        }
                    }else{
                        var pass as bool = (tile.getCustomData().diamond.asInt() == 1);
                        if(pass){
                            if (!world.remote) {player.sendMessage("§d[作者姬]§r§f：§r§e绑定钻石已给出");}
                        }else{
                            var str as string = getStrFromPos(blockpos);
                            player.currentItem.mutable().shrink(1);
                            player.give(<minecraft:diamond>.withTag({ench: [{lvl: 1 as short, id: 71}], itemmirrorpos: str}));
                            tile.updateCustomData({diamond : 1 as int});
                        }
                    }
                }
            }
        }else{
            if(data.subTileName.asString() != "mirror"){
                var itemmirrorpos as string = player.currentItem.tag.itemmirrorpos.asString();
                var tile as SubTileEntityInGame = world.getSubTileEntityInGame(blockpos);
                
                var amount as int = player.currentItem.amount;

                var mirrorpos as IBlockPos = getPosFromStr(itemmirrorpos);

                if (!isNull(world.getSubTileEntityInGame(mirrorpos))){
                    var mirrorpostile as SubTileEntityInGame = world.getSubTileEntityInGame(mirrorpos);
                    var str0 as string = getStrFromPos(blockpos);
                    if(!isNull(mirrorpostile.getCustomData().tilepos)){
                        var posstr0 as string = mirrorpostile.getCustomData().tilepos.asString();
                        var pos0 as IBlockPos = getPosFromStr(posstr0);
                        if (!isNull(world.getSubTileEntityInGame(pos0))){
                            var tile0 as SubTileEntityInGame = world.getSubTileEntityInGame(pos0);
                            tile0.setCustomData({mirrorpos : "null"});
                        }
                        if (!world.remote) {player.sendMessage("§d[作者姬]§r§f：§r§e已经更换链接");}
                        mirrorpostile.updateCustomData({tilepos : str0});
                    }else{
                        mirrorpostile.updateCustomData({tilepos : str0});
                    }
                    mirrorpostile.updateCustomData({diamond : 0 as int});
                }

                if(isNull(tile) || isNull(tile.getCustomData().mirrorpos)){
                    if (!world.remote) {player.sendMessage("§d[作者姬]§r§f：§r§e已链接~");}
                }else{
                    if (!world.remote) {player.sendMessage("§d[作者姬]§r§f：§r§e更新所链接的镜像花~");}
                }

                
                if (!isNull(tile)) {
                    tile.updateCustomData({mirrorpos : itemmirrorpos});
                    player.currentItem.mutable().shrink(1);
                    player.give(<minecraft:diamond>);
                }

            }else{
                if (!world.remote) {player.sendMessage("§d[作者姬]§r§f：§r§e请勿套娃!");}
            }
        }
    }
        
});


function getPosFromStr(posstr as string) as IBlockPos{
    if(posstr != "null"){
        var pos as IBlockPos = IBlockPos.create(posstr.split("~")[0] as int, posstr.split("~")[1] as int, posstr.split("~")[2] as int);
        return pos;
    }else{
        return null;
    }
}

function getStrFromPos(pos as IBlockPos) as string{
    var str as string = (pos.x as string  + "~" + pos.y as string  + "~" + pos.z as string);
    return str;
}

function say(str as string){
    server.commandManager.executeCommand(server, "/say "+ str);
}