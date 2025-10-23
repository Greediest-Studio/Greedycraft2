/*
 * This script is created for the GreedyCraft II modpack by 咕咕咕.
 * You may NOT use this script in any other publicly distributed modpack without my permission.
 */


#priority 70

import crafttweaker.event.PlayerLoggedInEvent;
import crafttweaker.event.IPlayerEvent;
import crafttweaker.event.PlayerRespawnEvent;
import crafttweaker.event.PlayerTickEvent;
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
import crafttweaker.event.BlockPlaceEvent;
import crafttweaker.item.IItemStack;

import mods.ctutils.utils.Math;
import mods.ctutils.world.IGameRules;

val cannotbeplacedblock as string[] = [
    "modularmachinery:blockcontroller",
    "twilightforest:uncrafting_table"
];

events.onBlockPlace(function(event as BlockPlaceEvent) {
    if (!isNull(event.player)){
        if cannotbeplacedblock has event.block.definition.id && !event.player.creative {
            event.player.sendChat("§2你的偷鸡行为被小白菌阻止了！！！请去jei寻找对应机器控制器");
            event.cancel();
            }
        }
});