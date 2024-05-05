/*
 * This script is created for the GreedyCraft II modpack by mc_Edwin.
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
import crafttweaker.event.PlayerPickupXpEvent;
import crafttweaker.item.IItemStack;

import mods.ctutils.utils.Math;
import mods.ctutils.world.IGameRules;

events.onPlayerPickupXp(function(event as PlayerPickupXpEvent) {
if (!event.player.world.remote) {
    var player as IPlayer = event.player;
    if (!isNull(player.armorInventory)) {
        for armor in player.armorInventory {
            if (!isNull(armor)) {
                if (!isNull(armor.tag.copy)) {
                    if (armor.tag.copy as bool == true) {
                        if (Math.random() < 0.1f) {
                            var dura as int = Math.ceil(Math.random() * 6 + 4) as int;
                            armor.mutable().attemptDamageItem(- (dura), player);
                        }
                    }
                }
            }
        }
    }
}
});