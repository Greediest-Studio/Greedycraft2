#reloadable

import crafttweaker.events.IEventManager;
import crafttweaker.event.EntityJoinWorldEvent;
import crafttweaker.event.PlayerRespawnEvent;
import crafttweaker.event.EntityLivingDamageEvent;

import crafttweaker.item.IItemStack;

import crafttweaker.entity.IEntity;
import crafttweaker.entity.IEntityMob;
import crafttweaker.entity.IEntityItem;
import crafttweaker.entity.IEntityEquipmentSlot;
import crafttweaker.entity.AttributeModifier;
import crafttweaker.entity.AttributeInstance;
import crafttweaker.entity.IEntityLivingBase;
import crafttweaker.entity.IEntityArrow;
import crafttweaker.entity.IEntityThrowable;
import crafttweaker.entity.IEntityLiving;

import crafttweaker.world.IBlockPos;
import crafttweaker.world.IFacing;
import crafttweaker.world.IWorld;

import crafttweaker.player.IPlayer;

import mods.contenttweaker.Commands;

import crafttweaker.block.IBlock;
import crafttweaker.block.IBlockState;

import crafttweaker.data.IData;

import crafttweaker.damage.IDamageSource;

import crafttweaker.util.Position3f;

import crafttweaker.potions.IPotionEffect;

import crafttweaker.command.ICommandSender;

import mods.ctutils.utils.Math;
import mods.ctutils.world.IGameRules;

import mods.ctintegration.advancement.AdvancementHelper;
import mods.ctintegration.advancement.IAdvancement;

import mods.eventtweaker.event.ManaDiscountEvent;
import mods.eventtweaker.Minecraft;

import native.baubles.api.cap.IBaublesItemHandler;
import native.baubles.api.BaublesApi;


events.onManaDiscount(function(event as ManaDiscountEvent) {
    var player as IPlayer = event.getPlayer();
    var d as float = event.getDiscount();
    
    if (player.isBaubleEquipped(<contenttweaker:third_mana_eye>) != -1 && !player.world.remote) {
        event.setDiscount(d + 0.2);
    }
});


events.onEntityLivingDamage(function(event as crafttweaker.event.EntityLivingDamageEvent){
    var target as IEntityLivingBase = event.entity;
    var entity0 as IEntityLivingBase = event.damageSource.getTrueSource();
    var pos as IBlockPos = target.position;
    var world as IWorld = target.world;
    if (!world.remote){
        if(entity0 instanceof IPlayer){
            var player as IPlayer = entity0;
            if (player.isBaubleEquipped(<contenttweaker:third_mana_eye>) != -1) {
                if (event.damageSource.isMagicDamage()) {
                    event.amount += 3;
                }
            }
            if ((player.isBaubleEquipped(<contenttweaker:rotted_sachet>) != -1) || (player.isBaubleEquipped(<contenttweaker:stalker_quiver>) != -1)) {
                event.amount *= 1.05F;

                var random as int = world.random.nextInt(0, 100) + 1;
                if (random <= 5) {
                    event.amount *= 1.5F;
                    player.native.onCriticalHit(target);
                }
            }
        }
    }
});


events.onEntityLivingHeal(function(event as crafttweaker.event.EntityLivingHealEvent){
    var entity as IEntityLivingBase = event.entityLivingBase;
    var pos as IBlockPos = entity.position;
    var world as IWorld = entity.world;
    var health as float = event.amount;
    if (!entity.world.remote){
        if(entity instanceof IPlayer){
            var player as IPlayer = entity;
            if (player.isBaubleEquipped(<contenttweaker:empty_heart>) != -1) {
                event.amount *= 1.5;
            }
        }
    }
});


events.onEntityLivingAttacked(function(event as crafttweaker.event.EntityLivingAttackedEvent){
    var entity as IEntityLivingBase = event.entity;
    var pos as IBlockPos = entity.position;
    var world as IWorld = entity.world;
    if (!entity.world.remote){
        if(entity instanceof IPlayer){
            var player as IPlayer = entity;
            var random as int = player.world.random.nextInt(0, 100) + 1;
            if (player.isBaubleEquipped(<contenttweaker:laurus>) != -1) {
                var bauble as IItemStack = player.baublesInventory.getStackInSlot(player.isBaubleEquipped(<contenttweaker:laurus>));
                if(!isNull(bauble.tag.laurus)){
                    var data as int = bauble.tag.laurus.asInt();
                    if ((data - 200) >= 0) {
                        data -= 200;
                        Commands.call("playsound item.shield.block record @p", player, world, false, true);
                        var baubles as IBaublesItemHandler = BaublesApi.getBaublesHandler(player.native);
                        baubles.setStackInSlot(player.isBaubleEquipped(<contenttweaker:laurus>), bauble.updateTag({laurus : data as int}).native);
                        event.cancel();
                    }
                    
                }
            }
        }
    }
});


events.onEntityJoinWorld(function(event as crafttweaker.event.EntityJoinWorldEvent) {

    if(event.entity.world.remote) return;

    if (!isNull(event.entity)){
        if (event.entity instanceof IEntityArrow) {
            var arrow as IEntityArrow = event.entity;
            if (arrow.shooter instanceof IPlayer)  {
                var player as IPlayer = arrow.shooter;
                if (player.isBaubleEquipped(<contenttweaker:magic_quiver>) != -1) {
                    arrow.damage *= 1.1F;
                    arrow.motionX *= 1.4;
                    arrow.motionY *= 1.4;
                    arrow.motionZ *= 1.4;
                } else if (player.isBaubleEquipped(<contenttweaker:stalker_quiver>) != -1) {
                    arrow.damage *= 1.15F;
                    arrow.motionX *= 1.8;
                    arrow.motionY *= 1.8;
                    arrow.motionZ *= 1.8;
                }
            }
        }
    }
    
});


events.onEntityLivingUpdate(function(event as crafttweaker.event.EntityLivingUpdateEvent) {

    if(event.entity.world.remote) return;

    if (!isNull(event.entity)){
        if (event.entity instanceof IEntityLiving) {
            var living as IEntityLiving = event.entity;
            if (living.attackTarget instanceof IPlayer)  {
                var player as IPlayer = living.attackTarget;
                if((player.isBaubleEquipped(<contenttweaker:rotted_sachet>) != -1) || (player.isBaubleEquipped(<contenttweaker:stalker_quiver>) != -1)) {
                    if (living.getDistanceSqToEntity(player) > 20) {
                        living.attackTarget = null;
                    }
                }
            }
        }
    }
    
});
