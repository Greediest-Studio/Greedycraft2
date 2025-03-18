#priority 90

import crafttweaker.event.PlayerLoggedInEvent;
import crafttweaker.event.IPlayerEvent;
import crafttweaker.event.PlayerRespawnEvent;
import crafttweaker.event.PlayerTickEvent;
import crafttweaker.data.IData;
import crafttweaker.damage.IDamageSource;
import crafttweaker.entity.IEntity;
import crafttweaker.entity.IEntityLivingBase;
import crafttweaker.entity.IEntityDefinition;
import crafttweaker.player.IPlayer;
import crafttweaker.util.Position3f;
import crafttweaker.block.IBlock;
import crafttweaker.world.IBlockPos;
import crafttweaker.block.IBlockState;
import crafttweaker.potions.IPotionEffect;
import crafttweaker.world.IFacing;
import crafttweaker.world.IWorld;
import crafttweaker.command.ICommandSender;
import crafttweaker.event.EntityJoinWorldEvent;
import crafttweaker.text.ITextComponent;

events.onPlayerTick(function(event as PlayerTickEvent) {
    val world = event.player.world.getDimension();
    if (world == 0) {
        val playerposy  = event.player.posY;
        events.onEntityJoinWorld(function(event1 as EntityJoinWorldEvent) {
            val entity = event1.entity;
            if (!(entity instanceof IPlayer) && (event1.world.getDimension() == 0)) {
                if ((playerposy - entity.getY()) > 30.0 as double) {
                    event1.cancel();
                }
            }
        });
    }
});