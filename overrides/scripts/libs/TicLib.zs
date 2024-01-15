#reloadable
#priority 32627
import crafttweaker.item.IItemStack;
import crafttweaker.player.IPlayer;
import crafttweaker.data.IData;
import crafttweaker.entity.IEntityEquipmentSlot;
import mods.zenutils.StaticString;





zenClass ticLib {

    static allticitem as IItemStack[] = [
        <tconstruct:bolt>,
        <tconstruct:broadsword>,
        <tconstruct:longsword>,
        <tconstruct:rapier>,
        <tconstruct:frypan>,
        <tconstruct:battlesign>,
        <tconstruct:cleaver>,
        <tconstruct:shortbow>,
        <tconstruct:crossbow>,
        <tconstruct:arrow>,
        <tconstruct:shuriken>,
        <tconstruct:hammer>,
        <tconstruct:excavator>,
        <tconstruct:lumberaxe>,
        <tconstruct:scythe>,
        <tconstruct:pickaxe>,
        <tconstruct:shovel>,
        <tconstruct:hatchet>,
        <tconstruct:mattock>,
        <tconstruct:kama>,
        <conarm:boots>,
        <conarm:leggings>,
        <conarm:chestplate>,
        <conarm:helmet>,
        <moretcon:blaxe>,
        <moretcon:blsword>,
        <moretcon:blshovel>,
        <moretcon:blpick>,
        <moretcon:ring>,
        <moretcon:gauntlet>,
        <plustic:laser_gun>,
        <plustic:katana>,
        <totaltinkers:battleaxe>,
        <totaltinkers:cutlass>,
        <totaltinkers:javelin>,
        <totaltinkers:dagger>,
        <totaltinkers:greatblade>,
        <totaltinkers:scimitar>,
        <totaltinkers:explosive_bow>
    ];

    zenConstructor() {
    }

    function isTicTool(itemStack as IItemStack) as bool {
        
        var pass as bool = false;
        var tictool as IItemStack[] = [
            <tconstruct:bolt>,
            <tconstruct:broadsword>,
            <tconstruct:longsword>,
            <tconstruct:rapier>,
            <tconstruct:frypan>,
            <tconstruct:battlesign>,
            <tconstruct:cleaver>,
            <tconstruct:shortbow>,
            <tconstruct:crossbow>,
            <tconstruct:arrow>,
            <tconstruct:shuriken>,
            <tconstruct:hammer>,
            <tconstruct:excavator>,
            <tconstruct:lumberaxe>,
            <tconstruct:scythe>,
            <tconstruct:pickaxe>,
            <tconstruct:shovel>,
            <tconstruct:hatchet>,
            <tconstruct:mattock>,
            <tconstruct:kama>,
            <moretcon:blaxe>,
            <moretcon:blsword>,
            <moretcon:blshovel>,
            <moretcon:blpick>,
            <moretcon:ring>,
            <moretcon:gauntlet>,
            <plustic:laser_gun>,
            <plustic:katana>,
            <totaltinkers:battleaxe>,
            <totaltinkers:cutlass>,
            <totaltinkers:javelin>,
            <totaltinkers:dagger>,
            <totaltinkers:greatblade>,
            <totaltinkers:scimitar>,
            <totaltinkers:explosive_bow>
        ];

        for i in tictool{
            if(!isNull(itemStack)){
                if(i.definition.id == itemStack.definition.id){
                    pass = true;
                    break;
                }
            }
        }

        return pass;
    }

    function isTicArmor(itemStack as IItemStack) as bool {
        
        var pass as bool = false;
        var ticarmor as IItemStack[] = [
            <conarm:boots>,
            <conarm:leggings>,
            <conarm:chestplate>,
            <conarm:helmet>,
            <moretcon:ring>,
            <moretcon:gauntlet>
        ];

        for i in ticarmor{
            if(!isNull(itemStack)){
                if(i.definition.id == itemStack.definition.id){
                    pass = true;
                    break;
                }
            }
        }

        return pass;
    }

    function getTicArmorType(itemStack as IItemStack) as string {

        var returnStr as string = "";

        if (isTicArmor(itemStack)) {
            if (itemStack.definition.id == "conarm:helmet") {
                returnStr = "helmet";
            } else if (itemStack.definition.id == "conarm:chestplate") {
                returnStr = "chestplate";
            } else if (itemStack.definition.id == "conarm:leggings") {
                returnStr = "leggings";
            } else if (itemStack.definition.id == "conarm:boots") {
                returnStr = "boots";
            }
        
        return returnStr;
        }
    }

    function getTicMaterial(itemStack as IItemStack) as string[] {
        var Materials as string[] = [];
        var pass as bool = false;

        for i in allticitem{
            if(!isNull(itemStack)){
                if(i.definition.id == itemStack.definition.id){
                    pass = true;
                    break;
                }
            }
        }

        if(!pass) return Materials;
        if(isNull(itemStack.tag.TinkerData.Materials)) return Materials;

        var data as IData = itemStack.tag;
        var materials as string[] = data.TinkerData.Materials.asString().replace("[", "").replace("]", "").replace("\"", "").split(",");

        for material in materials {
            Materials += material.trim();
        }
        return Materials;
    }


    function setTicBroken(itemStack as IItemStack, isBroken as bool) as bool {
        
        var pass as bool = false;

        for i in allticitem{
            if(!isNull(itemStack)){
                if(i.definition.id == itemStack.definition.id){
                    pass = true;
                    break;
                }
            }
        }

        if(!pass) return false;

        var num as int = (isBroken ? 1 : 0);

        itemStack.mutable().updateTag({Stats : {Broken : num as int}});

        return true;
    }


    function addTicMiningSpeed(itemStack as IItemStack, level as float, uuid as string) as bool {
        
        var pass as bool = false;

        var item as IItemStack[] = [
            <tconstruct:hammer>,
            <tconstruct:pickaxe>,
            <tconstruct:shovel>,
            <tconstruct:excavator>,
            <moretcon:blshovel>,
            <moretcon:blpick>
        ];

        for i in item{
            if(!isNull(itemStack)){
                if(i.definition.id == itemStack.definition.id){
                    pass = true;
                    break;
                }
            }
        }

        if(!pass) return false;
        if(isNull(itemStack.tag.Stats.MiningSpeed)) return false;

        var data as float = itemStack.tag.Stats.MiningSpeed.asFloat();
        if(!hasTicuuid(itemStack, uuid)){
            addTicuuid(itemStack, uuid);
            itemStack.mutable().updateTag({Stats : {MiningSpeed : (level + data) as float}, StatsOriginal : {MiningSpeed : (level + data) as float}});
        }
        return true;
    }


    function addTicAttack(itemStack as IItemStack, level as float, uuid as string) as bool {
        
        var pass as bool = false;

        for i in allticitem{
            if(!isNull(itemStack)){
                if(i.definition.id == itemStack.definition.id){
                    pass = true;
                    break;
                }
            }
        }

        if(!pass) return false;
        if(isNull(itemStack.tag.Stats.Attack)) return false;

        var data as float = itemStack.tag.Stats.Attack.asFloat();
        if(!hasTicuuid(itemStack, uuid)){
            addTicuuid(itemStack, uuid);
            itemStack.mutable().updateTag({Stats : {Attack : (level + data) as float}, StatsOriginal : {Attack : (level + data) as float}});
        }
        return true;
    }

    
    function addTicFreeModifiers(itemStack as IItemStack, level as int, uuid as string) as bool {
        
        var pass as bool = false;


        for i in allticitem{
            if(!isNull(itemStack)){
                if(i.definition.id == itemStack.definition.id){
                    pass = true;
                    break;
                }
            }
        }

        if(!pass) return false;
        if(isNull(itemStack.tag.Stats.FreeModifiers)) return false;

        var data as int = itemStack.tag.Stats.FreeModifiers.asInt();
        if(!hasTicuuid(itemStack, uuid)){
            addTicuuid(itemStack, uuid);
            itemStack.mutable().updateTag({Stats : {FreeModifiers : (level + data) as int}, StatsOriginal : {FreeModifiers : (level + data) as int}});
        }
        return true;
    }


    function addTicDefense(itemStack as IItemStack, level as float, uuid as string) as bool {
        
        var pass as bool = false;


        for i in allticitem{
            if(!isNull(itemStack)){
                if(i.definition.id == itemStack.definition.id){
                    pass = true;
                    break;
                }
            }
        }

        if(!pass) return false;
        if(isNull(itemStack.tag.Stats.Defense)) return false;

        var data as float = itemStack.tag.Stats.Defense.asFloat();
        if(!hasTicuuid(itemStack, uuid)){
            addTicuuid(itemStack, uuid);
            if(itemStack.definition.id == "conarm:helmet"){
                itemStack.mutable().updateTag({Stats : {Defense : ((level / 0.16) + data) as float}, StatsOriginal : {Defense : ((level / 0.16) + data) as float}});
            }
            if(itemStack.definition.id == "conarm:chestplate"){
                itemStack.mutable().updateTag({Stats : {Defense : ((level / 0.4) + data) as float}, StatsOriginal : {Defense : ((level / 0.4) + data) as float}});
            }
            if(itemStack.definition.id == "conarm:leggings"){
                itemStack.mutable().updateTag({Stats : {Defense : ((level / 0.3) + data) as float}, StatsOriginal : {Defense : ((level / 0.3) + data) as float}});
            }
            if(itemStack.definition.id == "conarm:boots"){
                itemStack.mutable().updateTag({Stats : {Defense : ((level / 0.14) + data) as float}, StatsOriginal : {Defense : ((level / 0.14) + data) as float}});
            }
        }
        return true;
    }


    function addTicToughness(itemStack as IItemStack, level as float, uuid as string) as bool {
        
        var pass as bool = false;


        for i in allticitem{
            if(!isNull(itemStack)){
                if(i.definition.id == itemStack.definition.id){
                    pass = true;
                    break;
                }
            }
        }

        if(!pass) return false;
        if(isNull(itemStack.tag.Stats.Toughness)) return false;

        var data as float = itemStack.tag.Stats.Toughness.asFloat();
        if(!hasTicuuid(itemStack, uuid)){
            addTicuuid(itemStack, uuid);
            itemStack.mutable().updateTag({Stats : {Toughness : (level + data) as float}, StatsOriginal : {Toughness : (level + data) as float}});
        }
        return true;
    }
    

    function addTicHarvestLevel(itemStack as IItemStack, level as int, uuid as string) as bool {
        
        var pass as bool = false;

        var item as IItemStack[] = [
            <tconstruct:hammer>,
            <tconstruct:pickaxe>,
            <tconstruct:shovel>,
            <tconstruct:excavator>,
            <moretcon:blshovel>,
            <moretcon:blpick>
        ];

        for i in item{
            if(!isNull(itemStack)){
                if(i.definition.id == itemStack.definition.id){
                    pass = true;
                    break;
                }
            }
        }

        if(!pass) return false;
        if(isNull(itemStack.tag.Stats.HarvestLevel)) return false;

        var data as int = itemStack.tag.Stats.HarvestLevel.asInt();
        if(!hasTicuuid(itemStack, uuid)){
            addTicuuid(itemStack, uuid);
            itemStack.mutable().updateTag({Stats : {HarvestLevel : (level + data) as int}, StatsOriginal : {HarvestLevel : (level + data) as int}});
        }
        return true;
    }

    function addTicDrawSpeed(itemStack as IItemStack, level as float, uuid as string) as bool {

        var pass as bool = false;

        var item as IItemStack[] = [
            <moretcon:blbow>,
            <tconstruct:shortbow>,
            <tconstruct:longbow>,
            <tconstruct:crossbow>,
            <totaltinkers:explosive_bow>
        ];

        for i in item{
            if(!isNull(itemStack)){
                if(i.definition.id == itemStack.definition.id){
                    pass = true;
                    break;
                }
            }
        }
        
        if(!pass) return false;
        if(isNull(itemStack.tag.Stats.DrawSpeed)) return false;

        var data as float = itemStack.tag.Stats.DrawSpeed.asFloat();
        if(!hasTicuuid(itemStack, uuid)){
            addTicuuid(itemStack, uuid);
            if ((level - data) < 0.01f) {
                itemStack.mutable().updateTag({Stats : {DrawSpeed : 0.01 as float}, StatsOriginal : {DrawSpeed : 0.01 as float}});
            } else {
                itemStack.mutable().updateTag({Stats : {DrawSpeed : (level - data) as float}, StatsOriginal : {DrawSpeed : (level - data) as float}});
            }
        }
        return true;
    }

    function addTicAttackSpeedMultiplier(itemStack as IItemStack, level as float, uuid as string) as bool {
        var pass as bool = true;

        var item as IItemStack[] = [
            <conarm:boots>,
            <conarm:leggings>,
            <conarm:chestplate>,
            <conarm:helmet>
        ];

        for i in item{
            if(!isNull(itemStack)){
                if(i.definition.id == itemStack.definition.id){
                    pass = false;
                    break;
                }
            }
        }
        
        if(!pass) return false;
        if(isNull(itemStack.tag.Stats.AttackSpeedMultiplier)) return false;

        var data as float = itemStack.tag.Stats.AttackSpeedMultiplier.asFloat();
        if(!hasTicuuid(itemStack, uuid)){
            addTicuuid(itemStack, uuid);
            itemStack.mutable().updateTag({Stats : {AttackSpeedMultiplier : (level + data) as float}, StatsOriginal : {AttackSpeedMultiplier : (level + data) as float}});
        }
        return true;
    } 

    function hasTicuuid(itemStack as IItemStack, uuid as string) as bool {
        var pass as bool = false;

        for i in allticitem{
            if(!isNull(itemStack)){
                if(i.definition.id == itemStack.definition.id){
                    pass = true;
                    break;
                }
            }
        }

        if(!pass) return false;

        if(getTicuuid(itemStack) has uuid){
            return true;
        }
    }


    function getTicuuid(itemStack as IItemStack) as string[] {
        var Uuids as string[] = [];
        var pass as bool = false;

        for i in allticitem{
            if(!isNull(itemStack)){
                if(i.definition.id == itemStack.definition.id){
                    pass = true;
                    break;
                }
            }
        }

        if(!pass) return Uuids;
        if(isNull(itemStack.tag.StatsOriginal.UUIDS)) return Uuids;

        var data as IData = itemStack.tag.StatsOriginal;
        var uuids as string[] = data.UUIDS.asString().replace("[", "").replace("]", "").replace("\"", "").split(",");

        for uuid in uuids {
            Uuids += uuid.trim();
        }
        return Uuids;
    }


    function addTicuuid(itemStack as IItemStack, uuid as string) as bool {
        var pass as bool = false;

        for i in allticitem{
            if(!isNull(itemStack)){
                if(i.definition.id == itemStack.definition.id){
                    pass = true;
                    break;
                }
            }
        }

        if(!pass) return false;
        if(isNull(itemStack.tag.StatsOriginal.UUIDS)){
            itemStack.mutable().updateTag({StatsOriginal : {UUIDS : uuid as string}});
        }else{
            var haduuid as string = itemStack.tag.StatsOriginal.UUIDS.asString();
            itemStack.mutable().updateTag({StatsOriginal : {UUIDS : (haduuid + "," + uuid) as string}});
        }
        return true;
    }


}

function getTicLib() as ticLib{
    return ticLib();
}