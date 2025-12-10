/*
 * This script is created for the GreedyCraft modpack by TCreopargh.
 * You may NOT use this script in any other publicly distributed modpack without my permission.
 */

#priority 90

import crafttweaker.event.PlayerLoggedInEvent;
import crafttweaker.event.IPlayerEvent;
import crafttweaker.event.PlayerRespawnEvent;
import crafttweaker.event.PlayerTickEvent;
import crafttweaker.data.IData;
import crafttweaker.damage.IDamageSource;
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
import crafttweaker.item.IItemStack;
import crafttweaker.world.IWorld;

import mods.ctutils.utils.Math;
import mods.ctutils.world.IGameRules;

import native.net.minecraft.world.World;
import native.net.minecraft.entity.item.EntityItem;
import native.net.minecraft.item.ItemStack;
import native.net.minecraft.init.Items;

import scripts.util.patreons as PatreonUtil;
import scripts.util.lang as LangUtil;

events.onEntityLivingDeath(function (event as EntityLivingDeathEvent) {
    if (event.entityLivingBase instanceof IPlayer) {
        var player as IPlayer = event.entityLivingBase;
        var damageSource as IDamageSource = event.damageSource;

        // Detailed death message
        var deathMsg as string = damageSource.getDeathMessage(player);         
        deathMsg = deathMsg.replace(player.name, PatreonUtil.getPlayerColorCode(player) + player.name + "§7");
        
        if (!isNull(damageSource.getTrueSource()) && damageSource.getTrueSource() instanceof IEntityLivingBase) {
            var name as string = damageSource.getTrueSource().displayName;
            if (damageSource.getTrueSource().hasCustomName) {
                name = damageSource.getTrueSource().customName;
            }
            if (damageSource.getTrueSource() instanceof IPlayer) {
                var patreon as IPlayer = damageSource.getTrueSource();
                deathMsg = deathMsg.replace(name, PatreonUtil.getPlayerColorCode(patreon) + "☻ §n" + name + "§7");
            } else {
                deathMsg = deathMsg.replace(name, "§c§n" + name + "§7");
            }
        }
        deathMsg = " §c☠ §7" + deathMsg;
        deathMsg = deathMsg.replace("§r", "§7");
        deathMsg = deathMsg + " §9@ §7(§3" + Math.floor(player.x) as int + "§7, §3" + Math.floor(player.y) as int + "§7, §3" + Math.floor(player.z) as int + "§7)";
        server.broadcastMessage(ITextComponent.fromString(deathMsg));

        // Death quotes
        var deathQuotesArray as string[] = deathQuotes[LangUtil.getLanguage()];
        var index as int = Math.floor(Math.random() * deathQuotesArray.length as float) as int;
        if (index < deathQuotesArray.length && index >= 0 && !player.hasGameStageSilent("hide_death_quotes")) {
            var quote as string = deathQuotesArray[index];
            quote = quote.replace("%playername%", player.name);
            player.sendChat(quote);
        }

        // Spawn human
        if (Math.random() < DEATH_HUMAN_SPAWN_CHANCE && !player.creative) {
            var offset = Math.random() - 0.5f;
            /*
            var ent as IEntityLivingBase = <entity:headcrumbs:human>.createEntity(player.world);
            ent.update({Username: player.name as string});
            ent.posX = player.posX + offset;
            ent.posY = player.posY + 1.0 + offset;
            ent.posZ = player.posZ + offset;
            player.world.spawnEntity(ent);
            */
            server.commandManager.executeCommand(server, "/summon headcrumbs:human " + (player.x + offset) + " " + (player.y + 1) + " "+ (player.z + offset) +" {Username:\"" + player.name + "\"}");
            player.sendRichTextMessage(ITextComponent.fromTranslation("greedycraft.event.human.spawn"));
        }        
    }
    //Give Chaotic Hearts
    if (!isNull(event.entityLivingBase.definition)) {
        if (event.entityLivingBase.definition.id has "chaosguar") {
            var list as IPlayer[] = [];
            for ent in event.entityLivingBase.world.getEntitiesInArea(crafttweaker.util.Position3f.create(((event.entity.x)- 100),((event.entity.y)- 100),((event.entity.z)- 100)),crafttweaker.util.Position3f.create(((event.entity.x)+ 100),((event.entity.y)+ 100),((event.entity.z)+ 100))) {
                if ent instanceof IPlayer {
                    val en as IPlayer = ent;
                    list += en;
                }
            }
            if !isNull(list) {
                for player in list {
                    if (!player.world.remote) {player.give(<contenttweaker:chaos_heart>);}
                }
            }
        }
    }
    //Give Darkest Cores
    if (!isNull(event.entityLivingBase.definition)) {
        if (event.entityLivingBase.definition.id has "sun" && !(event.entityLivingBase.definition.id has "suns") && !(event.entityLivingBase.definition.id has "sun_")) {
            var list as IPlayer[] = [];
            for ent in event.entityLivingBase.world.getEntitiesInArea(crafttweaker.util.Position3f.create(((event.entity.x)- 100),((event.entity.y)- 100),((event.entity.z)- 100)),crafttweaker.util.Position3f.create(((event.entity.x)+ 100),((event.entity.y)+ 100),((event.entity.z)+ 100))) {
                if ent instanceof IPlayer {
                    val en as IPlayer = ent;
                    list += en;
                }
            }
            if !isNull(list) {
                for player in list {
                    if (!player.world.remote) {player.give(<additions:darkest_core> * 10);}
                }
            }
        }
    }
    //Drop Eye of Lightning from Enderman
    if (!isNull(event.entityLivingBase.definition) && !event.entityLivingBase.world.remote) {
        if (event.entityLivingBase.definition.id == "minecraft:enderman") {
            if (!isNull(event.damageSource.getTrueSource())) {
                if (!isNull(event.damageSource.getTrueSource().definition)) {
                    if (event.damageSource.getTrueSource().definition.id == "minecraft:creeper") {
                        if (!isNull(event.damageSource.getTrueSource().nbt.powered)) {
                            event.entityLivingBase.world.native.spawnEntity(EntityItem(
                                event.entityLivingBase.world.native,
                                event.entityLivingBase.x,
                                event.entityLivingBase.y,
                                event.entityLivingBase.z,
                                <elementalend:lightning_eye>.native
                          ));
                        }
                    }
                }
            }
        }
    }
    //Convertion of Dubhe Orb
    if (!isNull(event.entityLivingBase.definition) && !event.entityLivingBase.world.remote) {
        if (event.entityLivingBase.definition.id == "erebus:erebus.tarantula_mini_boss") {
            if (!isNull(event.damageSource.getTrueSource())) {
                if (event.damageSource.getTrueSource() instanceof IPlayer) {
                    var player as IPlayer = event.damageSource.getTrueSource();
                    if (!isNull(player.offHandHeldItem)) {
                        var item as IItemStack = player.offHandHeldItem;
                        if (item.definition.id == "additions:dubhe_orb_broken") {
                            item.mutable().shrink(1);
                            player.give(<additions:dubhe_orb_night>);
                        }
                    }
                }
            }
        }
    }
});
