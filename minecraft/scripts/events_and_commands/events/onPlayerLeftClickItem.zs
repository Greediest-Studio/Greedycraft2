/*
 * This script is created for the GreedyCraft modpack by mc_Edwin.
 * You may NOT use this script in any other publicly distributed modpack without my permission.
 */


#priority 90
#reloadable

import crafttweaker.event.PlayerLoggedInEvent;
import crafttweaker.event.IPlayerEvent;
import crafttweaker.event.PlayerRespawnEvent;
import crafttweaker.event.PlayerTickEvent;
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
import crafttweaker.entity.IEntityMob;

events.onPlayerLeftClickBlock(function(event as PlayerLeftClickBlockEvent) {
    if (!isNull(event.player.mainHandHeldItem)) {
        var item as IItemStack = event.player.mainHandHeldItem;
        var player as IPlayer = event.player;
        
        //Clear All the Aggressive Mobs
        if (item.definition.id == "additions:emergency_button") {
            player.sendStatusMessage("§c§l已清除所有敌对实体！");
            server.commandManager.executeCommandSilent(player, "particle lava ~ ~ ~ 1 1 1 1 50 force");
            item.mutable().shrink(1);
            if (!isNull(player.activePotionEffects)) {
                if (player.activePotionEffects.length > 0) {
                    for effect in player.activePotionEffects {
                        player.removePotionEffect(effect.potion);
                    }
                }
            }
            for entity in event.world.getEntities() {
                if (entity instanceof IEntityMob) {
                    entity.removeFromWorld();
                }
            }
        }
    }
});