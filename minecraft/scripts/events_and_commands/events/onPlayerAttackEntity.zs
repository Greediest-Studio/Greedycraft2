/*
 * This script is created for the GreedyCraft II modpack by mc_Edwin.
 * You may NOT use this script in any other publicly distributed modpack without my permission.
 */


#reloadable
#priority 90

import crafttweaker.event.PlayerAttackEntityEvent;
import crafttweaker.player.IPlayer;
import crafttweaker.entity.IEntity;
import crafttweaker.entity.IEntityLivingBase;
import crafttweaker.item.IItemStack;
import crafttweaker.command.ICommandSender;

import mods.contenttweaker.Commands;

events.onPlayerAttackEntity(function(event as PlayerAttackEntityEvent) {
    if (!isNull(event.target.definition)) {
        var player as IPlayer = event.player;
        var entity as IEntityLivingBase = event.target;

        if (event.target.definition.id == "minecraft:ender_dragon") {
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

        //dummy fix
        if (isNull(player.mainHandHeldItem) && player.isSneaking && entity.definition.id == "testdummy:dummy") {
            if !(player.tags has "dummy") {
                player.addTag("dummy");
                var itemList = player.creative ? [] as IItemStack[] : ((isNull(entity.equipmentAndArmor) ? [] as IItemStack[] : entity.equipmentAndArmor) + <testdummy:dummy>);
                for item in itemList {
                    player.give(item);
                }
                entity.removeFromWorld();
            }
            event.cancel();
            if (!player.world.remote) {
                player.world.catenation().run(function(world, context) {}).sleep(5).then(function(world, context) {player.removeTag("dummy");}).start();
            }
        }

        //print entity.definition.id
        /*
        if (!isNull(player.currentItem) && player.currentItem.definition.id == "minecraft:stick") {
            print(entity.definition.id);
            player.sendMessage(entity.definition.id);
        }
        */
    }
});