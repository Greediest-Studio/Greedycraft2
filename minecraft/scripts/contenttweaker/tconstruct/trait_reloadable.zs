#loader contenttweaker
#modloaded tconstruct
#reloadable

import crafttweaker.player.IPlayer;

<ticontrait:tooltrait>.calcDamage = function (trait, tool, attacker, target, originalDamage, newDamage, isCritical) {
    if (attacker instanceof IPlayer) {
        attacker.sendMessage("success");
    }
    return newDamage;
};

<conarmtrait:armortrait>.onHurt = function(trait, armor, player, source, damage, newDamage, evt) {
    if (!isNull(player)) {
    player.sendMessage("success");
    }
    return newDamage;
};
