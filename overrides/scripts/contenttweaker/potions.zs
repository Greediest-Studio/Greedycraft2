/*
 * This script is created for the GreedyCraft II modpack by mc_Edwin.
 * You may NOT use this script in any other publicly distributed modpack without my permission.
 */

#loader contenttweaker 
#priority 2200

import crafttweaker.item.IItemStack;
import crafttweaker.data.IData;
import crafttweaker.block.IBlock;
import crafttweaker.item.IItemDefinition;
import crafttweaker.block.IBlockState;
import crafttweaker.world.IBlockPos;
import crafttweaker.player.IPlayer;
import crafttweaker.text.ITextComponent;

import mods.contenttweaker.VanillaFactory;
import mods.contenttweaker.Player;
import mods.randomtweaker.cote.IPotion;

import mods.zenutils.I18n;

var pure as IPotion = VanillaFactory.createPotion("pure", 0xFFFFFF);
pure.shouldRender = true;
pure.shouldRenderHUD = true;
pure.badEffectIn = false;
pure.beneficial = true;
pure.register();