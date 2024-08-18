#priority 32767
#reloadable

import crafttweaker.item.IItemStack;
import crafttweaker.item.IMutableItemStack;
import crafttweaker.player.IPlayer;
import crafttweaker.entity.IEntity;
import crafttweaker.entity.IEntityLivingBase;
import crafttweaker.util.Position3f;

import mods.ctutils.utils.Math;

global getTrueYaw as function(IEntity)double = function(entity as IEntity) as double {
    return (360.0d - entity.rotationYaw % 360.0d) % 360.0d;
};

global distance2D as function(double, double, double, double)double = function(x1 as double, z1 as double, x2 as double = 0.0d, z2 as double = 0.0d) as double {
    return Math.sqrt(pow(x1 - x2, 2.0d) + pow(z1 - z2, 2.0d));
};

global polarize as function(double, double, double, double)double[] = function(x1 as double, z1 as double, x2 as double = 0.0d, z2 as double = 0.0d) as double[] {
    var r as double = distance2D(x1, z1, x2, z2);
    var dx as double = x1 - x2;
    var dz as double = z1 - z2;
    var theta as double = 0.0d;
    if (dz > 0 && dx > 0) {
        theta = Math.atan(dx / dz) * (180.0d / 3.1415926d);
    } else if (dz < 0 && dx >= 0) {
        theta = Math.atan(dx / dz) * (180.0d / 3.1415926d) + 180.0d;
    } else if (dz < 0 && dx < 0) {
        theta = Math.atan(dx / dz) * (180.0d / 3.1415926d) + 180.0d;
    } else if (dz > 0 && dx < 0) {
        theta = Math.atan(dx / dz) * (180.0d / 3.1415926d) + 360.0d;
    } else if (dx == 0) {
        if (dz >= 0) {
            theta = 0.0d;
        } else if (dz < 0) {
            theta = 180.0d;
        }
    } else if (dz == 0) {
        if (dx > 0) {
            theta = 90.0d;
        } else if (dz < 0) {
            theta = 270.0d;
        }
    }
    return [r, theta];
};

global getEntityLivingBasesInCube as function(IEntity, double)IEntityLivingBase[] = function(entity as IEntity, range as double) as IEntityLivingBase[] {
    var r as double = range as double;
    var Xt = entity.getX() as double;
    var Yt = entity.getY() as double;
    var Zt = entity.getZ() as double;
    var areaStart as Position3f = Position3f.create((Xt + r), (Yt + r), (Zt + r));
    var areaEnd as Position3f = Position3f.create((Xt - r + 1.0d), (Yt - r + 1.0d), (Zt - r + 1.0d));
    var entityLivingBaseArr as IEntityLivingBase[] = [];
    var entityNearArr as IEntity[] = entity.world.getEntitiesInArea(areaStart, areaEnd);
    for ent in entity.world.getEntitiesInArea(areaStart, areaEnd) {
        if (ent instanceof IEntityLivingBase){
            var entityLivingBase as IEntityLivingBase = ent;
            entityLivingBaseArr += entityLivingBase;
        }
    }
    return entityLivingBaseArr;
};

global getEntityLivingBaseInSector as function(IEntity, double, double)IEntityLivingBase[] = function(entity as IEntity, range as double, angle as double) as IEntityLivingBase[] {
    var r as double = range as double;
    var Xt = entity.getX() as double;
    var Yt = entity.getY() as double;
    var Zt = entity.getZ() as double;
    var areaStart as Position3f = Position3f.create((Xt + r), Yt, (Zt + r));
    var areaEnd as Position3f = Position3f.create((Xt - r + 1.0d), (Yt + 2.0d), (Zt - r + 1.0d));
    var entityLivingBaseArr as IEntityLivingBase[] = [];
    for ent in entity.world.getEntitiesInArea(areaStart, areaEnd) {
        if (distance2D(ent.x, ent.z, Xt, Zt) <= r && ent instanceof IEntityLivingBase) {
            var Yaw as double = entity.rotationYaw as double;
            var Polar as double = polarize(ent.x, ent.z, Xt, Zt)[1] as double;
            if ((Math.abs(getTrueYaw(entity) - Polar) <= (angle / 2.0d)) || (360.0d - Math.max(getTrueYaw(entity), Polar)) + Math.min(getTrueYaw(entity), Polar) <= angle) {
                var entityLivingBase as IEntityLivingBase = ent;
                entityLivingBaseArr += entityLivingBase;
            }
        }
    }
    return entityLivingBaseArr;
};