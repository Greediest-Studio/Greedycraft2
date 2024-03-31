/*
 * This script is created for the GreedyCraft modpack by mc_Edwin.
 * You may NOT use this script in any other publicly distributed modpack without my permission.
 */

#priority 90

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

import scripts.util.lang as LangUtil;
import scripts.util.date as CalendarUtil;
import scripts.util.patreons as PatreonUtil;


events.onPlayerInteractBlock(function(event as PlayerInteractBlockEvent) {
    //Remove the uncrafting table
    if (event.block.definition.id == "twilightforest:uncrafting_table") {
        client.player.sendChat("§emc_Edwin§f: 喂，你在干什么？还在想着拆物品吗？");
        event.player.health = 0.0f;
        event.cancel();
    }
    //Remove the teleport stone in Vethea
    if (event.block.definition.id == "waystones:waystone" && event.player.dimension == 427) {
        client.player.sendChat("§emc_Edwin§f: byd还想刷物品是吧，都给你ban喽");
        event.player.health = 0.0f;
        event.cancel();
    }
    //Remove the enderchest in Vethea
    if (event.block.definition.id == "minecraft:ender_chest" && event.player.dimension == 427) {
        client.player.sendChat("§emc_Edwin§f: byd还想刷物品是吧，都给你ban喽");
        event.player.health = 0.0f;
        event.cancel();
    }
});