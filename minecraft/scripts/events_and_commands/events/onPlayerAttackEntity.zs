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
import crafttweaker.text.ITextComponent;
import crafttweaker.damage.IDamageSource;

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
        //dummy fix 1
        if (!isNull(player.mainHandHeldItem) && entity.definition.id == "testdummy:dummy" && (player.mainHandHeldItem.definition.id == "bloodmagic:dagger_of_sacrifice" || player.mainHandHeldItem.definition.id == "bloodarsenal:glass_dagger_of_sacrifice")) {
            if (!player.world.remote) {
                player.sendRichTextStatusMessage(ITextComponent.fromString("§d显然，试炼假人不喜欢献祭刀"));
                player.attackEntityFrom(IDamageSource.OUT_OF_WORLD(), 10.0);
            }
            event.cancel();
        }

        //vethea
        if (!player.world.remote && player.getDimension() == 427 && !isNull(player.mainHandHeldItem) && !player.hasGameStage("vethea_breaker")) {
            val item = player.mainHandHeldItem;
            if (isNull(item.tag.vetheaBreaker) || item.tag.vetheaBreaker == 0) {
                player.sendRichTextStatusMessage(ITextComponent.fromString("§d梦魇世界尚未认可你，你还不能使用外来装备！"));
                event.cancel();
            }
        }

        //Order Guardian
        if (!isNull(entity.definition) && !player.world.remote) {
            if (entity.definition.id == "ageofchaos:chaosguardianhelpful") {
                if (entity.health >= 10.0f) {
                    entity.health -= 10.0f;
                } else if (entity.health > 0.0f) {
                    entity.attackEntityFrom(IDamageSource.createEntityDamage("GENERIC", player), 65536.0f);
                    player.give(<gct_ores:order_crystal> * 48);
                    player.give(<additions:pure_dragonbone> * 32);
                    player.give(<additions:order_scale> * 32);
                    player.give(<contenttweaker:chaos_heart> * 5);
                    player.give(<draconicevolution:dragon_heart> * 16);
                }
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