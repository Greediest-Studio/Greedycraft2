/*
 * This script is created for the GreedyCraft modpack by mc_Edwin.
 * You may NOT use this script in any other publicly distributed modpack without my permission.
 */

#reloadable
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
import crafttweaker.event.EntityTravelToDimensionEvent;
import crafttweaker.item.IItemStack;


events.onEntityTravelToDimension(function(event as EntityTravelToDimensionEvent) {
    if (event.entity instanceof IPlayer) {
        var player as IPlayer = event.entity;
        if (TicTraitLib.getPlayerTicArmorTrait(player) has "world_beginning_armor") {
            player.addPotionEffect(<potion:contenttweaker:worldguard>.makePotionEffect(1000, 0, false, false));
        } else if (!isNull(player.mainHandHeldItem)) {
            if (TicTraitLib.getTicTrait(player.mainHandHeldItem) has "world_beginning") {
                player.addPotionEffect(<potion:contenttweaker:worldguard>.makePotionEffect(1000, 0, false, false));
            }
        } else if (!isNull(player.offHandHeldItem)) {
            if (TicTraitLib.getTicTrait(player.offHandHeldItem) has "world_beginning") {
                player.addPotionEffect(<potion:contenttweaker:worldguard>.makePotionEffect(1000, 0, false, false));
            }
        }
    }
});
