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
import crafttweaker.entity.IEntityDefinition;
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

import mods.ctutils.utils.Math;

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

    // Extra Skills of Fortress Boss
    if (!isNull(entity.definition)) {
        if (entity.definition.id == "thebetweenlands:fortress_boss") {
            if (entity.world.getWorldTime() % 50 == 0 && entity.health <= (entity.maxHealth / 2) && !isNull(entity.revengeTarget)) {
                var target as IEntityLivingBase = entity.revengeTarget;
                var distance as double = Math.sqrt(pow(entity.posX - target.posX, 2.0d) + pow(entity.posY - target.posY, 2.0d) + pow(entity.posZ - target.posZ, 2.0d));
                if (distance <= 32.0d) {
                    var centerPos as IBlockPos = target.position.down(1);
                    var spike as IEntityDefinition = <entity:db:hiero_spike>;
                    spike.spawnEntity(target.world, centerPos);
                    spike.spawnEntity(target.world, centerPos.north(2));
                    spike.spawnEntity(target.world, centerPos.south(2));
                    spike.spawnEntity(target.world, centerPos.east(2));
                    spike.spawnEntity(target.world, centerPos.west(2));
                }
            }
            if (Math.random() < 0.005) {
                server.commandManager.executeCommandSilent(entity, "setDecay @a[r=20] 20");
            }
        }
    }

    //Fix Gaia maxHealth
    if (!isNull(entity.definition) && entity.definition.id == "botania:doppleganger") {
        var playerAmount = 0;
        val pS = Position3f.create(entity.x + 7,entity.y + 4,entity.z + 7);
        val pE = Position3f.create(entity.x - 7,entity.y - 4,entity.z - 7);
        val entityList = entity.world.getEntitiesInArea(pS,pE);
        for e in entityList {
            if e instanceof IPlayer {
                playerAmount += 1;
            }
        }
        entity.getAttribute("generic.maxHealth").setBaseValue((playerAmount == 0 ? 1 : playerAmount) * 320);
    }
});
