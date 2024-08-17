/*
 * This script is created for the GreedyCraft II modpack by mc_Edwin.
 * You may NOT use this script in any other publicly distributed modpack without my permission.
 */

#loader contenttweaker 
#priority 2200

import crafttweaker.item.IItemStack;
import crafttweaker.data.IData;
import crafttweaker.block.IBlock;
import crafttweaker.item.IItemDefinition;
import crafttweaker.block.IBlockState;
import crafttweaker.world.IBlockPos;
import crafttweaker.player.IPlayer;
import crafttweaker.text.ITextComponent;

import mods.contenttweaker.VanillaFactory;
import mods.contenttweaker.Player;
import mods.randomtweaker.cote.IPotion;

import mods.zenutils.I18n;

var pure as IPotion = VanillaFactory.createPotion("pure", 0xFFFFFF);
pure.shouldRender = false;
pure.shouldRenderHUD = false;
pure.badEffectIn = false;
pure.beneficial = true;
pure.register();

var worldguard as IPotion = VanillaFactory.createPotion("worldguard", 0xA3DAF8);
worldguard.shouldRender = false;
worldguard.shouldRenderHUD = false;
worldguard.badEffectIn = false;
worldguard.beneficial = true;
worldguard.register();

var blood as IPotion = VanillaFactory.createPotion("blood", 0x820000);
blood.shouldRender = false;
blood.shouldRenderHUB = false;
blood.badEffectIn = true;
blood.beneficial = false;
blood.isReady = function(duration, amplifier) {
    return duration % (amplifier <= 4 ? 40 : 20) == 0;
};
blood.performEffect = function(living , amplifier ){
    var player as IPlayer = living;
    if(!living.world.isRemote()){
        if(amplifier == 1){
            living.health -= living.health * 0.025;
        }else if(amplifier == 2){
            living.health -= living.health * 0.04;
        }else if(amplifier == 3){
            living.health -= living.health * 0.06;
        }else if(amplifier >= 4){
            living.health -= living.health * 0.08;
        }
        if(living instanceof IPlayer){
            player.sendMessage("§4正在流血中...");
        }
    }
};
blood.register();