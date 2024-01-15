/*
 * This script is created for the GreedyCraft II modpack by mc_Edwin.
 * You may NOT use this script in any other publicly distributed modpack without my permission.
 */

#reloadable
#priority 90

import crafttweaker.event.PlayerLoggedInEvent;
import crafttweaker.event.IPlayerEvent;
import crafttweaker.event.PlayerRespawnEvent;
import crafttweaker.event.PlayerTickEvent;
import crafttweaker.data.IData;
import crafttweaker.damage.IDamageSource;
import crafttweaker.entity.IEntityLivingBase;
import crafttweaker.player.IPlayer;
import crafttweaker.util.Position3f;
import crafttweaker.block.IBlock;
import crafttweaker.world.IBlockPos;
import crafttweaker.block.IBlockState;
import crafttweaker.potions.IPotionEffect;
import crafttweaker.world.IFacing;
import crafttweaker.command.ICommandSender;
import crafttweaker.item.IItemStack;
import crafttweaker.world.IWorld;

import mods.ctutils.utils.Math;
import mods.ctutils.world.IGameRules;
import mods.randomtweaker.astralsorcery.AttunementRecipeCompleteEvent;

events.onAttunementRecipeComplete(function(event as AttunementRecipeCompleteEvent) {
    var world as IWorld = event.world;
    var constellation as string = event.constellation;
    
    if (!world.remote) {
        if (event.input.definition.ores has <ore:toolTiC>) {
            var tool = event.input;
            if (TicTraitLib.hasTicTrait(tool, "astraling")) {
                var pass as bool = true;
                for trait in TicTraitLib.getTicTrait(tool) {
                    if (trait has "tconevo.attuned_") pass = false;
                }
                if (!isNull(constellation) && pass) {
                    var constell as string = "";
                    for str in constellation.split("constellation.") {
                        if (!(str has "astralsorcery")) {
                            constell = str;
                        }
                    }
                    var traitid as string = "tconevo.attuned_" + constell as string;
                    event.setOutput(TicTraitLib.addTicTraitAsItem(tool, traitid, 0x3cffff, 1));
                } else {
                    event.setOutput(tool);
                }
            } else {
                event.setOutput(tool);
            }
        } else if (event.input.definition.ores has <ore:armorTiC>) {
            var armor = event.input;
            if (TicTraitLib.hasTicTrait(armor, "astraling_armor")) {
                var pass as bool = true;
                for trait in TicTraitLib.getTicTrait(armor) {
                    if (trait has "tconevo.attuned_") pass = false;
                }
                if (!isNull(constellation) && pass) {
                    var constell as string = "";
                    for str in constellation.split("constellation.") {
                        if (!(str has "astralsorcery")) {
                            constell = str;
                        }
                    }
                    var traitid as string = "tconevo.attuned_" + constell + "_armor" as string;
                    event.setOutput(TicTraitLib.addTicTraitAsItem(armor, traitid, 0x3cffff, 1));
                } else {
                    event.setOutput(armor);
                }
            } else {
                event.setOutput(armor);
            }
        }
    }
});