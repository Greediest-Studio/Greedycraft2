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
import crafttweaker.command.ICommandSender;
import crafttweaker.event.EntityLivingDeathEvent;
import crafttweaker.text.ITextComponent;

events.onEntityLivingDeath(function (event as EntityLivingDeathEvent) {
    if (isNull(event.entityLivingBase.definition)) {
        if (event.entityLivingBase.definition.id has "chaosguar") {
            var list as IPlayer[] = [];
            for ent in event.entityLivingBase.world.getEntitiesInArea(crafttweaker.util.Position3f.create(((event.entity.x)- 100),((event.entity.y)- 100),((event.entity.z)- 100)),crafttweaker.util.Position3f.create(((event.entity.x)+ 100),((event.entity.y)+ 100),((event.entity.z)+ 100))) {
                if ent instanceof IPlayer {
                    val en as IPlayer = ent;
                    list += en;
                }
            }
            if !isNull(list) {
                for plr in list {
                    plr.give(<contenttweaker:chaos_heart>);
                }
            }
        }
    }
    if (isNull(event.entityLivingBase.definition)) {
        if (event.entityLivingBase.definition.id has "sun" && !(event.entityLivingBase.definition.id has "suns") && !(event.entityLivingBase.definition.id has "sun_")) {
            var list as IPlayer[] = [];
            for ent in event.entityLivingBase.world.getEntitiesInArea(crafttweaker.util.Position3f.create(((event.entity.x)- 100),((event.entity.y)- 100),((event.entity.z)- 100)),crafttweaker.util.Position3f.create(((event.entity.x)+ 100),((event.entity.y)+ 100),((event.entity.z)+ 100))) {
                if ent instanceof IPlayer {
                    val en as IPlayer = ent;
                    list += en;
                }
            }
            if !isNull(list) {
                for plr in list {
                    plr.give(<additions:bloody-darkest_core> * 10);
                }
            }
        }
    }
});