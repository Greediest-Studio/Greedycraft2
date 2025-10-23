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

events.onPlayerInteractBlock(function(event as PlayerInteractBlockEvent) {
    var player as IPlayer = event.player;
    //Remove the uncrafting table
    if (event.block.definition.id == "twilightforest:uncrafting_table" && !event.world.remote) {
        client.player.sendChat("§emc_Edwin§f: 喂，你在干什么？还在想着拆物品吗？");
        event.player.health = 0.0f;
        event.cancel();
    }
    //Remove the teleport stone in Vethea
    if (event.block.definition.id == "waystones:waystone" && event.player.dimension == 427 && !event.world.remote) {
        client.player.sendChat("§emc_Edwin§f: byd还想刷物品是吧，都给你ban喽");
        event.player.health = 0.0f;
        event.cancel();
    }
    //Remove the enderchest in Vethea
    if (event.block.definition.id == "minecraft:ender_chest" && event.player.dimension == 427 && !event.world.remote) {
        client.player.sendChat("§emc_Edwin§f: byd还想刷物品是吧，都给你ban喽");
        event.player.health = 0.0f;
        event.cancel();
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
                controller.customData = controller.customData.update({harvestLevel : HarvestLevel as int});
                player.sendChat("§a已将采掘等级：" ~ HarvestLevel as string ~ " 绑定到坠星天矛！");
                event.cancel();
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
});
