/*
 * This script is created for the GreedyCraft II modpack by mc_Edwin.
 * You may NOT use this script in any other publicly distributed modpack without my permission.
 */


#reloadable
#priority 90

import crafttweaker.event.PlayerAttackEntityEvent;
import crafttweaker.player.IPlayer;
import crafttweaker.entity.IEntityLivingBase;

import mods.contenttweaker.Commands;

events.onPlayerAttackEntity(function(event as PlayerAttackEntityEvent) {
    if (!isNull(event.target.definition)) {
        if (event.target.definition.id == "minecraft:ender_dragon") {
            var player as IPlayer = event.player;
            var entity as IEntityLivingBase = event.target;
            if (entity.health <= 0.0f) {
                player.world.catenation()
                    .run(function(world, context) {})
                    .sleep(5)
                    .then(function(world, context) {
                        Commands.call("kill @e[type=minecraft:ender_dragon]", player, world, false, true);
                    })
                    .start();
            }
        }
    }
});