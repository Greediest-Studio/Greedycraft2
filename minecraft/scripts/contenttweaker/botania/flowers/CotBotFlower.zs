#loader contenttweaker

import mods.contenttweaker.VanillaFactory;

import crafttweaker.entity.IEntity;
import crafttweaker.entity.IEntityItem;
import crafttweaker.entity.IEntityMob;
import crafttweaker.entity.IEntityAnimal;
import crafttweaker.entity.IEntityLivingBase;

import crafttweaker.player.IPlayer;

import crafttweaker.world.IFacing;
import crafttweaker.world.IWorld;
import crafttweaker.world.IBlockPos;

import crafttweaker.damage.IDamageSource;

import crafttweaker.data.IData;

import crafttweaker.block.IBlock;
import crafttweaker.block.IBlockState;

import mods.randomtweaker.cote.ISubTileEntityGenerating;
import mods.randomtweaker.cote.SubTileEntityInGame;
import mods.randomtweaker.cote.ISubTileEntity;
import mods.randomtweaker.cote.BlockActivated;
import mods.randomtweaker.cote.ISubTileEntityFunctional;
import mods.randomtweaker.cote.Update;

import mods.randomtweaker.utils.ITileData;

import mods.zenutils.DataUpdateOperation.OVERWRITE;
import mods.zenutils.DataUpdateOperation.APPEND;
import mods.zenutils.DataUpdateOperation.MERGE;
import mods.zenutils.DataUpdateOperation.REMOVE;
import mods.zenutils.DataUpdateOperation.BUMP;

import mods.ctintegration.scalinghealth.DifficultyManager;

import mods.contenttweaker.Commands;

var Blood_Hydroangeas as ISubTileEntityGenerating = VanillaFactory.createSubTileGenerating("blood_hydroangeas", 0xFFFFFF);
Blood_Hydroangeas.maxMana = 2000;
Blood_Hydroangeas.onUpdate = function(subtile, world, pos) {
    if(!world.remote) {
        if(isNull(subtile.data.time))
            subtile.updateCustomData({time : 0});

        if(!isNull(subtile.data.time)) {
            subtile.updateCustomData({time : subtile.data.time.asInt() + 1});
            if(subtile.data.time.asInt() == 100){
                var pos as IBlockPos = IBlockPos.create(pos.x, pos.y, pos.z);
                var s = pos.getOffset(IFacing.up(), 2).getOffset(IFacing.west(), 5).getOffset(IFacing.north(), 5) as IBlockPos;
                var e = pos.getOffset(IFacing.down(), 2).getOffset(IFacing.east(), 5).getOffset(IFacing.south(), 5) as IBlockPos;
                var entities = world.getEntitiesInArea(s.asPosition3f(), e.asPosition3f()) as IEntity[];
                for entity in entities {
                    if(entity instanceof IEntityLivingBase){
                        var living as IEntityLivingBase = entity;
                        if(living.health > 100){
                            living.attackEntityFrom(IDamageSource.MAGIC() , 100);
                            subtile.addMana(500);
                            subtile.updateCustomData(subtile.data + {time : 0});
                        }else{
                            living.attackEntityFrom(IDamageSource.MAGIC() , living.health);
                            subtile.addMana(living.health * 5);
                            subtile.updateCustomData(subtile.data + {time : 0});
                        }
                    }
                }
            }
        }
    }
};
Blood_Hydroangeas.register();


var bread_fanatic as ISubTileEntityGenerating = VanillaFactory.createSubTileGenerating("bread_fanatic", 0xFFFFFF);
bread_fanatic.maxMana = 6666;
bread_fanatic.onUpdate = function(subtile, world, pos) {
    if(!world.remote) {
        if(isNull(subtile.data.working))
            subtile.updateCustomData({working : false as bool});

        if(!isNull(subtile.data.working) && subtile.getMana() < subtile.getMaxMana()) {
            // subtile.updateCustomData({time : subtile.data.time.asInt() + 1});
            var pos as IBlockPos = IBlockPos.create(pos.x, pos.y, pos.z);
            var s = pos.getOffset(IFacing.up(), 2).getOffset(IFacing.west(), 2).getOffset(IFacing.north(), 2) as IBlockPos;
            var e = pos.getOffset(IFacing.down(), 2).getOffset(IFacing.east(), 2).getOffset(IFacing.south(), 2) as IBlockPos;
            var entities = world.getEntitiesInArea(s.asPosition3f(), e.asPosition3f()) as IEntity[];
            for entity in entities {
                if(entity instanceof IEntityItem){
                    var item as IEntityItem = entity;
                    if(item.item.definition.id == "minecraft:bread" && !(subtile.data.working.asBool())){
                        subtile.updateCustomData({working : true as bool});
                        item.item.mutable().shrink(1);
                        world.catenation()
                        .sleep(40)
                        .run(function(world, context) {
                            subtile.addMana(200);
                        })
                        .sleep(40)
                        .run(function(world, context) {
                            subtile.addMana(400);
                        })
                        .sleep(40)
                        .run(function(world, context) {
                            subtile.addMana(500);
                            subtile.updateCustomData({working : false as bool});
                        })
                        .start();
                    }
                }
            }
        }
    }
};
bread_fanatic.register();


var Add_Difficulty as ISubTileEntityGenerating = VanillaFactory.createSubTileGenerating("add_difficulty", 0xFFFFFF);
Add_Difficulty.maxMana = 40000;
Add_Difficulty.color = 0xfcff00;
Add_Difficulty.onBlockPlaceBy = function(world, pos, state, entity, stack) {
    var crtpos as IBlockPos = IBlockPos.create(pos.x, pos.y, pos.z);
    var crtworld as IWorld = world;
    var subtile as SubTileEntityInGame = crtworld.getSubTileEntityInGame(crtpos);
    if(entity instanceof IPlayer){
        var player as IPlayer = entity;
        if(player.fake) return;
        subtile.updateCustomData({PlacePlayeruuid : player.uuid});
    }
};
Add_Difficulty.onUpdate = function(subtile, world, pos) {
    if(!world.remote) {
        if(isNull(subtile.data.time))
            subtile.updateCustomData({time : 0});

        if(!isNull(subtile.data.time)) {
            subtile.updateCustomData({time : subtile.data.time.asInt() + 1});
            if(subtile.data.time.asInt() == 1200){
                for player in server.players{
                    if(!isNull(subtile.data.PlacePlayeruuid)){
                        if(player.uuid == subtile.data.PlacePlayeruuid){
                            server.commandManager.executeCommand(server, "/scalinghealth difficulty add 2 "+ player.name);
                            subtile.addMana(10000);
                            subtile.updateCustomData(subtile.data + {time : 0});
                        }
                    }
                }
            }
        }
    }
};
Add_Difficulty.onBlockActivated = function(world, pos, state, player, hand, side, hitX, hitY, hitZ) {
    var data as IData = world.getBlock(pos).data;
    var mana as int = data.subTileCmp.mana.asInt();
    var subtile as SubTileEntityInGame = world.getSubTileEntityInGame(pos);
    for player in server.players{
        if(!isNull(subtile.data.PlacePlayeruuid)){
            if(player.uuid == subtile.data.PlacePlayeruuid){
                server.commandManager.executeCommand(server, "/scalinghealth difficulty add 2 "+ player.name);
                subtile.addMana(10000);
                subtile.updateCustomData(subtile.data + {time : 0});
            }
        }
    }
    return true;
};
Add_Difficulty.register();


var Remove_Difficulty as ISubTileEntityFunctional = VanillaFactory.createSubTileFunctional("remove_difficulty", 0xFFFFFF);
Remove_Difficulty.maxMana = 80000;
Remove_Difficulty.color = 0xaf0000;
Remove_Difficulty.onBlockPlaceBy = function(world, pos, state, entity, stack) {
    var crtpos as IBlockPos = IBlockPos.create(pos.x, pos.y, pos.z);
    var crtworld as IWorld = world;
    var subtile as SubTileEntityInGame = crtworld.getSubTileEntityInGame(crtpos);
    if(entity instanceof IPlayer){
        var player as IPlayer = entity;
        if(player.fake) return;
        subtile.updateCustomData({PlacePlayeruuid : player.uuid});
    }
};
Remove_Difficulty.onUpdate = function(subtile, world, pos) {
    if(!world.remote) {
        if(isNull(subtile.data.time))
            subtile.updateCustomData({time : 0});

        if(!isNull(subtile.data.time)) {
            subtile.updateCustomData({time : subtile.data.time.asInt() + 1});
            if(subtile.data.time.asInt() == 1200 && subtile.getMana() >= 40000){
                for player in server.players{
                    if(!isNull(subtile.data.PlacePlayeruuid)){
                        if(player.uuid == subtile.data.PlacePlayeruuid){
                            server.commandManager.executeCommand(server, "/scalinghealth difficulty add -2 "+ player.name);
                            subtile.consumeMana(40000);
                            subtile.updateCustomData(subtile.data + {time : 0});
                        }
                    }
                }
            }
        }
    }
};
Remove_Difficulty.onBlockActivated = function(world, pos, state, player, hand, side, hitX, hitY, hitZ) {
    var data as IData = world.getBlock(pos).data;
    var mana as int = data.subTileCmp.mana.asInt();
    if(mana < 40000) {
        player.sendChat("你TM不给我魔力，想让我降难度？？？？");
        return false;
    } else {
        var subtile as SubTileEntityInGame = world.getSubTileEntityInGame(pos);
        for player in server.players{
            if(!isNull(subtile.data.PlacePlayeruuid)){
                if(player.uuid == subtile.data.PlacePlayeruuid){
                    server.commandManager.executeCommand(server, "/scalinghealth difficulty add -2 "+ player.name);
                    subtile.consumeMana(80000);
                    subtile.updateCustomData(subtile.data + {time : 0});
                }
            }
        }
    }
    return true;
};
Remove_Difficulty.register();


var running_machine as ISubTileEntityGenerating = VanillaFactory.createSubTileGenerating("running_machine", 0xFFFFFF);
running_machine.maxMana = 1000;
running_machine.color = 0xaf0000;
running_machine.onUpdate = function(subtile, world, pos) {
    if(!world.remote) {
        // var crtpos as IBlockPos = IBlockPos.create(pos.x as int, pos.y as int, pos.z as int);
        var crtpos as IBlockPos = IBlockPos.create(pos.x as int, pos.y as int, pos.z as int);
        var s = crtpos.getOffset(IFacing.up(), 1).getOffset(IFacing.west(), 1).getOffset(IFacing.north(), 1) as IBlockPos;
        var e = crtpos.getOffset(IFacing.down(), 1).getOffset(IFacing.east(), 1).getOffset(IFacing.south(), 1) as IBlockPos;
        var entities = world.getEntitiesInArea(s.asPosition3f(), e.asPosition3f()) as IEntity[];
        for entity in entities {
            if(entity instanceof IPlayer){
                var player as IPlayer = entity;
                if(player.isSprinting){
                    subtile.addMana(50);
                }
                if(!player.isSneaking){
                    //if(world.worldInfo.getWorldTotalTime() % 4 ==0)
                    Commands.call("tp @p " + (pos.x + 0.5) + " " + pos.y + " " + (pos.z + 0.5), player, world,false,true);
                }
            }
        }
    }
};
running_machine.register();

var cow as ISubTileEntityGenerating = VanillaFactory.createSubTileGenerating("cow", 0xFFFFFF);
cow.maxMana = 6666;
cow.onUpdate = function(subtile, world, pos) {
    if(!world.remote) {
        if(isNull(subtile.data.working))
            subtile.updateCustomData({working : false as bool});

        if(!isNull(subtile.data.working) && subtile.getMana() < subtile.getMaxMana()) {
            // subtile.updateCustomData({time : subtile.data.time.asInt() + 1});
            var pos as IBlockPos = IBlockPos.create(pos.x, pos.y, pos.z);
            var s = pos.getOffset(IFacing.up(), 2).getOffset(IFacing.west(), 2).getOffset(IFacing.north(), 2) as IBlockPos;
            var e = pos.getOffset(IFacing.down(), 2).getOffset(IFacing.east(), 2).getOffset(IFacing.south(), 2) as IBlockPos;
            var entities = world.getEntitiesInArea(s.asPosition3f(), e.asPosition3f()) as IEntity[];
            for entity in entities {
                if(entity instanceof IEntityItem){
                    var item as IEntityItem = entity;
                    if((item.item.definition.id == "minecraft:cooked_beef" || item.item.definition.id == "minecraft:beef") && !(subtile.data.working.asBool())){

                        var cooked as float = (item.item.definition.id.contains("cooked") ? 1.0F : 0.7F);

                        subtile.updateCustomData({working : true as bool});
                        item.item.mutable().shrink(1);
                        world.catenation()
                        .sleep(20)
                        .run(function(world, context) {
                            subtile.addMana(900 * cooked);
                        })
                        .sleep(20)
                        .run(function(world, context) {
                            subtile.addMana(500 * cooked);
                        })
                        .sleep(20)
                        .run(function(world, context) {
                            subtile.addMana(600 * cooked);
                            subtile.updateCustomData({working : false as bool});
                        })
                        .start();
                    }
                }
                if(entity instanceof IEntityAnimal){
                    if(entity.definition.id == "minecraft:cow"){
                        entity.attackEntityFrom(IDamageSource.OUT_OF_WORLD(), 1000);
                        subtile.addMana(3000);
                    }
                }
            }
        }
    }
};
cow.register();


var quest as ISubTileEntityGenerating = VanillaFactory.createSubTileGenerating("quest", 0xFFFFFF);
quest.maxMana = 6666;
quest.onBlockAdded = function(world, pos, state) {
    if(!world.remote) {
        var quest_flowers_pos as IData = world.getCustomWorldData();
        var str as string = (pos.x as string  + "~" + pos.y as string  + "~" + pos.z as string);
        if(isNull(quest_flowers_pos.questposstr)){
            val data as IData = {
            questposstr: str
            };
            world.updateCustomWorldData(data);
        }else{
            var quest_flowers_posstr as string = quest_flowers_pos.questposstr.asString();
            var crtpos as IBlockPos = IBlockPos.create(pos.x as int, pos.y as int, pos.z as int);
            var str as string = (pos.x as string  + "~" + pos.y as string  + "~" + pos.z as string);
            val data as IData = {
                questposstr: (quest_flowers_posstr + "/" + str)
            };
            world.updateCustomWorldData(data);
        }
    }
};
quest.onBlockHarvested = function(world, pos, state, player) {
    if(!world.remote) {
        var quest_flowers_pos as IData = world.getCustomWorldData();
        var quest_flowers_posstr as string = quest_flowers_pos.questposstr.asString();
        var crtpos as IBlockPos = IBlockPos.create(pos.x as int, pos.y as int, pos.z as int);
        var str as string = (pos.x as string  + "~" + pos.y as string  + "~" + pos.z as string);
        val data as IData = {
            questposstr : (quest_flowers_posstr.replace(("/" + str), ""))
        };
        world.updateCustomWorldData(data);
    }
};
quest.register();


var mirror as ISubTileEntityGenerating = VanillaFactory.createSubTileGenerating("mirror", 0xFFFFFF);
mirror.maxMana = 6666;
mirror.onBlockHarvested = function(world, pos, state, player) {
    if(!world.remote) {
        var crtpos as IBlockPos = IBlockPos.create(pos.x as int, pos.y as int, pos.z as int);
        var mirrorpostile as SubTileEntityInGame = world.getSubTileEntityInGame(crtpos);
        if(!isNull(mirrorpostile.getCustomData().tilepos)){
            var posstr0 as string = mirrorpostile.getCustomData().tilepos.asString();
            var pos0 as IBlockPos = getPosFromStr(posstr0);
            if (!isNull(world.getSubTileEntityInGame(pos0))){
                var tile0 as SubTileEntityInGame = world.getSubTileEntityInGame(pos0);
                tile0.setCustomData({mirrorpos : "null"});
            }
            player.sendMessage("§d[作者姬]§r§f：§r§e已自动断开所链接的产魔花~");
        }
    }
};
mirror.register();


var eat_iron as ISubTileEntityGenerating = VanillaFactory.createSubTileGenerating("eat_iron", 0xFFFFFF);
eat_iron.maxMana = 6666;
eat_iron.onUpdate = function(subtile, world, pos) {
    if(!world.remote) {
        var poses as IBlockPos[] = [
            pos.up(),
            pos.west(),
            pos.east(),
            pos.south(),
            pos.north(),
        ];
        for i in poses {
            if(!isNull(world.getBlock(i))){
                if(!isNull(world.getBlock(i).definition)){
                    if(world.getBlock(i).definition.id.contains("iron")){
                        Commands.call("playsound minecraft:entity.generic.drink record @p", null, world, false, true);
                        if (!world.remote) {say("§d[作者姬]§r§f：§r§e干了这杯铁!");}
                        world.setBlockState(<blockstate:minecraft:air>, i);
                        subtile.addMana(1000);
                    }
                }
            }
        }
    }
};
eat_iron.register();


var agricultural as ISubTileEntityGenerating = VanillaFactory.createSubTileGenerating("agricultural", 0xFFFFFF);
agricultural.maxMana = 6666;
agricultural.onBlockAdded = function(world, pos, state) {
    if(!world.remote) {
        var agricultural_flowers_pos as IData = world.getCustomWorldData();
        var str as string = (pos.x as string  + "~" + pos.y as string  + "~" + pos.z as string);
        if(isNull(agricultural_flowers_pos.agriculturalposstr)){
            val data as IData = {
            agriculturalposstr: str
            };
            world.updateCustomWorldData(data);
        }else{
            var agricultural_flowers_posstr as string = agricultural_flowers_pos.agriculturalposstr.asString();
            var crtpos as IBlockPos = IBlockPos.create(pos.x as int, pos.y as int, pos.z as int);
            var str as string = (pos.x as string  + "~" + pos.y as string  + "~" + pos.z as string);
            val data as IData = {
                agriculturalposstr: (agricultural_flowers_posstr + "/" + str)
            };
            world.updateCustomWorldData(data);
        }
    }
};
agricultural.onBlockHarvested = function(world, pos, state, player) {
    if(!world.remote) {
        var agricultural_flowers_pos as IData = world.getCustomWorldData();
        var agricultural_flowers_posstr as string = agricultural_flowers_pos.agriculturalposstr.asString();
        var crtpos as IBlockPos = IBlockPos.create(pos.x as int, pos.y as int, pos.z as int);
        var str as string = (pos.x as string  + "~" + pos.y as string  + "~" + pos.z as string);
        val data as IData = {
            agriculturalposstr : (agricultural_flowers_posstr.replace(("/" + str), ""))
        };
        world.updateCustomWorldData(data);
    }
};
agricultural.register();


var lightning as ISubTileEntityGenerating = VanillaFactory.createSubTileGenerating("lightning", 0xFFFFFF);
lightning.maxMana = 6666;
lightning.onUpdate = function(subtile, world, pos) {
    if(!world.remote) {
        var crtpos as IBlockPos = IBlockPos.create(pos.x as int, pos.y as int, pos.z as int);
        var s = crtpos.getOffset(IFacing.up(), 3).getOffset(IFacing.west(), 5).getOffset(IFacing.north(), 5) as IBlockPos;
        var e = crtpos.getOffset(IFacing.down(), 3).getOffset(IFacing.east(), 5).getOffset(IFacing.south(), 5) as IBlockPos;
        var entities = world.getEntitiesInArea(s.asPosition3f(), e.asPosition3f()) as IEntity[];
        for entity in entities {
            if(entity instanceof IPlayer && entities.length > 0){
                var playerpos as IBlockPos = entity.position;
                world.summonLightningBolt(playerpos.getX(), playerpos.getY(), playerpos.getZ(), false);
                subtile.addMana(100);
            }
        }
    }
};
lightning.register();

var thaumaura as ISubTileEntityGenerating = VanillaFactory.createSubTileGenerating("thaumaura", 0xFFFFFF);
thaumaura.maxMana = 8000;
thaumaura.onUpdate = function(subtile, world, pos) {
    if (!world.remote) {
        if (world.getAuraInArea(pos, 1) > 10000 && subtile.getMana() < 8000) {
            world.getAuraChunk(pos).drainAura(pos, 10000);
            world.addVis(pos, 5.0f);
            subtile.addMana(1000);
        }
    }
};
thaumaura.register();

var kg as ISubTileEntityGenerating = VanillaFactory.createSubTileGenerating("kill_generating", 0xFFFFFF);
kg.maxMana = 6666;
kg.onBlockAdded = function(world, pos, state) {
    if(!world.remote) {
        var kg_flowers_pos as IData = world.getCustomWorldData();
        var str as string = (pos.x as string  + "~" + pos.y as string  + "~" + pos.z as string);
        if(isNull(kg_flowers_pos.kgposstr)){
            val data as IData = {
            kgposstr : str
            };
            world.updateCustomWorldData(data);
        }else{
            var kg_flowers_posstr as string = kg_flowers_pos.kgposstr.asString();
            var crtpos as IBlockPos = IBlockPos.create(pos.x as int, pos.y as int, pos.z as int);
            var str as string = (pos.x as string  + "~" + pos.y as string  + "~" + pos.z as string);
            val data as IData = {
                kgposstr : str
            };
            if(!isNull(getPosFromStr(kg_flowers_posstr))){
                if(!isNull(world.getSubTileEntityInGame(getPosFromStr(kg_flowers_posstr)))){
                    world.destroyBlock(getPosFromStr(kg_flowers_posstr), true);
                }
            }
            world.updateCustomWorldData(data);
        }
    }
};
kg.onBlockHarvested = function(world, pos, state, player) {
    if(!world.remote) {
        var kg_flowers_pos as IData = world.getCustomWorldData();
        var kg_flowers_posstr as string = kg_flowers_pos.kgposstr.asString();
        var crtpos as IBlockPos = IBlockPos.create(pos.x as int, pos.y as int, pos.z as int);
        var str as string = (pos.x as string  + "~" + pos.y as string  + "~" + pos.z as string);
        val data as IData = {
            kgposstr : (kg_flowers_posstr.replace(("/" + str), ""))
        };
        world.updateCustomWorldData(data);
    }
};
kg.register();

function getPosFromStr(posstr as string) as IBlockPos{
    if(posstr != "null"){
        var pos as IBlockPos = IBlockPos.create(posstr.split("~")[0] as int, posstr.split("~")[1] as int, posstr.split("~")[2] as int);
        return pos;
    }else{
        return null;
    }
}

function say(str as string){
    server.commandManager.executeCommand(server, "/say "+ str);
}