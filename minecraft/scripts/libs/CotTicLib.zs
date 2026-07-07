#reloadable
#loader contenttweaker
#priority 32627
import mods.ticlib.TicTool;
import crafttweaker.item.IItemStack;
import crafttweaker.player.IPlayer;
import crafttweaker.data.IData;
import crafttweaker.entity.IEntityEquipmentSlot;
import mods.zenutils.StaticString;


static allticitem as IItemStack[] = [
    <item:tconstruct:bolt>,
    <item:tconstruct:broadsword>,
    <item:tconstruct:longsword>,
    <item:tconstruct:rapier>,
    <item:tconstruct:frypan>,
    <item:tconstruct:battlesign>,
    <item:tconstruct:cleaver>,
    <item:tconstruct:shortbow>,
    <item:tconstruct:longbow>,
    <item:tconstruct:crossbow>,
    <item:tconstruct:arrow>,
    <item:tconstruct:shuriken>,
    <item:tconstruct:hammer>,
    <item:tconstruct:excavator>,
    <item:tconstruct:lumberaxe>,
    <item:tconstruct:scythe>,
    <item:tconstruct:pickaxe>,
    <item:tconstruct:shovel>,
    <item:tconstruct:hatchet>,
    <item:tconstruct:mattock>,
    <item:tconstruct:kama>,
    <item:conarm:boots>,
    <item:conarm:leggings>,
    <item:conarm:chestplate>,
    <item:conarm:helmet>,
    <item:plustic:laser_gun>,
    <item:plustic:katana>,
    <item:tcongreedyaddon:battleaxe>,
    <item:tcongreedyaddon:greatblade>,
    <item:tcongreedyaddon:allinonetool>,
    <item:tconevo:tool_sceptre>,
    <item:moretcon:bomb>,
    <item:moretcon:ring>,
    <item:tcomplement:chisel>,
    <item:tt2:swift_shield>,
    <item:tt2:heavy_shield>,
    <item:tt2:nunchaku>,
    <item:tt2:doppelhander>,
    <item:tt2:maraca>,
    <item:tt2:scout_helmet>,
    <item:tt2:scout_chestplate>,
    <item:tt2:scout_leggings>,
    <item:tt2:scout_boots>
];

$expand IItemStack$isTicTool() as bool {
    if(TicTool.isTool(this)) return true;
    var pass as bool = false;
    var tictool as IItemStack[] = [
    <item:tconstruct:bolt>,
    <item:tconstruct:broadsword>,
    <item:tconstruct:longsword>,
    <item:tconstruct:rapier>,
    <item:tconstruct:frypan>,
    <item:tconstruct:battlesign>,
    <item:tconstruct:cleaver>,
    <item:tconstruct:shortbow>,
    <item:tconstruct:longbow>,
    <item:tconstruct:crossbow>,
    <item:tconstruct:arrow>,
    <item:tconstruct:shuriken>,
    <item:tconstruct:hammer>,
    <item:tconstruct:excavator>,
    <item:tconstruct:lumberaxe>,
    <item:tconstruct:scythe>,
    <item:tconstruct:pickaxe>,
    <item:tconstruct:shovel>,
    <item:tconstruct:hatchet>,
    <item:tconstruct:mattock>,
    <item:tconstruct:kama>,
    <item:plustic:laser_gun>,
    <item:plustic:katana>,
    <item:tcongreedyaddon:battleaxe>,
    <item:tcongreedyaddon:greatblade>,
    <item:tcongreedyaddon:allinonetool>,
    <item:tconevo:tool_sceptre>,
    <item:moretcon:bomb>,
    <item:moretcon:ring>,
    <item:tcomplement:chisel>,
    <item:tt2:swift_shield>,
    <item:tt2:heavy_shield>,
    <item:tt2:nunchaku>,
    <item:tt2:doppelhander>,
    <item:tt2:maraca>
];

    for i in tictool{
        if(!isNull(this)){
            if(i.definition.id == this.definition.id){
                pass = true;
                break;
            }
        }
    }

    return pass;
}

$expand IItemStack$isTicArmor() as bool {
    if(TicTool.isArmor(this)) return true;
    
    var pass as bool = false;
    var ticarmor as IItemStack[] = [
    <item:conarm:boots>,
    <item:conarm:leggings>,
    <item:conarm:chestplate>,
    <item:conarm:helmet>,
    <item:moretcon:ring>,
    <item:tt2:scout_helmet>,
    <item:tt2:scout_chestplate>,
    <item:tt2:scout_leggings>,
    <item:tt2:scout_boots>
];

    for i in ticarmor{
        if(!isNull(this)){
            if(i.definition.id == this.definition.id){
                pass = true;
                break;
            }
        }
    }

    return pass;
}


$expand IItemStack$getTicMaterial() as string[] {
    var Materials as string[] = [];
    var modMaterials as string[] = TicTool.getMaterials(this);
    if(modMaterials.length > 0) return modMaterials;
    var pass as bool = false;

    for i in allticitem{
        if(!isNull(this)){
            if(i.definition.id == this.definition.id){
                pass = true;
                break;
            }
        }
    }

    if(!pass) return Materials;
    if(isNull(this.tag.TinkerData.Materials)) return Materials;

    var data as IData = this.tag;
    var materials as string[] = data.TinkerData.Materials.asString().replace("[", "").replace("]", "").replace("\"", "").split(",");

    for material in materials {
        Materials += material.trim();
    }
    return Materials;
}


$expand IItemStack$setTicBroken(isBroken as bool) as bool {
    if(TicTool.setBroken(this, isBroken)) return true;
    
    var pass as bool = false;

    for i in allticitem{
        if(!isNull(this)){
            if(i.definition.id == this.definition.id){
                pass = true;
                break;
            }
        }
    }

    if(!pass) return false;

    var num as int = (isBroken ? 1 : 0);

    this.mutable().updateTag({Stats : {Broken : num as int}});

    return true;
}


$expand IItemStack$addTicMiningSpeed(level as float, uuid as string) as bool {
    if(TicTool.addStat(this, "MiningSpeed", level, uuid)) return true;
    
    var pass as bool = false;

    var item as IItemStack[] = [
        <item:tconstruct:hammer>,
        <item:tconstruct:excavator>,
        <item:tconstruct:lumberaxe>,
        <item:tconstruct:scythe>,
        <item:tconstruct:pickaxe>,
        <item:tconstruct:shovel>,
        <item:tconstruct:hatchet>,
        <item:tconstruct:mattock>,
        <item:tconstruct:kama>,
        <item:tcongreedyaddon:allinonetool>
    ];

    for i in item{
        if(!isNull(this)){
            if(i.definition.id == this.definition.id){
                pass = true;
                break;
            }
        }
    }

    if(!pass) return false;
    if(isNull(this.tag.Stats.MiningSpeed)) return false;

    var data as float = this.tag.Stats.MiningSpeed.asFloat();
    if(!this.hasTicuuid(uuid)){
        this.addTicuuid(uuid);
        this.mutable().updateTag({Stats : {MiningSpeed : (level + data) as float}, StatsOriginal : {MiningSpeed : (level + data) as float}});
    }
    return true;
}


$expand IItemStack$addTicAttack(level as float, uuid as string) as bool {
    if(TicTool.addStat(this, "Attack", level, uuid)) return true;
    
    var pass as bool = false;

    for i in allticitem{
        if(!isNull(this)){
            if(i.definition.id == this.definition.id){
                pass = true;
                break;
            }
        }
    }

    if(!pass) return false;
    if(isNull(this.tag.Stats.Attack)) return false;

    var data as float = this.tag.Stats.Attack.asFloat();
    if(!this.hasTicuuid(uuid)){
        this.addTicuuid(uuid);
        this.mutable().updateTag({Stats : {Attack : (level + data) as float}, StatsOriginal : {Attack : (level + data) as float}});
    }
    return true;
}


$expand IItemStack$addTicFreeModifiers(level as int, uuid as string) as bool {
    if(TicTool.addStat(this, "FreeModifiers", level, uuid)) return true;
    
    var pass as bool = false;


    for i in allticitem{
        if(!isNull(this)){
            if(i.definition.id == this.definition.id){
                pass = true;
                break;
            }
        }
    }

    if(!pass) return false;
    if(isNull(this.tag.Stats.FreeModifiers)) return false;

    var data as int = this.tag.Stats.FreeModifiers.asInt();
    if(!this.hasTicuuid(uuid)){
        this.addTicuuid(uuid);
        this.mutable().updateTag({Stats : {FreeModifiers : (level + data) as int}, StatsOriginal : {FreeModifiers : (level + data) as int}});
    }
    return true;
}


$expand IItemStack$addTicDefense(level as float, uuid as string) as bool {
    if(TicTool.addStat(this, "Defense", level, uuid)) return true;
    
    var pass as bool = false;


    for i in allticitem{
        if(!isNull(this)){
            if(i.definition.id == this.definition.id){
                pass = true;
                break;
            }
        }
    }

    if(!pass) return false;
    if(isNull(this.tag.Stats.Defense)) return false;

    var data as float = this.tag.Stats.Defense.asFloat();
    if(!this.hasTicuuid(uuid)){
        this.addTicuuid(uuid);
        if(this.definition.id == "conarm:helmet"){
            this.mutable().updateTag({Stats : {Defense : ((level / 0.16) + data) as float}, StatsOriginal : {Defense : ((level / 0.16) + data) as float}});
        }
        if(this.definition.id == "conarm:chestplate"){
            this.mutable().updateTag({Stats : {Defense : ((level / 0.4) + data) as float}, StatsOriginal : {Defense : ((level / 0.4) + data) as float}});
        }
        if(this.definition.id == "conarm:leggings"){
            this.mutable().updateTag({Stats : {Defense : ((level / 0.3) + data) as float}, StatsOriginal : {Defense : ((level / 0.3) + data) as float}});
        }
        if(this.definition.id == "conarm:boots"){
            this.mutable().updateTag({Stats : {Defense : ((level / 0.14) + data) as float}, StatsOriginal : {Defense : ((level / 0.14) + data) as float}});
        }
    }
    return true;
}


$expand IItemStack$addTicToughness(level as float, uuid as string) as bool {
    if(TicTool.addStat(this, "Toughness", level, uuid)) return true;
    
    var pass as bool = false;


    for i in allticitem{
        if(!isNull(this)){
            if(i.definition.id == this.definition.id){
                pass = true;
                break;
            }
        }
    }

    if(!pass) return false;
    if(isNull(this.tag.Stats.Toughness)) return false;

    var data as float = this.tag.Stats.Toughness.asFloat();
    if(!this.hasTicuuid(uuid)){
        this.addTicuuid(uuid);
        this.mutable().updateTag({Stats : {Toughness : (level + data) as float}, StatsOriginal : {Toughness : (level + data) as float}});
    }
    return true;
}


$expand IItemStack$addTicHarvestLevel(level as int, uuid as string) as bool {
    if(TicTool.addStat(this, "HarvestLevel", level, uuid)) return true;
    
    var pass as bool = false;

    var item as IItemStack[] = [
        <item:tconstruct:hammer>,
        <item:tconstruct:excavator>,
        <item:tconstruct:lumberaxe>,
        <item:tconstruct:scythe>,
        <item:tconstruct:pickaxe>,
        <item:tconstruct:shovel>,
        <item:tconstruct:hatchet>,
        <item:tconstruct:mattock>,
        <item:tconstruct:kama>,
        <item:tcongreedyaddon:allinonetool>
    ];

    for i in item{
        if(!isNull(this)){
            if(i.definition.id == this.definition.id){
                pass = true;
                break;
            }
        }
    }

    if(!pass) return false;
    if(isNull(this.tag.Stats.HarvestLevel)) return false;

    var data as int = this.tag.Stats.HarvestLevel.asInt();
    if(!this.hasTicuuid(uuid)){
        this.addTicuuid(uuid);
        this.mutable().updateTag({Stats : {HarvestLevel : (level + data) as int}, StatsOriginal : {HarvestLevel : (level + data) as int}});
    }
    return true;
}

$expand IItemStack$addTicDurability(level as float, uuid as string) as bool {
    if(TicTool.addStat(this, "Durability", level, uuid)) return true;
    
    var pass as bool = false;

    for i in allticitem{
        if(!isNull(this)){
            if(i.definition.id == this.definition.id){
                pass = true;
                break;
            }
        }
    }

    if(!pass) return false;
    if(isNull(this.tag.Stats.Durability)) return false;

    var data as float = this.tag.Stats.Durability.asFloat();
    if(!this.hasTicuuid(uuid)){
        this.addTicuuid(uuid);
        this.mutable().updateTag({Stats : {Durability : (level + data) as float}, StatsOriginal : {Durability : (level + data) as float}});
    }
    return true;
}


$expand IItemStack$hasTicuuid(uuid as string) as bool {
    var pass as bool = false;

    for i in allticitem{
        if(!isNull(this)){
            if(i.definition.id == this.definition.id){
                pass = true;
                break;
            }
        }
    }

    if(!pass) return false;

    if(this.getTicuuid() has uuid){
        return true;
    }
}


$expand IItemStack$getTicuuid() as string[] {
    var Uuids as string[] = [];
    var pass as bool = false;

    for i in allticitem{
        if(!isNull(this)){
            if(i.definition.id == this.definition.id){
                pass = true;
                break;
            }
        }
    }

    if(!pass) return Uuids;
    if(isNull(this.tag.StatsOriginal.UUIDS)) return Uuids;

    var data as IData = this.tag.StatsOriginal;
    var uuids as string[] = data.UUIDS.asString().replace("[", "").replace("]", "").replace("\"", "").split(",");

    for uuid in uuids {
        Uuids += uuid.trim();
    }
    return Uuids;
}


$expand IItemStack$addTicuuid(uuid as string) as bool {
    var pass as bool = false;

    for i in allticitem{
        if(!isNull(this)){
            if(i.definition.id == this.definition.id){
                pass = true;
                break;
            }
        }
    }

    if(!pass) return false;
    if(isNull(this.tag.StatsOriginal.UUIDS)){
        this.mutable().updateTag({StatsOriginal : {UUIDS : uuid as string}});
    }else{
        var haduuid as string = this.tag.StatsOriginal.UUIDS.asString();
        this.mutable().updateTag({StatsOriginal : {UUIDS : (haduuid + "," + uuid) as string}});
    }
    return true;
}


$expand IItemStack$setTicnbt(str as string, num as float) as bool {
    if(isNull(this.tag.Customnbt)){
        var nbt as string = (str + ":" + num) as string;
        this.mutable().updateTag({Customnbt : nbt});
    }else{
        if(this.getTicnbt(str) == -1.0f){
            var hadnbt as string = this.tag.Customnbt.asString();
            var nbt as string = (str + ":" + num) as string;
            this.mutable().updateTag({Customnbt : (hadnbt + "," + nbt) as string});
        }else{
            if(!isNull(this.tag.Customnbt)){
                var aaa as int = 0;
                var bbb as float = 0.0f;
                var nbts as string[] = this.tag.Customnbt.asString().split(",");
                for nbt in nbts{
                    aaa += 1;
                    var num0 as float = nbt.split(":")[1] as float;
                    var nbtid as string = nbt.split(":")[0] as string;
                    if(nbtid == str){
                        bbb = num0;
                        break;
                    }
                }
                var hadnbt as string = this.tag.Customnbt.asString();
                var oldnbt as string = nbts[aaa];
                var newnbt as string = hadnbt.replace(oldnbt, "");
                var nnbt as string = (str + ":" + bbb) as string;
                this.mutable().updateTag({Customnbt : (newnbt + "," + nnbt) as string});
            }
        }
    }
    return true;
}


$expand IItemStack$addTicnbt(str as string, num as float) as bool {
    if(isNull(this.tag.Customnbt)){
        var nbt as string = (str + ":" + num) as string;
        this.mutable().updateTag({Customnbt : nbt});
    }else{
        if(this.getTicnbt(str) == -1.0f){
            var hadnbt as string = this.tag.Customnbt.asString();
            var nbt as string = (str + ":" + num) as string;
            this.mutable().updateTag({Customnbt : (hadnbt + "," + nbt) as string});
        }else{
            if(!isNull(this.tag.Customnbt)){
                var aaa as int = 0;
                var bbb as float = 0.0f;
                var nbts as string[] = this.tag.Customnbt.asString().split(",");
                for nbt in nbts{
                    aaa += 1;
                    var num0 as float = nbt.split(":")[1] as float;
                    var nbtid as string = nbt.split(":")[0] as string;
                    if(nbtid == str){
                        bbb = num0;
                        break;
                    }
                }
                var hadnbt as string = this.tag.Customnbt.asString();
                var oldnbt as string = nbts[aaa];
                var newnbt as string = hadnbt.replace(oldnbt, "");
                var nnbt as string = (str + ":" + (num + bbb)) as string;
                this.mutable().updateTag({Customnbt : (newnbt + "," + nnbt) as string});
            }
        }
    }
    return true;
}

$expand IItemStack$getTicnbt(str as string) as float {
    var returnvalue as float = -1.0f;
    if(!isNull(this.tag.Customnbt)){
        var nbts as string[] = this.tag.Customnbt.asString().split(",");
        for nbt in nbts{
            var num as float = nbt.split(":")[1] as float;
            var nbtid as string = nbt.split(":")[0] as string;
            if(nbtid == str){
                returnvalue = num;
                break;
            }
        }
    }
    return returnvalue;
}

$expand IItemStack$getTicArmorType() as string {
    return TicTool.getArmorType(this);
}
