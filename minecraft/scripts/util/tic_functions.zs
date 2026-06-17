#priority 32000


import mods.ticlib.TicTool;
import crafttweaker.item.IItemStack;
import crafttweaker.item.IMutableItemStack;
import crafttweaker.player.IPlayer;
import crafttweaker.entity.IEntity;
import crafttweaker.entity.IEntityLivingBase;
import crafttweaker.util.Position3f;

$expand IItemStack$getTicTraits() as string[] {
    return this.getTicTrait();
}
$expand IItemStack$getSpecialTraitColor(traitid as string) as int {
    return this.getTraitColor(traitid);
}
$expand IItemStack$getSpecialTraitLevel(traitid as string) as int {
    return this.getTraitLevel(traitid);
}
$expand IPlayer$getTicArmorTrait(type as int) as string[] {
    if (type == 0) {
        return this.getPlayerTicArmorTrait();
    } else if (type == 1) {
        return this.getPlayerTicHelmetTrait();
    } else if (type == 2) {
        return this.getPlayerTicChestplateTrait();
    } else if (type == 3) {
        return this.getPlayerTicLeggingsTrait();
    } else if (type == 4) {
        return this.getPlayerTicBootsTrait();
    } else {
        return [];
    }
}

$expand IItemStack$getOverslime() as int {
    if (this.isTicTool() || this.isTicArmor()) {
        if (!isNull(this.tag."moretcon.overslime".remaining)) {
            return this.tag."moretcon.overslime".remaining as int;
        }
    } else {
        return 0;
    }
}

$expand IMutableItemStack$setOverslime(num as int) as void {
    if (this.hasTicTrait("moretcon.overslime")) {
        this.updateTag({"moretcon.overslime" : {remaining : num as int}});
    }
}

$expand IMutableItemStack$addOverslime(num as int) as void {
    this.setOverslime(this.getOverslime() + num);
}

$expand IMutableItemStack$removeOverslime(num as int) as void {
    if (num >= this.getOverslime()) {
        this.setOverslime(0);
    } else {
        this.setOverslime(this.getOverslime() - num);
    }
}
$expand IEntity$getEntityLivingBasesInCube(range as float) as IEntityLivingBase[] {
    var r as double = range as double;
    var Xt = this.getX() as double;
    var Yt = this.getY() as double;
    var Zt = this.getZ() as double;
    var areaStart as Position3f = Position3f.create( ( Xt + r ) , ( Yt + r ) , ( Zt + r ) );
    var areaEnd as Position3f = Position3f.create( ( Xt - r + 1.0d ) , ( Yt - r + 1.0d ) , ( Zt - r + 1.0d ) );
    var entityLivingBaseArr as IEntityLivingBase[] = [];
    var entityNearArr as IEntity[] = this.world.getEntitiesInArea( areaStart , areaEnd );
    for entity in this.world.getEntitiesInArea( areaStart , areaEnd ){
        if(entity instanceof IEntityLivingBase){
        var entityLivingBase as IEntityLivingBase = entity;
            entityLivingBaseArr += entityLivingBase;
        }
    }
    return entityLivingBaseArr;
}