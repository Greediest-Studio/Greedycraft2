

import crafttweaker.event.PlayerInteractBlockEvent;
import crafttweaker.block.IBlock;
import crafttweaker.item.IItemStack;
import crafttweaker.player.IPlayer;
import crafttweaker.world.IBlockPos;
import crafttweaker.world.IWorld;

import mods.ctutils.utils.Math;

import scripts.compat.abyss_settings.sanity_functions as SanityHelper;

events.onPlayerInteractBlock(function(event as PlayerInteractBlockEvent) {
    if (!event.world.isRemote()) {
        var world as IWorld = event.world;
        var player as IPlayer = event.player;
        var item as IItemStack = event.item;
        var block as IBlock = event.block;
        var pos as IBlockPos = event.position;
        if (!isNull(item)) {
            if (item.definition.id == "gct_aby:sanite_siphon" && block.definition.id == "abyssalcraft:shoggothblock") {
                item.mutable().damageItem(1, player);
                world.setBlockState(<blockstate:minecraft:air>, pos);
                var san as float = SanityHelper.getSanity(player);
                var mtp as float = (100.0f - san) / 200.0f;
                if (Math.random() <= mtp) {
                    player.give(<gct_aby:shoggoth_slimeball>);
                    player.sendStatusMessage("§e采集成功！", true);
                } else {
                    player.sendStatusMessage("§c采集失败……也许，让自己更靠近癫狂一些？", true);
                }
            }
        }
    }
});