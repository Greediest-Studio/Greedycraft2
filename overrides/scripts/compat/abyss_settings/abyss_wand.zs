

import crafttweaker.event.PlayerInteractBlockEvent;
import crafttweaker.block.IBlock;
import crafttweaker.item.IItemStack;
import crafttweaker.player.IPlayer;
import crafttweaker.world.IBlockPos;
import crafttweaker.world.IWorld;
import crafttweaker.entity.IEntityLivingBase;
import crafttweaker.entity.IEntityLiving;
import crafttweaker.entity.IEntity;
import crafttweaker.entity.IEntityDefinition;
import crafttweaker.util.Position3f;

import mods.contenttweaker.Commands;

import mods.ctutils.utils.Math;

import scripts.compat.abyss_settings.sanity_functions as SanityHelper;

$expand IEntity$rorateAroundBlock(pos as IBlockPos, polar as double[]) {
    var newX as int = vectorToPos(polar, pos.x as double, pos.y as double, pos.z as double)[0] as int;
    var newY as int = vectorToPos(polar, pos.x as double, pos.y as double, pos.z as double)[1] as int;
    var newZ as int = vectorToPos(polar, pos.x as double, pos.y as double, pos.z as double)[2] as int;
    this.setPosition(Position3f.create(newX as float, newY as float, newZ as float).asBlockPos());
}

function addMobFusion(shog1 as IEntity, shog2 as IEntity, mobOutput as IEntityDefinition, pos as IBlockPos, player as IPlayer) {
    var world as IWorld = shog1.world;
    world.catenation()
        .run(function(world, context) {
            shog1.rorateAroundBlock(pos, [5, 0]);
            shog2.rorateAroundBlock(pos, [5, 180]);
        })
        .sleep(1).then(function(world, context) {
            shog1.rorateAroundBlock(pos.down(2), [4.958333333333333, 3]);
            shog2.rorateAroundBlock(pos.down(2), [4.958333333333333, 180 + 3]);
            Commands.call("particle lava " ~ pos.x ~ " " ~ pos.y ~ " " ~ pos.z ~ " 0 0 0 1 10", player, world, false, true);
        })
        .sleep(1).then(function(world, context) {
            shog1.rorateAroundBlock(pos.down(2), [4.916666666666666, 6]);
            shog2.rorateAroundBlock(pos.down(2), [4.916666666666666, 180 + 6]);
            Commands.call("particle lava " ~ pos.x ~ " " ~ pos.y ~ " " ~ pos.z ~ " 0 0 0 1 10", player, world, false, true);
        })
        .sleep(1).then(function(world, context) {
            shog1.rorateAroundBlock(pos.down(2), [4.874999999999999, 9]);
            shog2.rorateAroundBlock(pos.down(2), [4.874999999999999, 180 + 9]);
            Commands.call("particle lava " ~ pos.x ~ " " ~ pos.y ~ " " ~ pos.z ~ " 0 0 0 1 10", player, world, false, true);
        })
        .sleep(1).then(function(world, context) {
            shog1.rorateAroundBlock(pos.down(2), [4.833333333333332, 12]);
            shog2.rorateAroundBlock(pos.down(2), [4.833333333333332, 180 + 12]);
            Commands.call("particle lava " ~ pos.x ~ " " ~ pos.y ~ " " ~ pos.z ~ " 0 0 0 1 10", player, world, false, true);
        })
        .sleep(1).then(function(world, context) {
            shog1.rorateAroundBlock(pos.down(2), [4.791666666666665, 15]);
            shog2.rorateAroundBlock(pos.down(2), [4.791666666666665, 180 + 15]);
            Commands.call("particle lava " ~ pos.x ~ " " ~ pos.y ~ " " ~ pos.z ~ " 0 0 0 1 10", player, world, false, true);
        })
        .sleep(1).then(function(world, context) {
            shog1.rorateAroundBlock(pos.down(2), [4.749999999999998, 18]);
            shog2.rorateAroundBlock(pos.down(2), [4.749999999999998, 180 + 18]);
            Commands.call("particle lava " ~ pos.x ~ " " ~ pos.y ~ " " ~ pos.z ~ " 0 0 0 1 10", player, world, false, true);
        })
        .sleep(1).then(function(world, context) {
            shog1.rorateAroundBlock(pos.down(2), [4.708333333333331, 21]);
            shog2.rorateAroundBlock(pos.down(2), [4.708333333333331, 180 + 21]);
            Commands.call("particle lava " ~ pos.x ~ " " ~ pos.y ~ " " ~ pos.z ~ " 0 0 0 1 10", player, world, false, true);
        })
        .sleep(1).then(function(world, context) {
            shog1.rorateAroundBlock(pos.down(2), [4.666666666666664, 24]);
            shog2.rorateAroundBlock(pos.down(2), [4.666666666666664, 180 + 24]);
            Commands.call("particle lava " ~ pos.x ~ " " ~ pos.y ~ " " ~ pos.z ~ " 0 0 0 1 10", player, world, false, true);
        })
        .sleep(1).then(function(world, context) {
            shog1.rorateAroundBlock(pos.down(2), [4.624999999999997, 27]);
            shog2.rorateAroundBlock(pos.down(2), [4.624999999999997, 180 + 27]);
            Commands.call("particle lava " ~ pos.x ~ " " ~ pos.y ~ " " ~ pos.z ~ " 0 0 0 1 10", player, world, false, true);
        })
        .sleep(1).then(function(world, context) {
            shog1.rorateAroundBlock(pos.down(2), [4.58333333333333, 30]);
            shog2.rorateAroundBlock(pos.down(2), [4.58333333333333, 180 + 30]);
            Commands.call("particle lava " ~ pos.x ~ " " ~ pos.y ~ " " ~ pos.z ~ " 0 0 0 1 10", player, world, false, true);
        })
        .sleep(1).then(function(world, context) {
            shog1.rorateAroundBlock(pos.down(2), [4.541666666666663, 33]);
            shog2.rorateAroundBlock(pos.down(2), [4.541666666666663, 180 + 33]);
            Commands.call("particle lava " ~ pos.x ~ " " ~ pos.y ~ " " ~ pos.z ~ " 0 0 0 1 10", player, world, false, true);
        })
        .sleep(1).then(function(world, context) {
            shog1.rorateAroundBlock(pos.down(2), [4.4999999999999964, 36]);
            shog2.rorateAroundBlock(pos.down(2), [4.4999999999999964, 180 + 36]);
            Commands.call("particle lava " ~ pos.x ~ " " ~ pos.y ~ " " ~ pos.z ~ " 0 0 0 1 10", player, world, false, true);
        })
        .sleep(1).then(function(world, context) {
            shog1.rorateAroundBlock(pos.down(2), [4.4583333333333295, 39]);
            shog2.rorateAroundBlock(pos.down(2), [4.4583333333333295, 180 + 39]);
            Commands.call("particle lava " ~ pos.x ~ " " ~ pos.y ~ " " ~ pos.z ~ " 0 0 0 1 10", player, world, false, true);
        })
        .sleep(1).then(function(world, context) {
            shog1.rorateAroundBlock(pos.down(2), [4.4166666666666625, 42]);
            shog2.rorateAroundBlock(pos.down(2), [4.4166666666666625, 180 + 42]);
            Commands.call("particle lava " ~ pos.x ~ " " ~ pos.y ~ " " ~ pos.z ~ " 0 0 0 1 10", player, world, false, true);
        })
        .sleep(1).then(function(world, context) {
            shog1.rorateAroundBlock(pos.down(2), [4.374999999999996, 45]);
            shog2.rorateAroundBlock(pos.down(2), [4.374999999999996, 180 + 45]);
            Commands.call("particle lava " ~ pos.x ~ " " ~ pos.y ~ " " ~ pos.z ~ " 0 0 0 1 10", player, world, false, true);
        })
        .sleep(1).then(function(world, context) {
            shog1.rorateAroundBlock(pos.down(2), [4.333333333333329, 48]);
            shog2.rorateAroundBlock(pos.down(2), [4.333333333333329, 180 + 48]);
            Commands.call("particle lava " ~ pos.x ~ " " ~ pos.y ~ " " ~ pos.z ~ " 0 0 0 1 10", player, world, false, true);
        })
        .sleep(1).then(function(world, context) {
            shog1.rorateAroundBlock(pos.down(2), [4.291666666666662, 51]);
            shog2.rorateAroundBlock(pos.down(2), [4.291666666666662, 180 + 51]);
            Commands.call("particle lava " ~ pos.x ~ " " ~ pos.y ~ " " ~ pos.z ~ " 0 0 0 1 10", player, world, false, true);
        })
        .sleep(1).then(function(world, context) {
            shog1.rorateAroundBlock(pos.down(2), [4.249999999999995, 54]);
            shog2.rorateAroundBlock(pos.down(2), [4.249999999999995, 180 + 54]);
            Commands.call("particle lava " ~ pos.x ~ " " ~ pos.y ~ " " ~ pos.z ~ " 0 0 0 1 10", player, world, false, true);
        })
        .sleep(1).then(function(world, context) {
            shog1.rorateAroundBlock(pos.down(2), [4.208333333333328, 57]);
            shog2.rorateAroundBlock(pos.down(2), [4.208333333333328, 180 + 57]);
            Commands.call("particle lava " ~ pos.x ~ " " ~ pos.y ~ " " ~ pos.z ~ " 0 0 0 1 10", player, world, false, true);
        })
        .sleep(1).then(function(world, context) {
            shog1.rorateAroundBlock(pos.down(2), [4.166666666666661, 60]);
            shog2.rorateAroundBlock(pos.down(2), [4.166666666666661, 180 + 60]);
            Commands.call("particle lava " ~ pos.x ~ " " ~ pos.y ~ " " ~ pos.z ~ " 0 0 0 1 10", player, world, false, true);
        })
        .sleep(1).then(function(world, context) {
            shog1.rorateAroundBlock(pos.down(2), [4.124999999999994, 63]);
            shog2.rorateAroundBlock(pos.down(2), [4.124999999999994, 180 + 63]);
            Commands.call("particle lava " ~ pos.x ~ " " ~ pos.y ~ " " ~ pos.z ~ " 0 0 0 1 10", player, world, false, true);
        })
        .sleep(1).then(function(world, context) {
            shog1.rorateAroundBlock(pos.down(2), [4.083333333333327, 66]);
            shog2.rorateAroundBlock(pos.down(2), [4.083333333333327, 180 + 66]);
            Commands.call("particle lava " ~ pos.x ~ " " ~ pos.y ~ " " ~ pos.z ~ " 0 0 0 1 10", player, world, false, true);
        })
        .sleep(1).then(function(world, context) {
            shog1.rorateAroundBlock(pos.down(2), [4.04166666666666, 69]);
            shog2.rorateAroundBlock(pos.down(2), [4.04166666666666, 180 + 69]);
            Commands.call("particle lava " ~ pos.x ~ " " ~ pos.y ~ " " ~ pos.z ~ " 0 0 0 1 10", player, world, false, true);
        })
        .sleep(1).then(function(world, context) {
            shog1.rorateAroundBlock(pos.down(2), [3.9999999999999933, 72]);
            shog2.rorateAroundBlock(pos.down(2), [3.9999999999999933, 180 + 72]);
            Commands.call("particle lava " ~ pos.x ~ " " ~ pos.y ~ " " ~ pos.z ~ " 0 0 0 1 10", player, world, false, true);
        })
        .sleep(1).then(function(world, context) {
            shog1.rorateAroundBlock(pos.down(2), [3.958333333333327, 75]);
            shog2.rorateAroundBlock(pos.down(2), [3.958333333333327, 180 + 75]);
            Commands.call("particle lava " ~ pos.x ~ " " ~ pos.y ~ " " ~ pos.z ~ " 0 0 0 1 10", player, world, false, true);
        })
        .sleep(1).then(function(world, context) {
            shog1.rorateAroundBlock(pos.down(2), [3.9166666666666603, 78]);
            shog2.rorateAroundBlock(pos.down(2), [3.9166666666666603, 180 + 78]);
            Commands.call("particle lava " ~ pos.x ~ " " ~ pos.y ~ " " ~ pos.z ~ " 0 0 0 1 10", player, world, false, true);
        })
        .sleep(1).then(function(world, context) {
            shog1.rorateAroundBlock(pos.down(2), [3.874999999999994, 81]);
            shog2.rorateAroundBlock(pos.down(2), [3.874999999999994, 180 + 81]);
            Commands.call("particle lava " ~ pos.x ~ " " ~ pos.y ~ " " ~ pos.z ~ " 0 0 0 1 10", player, world, false, true);
        })
        .sleep(1).then(function(world, context) {
            shog1.rorateAroundBlock(pos.down(2), [3.8333333333333273, 84]);
            shog2.rorateAroundBlock(pos.down(2), [3.8333333333333273, 180 + 84]);
            Commands.call("particle lava " ~ pos.x ~ " " ~ pos.y ~ " " ~ pos.z ~ " 0 0 0 1 10", player, world, false, true);
        })
        .sleep(1).then(function(world, context) {
            shog1.rorateAroundBlock(pos.down(2), [3.7916666666666607, 87]);
            shog2.rorateAroundBlock(pos.down(2), [3.7916666666666607, 180 + 87]);
            Commands.call("particle lava " ~ pos.x ~ " " ~ pos.y ~ " " ~ pos.z ~ " 0 0 0 1 10", player, world, false, true);
        })
        .sleep(1).then(function(world, context) {
            shog1.rorateAroundBlock(pos.down(2), [3.7499999999999942, 90]);
            shog2.rorateAroundBlock(pos.down(2), [3.7499999999999942, 180 + 90]);
            Commands.call("particle lava " ~ pos.x ~ " " ~ pos.y ~ " " ~ pos.z ~ " 0 0 0 1 10", player, world, false, true);
        })
        .sleep(1).then(function(world, context) {
            shog1.rorateAroundBlock(pos.down(2), [3.7083333333333277, 93]);
            shog2.rorateAroundBlock(pos.down(2), [3.7083333333333277, 180 + 93]);
            Commands.call("particle lava " ~ pos.x ~ " " ~ pos.y ~ " " ~ pos.z ~ " 0 0 0 1 10", player, world, false, true);
        })
        .sleep(1).then(function(world, context) {
            shog1.rorateAroundBlock(pos.down(2), [3.666666666666661, 96]);
            shog2.rorateAroundBlock(pos.down(2), [3.666666666666661, 180 + 96]);
            Commands.call("particle lava " ~ pos.x ~ " " ~ pos.y ~ " " ~ pos.z ~ " 0 0 0 1 10", player, world, false, true);
        })
        .sleep(1).then(function(world, context) {
            shog1.rorateAroundBlock(pos.down(2), [3.6249999999999947, 99]);
            shog2.rorateAroundBlock(pos.down(2), [3.6249999999999947, 180 + 99]);
            Commands.call("particle lava " ~ pos.x ~ " " ~ pos.y ~ " " ~ pos.z ~ " 0 0 0 1 10", player, world, false, true);
        })
        .sleep(1).then(function(world, context) {
            shog1.rorateAroundBlock(pos.down(2), [3.583333333333328, 102]);
            shog2.rorateAroundBlock(pos.down(2), [3.583333333333328, 180 + 102]);
            Commands.call("particle lava " ~ pos.x ~ " " ~ pos.y ~ " " ~ pos.z ~ " 0 0 0 1 10", player, world, false, true);
        })
        .sleep(1).then(function(world, context) {
            shog1.rorateAroundBlock(pos.down(2), [3.5416666666666616, 105]);
            shog2.rorateAroundBlock(pos.down(2), [3.5416666666666616, 180 + 105]);
            Commands.call("particle lava " ~ pos.x ~ " " ~ pos.y ~ " " ~ pos.z ~ " 0 0 0 1 10", player, world, false, true);
        })
        .sleep(1).then(function(world, context) {
            shog1.rorateAroundBlock(pos.down(2), [3.499999999999995, 108]);
            shog2.rorateAroundBlock(pos.down(2), [3.499999999999995, 180 + 108]);
            Commands.call("particle lava " ~ pos.x ~ " " ~ pos.y ~ " " ~ pos.z ~ " 0 0 0 1 10", player, world, false, true);
        })
        .sleep(1).then(function(world, context) {
            shog1.rorateAroundBlock(pos.down(2), [3.4583333333333286, 111]);
            shog2.rorateAroundBlock(pos.down(2), [3.4583333333333286, 180 + 111]);
            Commands.call("particle lava " ~ pos.x ~ " " ~ pos.y ~ " " ~ pos.z ~ " 0 0 0 1 10", player, world, false, true);
        })
        .sleep(1).then(function(world, context) {
            shog1.rorateAroundBlock(pos.down(2), [3.416666666666662, 114]);
            shog2.rorateAroundBlock(pos.down(2), [3.416666666666662, 180 + 114]);
            Commands.call("particle lava " ~ pos.x ~ " " ~ pos.y ~ " " ~ pos.z ~ " 0 0 0 1 10", player, world, false, true);
        })
        .sleep(1).then(function(world, context) {
            shog1.rorateAroundBlock(pos.down(2), [3.3749999999999956, 117]);
            shog2.rorateAroundBlock(pos.down(2), [3.3749999999999956, 180 + 117]);
            Commands.call("particle lava " ~ pos.x ~ " " ~ pos.y ~ " " ~ pos.z ~ " 0 0 0 1 10", player, world, false, true);
        })
        .sleep(1).then(function(world, context) {
            shog1.rorateAroundBlock(pos.down(2), [3.333333333333329, 120]);
            shog2.rorateAroundBlock(pos.down(2), [3.333333333333329, 180 + 120]);
            Commands.call("particle lava " ~ pos.x ~ " " ~ pos.y ~ " " ~ pos.z ~ " 0 0 0 1 10", player, world, false, true);
        })
        .sleep(1).then(function(world, context) {
            shog1.rorateAroundBlock(pos.down(2), [3.2916666666666625, 123]);
            shog2.rorateAroundBlock(pos.down(2), [3.2916666666666625, 180 + 123]);
            Commands.call("particle lava " ~ pos.x ~ " " ~ pos.y ~ " " ~ pos.z ~ " 0 0 0 1 10", player, world, false, true);
        })
        .sleep(1).then(function(world, context) {
            shog1.rorateAroundBlock(pos.down(2), [3.249999999999996, 126]);
            shog2.rorateAroundBlock(pos.down(2), [3.249999999999996, 180 + 126]);
            Commands.call("particle lava " ~ pos.x ~ " " ~ pos.y ~ " " ~ pos.z ~ " 0 0 0 1 10", player, world, false, true);
        })
        .sleep(1).then(function(world, context) {
            shog1.rorateAroundBlock(pos.down(2), [3.2083333333333295, 129]);
            shog2.rorateAroundBlock(pos.down(2), [3.2083333333333295, 180 + 129]);
            Commands.call("particle lava " ~ pos.x ~ " " ~ pos.y ~ " " ~ pos.z ~ " 0 0 0 1 10", player, world, false, true);
        })
        .sleep(1).then(function(world, context) {
            shog1.rorateAroundBlock(pos.down(2), [3.166666666666663, 132]);
            shog2.rorateAroundBlock(pos.down(2), [3.166666666666663, 180 + 132]);
            Commands.call("particle lava " ~ pos.x ~ " " ~ pos.y ~ " " ~ pos.z ~ " 0 0 0 1 10", player, world, false, true);
        })
        .sleep(1).then(function(world, context) {
            shog1.rorateAroundBlock(pos.down(2), [3.1249999999999964, 135]);
            shog2.rorateAroundBlock(pos.down(2), [3.1249999999999964, 180 + 135]);
            Commands.call("particle lava " ~ pos.x ~ " " ~ pos.y ~ " " ~ pos.z ~ " 0 0 0 1 10", player, world, false, true);
        })
        .sleep(1).then(function(world, context) {
            shog1.rorateAroundBlock(pos.down(2), [3.08333333333333, 138]);
            shog2.rorateAroundBlock(pos.down(2), [3.08333333333333, 180 + 138]);
            Commands.call("particle lava " ~ pos.x ~ " " ~ pos.y ~ " " ~ pos.z ~ " 0 0 0 1 10", player, world, false, true);
        })
        .sleep(1).then(function(world, context) {
            shog1.rorateAroundBlock(pos.down(2), [3.0416666666666634, 141]);
            shog2.rorateAroundBlock(pos.down(2), [3.0416666666666634, 180 + 141]);
            Commands.call("particle lava " ~ pos.x ~ " " ~ pos.y ~ " " ~ pos.z ~ " 0 0 0 1 10", player, world, false, true);
        })
        .sleep(1).then(function(world, context) {
            shog1.rorateAroundBlock(pos.down(2), [2.999999999999997, 144]);
            shog2.rorateAroundBlock(pos.down(2), [2.999999999999997, 180 + 144]);
            Commands.call("particle lava " ~ pos.x ~ " " ~ pos.y ~ " " ~ pos.z ~ " 0 0 0 1 10", player, world, false, true);
        })
        .sleep(1).then(function(world, context) {
            shog1.rorateAroundBlock(pos.down(2), [2.9583333333333304, 147]);
            shog2.rorateAroundBlock(pos.down(2), [2.9583333333333304, 180 + 147]);
            Commands.call("particle lava " ~ pos.x ~ " " ~ pos.y ~ " " ~ pos.z ~ " 0 0 0 1 10", player, world, false, true);
        })
        .sleep(1).then(function(world, context) {
            shog1.rorateAroundBlock(pos.down(2), [2.916666666666664, 150]);
            shog2.rorateAroundBlock(pos.down(2), [2.916666666666664, 180 + 150]);
            Commands.call("particle lava " ~ pos.x ~ " " ~ pos.y ~ " " ~ pos.z ~ " 0 0 0 1 10", player, world, false, true);
        })
        .sleep(1).then(function(world, context) {
            shog1.rorateAroundBlock(pos.down(2), [2.8749999999999973, 153]);
            shog2.rorateAroundBlock(pos.down(2), [2.8749999999999973, 180 + 153]);
            Commands.call("particle lava " ~ pos.x ~ " " ~ pos.y ~ " " ~ pos.z ~ " 0 0 0 1 10", player, world, false, true);
        })
        .sleep(1).then(function(world, context) {
            shog1.rorateAroundBlock(pos.down(2), [2.833333333333331, 156]);
            shog2.rorateAroundBlock(pos.down(2), [2.833333333333331, 180 + 156]);
            Commands.call("particle lava " ~ pos.x ~ " " ~ pos.y ~ " " ~ pos.z ~ " 0 0 0 1 10", player, world, false, true);
        })
        .sleep(1).then(function(world, context) {
            shog1.rorateAroundBlock(pos.down(2), [2.7916666666666643, 159]);
            shog2.rorateAroundBlock(pos.down(2), [2.7916666666666643, 180 + 159]);
            Commands.call("particle lava " ~ pos.x ~ " " ~ pos.y ~ " " ~ pos.z ~ " 0 0 0 1 10", player, world, false, true);
        })
        .sleep(1).then(function(world, context) {
            shog1.rorateAroundBlock(pos.down(2), [2.749999999999998, 162]);
            shog2.rorateAroundBlock(pos.down(2), [2.749999999999998, 180 + 162]);
            Commands.call("particle lava " ~ pos.x ~ " " ~ pos.y ~ " " ~ pos.z ~ " 0 0 0 1 10", player, world, false, true);
        })
        .sleep(1).then(function(world, context) {
            shog1.rorateAroundBlock(pos.down(2), [2.7083333333333313, 165]);
            shog2.rorateAroundBlock(pos.down(2), [2.7083333333333313, 180 + 165]);
            Commands.call("particle lava " ~ pos.x ~ " " ~ pos.y ~ " " ~ pos.z ~ " 0 0 0 1 10", player, world, false, true);
        })
        .sleep(1).then(function(world, context) {
            shog1.rorateAroundBlock(pos.down(2), [2.6666666666666647, 168]);
            shog2.rorateAroundBlock(pos.down(2), [2.6666666666666647, 180 + 168]);
            Commands.call("particle lava " ~ pos.x ~ " " ~ pos.y ~ " " ~ pos.z ~ " 0 0 0 1 10", player, world, false, true);
        })
        .sleep(1).then(function(world, context) {
            shog1.rorateAroundBlock(pos.down(2), [2.6249999999999982, 171]);
            shog2.rorateAroundBlock(pos.down(2), [2.6249999999999982, 180 + 171]);
            Commands.call("particle lava " ~ pos.x ~ " " ~ pos.y ~ " " ~ pos.z ~ " 0 0 0 1 10", player, world, false, true);
        })
        .sleep(1).then(function(world, context) {
            shog1.rorateAroundBlock(pos.down(2), [2.5833333333333317, 174]);
            shog2.rorateAroundBlock(pos.down(2), [2.5833333333333317, 180 + 174]);
            Commands.call("particle lava " ~ pos.x ~ " " ~ pos.y ~ " " ~ pos.z ~ " 0 0 0 1 10", player, world, false, true);
        })
        .sleep(1).then(function(world, context) {
            shog1.rorateAroundBlock(pos.down(2), [2.541666666666665, 177]);
            shog2.rorateAroundBlock(pos.down(2), [2.541666666666665, 180 + 177]);
            Commands.call("particle lava " ~ pos.x ~ " " ~ pos.y ~ " " ~ pos.z ~ " 0 0 0 1 10", player, world, false, true);
        })
        .sleep(1).then(function(world, context) {
            shog1.rorateAroundBlock(pos.down(2), [2.4999999999999987, 180]);
            shog2.rorateAroundBlock(pos.down(2), [2.4999999999999987, 180 + 180]);
            Commands.call("particle lava " ~ pos.x ~ " " ~ pos.y ~ " " ~ pos.z ~ " 0 0 0 1 10", player, world, false, true);
        })
        .sleep(1).then(function(world, context) {
            shog1.rorateAroundBlock(pos.down(2), [2.458333333333332, 183]);
            shog2.rorateAroundBlock(pos.down(2), [2.458333333333332, 180 + 183]);
            Commands.call("particle lava " ~ pos.x ~ " " ~ pos.y ~ " " ~ pos.z ~ " 0 0 0 1 10", player, world, false, true);
        })
        .sleep(1).then(function(world, context) {
            shog1.rorateAroundBlock(pos.down(2), [2.4166666666666656, 186]);
            shog2.rorateAroundBlock(pos.down(2), [2.4166666666666656, 180 + 186]);
            Commands.call("particle lava " ~ pos.x ~ " " ~ pos.y ~ " " ~ pos.z ~ " 0 0 0 1 10", player, world, false, true);
        })
        .sleep(1).then(function(world, context) {
            shog1.rorateAroundBlock(pos.down(2), [2.374999999999999, 189]);
            shog2.rorateAroundBlock(pos.down(2), [2.374999999999999, 180 + 189]);
            Commands.call("particle lava " ~ pos.x ~ " " ~ pos.y ~ " " ~ pos.z ~ " 0 0 0 1 10", player, world, false, true);
        })
        .sleep(1).then(function(world, context) {
            shog1.rorateAroundBlock(pos.down(2), [2.3333333333333326, 192]);
            shog2.rorateAroundBlock(pos.down(2), [2.3333333333333326, 180 + 192]);
            Commands.call("particle lava " ~ pos.x ~ " " ~ pos.y ~ " " ~ pos.z ~ " 0 0 0 1 10", player, world, false, true);
        })
        .sleep(1).then(function(world, context) {
            shog1.rorateAroundBlock(pos.down(2), [2.291666666666666, 195]);
            shog2.rorateAroundBlock(pos.down(2), [2.291666666666666, 180 + 195]);
            Commands.call("particle lava " ~ pos.x ~ " " ~ pos.y ~ " " ~ pos.z ~ " 0 0 0 1 10", player, world, false, true);
        })
        .sleep(1).then(function(world, context) {
            shog1.rorateAroundBlock(pos.down(2), [2.2499999999999996, 198]);
            shog2.rorateAroundBlock(pos.down(2), [2.2499999999999996, 180 + 198]);
            Commands.call("particle lava " ~ pos.x ~ " " ~ pos.y ~ " " ~ pos.z ~ " 0 0 0 1 10", player, world, false, true);
        })
        .sleep(1).then(function(world, context) {
            shog1.rorateAroundBlock(pos.down(2), [2.208333333333333, 201]);
            shog2.rorateAroundBlock(pos.down(2), [2.208333333333333, 180 + 201]);
            Commands.call("particle lava " ~ pos.x ~ " " ~ pos.y ~ " " ~ pos.z ~ " 0 0 0 1 10", player, world, false, true);
        })
        .sleep(1).then(function(world, context) {
            shog1.rorateAroundBlock(pos.down(2), [2.1666666666666665, 204]);
            shog2.rorateAroundBlock(pos.down(2), [2.1666666666666665, 180 + 204]);
            Commands.call("particle lava " ~ pos.x ~ " " ~ pos.y ~ " " ~ pos.z ~ " 0 0 0 1 10", player, world, false, true);
        })
        .sleep(1).then(function(world, context) {
            shog1.rorateAroundBlock(pos.down(2), [2.125, 207]);
            shog2.rorateAroundBlock(pos.down(2), [2.125, 180 + 207]);
            Commands.call("particle lava " ~ pos.x ~ " " ~ pos.y ~ " " ~ pos.z ~ " 0 0 0 1 10", player, world, false, true);
        })
        .sleep(1).then(function(world, context) {
            shog1.rorateAroundBlock(pos.down(2), [2.0833333333333335, 210]);
            shog2.rorateAroundBlock(pos.down(2), [2.0833333333333335, 180 + 210]);
            Commands.call("particle lava " ~ pos.x ~ " " ~ pos.y ~ " " ~ pos.z ~ " 0 0 0 1 10", player, world, false, true);
        })
        .sleep(1).then(function(world, context) {
            shog1.rorateAroundBlock(pos.down(2), [2.041666666666667, 213]);
            shog2.rorateAroundBlock(pos.down(2), [2.041666666666667, 180 + 213]);
            Commands.call("particle lava " ~ pos.x ~ " " ~ pos.y ~ " " ~ pos.z ~ " 0 0 0 1 10", player, world, false, true);
        })
        .sleep(1).then(function(world, context) {
            shog1.rorateAroundBlock(pos.down(2), [2.0000000000000004, 216]);
            shog2.rorateAroundBlock(pos.down(2), [2.0000000000000004, 180 + 216]);
            Commands.call("particle lava " ~ pos.x ~ " " ~ pos.y ~ " " ~ pos.z ~ " 0 0 0 1 10", player, world, false, true);
        })
        .sleep(1).then(function(world, context) {
            shog1.rorateAroundBlock(pos.down(2), [1.9583333333333337, 219]);
            shog2.rorateAroundBlock(pos.down(2), [1.9583333333333337, 180 + 219]);
            Commands.call("particle lava " ~ pos.x ~ " " ~ pos.y ~ " " ~ pos.z ~ " 0 0 0 1 10", player, world, false, true);
        })
        .sleep(1).then(function(world, context) {
            shog1.rorateAroundBlock(pos.down(2), [1.916666666666667, 222]);
            shog2.rorateAroundBlock(pos.down(2), [1.916666666666667, 180 + 222]);
            Commands.call("particle lava " ~ pos.x ~ " " ~ pos.y ~ " " ~ pos.z ~ " 0 0 0 1 10", player, world, false, true);
        })
        .sleep(1).then(function(world, context) {
            shog1.rorateAroundBlock(pos.down(2), [1.8750000000000002, 225]);
            shog2.rorateAroundBlock(pos.down(2), [1.8750000000000002, 180 + 225]);
            Commands.call("particle lava " ~ pos.x ~ " " ~ pos.y ~ " " ~ pos.z ~ " 0 0 0 1 10", player, world, false, true);
        })
        .sleep(1).then(function(world, context) {
            shog1.rorateAroundBlock(pos.down(2), [1.8333333333333335, 228]);
            shog2.rorateAroundBlock(pos.down(2), [1.8333333333333335, 180 + 228]);
            Commands.call("particle lava " ~ pos.x ~ " " ~ pos.y ~ " " ~ pos.z ~ " 0 0 0 1 10", player, world, false, true);
        })
        .sleep(1).then(function(world, context) {
            shog1.rorateAroundBlock(pos.down(2), [1.7916666666666667, 231]);
            shog2.rorateAroundBlock(pos.down(2), [1.7916666666666667, 180 + 231]);
            Commands.call("particle lava " ~ pos.x ~ " " ~ pos.y ~ " " ~ pos.z ~ " 0 0 0 1 10", player, world, false, true);
        })
        .sleep(1).then(function(world, context) {
            shog1.rorateAroundBlock(pos.down(2), [1.75, 234]);
            shog2.rorateAroundBlock(pos.down(2), [1.75, 180 + 234]);
            Commands.call("particle lava " ~ pos.x ~ " " ~ pos.y ~ " " ~ pos.z ~ " 0 0 0 1 10", player, world, false, true);
        })
        .sleep(1).then(function(world, context) {
            shog1.rorateAroundBlock(pos.down(2), [1.7083333333333333, 237]);
            shog2.rorateAroundBlock(pos.down(2), [1.7083333333333333, 180 + 237]);
            Commands.call("particle lava " ~ pos.x ~ " " ~ pos.y ~ " " ~ pos.z ~ " 0 0 0 1 10", player, world, false, true);
        })
        .sleep(1).then(function(world, context) {
            shog1.rorateAroundBlock(pos.down(2), [1.6666666666666665, 240]);
            shog2.rorateAroundBlock(pos.down(2), [1.6666666666666665, 180 + 240]);
            Commands.call("particle lava " ~ pos.x ~ " " ~ pos.y ~ " " ~ pos.z ~ " 0 0 0 1 10", player, world, false, true);
        })
        .sleep(1).then(function(world, context) {
            shog1.rorateAroundBlock(pos.down(2), [1.6249999999999998, 243]);
            shog2.rorateAroundBlock(pos.down(2), [1.6249999999999998, 180 + 243]);
            Commands.call("particle lava " ~ pos.x ~ " " ~ pos.y ~ " " ~ pos.z ~ " 0 0 0 1 10", player, world, false, true);
        })
        .sleep(1).then(function(world, context) {
            shog1.rorateAroundBlock(pos.down(2), [1.583333333333333, 246]);
            shog2.rorateAroundBlock(pos.down(2), [1.583333333333333, 180 + 246]);
            Commands.call("particle lava " ~ pos.x ~ " " ~ pos.y ~ " " ~ pos.z ~ " 0 0 0 1 10", player, world, false, true);
        })
        .sleep(1).then(function(world, context) {
            shog1.rorateAroundBlock(pos.down(2), [1.5416666666666663, 249]);
            shog2.rorateAroundBlock(pos.down(2), [1.5416666666666663, 180 + 249]);
            Commands.call("particle lava " ~ pos.x ~ " " ~ pos.y ~ " " ~ pos.z ~ " 0 0 0 1 10", player, world, false, true);
        })
        .sleep(1).then(function(world, context) {
            shog1.rorateAroundBlock(pos.down(2), [1.4999999999999996, 252]);
            shog2.rorateAroundBlock(pos.down(2), [1.4999999999999996, 180 + 252]);
            Commands.call("particle lava " ~ pos.x ~ " " ~ pos.y ~ " " ~ pos.z ~ " 0 0 0 1 10", player, world, false, true);
        })
        .sleep(1).then(function(world, context) {
            shog1.rorateAroundBlock(pos.down(2), [1.4583333333333328, 255]);
            shog2.rorateAroundBlock(pos.down(2), [1.4583333333333328, 180 + 255]);
            Commands.call("particle lava " ~ pos.x ~ " " ~ pos.y ~ " " ~ pos.z ~ " 0 0 0 1 10", player, world, false, true);
        })
        .sleep(1).then(function(world, context) {
            shog1.rorateAroundBlock(pos.down(2), [1.416666666666666, 258]);
            shog2.rorateAroundBlock(pos.down(2), [1.416666666666666, 180 + 258]);
            Commands.call("particle lava " ~ pos.x ~ " " ~ pos.y ~ " " ~ pos.z ~ " 0 0 0 1 10", player, world, false, true);
        })
        .sleep(1).then(function(world, context) {
            shog1.rorateAroundBlock(pos.down(2), [1.3749999999999993, 261]);
            shog2.rorateAroundBlock(pos.down(2), [1.3749999999999993, 180 + 261]);
            Commands.call("particle lava " ~ pos.x ~ " " ~ pos.y ~ " " ~ pos.z ~ " 0 0 0 1 10", player, world, false, true);
        })
        .sleep(1).then(function(world, context) {
            shog1.rorateAroundBlock(pos.down(2), [1.3333333333333326, 264]);
            shog2.rorateAroundBlock(pos.down(2), [1.3333333333333326, 180 + 264]);
            Commands.call("particle lava " ~ pos.x ~ " " ~ pos.y ~ " " ~ pos.z ~ " 0 0 0 1 10", player, world, false, true);
        })
        .sleep(1).then(function(world, context) {
            shog1.rorateAroundBlock(pos.down(2), [1.2916666666666659, 267]);
            shog2.rorateAroundBlock(pos.down(2), [1.2916666666666659, 180 + 267]);
            Commands.call("particle lava " ~ pos.x ~ " " ~ pos.y ~ " " ~ pos.z ~ " 0 0 0 1 10", player, world, false, true);
        })
        .sleep(1).then(function(world, context) {
            shog1.rorateAroundBlock(pos.down(2), [1.2499999999999991, 270]);
            shog2.rorateAroundBlock(pos.down(2), [1.2499999999999991, 180 + 270]);
            Commands.call("particle lava " ~ pos.x ~ " " ~ pos.y ~ " " ~ pos.z ~ " 0 0 0 1 10", player, world, false, true);
        })
        .sleep(1).then(function(world, context) {
            shog1.rorateAroundBlock(pos.down(2), [1.2083333333333324, 273]);
            shog2.rorateAroundBlock(pos.down(2), [1.2083333333333324, 180 + 273]);
            Commands.call("particle lava " ~ pos.x ~ " " ~ pos.y ~ " " ~ pos.z ~ " 0 0 0 1 10", player, world, false, true);
        })
        .sleep(1).then(function(world, context) {
            shog1.rorateAroundBlock(pos.down(2), [1.1666666666666656, 276]);
            shog2.rorateAroundBlock(pos.down(2), [1.1666666666666656, 180 + 276]);
            Commands.call("particle lava " ~ pos.x ~ " " ~ pos.y ~ " " ~ pos.z ~ " 0 0 0 1 10", player, world, false, true);
        })
        .sleep(1).then(function(world, context) {
            shog1.rorateAroundBlock(pos.down(2), [1.124999999999999, 279]);
            shog2.rorateAroundBlock(pos.down(2), [1.124999999999999, 180 + 279]);
            Commands.call("particle lava " ~ pos.x ~ " " ~ pos.y ~ " " ~ pos.z ~ " 0 0 0 1 10", player, world, false, true);
        })
        .sleep(1).then(function(world, context) {
            shog1.rorateAroundBlock(pos.down(2), [1.0833333333333321, 282]);
            shog2.rorateAroundBlock(pos.down(2), [1.0833333333333321, 180 + 282]);
            Commands.call("particle lava " ~ pos.x ~ " " ~ pos.y ~ " " ~ pos.z ~ " 0 0 0 1 10", player, world, false, true);
        })
        .sleep(1).then(function(world, context) {
            shog1.rorateAroundBlock(pos.down(2), [1.0416666666666654, 285]);
            shog2.rorateAroundBlock(pos.down(2), [1.0416666666666654, 180 + 285]);
            Commands.call("particle lava " ~ pos.x ~ " " ~ pos.y ~ " " ~ pos.z ~ " 0 0 0 1 10", player, world, false, true);
        })
        .sleep(1).then(function(world, context) {
            shog1.rorateAroundBlock(pos.down(2), [0.9999999999999988, 288]);
            shog2.rorateAroundBlock(pos.down(2), [0.9999999999999988, 180 + 288]);
            Commands.call("particle lava " ~ pos.x ~ " " ~ pos.y ~ " " ~ pos.z ~ " 0 0 0 1 10", player, world, false, true);
        })
        .sleep(1).then(function(world, context) {
            shog1.rorateAroundBlock(pos.down(2), [0.9583333333333321, 291]);
            shog2.rorateAroundBlock(pos.down(2), [0.9583333333333321, 180 + 291]);
            Commands.call("particle lava " ~ pos.x ~ " " ~ pos.y ~ " " ~ pos.z ~ " 0 0 0 1 10", player, world, false, true);
        })
        .sleep(1).then(function(world, context) {
            shog1.rorateAroundBlock(pos.down(2), [0.9166666666666655, 294]);
            shog2.rorateAroundBlock(pos.down(2), [0.9166666666666655, 180 + 294]);
            Commands.call("particle lava " ~ pos.x ~ " " ~ pos.y ~ " " ~ pos.z ~ " 0 0 0 1 10", player, world, false, true);
        })
        .sleep(1).then(function(world, context) {
            shog1.rorateAroundBlock(pos.down(2), [0.8749999999999989, 297]);
            shog2.rorateAroundBlock(pos.down(2), [0.8749999999999989, 180 + 297]);
            Commands.call("particle lava " ~ pos.x ~ " " ~ pos.y ~ " " ~ pos.z ~ " 0 0 0 1 10", player, world, false, true);
        })
        .sleep(1).then(function(world, context) {
            shog1.rorateAroundBlock(pos.down(2), [0.8333333333333323, 300]);
            shog2.rorateAroundBlock(pos.down(2), [0.8333333333333323, 180 + 300]);
            Commands.call("particle lava " ~ pos.x ~ " " ~ pos.y ~ " " ~ pos.z ~ " 0 0 0 1 10", player, world, false, true);
        })
        .sleep(1).then(function(world, context) {
            shog1.rorateAroundBlock(pos.down(2), [0.7916666666666656, 303]);
            shog2.rorateAroundBlock(pos.down(2), [0.7916666666666656, 180 + 303]);
            Commands.call("particle lava " ~ pos.x ~ " " ~ pos.y ~ " " ~ pos.z ~ " 0 0 0 1 10", player, world, false, true);
        })
        .sleep(1).then(function(world, context) {
            shog1.rorateAroundBlock(pos.down(2), [0.749999999999999, 306]);
            shog2.rorateAroundBlock(pos.down(2), [0.749999999999999, 180 + 306]);
            Commands.call("particle lava " ~ pos.x ~ " " ~ pos.y ~ " " ~ pos.z ~ " 0 0 0 1 10", player, world, false, true);
        })
        .sleep(1).then(function(world, context) {
            shog1.rorateAroundBlock(pos.down(2), [0.7083333333333324, 309]);
            shog2.rorateAroundBlock(pos.down(2), [0.7083333333333324, 180 + 309]);
            Commands.call("particle lava " ~ pos.x ~ " " ~ pos.y ~ " " ~ pos.z ~ " 0 0 0 1 10", player, world, false, true);
        })
        .sleep(1).then(function(world, context) {
            shog1.rorateAroundBlock(pos.down(2), [0.6666666666666657, 312]);
            shog2.rorateAroundBlock(pos.down(2), [0.6666666666666657, 180 + 312]);
            Commands.call("particle lava " ~ pos.x ~ " " ~ pos.y ~ " " ~ pos.z ~ " 0 0 0 1 10", player, world, false, true);
        })
        .sleep(1).then(function(world, context) {
            shog1.rorateAroundBlock(pos.down(2), [0.6249999999999991, 315]);
            shog2.rorateAroundBlock(pos.down(2), [0.6249999999999991, 180 + 315]);
            Commands.call("particle lava " ~ pos.x ~ " " ~ pos.y ~ " " ~ pos.z ~ " 0 0 0 1 10", player, world, false, true);
        })
        .sleep(1).then(function(world, context) {
            shog1.rorateAroundBlock(pos.down(2), [0.5833333333333325, 318]);
            shog2.rorateAroundBlock(pos.down(2), [0.5833333333333325, 180 + 318]);
            Commands.call("particle lava " ~ pos.x ~ " " ~ pos.y ~ " " ~ pos.z ~ " 0 0 0 1 10", player, world, false, true);
        })
        .sleep(1).then(function(world, context) {
            shog1.rorateAroundBlock(pos.down(2), [0.5416666666666659, 321]);
            shog2.rorateAroundBlock(pos.down(2), [0.5416666666666659, 180 + 321]);
            Commands.call("particle lava " ~ pos.x ~ " " ~ pos.y ~ " " ~ pos.z ~ " 0 0 0 1 10", player, world, false, true);
        })
        .sleep(1).then(function(world, context) {
            shog1.rorateAroundBlock(pos.down(2), [0.49999999999999917, 324]);
            shog2.rorateAroundBlock(pos.down(2), [0.49999999999999917, 180 + 324]);
            Commands.call("particle lava " ~ pos.x ~ " " ~ pos.y ~ " " ~ pos.z ~ " 0 0 0 1 10", player, world, false, true);
        })
        .sleep(1).then(function(world, context) {
            shog1.rorateAroundBlock(pos.down(2), [0.4583333333333325, 327]);
            shog2.rorateAroundBlock(pos.down(2), [0.4583333333333325, 180 + 327]);
            Commands.call("particle lava " ~ pos.x ~ " " ~ pos.y ~ " " ~ pos.z ~ " 0 0 0 1 10", player, world, false, true);
        })
        .sleep(1).then(function(world, context) {
            shog1.rorateAroundBlock(pos.down(2), [0.4166666666666658, 330]);
            shog2.rorateAroundBlock(pos.down(2), [0.4166666666666658, 180 + 330]);
            Commands.call("particle lava " ~ pos.x ~ " " ~ pos.y ~ " " ~ pos.z ~ " 0 0 0 1 10", player, world, false, true);
        })
        .sleep(1).then(function(world, context) {
            shog1.rorateAroundBlock(pos.down(2), [0.3749999999999991, 333]);
            shog2.rorateAroundBlock(pos.down(2), [0.3749999999999991, 180 + 333]);
            Commands.call("particle lava " ~ pos.x ~ " " ~ pos.y ~ " " ~ pos.z ~ " 0 0 0 1 10", player, world, false, true);
        })
        .sleep(1).then(function(world, context) {
            shog1.rorateAroundBlock(pos.down(2), [0.3333333333333324, 336]);
            shog2.rorateAroundBlock(pos.down(2), [0.3333333333333324, 180 + 336]);
            Commands.call("particle lava " ~ pos.x ~ " " ~ pos.y ~ " " ~ pos.z ~ " 0 0 0 1 10", player, world, false, true);
        })
        .sleep(1).then(function(world, context) {
            shog1.rorateAroundBlock(pos.down(2), [0.29166666666666574, 339]);
            shog2.rorateAroundBlock(pos.down(2), [0.29166666666666574, 180 + 339]);
            Commands.call("particle lava " ~ pos.x ~ " " ~ pos.y ~ " " ~ pos.z ~ " 0 0 0 1 10", player, world, false, true);
        })
        .sleep(1).then(function(world, context) {
            shog1.rorateAroundBlock(pos.down(2), [0.24999999999999908, 342]);
            shog2.rorateAroundBlock(pos.down(2), [0.24999999999999908, 180 + 342]);
            Commands.call("particle lava " ~ pos.x ~ " " ~ pos.y ~ " " ~ pos.z ~ " 0 0 0 1 10", player, world, false, true);
        })
        .sleep(1).then(function(world, context) {
            shog1.rorateAroundBlock(pos.down(2), [0.20833333333333243, 345]);
            shog2.rorateAroundBlock(pos.down(2), [0.20833333333333243, 180 + 345]);
            Commands.call("particle lava " ~ pos.x ~ " " ~ pos.y ~ " " ~ pos.z ~ " 0 0 0 1 10", player, world, false, true);
        })
        .sleep(1).then(function(world, context) {
            shog1.rorateAroundBlock(pos.down(2), [0.16666666666666577, 348]);
            shog2.rorateAroundBlock(pos.down(2), [0.16666666666666577, 180 + 348]);
            Commands.call("particle lava " ~ pos.x ~ " " ~ pos.y ~ " " ~ pos.z ~ " 0 0 0 1 10", player, world, false, true);
        })
        .sleep(1).then(function(world, context) {
            shog1.rorateAroundBlock(pos.down(2), [0.12499999999999911, 351]);
            shog2.rorateAroundBlock(pos.down(2), [0.12499999999999911, 180 + 351]);
            Commands.call("particle lava " ~ pos.x ~ " " ~ pos.y ~ " " ~ pos.z ~ " 0 0 0 1 10", player, world, false, true);
        })
        .sleep(1).then(function(world, context) {
            shog1.rorateAroundBlock(pos.down(2), [0.08333333333333245, 354]);
            shog2.rorateAroundBlock(pos.down(2), [0.08333333333333245, 180 + 354]);
            Commands.call("particle lava " ~ pos.x ~ " " ~ pos.y ~ " " ~ pos.z ~ " 0 0 0 1 10", player, world, false, true);
        })
        .sleep(1).then(function(world, context) {
            shog1.rorateAroundBlock(pos.down(2), [0.04166666666666579, 357]);
            shog2.rorateAroundBlock(pos.down(2), [0.04166666666666579, 180 + 357]);
            Commands.call("particle lava " ~ pos.x ~ " " ~ pos.y ~ " " ~ pos.z ~ " 0 0 0 1 10", player, world, false, true);
        })
        .sleep(1).then(function(world, context) {
            world.removeEntity(shog1);
            world.removeEntity(shog2);
            world.performExplosion(player, pos.x, pos.y, pos.z, 10, false, false);
            mobOutput.spawnEntity(world, pos.down(2));
        })
        .start();
}
function addMobFusionToItem(shog1 as IEntity, shog2 as IEntity, itemOutput as IItemStack, pos as IBlockPos, player as IPlayer) {
    var world as IWorld = shog1.world;
    var x as int = pos.x;
    var y as int = pos.y;
    var z as int = pos.z;
    world.catenation()
        .run(function(world, context) {
            shog1.rorateAroundBlock(pos, [5, 0]);
            shog2.rorateAroundBlock(pos, [5, 180]);
        })
        .sleep(1).then(function(world, context) {
            shog1.rorateAroundBlock(pos.down(2), [4.958333333333333, 3]);
            shog2.rorateAroundBlock(pos.down(2), [4.958333333333333, 180 + 3]);
            Commands.call("particle lava " ~ pos.x ~ " " ~ pos.y ~ " " ~ pos.z ~ " 0 0 0 1 10", player, world, false, true);
        })
        .sleep(1).then(function(world, context) {
            shog1.rorateAroundBlock(pos.down(2), [4.916666666666666, 6]);
            shog2.rorateAroundBlock(pos.down(2), [4.916666666666666, 180 + 6]);
            Commands.call("particle lava " ~ pos.x ~ " " ~ pos.y ~ " " ~ pos.z ~ " 0 0 0 1 10", player, world, false, true);
        })
        .sleep(1).then(function(world, context) {
            shog1.rorateAroundBlock(pos.down(2), [4.874999999999999, 9]);
            shog2.rorateAroundBlock(pos.down(2), [4.874999999999999, 180 + 9]);
            Commands.call("particle lava " ~ pos.x ~ " " ~ pos.y ~ " " ~ pos.z ~ " 0 0 0 1 10", player, world, false, true);
        })
        .sleep(1).then(function(world, context) {
            shog1.rorateAroundBlock(pos.down(2), [4.833333333333332, 12]);
            shog2.rorateAroundBlock(pos.down(2), [4.833333333333332, 180 + 12]);
            Commands.call("particle lava " ~ pos.x ~ " " ~ pos.y ~ " " ~ pos.z ~ " 0 0 0 1 10", player, world, false, true);
        })
        .sleep(1).then(function(world, context) {
            shog1.rorateAroundBlock(pos.down(2), [4.791666666666665, 15]);
            shog2.rorateAroundBlock(pos.down(2), [4.791666666666665, 180 + 15]);
            Commands.call("particle lava " ~ pos.x ~ " " ~ pos.y ~ " " ~ pos.z ~ " 0 0 0 1 10", player, world, false, true);
        })
        .sleep(1).then(function(world, context) {
            shog1.rorateAroundBlock(pos.down(2), [4.749999999999998, 18]);
            shog2.rorateAroundBlock(pos.down(2), [4.749999999999998, 180 + 18]);
            Commands.call("particle lava " ~ pos.x ~ " " ~ pos.y ~ " " ~ pos.z ~ " 0 0 0 1 10", player, world, false, true);
        })
        .sleep(1).then(function(world, context) {
            shog1.rorateAroundBlock(pos.down(2), [4.708333333333331, 21]);
            shog2.rorateAroundBlock(pos.down(2), [4.708333333333331, 180 + 21]);
            Commands.call("particle lava " ~ pos.x ~ " " ~ pos.y ~ " " ~ pos.z ~ " 0 0 0 1 10", player, world, false, true);
        })
        .sleep(1).then(function(world, context) {
            shog1.rorateAroundBlock(pos.down(2), [4.666666666666664, 24]);
            shog2.rorateAroundBlock(pos.down(2), [4.666666666666664, 180 + 24]);
            Commands.call("particle lava " ~ pos.x ~ " " ~ pos.y ~ " " ~ pos.z ~ " 0 0 0 1 10", player, world, false, true);
        })
        .sleep(1).then(function(world, context) {
            shog1.rorateAroundBlock(pos.down(2), [4.624999999999997, 27]);
            shog2.rorateAroundBlock(pos.down(2), [4.624999999999997, 180 + 27]);
            Commands.call("particle lava " ~ pos.x ~ " " ~ pos.y ~ " " ~ pos.z ~ " 0 0 0 1 10", player, world, false, true);
        })
        .sleep(1).then(function(world, context) {
            shog1.rorateAroundBlock(pos.down(2), [4.58333333333333, 30]);
            shog2.rorateAroundBlock(pos.down(2), [4.58333333333333, 180 + 30]);
            Commands.call("particle lava " ~ pos.x ~ " " ~ pos.y ~ " " ~ pos.z ~ " 0 0 0 1 10", player, world, false, true);
        })
        .sleep(1).then(function(world, context) {
            shog1.rorateAroundBlock(pos.down(2), [4.541666666666663, 33]);
            shog2.rorateAroundBlock(pos.down(2), [4.541666666666663, 180 + 33]);
            Commands.call("particle lava " ~ pos.x ~ " " ~ pos.y ~ " " ~ pos.z ~ " 0 0 0 1 10", player, world, false, true);
        })
        .sleep(1).then(function(world, context) {
            shog1.rorateAroundBlock(pos.down(2), [4.4999999999999964, 36]);
            shog2.rorateAroundBlock(pos.down(2), [4.4999999999999964, 180 + 36]);
            Commands.call("particle lava " ~ pos.x ~ " " ~ pos.y ~ " " ~ pos.z ~ " 0 0 0 1 10", player, world, false, true);
        })
        .sleep(1).then(function(world, context) {
            shog1.rorateAroundBlock(pos.down(2), [4.4583333333333295, 39]);
            shog2.rorateAroundBlock(pos.down(2), [4.4583333333333295, 180 + 39]);
            Commands.call("particle lava " ~ pos.x ~ " " ~ pos.y ~ " " ~ pos.z ~ " 0 0 0 1 10", player, world, false, true);
        })
        .sleep(1).then(function(world, context) {
            shog1.rorateAroundBlock(pos.down(2), [4.4166666666666625, 42]);
            shog2.rorateAroundBlock(pos.down(2), [4.4166666666666625, 180 + 42]);
            Commands.call("particle lava " ~ pos.x ~ " " ~ pos.y ~ " " ~ pos.z ~ " 0 0 0 1 10", player, world, false, true);
        })
        .sleep(1).then(function(world, context) {
            shog1.rorateAroundBlock(pos.down(2), [4.374999999999996, 45]);
            shog2.rorateAroundBlock(pos.down(2), [4.374999999999996, 180 + 45]);
            Commands.call("particle lava " ~ pos.x ~ " " ~ pos.y ~ " " ~ pos.z ~ " 0 0 0 1 10", player, world, false, true);
        })
        .sleep(1).then(function(world, context) {
            shog1.rorateAroundBlock(pos.down(2), [4.333333333333329, 48]);
            shog2.rorateAroundBlock(pos.down(2), [4.333333333333329, 180 + 48]);
            Commands.call("particle lava " ~ pos.x ~ " " ~ pos.y ~ " " ~ pos.z ~ " 0 0 0 1 10", player, world, false, true);
        })
        .sleep(1).then(function(world, context) {
            shog1.rorateAroundBlock(pos.down(2), [4.291666666666662, 51]);
            shog2.rorateAroundBlock(pos.down(2), [4.291666666666662, 180 + 51]);
            Commands.call("particle lava " ~ pos.x ~ " " ~ pos.y ~ " " ~ pos.z ~ " 0 0 0 1 10", player, world, false, true);
        })
        .sleep(1).then(function(world, context) {
            shog1.rorateAroundBlock(pos.down(2), [4.249999999999995, 54]);
            shog2.rorateAroundBlock(pos.down(2), [4.249999999999995, 180 + 54]);
            Commands.call("particle lava " ~ pos.x ~ " " ~ pos.y ~ " " ~ pos.z ~ " 0 0 0 1 10", player, world, false, true);
        })
        .sleep(1).then(function(world, context) {
            shog1.rorateAroundBlock(pos.down(2), [4.208333333333328, 57]);
            shog2.rorateAroundBlock(pos.down(2), [4.208333333333328, 180 + 57]);
            Commands.call("particle lava " ~ pos.x ~ " " ~ pos.y ~ " " ~ pos.z ~ " 0 0 0 1 10", player, world, false, true);
        })
        .sleep(1).then(function(world, context) {
            shog1.rorateAroundBlock(pos.down(2), [4.166666666666661, 60]);
            shog2.rorateAroundBlock(pos.down(2), [4.166666666666661, 180 + 60]);
            Commands.call("particle lava " ~ pos.x ~ " " ~ pos.y ~ " " ~ pos.z ~ " 0 0 0 1 10", player, world, false, true);
        })
        .sleep(1).then(function(world, context) {
            shog1.rorateAroundBlock(pos.down(2), [4.124999999999994, 63]);
            shog2.rorateAroundBlock(pos.down(2), [4.124999999999994, 180 + 63]);
            Commands.call("particle lava " ~ pos.x ~ " " ~ pos.y ~ " " ~ pos.z ~ " 0 0 0 1 10", player, world, false, true);
        })
        .sleep(1).then(function(world, context) {
            shog1.rorateAroundBlock(pos.down(2), [4.083333333333327, 66]);
            shog2.rorateAroundBlock(pos.down(2), [4.083333333333327, 180 + 66]);
            Commands.call("particle lava " ~ pos.x ~ " " ~ pos.y ~ " " ~ pos.z ~ " 0 0 0 1 10", player, world, false, true);
        })
        .sleep(1).then(function(world, context) {
            shog1.rorateAroundBlock(pos.down(2), [4.04166666666666, 69]);
            shog2.rorateAroundBlock(pos.down(2), [4.04166666666666, 180 + 69]);
            Commands.call("particle lava " ~ pos.x ~ " " ~ pos.y ~ " " ~ pos.z ~ " 0 0 0 1 10", player, world, false, true);
        })
        .sleep(1).then(function(world, context) {
            shog1.rorateAroundBlock(pos.down(2), [3.9999999999999933, 72]);
            shog2.rorateAroundBlock(pos.down(2), [3.9999999999999933, 180 + 72]);
            Commands.call("particle lava " ~ pos.x ~ " " ~ pos.y ~ " " ~ pos.z ~ " 0 0 0 1 10", player, world, false, true);
        })
        .sleep(1).then(function(world, context) {
            shog1.rorateAroundBlock(pos.down(2), [3.958333333333327, 75]);
            shog2.rorateAroundBlock(pos.down(2), [3.958333333333327, 180 + 75]);
            Commands.call("particle lava " ~ pos.x ~ " " ~ pos.y ~ " " ~ pos.z ~ " 0 0 0 1 10", player, world, false, true);
        })
        .sleep(1).then(function(world, context) {
            shog1.rorateAroundBlock(pos.down(2), [3.9166666666666603, 78]);
            shog2.rorateAroundBlock(pos.down(2), [3.9166666666666603, 180 + 78]);
            Commands.call("particle lava " ~ pos.x ~ " " ~ pos.y ~ " " ~ pos.z ~ " 0 0 0 1 10", player, world, false, true);
        })
        .sleep(1).then(function(world, context) {
            shog1.rorateAroundBlock(pos.down(2), [3.874999999999994, 81]);
            shog2.rorateAroundBlock(pos.down(2), [3.874999999999994, 180 + 81]);
            Commands.call("particle lava " ~ pos.x ~ " " ~ pos.y ~ " " ~ pos.z ~ " 0 0 0 1 10", player, world, false, true);
        })
        .sleep(1).then(function(world, context) {
            shog1.rorateAroundBlock(pos.down(2), [3.8333333333333273, 84]);
            shog2.rorateAroundBlock(pos.down(2), [3.8333333333333273, 180 + 84]);
            Commands.call("particle lava " ~ pos.x ~ " " ~ pos.y ~ " " ~ pos.z ~ " 0 0 0 1 10", player, world, false, true);
        })
        .sleep(1).then(function(world, context) {
            shog1.rorateAroundBlock(pos.down(2), [3.7916666666666607, 87]);
            shog2.rorateAroundBlock(pos.down(2), [3.7916666666666607, 180 + 87]);
            Commands.call("particle lava " ~ pos.x ~ " " ~ pos.y ~ " " ~ pos.z ~ " 0 0 0 1 10", player, world, false, true);
        })
        .sleep(1).then(function(world, context) {
            shog1.rorateAroundBlock(pos.down(2), [3.7499999999999942, 90]);
            shog2.rorateAroundBlock(pos.down(2), [3.7499999999999942, 180 + 90]);
            Commands.call("particle lava " ~ pos.x ~ " " ~ pos.y ~ " " ~ pos.z ~ " 0 0 0 1 10", player, world, false, true);
        })
        .sleep(1).then(function(world, context) {
            shog1.rorateAroundBlock(pos.down(2), [3.7083333333333277, 93]);
            shog2.rorateAroundBlock(pos.down(2), [3.7083333333333277, 180 + 93]);
            Commands.call("particle lava " ~ pos.x ~ " " ~ pos.y ~ " " ~ pos.z ~ " 0 0 0 1 10", player, world, false, true);
        })
        .sleep(1).then(function(world, context) {
            shog1.rorateAroundBlock(pos.down(2), [3.666666666666661, 96]);
            shog2.rorateAroundBlock(pos.down(2), [3.666666666666661, 180 + 96]);
            Commands.call("particle lava " ~ pos.x ~ " " ~ pos.y ~ " " ~ pos.z ~ " 0 0 0 1 10", player, world, false, true);
        })
        .sleep(1).then(function(world, context) {
            shog1.rorateAroundBlock(pos.down(2), [3.6249999999999947, 99]);
            shog2.rorateAroundBlock(pos.down(2), [3.6249999999999947, 180 + 99]);
            Commands.call("particle lava " ~ pos.x ~ " " ~ pos.y ~ " " ~ pos.z ~ " 0 0 0 1 10", player, world, false, true);
        })
        .sleep(1).then(function(world, context) {
            shog1.rorateAroundBlock(pos.down(2), [3.583333333333328, 102]);
            shog2.rorateAroundBlock(pos.down(2), [3.583333333333328, 180 + 102]);
            Commands.call("particle lava " ~ pos.x ~ " " ~ pos.y ~ " " ~ pos.z ~ " 0 0 0 1 10", player, world, false, true);
        })
        .sleep(1).then(function(world, context) {
            shog1.rorateAroundBlock(pos.down(2), [3.5416666666666616, 105]);
            shog2.rorateAroundBlock(pos.down(2), [3.5416666666666616, 180 + 105]);
            Commands.call("particle lava " ~ pos.x ~ " " ~ pos.y ~ " " ~ pos.z ~ " 0 0 0 1 10", player, world, false, true);
        })
        .sleep(1).then(function(world, context) {
            shog1.rorateAroundBlock(pos.down(2), [3.499999999999995, 108]);
            shog2.rorateAroundBlock(pos.down(2), [3.499999999999995, 180 + 108]);
            Commands.call("particle lava " ~ pos.x ~ " " ~ pos.y ~ " " ~ pos.z ~ " 0 0 0 1 10", player, world, false, true);
        })
        .sleep(1).then(function(world, context) {
            shog1.rorateAroundBlock(pos.down(2), [3.4583333333333286, 111]);
            shog2.rorateAroundBlock(pos.down(2), [3.4583333333333286, 180 + 111]);
            Commands.call("particle lava " ~ pos.x ~ " " ~ pos.y ~ " " ~ pos.z ~ " 0 0 0 1 10", player, world, false, true);
        })
        .sleep(1).then(function(world, context) {
            shog1.rorateAroundBlock(pos.down(2), [3.416666666666662, 114]);
            shog2.rorateAroundBlock(pos.down(2), [3.416666666666662, 180 + 114]);
            Commands.call("particle lava " ~ pos.x ~ " " ~ pos.y ~ " " ~ pos.z ~ " 0 0 0 1 10", player, world, false, true);
        })
        .sleep(1).then(function(world, context) {
            shog1.rorateAroundBlock(pos.down(2), [3.3749999999999956, 117]);
            shog2.rorateAroundBlock(pos.down(2), [3.3749999999999956, 180 + 117]);
            Commands.call("particle lava " ~ pos.x ~ " " ~ pos.y ~ " " ~ pos.z ~ " 0 0 0 1 10", player, world, false, true);
        })
        .sleep(1).then(function(world, context) {
            shog1.rorateAroundBlock(pos.down(2), [3.333333333333329, 120]);
            shog2.rorateAroundBlock(pos.down(2), [3.333333333333329, 180 + 120]);
            Commands.call("particle lava " ~ pos.x ~ " " ~ pos.y ~ " " ~ pos.z ~ " 0 0 0 1 10", player, world, false, true);
        })
        .sleep(1).then(function(world, context) {
            shog1.rorateAroundBlock(pos.down(2), [3.2916666666666625, 123]);
            shog2.rorateAroundBlock(pos.down(2), [3.2916666666666625, 180 + 123]);
            Commands.call("particle lava " ~ pos.x ~ " " ~ pos.y ~ " " ~ pos.z ~ " 0 0 0 1 10", player, world, false, true);
        })
        .sleep(1).then(function(world, context) {
            shog1.rorateAroundBlock(pos.down(2), [3.249999999999996, 126]);
            shog2.rorateAroundBlock(pos.down(2), [3.249999999999996, 180 + 126]);
            Commands.call("particle lava " ~ pos.x ~ " " ~ pos.y ~ " " ~ pos.z ~ " 0 0 0 1 10", player, world, false, true);
        })
        .sleep(1).then(function(world, context) {
            shog1.rorateAroundBlock(pos.down(2), [3.2083333333333295, 129]);
            shog2.rorateAroundBlock(pos.down(2), [3.2083333333333295, 180 + 129]);
            Commands.call("particle lava " ~ pos.x ~ " " ~ pos.y ~ " " ~ pos.z ~ " 0 0 0 1 10", player, world, false, true);
        })
        .sleep(1).then(function(world, context) {
            shog1.rorateAroundBlock(pos.down(2), [3.166666666666663, 132]);
            shog2.rorateAroundBlock(pos.down(2), [3.166666666666663, 180 + 132]);
            Commands.call("particle lava " ~ pos.x ~ " " ~ pos.y ~ " " ~ pos.z ~ " 0 0 0 1 10", player, world, false, true);
        })
        .sleep(1).then(function(world, context) {
            shog1.rorateAroundBlock(pos.down(2), [3.1249999999999964, 135]);
            shog2.rorateAroundBlock(pos.down(2), [3.1249999999999964, 180 + 135]);
            Commands.call("particle lava " ~ pos.x ~ " " ~ pos.y ~ " " ~ pos.z ~ " 0 0 0 1 10", player, world, false, true);
        })
        .sleep(1).then(function(world, context) {
            shog1.rorateAroundBlock(pos.down(2), [3.08333333333333, 138]);
            shog2.rorateAroundBlock(pos.down(2), [3.08333333333333, 180 + 138]);
            Commands.call("particle lava " ~ pos.x ~ " " ~ pos.y ~ " " ~ pos.z ~ " 0 0 0 1 10", player, world, false, true);
        })
        .sleep(1).then(function(world, context) {
            shog1.rorateAroundBlock(pos.down(2), [3.0416666666666634, 141]);
            shog2.rorateAroundBlock(pos.down(2), [3.0416666666666634, 180 + 141]);
            Commands.call("particle lava " ~ pos.x ~ " " ~ pos.y ~ " " ~ pos.z ~ " 0 0 0 1 10", player, world, false, true);
        })
        .sleep(1).then(function(world, context) {
            shog1.rorateAroundBlock(pos.down(2), [2.999999999999997, 144]);
            shog2.rorateAroundBlock(pos.down(2), [2.999999999999997, 180 + 144]);
            Commands.call("particle lava " ~ pos.x ~ " " ~ pos.y ~ " " ~ pos.z ~ " 0 0 0 1 10", player, world, false, true);
        })
        .sleep(1).then(function(world, context) {
            shog1.rorateAroundBlock(pos.down(2), [2.9583333333333304, 147]);
            shog2.rorateAroundBlock(pos.down(2), [2.9583333333333304, 180 + 147]);
            Commands.call("particle lava " ~ pos.x ~ " " ~ pos.y ~ " " ~ pos.z ~ " 0 0 0 1 10", player, world, false, true);
        })
        .sleep(1).then(function(world, context) {
            shog1.rorateAroundBlock(pos.down(2), [2.916666666666664, 150]);
            shog2.rorateAroundBlock(pos.down(2), [2.916666666666664, 180 + 150]);
            Commands.call("particle lava " ~ pos.x ~ " " ~ pos.y ~ " " ~ pos.z ~ " 0 0 0 1 10", player, world, false, true);
        })
        .sleep(1).then(function(world, context) {
            shog1.rorateAroundBlock(pos.down(2), [2.8749999999999973, 153]);
            shog2.rorateAroundBlock(pos.down(2), [2.8749999999999973, 180 + 153]);
            Commands.call("particle lava " ~ pos.x ~ " " ~ pos.y ~ " " ~ pos.z ~ " 0 0 0 1 10", player, world, false, true);
        })
        .sleep(1).then(function(world, context) {
            shog1.rorateAroundBlock(pos.down(2), [2.833333333333331, 156]);
            shog2.rorateAroundBlock(pos.down(2), [2.833333333333331, 180 + 156]);
            Commands.call("particle lava " ~ pos.x ~ " " ~ pos.y ~ " " ~ pos.z ~ " 0 0 0 1 10", player, world, false, true);
        })
        .sleep(1).then(function(world, context) {
            shog1.rorateAroundBlock(pos.down(2), [2.7916666666666643, 159]);
            shog2.rorateAroundBlock(pos.down(2), [2.7916666666666643, 180 + 159]);
            Commands.call("particle lava " ~ pos.x ~ " " ~ pos.y ~ " " ~ pos.z ~ " 0 0 0 1 10", player, world, false, true);
        })
        .sleep(1).then(function(world, context) {
            shog1.rorateAroundBlock(pos.down(2), [2.749999999999998, 162]);
            shog2.rorateAroundBlock(pos.down(2), [2.749999999999998, 180 + 162]);
            Commands.call("particle lava " ~ pos.x ~ " " ~ pos.y ~ " " ~ pos.z ~ " 0 0 0 1 10", player, world, false, true);
        })
        .sleep(1).then(function(world, context) {
            shog1.rorateAroundBlock(pos.down(2), [2.7083333333333313, 165]);
            shog2.rorateAroundBlock(pos.down(2), [2.7083333333333313, 180 + 165]);
            Commands.call("particle lava " ~ pos.x ~ " " ~ pos.y ~ " " ~ pos.z ~ " 0 0 0 1 10", player, world, false, true);
        })
        .sleep(1).then(function(world, context) {
            shog1.rorateAroundBlock(pos.down(2), [2.6666666666666647, 168]);
            shog2.rorateAroundBlock(pos.down(2), [2.6666666666666647, 180 + 168]);
            Commands.call("particle lava " ~ pos.x ~ " " ~ pos.y ~ " " ~ pos.z ~ " 0 0 0 1 10", player, world, false, true);
        })
        .sleep(1).then(function(world, context) {
            shog1.rorateAroundBlock(pos.down(2), [2.6249999999999982, 171]);
            shog2.rorateAroundBlock(pos.down(2), [2.6249999999999982, 180 + 171]);
            Commands.call("particle lava " ~ pos.x ~ " " ~ pos.y ~ " " ~ pos.z ~ " 0 0 0 1 10", player, world, false, true);
        })
        .sleep(1).then(function(world, context) {
            shog1.rorateAroundBlock(pos.down(2), [2.5833333333333317, 174]);
            shog2.rorateAroundBlock(pos.down(2), [2.5833333333333317, 180 + 174]);
            Commands.call("particle lava " ~ pos.x ~ " " ~ pos.y ~ " " ~ pos.z ~ " 0 0 0 1 10", player, world, false, true);
        })
        .sleep(1).then(function(world, context) {
            shog1.rorateAroundBlock(pos.down(2), [2.541666666666665, 177]);
            shog2.rorateAroundBlock(pos.down(2), [2.541666666666665, 180 + 177]);
            Commands.call("particle lava " ~ pos.x ~ " " ~ pos.y ~ " " ~ pos.z ~ " 0 0 0 1 10", player, world, false, true);
        })
        .sleep(1).then(function(world, context) {
            shog1.rorateAroundBlock(pos.down(2), [2.4999999999999987, 180]);
            shog2.rorateAroundBlock(pos.down(2), [2.4999999999999987, 180 + 180]);
            Commands.call("particle lava " ~ pos.x ~ " " ~ pos.y ~ " " ~ pos.z ~ " 0 0 0 1 10", player, world, false, true);
        })
        .sleep(1).then(function(world, context) {
            shog1.rorateAroundBlock(pos.down(2), [2.458333333333332, 183]);
            shog2.rorateAroundBlock(pos.down(2), [2.458333333333332, 180 + 183]);
            Commands.call("particle lava " ~ pos.x ~ " " ~ pos.y ~ " " ~ pos.z ~ " 0 0 0 1 10", player, world, false, true);
        })
        .sleep(1).then(function(world, context) {
            shog1.rorateAroundBlock(pos.down(2), [2.4166666666666656, 186]);
            shog2.rorateAroundBlock(pos.down(2), [2.4166666666666656, 180 + 186]);
            Commands.call("particle lava " ~ pos.x ~ " " ~ pos.y ~ " " ~ pos.z ~ " 0 0 0 1 10", player, world, false, true);
        })
        .sleep(1).then(function(world, context) {
            shog1.rorateAroundBlock(pos.down(2), [2.374999999999999, 189]);
            shog2.rorateAroundBlock(pos.down(2), [2.374999999999999, 180 + 189]);
            Commands.call("particle lava " ~ pos.x ~ " " ~ pos.y ~ " " ~ pos.z ~ " 0 0 0 1 10", player, world, false, true);
        })
        .sleep(1).then(function(world, context) {
            shog1.rorateAroundBlock(pos.down(2), [2.3333333333333326, 192]);
            shog2.rorateAroundBlock(pos.down(2), [2.3333333333333326, 180 + 192]);
            Commands.call("particle lava " ~ pos.x ~ " " ~ pos.y ~ " " ~ pos.z ~ " 0 0 0 1 10", player, world, false, true);
        })
        .sleep(1).then(function(world, context) {
            shog1.rorateAroundBlock(pos.down(2), [2.291666666666666, 195]);
            shog2.rorateAroundBlock(pos.down(2), [2.291666666666666, 180 + 195]);
            Commands.call("particle lava " ~ pos.x ~ " " ~ pos.y ~ " " ~ pos.z ~ " 0 0 0 1 10", player, world, false, true);
        })
        .sleep(1).then(function(world, context) {
            shog1.rorateAroundBlock(pos.down(2), [2.2499999999999996, 198]);
            shog2.rorateAroundBlock(pos.down(2), [2.2499999999999996, 180 + 198]);
            Commands.call("particle lava " ~ pos.x ~ " " ~ pos.y ~ " " ~ pos.z ~ " 0 0 0 1 10", player, world, false, true);
        })
        .sleep(1).then(function(world, context) {
            shog1.rorateAroundBlock(pos.down(2), [2.208333333333333, 201]);
            shog2.rorateAroundBlock(pos.down(2), [2.208333333333333, 180 + 201]);
            Commands.call("particle lava " ~ pos.x ~ " " ~ pos.y ~ " " ~ pos.z ~ " 0 0 0 1 10", player, world, false, true);
        })
        .sleep(1).then(function(world, context) {
            shog1.rorateAroundBlock(pos.down(2), [2.1666666666666665, 204]);
            shog2.rorateAroundBlock(pos.down(2), [2.1666666666666665, 180 + 204]);
            Commands.call("particle lava " ~ pos.x ~ " " ~ pos.y ~ " " ~ pos.z ~ " 0 0 0 1 10", player, world, false, true);
        })
        .sleep(1).then(function(world, context) {
            shog1.rorateAroundBlock(pos.down(2), [2.125, 207]);
            shog2.rorateAroundBlock(pos.down(2), [2.125, 180 + 207]);
            Commands.call("particle lava " ~ pos.x ~ " " ~ pos.y ~ " " ~ pos.z ~ " 0 0 0 1 10", player, world, false, true);
        })
        .sleep(1).then(function(world, context) {
            shog1.rorateAroundBlock(pos.down(2), [2.0833333333333335, 210]);
            shog2.rorateAroundBlock(pos.down(2), [2.0833333333333335, 180 + 210]);
            Commands.call("particle lava " ~ pos.x ~ " " ~ pos.y ~ " " ~ pos.z ~ " 0 0 0 1 10", player, world, false, true);
        })
        .sleep(1).then(function(world, context) {
            shog1.rorateAroundBlock(pos.down(2), [2.041666666666667, 213]);
            shog2.rorateAroundBlock(pos.down(2), [2.041666666666667, 180 + 213]);
            Commands.call("particle lava " ~ pos.x ~ " " ~ pos.y ~ " " ~ pos.z ~ " 0 0 0 1 10", player, world, false, true);
        })
        .sleep(1).then(function(world, context) {
            shog1.rorateAroundBlock(pos.down(2), [2.0000000000000004, 216]);
            shog2.rorateAroundBlock(pos.down(2), [2.0000000000000004, 180 + 216]);
            Commands.call("particle lava " ~ pos.x ~ " " ~ pos.y ~ " " ~ pos.z ~ " 0 0 0 1 10", player, world, false, true);
        })
        .sleep(1).then(function(world, context) {
            shog1.rorateAroundBlock(pos.down(2), [1.9583333333333337, 219]);
            shog2.rorateAroundBlock(pos.down(2), [1.9583333333333337, 180 + 219]);
            Commands.call("particle lava " ~ pos.x ~ " " ~ pos.y ~ " " ~ pos.z ~ " 0 0 0 1 10", player, world, false, true);
        })
        .sleep(1).then(function(world, context) {
            shog1.rorateAroundBlock(pos.down(2), [1.916666666666667, 222]);
            shog2.rorateAroundBlock(pos.down(2), [1.916666666666667, 180 + 222]);
            Commands.call("particle lava " ~ pos.x ~ " " ~ pos.y ~ " " ~ pos.z ~ " 0 0 0 1 10", player, world, false, true);
        })
        .sleep(1).then(function(world, context) {
            shog1.rorateAroundBlock(pos.down(2), [1.8750000000000002, 225]);
            shog2.rorateAroundBlock(pos.down(2), [1.8750000000000002, 180 + 225]);
            Commands.call("particle lava " ~ pos.x ~ " " ~ pos.y ~ " " ~ pos.z ~ " 0 0 0 1 10", player, world, false, true);
        })
        .sleep(1).then(function(world, context) {
            shog1.rorateAroundBlock(pos.down(2), [1.8333333333333335, 228]);
            shog2.rorateAroundBlock(pos.down(2), [1.8333333333333335, 180 + 228]);
            Commands.call("particle lava " ~ pos.x ~ " " ~ pos.y ~ " " ~ pos.z ~ " 0 0 0 1 10", player, world, false, true);
        })
        .sleep(1).then(function(world, context) {
            shog1.rorateAroundBlock(pos.down(2), [1.7916666666666667, 231]);
            shog2.rorateAroundBlock(pos.down(2), [1.7916666666666667, 180 + 231]);
            Commands.call("particle lava " ~ pos.x ~ " " ~ pos.y ~ " " ~ pos.z ~ " 0 0 0 1 10", player, world, false, true);
        })
        .sleep(1).then(function(world, context) {
            shog1.rorateAroundBlock(pos.down(2), [1.75, 234]);
            shog2.rorateAroundBlock(pos.down(2), [1.75, 180 + 234]);
            Commands.call("particle lava " ~ pos.x ~ " " ~ pos.y ~ " " ~ pos.z ~ " 0 0 0 1 10", player, world, false, true);
        })
        .sleep(1).then(function(world, context) {
            shog1.rorateAroundBlock(pos.down(2), [1.7083333333333333, 237]);
            shog2.rorateAroundBlock(pos.down(2), [1.7083333333333333, 180 + 237]);
            Commands.call("particle lava " ~ pos.x ~ " " ~ pos.y ~ " " ~ pos.z ~ " 0 0 0 1 10", player, world, false, true);
        })
        .sleep(1).then(function(world, context) {
            shog1.rorateAroundBlock(pos.down(2), [1.6666666666666665, 240]);
            shog2.rorateAroundBlock(pos.down(2), [1.6666666666666665, 180 + 240]);
            Commands.call("particle lava " ~ pos.x ~ " " ~ pos.y ~ " " ~ pos.z ~ " 0 0 0 1 10", player, world, false, true);
        })
        .sleep(1).then(function(world, context) {
            shog1.rorateAroundBlock(pos.down(2), [1.6249999999999998, 243]);
            shog2.rorateAroundBlock(pos.down(2), [1.6249999999999998, 180 + 243]);
            Commands.call("particle lava " ~ pos.x ~ " " ~ pos.y ~ " " ~ pos.z ~ " 0 0 0 1 10", player, world, false, true);
        })
        .sleep(1).then(function(world, context) {
            shog1.rorateAroundBlock(pos.down(2), [1.583333333333333, 246]);
            shog2.rorateAroundBlock(pos.down(2), [1.583333333333333, 180 + 246]);
            Commands.call("particle lava " ~ pos.x ~ " " ~ pos.y ~ " " ~ pos.z ~ " 0 0 0 1 10", player, world, false, true);
        })
        .sleep(1).then(function(world, context) {
            shog1.rorateAroundBlock(pos.down(2), [1.5416666666666663, 249]);
            shog2.rorateAroundBlock(pos.down(2), [1.5416666666666663, 180 + 249]);
            Commands.call("particle lava " ~ pos.x ~ " " ~ pos.y ~ " " ~ pos.z ~ " 0 0 0 1 10", player, world, false, true);
        })
        .sleep(1).then(function(world, context) {
            shog1.rorateAroundBlock(pos.down(2), [1.4999999999999996, 252]);
            shog2.rorateAroundBlock(pos.down(2), [1.4999999999999996, 180 + 252]);
            Commands.call("particle lava " ~ pos.x ~ " " ~ pos.y ~ " " ~ pos.z ~ " 0 0 0 1 10", player, world, false, true);
        })
        .sleep(1).then(function(world, context) {
            shog1.rorateAroundBlock(pos.down(2), [1.4583333333333328, 255]);
            shog2.rorateAroundBlock(pos.down(2), [1.4583333333333328, 180 + 255]);
            Commands.call("particle lava " ~ pos.x ~ " " ~ pos.y ~ " " ~ pos.z ~ " 0 0 0 1 10", player, world, false, true);
        })
        .sleep(1).then(function(world, context) {
            shog1.rorateAroundBlock(pos.down(2), [1.416666666666666, 258]);
            shog2.rorateAroundBlock(pos.down(2), [1.416666666666666, 180 + 258]);
            Commands.call("particle lava " ~ pos.x ~ " " ~ pos.y ~ " " ~ pos.z ~ " 0 0 0 1 10", player, world, false, true);
        })
        .sleep(1).then(function(world, context) {
            shog1.rorateAroundBlock(pos.down(2), [1.3749999999999993, 261]);
            shog2.rorateAroundBlock(pos.down(2), [1.3749999999999993, 180 + 261]);
            Commands.call("particle lava " ~ pos.x ~ " " ~ pos.y ~ " " ~ pos.z ~ " 0 0 0 1 10", player, world, false, true);
        })
        .sleep(1).then(function(world, context) {
            shog1.rorateAroundBlock(pos.down(2), [1.3333333333333326, 264]);
            shog2.rorateAroundBlock(pos.down(2), [1.3333333333333326, 180 + 264]);
            Commands.call("particle lava " ~ pos.x ~ " " ~ pos.y ~ " " ~ pos.z ~ " 0 0 0 1 10", player, world, false, true);
        })
        .sleep(1).then(function(world, context) {
            shog1.rorateAroundBlock(pos.down(2), [1.2916666666666659, 267]);
            shog2.rorateAroundBlock(pos.down(2), [1.2916666666666659, 180 + 267]);
            Commands.call("particle lava " ~ pos.x ~ " " ~ pos.y ~ " " ~ pos.z ~ " 0 0 0 1 10", player, world, false, true);
        })
        .sleep(1).then(function(world, context) {
            shog1.rorateAroundBlock(pos.down(2), [1.2499999999999991, 270]);
            shog2.rorateAroundBlock(pos.down(2), [1.2499999999999991, 180 + 270]);
            Commands.call("particle lava " ~ pos.x ~ " " ~ pos.y ~ " " ~ pos.z ~ " 0 0 0 1 10", player, world, false, true);
        })
        .sleep(1).then(function(world, context) {
            shog1.rorateAroundBlock(pos.down(2), [1.2083333333333324, 273]);
            shog2.rorateAroundBlock(pos.down(2), [1.2083333333333324, 180 + 273]);
            Commands.call("particle lava " ~ pos.x ~ " " ~ pos.y ~ " " ~ pos.z ~ " 0 0 0 1 10", player, world, false, true);
        })
        .sleep(1).then(function(world, context) {
            shog1.rorateAroundBlock(pos.down(2), [1.1666666666666656, 276]);
            shog2.rorateAroundBlock(pos.down(2), [1.1666666666666656, 180 + 276]);
            Commands.call("particle lava " ~ pos.x ~ " " ~ pos.y ~ " " ~ pos.z ~ " 0 0 0 1 10", player, world, false, true);
        })
        .sleep(1).then(function(world, context) {
            shog1.rorateAroundBlock(pos.down(2), [1.124999999999999, 279]);
            shog2.rorateAroundBlock(pos.down(2), [1.124999999999999, 180 + 279]);
            Commands.call("particle lava " ~ pos.x ~ " " ~ pos.y ~ " " ~ pos.z ~ " 0 0 0 1 10", player, world, false, true);
        })
        .sleep(1).then(function(world, context) {
            shog1.rorateAroundBlock(pos.down(2), [1.0833333333333321, 282]);
            shog2.rorateAroundBlock(pos.down(2), [1.0833333333333321, 180 + 282]);
            Commands.call("particle lava " ~ pos.x ~ " " ~ pos.y ~ " " ~ pos.z ~ " 0 0 0 1 10", player, world, false, true);
        })
        .sleep(1).then(function(world, context) {
            shog1.rorateAroundBlock(pos.down(2), [1.0416666666666654, 285]);
            shog2.rorateAroundBlock(pos.down(2), [1.0416666666666654, 180 + 285]);
            Commands.call("particle lava " ~ pos.x ~ " " ~ pos.y ~ " " ~ pos.z ~ " 0 0 0 1 10", player, world, false, true);
        })
        .sleep(1).then(function(world, context) {
            shog1.rorateAroundBlock(pos.down(2), [0.9999999999999988, 288]);
            shog2.rorateAroundBlock(pos.down(2), [0.9999999999999988, 180 + 288]);
            Commands.call("particle lava " ~ pos.x ~ " " ~ pos.y ~ " " ~ pos.z ~ " 0 0 0 1 10", player, world, false, true);
        })
        .sleep(1).then(function(world, context) {
            shog1.rorateAroundBlock(pos.down(2), [0.9583333333333321, 291]);
            shog2.rorateAroundBlock(pos.down(2), [0.9583333333333321, 180 + 291]);
            Commands.call("particle lava " ~ pos.x ~ " " ~ pos.y ~ " " ~ pos.z ~ " 0 0 0 1 10", player, world, false, true);
        })
        .sleep(1).then(function(world, context) {
            shog1.rorateAroundBlock(pos.down(2), [0.9166666666666655, 294]);
            shog2.rorateAroundBlock(pos.down(2), [0.9166666666666655, 180 + 294]);
            Commands.call("particle lava " ~ pos.x ~ " " ~ pos.y ~ " " ~ pos.z ~ " 0 0 0 1 10", player, world, false, true);
        })
        .sleep(1).then(function(world, context) {
            shog1.rorateAroundBlock(pos.down(2), [0.8749999999999989, 297]);
            shog2.rorateAroundBlock(pos.down(2), [0.8749999999999989, 180 + 297]);
            Commands.call("particle lava " ~ pos.x ~ " " ~ pos.y ~ " " ~ pos.z ~ " 0 0 0 1 10", player, world, false, true);
        })
        .sleep(1).then(function(world, context) {
            shog1.rorateAroundBlock(pos.down(2), [0.8333333333333323, 300]);
            shog2.rorateAroundBlock(pos.down(2), [0.8333333333333323, 180 + 300]);
            Commands.call("particle lava " ~ pos.x ~ " " ~ pos.y ~ " " ~ pos.z ~ " 0 0 0 1 10", player, world, false, true);
        })
        .sleep(1).then(function(world, context) {
            shog1.rorateAroundBlock(pos.down(2), [0.7916666666666656, 303]);
            shog2.rorateAroundBlock(pos.down(2), [0.7916666666666656, 180 + 303]);
            Commands.call("particle lava " ~ pos.x ~ " " ~ pos.y ~ " " ~ pos.z ~ " 0 0 0 1 10", player, world, false, true);
        })
        .sleep(1).then(function(world, context) {
            shog1.rorateAroundBlock(pos.down(2), [0.749999999999999, 306]);
            shog2.rorateAroundBlock(pos.down(2), [0.749999999999999, 180 + 306]);
            Commands.call("particle lava " ~ pos.x ~ " " ~ pos.y ~ " " ~ pos.z ~ " 0 0 0 1 10", player, world, false, true);
        })
        .sleep(1).then(function(world, context) {
            shog1.rorateAroundBlock(pos.down(2), [0.7083333333333324, 309]);
            shog2.rorateAroundBlock(pos.down(2), [0.7083333333333324, 180 + 309]);
            Commands.call("particle lava " ~ pos.x ~ " " ~ pos.y ~ " " ~ pos.z ~ " 0 0 0 1 10", player, world, false, true);
        })
        .sleep(1).then(function(world, context) {
            shog1.rorateAroundBlock(pos.down(2), [0.6666666666666657, 312]);
            shog2.rorateAroundBlock(pos.down(2), [0.6666666666666657, 180 + 312]);
            Commands.call("particle lava " ~ pos.x ~ " " ~ pos.y ~ " " ~ pos.z ~ " 0 0 0 1 10", player, world, false, true);
        })
        .sleep(1).then(function(world, context) {
            shog1.rorateAroundBlock(pos.down(2), [0.6249999999999991, 315]);
            shog2.rorateAroundBlock(pos.down(2), [0.6249999999999991, 180 + 315]);
            Commands.call("particle lava " ~ pos.x ~ " " ~ pos.y ~ " " ~ pos.z ~ " 0 0 0 1 10", player, world, false, true);
        })
        .sleep(1).then(function(world, context) {
            shog1.rorateAroundBlock(pos.down(2), [0.5833333333333325, 318]);
            shog2.rorateAroundBlock(pos.down(2), [0.5833333333333325, 180 + 318]);
            Commands.call("particle lava " ~ pos.x ~ " " ~ pos.y ~ " " ~ pos.z ~ " 0 0 0 1 10", player, world, false, true);
        })
        .sleep(1).then(function(world, context) {
            shog1.rorateAroundBlock(pos.down(2), [0.5416666666666659, 321]);
            shog2.rorateAroundBlock(pos.down(2), [0.5416666666666659, 180 + 321]);
            Commands.call("particle lava " ~ pos.x ~ " " ~ pos.y ~ " " ~ pos.z ~ " 0 0 0 1 10", player, world, false, true);
        })
        .sleep(1).then(function(world, context) {
            shog1.rorateAroundBlock(pos.down(2), [0.49999999999999917, 324]);
            shog2.rorateAroundBlock(pos.down(2), [0.49999999999999917, 180 + 324]);
            Commands.call("particle lava " ~ pos.x ~ " " ~ pos.y ~ " " ~ pos.z ~ " 0 0 0 1 10", player, world, false, true);
        })
        .sleep(1).then(function(world, context) {
            shog1.rorateAroundBlock(pos.down(2), [0.4583333333333325, 327]);
            shog2.rorateAroundBlock(pos.down(2), [0.4583333333333325, 180 + 327]);
            Commands.call("particle lava " ~ pos.x ~ " " ~ pos.y ~ " " ~ pos.z ~ " 0 0 0 1 10", player, world, false, true);
        })
        .sleep(1).then(function(world, context) {
            shog1.rorateAroundBlock(pos.down(2), [0.4166666666666658, 330]);
            shog2.rorateAroundBlock(pos.down(2), [0.4166666666666658, 180 + 330]);
            Commands.call("particle lava " ~ pos.x ~ " " ~ pos.y ~ " " ~ pos.z ~ " 0 0 0 1 10", player, world, false, true);
        })
        .sleep(1).then(function(world, context) {
            shog1.rorateAroundBlock(pos.down(2), [0.3749999999999991, 333]);
            shog2.rorateAroundBlock(pos.down(2), [0.3749999999999991, 180 + 333]);
            Commands.call("particle lava " ~ pos.x ~ " " ~ pos.y ~ " " ~ pos.z ~ " 0 0 0 1 10", player, world, false, true);
        })
        .sleep(1).then(function(world, context) {
            shog1.rorateAroundBlock(pos.down(2), [0.3333333333333324, 336]);
            shog2.rorateAroundBlock(pos.down(2), [0.3333333333333324, 180 + 336]);
            Commands.call("particle lava " ~ pos.x ~ " " ~ pos.y ~ " " ~ pos.z ~ " 0 0 0 1 10", player, world, false, true);
        })
        .sleep(1).then(function(world, context) {
            shog1.rorateAroundBlock(pos.down(2), [0.29166666666666574, 339]);
            shog2.rorateAroundBlock(pos.down(2), [0.29166666666666574, 180 + 339]);
            Commands.call("particle lava " ~ pos.x ~ " " ~ pos.y ~ " " ~ pos.z ~ " 0 0 0 1 10", player, world, false, true);
        })
        .sleep(1).then(function(world, context) {
            shog1.rorateAroundBlock(pos.down(2), [0.24999999999999908, 342]);
            shog2.rorateAroundBlock(pos.down(2), [0.24999999999999908, 180 + 342]);
            Commands.call("particle lava " ~ pos.x ~ " " ~ pos.y ~ " " ~ pos.z ~ " 0 0 0 1 10", player, world, false, true);
        })
        .sleep(1).then(function(world, context) {
            shog1.rorateAroundBlock(pos.down(2), [0.20833333333333243, 345]);
            shog2.rorateAroundBlock(pos.down(2), [0.20833333333333243, 180 + 345]);
            Commands.call("particle lava " ~ pos.x ~ " " ~ pos.y ~ " " ~ pos.z ~ " 0 0 0 1 10", player, world, false, true);
        })
        .sleep(1).then(function(world, context) {
            shog1.rorateAroundBlock(pos.down(2), [0.16666666666666577, 348]);
            shog2.rorateAroundBlock(pos.down(2), [0.16666666666666577, 180 + 348]);
            Commands.call("particle lava " ~ pos.x ~ " " ~ pos.y ~ " " ~ pos.z ~ " 0 0 0 1 10", player, world, false, true);
        })
        .sleep(1).then(function(world, context) {
            shog1.rorateAroundBlock(pos.down(2), [0.12499999999999911, 351]);
            shog2.rorateAroundBlock(pos.down(2), [0.12499999999999911, 180 + 351]);
            Commands.call("particle lava " ~ pos.x ~ " " ~ pos.y ~ " " ~ pos.z ~ " 0 0 0 1 10", player, world, false, true);
        })
        .sleep(1).then(function(world, context) {
            shog1.rorateAroundBlock(pos.down(2), [0.08333333333333245, 354]);
            shog2.rorateAroundBlock(pos.down(2), [0.08333333333333245, 180 + 354]);
            Commands.call("particle lava " ~ pos.x ~ " " ~ pos.y ~ " " ~ pos.z ~ " 0 0 0 1 10", player, world, false, true);
        })
        .sleep(1).then(function(world, context) {
            shog1.rorateAroundBlock(pos.down(2), [0.04166666666666579, 357]);
            shog2.rorateAroundBlock(pos.down(2), [0.04166666666666579, 180 + 357]);
            Commands.call("particle lava " ~ pos.x ~ " " ~ pos.y ~ " " ~ pos.z ~ " 0 0 0 1 10", player, world, false, true);
        })
        .sleep(1).then(function(world, context) {
            world.removeEntity(shog1);
            world.removeEntity(shog2);
            world.performExplosion(player, pos.x, pos.y, pos.z, 10, false, false);
        })
        .sleep(10).then(function(world, context) {
            player.give(itemOutput);
        })
        .start();
}

events.onPlayerInteractBlock(function(event as PlayerInteractBlockEvent) {
    var player as IPlayer = event.player;
    var block as IBlock = event.block;
    var pos as IBlockPos = event.position;
    var world as IWorld = event.world;
    if (!isNull(event.item) && (!world.isRemote())) {
        var item as IItemStack = event.item;
        if (item.definition.id == "gct_aby:abyss_wand" && block.definition.id == "gct_aby:seek_brick" && world.getBlock(pos.x, pos.y - 1, pos.z).definition.id == "abyssalcraft:stone" && world.getBlock(pos.x, pos.y + 1, pos.z).definition.id == "abyssalcraft:stone" && world.getBlock(pos.x, pos.y - 2, pos.z).definition.id == "abyssalcraft:monolithpillar" && world.getBlock(pos.x, pos.y + 2, pos.z).definition.id == "abyssalcraft:monolithpillar" && world.getBlock(pos.x, pos.y - 1, pos.z).meta == 7 && world.getBlock(pos.x, pos.y + 1, pos.z).meta == 7) {
            var shog1 as IEntityLivingBase = player;
            var shog2 as IEntityLivingBase = player;
            var recipeString as string = "default";
            for entity in getEntityLivingBasesInCube(player, 5) {
                if (entity instanceof IEntityLiving) {
                    if (entity.definition.id == "ageofabyssalcraft:lessershoggothhelpful" && shog1 instanceof IPlayer) {
                        shog1 = entity;
                    } else if (entity.definition.id == "ageofabyssalcraft:lessershoggothhelpful" && shog2 instanceof IPlayer) {
                        shog2 = entity;
                        recipeString = "shoggoth";
                    }
                    if (entity.definition.id == "minecraft:zombie" && entity.isChild && shog1 instanceof IPlayer) {
                        shog1 = entity;
                    } else if (entity.definition.id == "minecraft:zombie" && entity.isChild && shog2 instanceof IPlayer) {
                        shog2 = entity;
                        recipeString = "zombie";
                    }
                }
            }
            var book1 as IItemStack = <minecraft:stone>;
            var book2 as IItemStack = <minecraft:stone>;
            for i in 1 to 10 {
                if (!isNull(player.getHotbarStack(i))) {
                    var book as IItemStack = player.getHotbarStack(i);
                    if (book.definition.id == "abyssalcraft:abyssalnomicon" && book1.definition.id == "minecraft:stone") {
                        book1 = book;
                    } else if (book.definition.id == "abyssalcraft:abyssalnomicon" && book2.definition.id == "minecraft:stone") {
                        book2 = book;
                    }
                }
            }
            if (book1.definition.id == "abyssalcraft:abyssalnomicon" && book2.definition.id == "abyssalcraft:abyssalnomicon" && shog1 instanceof IEntityLiving && shog2 instanceof IEntityLiving) {
                var pe1 as float = book1.tag.PotEnergy as float;
                var pe2 as float = book2.tag.PotEnergy as float;
                if (pe1 + pe2 >= 150000.0f) {
                    if (!player.creative) {
                        book1.mutable().updateTag({PotEnergy : 0.0f});
                        book2.mutable().updateTag({PotEnergy : pe2 - (150000.0f - pe1) as float});
                        player.sendChat("§e已从" ~ player.name ~ "身上抽取了150000位能！");
                    }
                    player.sendChat("§e已就位……");
                    world.setBlockState(<blockstate:minecraft:air>, pos);
                    world.setBlockState(<blockstate:minecraft:air>, pos.up(1));
                    world.setBlockState(<blockstate:minecraft:air>, pos.up(2));
                    world.setBlockState(<blockstate:minecraft:air>, pos.down(1));
                    world.setBlockState(<blockstate:minecraft:air>, pos.down(2));
                    if (recipeString == "shoggoth") {
                        addMobFusion(shog1, shog2, <entity:gct_aby:mixture_shoggoth>, pos, player);
                    } else if (recipeString == "zombie") {
                        addMobFusionToItem(shog1, shog2, <gct_aby:muddy_flesh>, pos, player);
                    }
                }
            }
        }
    }
});

