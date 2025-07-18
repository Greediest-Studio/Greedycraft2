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

import mods.ctutils.utils.Math;
import mods.ctutils.world.IGameRules;
import mods.ctintegration.data.DataUtil;
import mods.ctintegration.util.DateUtil;
import mods.ctintegration.date.IDate;  
import mods.zenutils.I18n;   

import native.vazkii.botania.common.block.BlockAlfPortal;

import mods.zenutils.DataUpdateOperation.OVERWRITE;
import mods.zenutils.DataUpdateOperation.APPEND;
import mods.zenutils.DataUpdateOperation.MERGE;
import mods.zenutils.DataUpdateOperation.REMOVE;
import mods.zenutils.DataUpdateOperation.BUMP;
import native.java.math.BigInteger;

events.onPlayerInteractBlock(function(event as PlayerInteractBlockEvent) {
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
    //Disabled Default Modular Controller
    if (!isNull(event.player.mainHandHeldItem)) {
        if (event.player.mainHandHeldItem.definition.id == "modularmachinery:blockcontroller" && !event.world.remote && !event.player.creative) {
            client.player.sendChat("§c你无法放置该物品！");
            event.cancel();
        }
    }
    if (!isNull(event.player.offHandHeldItem)) {
        if (event.player.offHandHeldItem.definition.id == "modularmachinery:blockcontroller" && !event.world.remote && !event.player.creative) {
            client.player.sendChat("§c你无法放置该物品！");
            event.cancel();
        }
    }
});
/*events.onPlayerInteractBlock(function(event as PlayerInteractBlockEvent) {
    if (!isNull(event.item) && !isNull(event.block) && !event.player.creative && !event.world.remote) {
        if event.block.definition.id has "_controller" && event.item.definition.id has "timeinabottle" {
            client.player.sendChat("§e你无权加速此方块");
            event.cancel();
        }
    }
});*/
events.onPlayerInteractBlock(function(event as PlayerInteractBlockEvent) {
    if (!isNull(event.block) && !event.world.remote) {
        if (event.block.definition.id == <appliedenergistics2:molecular_assembler>.definition.id && !event.player.isSneaking) {
            if (isNull(event.item)) {
                event.cancel();
            }
            if (!isNull(event.item)) {
                if !(event.item.definition.id == <appliedenergistics2:material:30>.definition.id)
                event.cancel();
            }
        }
    }
});
