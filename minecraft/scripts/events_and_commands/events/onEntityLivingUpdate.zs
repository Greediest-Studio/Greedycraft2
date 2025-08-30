/*
 * This script is created for the GreedyCraft modpack by TCreopargh.
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
import crafttweaker.event.EntityLivingUpdateEvent;
import crafttweaker.item.IItemStack;


events.onEntityLivingUpdate(function(event as EntityLivingUpdateEvent) {
    var entity as IEntityLivingBase = event.entityLivingBase;
    // Fix entities having too much speed
    if (entity.motionX > 9.0) {
        entity.motionX = 8.0;
    }
    if (entity.motionY > 9.0) {
        entity.motionY = 8.0;
    }
    if (entity.motionZ > 9.0) {
        entity.motionZ = 8.0;
    }

    // Prevent ghasts from despawning
    if (entity.world.getWorldTime() % 20 == 0) {
        if (entity.isBoss) {
            if (entity.y > 255.0) {
                entity.posY = 252.0;
            }
        }
    }

    // Kill Darkness Dragon
    if (!isNull(entity.definition)) {
        if (entity.definition.id == "ageofminecraft:enderdragonhelpful") {
            entity.world.removeEntity(entity);
        }
    }

});
