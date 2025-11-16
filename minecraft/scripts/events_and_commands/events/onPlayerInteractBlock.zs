/*
 * This script is created for the GreedyCraft modpack by mc_Edwin & 孤梦梦梦.
 * You may NOT use this script in any other publicly distributed modpack without my permission.
 */

#priority 90
#reloadable

import crafttweaker.event.PlayerLoggedInEvent;
import crafttweaker.event.IPlayerEvent;
import crafttweaker.event.PlayerRespawnEvent;
import crafttweaker.event.PlayerTickEvent;
import crafttweaker.event.PlayerInteractBlockEvent;
import crafttweaker.event.PlayerInteractEvent;
import crafttweaker.data.IData;
import crafttweaker.damage.IDamageSource;
import crafttweaker.entity.IEntityLivingBase;
import crafttweaker.entity.IEntityDefinition;
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
import crafttweaker.world.IWorld;
import crafttweaker.liquid.ILiquidDefinition;

import mods.ctutils.utils.Math;
import mods.ctutils.world.IGameRules;
import mods.ctintegration.data.DataUtil;
import mods.ctintegration.util.DateUtil;
import mods.ctintegration.date.IDate;  
import mods.zenutils.I18n;
import mods.modularmachinery.MachineController;
import mods.modularmachinery.IMachineController;

import native.vazkii.botania.common.block.BlockAlfPortal;

import mods.zenutils.DataUpdateOperation.OVERWRITE;
import mods.zenutils.DataUpdateOperation.APPEND;
import mods.zenutils.DataUpdateOperation.MERGE;
import mods.zenutils.DataUpdateOperation.REMOVE;
import mods.zenutils.DataUpdateOperation.BUMP;
import native.java.math.BigInteger;

import scripts.util.key as KeyHelper;

$expand IItemStack$getLevel() as int {
    if (!(isNull(this.ores) || this.ores.length == 0)) {
        if (this.ores has <ore:controllerLevel1>) {
            return 1;
        } else if (this.ores has <ore:controllerLevel2>) {
            return 2;
        } else if (this.ores has <ore:controllerLevel3>) {
            return 3;
        } else if (this.ores has <ore:controllerLevel4>) {
            return 4;
        } else if (this.ores has <ore:controllerLevel5>) {
            return 5;
        } else if (this.ores has <ore:controllerLevel6>) {
            return 6;
        } else {
            return 0;
        }
    } else {
        return 0;
    }
}

events.onPlayerInteractBlock(function(event as PlayerInteractBlockEvent) {
    var player as IPlayer = event.player;
    //Remove the uncrafting table
    if (event.block.definition.id == "twilightforest:uncrafting_table" && !event.world.remote) {
        client.player.sendChat("§emc_Edwin§f: 喂，你在干什么？还在想着拆物品吗？");
        event.player.health = 0.0f;
        event.cancel();
    }
    //vethea
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
    //Store the dimension ID in the Dimensional Miner
    if (event.block.definition.id == "modularmachinery:dimensional_miner_factory_controller" && !event.world.remote && event.hand == "MAIN_HAND") {
        var controller as IMachineController = MachineController.getControllerAt(event.world, event.position);
        if (!isNull(event.player.currentItem)) {
            var item as IItemStack = <additions:modular_dimensional_magnifier>;
            if (player.currentItem.definition.id == item.definition.id) {
                if (!isNull(player.currentItem.tag.dim) && !isNull(controller.customData.dims)) {
                    var dim as int = player.currentItem.tag.dim as int;
                    var dimList as int[] = controller.customData.dims as int[];
                    if (!(dimList has dim)) controller.customData = {dims : dimList.add(dim) as int[]};
                    player.sendChat("§a已将维度数据绑定到时空相位采掘机！");
                    event.cancel();
                }
            }
        }
    }
    //Store the harvest level in the Fallen Star
    if (event.block.definition.id == "modularmachinery:fallen_star_factory_controller" && !event.world.remote && event.hand == "MAIN_HAND") {
        var controller as IMachineController = MachineController.getControllerAt(event.world, event.position);
        if (!isNull(event.player.currentItem)) {
            var ticToolList as string[] = [
                "tconstruct:pickaxe",
                "moretcon:blpick",
                "tconstruct:hammer",
                "tcongreedyaddon:allinonetool"
            ];
            if (ticToolList has event.player.currentItem.definition.id) {
                var HarvestLevel as int = event.player.currentItem.getHarvestLevel("pickaxe");
                if (isNull(controller.customData.harvestLevel) || controller.customData.harvestLevel <= HarvestLevel) {
                    controller.customData = controller.customData.update({harvestLevel : HarvestLevel as int});
                    player.sendChat("§a已将采掘等级：" ~ HarvestLevel as string ~ " 绑定到坠星天矛！");
                    event.cancel();
                }
                else {
                    player.sendChat("§a已绑定更高采掘等级！");
                    event.cancel();
                }
            }
        }
    }
    //Summon The Reaper
    if (event.block.definition.id == "defiledlands:conjuring_altar" && !event.world.remote && event.hand == "MAIN_HAND") {
        var pass as bool = false;
        if (!isNull(player.currentItem)) {
            if (player.currentItem.definition.id == "additions:final_scythe") {
                pass = true;
            }
        }
        var block as IBlock = event.block;
        var worldNow as IWorld = event.world;
        var pos as IBlockPos = event.position;
        var player as IPlayer = event.player;
        var pos1 as IBlockPos = pos.south(2).east(2).up(3);
        var pos2 as IBlockPos = pos.north(2).east(2).up(3);
        var pos3 as IBlockPos = pos.north(2).west(2).up(3);
        var pos4 as IBlockPos = pos.south(2).west(2).up(3);
        if (!isNull(block.data.active) && pass) {
            if (block.data.active as byte == 1 && !worldNow.remote) {
                player.currentItem.mutable().shrink(1);
                worldNow.catenation().run(function(world as IWorld, context) {
                    player.sendChat("§4§lD");
                }).sleep(40).then(function(world as IWorld, context) {
                    player.sendChat("§4§lE");
                }).sleep(40).then(function(world as IWorld, context) {
                    player.sendChat("§4§lA");
                }).sleep(40).then(function(world as IWorld, context) {
                    player.sendChat("§4§lT");
                }).sleep(40).then(function(world as IWorld, context) {
                    player.sendChat("§4§lH");
                }).sleep(40).then(function(world as IWorld, context) {
                    server.commandManager.executeCommandSilent(server, "summon mca:grimreapermca " + pos.x + " " + (pos.y + 2) + " " + pos.z + " {Attributes:[{Name:\"generic.maxHealth\",Base:1000000d}],Health:1000000f}");
                    world.performExplosion(player, pos.x, pos.y, pos.z, 8.0f, true, true);
                    player.sendChat("§4§l死 神 降 临");
                }).start();
            }
        }
    }
    //disable Mass Enchantment
    if (event.block.definition.id has "abyssalcraft:ritualaltar" && !event.world.remote) {
        var pos = event.position.east(3);
        if (!isNull(event.world.getBlock(pos).data) && !isNull(event.world.getBlock(pos).data.Item) && !isNull(event.world.getBlock(pos).data.Item.id) && !event.world.remote && event.world.getBlock(pos).data.Item.id == "minecraft:enchanted_book") {
            event.player.sendChat("汇聚附魔已被禁用!");
            event.cancel();
        }
    }
    //Convert order stone to final
    if (event.block.definition.id == "gct_ores:order_stone" && !event.world.remote && event.hand == "MAIN_HAND") {
        var player as IPlayer = event.player;
        var pos as IBlockPos = event.position;
        var world as IWorld = event.world;
        if ((!isNull(player.mainHandHeldItem)) && (!isNull(player.offHandHeldItem))) {
            if (player.mainHandHeldItem.definition.id == "additions:order_wand" && player.offHandHeldItem.definition.id == "additions:ordered_bone_key_dice") {
                var dice as IItemStack = player.offHandHeldItem;
                if (!isNull(dice.tag.coordinateData)) {
                    var key as int = dice.tag.coordinateData.key as int;
                    var encoded as string = dice.tag.coordinateData.encoded as string;
                    var coords as int[] = KeyHelper.decodeCoordinate(encoded, key);
                    if (coords[0] == pos.x && coords[1] == pos.y && coords[2] == pos.z && world.dimension == 102) {
                        player.sendStatusMessage("§a坐标正确！正在转化……");
                        var state as string = " " + pos.x + " " + pos.y + " " + pos.z + " ";
                        world.catenation().run(function(world as IWorld, context) {
                            server.commandManager.executeCommandSilent(server, "particleex normal smoke" + state + "0.5 0.5 0.5 1 0 0 0 0.5 0.5 0.5 5 20 100 a=0.08;(vx,,vy,,vz)=(-sin(a),0,-cos(a),,0,1,0,,cos(a),0,-sin(a))*(x*2*sin(a),,0,,z*2*sin(a))");
                        }).sleep(20).then(function(world as IWorld, context) {
                            server.commandManager.executeCommandSilent(server, "particleex normal smoke" + state + "0.5 0.5 0.5 0.8 0 0 0 0.5 0.5 0.5 5 20 100 a=0.08;(vx,,vy,,vz)=(-sin(a),0,-cos(a),,0,1,0,,cos(a),0,-sin(a))*(x*2*sin(a),,0,,z*2*sin(a))");
                        }).sleep(20).then(function(world as IWorld, context) {
                            server.commandManager.executeCommandSilent(server, "particleex normal smoke" + state + "0.5 0.5 0.5 0.6 0 0 0 0.5 0.5 0.5 5 20 100 a=0.08;(vx,,vy,,vz)=(-sin(a),0,-cos(a),,0,1,0,,cos(a),0,-sin(a))*(x*2*sin(a),,0,,z*2*sin(a))");
                        }).sleep(20).then(function(world as IWorld, context) {
                            server.commandManager.executeCommandSilent(server, "particleex normal smoke" + state + "0.5 0.5 0.5 0.4 0 0 0 0.5 0.5 0.5 5 20 100 a=0.08;(vx,,vy,,vz)=(-sin(a),0,-cos(a),,0,1,0,,cos(a),0,-sin(a))*(x*2*sin(a),,0,,z*2*sin(a))");
                        }).sleep(20).then(function(world as IWorld, context) {
                            server.commandManager.executeCommandSilent(server, "particleex normal smoke" + state + "0.5 0.5 0.5 0.2 0 0 0 0.5 0.5 0.5 5 20 100 a=0.08;(vx,,vy,,vz)=(-sin(a),0,-cos(a),,0,1,0,,cos(a),0,-sin(a))*(x*2*sin(a),,0,,z*2*sin(a))");
                        }).sleep(40).then(function(world as IWorld, context) {
                            world.setBlockState(<blockstate:gct_ores:order_stone_final>, pos);
                            player.sendStatusMessage("§a转化完成！");
                        }).start();
                    } else {
                        player.sendStatusMessage("§c坐标不匹配或维度错误！");
                    }
                }
            }
        }
    }
    //Tconstruct Rift Recovery Trait
    if (!isNull(event.block.fluid) && !event.world.remote && event.hand == "MAIN_HAND") {
        if (!isNull(player.mainHandHeldItem)) {
            if (TicLib.isTicTool(player.mainHandHeldItem)) {
                var tool as IItemStack = player.mainHandHeldItem;
                var fluid as ILiquidDefinition = event.block.fluid;
                var pos as IBlockPos = event.position;
                if (TicTraitLib.hasTicTrait(tool, "rift_recovery") && fluid.name has "swamp_water") {
                    if (!isNull(tool.tag.riftRecovery)) {
                        var point as int = tool.tag.riftRecovery as int;
                        if (point >= 100) {
                            tool.mutable().updateTag({riftRecovery : point - 100 as int});
                            player.world.setBlockState(<blockstate:moretcon:mummysludge>, pos);
                        } else {
                            player.sendStatusMessage("§c你的工具没有足够的裂痕能量来转化！你只有" ~ point as string ~ "点能量！");
                        }
                    }
                }
            }
        }
    }
    //Tconstruct Flops Core Trait
    if (!event.world.remote && event.hand == "MAIN_HAND" && event.world.dimension == 0) {
        if (!isNull(player.mainHandHeldItem)) {
            if (TicLib.isTicTool(player.mainHandHeldItem)) {
                var tool as IItemStack = player.mainHandHeldItem;
                var pos as IBlockPos = event.position;
                if (TicTraitLib.hasTicTrait(tool, "flops_core") && !isNull(MachineController.getControllerAt(event.world, pos))) {
                    var controller as IMachineController = MachineController.getControllerAt(event.world, pos);
                    var controllerBlock as IItemStack = event.world.getBlock(pos).getItem(event.world, pos, event.world.getBlockState(pos));
                    if (!(isNull(tool.tag.flopMachines) || tool.tag.flopMachines.asList().length == 0)) {
                        var machineDataList as IData = tool.tag.flopMachines;
                        for machineData in machineDataList.asList() {
                            var posData as int[] = machineData.machinePos as int[];
                            var pass as bool = true;
                            if (posData[0] == pos.x && posData[1] == pos.y && posData[2] == pos.z) {
                                player.sendStatusMessage("§c该机器已被绑定！");
                                pass = false;
                            }
                            if (pass) {
                                var newMachineData as IData = {
                                    machinePos : [pos.x as int, pos.y as int, pos.z as int] as int[],
                                    level : controllerBlock.getLevel() as int,
                                    isWorking : controller.isWorking as bool
                                };
                                tool.mutable().updateTag({flopMachines : machineDataList.deepUpdate([newMachineData], MERGE)});
                                player.sendStatusMessage("§a已绑定位于X:" + pos.x + " Y:" + pos.y + " Z:" + pos.z + "的机器！");
                            }
                        }
                    } else {
                        var newMachineData as IData = {
                            machinePos : [pos.x as int, pos.y as int, pos.z as int] as int[],
                            level : controllerBlock.getLevel() as int,
                            isWorking : controller.isWorking as bool
                        };
                        tool.mutable().updateTag({flopMachines : [newMachineData]});
                    }
                    event.cancel();
                } else if (TicTraitLib.hasTicTrait(tool, "flops_core") && event.block.definition.id == "minecraft:anvil") {
                    tool.mutable().updateTag({flopMachines : []});
                    player.sendStatusMessage("§a已清除所有绑定的机器数据！");
                    event.cancel();
                }
            }
        }
    }
});
