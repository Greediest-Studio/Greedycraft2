import native.net.minecraft.tileentity.TileEntity;
import native.net.minecraft.util.math.BlockPos;
import native.net.minecraft.world.World;
import native.net.minecraft.block.state.IBlockState;
import native.vazkii.botania.api.state.BotaniaStateProps;
import native.vazkii.botania.api.state.enums.AlfPortalState;
import native.vazkii.botania.api.recipe.ElvenPortalUpdateEvent;

import crafttweaker.world.IWorld;
import crafttweaker.world.IBlockPos;

import mods.randomtweaker.botania.IBotaniaFXHelper;

function isBlock(world as IWorld, pos as IBlockPos, blockId as string) as bool {
    if (isNull(world.getBlock(pos))) {
        return false;
    } else {
        return world.getBlock(pos).definition.id == blockId;
    }
}

events.register(function(event as ElvenPortalUpdateEvent) {
    var dimension as int = event.portalTile.getWorld().provider.getDimension();
    if (dimension == 42) {
        var world as World = event.portalTile.getWorld();
        var pos as BlockPos = event.portalTile.getPos();
        world.setBlockState(pos, world.getBlockState(pos).withProperty(BotaniaStateProps.ALFPORTAL_STATE, AlfPortalState.OFF), 1 | 2);
    }

    if (dimension == 0 && event.open) {
        var world as World = event.portalTile.getWorld();
        var pos as BlockPos = event.portalTile.getPos();
        var worldCt as IWorld = world.wrapper;
        var posCt as IBlockPos = pos.wrapper;
        var tileentity as TileEntity = event.portalTile;
        var blockState as IBlockState = world.getBlockState(pos);
        var facingState as AlfPortalState = blockState.getValue(BotaniaStateProps.ALFPORTAL_STATE) as AlfPortalState;
        var facing as string = facingState.getName();

        if (facing == "on_z" && isBlock(worldCt, posCt.north(6), "gct_mobs:mana_block")) {
            if (
                isBlock(worldCt, posCt.north(3).west(4).up(1), "gct_mobs:orichalcos_dreamwood") &&
                isBlock(worldCt, posCt.north(3).west(4).up(2), "extrabotany:blockphotonium") &&
                isBlock(worldCt, posCt.north(3).west(4).up(3), "botania:bifrostperm") &&
                isBlock(worldCt, posCt.north(3).west(4).up(4), "botania:pylon") &&
                isBlock(worldCt, posCt.south(3).east(4).up(1), "gct_mobs:orichalcos_dreamwood") &&
                isBlock(worldCt, posCt.south(3).east(4).up(2), "extrabotany:blockphotonium") &&
                isBlock(worldCt, posCt.south(3).east(4).up(3), "botania:bifrostperm") &&
                isBlock(worldCt, posCt.south(3).east(4).up(4), "botania:pylon") &&

                isBlock(worldCt, posCt.north(3).east(4).up(1), "gct_mobs:orichalcos_dreamwood") &&
                isBlock(worldCt, posCt.north(3).east(4).up(2), "extrabotany:blockshadowium") &&
                isBlock(worldCt, posCt.north(3).east(4).up(3), "botania:bifrostperm") &&
                isBlock(worldCt, posCt.north(3).east(4).up(4), "botania:pylon") &&
                isBlock(worldCt, posCt.south(3).west(4).up(1), "gct_mobs:orichalcos_dreamwood") &&
                isBlock(worldCt, posCt.south(3).west(4).up(2), "extrabotany:blockshadowium") &&
                isBlock(worldCt, posCt.south(3).west(4).up(3), "botania:bifrostperm") &&
                isBlock(worldCt, posCt.south(3).west(4).up(4), "botania:pylon") &&

                isBlock(worldCt, posCt.west(5).up(1), "gct_mobs:orichalcos_dreamwood") &&
                isBlock(worldCt, posCt.west(5).up(2), "extrabotany:blockorichalcos") &&
                isBlock(worldCt, posCt.west(5).up(3), "botania:bifrostperm") &&
                isBlock(worldCt, posCt.west(5).up(4), "botania:pylon") &&
                isBlock(worldCt, posCt.east(5).up(1), "gct_mobs:orichalcos_dreamwood") &&
                isBlock(worldCt, posCt.east(5).up(2), "extrabotany:blockorichalcos") &&
                isBlock(worldCt, posCt.east(5).up(3), "botania:bifrostperm") &&
                isBlock(worldCt, posCt.east(5).up(4), "botania:pylon") &&

                isBlock(worldCt, posCt.north(6), "gct_mobs:mana_block") &&
                isBlock(worldCt, posCt.south(6), "gct_mobs:mana_block") &&
                isBlock(worldCt, posCt.north(6).up(4), "gct_mobs:mana_block") &&
                isBlock(worldCt, posCt.south(6).up(4), "gct_mobs:mana_block") &&

                isBlock(worldCt, posCt.north(6).up(1), "botania:bifrostperm") &&
                isBlock(worldCt, posCt.north(6).up(2), "botania:bifrostperm") &&
                isBlock(worldCt, posCt.north(6).up(3), "botania:bifrostperm") &&
                isBlock(worldCt, posCt.south(6).up(1), "botania:bifrostperm") &&
                isBlock(worldCt, posCt.south(6).up(2), "botania:bifrostperm") &&
                isBlock(worldCt, posCt.south(6).up(3), "botania:bifrostperm")
            ) {
                tileentity.getTileData().setBoolean("isPortable", true);
            } else {
                tileentity.getTileData().setBoolean("isPortable", false);
            }
        } else if (facing == "on_x" && isBlock(worldCt, posCt.west(6), "gct_mobs:mana_block")) {
            if (
                isBlock(worldCt, posCt.west(3).north(4).up(1), "gct_mobs:orichalcos_dreamwood") &&
                isBlock(worldCt, posCt.west(3).north(4).up(2), "extrabotany:blockphotonium") &&
                isBlock(worldCt, posCt.west(3).north(4).up(3), "botania:bifrostperm") &&
                isBlock(worldCt, posCt.west(3).north(4).up(4), "botania:pylon") &&
                isBlock(worldCt, posCt.east(3).south(4).up(1), "gct_mobs:orichalcos_dreamwood") &&
                isBlock(worldCt, posCt.east(3).south(4).up(2), "extrabotany:blockphotonium") &&
                isBlock(worldCt, posCt.east(3).south(4).up(3), "botania:bifrostperm") &&
                isBlock(worldCt, posCt.east(3).south(4).up(4), "botania:pylon") &&

                isBlock(worldCt, posCt.west(3).south(4).up(1), "gct_mobs:orichalcos_dreamwood") &&
                isBlock(worldCt, posCt.west(3).south(4).up(2), "extrabotany:blockshadowium") &&
                isBlock(worldCt, posCt.west(3).south(4).up(3), "botania:bifrostperm") &&
                isBlock(worldCt, posCt.west(3).south(4).up(4), "botania:pylon") &&
                isBlock(worldCt, posCt.east(3).north(4).up(1), "gct_mobs:orichalcos_dreamwood") &&
                isBlock(worldCt, posCt.east(3).north(4).up(2), "extrabotany:blockshadowium") &&
                isBlock(worldCt, posCt.east(3).north(4).up(3), "botania:bifrostperm") &&
                isBlock(worldCt, posCt.east(3).north(4).up(4), "botania:pylon") &&

                isBlock(worldCt, posCt.north(5).up(1), "gct_mobs:orichalcos_dreamwood") &&
                isBlock(worldCt, posCt.north(5).up(2), "extrabotany:blockorichalcos") &&
                isBlock(worldCt, posCt.north(5).up(3), "botania:bifrostperm") &&
                isBlock(worldCt, posCt.north(5).up(4), "botania:pylon") &&
                isBlock(worldCt, posCt.south(5).up(1), "gct_mobs:orichalcos_dreamwood") &&
                isBlock(worldCt, posCt.south(5).up(2), "extrabotany:blockorichalcos") &&
                isBlock(worldCt, posCt.south(5).up(3), "botania:bifrostperm") &&
                isBlock(worldCt, posCt.south(5).up(4), "botania:pylon") &&

                isBlock(worldCt, posCt.west(6), "gct_mobs:mana_block") &&
                isBlock(worldCt, posCt.east(6), "gct_mobs:mana_block") &&
                isBlock(worldCt, posCt.west(6).up(4), "gct_mobs:mana_block") &&
                isBlock(worldCt, posCt.east(6).up(4), "gct_mobs:mana_block") &&
                isBlock(worldCt, posCt.west(6).up(1), "botania:bifrostperm") &&
                isBlock(worldCt, posCt.west(6).up(2), "botania:bifrostperm") &&
                isBlock(worldCt, posCt.west(6).up(3), "botania:bifrostperm") &&
                isBlock(worldCt, posCt.east(6).up(1), "botania:bifrostperm") &&
                isBlock(worldCt, posCt.east(6).up(2), "botania:bifrostperm") &&
                isBlock(worldCt, posCt.east(6).up(3), "botania:bifrostperm")
            ) {
                tileentity.getTileData().setBoolean("isPortable", true);
            } else {
                tileentity.getTileData().setBoolean("isPortable", false);
            }
        } else {
            tileentity.getTileData().setBoolean("isPortable", false);
        }

        if (tileentity.getTileData().getBoolean("isPortable") && worldCt.remote && facing == "on_z") {
            IBotaniaFXHelper.wispFX(posCt.x as double + 0.5d, posCt.y as double + 4.5d, posCt.z as double + 6.5d, 0.2f, 1.0f, 0.3f, 0.45f, 0.0f, 0.0f, -0.25f, 1.6f);
            IBotaniaFXHelper.wispFX(posCt.x as double + 0.5d, posCt.y as double + 4.5d, posCt.z as double - 5.5d, 0.2f, 1.0f, 0.3f, 0.45f, 0.0f, 0.0f, 0.25f, 1.6f);
            IBotaniaFXHelper.wispFX(posCt.x as double + 0.5d, posCt.y as double + 0.5d, posCt.z as double + 6.5d, 0.2f, 1.0f, 0.3f, 0.45f, 0.0f, 0.0f, -0.25f, 1.6f);
            IBotaniaFXHelper.wispFX(posCt.x as double + 0.5d, posCt.y as double + 0.5d, posCt.z as double - 5.5d, 0.2f, 1.0f, 0.3f, 0.45f, 0.0f, 0.0f, 0.25f, 1.6f);
        } else if (tileentity.getTileData().getBoolean("isPortable") && worldCt.remote && facing == "on_x") {
            IBotaniaFXHelper.wispFX(posCt.x as double + 6.5d, posCt.y as double + 4.5d, posCt.z as double + 0.5d, 0.2f, 1.0f, 0.3f, 0.45f, -0.25f, 0.0f, 0.0f, 1.6f);
            IBotaniaFXHelper.wispFX(posCt.x as double - 5.5d, posCt.y as double + 4.5d, posCt.z as double + 0.5d, 0.2f, 1.0f, 0.3f, 0.45f, 0.25f, 0.0f, 0.0f, 1.6f);
            IBotaniaFXHelper.wispFX(posCt.x as double + 6.5d, posCt.y as double + 0.5d, posCt.z as double + 0.5d, 0.2f, 1.0f, 0.3f, 0.45f, -0.25f, 0.0f, 0.0f, 1.6f);
            IBotaniaFXHelper.wispFX(posCt.x as double - 5.5d, posCt.y as double + 0.5d, posCt.z as double + 0.5d, 0.2f, 1.0f, 0.3f, 0.45f, 0.25f, 0.0f, 0.0f, 1.6f);
        }
    }
});