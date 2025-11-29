/*
 * This script is created for the GreedyCraft modpack by TCreopargh.
 * You may NOT use this script in any other publicly distributed modpack without my permission. 
 */ 

#priority 4000

//Powered by TCreopargh

import crafttweaker.item.IItemStack;
import crafttweaker.data.IData;
import crafttweaker.item.IIngredient;

import mods.zenutils.DataUpdateOperation.OVERWRITE;
import mods.zenutils.DataUpdateOperation.APPEND;
import mods.zenutils.DataUpdateOperation.MERGE;
import mods.zenutils.DataUpdateOperation.REMOVE;
import mods.zenutils.DataUpdateOperation.BUMP;

import scripts.util.lang as LangUtil;

val errorStone = <minecraft:stone>.withTag({display: {Name: LangUtil.translate("greedycraft.misc.bug_stone.name"), Lore: [LangUtil.translate("greedycraft.misc.bug_stone.tooltip.1"), LangUtil.translate("greedycraft.misc.bug_stone.tooltip.2")]}}) as IItemStack;

recipes.addShapeless("nametag_to_human_spawn_egg", <minecraft:spawn_egg>, [<minecraft:name_tag>.marked("nametag"), <minecraft:egg>], 
function(out, ins, cInfo) {
    var name = ins.nametag.displayName;
    return <minecraft:spawn_egg>.withTag({display: {Name: "§e" + name + LangUtil.translate("greedycraft.misc.spawn_egg")}, EntityTag: {Username: name, id: "headcrumbs:human"}});
}, null);
recipes.addShapeless("head_to_human_spawn_egg", <minecraft:spawn_egg>, [<minecraft:skull:3>.marked("head"), <minecraft:egg>], 
function(out, ins, cInfo) {
    var name = "null";
    if (ins.head.tag.asString().contains("SkullOwner:")) {
        var nameData = ins.head.tag.memberGet("SkullOwner") as IData;
        if (nameData.asString().contains("Name:")) {
            nameData = nameData.memberGet("Name") as IData;
        }
        if (!isNull(nameData)) {
            name = nameData.asString();
        }
    }
    return <minecraft:spawn_egg>.withTag({display: {Name: "§e" + name + LangUtil.translate("greedycraft.misc.spawn_egg")}, EntityTag: {Username: name, id: "headcrumbs:human"}});
},null);
recipes.addShapeless("nametag_to_head", <minecraft:skull>, [<minecraft:name_tag>.marked("nametag1"), <minecraft:skull:*>], 
function(out, ins, cInfo) {
    var name = ins.nametag1.displayName;
    return <minecraft:skull:3>.withTag({display: {Name: "§e" + name + LangUtil.translate("greedycraft.misc.head")}, SkullOwner: name});
},null);

recipes.addShaped("upgrade_capacitor_chaotic", <gctcore:chaotic_flux_capacitor>, [
    [<contenttweaker:chaotic_energy_core>, <ore:coreChaotic>, <contenttweaker:chaotic_energy_core>],
    [<ore:ingotDraconiumChaotic>, <draconicevolution:draconium_capacitor:1>.marked("cap"), <ore:ingotDraconiumChaotic>],
    [<contenttweaker:chaotic_energy_core>, <ore:ingotDraconiumChaotic>, <contenttweaker:chaotic_energy_core>]],
function(out, ins, cInfo) {
    if (!isNull(ins.cap.tag.Energy)) {
        if (!isNull(ins.cap.tag.DEUpgrades)) {
            var energy as long = ins.cap.tag.Energy as int as long;
            var level as byte = ins.cap.tag.DEUpgrades.rfCap as byte;
            return out.withTag({DEUpgrades: {rfCap: level}, EnergyL: energy});
        } else {
            var energy as long = ins.cap.tag.Energy as int as long;
            return out.withTag({EnergyL: energy});
        }
    } else {
        if (!isNull(ins.cap.tag.DEUpgrades)) {
            var level as byte = ins.cap.tag.DEUpgrades.rfCap as byte;
            return out.withTag({DEUpgrades: {rfCap: level}});
        } else {
            return out;
        }
    }
}, null);

recipes.addShaped("upgrade_capacitor_ordered", <gctcore:ordered_flux_capacitor>, [
    [<contenttweaker:ordered_energy_core>, <ore:coreOrdered>, <contenttweaker:ordered_energy_core>],
    [<ore:ingotDraconiumRuled>, <gctcore:chaotic_flux_capacitor>.marked("cap"), <ore:ingotDraconiumRuled>],
    [<contenttweaker:ordered_energy_core>, <ore:ingotDraconiumRuled>, <contenttweaker:ordered_energy_core>]],
function(out, ins, cInfo) {
    return out.withTag(ins.cap.tag);
}, null);

recipes.addShaped("exp_transport_tool", errorStone, [[<ore:toolTiC>.marked("to"), <additions:experience_transporter>, <ore:toolTiC>.marked("from")]], 
function(out, ins, cInfo) {
    if (isNull(ins.from.tag) || isNull(ins.to.tag) || isNull(ins.from.tag.Modifiers) || isNull(ins.to.tag.Modifiers)) {
        return null;
    }
    var tD = ins.to.tag as IData;
    var oL = 1 as int;//等级
    var eS = 0 as int;//额外槽位
    var xp = 0 as int;
    var aS = true;
    var L = {Modifiers: []} as IData;
    for m in tD.Modifiers.asList() as IData[] {
        if (!isNull(m.identifier) && m.identifier == "toolleveling") {
            oL = m.level;
            eS = isNull(m.bonus_modifiers) ? 0 : m.bonus_modifiers as int;
            xp = isNull(m.xp) ? 0 : m.xp as int;
        }
        if (m.identifier != "toolleveling") {
            L = L.deepUpdate({Modifiers: [m]},{Modifiers: APPEND});
        }
    }
    for m in ins.from.tag.Modifiers.asList() as IData[] {
        if (!isNull(m.identifier) && m.identifier == "toolleveling" && m.level > oL) {
            oL = m.level;
            eS = isNull(m.bonus_modifiers) ? 0 : m.bonus_modifiers as int;
            xp = isNull(m.xp) ? 0 : m.xp as int;
            aS = false;
            break;
        }
    }
    tD = tD.deepUpdate(L.deepUpdate({Modifiers: [{identifier: "toolleveling",color: 16777215,level: oL,bonus_modifiers: eS,xp: xp}]},{Modifiers: APPEND}),{Modifiers: OVERWRITE});
    tD = tD.deepUpdate({Stats: tD.Stats.deepUpdate({FreeModifiers: (aS ? tD.Stats.FreeModifiers : ins.from.tag.Stats.FreeModifiers) as int},{FreeModifiers: OVERWRITE})},{Stats: OVERWRITE});
    return ins.to.withTag(tD);
}, null);

recipes.addShaped("exp_transport_armor", errorStone, [[<ore:armorTiC>.marked("to"), <additions:experience_transporter>, <ore:armorTiC>.marked("from")]], 
function(out, ins, cInfo) {
    if (isNull(ins.from.tag) || isNull(ins.to.tag) || isNull(ins.from.tag.Modifiers) || isNull(ins.to.tag.Modifiers)) {
        return null;
    }
    var tD = ins.to.tag as IData;
    var oL = 1 as int;//等级
    var eS = 0 as int;//额外槽位
    var xp = 0 as int;
    var aS = true;
    var L = {Modifiers: []} as IData;
    for m in tD.Modifiers.asList() as IData[] {
        if (!isNull(m.identifier) && m.identifier == "leveling_armor") {
            oL = m.level;
            eS = isNull(m.bonus_modifiers) ? 0 : m.bonus_modifiers as int;
            xp = isNull(m.xp) ? 0 : m.xp as int;
        }
        if (m.identifier != "leveling_armor") {
            L = L.deepUpdate({Modifiers: [m]},{Modifiers: APPEND});
        }
    }
    for m in ins.from.tag.Modifiers.asList() as IData[] {
        if (!isNull(m.identifier) && m.identifier == "leveling_armor" && m.level > oL) {
            oL = m.level;
            eS = isNull(m.bonus_modifiers) ? 0 : m.bonus_modifiers as int;
            xp = isNull(m.xp) ? 0 : m.xp as int;
            aS = false;
            break;
        }
    }
    tD = tD.deepUpdate(L.deepUpdate({Modifiers: [{identifier: "leveling_armor",color: 16777215,level: oL,bonus_modifiers: eS,xp: xp}]},{Modifiers: APPEND}),{Modifiers: OVERWRITE});
    tD = tD.deepUpdate({Stats: tD.Stats.deepUpdate({FreeModifiers: (aS ? tD.Stats.FreeModifiers : ins.from.tag.Stats.FreeModifiers) as int},{FreeModifiers: OVERWRITE})},{Stats: OVERWRITE});
    return ins.to.withTag(tD);
}, null);

recipes.addShapeless("etablet_dupe", <contenttweaker:tablet_of_enlightenment>,
    [<contenttweaker:tablet_of_enlightenment>.marked("tablet")],
    function(out, ins, cInfo) {
        return ins.tablet.updateTag({});
    }, null
);