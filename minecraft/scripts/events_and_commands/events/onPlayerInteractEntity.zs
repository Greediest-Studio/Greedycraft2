/*
 * This script is created for the GreedyCraft modpack by mc_Edwin.
 * You may NOT use this script in any other publicly distributed modpack without my permission.
 */

#priority 90
#reloadable

import crafttweaker.event.PlayerLoggedInEvent;
import crafttweaker.event.IPlayerEvent;
import crafttweaker.event.PlayerRespawnEvent;
import crafttweaker.event.PlayerTickEvent;
import crafttweaker.event.PlayerInteractEntityEvent;
import crafttweaker.event.PlayerInteractEvent;
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
import crafttweaker.text.ITextComponent;
import crafttweaker.chat.IChatMessage;
import crafttweaker.world.IBlockAccess;
import crafttweaker.command.ICommand;
import crafttweaker.item.IItemStack;
import crafttweaker.world.IWorld;

import mods.ctutils.utils.Math;
import mods.ctutils.world.IGameRules;
import mods.ctintegration.data.DataUtil;
import mods.ctintegration.util.DateUtil;
import mods.ctintegration.date.IDate;  
import mods.zenutils.I18n;
import mods.modularmachinery.MachineController;
import mods.modularmachinery.IMachineController;

import native.vazkii.botania.common.block.BlockAlfPortal;

import mods.zenutils.DataUpdateOperation.OVERWRITE;
import mods.zenutils.DataUpdateOperation.APPEND;
import mods.zenutils.DataUpdateOperation.MERGE;
import mods.zenutils.DataUpdateOperation.REMOVE;
import mods.zenutils.DataUpdateOperation.BUMP;
import native.java.math.BigInteger;

events.onPlayerInteractEntity(function(event as PlayerInteractEntityEvent) {
    var player as IPlayer = event.player;
    if (event.target instanceof IEntityLivingBase && !event.world.isRemote()) {
        var target as IEntityLivingBase = event.target;
        if (!isNull(player.mainHandHeldItem)) {
            var item as IItemStack = player.mainHandHeldItem;
            if (item.definition.id == "additions:titanium_ingot" && target.definition.id == "thebetweenlands:spirit_tree_face_large" && player.hasGameStage("final")) {
                item.mutable().shrink(1);
                if (Math.random() < 0.3) {
                    target.attackEntityFrom(IDamageSource.createEntityDamage("MAGIC", player), 200);
                    player.sendChat("§a你成功提取了灵魂树的灵魂！");
                    player.give(<additions:soultine_ingot>);
                } else {
                    player.sendChat("§c提取失败了！");
                }
            }
        }
    }

    //vethea
    val whiteList = [
        "tcon",
        "tcom",
        "plustic",
        "conarm",
        "minecraft",
        "divinerpg",
        "additions",
        "hooked",
        "enderio",
        "thaumcraft",
        "modularmachinery"
    ] as string[];
    if (!player.world.remote && player.getDimension() == 427 && (!isNull(player.currentItem) || !isNull(player.offHandHeldItem)) && !player.hasGameStage("vethea_breaker")) {
        var cancel = true;
        val item = isNull(player.currentItem) ? player.offHandHeldItem : player.currentItem;
        for name in whiteList {
            if (item.definition.id has name) {
                cancel = false;
                break;
            }
        }
        if (cancel) {
            player.sendRichTextStatusMessage(ITextComponent.fromString("§d梦魇世界尚未认可你，你还不能使用外来物品！"));
            player.attackEntityFrom(IDamageSource.OUT_OF_WORLD(), 10.0);
            event.cancel();
        }
    }
});