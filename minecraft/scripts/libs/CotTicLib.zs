#reloadable

#loader contenttweaker
#priority 32627
import crafttweaker.item.IItemStack;
import crafttweaker.player.IPlayer;
import crafttweaker.data.IData;
import crafttweaker.entity.IEntityEquipmentSlot;
import mods.zenutils.StaticString;





zenClass cotticLib {

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
        <item:moretcon:ring>,
        <item:moretcon:gauntlet>,
        <item:plustic:laser_gun>,
        <item:plustic:katana>,
        <item:tcongreedyaddon:battleaxe>,
        <item:tcongreedyaddon:greatblade>,
        <item:tconevo:tool_sceptre>,
        <item:tcongreedyaddon:allinonetool>,
        <item:moretcon:bomb>,
        <item:tcomplement:chisel>,
        <item:tinkersarsenal:boomstick>,
        <item:tinkersarsenal:toolshears>,
        <item:tinkersarsenal:boomstick_shot>
    ];

    zenConstructor() {
    }

    function isTicTool(itemStack as IItemStack) as bool {
        
        var pass as bool = false;
        var tictool as IItemStack[] = [
            <item:tconstruct:bolt>,
            <item:tinkersaether:dart_shooter>,
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
            <item:tinkersaether:dart>,
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
            <item:moretcon:ring>,
            <item:moretcon:gauntlet>,
            <item:tcongreedyaddon:battleaxe>,
            <item:tcongreedyaddon:greatblade>,
            <item:tconevo:tool_sceptre>,
            <item:tcongreedyaddon:allinonetool>,
            <item:moretcon:bomb>,
            <item:tcomplement:chisel>,
            <item:tinkersarsenal:boomstick>,
            <item:tinkersarsenal:toolshears>,
            <item:tinkersarsenal:boomstick_shot>
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
            <item:conarm:boots>,
            <item:conarm:leggings>,
            <item:conarm:chestplate>,
            <item:conarm:helmet>,
            <item:moretcon:ring>,
            <item:moretcon:gauntlet>
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

    function getTicArmorTypeAsSlot(itemStack as IItemStack) as IEntityEquipmentSlot {

        var returnSlot as IEntityEquipmentSlot = IEntityEquipmentSlot.head();

        if (isTicArmor(itemStack)) {
            if (itemStack.definition.id == "conarm:helmet") {
                returnSlot = IEntityEquipmentSlot.head();
            } else if (itemStack.definition.id == "conarm:chestplate") {
                returnSlot = IEntityEquipmentSlot.chest();
            } else if (itemStack.definition.id == "conarm:leggings") {
                returnSlot = IEntityEquipmentSlot.legs();
            } else if (itemStack.definition.id == "conarm:boots") {
                returnSlot = IEntityEquipmentSlot.feet();
            }
        
        return returnSlot;
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
            <item:tconstruct:hammer>,
            <item:tconstruct:pickaxe>,
            <item:tconstruct:shovel>,
            <item:tconstruct:excavator>,
            <item:tconstruct:hammer>,
            <item:tconstruct:scythe>,
            <item:tconstruct:lumberaxe>,
            <item:tconstruct:mattock>,
            <item:tconstruct:kama>,
            <item:tcongreedyaddon:battleaxe>,
            <item:tcongreedyaddon:allinonetool>,
            <item:tinkersarsenal:toolshears>
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
            <item:tconstruct:hammer>,
            <item:tconstruct:pickaxe>,
            <item:tconstruct:shovel>,
            <item:tconstruct:excavator>,
            <item:tconstruct:hammer>,
            <item:tconstruct:scythe>,
            <item:tconstruct:lumberaxe>,
            <item:tconstruct:mattock>,
            <item:tconstruct:kama>,
            <item:tcongreedyaddon:battleaxe>,
            <item:tcongreedyaddon:allinonetool>,
            <item:tinkersarsenal:toolshears>
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
            <item:tconstruct:shortbow>,
            <item:tconstruct:longbow>,
            <item:tconstruct:crossbow>,
            <item:tinkersarsenal:boomstick>
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
            itemStack.mutable().updateTag({Stats : {DrawSpeed : (level + data) as float}, StatsOriginal : {DrawSpeed : (level + data) as float}});
        }
        return true;
    }

    function addTicAttackSpeedMultiplier(itemStack as IItemStack, level as float, uuid as string) as bool {
        var pass as bool = true;

        var item as IItemStack[] = [
            <item:conarm:boots>,
            <item:conarm:leggings>,
            <item:conarm:chestplate>,
            <item:conarm:helmet>
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

function getCotTicLib() as cotticLib{
    return cotticLib();
}