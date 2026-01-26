/*
 * This script is created for the GreedyCraft modpack by mc_Edwin.
 * You may NOT use this script in any other publicly distributed modpack without my permission.
 */


#priority 90

import crafttweaker.event.PlayerLoggedInEvent;
import crafttweaker.event.IPlayerEvent;
import crafttweaker.event.PlayerRespawnEvent;
import crafttweaker.event.PlayerTickEvent;
import crafttweaker.event.PlayerRightClickItemEvent;
import crafttweaker.event.PlayerLeftClickBlockEvent;
import crafttweaker.event.PlayerInteractEvent;
import crafttweaker.data.IData;
import crafttweaker.damage.IDamageSource;
import crafttweaker.entity.IEntityLivingBase;
import crafttweaker.player.IPlayer;
import crafttweaker.util.Position3f;
import crafttweaker.block.IBlock;
import crafttweaker.world.IBlockPos;
import crafttweaker.block.IBlockState;
import crafttweaker.potions.IPotionEffect;
import crafttweaker.potions.IPotion;
import crafttweaker.world.IFacing;
import crafttweaker.command.ICommandSender;
import crafttweaker.text.ITextComponent;
import crafttweaker.chat.IChatMessage;
import crafttweaker.world.IBlockAccess;
import crafttweaker.command.ICommand;
import crafttweaker.item.IItemStack;
import crafttweaker.world.IWorld;

import mods.contenttweaker.World;
import mods.ctutils.utils.Math;

import mods.zenutils.ICatenationBuilder;

import mods.zenutils.DataUpdateOperation.OVERWRITE;
import mods.zenutils.DataUpdateOperation.APPEND;
import mods.zenutils.DataUpdateOperation.MERGE;
import mods.zenutils.DataUpdateOperation.REMOVE;
import mods.zenutils.DataUpdateOperation.BUMP;

import native.c4.conarm.lib.armor.ArmorCore;

import scripts.util.key as Key;

events.onPlayerRightClickItem(function(event as PlayerRightClickItemEvent) {

if (!isNull(event.item) && !event.world.isRemote()) {

    var player as IPlayer = event.player;
    
    //orbTier fix
    if (isNull(event.item)) return;
    if (event.item.definition.id == "bloodmagic:blood_orb" && !isNull(event.item.tag) && !isNull(event.item.tag.orb) && event.hand == "MAIN_HAND") {
        //if (event.item.tag.orb == "contenttweaker:eldritch") {
        //    event.world.catenation().sleep(1).then(function(world as IWorld, context) {player.soulNetwork.orbTier = 7;}).start();
        //} else
        //if (event.item.tag.orb == "contenttweaker:murder") {
        //    event.world.catenation().sleep(1).then(function(world as IWorld, context) {player.soulNetwork.orbTier = 8;}).start();
        //}
        //event.player.sendChat(player.soulNetwork.orbTier);
    }

    //Store the dimension ID in the item tag
    if (isNull(event.item)) return;
    if (event.item.definition.id == "additions:modular_dimensional_magnifier" && event.hand == "MAIN_HAND") {
        if (!player.isSneaking) {
            event.item.mutable().updateTag({dim : event.world.dimension as int, display: {Lore: ["§a当前已绑定维度：§9" ~ event.world.getDimensionType() ~ "§a(ID:§9" ~ event.world.dimension ~ "§a)"], Name: "§1维度放大镜(已绑定至" ~ event.world.getDimensionType() ~ ")"}});
            event.player.sendChat("§a已将当前维度ID存储在放大镜中！");
        } else {
            event.item.mutable().updateTag({display: {Lore: [], Name: "§1维度放大镜(未绑定)"}});
            event.player.sendChat("§a绑定数据已清除！");
        }
    }

    //Order Container
    if (isNull(event.item)) return;
    var passedPotionList as IPotion[] = [
        <potion:abyssalcraft:antimatter>,
        <potion:thaumcraft:infectiousvisexhaust>,
        <potion:thebetweenlands:effect_ripening>,
        <potion:potioncore:vulnerable>
    ];
    if (event.item.definition.id == "additions:ordered_bone_key_container" && event.hand == "MAIN_HAND") {
        var item as IItemStack = event.item;
        if (!isNull(player.activePotionEffects)) {
            var counter as int = 0;
            for potionEffect in player.activePotionEffects {
                var effect as IPotionEffect = potionEffect as IPotionEffect;
                if (!isNull(effect) && passedPotionList has effect.potion) {
                    counter += 1;
                }
            }
            if (counter == 4) {
                item.mutable().shrink(1);
                for potion in passedPotionList {
                    player.removePotionEffect(potion);
                }
                player.sendChat("§e你感受到一股吸力传来，而后你觉得浑身清爽。");
                player.give(<additions:ordered_bone_key_compass>);
            } else {
                player.sendChat("§c你还没有集齐所有的效果！吸收失败！");
            }
        }
    }

    //Order Compass
    if (isNull(event.item)) return;
    if (event.item.definition.id == "additions:ordered_bone_key_compass" && event.hand == "MAIN_HAND") {
        var item as IItemStack = event.item;
        if (player.isSneaking) {
            item.mutable().updateTag({compassData : {
                startTime : event.world.time as long,
                biomeList : []
            }});
            player.sendStatusMessage("§a罗盘数据已初始化！请右击以记录当前生物群系！");
        } else {
            if (isNull(item.tag.compassData)) {
                player.sendStatusMessage("§f罗盘数据已重置！");
            } else {
                var biomeList as IData = item.tag.compassData.biomeList;
                var biomeId as string = event.world.getBiome(player.position).id as string;
                if (biomeList.asList().length != 0) {
                    var pass as bool = true;
                    var newBiome as IData = {id : biomeId};
                    for biome in biomeList.asList() {
                        if (biome.id as string == biomeId) {
                            pass = false;
                            player.sendStatusMessage("§c已经记录该生物群系！不能重复记录！");
                            break;
                        }
                    }
                    if (pass) {
                        item.mutable().updateTag(item.tag.deepUpdate({compassData : {
                            biomeList : [newBiome]
                        }}, MERGE));
                        player.sendStatusMessage("§b成功记录当前生物群系：" + event.world.getBiome(player.position).name as string);
                    }
                } else {
                    var newBiome as IData = {id : biomeId};
                    item.mutable().updateTag({compassData : {biomeList : [newBiome]}});
                    player.sendStatusMessage("§b成功记录当前生物群系：" + event.world.getBiome(player.position).name as string);
                }
                if (biomeList.asList().length >= 8) {
                    if ((event.world.time - item.tag.compassData.startTime as long) <= 1200) {
                        player.sendChat("§a你感受到罗盘的力量达到了顶峰！");
                        item.mutable().shrink(1);
                        player.give(<additions:ordered_bone_key_dice>);
                    } else {
                        player.sendChat("§c记录生物群系超时！请重新开始记录！");
                        item.mutable().updateTag({compassData : {
                            startTime : event.world.time as long,
                            biomeList : []
                        }});
                    }
                }
            }
        }
    }

    //Order Dice
    if (isNull(event.item)) return;
    if (event.item.definition.id == "additions:ordered_bone_key_dice" && event.hand == "MAIN_HAND") {
        var item as IItemStack = event.item;
        if (isNull(item.tag.coordinateData)) {
            var key as int = (Math.random() * 100000) as int;
            var x as int = (Math.random() * 20000) as int - 10000;
            var y as int = (Math.random() * 254) as int + 1;
            var z as int = (Math.random() * 20000) as int - 10000;
            var encoded as string = Key.encodeCoordinate(x, y, z, key);
            item.mutable().updateTag({coordinateData : {
                key : key as int,
                encoded : encoded as string
            }});
            player.sendStatusMessage("§a骰子已经初始化！");
        } else {
            player.sendChat("§e骰子上显示了一行奇特的字符：" + Key.toBinaryBox(item.tag.coordinateData.key as int));
        }
    }

    //vethea
    if (isNull(event.item)) return;
    val whiteList = [
        "tcon",
        "tcom",
        "plustic",
        "conarm",
        "minecraft",
        "divinerpg",
        "additions",
        "hooked",
        "enderio",
        "thaumcraft",
        "modularmachinery"
    ] as string[];
    if (!player.world.remote && player.getDimension() == 427 && (!isNull(player.currentItem) || !isNull(player.offHandHeldItem)) && !player.hasGameStage("vethea_breaker")) {
        var cancel = true;
        val item = isNull(player.currentItem) ? player.offHandHeldItem : player.currentItem;
        for name in whiteList {
            if (item.definition.id has name) {
                cancel = false;
                break;
            }
        }
        if (cancel) {
            player.sendRichTextStatusMessage(ITextComponent.fromString("§d梦魇世界尚未认可你，你还不能使用外来物品！"));
            player.attackEntityFrom(IDamageSource.OUT_OF_WORLD(), 10.0);
            event.cancel();
        }
    }

    //Ancient Scarab
    if (isNull(event.item)) return;
    if (event.item.definition.id == "additions:ancient_scrab" && event.hand == "MAIN_HAND") {
        var world as IWorld = event.world;
        var stack as IItemStack = event.item;
        var player as IPlayer = event.player;
        stack.mutable().shrink(1);
        if (world.dimension != 17) {
            var x = player.x as int;
            var y = 64 as int;
            var z = player.z as int;
            val destination = IWorld.getFromID(17);
            var tp = true;
            if (destination.getBlock(x,y,z).definition.id == "minecraft:air" && destination.getBlock(x,y + 1,z).definition.id == "minecraft:air" && destination.getBlock(x,y - 1,z).definition.id != "minecraft:air" && destination.getBlock(x,y - 1,z).definition.id != "erebus:formic_acid") {
                server.commandManager.executeCommand(server, "/forge setdimension " ~ player.name ~ " 17 " ~ (x as string) ~ " " ~ (y as string) ~ " " ~ (z as string));
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
                                server.commandManager.executeCommand(server, "/forge setdimension " ~ player.name ~ " 17 " ~ (x + i) as string ~ " " ~ (y + j) as string ~ " " ~ (z + k) as string);
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
                                server.commandManager.executeCommand(server, "/forge setdimension " ~ player.name ~ " 17 " ~ (x + i) as string ~ " " ~ (y + j) as string ~ " " ~ (z + k) as string);
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
        player.addPotionEffect(<potion:contenttweaker:atum_protection>.makePotionEffect(2400, 0));
    }

    //Firegun multishot
    if (isNull(event.item)) return;
    if (event.item.definition.id == "tinkersarsenal:boomstick") {
        var item as IItemStack = event.item;
        if (!isNull(item.tag.bulletCapacity)) {
            if (item.tag.bulletCapacity as int > 0) {
                item.mutable().updateTag({bulletCapacity : item.tag.bulletCapacity as int - 1, Loaded : 1 as byte});
            }
        }
    }

    //请把所有右键物品事件放在这条效果的前面！
    //Clear All the Entities
    if (isNull(event.item)) return;
    if (event.item.definition.id == "additions:emergency_button" && event.hand == "MAIN_HAND") {
        player.sendStatusMessage("§c§l已清除所有实体！");
        server.commandManager.executeCommandSilent(player, "particle lava ~ ~ ~ 1 1 1 1 50 force");
        event.item.mutable().shrink(1);
        if (!isNull(player.activePotionEffects)) {
            if (player.activePotionEffects.length > 0) {
                for effect in player.activePotionEffects {
                    player.removePotionEffect(effect.potion);
                }
            }
        }
        for entity in event.world.getEntities() {
            if (!(entity instanceof IPlayer)) {
                entity.removeFromWorld();
            }
        }
    }
}
});

