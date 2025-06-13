#priority 32767


import crafttweaker.player.IPlayer;
import native.net.minecraft.entity.player.EntityPlayer;
import native.net.minecraft.entity.Entity;
import native.net.minecraft.nbt.NBTTagCompound;

function setSanity(player as IPlayer, num as float) {
    var newSan as float = num;
    if (newSan >= 100.0f) {
        newSan = 100.0f;
    } else if (newSan <= -100.0f) {
        newSan = -100.0f;
    }
    player.native.getEntityData().setFloat("sanityAbyss", newSan);
}

function getSanity(player as IPlayer) as float {
    return player.native.getEntityData().getFloat("sanityAbyss");
}

function addSanity(player as IPlayer, num as float) {
    var oldSan as float = getSanity(player) as float;
    if (oldSan + num >= 100.0f) {
        setSanity(player, 100.0f);
    } else {
        setSanity(player, oldSan + num as float);
    }
}

function removeSanity(player as IPlayer, num as float) {
    var oldSan as float = getSanity(player) as float;
    if (oldSan - num <= -100.0f) {
        setSanity(player, -100.0f);
    } else {
        setSanity(player, oldSan - num as float);
    }
}
