/*
 * This script is created for the GreedyCraft modpack by TCreopargh.
 * You may NOT use this script in any other publicly distributed modpack without my permission.
 */

#priority 90

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
import crafttweaker.event.EntityLivingSpawnEvent;
import crafttweaker.event.EntityLivingExtendedSpawnEvent;

import mods.ctutils.utils.Math;

events.onCheckSpawn(function(event as EntityLivingExtendedSpawnEvent) {
    var living = event.entityLivingBase;
    if (living.maxHealth >= 2147483647.0f) {
        event.deny();
    }
    if (living.customName.toLowerCase() == "darkness") {
        event.deny();
    }
});
