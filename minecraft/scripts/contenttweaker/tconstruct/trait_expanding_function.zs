#loader contenttweaker
#priority 8000

import crafttweaker.event.EntityLivingDeathDropsEvent;
import crafttweaker.event.PlayerInteractBlockEvent;
import crafttweaker.event.PlayerInteractEntityEvent;
import crafttweaker.event.PlayerRightClickItemEvent;
import crafttweaker.event.PlayerTickEvent;
import crafttweaker.entity.IEntityLivingBase;
import crafttweaker.entity.IEntity;
import crafttweaker.world.IBlockPos;
import crafttweaker.world.IWorld;
import crafttweaker.item.IItemStack;
import crafttweaker.player.IPlayer;

import mods.contenttweaker.tconstruct.Trait;
import mods.zenutils.NetworkHandler;
import kbtwkr.event.EventManager;
import kbtwkr.event.KeyBindingRegisterEvent;
import kbtwkr.keybinding.KeyBinding;
import kbtwkr.keybinding.ConflictContext;
import kbtwkr.keybinding.IConflictContext;
import kbtwkr.keybinding.Modifier;
import kbtwkr.keybinding.IModifier;
import kbtwkr.keybinding.Keys;

import native.net.minecraftforge.event.entity.player.PlayerInteractEvent.LeftClickEmpty;
import native.net.minecraftforge.event.entity.player.ItemTooltipEvent;

zenClass TraitExpandingFunction {
    zenConstructor() {}

    //onKillEntityDrops function(tool, player, target, event)
    function onKillEntityDrops(trait as string, func as function(IItemStack,IPlayer,IEntityLivingBase,EntityLivingDeathDropsEvent)void) as void {
        events.onEntityLivingDeathDrops(function(event as EntityLivingDeathDropsEvent) {
            if (!isNull(event.damageSource.getTrueSource()) && !event.entityLivingBase.world.remote) {
                if (event.damageSource.getTrueSource() instanceof IPlayer) {
                    var player as IPlayer = event.damageSource.getTrueSource();
                    if (!isNull(player.mainHandHeldItem)) {
                        if (CotTicTraitLib.hasTicTrait(player.mainHandHeldItem, trait)) {
                            func(player.mainHandHeldItem, player, event.entityLivingBase, event);
                        }
                    }
                }
            }
        });
    }

    //onRightClickBlock function(tool, player, world, pos, hand, event)
    function onRightClickBlock(trait as string, func as function(IItemStack,IPlayer,IWorld,IBlockPos,string,PlayerInteractBlockEvent)void) as void {
        events.onPlayerRightClickBlock(function(event as PlayerInteractBlockEvent) {
            var player as IPlayer = event.player;
            if (!player.world.remote) {
                if (!isNull(player.mainHandHeldItem)) {
                    if (CotTicTraitLib.hasTicTrait(player.mainHandHeldItem, trait)) {
                        func(player.mainHandHeldItem, player, event.world, event.position, "MAIN_HAND", event);
                    }
                }
                if (!isNull(player.offHandHeldItem)) {
                    if (CotTicTraitLib.hasTicTrait(player.offHandHeldItem, trait)) {
                        func(player.offHandHeldItem, player, event.world, event.position, "OFF_HAND", event);
                    }
                }
            }
        });
    }

    //onRightClickAir function(tool, player, world, hand, event)
    function onRightClickAir(trait as string, func as function(IItemStack,IPlayer,IWorld,string,PlayerRightClickItemEvent)void) as void {
        events.onPlayerRightClickItem(function(event as PlayerRightClickItemEvent) {
            var player as IPlayer = event.player;
            if (!player.world.remote) {
                if (!isNull(player.mainHandHeldItem)) {
                    if (CotTicTraitLib.hasTicTrait(player.mainHandHeldItem, trait)) {
                       func(player.mainHandHeldItem, player, event.world, "MAIN_HAND", event);
                    }
                }
                if (!isNull(player.offHandHeldItem)) {
                    if (CotTicTraitLib.hasTicTrait(player.offHandHeldItem, trait)) {
                        func(player.offHandHeldItem, player, event.world, "OFF_HAND", event);
                    }
                }
            }
        });
    }

    //onRightClickEntity function(tool, player, entity, world, hand, event)
    function onRightClickEntity(trait as string, func as function(IItemStack,IPlayer,IEntity,IWorld,string,PlayerInteractEntityEvent)void) as void {
        events.onPlayerInteractEntity(function(event as PlayerInteractEntityEvent) {
            var player as IPlayer = event.player;
            if (!player.world.remote) {
                if (!isNull(player.mainHandHeldItem)) {
                    if (CotTicTraitLib.hasTicTrait(player.mainHandHeldItem, trait)) {
                        func(player.mainHandHeldItem, player, event.target, event.world, "MAIN_HAND", event);
                    }
                }
                if (!isNull(player.offHandHeldItem)) {
                    if (CotTicTraitLib.hasTicTrait(player.offHandHeldItem, trait)) {
                        func(player.offHandHeldItem, player, event.target, event.world, "OFF_HAND", event);
                    }
                }
            }
        });
    }

    //onLeftClickAir function(tool, player, world)
    function onLeftClickAir(trait as string, func as function(IItemStack,IPlayer,IWorld)void) as void {
        events.register(function(event as LeftClickEmpty) {
            var player as IPlayer = event.getEntityPlayer().wrapper;
            if (!isNull(player.mainHandHeldItem)) {
                if (CotTicTraitLib.hasTicTrait(player.mainHandHeldItem, trait)) {
                    NetworkHandler.sendToServer(trait + "TraitLeftClick");
                }
            }
        });
        NetworkHandler.registerClient2ServerMessage(trait + "TraitLeftClick", function(server, byteBuf, player) {
            func(player.mainHandHeldItem, player, player.world);
        });
    }

    //registerKeybindAction keyName, keyType, keyModifier, defaultKey, function(tool, player, world, hand, event)
    function registerKeybindAction(trait as string, keyName as string, keyType as IConflictContext, keyModifier as IModifier, defaultKey as int, func as function(IItemStack,IPlayer,IWorld,string,PlayerTickEvent)void) as void {
        val keyBinding as KeyBinding = KeyBinding.createSyncable("greedycraft.keybinding." + trait + "." + keyName, keyType, keyModifier, defaultKey, "greedycraft.keycategory");
        EventManager.getInstance().onKeyBindingRegister(function(event as KeyBindingRegisterEvent) {
            event.addKeyBinding(keyBinding);
        });
        events.onPlayerTick(function(event as PlayerTickEvent) {
            if (!event.player.world.remote && event.phase == "END") {
                if (event.player.isKeyDownServer(keyBinding)) {
                    if (!isNull(event.player.mainHandHeldItem)) {
                        if (CotTicTraitLib.hasTicTrait(event.player.mainHandHeldItem, trait)) {
                            func(event.player.mainHandHeldItem, event.player, event.player.world, "MAIN_HAND", event);
                        }
                    }
                    if (!isNull(event.player.offHandHeldItem)) {
                        if (CotTicTraitLib.hasTicTrait(event.player.offHandHeldItem, trait)) {
                            func(event.player.offHandHeldItem, event.player, event.player.world, "OFF_HAND", event);
                        }
                    }
                }
            }
        });
    }

    //onTooltip function(tool) as string
    function onTooltip(trait as string, name as string, func as function(IItemStack)string) as void {
        events.register(function(event as ItemTooltipEvent) {
            var itemStack as IItemStack = event.getItemStack().wrapper;
            if (!isNull(itemStack.definition)) {
                if (CotTicTraitLib.hasTicTrait(itemStack, trait)) {
                    var tooltips = event.getToolTip();
                    var location as int = -1;
                    var str as string = "";
                    for i in 0 to tooltips.length {
                        var tooltip as string = tooltips[i];
                        if (tooltip has name) {
                            location = i;
                            str = tooltip;
                            break;
                        }
                    }
                    event.getToolTip()[0 .. location].add(str + ": " + func(itemStack));
                    event.getToolTip().remove(location + 1);
                }
            }
        });
    }
}

function getTraitExpanding() as TraitExpandingFunction {
    return TraitExpandingFunction();
}


