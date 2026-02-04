/*
 * This script is created for the GreedyCraft modpack by mc_Edwin.
 * You may NOT use this script in any other publicly distributed modpack without my permission.
 */


#priority 90

import crafttweaker.item.IItemStack;
import crafttweaker.world.IWorld;
import crafttweaker.player.IPlayer;

import crafttweaker.event.PlayerRightClickItemEvent;
import crafttweaker.event.PlayerTickEvent;
import crafttweaker.event.BlockBreakEvent;

import mods.ctutils.utils.Math;

import native.net.minecraft.entity.player.EntityPlayerMP;
import native.net.minecraft.util.text.TextComponentString;

events.onPlayerRightClickItem(function(event as PlayerRightClickItemEvent) {
    if (!event.world.remote) {
        var item as IItemStack = event.item;
        var world as IWorld = event.world;
        var player as IPlayer = event.player;
        if (item.definition.id == "additions:sponsor2-intertwined_fate") {
            if (Math.random() < 0.33) {
                player.give(<minecraft:diamond> * 5);
            } else if (Math.random() < 0.5) {
                player.give(<minecraft:emerald> * 5);
            } else {
                player.give(<minecraft:golden_apple> * 5);
            }
            item.mutable().shrink(1);
        } else if (item.definition.id == "additions:sponsor2-sharingan") {
            item.mutable().shrink(1);
            world.catenation().run(function(world, context) {
                player.addPotionEffect(<potion:minecraft:blindness>.makePotionEffect(2400, 254));
                player.addPotionEffect(<potion:minecraft:nausea>.makePotionEffect(2400, 254));
                player.addPotionEffect(<potion:minecraft:weakness>.makePotionEffect(2400, 254));
                player.addPotionEffect(<potion:minecraft:slowness>.makePotionEffect(2400, 254));
                player.sendChat("§3你的眼睛正在融合万花筒写轮眼……§r");
            }).sleep(2400).then(function(world, context) {
                player.health = 10.0f;
                player.foodStats.foodLevel = 3;
                player.sendChat("§3你感受到了强大的抛瓦，但你的身体可能无法承受这种抛瓦§r");
            }).start();
        } else if (item.definition.id == "additions:sponsor2-balisong") {
            if (player.health > 1.0f) {
                player.health -= 1.0f;
                player.addPotionEffect(<potion:minecraft:speed>.makePotionEffect(120, 2, true, false));
            }
        } else if (item.definition.id == "additions:sponsor2-cat") {
            if (player.health >= 2.0f) {
                player.health = 2.0f;
                player.addPotionEffect(<potion:minecraft:luck>.makePotionEffect(1200, 4, true, false));
                player.sendChat("§e你被小猫挠了。§r");
            }
        } else if (item.definition.id == "additions:sponsor2-gamemode_turner") {
            player.sendChat("§c妈妈没告诉你不要相信陌生人说的话吗？§r");
            player.health = 0.0f;
        } else if (item.definition.id == "additions:sponsor2-bed_bar") {
            if (!(isNull(item.tag) || isNull(item.tag.choice))) {
                var choice as int[] = item.tag.choice as int[];
                var execute as int = 0;
                var enable as int[] = [];
                for i in 1 to 7 {
                    if (!(choice has i)) {
                        enable += i;
                    }
                }
                if (enable.length == 2) {
                    execute = enable[world.random.nextInt(0, 1)];
                    item.mutable().shrink(1);
                } else if (enable.length > 2) {
                    var toExecute as int = world.random.nextInt(0, enable.length - 1);
                    execute = enable[toExecute];
                    item.mutable().updateTag({choice : (choice + execute) as int[]});
                } else {
                    item.mutable().shrink(1);
                }
                if (execute == 1) {
                    player.give(<minecraft:iron_ingot> * 16);
                    player.sendChat("§7美好的一天，从买一组羊毛开始~");
                } else if (execute == 2) {
                    player.give(<minecraft:gold_ingot> * 6);
                    player.sendChat("§6敌人有黑曜石！快挖！！！");
                } else if (execute == 3) {
                    player.give(<minecraft:diamond> * 4);
                    player.sendChat("§b可以锋利或者保护二级了,好耶！");
                } else if (execute == 4) {
                    player.give(<minecraft:emerald> * 2);
                    player.sendChat("§3买一瓶隐身药水当老六？还是存着买钻石甲？");
                } else if (execute == 5) {
                    var wools as IItemStack[] = [
                        <minecraft:wool> * 64,
                        <minecraft:wool:14> * 64,
                        <minecraft:wool:4> * 64,
                        <minecraft:wool:5> * 64,
                        <minecraft:wool:6> * 64,
                        <minecraft:wool:7> * 64,
                        <minecraft:wool:9> * 64,
                        <minecraft:wool:11> * 64
                    ];
                    player.give(wools[world.random.nextInt(0, 7)]);
                    player.sendChat("§c我§e是§a什§3么§1队§d伍§f的§7？");
                } else if (execute == 6) {
                    player.sendTitle("§c床已被破坏！§r", "§f你将不能重生！§r", 20, 60, 20);
                    player.sendChat("\n§f§l床被破坏了 > §r§7你的床被破坏，破坏者：§a" + player.name + "§7！\n");
                    player.playSound("minecraft:entity.wither.death", 1.0f, 1.0f);
                    world.catenation().sleep(100).then(function(world, context) {
                        player.sendChat("§a" + player.name + "§7掉入了虚空。§b§l最终击杀！");
                        player.sendChat("§c你已被淘汰！");
                        player.health = 0.0f;
                    }).start();
                }
            } else {
                item.mutable().updateTag({choice : [] as int[]});
            }
        } else if (item.definition.id == "additions:sponsor2-nitian") {
            item.mutable().shrink(1);
            player.sendChat("§3==================================================§r");
            player.sendChat("§b§l游戏阶段已解锁！§r");
            player.sendChat("§enitian - §c§o逆天之力§r");
            player.sendChat("§5§o恭喜你解锁逆天之力阶段，你可以说一句逆天了！§r");
            player.sendChat("§6以下物品或功能已解锁：§r");
            player.sendChat("§2✔ §a这只是一个赞助者效果！§r");
            player.sendChat("§3==================================================§r");
        } else if (item.definition.id == "additions:sponsor2-the_chariot") {
            item.mutable().shrink(1);
            player.addPotionEffect(<potion:extrabotany:eternity>.makePotionEffect(200, 0, true, false));
            player.addPotionEffect(<potion:minecraft:haste>.makePotionEffect(200, 9, true, false));
        }
    }
});

events.onPlayerTick(function(event as PlayerTickEvent) {
    if (!event.player.world.remote) {
        var player as IPlayer = event.player;
        var world as IWorld = player.world;
        if (!isNull(player.mainHandHeldItem)) {
            var mainHandHeldItem as IItemStack = player.mainHandHeldItem;
            if (mainHandHeldItem.definition.id == "additions:sponsor2-balisong") {
                player.addPotionEffect(<potion:minecraft:regeneration>.makePotionEffect(20, 0, true, false));
            }
        } else if (!isNull(player.offHandHeldItem)) {
            var offHandHeldItem as IItemStack = player.offHandHeldItem;
            if (offHandHeldItem.definition.id == "additions:sponsor2-balisong") {
                player.addPotionEffect(<potion:minecraft:regeneration>.makePotionEffect(20, 0, true, false));
            }
        }
    }
});

events.onBlockBreak(function(event as BlockBreakEvent) {
    if (event.isPlayer && !event.world.remote) {
        var player as IPlayer = event.player;
        if (!isNull(player.currentItem)) {
            var tool as IItemStack = player.currentItem;
            if (tool.definition.id == "additions:sponsor2-world_crash_pickaxe") {
                var playerMP = player.native as EntityPlayerMP;
                playerMP.connection.disconnect(TextComponentString("§c你使用了世界崩溃之镐，连接已被服务器断开！§r"));
            }
        }
    }
});