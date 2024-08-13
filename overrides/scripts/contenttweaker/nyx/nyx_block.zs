#loader contenttweaker

import crafttweaker.damage.IDamageSource;
import crafttweaker.event.PlayerTickEvent;
import crafttweaker.world.IBlockPos;
import mods.contenttweaker.VanillaFactory;
import mods.contenttweaker.Block;
import crafttweaker.player.IPlayer;
import crafttweaker.util.Position3f;
import crafttweaker.world.IFacing;
import crafttweaker.block.IBlock;

var meteor_rock as Block = VanillaFactory.createBlock("meteor_rock", <blockmaterial:rock>);
meteor_rock.blockHardness = 40.0;
meteor_rock.blockResistance = 3000.0;
meteor_rock.toolClass = "pickaxe";
meteor_rock.toolLevel = 3;
meteor_rock.register();

function getBottomBlockPos(player as IPlayer) as IBlockPos {
    var pos as IBlockPos = player.position as IBlockPos;
    return pos.getOffset(IFacing.down(), 1) as IBlockPos;
}

events.onPlayerTick(function(event as crafttweaker.event.PlayerTickEvent) {
        var player = event.player;
        if (!player.creative && player.world.getWorldTime() as long % 10 == 0) {
        var pos as IBlockPos = player.position as IBlockPos;
        if (player.world.getBlock(getBottomBlockPos(player)).definition.id == "contenttweaker:meteor_rock") {
            player.attackEntityFrom(IDamageSource.HOT_FLOOR(), 1.0);
        }
    }});

var meteor_glass as Block = VanillaFactory.createBlock("meteor_glass", <blockmaterial:glass>);
meteor_glass.blockHardness = 1.0;
meteor_glass.blockResistance = 5.0;
meteor_glass.fullBlock = false;
meteor_glass.translucent = true;
meteor_glass.lightOpacity = 0;
meteor_glass.blockLayer = "CUTOUT_MIPPED";
meteor_glass.blockSoundType = <soundtype:glass>;
meteor_glass.toolLevel = 0;
meteor_glass.slipperiness = 0.6;
meteor_glass.entitySpawnable = false;
meteor_glass.register();



