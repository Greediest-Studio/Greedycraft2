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
import crafttweaker.world.IFacing;
import crafttweaker.command.ICommandSender;
import crafttweaker.text.ITextComponent;
import crafttweaker.chat.IChatMessage;
import crafttweaker.world.IBlockAccess;
import crafttweaker.command.ICommand;
import crafttweaker.item.IItemStack;

events.onPlayerRightClickItem(function(event as PlayerRightClickItemEvent) {

if (event.world.isRemote()) {

    //TConstruct Armor Restoration
    if (event.item.definition.id == "conarm:polishing_kit") {
        var kit as IItemStack = event.item;
        var player as IPlayer = event.player;
        var material as string = kit.tag.Material as string;
        
        var pass = false;

        if (!isNull(player.armorInventory[3])) {
            var helmet as IItemStack = player.armorInventory[3];
            if (helmet.definition.id == "conarm:helmet") {
                if ((helmet.tag.TinkerData.Materials.asString().split(","))[0] == "[\"" + material + "\"") {
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
    }

    //TConstruct Tools Restoration {
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
});

