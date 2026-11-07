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
import crafttweaker.entity.IEntityLiving;

import mods.contenttweaker.VanillaFactory;
import mods.contenttweaker.Player;
import mods.randomtweaker.cote.IPotion;

import mods.zenutils.I18n;

// 从 Gct_tcon 迁移的匠魂状态效果。
function createTconPotion(name as string, color as int, visible as bool, beneficial as bool) as IPotion {
    val potion as IPotion = VanillaFactory.createPotion(name, color);
    potion.instant = false;
    potion.badEffectIn = false;
    potion.beneficial = beneficial;
    potion.shouldRender = visible;
    potion.shouldRenderHUD = visible;
    return potion;
}

val acidity as IPotion = createTconPotion("acidity", 0xFF3366, true, false);
acidity.performEffect = function(living, amplifier) {
    if (living.world.remote) {
        return;
    }
    val data = living.native.getEntityData();
    val ticks as double = data.getDouble("h_oh") + 1.0;
    data.setDouble("h_oh", ticks);
    if (ticks % 20.0 == 0.0) {
        living.attackEntityFrom(<damageSource:GENERIC>, living.maxHealth * 0.02f);
    }
};
acidity.register();

createTconPotion("alkalinity", 0x00CCFF, true, false).register();
createTconPotion("anger", 0xCC0066, false, false).register();
createTconPotion("anger_accumulation", 0xCC0066, false, false).register();
createTconPotion("angry", 0xCC0066, false, false).register();
createTconPotion("angry_accumulation", 0xCC0066, false, false).register();
createTconPotion("contract", 0xFFCC00, false, true).register();
createTconPotion("cooperation_1", 0xFFFFFF, false, false).register();
createTconPotion("cooperation_2", 0xFFFFFF, false, false).register();
createTconPotion("excited_state", 0xFFFFFF, false, true).register();
createTconPotion("ground_state", 0xFFFFFF, false, true).register();
createTconPotion("shock", 0xFFFFFF, false, true).register();
createTconPotion("spirit_possession", 0x999999, true, true).register();
createTconPotion("superposition", 0xFFFFFF, false, true).register();
createTconPotion("trapped", 0x006600, false, false).register();

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

var erebus_protection as IPotion = VanillaFactory.createPotion("erebus_protection", 0x228B22);
erebus_protection.shouldRender = false;
erebus_protection.shouldRenderHUD = false;
erebus_protection.badEffectIn = false;
erebus_protection.beneficial = true;
erebus_protection.register();

var atum_protection as IPotion = VanillaFactory.createPotion("atum_protection", 0xDAA520);
atum_protection.shouldRender = false;
atum_protection.shouldRenderHUD = false;
atum_protection.badEffectIn = false;
atum_protection.beneficial = true;
atum_protection.register();

val reversed_vision as IPotion = VanillaFactory.createPotion("reversed_vision", 0x111111);
reversed_vision.shouldRender = false;
reversed_vision.shouldRenderHUD = false;
reversed_vision.badEffectIn = false;
reversed_vision.beneficial = true;
reversed_vision.register();

var demon_decay as IPotion = VanillaFactory.createPotion("demon_decay", 0x425379);
demon_decay.shouldRender = false;
demon_decay.shouldRenderHUD = false;
demon_decay.badEffectIn = true;
demon_decay.beneficial = false;
demon_decay.performEffect = function(living , amplifier){
    if (living instanceof IEntityLiving) {
        var entity as IEntityLiving = living;
        entity.isAIDisabled = true;
    }
};
demon_decay.register();

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
            player.sendMessage("§4正在流血中...§r");
        }
    }
};
blood.register();
