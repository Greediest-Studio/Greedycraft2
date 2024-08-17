#loader contenttweaker
#priority 1


import mods.contenttweaker.VanillaFactory;
import mods.randomtweaker.cote.IPotion;
import crafttweaker.player.IPlayer;



var blood as IPotion = VanillaFactory.createPotion("blood", 0x820000);
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