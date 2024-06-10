#loader contenttweaker
import mods.contenttweaker.VanillaFactory;

import crafttweaker.item.IItemStack;

import crafttweaker.entity.IEntity;
import crafttweaker.entity.IEntityMob;
import crafttweaker.entity.IEntityItem;
import crafttweaker.entity.IEntityEquipmentSlot;
import crafttweaker.entity.AttributeModifier;
import crafttweaker.entity.AttributeInstance;
import crafttweaker.entity.IEntityLivingBase;

import crafttweaker.world.IVector3d;
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
import mods.ctintegration.baubles.IBaubleInventory;
import mods.ctintegration.advancement.IAdvancement;

import native.baubles.api.cap.IBaublesItemHandler;
import native.baubles.api.BaublesApi;

var luck = VanillaFactory.createBaubleItem("bauble_luck");
luck.onWornTick = function(bauble, wearer) {
    if(wearer instanceof IPlayer && !wearer.world.remote) {
        var player as IPlayer = wearer;
        player.addPotionEffect(<potion:minecraft:luck>.makePotionEffect(20, 0));
}
};
luck.onUnequipped = function(bauble, wearer) {
    if(wearer instanceof IPlayer && !wearer.world.remote) {
        var player as IPlayer = wearer;
        player.addPotionEffect(<potion:minecraft:luck>.makePotionEffect(100, 0));
    }
};
luck.baubleType = "TRINKET";
luck.register();


var regeneration = VanillaFactory.createBaubleItem("bauble_regeneration");
regeneration.rarity = "rare";
regeneration.onWornTick = function(bauble, wearer) {
    if(wearer instanceof IPlayer && !wearer.world.remote) {
        var player as IPlayer = wearer;
        player.addPotionEffect(<potion:minecraft:regeneration>.makePotionEffect(20, 0));

}
     
};
regeneration.onUnequipped = function(bauble, wearer) {
    if(wearer instanceof IPlayer && !wearer.world.remote) {
        var player as IPlayer = wearer;
        player.sendMessage("§e不!你抛弃了信仰");
    }
};
regeneration.baubleType = "TRINKET";
regeneration.register();


var resistance = VanillaFactory.createBaubleItem("bauble_resistance");
resistance.onWornTick = function(bauble, wearer) {
    if(wearer instanceof IPlayer && !wearer.world.remote) {
        var player as IPlayer = wearer;
        if(player.maxHealth<=30){
            player.addPotionEffect(<potion:minecraft:resistance>.makePotionEffect(20, 0));

        }
    }
    
};
resistance.baubleType = "BODY";
resistance.register();


var lucky = VanillaFactory.createBaubleItem("bauble_lucky");
lucky.rarity = "uncommon";
lucky.onWornTick = function(bauble, wearer) {
    if(wearer instanceof IPlayer && !wearer.world.remote) {
        var player as IPlayer = wearer;
        player.addPotionEffect(<potion:minecraft:luck>.makePotionEffect(20, 4));

}
};
lucky.onUnequipped = function(bauble, wearer) {
    if(wearer instanceof IPlayer && !wearer.world.remote) {
        var player as IPlayer = wearer;
        player.addPotionEffect(<potion:minecraft:luck>.makePotionEffect(100, 4));
    }
};
lucky.baubleType = "RING";
lucky.register();


var god_eye = VanillaFactory.createBaubleItem("bauble_god_eye");
god_eye.rarity = "epic";
god_eye.onWornTick = function(bauble, wearer) {
    if(wearer instanceof IPlayer && !wearer.world.remote) {
        var player as IPlayer = wearer;
        if(player.health > 0){
            if(player.health != player.maxHealth){
                if(player.soulNetwork.currentEssence >= 2000){
                    player.soulNetwork.currentEssence -= 5;
                    player.health += 0.5;
                }
            }else{
                if(player.soulNetwork.currentEssence >= 6000){
                    player.soulNetwork.currentEssence -= 5;
                    player.addExperience(1);
                }
            }
        }
        player.addPotionEffect(<potion:contenttweaker:god_eye>.makePotionEffect(100, 0, false, false));
    }
};
god_eye.baubleType = "AMULET";
god_eye.register();


var third_mana_eye = VanillaFactory.createBaubleItem("third_mana_eye");
third_mana_eye.rarity = "epic";
third_mana_eye.baubleType = "HEAD";
third_mana_eye.register();


var giant_hand = VanillaFactory.createBaubleItem("giant_hand");
giant_hand.rarity = "epic";
giant_hand.baubleType = "TRINKET";
giant_hand.register();


var magic_quiver = VanillaFactory.createBaubleItem("magic_quiver");
magic_quiver.rarity = "epic";
magic_quiver.baubleType = "BODY";
magic_quiver.register();


var rotted_sachet = VanillaFactory.createBaubleItem("rotted_sachet");
rotted_sachet.rarity = "epic";
rotted_sachet.baubleType = "BODY";
rotted_sachet.register();


var stalker_quiver = VanillaFactory.createBaubleItem("stalker_quiver");
stalker_quiver.rarity = "epic";
stalker_quiver.baubleType = "BODY";
stalker_quiver.register();


var empty_heart = VanillaFactory.createBaubleItem("empty_heart");
empty_heart.rarity = "epic";
empty_heart.baubleType = "AMULET";
empty_heart.onUnequipped = function(bauble, wearer) {
    if(wearer instanceof IPlayer && !wearer.world.remote) {
        var player as IPlayer = wearer;
        var uuid as string = player.world.getRandom().getRandomUUID();
        var modifier as AttributeModifier = AttributeModifier.createModifier("empty_heart", player.maxHealth * (0.4), 0, uuid);
        player.getAttribute("generic.maxHealth").applyModifier(modifier);
        player.health = player.maxHealth;
    }
};
empty_heart.onEquipped = function(bauble, wearer) {
    if(wearer instanceof IPlayer && !wearer.world.remote) {
        var player as IPlayer = wearer;
        var uuid as string = player.world.getRandom().getRandomUUID();
        var modifier as AttributeModifier = AttributeModifier.createModifier("empty_heart", player.maxHealth * (-0.4), 0, uuid);
        player.getAttribute("generic.maxHealth").applyModifier(modifier);
        player.health = player.maxHealth;
    }
};
empty_heart.register();


var laurus = VanillaFactory.createBaubleItem("laurus");
laurus.rarity = "epic";
laurus.baubleType = "AMULET";
laurus.onWornTick = function(bauble, wearer) {
    if(wearer instanceof IPlayer && !wearer.world.remote) {
        var player as IPlayer = wearer;
        if(!isNull(bauble.tag.laurus)){
            var data as int = bauble.tag.laurus.asInt();
            if (data < 400) {
                data += 1;
                var baubles as IBaublesItemHandler = BaublesApi.getBaublesHandler(player.native);
                baubles.setStackInSlot(player.isBaubleEquipped(itemUtils.getItem("contenttweaker:laurus")), bauble.updateTag({laurus : data as int}).native);
            }
        }else{
            var baubles as IBaublesItemHandler = BaublesApi.getBaublesHandler(player.native);
            baubles.setStackInSlot(player.isBaubleEquipped(itemUtils.getItem("contenttweaker:laurus")), bauble.updateTag({laurus : 0 as int}).native);
        }
    }
};
laurus.register();


var mind_power_pearl = VanillaFactory.createBaubleItem("mind_power_pearl");
mind_power_pearl.rarity = "epic";
mind_power_pearl.baubleType = "TRINKET";
mind_power_pearl.onWornTick = function(bauble, wearer) {
    if(wearer instanceof IPlayer && !wearer.world.remote) {
        var player as IPlayer = wearer;
        var pos = player.position;
        var world = player.world;
        var s = pos.getOffset(IFacing.up(), 3).getOffset(IFacing.west(), 5).getOffset(IFacing.north(), 5) as IBlockPos;
        var e = pos.getOffset(IFacing.down(), 3).getOffset(IFacing.east(), 5).getOffset(IFacing.south(), 5) as IBlockPos;
        var entities = world.getEntitiesInArea(s.asPosition3f(), e.asPosition3f()) as IEntity[];

        for entity in entities {
            if (entity instanceof IEntityItem){
                var item as IEntityItem = entity;
                var itempos as IBlockPos = item.position;
                var v3d as IVector3d = IVector3d.create(pos.x - itempos.x, pos.y - itempos.y, pos.z - itempos.z).normalized;
                var speed as float = 0.3F;
                if (entity.getNBT().PickupDelay.asInt() <= 0) {
                    item.motionX += v3d.x * speed;
                    item.motionY += v3d.y * speed;
                    item.motionZ += v3d.z * speed;
                }
            }
        }
    }
};
mind_power_pearl.register();