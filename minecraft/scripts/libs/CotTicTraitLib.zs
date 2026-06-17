#reloadable
#loader contenttweaker
#priority 32627
import mods.ticlib.TicTool;
import crafttweaker.item.IItemStack;
import crafttweaker.player.IPlayer;
import crafttweaker.data.IData;
import crafttweaker.entity.IEntityEquipmentSlot;
import mods.zenutils.DataUpdateOperation.OVERWRITE;
import mods.zenutils.DataUpdateOperation.APPEND;
import mods.zenutils.DataUpdateOperation.MERGE;
import mods.zenutils.DataUpdateOperation.REMOVE;
import mods.zenutils.DataUpdateOperation.BUMP;
import mods.zenutils.StaticString;
import mods.contenttweaker.tconstruct.Trait;


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

$expand IItemStack$removeTicTrait(traitid as string) as bool{
    if(TicTool.removeRegisteredTrait(this, traitid)) return true;
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
    if(isNull(this.tag.Traits)) return false;
    if(isNull(this.tag.Modifiers)) return false;

    var data as IData = this.tag;
    var modifiers as IData = data.Modifiers;
    var traits as IData = data.Traits;
    var tinkerData as IData = data.TinkerData;

    var addmodifier as IData = [{identifier: traitid, color: this.getTraitColor(traitid), level: this.getTraitLevel(traitid)}];
    var addtrait as IData = [traitid as string];

    this.mutable().updateTag({Modifiers : modifiers.deepUpdate(addmodifier, REMOVE), Traits : traits.deepUpdate(addtrait, REMOVE), TinkerData : {Modifiers : tinkerData.deepUpdate(addtrait, REMOVE)}});
    return true;
}


$expand IItemStack$addTicTrait(traitid as string, traitcolor as int, traitlevel as int) as bool{
    if(TicTool.applyRegisteredTrait(this, traitid, traitcolor, traitlevel)) return true;
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
    if(isNull(this.tag.Traits)) return false;
    if(isNull(this.tag.Modifiers)) return false;
    if(this.getTicTrait().contains(traitid)) return false;

    var data as IData = this.tag;
    var modifiers as IData = data.Modifiers;
    var traits as IData = data.Traits;
    var tinkerData as IData = data.TinkerData;
    var addmodifier as IData = [{identifier: traitid, color: traitcolor, level: traitlevel}];
    var addtrait as IData = [traitid as string];

    this.mutable().updateTag({Modifiers : modifiers.deepUpdate(addmodifier, APPEND), Traits : traits.deepUpdate(addtrait, APPEND), TinkerData : {Modifiers : tinkerData.deepUpdate(addtrait, APPEND)}});
    return true;
}


$expand IItemStack$getTraitColor(traitid as string) as int {
    var color as int = 0;
    var modColor as int = TicTool.getTraitColor(this, traitid);
    if(modColor != 0) return modColor;
    
    
    if(isNull(this.tag.Modifiers)) return color;

    var data as IData = this.tag;
    // var modifiers as IData = data.Modifiers.asList();

    for trait in data.Modifiers.asList(){
        if(trait.identifier == traitid){
            color = trait.color.asInt();
            break;
        }
    }
    return color;
}


$expand IItemStack$getTraitLevel(traitid as string) as int {
    var level as int = 0;
    var modLevel as int = TicTool.getTraitLevel(this, traitid);
    if(modLevel != 0) return modLevel;
    
    
    if(isNull(this.tag.Modifiers)) return level;

    var data as IData = this.tag;
    // var modifiers as IData = data.Modifiers.asList();

    for trait in data.Modifiers.asList(){
        if(trait.identifier == traitid){
            level = trait.level.asInt();
            break;
        }
    }
    return level;
}


$expand IItemStack$getTicTrait() as string[] {
    var traits as string[] = [];
    var modTraits as string[] = TicTool.getTraits(this);
    if(modTraits.length > 0) return modTraits;
    var pass as bool = false;

    for i in allticitem{
        if(!isNull(this)){
            if(i.definition.id == this.definition.id){
                pass = true;
                break;
            }
        }
    }

    if(!pass) return traits;
    if(isNull(this.tag.Traits)) return traits;

    var data as IData = this.tag;
    var modifiers as string[] = data.Traits.asString().replace("[", "").replace("]", "").replace("\"", "").split(",");

    for modifier in modifiers {
        traits += modifier.trim();
    }
    return traits;
}


$expand IPlayer$getPlayerTicBootsTrait() as string[] {
    var traits as string[] = [];
    var modTraits as string[] = TicTool.getArmorSlotTraits(this, "boots");
    if(modTraits.length > 0) return modTraits;
    var itemStack = this.getItemInSlot(IEntityEquipmentSlot.feet());
    
    if(isNull(itemStack)) return traits;
    if(isNull(itemStack.tag.Traits)) return traits;
    if(itemStack.definition.id != "conarm:boots") return traits;
    var data as IData = itemStack.tag;
    var modifiers as string[] = data.Traits.asString().replace("[", "").replace("]", "").replace("\"", "").split(",");

    for modifier in modifiers {
        traits += modifier.trim();
    }
    return traits;
}


$expand IPlayer$getPlayerTicLeggingsTrait() as string[] {
    var traits as string[] = [];
    var modTraits as string[] = TicTool.getArmorSlotTraits(this, "leggings");
    if(modTraits.length > 0) return modTraits;
    var itemStack = this.getItemInSlot(IEntityEquipmentSlot.legs());

    if(isNull(itemStack)) return traits;
    if(isNull(itemStack.tag.Traits)) return traits;
    if(itemStack.definition.id != "conarm:leggings") return traits;
    var data as IData = itemStack.tag;
    var modifiers as string[] = data.Traits.asString().replace("[", "").replace("]", "").replace("\"", "").split(",");

    for modifier in modifiers {
        traits += modifier.trim();
    }
    return traits;
}


$expand IPlayer$getPlayerTicChestplateTrait() as string[] {
    var traits as string[] = [];
    var modTraits as string[] = TicTool.getArmorSlotTraits(this, "chestplate");
    if(modTraits.length > 0) return modTraits;
    var itemStack = this.getItemInSlot(IEntityEquipmentSlot.chest());

    if(isNull(itemStack)) return traits;
    if(isNull(itemStack.tag.Traits)) return traits;
    if(itemStack.definition.id != "conarm:chestplate") return traits;
    var data as IData = itemStack.tag;
    var modifiers as string[] = data.Traits.asString().replace("[", "").replace("]", "").replace("\"", "").split(",");

    for modifier in modifiers {
        traits += modifier.trim();
    }
    return traits;
}


$expand IPlayer$getPlayerTicHelmetTrait() as string[] {
    var traits as string[] = [];
    var modTraits as string[] = TicTool.getArmorSlotTraits(this, "helmet");
    if(modTraits.length > 0) return modTraits;
    var itemStack = this.getItemInSlot(IEntityEquipmentSlot.head());

    if(isNull(itemStack)) return traits;
    if(isNull(itemStack.tag.Traits)) return traits;
    if(itemStack.definition.id != "conarm:helmet") return traits;
    var data as IData = itemStack.tag;
    var modifiers as string[] = data.Traits.asString().replace("[", "").replace("]", "").replace("\"", "").split(",");

    for modifier in modifiers {
        traits += modifier.trim();
    }
    return traits;
}


$expand IPlayer$getPlayerTicArmorTrait() as string[] {
    var traits as string[] = [];
    var modTraits as string[] = TicTool.getArmorTraits(this);
    if(modTraits.length > 0) return modTraits;
    for i in this.getPlayerTicHelmetTrait(){
        traits += i;
    }
    for i in this.getPlayerTicChestplateTrait(){
        traits += i;
    }
    for i in this.getPlayerTicLeggingsTrait(){
        traits += i;
    }
    for i in this.getPlayerTicBootsTrait(){
        traits += i;
    }

    return traits;
}

$expand IItemStack$hasTicTrait(traitid as string) as bool {
    return TicTool.hasTrait(this, traitid) || (this.getTicTrait() has traitid);
}
