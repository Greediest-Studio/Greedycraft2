/*
 * This script is created for the GreedyCraft modpack by mc_Edwin.
 * You may NOT use this script in any other publicly distributed modpack without my permission.
 */


#priority 90

import crafttweaker.event.PlayerLoggedInEvent;
import crafttweaker.event.IPlayerEvent;
import crafttweaker.event.PlayerRespawnEvent;
import crafttweaker.event.PlayerTickEvent;
import crafttweaker.event.PlayerInteractBlockEvent;
import crafttweaker.event.PlayerInteractEvent;
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
import crafttweaker.text.ITextComponent;
import crafttweaker.chat.IChatMessage;
import crafttweaker.world.IBlockAccess;
import crafttweaker.world.IWorld;
import crafttweaker.command.ICommand;

import mods.contenttweaker.Commands;
import mods.ctutils.utils.Math;
import mods.ctutils.world.IGameRules;
import mods.ctintegration.data.DataUtil;
import mods.ctintegration.util.DateUtil;
import mods.ctintegration.date.IDate;  
import mods.zenutils.I18n;   

function performExplosionAndLightning(world as IWorld, x as double, y as double, z as double, power as float, player as IPlayer) {
    world.createLightningBolt(x, y, z, true);
    world.performExplosion(player, x, y, z, power, false, false);
}

events.onPlayerInteractBlock(function(event as PlayerInteractBlockEvent) {
    var pass as bool = true;
    val player as IPlayer = event.player;
    val world as IWorld = event.world;
    val block as IBlock = event.block;
    val x as int = event.x;
    val y as int = event.y;
    val z as int = event.z;
    
    if (player.dimension != 103) pass = false;
    if (y > 220) pass = false;
    if (block.definition.id != "gct_ores:finallium_container_active") pass = false;
    if (world.isAirBlock(Position3f.create(x, y - 35, z).asBlockPos())) {
        pass = false;
    } else if (world.getBlock(x, y - 35, z).definition.id != "gct_ores:order_stone_base") {
        pass = false;
    }

    if (!world.isRemote() && pass && event.hand == "MAIN_HAND") {
        world.catenation()
            .run(function(world, context) {
                world.destroyBlock(Position3f.create(x, y, z).asBlockPos(), false);
                performExplosionAndLightning(world, x, y, z, 5.0f, player);
            })
            .sleep(5)
            .then(function(world, context) {
                player.sendChat("<？> 嗯？何人打扰了我的沉睡？");
            })
            .sleep(40)
            .then(function(world, context) {
                player.sendChat("<？> 哦，原来是你啊……" ~ player.name ~ "。");
                performExplosionAndLightning(world, x - 1.0d, y + 5.0d, z - 27.0d, 10.0f, player);
            })
            .sleep(40)
            .then(function(world, context) {
                player.sendChat("<？> 不得不说，你很有勇气。");
                performExplosionAndLightning(world, x + 35.0d, y + 5.0d, z - 8.0d, 10.0f, player);
            })
            .sleep(40)
            .then(function(world, context) {
                player.sendChat("<？> 既然你想挑战我，想必已经做好了觉悟吧。");
                performExplosionAndLightning(world, x + 46.0d, y + 5.0d, z + 25.0d, 10.0f, player);
            })
            .sleep(40)
            .then(function(world, context) {
                player.sendChat("<？> 我也曾是一名混沌守卫者，是祂……§c§ktc§r让我成就了现在的一切。");
                performExplosionAndLightning(world, x + 34.0d, y + 5.0d, z + 65.0d, 10.0f, player);
            })
            .sleep(40)
            .then(function(world, context) {
                player.sendChat("<？> 他曾告诉我，迟早会有人来到这片不再“有序”的秩序之地上。");
                performExplosionAndLightning(world, x + 1.0d, y + 5.0d, z + 85.0d, 10.0f, player);
            })
            .sleep(40)
            .then(function(world, context) {
                player.sendChat("<？> 混沌之力给我带来的污秽已经足够多了……我不再需要它们了。");
                performExplosionAndLightning(world, x - 36.0d, y + 5.0d, z + 63.0d, 10.0f, player);
            })
            .sleep(40)
            .then(function(world, context) {
                player.sendChat("<？> 或许，从我的身上，你的确能得到一些东西。");
                performExplosionAndLightning(world, x - 49.0d, y + 5.0d, z + 25.0d, 10.0f, player);
            })
            .sleep(40)
            .then(function(world, context) {
                player.sendChat("<？> 那就让我们开始吧。为了这个支离破碎的世界。");
                performExplosionAndLightning(world, x - 36.0d, y + 5.0d, z - 11.0d, 10.0f, player);
            })
            .sleep(40)
            .then(function(world, context) {
                player.sendChat("<？> 准备好你的武器，生存……或者死亡！");
                performExplosionAndLightning(world, x - 1.0d, y + 5.0d, z - 27.0d, 20.0f, player);
                performExplosionAndLightning(world, x + 35.0d, y + 5.0d, z - 8.0d, 20.0f, player);
                performExplosionAndLightning(world, x + 46.0d, y + 5.0d, z + 25.0d, 20.0f, player);
                performExplosionAndLightning(world, x + 34.0d, y + 5.0d, z + 65.0d, 20.0f, player);
                performExplosionAndLightning(world, x + 1.0d, y + 5.0d, z + 85.0d, 20.0f, player);
                performExplosionAndLightning(world, x - 36.0d, y + 5.0d, z + 63.0d, 20.0f, player);
                performExplosionAndLightning(world, x - 49.0d, y + 5.0d, z + 25.0d, 20.0f, player);
                performExplosionAndLightning(world, x - 36.0d, y + 5.0d, z - 11.0d, 20.0f, player);
            })
            .sleep(80)
            .then(function(world, context) {
                player.sendChat("§e§l秩序守护使 §r已苏醒！");
                performExplosionAndLightning(world, x - 1.0d, y + 5.0d, z - 27.0d, 20.0f, player);
                performExplosionAndLightning(world, x + 35.0d, y + 5.0d, z - 8.0d, 20.0f, player);
                performExplosionAndLightning(world, x + 46.0d, y + 5.0d, z + 25.0d, 20.0f, player);
                performExplosionAndLightning(world, x + 34.0d, y + 5.0d, z + 65.0d, 20.0f, player);
                performExplosionAndLightning(world, x + 1.0d, y + 5.0d, z + 85.0d, 20.0f, player);
                performExplosionAndLightning(world, x - 36.0d, y + 5.0d, z + 63.0d, 20.0f, player);
                performExplosionAndLightning(world, x - 49.0d, y + 5.0d, z + 25.0d, 20.0f, player);
                performExplosionAndLightning(world, x - 36.0d, y + 5.0d, z - 11.0d, 20.0f, player);
                Commands.call("summon ageofchaos:chaosguardianhelpful " ~ x ~ " " ~ (y + 20) ~ " " ~ z ~ " {CarryingCrystal:1b}", player, world, false, true);
            })
            .start();
    }
});