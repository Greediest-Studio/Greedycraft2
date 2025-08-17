

import crafttweaker.event.PlayerInteractEntityEvent;
import crafttweaker.world.IWorld;
import crafttweaker.entity.IEntityLivingBase;
import crafttweaker.entity.IEntity;
import crafttweaker.player.IPlayer;
import crafttweaker.block.IBlock;
import crafttweaker.world.IBlockPos;
import crafttweaker.item.IItemStack;

import mods.ctutils.utils.Math;
import mods.contenttweaker.Commands;

import scripts.compat.abyss_settings.sanity_functions as SanityHelper;

events.onPlayerInteractEntity(function(event as PlayerInteractEntityEvent) {
    if (!isNull(event.target)) {
        var player as IPlayer = event.player;
        var entity as IEntityLivingBase = event.target;
        var world as IWorld = event.world;
        var pos as IBlockPos = event.position;
        if (!isNull(player.currentItem) && !isNull(entity.definition) && !world.isRemote()) {
            if (player.currentItem.definition.id == "gct_aby:muddy_flesh" && entity.definition.id == <entity:abyssalcraft:lessershoggoth>.id) {
                if (Math.random() < 0.5) {
                    player.currentItem.mutable().shrink(1);
                    player.sendMessage("§e成功活化！");
                    world.removeEntity(entity);
                    Commands.call("summon ageofabyssalcraft:lessershoggothhelpful " ~ pos.x ~ " " ~ pos.y ~ " " ~ pos.z, player, world, false, true);
                } else {
                    player.sendMessage("§c啊哦，活化失败了！");
                }
            }
        }
    }
});