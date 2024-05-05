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

import mods.ctutils.utils.Math;
import mods.ctutils.world.IGameRules;

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
        if (index < deathQuotesArray.length && index >= 0 && !player.hasGameStage("hide_death_quotes")) {
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
/*
        //Protegily
        var position as IBlockPos = crafttweaker.util.Position3f.create(0.0f, 0.0f, 0.0f) as IBlockPos;
        var protegily as bool = false;
        for x in -2 to 3 {
            for y in -2 to 3 {
                for z in -2 to 3 {
                    var flower as IBlock = player.world.getBlock((player.x + x) as int, (player.y + y) as int, (player.z) + z as int);
                    if (!isNull(flower)) {
                        if (flower.definition.id has "specialflower" && flower.data as string has "protegily") {
                            position = crafttweaker.util.Position3f.create((player.x + x) as int as float, (player.y + y) as int as float, (player.z) + z as int as float) as IBlockPos;
                            protegily = true;
                            break;
                        }
                    }
                }
            } 
        }
        if ()
*/
    }
});
