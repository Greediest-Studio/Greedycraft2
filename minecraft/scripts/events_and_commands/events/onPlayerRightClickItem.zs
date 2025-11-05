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
    if (event.item.definition.id == "forbiddenmagicre:eldritch_orb" && event.hand == "MAIN_HAND") {
        event.world.catenation().sleep(1).then(function(world as IWorld, context) {player.soulNetwork.orbTier = 7;}).start();
    }

    //Store the dimension ID in the item tag
    if (event.item.definition.id == "additions:modular_dimensional_magnifier" && event.hand == "MAIN_HAND") {
        if (!player.isSneaking) {
            event.item.mutable().updateTag({dim : event.world.dimension as int, display: {Lore: ["§a当前已绑定维度：§9" ~ event.world.getDimensionType() ~ "§a(ID:§9" ~ event.world.dimension ~ "§a)"], Name: "§1维度放大镜(已绑定至" ~ event.world.getDimensionType() ~ ")"}});
            event.player.sendChat("§a已将当前维度ID存储在放大镜中！");
        } else {
            event.item.mutable().updateTag({display: {Lore: [], Name: "§1维度放大镜(未绑定)"}});
            event.player.sendChat("§a绑定数据已清除！");
        }
    }

    //Clear All the Entities
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

    //Order Container
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
    val whiteList = [
        "tcon",
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

    /*//TConstruct Armor Restoration
    if (!isNull(event.item)) {
    if (event.item.definition.id == "conarm:polishing_kit") {
        var kit as IItemStack = event.item;
        var player as IPlayer = event.player;
        var material as string = kit.tag.Material as string;
        
        var pass = false;

        if (!isNull(player.armorInventory[3])) {
            var helmet as IItemStack = player.armorInventory[3];
            if (helmet.definition.id == "conarm:helmet") {
                var pass as bool = false;
                for mat in (helmet.native as ArmorCore).getRepairParts() {
                    if (helmet.tag.TinkerData.Materials.asString().split(",")[mat] has material) {
                        pass = true;
                    }
                }
                if (pass) {
                    if (helmet.damage == 0) {
                        //client.player.sendChat("§c匠魂头盔的耐久是满的！正在寻找对应胸甲……");
                    } else {
                        client.player.sendChat("§a找到对应材料的匠魂头盔！- §e[" + helmet.displayName + "]");
                        client.player.sendChat("§a该头盔减少了" + helmet.damage + "点耐久！");
                        kit.mutable().shrink(1);
                        pass = true;
                        if (!isNull(helmet.tag.Stats.Broken)) {
                            if (helmet.tag.Stats.Broken.asString() has "1") {
                                helmet.mutable().updateTag({Stats : {Broken : 0 as byte}});
                            }
                        }
                        if (helmet.damage >= (helmet.maxDamage / 2 + 1)) {
                            helmet.mutable().attemptDamageItem(-((helmet.maxDamage / 2 + 1)));
                            client.player.sendChat("§a已经修复你的头盔" + (helmet.maxDamage / 2 + 1) + "点耐久！");
                        } else {
                            helmet.mutable().attemptDamageItem(-helmet.damage);
                            client.player.sendChat("§a已经修复你的头盔" + helmet.damage + "点耐久！");
                        }
                    }
                } else {
                    //client.player.sendChat("§c匠魂头盔的材料不一致！- §e[" + helmet.displayName + "]§c，正在寻找对应胸甲……");
                }
            } else {
                //client.player.sendChat("§c头盔不是匠魂头盔！正在寻找对应胸甲……");
            }
        } else {
            //client.player.sendChat("§c未找到头盔！正在寻找对应胸甲……");
        }

        if (!isNull(player.armorInventory[2]) && !pass) {
            var helmet as IItemStack = player.armorInventory[2];
            if (helmet.definition.id == "conarm:chestplate") {
                if ((helmet.tag.TinkerData.Materials.asString().split(","))[0] == "[\"" + material + "\"") {
                    if (helmet.damage == 0) {
                        //client.player.sendChat("§c匠魂胸甲的耐久是满的！正在寻找对应护腿……");
                    } else {
                        client.player.sendChat("§a找到对应材料的匠魂胸甲！- §e[" + helmet.displayName + "]");
                        client.player.sendChat("§a该胸甲减少了" + helmet.damage + "点耐久！");
                        kit.mutable().shrink(1);
                        pass = true;
                        if (!isNull(helmet.tag.Stats.Broken)) {
                            if (helmet.tag.Stats.Broken.asString() has "1") {
                                helmet.mutable().updateTag({Stats : {Broken : 0 as byte}});
                            }
                        }
                        if (helmet.damage >= (helmet.maxDamage / 2 + 1)) {
                            helmet.mutable().attemptDamageItem(-((helmet.maxDamage / 2 + 1)));
                            client.player.sendChat("§a已经修复你的胸甲" + (helmet.maxDamage / 2 + 1) + "点耐久！");
                        } else {
                            helmet.mutable().attemptDamageItem(-helmet.damage);
                            client.player.sendChat("§a已经修复你的胸甲" + helmet.damage + "点耐久！");
                        }
                    }
                } else {
                    //client.player.sendChat("§c匠魂胸甲的材料不一致！- §e[" + helmet.displayName + "]§c，正在寻找对应护腿……");
                }
            } else {
                //client.player.sendChat("§c胸甲不是匠魂胸甲！正在寻找对应护腿……");
            }
        } else {
            //client.player.sendChat("§c未找到胸甲！正在寻找对应护腿……");
        }

        if (!isNull(player.armorInventory[1]) && !pass) {
            var helmet as IItemStack = player.armorInventory[1];
            if (helmet.definition.id == "conarm:leggings") {
                if ((helmet.tag.TinkerData.Materials.asString().split(","))[0] == "[\"" + material + "\"") {
                    if (helmet.damage == 0) {
                        //client.player.sendChat("§c匠魂护腿的耐久是满的！正在寻找对应靴子……");
                    } else {
                        client.player.sendChat("§a找到对应材料的匠魂护腿！- §e[" + helmet.displayName + "]");
                        client.player.sendChat("§a该护腿减少了" + helmet.damage + "点耐久！");
                        kit.mutable().shrink(1);
                        pass = true;
                        if (!isNull(helmet.tag.Stats.Broken)) {
                            if (helmet.tag.Stats.Broken.asString() has "1") {
                                helmet.mutable().updateTag({Stats : {Broken : 0 as byte}});
                            }
                        }
                        if (helmet.damage >= (helmet.maxDamage / 2 + 1)) {
                            helmet.mutable().attemptDamageItem(-((helmet.maxDamage / 2 + 1)));
                            client.player.sendChat("§a已经修复你的护腿" + (helmet.maxDamage / 2 + 1) + "点耐久！");
                        } else {
                            helmet.mutable().attemptDamageItem(-helmet.damage);
                            client.player.sendChat("§a已经修复你的护腿" + helmet.damage + "点耐久！");
                        }
                    }
                } else {
                    //client.player.sendChat("§c匠魂护腿的材料不一致！- §e[" + helmet.displayName + "]§c，正在寻找对应靴子……");
                }
            } else {
                //client.player.sendChat("§c护腿不是匠魂护腿！正在寻找对应靴子……");
            }
        } else {
            //client.player.sendChat("§c未找到护腿！正在寻找对应靴子……");
        }

        if (!isNull(player.armorInventory[0]) && !pass) {
            var helmet as IItemStack = player.armorInventory[0];
            if (helmet.definition.id == "conarm:boots") {
                if ((helmet.tag.TinkerData.Materials.asString().split(","))[0] == "[\"" + material + "\"") {
                    if (helmet.damage == 0) {
                        //client.player.sendChat("§c匠魂靴子的耐久是满的！");
                    } else {
                        client.player.sendChat("§a找到对应材料的匠魂靴子！- §e[" + helmet.displayName + "]");
                        client.player.sendChat("§a该靴子减少了" + helmet.damage + "点耐久！");
                        kit.mutable().shrink(1);
                        pass = true;
                        if (!isNull(helmet.tag.Stats.Broken)) {
                            if (helmet.tag.Stats.Broken.asString() has "1") {
                                helmet.mutable().updateTag({Stats : {Broken : 0 as byte}});
                            }
                        }
                        if (helmet.damage >= (helmet.maxDamage / 2 + 1)) {
                            helmet.mutable().attemptDamageItem(-((helmet.maxDamage / 2 + 1)));
                            client.player.sendChat("§a已经修复你的靴子" + (helmet.maxDamage / 2 + 1) + "点耐久！");
                        } else {
                            helmet.mutable().attemptDamageItem(-helmet.damage);
                            client.player.sendChat("§a已经修复你的靴子" + helmet.damage + "点耐久！");
                        }
                    }
                } else {
                    //client.player.sendChat("§c匠魂靴子的材料不一致！- §e[" + helmet.displayName + "]");
                }
            } else {
                //client.player.sendChat("§c靴子不是匠魂靴子！");
            }
        } else {
            //client.player.sendChat("§c未找到靴子！");
        }

        if (!pass) {
            client.player.sendChat("§c盔甲耐久已满，材料不匹配或不存在！");
        }
    }*/
    }


    /*//TConstruct Tools Restoration {
    if (!isNull(event.item)) {
    if (event.item.definition.id == "tconstruct:sharpening_kit") {
        var kit as IItemStack = event.item;
        var player as IPlayer = event.player;
        var material as string = kit.tag.Material as string;
        
        var pass = false;

        if (!isNull(player.mainHandHeldItem)) {
            var helmet as IItemStack = player.mainHandHeldItem;
            if (TicLib.isTicTool(helmet)) {
                if ((helmet.tag.TinkerData.Materials.asString().split(","))[0] == "[\"" + material + "\"") {
                    if (helmet.damage == 0) {
                    } else {
                        client.player.sendChat("§a找到对应材料的主手匠魂工具！- §e[" + helmet.displayName + "]");
                        client.player.sendChat("§a该工具减少了" + helmet.damage + "点耐久！");
                        kit.mutable().shrink(1);
                        pass = true;
                        if (!isNull(helmet.tag.Stats.Broken)) {
                            if (helmet.tag.Stats.Broken.asString() has "1") {
                                helmet.mutable().updateTag({Stats : {Broken : 0 as byte}});
                            }
                        }
                        if (helmet.damage >= (helmet.maxDamage / 2 + 1)) {
                            helmet.mutable().attemptDamageItem(-((helmet.maxDamage / 2 + 1)));
                            client.player.sendChat("§a已经修复你的工具" + (helmet.maxDamage / 2 + 1) + "点耐久！");
                        } else {
                            helmet.mutable().attemptDamageItem(-helmet.damage);
                            client.player.sendChat("§a已经修复你的工具" + helmet.damage + "点耐久！");
                        }
                    }
                }
            }
        }

        if (!isNull(player.offHandHeldItem)) {
            var helmet as IItemStack = player.offHandHeldItem;
            if (TicLib.isTicTool(helmet)) {
                if ((helmet.tag.TinkerData.Materials.asString().split(","))[0] == "[\"" + material + "\"") {
                    if (helmet.damage == 0) {
                    } else {
                        client.player.sendChat("§a找到对应材料的副手匠魂工具！- §e[" + helmet.displayName + "]");
                        client.player.sendChat("§a该工具减少了" + helmet.damage + "点耐久！");
                        kit.mutable().shrink(1);
                        pass = true;
                        if (!isNull(helmet.tag.Stats.Broken)) {
                            if (helmet.tag.Stats.Broken.asString() has "1") {
                                helmet.mutable().updateTag({Stats : {Broken : 0 as byte}});
                            }
                        }
                        if (helmet.damage >= (helmet.maxDamage / 2 + 1)) {
                            helmet.mutable().attemptDamageItem(-((helmet.maxDamage / 2 + 1)));
                            client.player.sendChat("§a已经修复你的工具" + (helmet.maxDamage / 2 + 1) + "点耐久！");
                        } else {
                            helmet.mutable().attemptDamageItem(-helmet.damage);
                            client.player.sendChat("§a已经修复你的工具" + helmet.damage + "点耐久！");
                        }
                    }
                }
            }
        }

        if (!pass) {
            client.player.sendChat("§c工具耐久已满，材料不匹配或不存在！");
        }

    }
    }

}*/
});

