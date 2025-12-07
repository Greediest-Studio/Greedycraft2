#reloadable

import crafttweaker.event.PlayerInteractEntityEvent;
import crafttweaker.entity.IEntityLiving;
import crafttweaker.item.IItemStack;
import crafttweaker.player.IPlayer;

import native.net.minecraft.world.World;
import native.net.minecraft.world.WorldServer;
import native.net.minecraft.entity.player.EntityPlayerMP;
import native.net.minecraft.util.math.BlockPos;
import native.net.smileycorp.raids.common.raid.RaidHelper;

events.onPlayerInteractEntity(function(event as PlayerInteractEntityEvent) {
    if (isNull(event.target) || event.hand != "MAIN_HAND") {
        return;
    }
    var player as IPlayer = event.player;
    if (event.target instanceof IEntityLiving && (!player.world.remote)) {
        var entityLiving as IEntityLiving = event.target;
        if (entityLiving.definition.id has "ant_shell") {
            if (!isNull(player.mainHandHeldItem)) {
                var item as IItemStack = player.mainHandHeldItem;
                var worldNt as WorldServer = player.world.native as WorldServer;
                var posNt as BlockPos = entityLiving.position.native;
                if (item.definition.id == "erebus:materials" && item.metadata == 37) {
                    item.mutable().shrink(1);
                    RaidHelper.triggerRaid(worldNt, posNt, player.native as EntityPlayerMP, "ant_invasion.json", false, ["erebus:erebus.ant_shell"], game.localize("greedycraft.raids.bossbar.ant_invasion"), 8);
                }
            }
        }
    }
});