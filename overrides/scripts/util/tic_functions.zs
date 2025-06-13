#priority 32000


import crafttweaker.item.IItemStack;
import crafttweaker.item.IMutableItemStack;
import crafttweaker.player.IPlayer;
import crafttweaker.entity.IEntity;
import crafttweaker.entity.IEntityLivingBase;
import crafttweaker.util.Position3f;

$expand IItemStack$getTicTraits() as string[] {
    return TicTraitLib.getTicTrait(this);
}
$expand IItemStack$getSpecialTraitColor(traitid as string) as int {
    return TicTraitLib.getTraitColor(this, traitid);
}
$expand IItemStack$getSpecialTraitLevel(traitid as string) as int {
    return TicTraitLib.getTraitLevel(this, traitid);
}
$expand IItemStack$addTicTrait(traitid as string, color as int, level as int) as IItemStack {
    return TicTraitLib.addTicTraitAsItem(this, traitid, color, level);
}
$expand IItemStack$removeTicTrait(traitid as string, color as int, level as int) as IItemStack {
    return TicTraitLib.removeTicTraitAsItem(this, traitid, color, level);
}
$expand IMutableItemStack$addTicTrait(traitid as string, color as int, level as int) as void {
    TicTraitLib.addTicTrait(this, traitid, color, level);
}
$expand IMutableItemStack$removeTicTrait(traitid as string, color as int, level as int) as void {
    TicTraitLib.removeTicTrait(this, traitid, color, level);
}
$expand IPlayer$getTicArmorTrait(type as int) as string[] {
    if (type == 0) {
        return TicTraitLib.getPlayerTicArmorTrait(this);
    } else if (type == 1) {
        return TicTraitLib.getPlayerTicHelmetTrait(this);
    } else if (type == 2) {
        return TicTraitLib.getPlayerTicChestplateTrait(this);
    } else if (type == 3) {
        return TicTraitLib.getPlayerTicLeggingsTrait(this);
    } else if (type == 4) {
        return TicTraitLib.getPlayerTicBootsTrait(this);
    } else {
        return [];
    }
}
$expand IItemStack$getTicMaterial() as string[] {
    return TicLib.getTicMaterial(this);
}
$expand IMutableItemStack$setTicBroken(isBroken as bool) as void {
    TicLib.setTicBroken(this, isBroken);
}
$expand IMutableItemStack$addTicMiningSpeed(level as float, uuid as string) as void {
    TicLib.addTicMiningSpeed(this, level, uuid);
}
$expand IMutableItemStack$addTicAttack(level as float, uuid as string) as void {
    TicLib.addTicAttack(this, level, uuid);
}
$expand IMutableItemStack$addTicFreeModifiers(level as int, uuid as string) as void {
    TicLib.addTicFreeModifiers(this, level, uuid);
}
$expand IMutableItemStack$addTicHarvestLevel(level as int, uuid as string) as void {
    TicLib.addTicHarvestLevel(this, level, uuid);
}
$expand IMutableItemStack$addTicToughness(level as float, uuid as string) as void {
    TicLib.addTicToughness(this, level, uuid);
}
$expand IMutableItemStack$addTicDefense(level as float, uuid as string) as void {
    TicLib.addTicDefense(this, level, uuid);
}
$expand IItemStack$hasTicTrait(traitid as string) as bool {
    return TicTraitLib.hasTicTrait(this, traitid);
}
$expand IItemStack$isTicTool() as bool {
    return TicLib.isTicTool(this);
}
$expand IItemStack$isTicArmor() as bool {
    return TicLib.isTicArmor(this);
}
$expand IItemStack$getTicArmorType() as string {
    return TicLib.getTicArmorType(this);
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