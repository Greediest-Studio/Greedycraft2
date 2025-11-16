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

var malevolence_catalyst as IPotion = VanillaFactory.createPotion("malevolence_catalyst", 0xFFFFFF);
malevolence_catalyst.shouldRender = false;
malevolence_catalyst.shouldRenderHUD = false;
malevolence_catalyst.badEffectIn = false;
malevolence_catalyst.beneficial = true;
malevolence_catalyst.register();

var flops_overclock as IPotion = VanillaFactory.createPotion("flops_overclock", 0xFFFFFF);
flops_overclock.shouldRender = false;
flops_overclock.shouldRenderHUD = false;
flops_overclock.badEffectIn = false;
flops_overclock.beneficial = true;
flops_overclock.register();

var blood as IPotion = VanillaFactory.createPotion("blood", 0x820000);
blood.shouldRender = false;
blood.shouldRenderHUD = false;
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