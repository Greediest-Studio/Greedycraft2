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
import native.net.smileycorp.raids.common.event.CustomRaidEndEvent;

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
                if (item.definition.id == "additions:ant_emperor_bait") {
                    if (player.dimension != 66) {
                        player.sendChat("§c你发现这里根本没有蚂蚁的踪迹……");
                        return;
                    }
                    item.mutable().shrink(1);
                    RaidHelper.triggerRaid(worldNt, posNt, player.native as EntityPlayerMP, "ant_invasion.json", false, ["erebus:erebus.ant_shell"], game.localize("greedycraft.raids.bossbar.ant_invasion"), 8);
                }
            }
        }
    }
});

events.register(function(event as CustomRaidEndEvent) {
    if (event.getName() == "ant_invasion" && event.isWin()) {
        if (!isNull(event.getPlayer())) {
            var player as IPlayer = event.getPlayer().wrapper;
            player.addPotionEffect(<potion:contenttweaker:erebus_protection>.makePotionEffect(24000, 0, false, false));
        }
    }
});