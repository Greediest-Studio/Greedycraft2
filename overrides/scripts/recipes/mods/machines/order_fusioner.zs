/*
 * This script is created for the GreedyCraft Tweaks by mc_Edwin.
 */

#priority 50
#reloadable

import crafttweaker.oredict.IOreDictEntry;
import crafttweaker.item.IItemStack;
import crafttweaker.data.IData;
import crafttweaker.item.IIngredient;
import crafttweaker.liquid.ILiquidStack;

import mods.zenutils.DataUpdateOperation.OVERWRITE;
import mods.zenutils.DataUpdateOperation.APPEND;
import mods.zenutils.DataUpdateOperation.MERGE;
import mods.zenutils.DataUpdateOperation.REMOVE;
import mods.zenutils.DataUpdateOperation.BUMP;
import mods.modularmachinery.RecipeBuilder;
import mods.modularmachinery.RecipeModifierBuilder;
import mods.modularmachinery.IMachineController;
import mods.ctutils.utils.Math;
import mods.jei.JEI;


RecipeBuilder.newBuilder("fusion_order_core", "order_fusioner", 256)
    .addItemInput(<gct_ores:order_crystal>)
    .addItemInput(<draconicevolution:chaotic_core> * 3)
    .addItemInput(<gct_ores:stormy_core> * 3)
    .addItemInput(<additions:cosmilite_ingot> * 2)
    .addItemInput(<gct_ores:equipment_witherium_block> * 2)
    .addItemInput(<gct_ores:ruled_draconium_block> * 2)
    .addEnergyPerTickInput(786432000)
    .addItemOutput(<gct_ores:ordered_core>)
    .build();

RecipeBuilder.newBuilder("fusion_order_metal", "order_fusioner", 256)
    .addItemInput(<gct_ores:ordered_core>)
    .addItemInput(<contenttweaker:chaotic_energy_core>)
    .addItemInput(<ageofminecraft:withered_nether_star>)
    .addItemInput(<contenttweaker:chaos_heart>)
    .addEnergyPerTickInput(268435456)
    .addItemOutput(<gct_ores:ordered_metal_ingot>)
    .build();

RecipeBuilder.newBuilder("fusion_chaotic_shard", "order_fusioner", 256)
    .addItemInput(<additions:greedycraft-chaotic_crystal_gem>).setChance(0.0)
    .addItemInput(<ore:blockDiamond> * 4)
    .addItemInput(<actuallyadditions:block_crystal_empowered:4> * 4)
    .addEnergyPerTickInput(52428800)
    .addItemOutput(<draconicevolution:chaos_shard:1>)
    .build();
    
RecipeBuilder.newBuilder("fusion_stormy_shard", "order_fusioner", 256)
    .addItemInput(<additions:greedycraft-stormy_crystal_gem>).setChance(0.0)
    .addItemInput(<ore:blockEmerald> * 4)
    .addItemInput(<actuallyadditions:block_crystal_empowered:2> * 4)
    .addEnergyPerTickInput(52428800)
    .addItemOutput(<gct_ores:stormy_fragment_small>)
    .build();

RecipeBuilder.newBuilder("fusion_solar_panel_order", "order_fusioner", 256)
    .addItemInput(<solarflux:solar_panel_chaotic> * 3)
    .addItemInput(<solarflux:custom_solar_panel_solar_panel_11>)
    .addItemInput(<gct_ores:ordered_core> * 2)
    .addItemInput(<gct_ores:order_crystal> * 4)
    .addEnergyPerTickInput(160000000)
    .addItemOutput(<solarflux:custom_solar_panel_solar_panel_order> * 4)
    .build();

//攻击伤害
var evolvedUpdatableAttackDamage as IItemStack[] = [
    <moretcon:blaxe>,
    <moretcon:blsword>,
    <moretcon:blbow>,
    <plustic:laser_gun>,
    <plustic:katana>,
    <tcomplement:chisel>,
    <totaltinkers:explosive_bow>,
    <totaltinkers:scimitar>,
    <totaltinkers:greatblade>,
    <totaltinkers:dagger>,
    <totaltinkers:javelin>,
    <totaltinkers:cutlass>,
    <totaltinkers:battleaxe>,
    <tconstruct:longsword>,
    <tconstruct:rapier>,
    <tconstruct:frypan>,
    <tconstruct:battlesign>,
    <tconstruct:cleaver>,
    <tconstruct:broadsword>,
    <tconstruct:scythe>,
    <tconstruct:hammer>,
    <tconstruct:kama>,
    <tconstruct:hatchet>,
    <tconevo:tool_sceptre>
];
var upgradeAttackDamageNbt as IData = {EvolvedTier: 1, StatsOriginal: {AttackSpeedMultiplier: 1.0 as float, MiningSpeed: 1.0 as float, FreeModifiers: 3, Durability: 1, HarvestLevel: 0, Attack: 2.0 as float}, Unbreakable: 1 as byte, Stats: {AttackSpeedMultiplier: 1.0 as float, MiningSpeed: 1.0 as float, FreeModifiers: 5, Durability: 1, HarvestLevel: 0, Attack: 2.0 as float}, Special: {Categories: ["weapon", "tool"]}, Modifiers: [{identifier: "toolleveling", color: 16777215, level: 1}, {identifier: "tconevo.evolved", color: 13146868, level: 1}, {identifier: "tconevo.draconic_energy", color: 43690, level: 1}, {identifier: "tconevo.draconic_attack_damage", color: 43690, level: 5}, {identifier: "tconevo.draconic_attack_aoe", color: 43690, level: 1}, {identifier: "leveling_durability", color: 16777215, level: 1}], TinkerData: {Modifiers: ["toolleveling", "tconevo.evolved", "tconevo.draconic_energy", "tconevo.draconic_attack_damage", "tconevo.draconic_attack_aoe"]}, Traits: ["toolleveling", "tconevo.evolved", "tconevo.draconic_energy", "tconevo.draconic_attack_damage", "tconevo.draconic_attack_aoe", "leveling_durability"]};
var upgradeAttackDamageNew as IData = {EvolvedTier: 1, StatsOriginal: {AttackSpeedMultiplier: 1.0 as float, MiningSpeed: 1.0 as float, FreeModifiers: 3, Durability: 1, HarvestLevel: 0, Attack: 2.0 as float}, Unbreakable: 1 as byte, Stats: {AttackSpeedMultiplier: 1.0 as float, MiningSpeed: 1.0 as float, FreeModifiers: 5, Durability: 1, HarvestLevel: 0, Attack: 2.0 as float}, Special: {Categories: ["weapon", "tool"]}, Modifiers: [{identifier: "toolleveling", color: 16777215, level: 1}, {identifier: "tconevo.evolved", color: 13146868, level: 1}, {identifier: "tconevo.draconic_energy", color: 43690, level: 1}, {identifier: "tconevo.draconic_attack_damage", color: 43690, level: 6}, {identifier: "tconevo.draconic_attack_aoe", color: 43690, level: 1}, {identifier: "leveling_durability", color: 16777215, level: 1}], TinkerData: {Modifiers: ["toolleveling", "tconevo.evolved", "tconevo.draconic_energy", "tconevo.draconic_attack_damage", "tconevo.draconic_attack_aoe"]}, Traits: ["toolleveling", "tconevo.evolved", "tconevo.draconic_energy", "tconevo.draconic_attack_damage", "tconevo.draconic_attack_aoe", "leveling_durability"]};
for ticItem in evolvedUpdatableAttackDamage {
var upgradeAttackDamage = RecipeBuilder.newBuilder("fusion_tic_tools_damage" + ticItem.definition.id, "order_fusioner", 256);
upgradeAttackDamage.addItemInput(<gct_ores:stormy_core> * 2);
upgradeAttackDamage.addItemInput(<draconicevolution:chaotic_core> * 2);
upgradeAttackDamage.addItemInput(<gct_ores:ordered_core> * 1);
upgradeAttackDamage.addItemInput(<contenttweaker:chaos_heart> * 1);
upgradeAttackDamage.addItemInput(<ageofminecraft:withered_nether_star> * 1);
upgradeAttackDamage.addItemInput(<gct_ores:order_crystal> * 2);
upgradeAttackDamage.addItemInput(ticItem * 1).setPreViewNBT(upgradeAttackDamageNbt).setNBTChecker(function(ctrl as IMachineController, item as IItemStack) {
    if (TicTraitLib.hasTicTrait(item, "tconevo.draconic_attack_damage")) {
        if (TicTraitLib.getTraitLevel(item, "tconevo.draconic_attack_damage") == 5) {
            if (isNull(item.tag.EvolvedTierExtra)) return false;
            if (item.tag.EvolvedTierExtra as int < 4) {
                return false;
            }
        }
    }
    if (TicTraitLib.hasTicTrait(item, "tconevo.draconic_attack_damage")) {
        if (TicTraitLib.getTraitLevel(item, "tconevo.draconic_attack_damage") == 5) {
            ctrl.customData = item.tag as IData;
            return true;
        }
    }
    return false;
});
upgradeAttackDamage.addItemInput(<draconicevolution:tool_upgrade:3> * 1);
upgradeAttackDamage.addEnergyPerTickInput(128000000);
upgradeAttackDamage.addItemOutput(ticItem * 1).setPreViewNBT(upgradeAttackDamageNew).addItemModifier(function(ctrl as IMachineController, oldItem as IItemStack) as IItemStack {
    var nbt as IData = ctrl.customData as IData;
    var traits as IData = nbt.Modifiers;
    var remove as IData = [{identifier: "tconevo.draconic_attack_damage", color: 43690, level: 5}];
    var add as IData = [{identifier: "tconevo.draconic_attack_damage", color: 43690, level: 6}];
    traits = traits.deepUpdate(remove, REMOVE);
    traits = traits.deepUpdate(add, APPEND);
    nbt = nbt.update({Modifiers : traits});
    print(nbt.asString());
    return ticItem.withTag(nbt);
});
upgradeAttackDamage.addItemOutput(<draconicevolution:tool_upgrade:3> * 1);
upgradeAttackDamage.addRecipeTooltip("§f请使用§b秩序§f及以上等级的龙研材料进行升级");
upgradeAttackDamage.build();
}

//攻击距离
var evolvedUpdatableAttackRange as IItemStack[] = [
    <moretcon:blaxe>,
    <moretcon:blsword>,
    <moretcon:blbow>,
    <plustic:laser_gun>,
    <plustic:katana>,
    <tcomplement:chisel>,
    <totaltinkers:explosive_bow>,
    <totaltinkers:scimitar>,
    <totaltinkers:greatblade>,
    <totaltinkers:dagger>,
    <totaltinkers:javelin>,
    <totaltinkers:cutlass>,
    <totaltinkers:battleaxe>,
    <tconstruct:longsword>,
    <tconstruct:rapier>,
    <tconstruct:frypan>,
    <tconstruct:battlesign>,
    <tconstruct:cleaver>,
    <tconstruct:broadsword>,
    <tconstruct:scythe>,
    <tconstruct:hammer>,
    <tconstruct:kama>,
    <tconstruct:hatchet>,
    <tconevo:tool_sceptre>
];
var upgradeAttackRangeNbt as IData = {EvolvedTier: 1, StatsOriginal: {AttackSpeedMultiplier: 1.0 as float, MiningSpeed: 1.0 as float, FreeModifiers: 3, Durability: 1, HarvestLevel: 0, Attack: 2.0 as float}, Unbreakable: 1 as byte, Stats: {AttackSpeedMultiplier: 1.0 as float, MiningSpeed: 1.0 as float, FreeModifiers: 5, Durability: 1, HarvestLevel: 0, Attack: 2.0 as float}, Special: {Categories: ["weapon", "tool"]}, Modifiers: [{identifier: "toolleveling", color: 16777215, level: 1}, {identifier: "tconevo.evolved", color: 13146868, level: 1}, {identifier: "tconevo.draconic_energy", color: 43690, level: 1}, {identifier: "tconevo.draconic_attack_damage", color: 43690, level: 1}, {identifier: "tconevo.draconic_attack_aoe", color: 43690, level: 5}, {identifier: "leveling_durability", color: 16777215, level: 1}], TinkerData: {Modifiers: ["toolleveling", "tconevo.evolved", "tconevo.draconic_energy", "tconevo.draconic_attack_damage", "tconevo.draconic_attack_aoe"]}, Traits: ["toolleveling", "tconevo.evolved", "tconevo.draconic_energy", "tconevo.draconic_attack_damage", "tconevo.draconic_attack_aoe", "leveling_durability"]};
var upgradeAttackRangeNew as IData = {EvolvedTier: 1, StatsOriginal: {AttackSpeedMultiplier: 1.0 as float, MiningSpeed: 1.0 as float, FreeModifiers: 3, Durability: 1, HarvestLevel: 0, Attack: 2.0 as float}, Unbreakable: 1 as byte, Stats: {AttackSpeedMultiplier: 1.0 as float, MiningSpeed: 1.0 as float, FreeModifiers: 5, Durability: 1, HarvestLevel: 0, Attack: 2.0 as float}, Special: {Categories: ["weapon", "tool"]}, Modifiers: [{identifier: "toolleveling", color: 16777215, level: 1}, {identifier: "tconevo.evolved", color: 13146868, level: 1}, {identifier: "tconevo.draconic_energy", color: 43690, level: 1}, {identifier: "tconevo.draconic_attack_damage", color: 43690, level: 1}, {identifier: "tconevo.draconic_attack_aoe", color: 43690, level: 6}, {identifier: "leveling_durability", color: 16777215, level: 1}], TinkerData: {Modifiers: ["toolleveling", "tconevo.evolved", "tconevo.draconic_energy", "tconevo.draconic_attack_damage", "tconevo.draconic_attack_aoe"]}, Traits: ["toolleveling", "tconevo.evolved", "tconevo.draconic_energy", "tconevo.draconic_attack_damage", "tconevo.draconic_attack_aoe", "leveling_durability"]};
for ticItem in evolvedUpdatableAttackRange {
var upgradeAttackDamage = RecipeBuilder.newBuilder("fusion_tic_tools_range" + ticItem.definition.id, "order_fusioner", 256);
upgradeAttackDamage.addItemInput(<gct_ores:stormy_core> * 2);
upgradeAttackDamage.addItemInput(<draconicevolution:chaotic_core> * 2);
upgradeAttackDamage.addItemInput(<gct_ores:ordered_core> * 1);
upgradeAttackDamage.addItemInput(<contenttweaker:chaos_heart> * 1);
upgradeAttackDamage.addItemInput(<ageofminecraft:withered_nether_star> * 1);
upgradeAttackDamage.addItemInput(<gct_ores:order_crystal> * 2);
upgradeAttackDamage.addItemInput(ticItem * 1).setPreViewNBT(upgradeAttackRangeNbt).setNBTChecker(function(ctrl as IMachineController, item as IItemStack) {
    if (TicTraitLib.hasTicTrait(item, "tconevo.draconic_attack_aoe")) {
        if (TicTraitLib.getTraitLevel(item, "tconevo.draconic_attack_aoe") == 5) {
            if (isNull(item.tag.EvolvedTierExtra)) return false;
            if (item.tag.EvolvedTierExtra as int < 4) {
                return false;
            }
        }
    }
    if (TicTraitLib.hasTicTrait(item, "tconevo.draconic_attack_aoe")) {
        if (TicTraitLib.getTraitLevel(item, "tconevo.draconic_attack_aoe") == 5) {
            ctrl.customData = item.tag as IData;
            return true;
        }
    }
    return false;
});
upgradeAttackDamage.addItemInput(<draconicevolution:tool_upgrade:4> * 1);
upgradeAttackDamage.addEnergyPerTickInput(128000000);
upgradeAttackDamage.addItemOutput(ticItem * 1).setPreViewNBT(upgradeAttackRangeNew).addItemModifier(function(ctrl as IMachineController, oldItem as IItemStack) as IItemStack {
    var nbt as IData = ctrl.customData as IData;
    var traits as IData = nbt.Modifiers;
    var remove as IData = [{identifier: "tconevo.draconic_attack_aoe", color: 43690, level: 5}];
    var add as IData = [{identifier: "tconevo.draconic_attack_aoe", color: 43690, level: 6}];
    traits = traits.deepUpdate(remove, REMOVE);
    traits = traits.deepUpdate(add, APPEND);
    nbt = nbt.update({Modifiers : traits});
    print(nbt.asString());
    return ticItem.withTag(nbt);
});
upgradeAttackDamage.addItemOutput(<draconicevolution:tool_upgrade:4> * 1);
upgradeAttackDamage.addRecipeTooltip("§f请使用§b秩序§f及以上等级的龙研材料进行升级");
upgradeAttackDamage.build();
}

//挖掘速度
var evolvedUpdatableMiningSpeed as IItemStack[] = [
    <moretcon:blaxe>,
    <moretcon:blshovel>,
    <moretcon:blpick>,
    <tconstruct:pickaxe>,
    <tconstruct:shovel>,
    <tconstruct:hatchet>,
    <tconstruct:mattock>,
    <tconstruct:kama>,
    <tconstruct:hammer>,
    <tconstruct:excavator>,
    <tconstruct:scythe>,
    <tconstruct:lumberaxe>
];
var upgradeMiningSpeedNbt as IData = {EvolvedTier: 1, StatsOriginal: {AttackSpeedMultiplier: 1.0 as float, MiningSpeed: 1.0 as float, FreeModifiers: 3, Durability: 1, HarvestLevel: 0, Attack: 1.0 as float}, Unbreakable: 1 as byte, Stats: {AttackSpeedMultiplier: 1.0 as float, MiningSpeed: 1.0 as float, FreeModifiers: 5, Durability: 1, HarvestLevel: 0, Attack: 1.0 as float}, Special: {Categories: ["tool", "aoe", "harvest"]}, Modifiers: [{identifier: "toolleveling", color: 16777215, level: 1}, {identifier: "tconevo.evolved", color: 13146868, level: 1}, {identifier: "tconevo.draconic_energy", color: 43690, level: 1}, {identifier: "tconevo.draconic_dig_speed", color: 43690, level: 5}, {identifier: "tconevo.draconic_dig_aoe", color: 43690, level: 1}, {identifier: "leveling_durability", color: 16777215, level: 1}], TinkerData: {Modifiers: ["toolleveling", "tconevo.evolved", "tconevo.draconic_energy", "tconevo.draconic_dig_speed", "tconevo.draconic_dig_aoe"]}, Traits: ["toolleveling", "tconevo.evolved", "tconevo.draconic_energy", "tconevo.draconic_dig_speed", "tconevo.draconic_dig_aoe", "leveling_durability"]};
var upgradeMiningSpeedNew as IData = {EvolvedTier: 1, StatsOriginal: {AttackSpeedMultiplier: 1.0 as float, MiningSpeed: 1.0 as float, FreeModifiers: 3, Durability: 1, HarvestLevel: 0, Attack: 1.0 as float}, Unbreakable: 1 as byte, Stats: {AttackSpeedMultiplier: 1.0 as float, MiningSpeed: 1.0 as float, FreeModifiers: 5, Durability: 1, HarvestLevel: 0, Attack: 1.0 as float}, Special: {Categories: ["tool", "aoe", "harvest"]}, Modifiers: [{identifier: "toolleveling", color: 16777215, level: 1}, {identifier: "tconevo.evolved", color: 13146868, level: 1}, {identifier: "tconevo.draconic_energy", color: 43690, level: 1}, {identifier: "tconevo.draconic_dig_speed", color: 43690, level: 6}, {identifier: "tconevo.draconic_dig_aoe", color: 43690, level: 1}, {identifier: "leveling_durability", color: 16777215, level: 1}], TinkerData: {Modifiers: ["toolleveling", "tconevo.evolved", "tconevo.draconic_energy", "tconevo.draconic_dig_speed", "tconevo.draconic_dig_aoe"]}, Traits: ["toolleveling", "tconevo.evolved", "tconevo.draconic_energy", "tconevo.draconic_dig_speed", "tconevo.draconic_dig_aoe", "leveling_durability"]};
for ticItem in evolvedUpdatableMiningSpeed {
var upgradeAttackDamage = RecipeBuilder.newBuilder("fusion_tic_tools_mine" + ticItem.definition.id, "order_fusioner", 256);
upgradeAttackDamage.addItemInput(<gct_ores:stormy_core> * 2);
upgradeAttackDamage.addItemInput(<draconicevolution:chaotic_core> * 2);
upgradeAttackDamage.addItemInput(<gct_ores:ordered_core> * 1);
upgradeAttackDamage.addItemInput(<contenttweaker:chaos_heart> * 1);
upgradeAttackDamage.addItemInput(<ageofminecraft:withered_nether_star> * 1);
upgradeAttackDamage.addItemInput(<gct_ores:order_crystal> * 2);
upgradeAttackDamage.addItemInput(ticItem * 1).setPreViewNBT(upgradeMiningSpeedNbt).setNBTChecker(function(ctrl as IMachineController, item as IItemStack) {
    if (TicTraitLib.hasTicTrait(item, "tconevo.draconic_dig_speed")) {
        if (TicTraitLib.getTraitLevel(item, "tconevo.draconic_dig_speed") == 5) {
            if (isNull(item.tag.EvolvedTierExtra)) return false;
            if (item.tag.EvolvedTierExtra as int < 4) {
                return false;
            }
        }
    }
    if (TicTraitLib.hasTicTrait(item, "tconevo.draconic_dig_speed")) {
        if (TicTraitLib.getTraitLevel(item, "tconevo.draconic_dig_speed") == 5) {
            ctrl.customData = item.tag as IData;
            return true;
        }
    }
    return false;
});
upgradeAttackDamage.addItemInput(<draconicevolution:tool_upgrade:1> * 1);
upgradeAttackDamage.addEnergyPerTickInput(128000000);
upgradeAttackDamage.addItemOutput(ticItem * 1).setPreViewNBT(upgradeMiningSpeedNew).addItemModifier(function(ctrl as IMachineController, oldItem as IItemStack) as IItemStack {
    var nbt as IData = ctrl.customData as IData;
    var traits as IData = nbt.Modifiers;
    var remove as IData = [{identifier: "tconevo.draconic_dig_speed", color: 43690, level: 5}];
    var add as IData = [{identifier: "tconevo.draconic_dig_speed", color: 43690, level: 6}];
    traits = traits.deepUpdate(remove, REMOVE);
    traits = traits.deepUpdate(add, APPEND);
    nbt = nbt.update({Modifiers : traits});
    print(nbt.asString());
    return ticItem.withTag(nbt);
});
upgradeAttackDamage.addItemOutput(<draconicevolution:tool_upgrade:1> * 1);
upgradeAttackDamage.addRecipeTooltip("§f请使用§b秩序§f及以上等级的龙研材料进行升级");
upgradeAttackDamage.build();
}

//挖掘范围
var evolvedUpdatableMiningRange as IItemStack[] = [
    <moretcon:blaxe>,
    <moretcon:blshovel>,
    <moretcon:blpick>,
    <tconstruct:pickaxe>,
    <tconstruct:shovel>,
    <tconstruct:hatchet>,
    <tconstruct:mattock>,
    <tconstruct:kama>,
    <tconstruct:hammer>,
    <tconstruct:excavator>,
    <tconstruct:scythe>,
    <tconstruct:lumberaxe>
];
var upgradeMiningRangeNbt as IData = {EvolvedTier: 1, StatsOriginal: {AttackSpeedMultiplier: 1.0 as float, MiningSpeed: 1.0 as float, FreeModifiers: 3, Durability: 1, HarvestLevel: 0, Attack: 1.0 as float}, Unbreakable: 1 as byte, Stats: {AttackSpeedMultiplier: 1.0 as float, MiningSpeed: 1.0 as float, FreeModifiers: 5, Durability: 1, HarvestLevel: 0, Attack: 1.0 as float}, Special: {Categories: ["tool", "aoe", "harvest"]}, Modifiers: [{identifier: "toolleveling", color: 16777215, level: 1}, {identifier: "tconevo.evolved", color: 13146868, level: 1}, {identifier: "tconevo.draconic_energy", color: 43690, level: 1}, {identifier: "tconevo.draconic_dig_speed", color: 43690, level: 1}, {identifier: "tconevo.draconic_dig_aoe", color: 43690, level: 5}, {identifier: "leveling_durability", color: 16777215, level: 1}], TinkerData: {Modifiers: ["toolleveling", "tconevo.evolved", "tconevo.draconic_energy", "tconevo.draconic_dig_speed", "tconevo.draconic_dig_aoe"]}, Traits: ["toolleveling", "tconevo.evolved", "tconevo.draconic_energy", "tconevo.draconic_dig_speed", "tconevo.draconic_dig_aoe", "leveling_durability"]};
var upgradeMiningRangeNew as IData = {EvolvedTier: 1, StatsOriginal: {AttackSpeedMultiplier: 1.0 as float, MiningSpeed: 1.0 as float, FreeModifiers: 3, Durability: 1, HarvestLevel: 0, Attack: 1.0 as float}, Unbreakable: 1 as byte, Stats: {AttackSpeedMultiplier: 1.0 as float, MiningSpeed: 1.0 as float, FreeModifiers: 5, Durability: 1, HarvestLevel: 0, Attack: 1.0 as float}, Special: {Categories: ["tool", "aoe", "harvest"]}, Modifiers: [{identifier: "toolleveling", color: 16777215, level: 1}, {identifier: "tconevo.evolved", color: 13146868, level: 1}, {identifier: "tconevo.draconic_energy", color: 43690, level: 1}, {identifier: "tconevo.draconic_dig_speed", color: 43690, level: 1}, {identifier: "tconevo.draconic_dig_aoe", color: 43690, level: 6}, {identifier: "leveling_durability", color: 16777215, level: 1}], TinkerData: {Modifiers: ["toolleveling", "tconevo.evolved", "tconevo.draconic_energy", "tconevo.draconic_dig_speed", "tconevo.draconic_dig_aoe"]}, Traits: ["toolleveling", "tconevo.evolved", "tconevo.draconic_energy", "tconevo.draconic_dig_speed", "tconevo.draconic_dig_aoe", "leveling_durability"]};
for ticItem in evolvedUpdatableMiningRange {
var upgradeAttackDamage = RecipeBuilder.newBuilder("fusion_tic_tools_dig" + ticItem.definition.id, "order_fusioner", 256);
upgradeAttackDamage.addItemInput(<gct_ores:stormy_core> * 2);
upgradeAttackDamage.addItemInput(<draconicevolution:chaotic_core> * 2);
upgradeAttackDamage.addItemInput(<gct_ores:ordered_core> * 1);
upgradeAttackDamage.addItemInput(<contenttweaker:chaos_heart> * 1);
upgradeAttackDamage.addItemInput(<ageofminecraft:withered_nether_star> * 1);
upgradeAttackDamage.addItemInput(<gct_ores:order_crystal> * 2);
upgradeAttackDamage.addItemInput(ticItem * 1).setPreViewNBT(upgradeMiningRangeNbt).setNBTChecker(function(ctrl as IMachineController, item as IItemStack) {
    if (TicTraitLib.hasTicTrait(item, "tconevo.draconic_dig_aoe")) {
        if (TicTraitLib.getTraitLevel(item, "tconevo.draconic_dig_aoe") == 5) {
            if (isNull(item.tag.EvolvedTierExtra)) return false;
            if (item.tag.EvolvedTierExtra as int < 4) {
                return false;
            }
        }
    }
    if (TicTraitLib.hasTicTrait(item, "tconevo.draconic_dig_aoe")) {
        if (TicTraitLib.getTraitLevel(item, "tconevo.draconic_dig_aoe") == 5) {
            ctrl.customData = item.tag as IData;
            return true;
        }
    }
    return false;
});
upgradeAttackDamage.addItemInput(<draconicevolution:tool_upgrade:2> * 1);
upgradeAttackDamage.addEnergyPerTickInput(128000000);
upgradeAttackDamage.addItemOutput(ticItem * 1).setPreViewNBT(upgradeMiningRangeNew).addItemModifier(function(ctrl as IMachineController, oldItem as IItemStack) as IItemStack {
    var nbt as IData = ctrl.customData as IData;
    var traits as IData = nbt.Modifiers;
    var remove as IData = [{identifier: "tconevo.draconic_dig_aoe", color: 43690, level: 5}];
    var add as IData = [{identifier: "tconevo.draconic_dig_aoe", color: 43690, level: 6}];
    traits = traits.deepUpdate(remove, REMOVE);
    traits = traits.deepUpdate(add, APPEND);
    nbt = nbt.update({Modifiers : traits});
    print(nbt.asString());
    return ticItem.withTag(nbt);
});
upgradeAttackDamage.addItemOutput(<draconicevolution:tool_upgrade:2> * 1);
upgradeAttackDamage.addRecipeTooltip("§f请使用§b秩序§f及以上等级的龙研材料进行升级");
upgradeAttackDamage.build();
}

//箭矢伤害
var evolvedUpdatableArrowDamage as IItemStack[] = [
    <tconstruct:arrow>,
    <tconstruct:bolt>,
    <tconstruct:shuriken>,
    <totaltinkers:javelin>
];
var upgradeArrowDamageNbt as IData = {EvolvedTier: 1, StatsOriginal: {AttackSpeedMultiplier: 1.0 as float, Accuracy: 1.0 as float, MiningSpeed: 1.0 as float, FreeModifiers: 3, Durability: 1, HarvestLevel: 0, Attack: 3.0 as float}, Unbreakable: 1 as byte, Stats: {AttackSpeedMultiplier: 1.0 as float, Accuracy: 1.0 as float, MiningSpeed: 1.0 as float, FreeModifiers: 5, Durability: 1, HarvestLevel: 0, Attack: 3.0 as float, Broken: 1 as byte}, Special: {Categories: ["tool", "no_melee", "projectile"]}, Modifiers: [{identifier: "toolleveling", color: 16777215, level: 1}, {identifier: "tconevo.evolved", color: 13146868, level: 1}, {identifier: "tconevo.draconic_energy", color: 43690, level: 1}, {identifier: "tconevo.draconic_arrow_damage", color: 43690, level: 5}, {identifier: "leveling_durability", color: 16777215, level: 1}], TinkerData: {Modifiers: ["toolleveling", "tconevo.evolved", "tconevo.draconic_energy", "tconevo.draconic_arrow_damage"]}, Traits: ["toolleveling", "tconevo.evolved", "tconevo.draconic_energy", "tconevo.draconic_arrow_damage", "leveling_durability"]};
var upgradeArrowDamageNew as IData = {EvolvedTier: 1, StatsOriginal: {AttackSpeedMultiplier: 1.0 as float, Accuracy: 1.0 as float, MiningSpeed: 1.0 as float, FreeModifiers: 3, Durability: 1, HarvestLevel: 0, Attack: 3.0 as float}, Unbreakable: 1 as byte, Stats: {AttackSpeedMultiplier: 1.0 as float, Accuracy: 1.0 as float, MiningSpeed: 1.0 as float, FreeModifiers: 5, Durability: 1, HarvestLevel: 0, Attack: 3.0 as float, Broken: 1 as byte}, Special: {Categories: ["tool", "no_melee", "projectile"]}, Modifiers: [{identifier: "toolleveling", color: 16777215, level: 1}, {identifier: "tconevo.evolved", color: 13146868, level: 1}, {identifier: "tconevo.draconic_energy", color: 43690, level: 1}, {identifier: "tconevo.draconic_arrow_damage", color: 43690, level: 6}, {identifier: "leveling_durability", color: 16777215, level: 1}], TinkerData: {Modifiers: ["toolleveling", "tconevo.evolved", "tconevo.draconic_energy", "tconevo.draconic_arrow_damage"]}, Traits: ["toolleveling", "tconevo.evolved", "tconevo.draconic_energy", "tconevo.draconic_arrow_damage", "leveling_durability"]};
for ticItem in evolvedUpdatableArrowDamage {
var upgradeAttackDamage = RecipeBuilder.newBuilder("fusion_tic_tools_arrow" + ticItem.definition.id, "order_fusioner", 256);
upgradeAttackDamage.addItemInput(<gct_ores:stormy_core> * 2);
upgradeAttackDamage.addItemInput(<draconicevolution:chaotic_core> * 2);
upgradeAttackDamage.addItemInput(<gct_ores:ordered_core> * 1);
upgradeAttackDamage.addItemInput(<contenttweaker:chaos_heart> * 1);
upgradeAttackDamage.addItemInput(<ageofminecraft:withered_nether_star> * 1);
upgradeAttackDamage.addItemInput(<gct_ores:order_crystal> * 2);
upgradeAttackDamage.addItemInput(ticItem * 1).setPreViewNBT(upgradeArrowDamageNbt).setNBTChecker(function(ctrl as IMachineController, item as IItemStack) {
    if (TicTraitLib.hasTicTrait(item, "tconevo.draconic_arrow_damage")) {
        if (TicTraitLib.getTraitLevel(item, "tconevo.draconic_arrow_damage") == 5) {
            if (isNull(item.tag.EvolvedTierExtra)) return false;
            if (item.tag.EvolvedTierExtra as int < 4) {
                return false;
            }
        }
    }
    if (TicTraitLib.hasTicTrait(item, "tconevo.draconic_arrow_damage")) {
        if (TicTraitLib.getTraitLevel(item, "tconevo.draconic_arrow_damage") == 5) {
            ctrl.customData = item.tag as IData;
            return true;
        }
    }
    return false;
});
upgradeAttackDamage.addItemInput(<draconicevolution:tool_upgrade:5> * 1);
upgradeAttackDamage.addEnergyPerTickInput(128000000);
upgradeAttackDamage.addItemOutput(ticItem * 1).setPreViewNBT(upgradeArrowDamageNew).addItemModifier(function(ctrl as IMachineController, oldItem as IItemStack) as IItemStack {
    var nbt as IData = ctrl.customData as IData;
    var traits as IData = nbt.Modifiers;
    var remove as IData = [{identifier: "tconevo.draconic_arrow_damage", color: 43690, level: 5}];
    var add as IData = [{identifier: "tconevo.draconic_arrow_damage", color: 43690, level: 6}];
    traits = traits.deepUpdate(remove, REMOVE);
    traits = traits.deepUpdate(add, APPEND);
    nbt = nbt.update({Modifiers : traits});
    print(nbt.asString());
    return ticItem.withTag(nbt);
});
upgradeAttackDamage.addItemOutput(<draconicevolution:tool_upgrade:5> * 1);
upgradeAttackDamage.addRecipeTooltip("§f请使用§b秩序§f及以上等级的龙研材料进行升级");
upgradeAttackDamage.build();
}

//拉弓速度
var evolvedUpdatableBowSpeed as IItemStack[] = [
    <tconstruct:shortbow>,
    <tconstruct:longbow>,
    <tconstruct:crossbow>,
    <tconevo:tool_sceptre>,
    <totaltinkers:explosive_bow>,
    <moretcon:blbow>,
    <tconevo:tool_sceptre>
];
var upgradeBowSpeedNbt as IData = {EvolvedTier: 1, StatsOriginal: {AttackSpeedMultiplier: 1.0 as float, MiningSpeed: 1.0 as float, DrawSpeed: 1.0 as float, FreeModifiers: 3, ProjectileBonusDamage: 0.0 as float, Durability: 1, HarvestLevel: 0, Attack: 1.0 as float, Range: 1.0 as float}, Unbreakable: 1 as byte, Stats: {AttackSpeedMultiplier: 1.0 as float, MiningSpeed: 1.0 as float, DrawSpeed: 1.0 as float, FreeModifiers: 5, ProjectileBonusDamage: 0.0 as float, Durability: 1, HarvestLevel: 0, Attack: 1.0 as float, Range: 1.0 as float}, Special: {Categories: ["tool", "launcher"]}, Modifiers: [{identifier: "toolleveling", color: 16777215, level: 1}, {identifier: "tconevo.evolved", color: 13146868, level: 1}, {identifier: "tconevo.draconic_energy", color: 43690, level: 1}, {identifier: "tconevo.draconic_draw_speed", color: 43690, level: 5}, {identifier: "tconevo.draconic_arrow_speed", color: 43690, level: 1}, {identifier: "leveling_durability", color: 16777215, level: 1}], TinkerData: {Modifiers: ["toolleveling", "tconevo.evolved", "tconevo.draconic_energy", "tconevo.draconic_draw_speed", "tconevo.draconic_arrow_speed"]}, Traits: ["toolleveling", "tconevo.evolved", "tconevo.draconic_energy", "tconevo.draconic_draw_speed", "tconevo.draconic_arrow_speed", "leveling_durability"]};
var upgradeBowSpeedNew as IData = {EvolvedTier: 1, StatsOriginal: {AttackSpeedMultiplier: 1.0 as float, MiningSpeed: 1.0 as float, DrawSpeed: 1.0 as float, FreeModifiers: 3, ProjectileBonusDamage: 0.0 as float, Durability: 1, HarvestLevel: 0, Attack: 1.0 as float, Range: 1.0 as float}, Unbreakable: 1 as byte, Stats: {AttackSpeedMultiplier: 1.0 as float, MiningSpeed: 1.0 as float, DrawSpeed: 1.0 as float, FreeModifiers: 5, ProjectileBonusDamage: 0.0 as float, Durability: 1, HarvestLevel: 0, Attack: 1.0 as float, Range: 1.0 as float}, Special: {Categories: ["tool", "launcher"]}, Modifiers: [{identifier: "toolleveling", color: 16777215, level: 1}, {identifier: "tconevo.evolved", color: 13146868, level: 1}, {identifier: "tconevo.draconic_energy", color: 43690, level: 1}, {identifier: "tconevo.draconic_draw_speed", color: 43690, level: 6}, {identifier: "tconevo.draconic_arrow_speed", color: 43690, level: 1}, {identifier: "leveling_durability", color: 16777215, level: 1}], TinkerData: {Modifiers: ["toolleveling", "tconevo.evolved", "tconevo.draconic_energy", "tconevo.draconic_draw_speed", "tconevo.draconic_arrow_speed"]}, Traits: ["toolleveling", "tconevo.evolved", "tconevo.draconic_energy", "tconevo.draconic_draw_speed", "tconevo.draconic_arrow_speed", "leveling_durability"]};
for ticItem in evolvedUpdatableBowSpeed {
var upgradeAttackDamage = RecipeBuilder.newBuilder("fusion_tic_tools_bow" + ticItem.definition.id, "order_fusioner", 256);
upgradeAttackDamage.addItemInput(<gct_ores:stormy_core> * 2);
upgradeAttackDamage.addItemInput(<draconicevolution:chaotic_core> * 2);
upgradeAttackDamage.addItemInput(<gct_ores:ordered_core> * 1);
upgradeAttackDamage.addItemInput(<contenttweaker:chaos_heart> * 1);
upgradeAttackDamage.addItemInput(<ageofminecraft:withered_nether_star> * 1);
upgradeAttackDamage.addItemInput(<gct_ores:order_crystal> * 2);
upgradeAttackDamage.addItemInput(ticItem * 1).setPreViewNBT(upgradeBowSpeedNbt).setNBTChecker(function(ctrl as IMachineController, item as IItemStack) {
    if (TicTraitLib.hasTicTrait(item, "tconevo.draconic_draw_speed")) {
        if (TicTraitLib.getTraitLevel(item, "tconevo.draconic_draw_speed") == 5) {
            if (isNull(item.tag.EvolvedTierExtra)) return false;
            if (item.tag.EvolvedTierExtra as int < 4) {
                return false;
            }
        }
    }
    if (TicTraitLib.hasTicTrait(item, "tconevo.draconic_draw_speed")) {
        if (TicTraitLib.getTraitLevel(item, "tconevo.draconic_draw_speed") == 5) {
            ctrl.customData = item.tag as IData;
            return true;
        }
    }
    return false;
});
upgradeAttackDamage.addItemInput(<draconicevolution:tool_upgrade:6> * 1);
upgradeAttackDamage.addEnergyPerTickInput(128000000);
upgradeAttackDamage.addItemOutput(ticItem * 1).setPreViewNBT(upgradeBowSpeedNew).addItemModifier(function(ctrl as IMachineController, oldItem as IItemStack) as IItemStack {
    var nbt as IData = ctrl.customData as IData;
    var traits as IData = nbt.Modifiers;
    var remove as IData = [{identifier: "tconevo.draconic_draw_speed", color: 43690, level: 5}];
    var add as IData = [{identifier: "tconevo.draconic_draw_speed", color: 43690, level: 6}];
    traits = traits.deepUpdate(remove, REMOVE);
    traits = traits.deepUpdate(add, APPEND);
    nbt = nbt.update({Modifiers : traits});
    print(nbt.asString());
    return ticItem.withTag(nbt);
});
upgradeAttackDamage.addItemOutput(<draconicevolution:tool_upgrade:6> * 1);
upgradeAttackDamage.addRecipeTooltip("§f请使用§b秩序§f及以上等级的龙研材料进行升级");
upgradeAttackDamage.build();
}

//箭矢速度
var evolvedUpdatableArrowSpeed as IItemStack[] = [
    <tconstruct:shortbow>,
    <tconstruct:longbow>,
    <tconstruct:crossbow>,
    <tconevo:tool_sceptre>,
    <totaltinkers:explosive_bow>,
    <moretcon:blbow>,
    <tconevo:tool_sceptre>
];
var upgradeArrowSpeedNbt as IData = {EvolvedTier: 1, StatsOriginal: {AttackSpeedMultiplier: 1.0 as float, MiningSpeed: 1.0 as float, DrawSpeed: 1.0 as float, FreeModifiers: 3, ProjectileBonusDamage: 0.0 as float, Durability: 1, HarvestLevel: 0, Attack: 1.0 as float, Range: 1.0 as float}, Unbreakable: 1 as byte, Stats: {AttackSpeedMultiplier: 1.0 as float, MiningSpeed: 1.0 as float, DrawSpeed: 1.0 as float, FreeModifiers: 5, ProjectileBonusDamage: 0.0 as float, Durability: 1, HarvestLevel: 0, Attack: 1.0 as float, Range: 1.0 as float}, Special: {Categories: ["tool", "launcher"]}, Modifiers: [{identifier: "toolleveling", color: 16777215, level: 1}, {identifier: "tconevo.evolved", color: 13146868, level: 1}, {identifier: "tconevo.draconic_energy", color: 43690, level: 1}, {identifier: "tconevo.draconic_draw_speed", color: 43690, level: 1}, {identifier: "tconevo.draconic_arrow_speed", color: 43690, level: 5}, {identifier: "leveling_durability", color: 16777215, level: 1}], TinkerData: {Modifiers: ["toolleveling", "tconevo.evolved", "tconevo.draconic_energy", "tconevo.draconic_draw_speed", "tconevo.draconic_arrow_speed"]}, Traits: ["toolleveling", "tconevo.evolved", "tconevo.draconic_energy", "tconevo.draconic_draw_speed", "tconevo.draconic_arrow_speed", "leveling_durability"]};
var upgradeArrowSpeedNew as IData = {EvolvedTier: 1, StatsOriginal: {AttackSpeedMultiplier: 1.0 as float, MiningSpeed: 1.0 as float, DrawSpeed: 1.0 as float, FreeModifiers: 3, ProjectileBonusDamage: 0.0 as float, Durability: 1, HarvestLevel: 0, Attack: 1.0 as float, Range: 1.0 as float}, Unbreakable: 1 as byte, Stats: {AttackSpeedMultiplier: 1.0 as float, MiningSpeed: 1.0 as float, DrawSpeed: 1.0 as float, FreeModifiers: 5, ProjectileBonusDamage: 0.0 as float, Durability: 1, HarvestLevel: 0, Attack: 1.0 as float, Range: 1.0 as float}, Special: {Categories: ["tool", "launcher"]}, Modifiers: [{identifier: "toolleveling", color: 16777215, level: 1}, {identifier: "tconevo.evolved", color: 13146868, level: 1}, {identifier: "tconevo.draconic_energy", color: 43690, level: 1}, {identifier: "tconevo.draconic_draw_speed", color: 43690, level: 1}, {identifier: "tconevo.draconic_arrow_speed", color: 43690, level: 6}, {identifier: "leveling_durability", color: 16777215, level: 1}], TinkerData: {Modifiers: ["toolleveling", "tconevo.evolved", "tconevo.draconic_energy", "tconevo.draconic_draw_speed", "tconevo.draconic_arrow_speed"]}, Traits: ["toolleveling", "tconevo.evolved", "tconevo.draconic_energy", "tconevo.draconic_draw_speed", "tconevo.draconic_arrow_speed", "leveling_durability"]};
for ticItem in evolvedUpdatableArrowSpeed {
var upgradeAttackDamage = RecipeBuilder.newBuilder("fusion_tic_tools_arrowsp" + ticItem.definition.id, "order_fusioner", 256);
upgradeAttackDamage.addItemInput(<gct_ores:stormy_core> * 2);
upgradeAttackDamage.addItemInput(<draconicevolution:chaotic_core> * 2);
upgradeAttackDamage.addItemInput(<gct_ores:ordered_core> * 1);
upgradeAttackDamage.addItemInput(<contenttweaker:chaos_heart> * 1);
upgradeAttackDamage.addItemInput(<ageofminecraft:withered_nether_star> * 1);
upgradeAttackDamage.addItemInput(<gct_ores:order_crystal> * 2);
upgradeAttackDamage.addItemInput(ticItem * 1).setPreViewNBT(upgradeArrowSpeedNbt).setNBTChecker(function(ctrl as IMachineController, item as IItemStack) {
    if (TicTraitLib.hasTicTrait(item, "tconevo.draconic_arrow_speed")) {
        if (TicTraitLib.getTraitLevel(item, "tconevo.draconic_arrow_speed") == 5) {
            if (isNull(item.tag.EvolvedTierExtra)) return false;
            if (item.tag.EvolvedTierExtra as int < 4) {
                return false;
            }
        }
    }
    if (TicTraitLib.hasTicTrait(item, "tconevo.draconic_arrow_speed")) {
        if (TicTraitLib.getTraitLevel(item, "tconevo.draconic_arrow_speed") == 5) {
            ctrl.customData = item.tag as IData;
            return true;
        }
    }
    return false;
});
upgradeAttackDamage.addItemInput(<draconicevolution:tool_upgrade:7> * 1);
upgradeAttackDamage.addEnergyPerTickInput(128000000);
upgradeAttackDamage.addItemOutput(ticItem * 1).setPreViewNBT(upgradeArrowSpeedNew).addItemModifier(function(ctrl as IMachineController, oldItem as IItemStack) as IItemStack {
    var nbt as IData = ctrl.customData as IData;
    var traits as IData = nbt.Modifiers;
    var remove as IData = [{identifier: "tconevo.draconic_arrow_speed", color: 43690, level: 5}];
    var add as IData = [{identifier: "tconevo.draconic_arrow_speed", color: 43690, level: 6}];
    traits = traits.deepUpdate(remove, REMOVE);
    traits = traits.deepUpdate(add, APPEND);
    nbt = nbt.update({Modifiers : traits});
    print(nbt.asString());
    return ticItem.withTag(nbt);
});
upgradeAttackDamage.addItemOutput(<draconicevolution:tool_upgrade:7> * 1);
upgradeAttackDamage.addRecipeTooltip("§f请使用§b秩序§f及以上等级的龙研材料进行升级");
upgradeAttackDamage.build();
}

//护盾充能
var evolvedUpdatableShieldEnergy as IItemStack[] = [
    <conarm:helmet>,
    <conarm:chestplate>,
    <conarm:leggings>,
    <conarm:boots>
];
var upgradeShieldEnergyNbt as IData = {EvolvedTier: 1, StatsOriginal: {Toughness: 0.0 as float, FreeModifiers: 3, Durability: 1, Defense: 0.0 as float}, Unbreakable: 0 as byte, ConArmEvolvedInit: 1 as byte, Stats: {Toughness: 0.0 as float, FreeModifiers: 5, Durability: 1, Defense: 0.0 as float}, ConArmEquipmentSlot: 5, Modifiers: [{identifier: "leveling_armor", color: 16777215, level: 1}, {identifier: "tconevo.evolved_armor", color: 13146868, level: 1}, {identifier: "tconevo.draconic_energy_armor", color: 43690, level: 1}, {identifier: "tconevo.draconic_shield_capacity_armor", color: 43690, level: 5}, {identifier: "tconevo.draconic_shield_recovery_armor", color: 43690, level: 1}, {identifier: "leveling_durability_armor", color: 16777215, level: 1}], TinkerData: {Modifiers: ["leveling_armor", "tconevo.evolved_armor", "tconevo.draconic_energy_armor", "tconevo.draconic_shield_capacity_armor", "tconevo.draconic_shield_recovery_armor"]}, Traits: ["leveling_armor", "tconevo.evolved_armor", "tconevo.draconic_energy_armor", "tconevo.draconic_shield_capacity_armor", "tconevo.draconic_shield_recovery_armor", "leveling_durability_armor"]};
var upgradeShieldEnergyNew as IData = {EvolvedTier: 1, StatsOriginal: {Toughness: 0.0 as float, FreeModifiers: 3, Durability: 1, Defense: 0.0 as float}, Unbreakable: 0 as byte, ConArmEvolvedInit: 1 as byte, Stats: {Toughness: 0.0 as float, FreeModifiers: 5, Durability: 1, Defense: 0.0 as float}, ConArmEquipmentSlot: 5, Modifiers: [{identifier: "leveling_armor", color: 16777215, level: 1}, {identifier: "tconevo.evolved_armor", color: 13146868, level: 1}, {identifier: "tconevo.draconic_energy_armor", color: 43690, level: 1}, {identifier: "tconevo.draconic_shield_capacity_armor", color: 43690, level: 6}, {identifier: "tconevo.draconic_shield_recovery_armor", color: 43690, level: 1}, {identifier: "leveling_durability_armor", color: 16777215, level: 1}], TinkerData: {Modifiers: ["leveling_armor", "tconevo.evolved_armor", "tconevo.draconic_energy_armor", "tconevo.draconic_shield_capacity_armor", "tconevo.draconic_shield_recovery_armor"]}, Traits: ["leveling_armor", "tconevo.evolved_armor", "tconevo.draconic_energy_armor", "tconevo.draconic_shield_capacity_armor", "tconevo.draconic_shield_recovery_armor", "leveling_durability_armor"]};
for ticItem in evolvedUpdatableShieldEnergy {
var upgradeAttackDamage = RecipeBuilder.newBuilder("fusion_tic_armors_shield" + ticItem.definition.id, "order_fusioner", 256);
upgradeAttackDamage.addItemInput(<gct_ores:stormy_core> * 2);
upgradeAttackDamage.addItemInput(<draconicevolution:chaotic_core> * 2);
upgradeAttackDamage.addItemInput(<gct_ores:ordered_core> * 1);
upgradeAttackDamage.addItemInput(<contenttweaker:chaos_heart> * 1);
upgradeAttackDamage.addItemInput(<ageofminecraft:withered_nether_star> * 1);
upgradeAttackDamage.addItemInput(<gct_ores:order_crystal> * 2);
upgradeAttackDamage.addItemInput(ticItem * 1).setPreViewNBT(upgradeShieldEnergyNbt).setNBTChecker(function(ctrl as IMachineController, item as IItemStack) {
    if (TicTraitLib.hasTicTrait(item, "tconevo.draconic_shield_capacity_armor")) {
        if (TicTraitLib.getTraitLevel(item, "tconevo.draconic_shield_capacity_armor") == 5) {
            if (isNull(item.tag.EvolvedTierExtra)) return false;
            if (item.tag.EvolvedTierExtra as int < 4) {
                return false;
            }
        }
    }
    if (TicTraitLib.hasTicTrait(item, "tconevo.draconic_shield_capacity_armor")) {
        if (TicTraitLib.getTraitLevel(item, "tconevo.draconic_shield_capacity_armor") == 5) {
            ctrl.customData = item.tag as IData;
            return true;
        }
    }
    return false;
});
upgradeAttackDamage.addItemInput(<draconicevolution:tool_upgrade:8> * 1);
upgradeAttackDamage.addEnergyPerTickInput(128000000);
upgradeAttackDamage.addItemOutput(ticItem * 1).setPreViewNBT(upgradeShieldEnergyNew).addItemModifier(function(ctrl as IMachineController, oldItem as IItemStack) as IItemStack {
    var nbt as IData = ctrl.customData as IData;
    var traits as IData = nbt.Modifiers;
    var remove as IData = [{identifier: "tconevo.draconic_shield_capacity_armor", color: 43690, level: 5}];
    var add as IData = [{identifier: "tconevo.draconic_shield_capacity_armor", color: 43690, level: 6}];
    traits = traits.deepUpdate(remove, REMOVE);
    traits = traits.deepUpdate(add, APPEND);
    nbt = nbt.update({Modifiers : traits});
    print(nbt.asString());
    return ticItem.withTag(nbt);
});
upgradeAttackDamage.addItemOutput(<draconicevolution:tool_upgrade:8> * 1);
upgradeAttackDamage.addRecipeTooltip("§f请使用§b秩序§f及以上等级的龙研材料进行升级");
upgradeAttackDamage.build();
}

//护盾回复
var evolvedUpdatableShieldRecover as IItemStack[] = [
    <conarm:helmet>,
    <conarm:chestplate>,
    <conarm:leggings>,
    <conarm:boots>
];
var upgradeShieldRecoverNbt as IData = {EvolvedTier: 1, StatsOriginal: {Toughness: 0.0 as float, FreeModifiers: 3, Durability: 1, Defense: 0.0 as float}, Unbreakable: 0 as byte, ConArmEvolvedInit: 1 as byte, Stats: {Toughness: 0.0 as float, FreeModifiers: 5, Durability: 1, Defense: 0.0 as float}, ConArmEquipmentSlot: 5, Modifiers: [{identifier: "leveling_armor", color: 16777215, level: 1}, {identifier: "tconevo.evolved_armor", color: 13146868, level: 1}, {identifier: "tconevo.draconic_energy_armor", color: 43690, level: 1}, {identifier: "tconevo.draconic_shield_capacity_armor", color: 43690, level: 1}, {identifier: "tconevo.draconic_shield_recovery_armor", color: 43690, level: 5}, {identifier: "leveling_durability_armor", color: 16777215, level: 1}], TinkerData: {Modifiers: ["leveling_armor", "tconevo.evolved_armor", "tconevo.draconic_energy_armor", "tconevo.draconic_shield_capacity_armor", "tconevo.draconic_shield_recovery_armor"]}, Traits: ["leveling_armor", "tconevo.evolved_armor", "tconevo.draconic_energy_armor", "tconevo.draconic_shield_capacity_armor", "tconevo.draconic_shield_recovery_armor", "leveling_durability_armor"]};
var upgradeShieldRecoverNew as IData = {EvolvedTier: 1, StatsOriginal: {Toughness: 0.0 as float, FreeModifiers: 3, Durability: 1, Defense: 0.0 as float}, Unbreakable: 0 as byte, ConArmEvolvedInit: 1 as byte, Stats: {Toughness: 0.0 as float, FreeModifiers: 5, Durability: 1, Defense: 0.0 as float}, ConArmEquipmentSlot: 5, Modifiers: [{identifier: "leveling_armor", color: 16777215, level: 1}, {identifier: "tconevo.evolved_armor", color: 13146868, level: 1}, {identifier: "tconevo.draconic_energy_armor", color: 43690, level: 1}, {identifier: "tconevo.draconic_shield_capacity_armor", color: 43690, level: 1}, {identifier: "tconevo.draconic_shield_recovery_armor", color: 43690, level: 6}, {identifier: "leveling_durability_armor", color: 16777215, level: 1}], TinkerData: {Modifiers: ["leveling_armor", "tconevo.evolved_armor", "tconevo.draconic_energy_armor", "tconevo.draconic_shield_capacity_armor", "tconevo.draconic_shield_recovery_armor"]}, Traits: ["leveling_armor", "tconevo.evolved_armor", "tconevo.draconic_energy_armor", "tconevo.draconic_shield_capacity_armor", "tconevo.draconic_shield_recovery_armor", "leveling_durability_armor"]};
for ticItem in evolvedUpdatableShieldRecover {
var upgradeAttackDamage = RecipeBuilder.newBuilder("fusion_tic_armors_recovery" + ticItem.definition.id, "order_fusioner", 256);
upgradeAttackDamage.addItemInput(<gct_ores:stormy_core> * 2);
upgradeAttackDamage.addItemInput(<draconicevolution:chaotic_core> * 2);
upgradeAttackDamage.addItemInput(<gct_ores:ordered_core> * 1);
upgradeAttackDamage.addItemInput(<contenttweaker:chaos_heart> * 1);
upgradeAttackDamage.addItemInput(<ageofminecraft:withered_nether_star> * 1);
upgradeAttackDamage.addItemInput(<gct_ores:order_crystal> * 2);
upgradeAttackDamage.addItemInput(ticItem * 1).setPreViewNBT(upgradeShieldRecoverNbt).setNBTChecker(function(ctrl as IMachineController, item as IItemStack) {
    if (TicTraitLib.hasTicTrait(item, "tconevo.draconic_shield_recovery_armor")) {
        if (TicTraitLib.getTraitLevel(item, "tconevo.draconic_shield_recovery_armor") == 5) {
            if (isNull(item.tag.EvolvedTierExtra)) return false;
            if (item.tag.EvolvedTierExtra as int < 4) {
                return false;
            }
        }
    }
    if (TicTraitLib.hasTicTrait(item, "tconevo.draconic_shield_recovery_armor")) {
        if (TicTraitLib.getTraitLevel(item, "tconevo.draconic_shield_recovery_armor") == 5) {
            ctrl.customData = item.tag as IData;
            return true;
        }
    }
    return false;
});
upgradeAttackDamage.addItemInput(<draconicevolution:tool_upgrade:9> * 1);
upgradeAttackDamage.addEnergyPerTickInput(128000000);
upgradeAttackDamage.addItemOutput(ticItem * 1).setPreViewNBT(upgradeShieldRecoverNew).addItemModifier(function(ctrl as IMachineController, oldItem as IItemStack) as IItemStack {
    var nbt as IData = ctrl.customData as IData;
    var traits as IData = nbt.Modifiers;
    var remove as IData = [{identifier: "tconevo.draconic_shield_recovery_armor", color: 43690, level: 5}];
    var add as IData = [{identifier: "tconevo.draconic_shield_recovery_armor", color: 43690, level: 6}];
    traits = traits.deepUpdate(remove, REMOVE);
    traits = traits.deepUpdate(add, APPEND);
    nbt = nbt.update({Modifiers : traits});
    print(nbt.asString());
    return ticItem.withTag(nbt);
});
upgradeAttackDamage.addItemOutput(<draconicevolution:tool_upgrade:9> * 1);
upgradeAttackDamage.addRecipeTooltip("§f请使用§b秩序§f及以上等级的龙研材料进行升级");
upgradeAttackDamage.build();
}

//迅腾
var evolvedUpdatableBoost as IItemStack[] = [
    <conarm:leggings>
];
var upgradeBoostNbt as IData = {EvolvedTier: 1, StatsOriginal: {Toughness: 0.0 as float, FreeModifiers: 3, Durability: 1, Defense: 0.0 as float}, Unbreakable: 0 as byte, ConArmEvolvedInit: 1 as byte, Stats: {Toughness: 0.0 as float, FreeModifiers: 5, Durability: 1, Defense: 0.0 as float}, ConArmEquipmentSlot: 3, Modifiers: [{identifier: "leveling_armor", color: 16777215, level: 1}, {identifier: "tconevo.evolved_armor", color: 13146868, level: 1}, {identifier: "tconevo.draconic_energy_armor", color: 43690, level: 1}, {identifier: "tconevo.draconic_shield_capacity_armor", color: 43690, level: 1}, {identifier: "tconevo.draconic_shield_recovery_armor", color: 43690, level: 1}, {identifier: "tconevo.draconic_move_speed_armor", color: 43690, level: 5}], TinkerData: {Modifiers: ["leveling_armor", "tconevo.evolved_armor", "tconevo.draconic_energy_armor", "tconevo.draconic_shield_capacity_armor", "tconevo.draconic_shield_recovery_armor", "tconevo.draconic_move_speed_armor"]}, Traits: ["leveling_armor", "tconevo.evolved_armor", "tconevo.draconic_energy_armor", "tconevo.draconic_shield_capacity_armor", "tconevo.draconic_shield_recovery_armor", "tconevo.draconic_move_speed_armor"]};
var upgradeBoostNew as IData = {EvolvedTier: 1, StatsOriginal: {Toughness: 0.0 as float, FreeModifiers: 3, Durability: 1, Defense: 0.0 as float}, Unbreakable: 0 as byte, ConArmEvolvedInit: 1 as byte, Stats: {Toughness: 0.0 as float, FreeModifiers: 5, Durability: 1, Defense: 0.0 as float}, ConArmEquipmentSlot: 3, Modifiers: [{identifier: "leveling_armor", color: 16777215, level: 1}, {identifier: "tconevo.evolved_armor", color: 13146868, level: 1}, {identifier: "tconevo.draconic_energy_armor", color: 43690, level: 1}, {identifier: "tconevo.draconic_shield_capacity_armor", color: 43690, level: 1}, {identifier: "tconevo.draconic_shield_recovery_armor", color: 43690, level: 1}, {identifier: "tconevo.draconic_move_speed_armor", color: 43690, level: 6}], TinkerData: {Modifiers: ["leveling_armor", "tconevo.evolved_armor", "tconevo.draconic_energy_armor", "tconevo.draconic_shield_capacity_armor", "tconevo.draconic_shield_recovery_armor", "tconevo.draconic_move_speed_armor"]}, Traits: ["leveling_armor", "tconevo.evolved_armor", "tconevo.draconic_energy_armor", "tconevo.draconic_shield_capacity_armor", "tconevo.draconic_shield_recovery_armor", "tconevo.draconic_move_speed_armor"]};
for ticItem in evolvedUpdatableBoost {
var upgradeAttackDamage = RecipeBuilder.newBuilder("fusion_tic_armors_boost" + ticItem.definition.id, "order_fusioner", 256);
upgradeAttackDamage.addItemInput(<gct_ores:stormy_core> * 2);
upgradeAttackDamage.addItemInput(<draconicevolution:chaotic_core> * 2);
upgradeAttackDamage.addItemInput(<gct_ores:ordered_core> * 1);
upgradeAttackDamage.addItemInput(<contenttweaker:chaos_heart> * 1);
upgradeAttackDamage.addItemInput(<ageofminecraft:withered_nether_star> * 1);
upgradeAttackDamage.addItemInput(<gct_ores:order_crystal> * 2);
upgradeAttackDamage.addItemInput(ticItem * 1).setPreViewNBT(upgradeBoostNbt).setNBTChecker(function(ctrl as IMachineController, item as IItemStack) {
    if (TicTraitLib.hasTicTrait(item, "tconevo.draconic_move_speed_armor")) {
        if (TicTraitLib.getTraitLevel(item, "tconevo.draconic_move_speed_armor") == 5) {
            if (isNull(item.tag.EvolvedTierExtra)) return false;
            if (item.tag.EvolvedTierExtra as int < 4) {
                return false;
            }
        }
    }
    if (TicTraitLib.hasTicTrait(item, "tconevo.draconic_move_speed_armor")) {
        if (TicTraitLib.getTraitLevel(item, "tconevo.draconic_move_speed_armor") == 5) {
            ctrl.customData = item.tag as IData;
            return true;
        }
    }
    return false;
});
upgradeAttackDamage.addItemInput(<draconicevolution:tool_upgrade:10> * 1);
upgradeAttackDamage.addEnergyPerTickInput(128000000);
upgradeAttackDamage.addItemOutput(ticItem * 1).setPreViewNBT(upgradeBoostNew).addItemModifier(function(ctrl as IMachineController, oldItem as IItemStack) as IItemStack {
    var nbt as IData = ctrl.customData as IData;
    var traits as IData = nbt.Modifiers;
    var remove as IData = [{identifier: "tconevo.draconic_move_speed_armor", color: 43690, level: 5}];
    var add as IData = [{identifier: "tconevo.draconic_move_speed_armor", color: 43690, level: 6}];
    traits = traits.deepUpdate(remove, REMOVE);
    traits = traits.deepUpdate(add, APPEND);
    nbt = nbt.update({Modifiers : traits});
    print(nbt.asString());
    return ticItem.withTag(nbt);
});
upgradeAttackDamage.addItemOutput(<draconicevolution:tool_upgrade:10> * 1);
upgradeAttackDamage.addRecipeTooltip("§f请使用§b秩序§f及以上等级的龙研材料进行升级");
upgradeAttackDamage.build();
}

//高跳
var evolvedUpdatableJump as IItemStack[] = [
    <conarm:boots>
];
var upgradeJumpNbt as IData = {EvolvedTier: 1, StatsOriginal: {Toughness: 0.0 as float, FreeModifiers: 3, Durability: 1, Defense: 0.0 as float}, Unbreakable: 0 as byte, ConArmEvolvedInit: 1 as byte, Stats: {Toughness: 0.0 as float, FreeModifiers: 5, Durability: 1, Defense: 0.0 as float}, ConArmEquipmentSlot: 2, Modifiers: [{identifier: "leveling_armor", color: 16777215, level: 1}, {identifier: "tconevo.evolved_armor", color: 13146868, level: 1}, {identifier: "tconevo.draconic_energy_armor", color: 43690, level: 1}, {identifier: "tconevo.draconic_shield_capacity_armor", color: 43690, level: 0}, {identifier: "tconevo.draconic_shield_recovery_armor", color: 43690, level: 1}, {identifier: "tconevo.draconic_jump_boost_armor", color: 43690, level: 5}, {identifier: "leveling_durability_armor", color: 16777215, level: 1}], TinkerData: {Modifiers: ["leveling_armor", "tconevo.evolved_armor", "tconevo.draconic_energy_armor", "tconevo.draconic_shield_capacity_armor", "tconevo.draconic_shield_recovery_armor", "tconevo.draconic_jump_boost_armor"]}, Traits: ["leveling_armor", "tconevo.evolved_armor", "tconevo.draconic_energy_armor", "tconevo.draconic_shield_capacity_armor", "tconevo.draconic_shield_recovery_armor", "tconevo.draconic_jump_boost_armor", "leveling_durability_armor"]};
var upgradeJumpNew as IData = {EvolvedTier: 1, StatsOriginal: {Toughness: 0.0 as float, FreeModifiers: 3, Durability: 1, Defense: 0.0 as float}, Unbreakable: 0 as byte, ConArmEvolvedInit: 1 as byte, Stats: {Toughness: 0.0 as float, FreeModifiers: 5, Durability: 1, Defense: 0.0 as float}, ConArmEquipmentSlot: 2, Modifiers: [{identifier: "leveling_armor", color: 16777215, level: 1}, {identifier: "tconevo.evolved_armor", color: 13146868, level: 1}, {identifier: "tconevo.draconic_energy_armor", color: 43690, level: 1}, {identifier: "tconevo.draconic_shield_capacity_armor", color: 43690, level: 0}, {identifier: "tconevo.draconic_shield_recovery_armor", color: 43690, level: 1}, {identifier: "tconevo.draconic_jump_boost_armor", color: 43690, level: 6}, {identifier: "leveling_durability_armor", color: 16777215, level: 1}], TinkerData: {Modifiers: ["leveling_armor", "tconevo.evolved_armor", "tconevo.draconic_energy_armor", "tconevo.draconic_shield_capacity_armor", "tconevo.draconic_shield_recovery_armor", "tconevo.draconic_jump_boost_armor"]}, Traits: ["leveling_armor", "tconevo.evolved_armor", "tconevo.draconic_energy_armor", "tconevo.draconic_shield_capacity_armor", "tconevo.draconic_shield_recovery_armor", "tconevo.draconic_jump_boost_armor", "leveling_durability_armor"]};
for ticItem in evolvedUpdatableJump {
var upgradeAttackDamage = RecipeBuilder.newBuilder("fusion_tic_armors_jump" + ticItem.definition.id, "order_fusioner", 256);
upgradeAttackDamage.addItemInput(<gct_ores:stormy_core> * 2);
upgradeAttackDamage.addItemInput(<draconicevolution:chaotic_core> * 2);
upgradeAttackDamage.addItemInput(<gct_ores:ordered_core> * 1);
upgradeAttackDamage.addItemInput(<contenttweaker:chaos_heart> * 1);
upgradeAttackDamage.addItemInput(<ageofminecraft:withered_nether_star> * 1);
upgradeAttackDamage.addItemInput(<gct_ores:order_crystal> * 2);
upgradeAttackDamage.addItemInput(ticItem * 1).setPreViewNBT(upgradeJumpNbt).setNBTChecker(function(ctrl as IMachineController, item as IItemStack) {
    if (TicTraitLib.hasTicTrait(item, "tconevo.draconic_jump_boost_armor")) {
        if (TicTraitLib.getTraitLevel(item, "tconevo.draconic_jump_boost_armor") == 5) {
            if (isNull(item.tag.EvolvedTierExtra)) return false;
            if (item.tag.EvolvedTierExtra as int < 4) {
                return false;
            }
        }
    }
    if (TicTraitLib.hasTicTrait(item, "tconevo.draconic_jump_boost_armor")) {
        if (TicTraitLib.getTraitLevel(item, "tconevo.draconic_jump_boost_armor") == 5) {
            ctrl.customData = item.tag as IData;
            return true;
        }
    }
    return false;
});
upgradeAttackDamage.addItemInput(<draconicevolution:tool_upgrade:11> * 1);
upgradeAttackDamage.addEnergyPerTickInput(128000000);
upgradeAttackDamage.addItemOutput(ticItem * 1).setPreViewNBT(upgradeJumpNew).addItemModifier(function(ctrl as IMachineController, oldItem as IItemStack) as IItemStack {
    var nbt as IData = ctrl.customData as IData;
    var traits as IData = nbt.Modifiers;
    var remove as IData = [{identifier: "tconevo.draconic_jump_boost_armor", color: 43690, level: 5}];
    var add as IData = [{identifier: "tconevo.draconic_jump_boost_armor", color: 43690, level: 6}];
    traits = traits.deepUpdate(remove, REMOVE);
    traits = traits.deepUpdate(add, APPEND);
    nbt = nbt.update({Modifiers : traits});
    print(nbt.asString());
    return ticItem.withTag(nbt);
});
upgradeAttackDamage.addItemOutput(<draconicevolution:tool_upgrade:11> * 1);
upgradeAttackDamage.addRecipeTooltip("§f请使用§b秩序§f及以上等级的龙研材料进行升级");
upgradeAttackDamage.build();
}

//RF（工具）
var upgradeRFNbt as IData = {EvolvedTier: 1, StatsOriginal: {AttackSpeedMultiplier: 1.0 as float, MiningSpeed: 1.0 as float, FreeModifiers: 3, Durability: 1, HarvestLevel: 0, Attack: 2.0 as float}, Unbreakable: 0 as byte, Stats: {AttackSpeedMultiplier: 1.0 as float, MiningSpeed: 1.0 as float, FreeModifiers: 5, Durability: 1, HarvestLevel: 0, Attack: 2.0 as float}, Special: {Categories: ["weapon", "tool"]}, Modifiers: [{identifier: "toolleveling", color: 16777215, level: 1}, {identifier: "tconevo.evolved", color: 13146868, level: 1}, {identifier: "tconevo.draconic_energy", color: 43690, level: 5}, {identifier: "leveling_durability", color: 16777215, level: 1}], TinkerData: {Modifiers: ["toolleveling", "tconevo.evolved", "tconevo.draconic_energy"]}, Traits: ["toolleveling", "tconevo.evolved", "tconevo.draconic_energy", "leveling_durability"]};
var upgradeRFNew as IData = {EvolvedTier: 1, StatsOriginal: {AttackSpeedMultiplier: 1.0 as float, MiningSpeed: 1.0 as float, FreeModifiers: 3, Durability: 1, HarvestLevel: 0, Attack: 2.0 as float}, Unbreakable: 0 as byte, Stats: {AttackSpeedMultiplier: 1.0 as float, MiningSpeed: 1.0 as float, FreeModifiers: 5, Durability: 1, HarvestLevel: 0, Attack: 2.0 as float}, Special: {Categories: ["weapon", "tool"]}, Modifiers: [{identifier: "toolleveling", color: 16777215, level: 1}, {identifier: "tconevo.evolved", color: 13146868, level: 1}, {identifier: "tconevo.draconic_energy", color: 43690, level: 6}, {identifier: "leveling_durability", color: 16777215, level: 1}], TinkerData: {Modifiers: ["toolleveling", "tconevo.evolved", "tconevo.draconic_energy"]}, Traits: ["toolleveling", "tconevo.evolved", "tconevo.draconic_energy", "leveling_durability"]};

for ticItem in TicTraitLib.getAllTicItem() {
if (!TicLib.isTicArmor(ticItem)) {
var upgradeAttackDamage = RecipeBuilder.newBuilder("fusion_tic_tools_rf" + ticItem.definition.id, "order_fusioner", 256);
upgradeAttackDamage.addItemInput(<gct_ores:stormy_core> * 2);
upgradeAttackDamage.addItemInput(<draconicevolution:chaotic_core> * 2);
upgradeAttackDamage.addItemInput(<gct_ores:ordered_core> * 1);
upgradeAttackDamage.addItemInput(<contenttweaker:chaos_heart> * 1);
upgradeAttackDamage.addItemInput(<ageofminecraft:withered_nether_star> * 1);
upgradeAttackDamage.addItemInput(<gct_ores:order_crystal> * 2);
upgradeAttackDamage.addItemInput(ticItem * 1).setPreViewNBT(upgradeRFNbt).setNBTChecker(function(ctrl as IMachineController, item as IItemStack) {
    if (TicTraitLib.hasTicTrait(item, "tconevo.draconic_energy")) {
        if (TicTraitLib.getTraitLevel(item, "tconevo.draconic_energy") == 5) {
            if (isNull(item.tag.EvolvedTierExtra)) return false;
            if (item.tag.EvolvedTierExtra as int < 4) {
                return false;
            }
        }
    }
    if (TicTraitLib.hasTicTrait(item, "tconevo.draconic_energy")) {
        if (TicTraitLib.getTraitLevel(item, "tconevo.draconic_energy") == 5) {
            ctrl.customData = item.tag as IData;
            return true;
        }
    }
    return false;
});
upgradeAttackDamage.addItemInput(<draconicevolution:tool_upgrade:0> * 1);
upgradeAttackDamage.addEnergyPerTickInput(128000000);
upgradeAttackDamage.addItemOutput(ticItem * 1).setPreViewNBT(upgradeRFNew).addItemModifier(function(ctrl as IMachineController, oldItem as IItemStack) as IItemStack {
    var nbt as IData = ctrl.customData as IData;
    var traits as IData = nbt.Modifiers;
    var remove as IData = [{identifier: "tconevo.draconic_energy", color: 43690, level: 5}];
    var add as IData = [{identifier: "tconevo.draconic_energy", color: 43690, level: 6}];
    traits = traits.deepUpdate(remove, REMOVE);
    traits = traits.deepUpdate(add, APPEND);
    nbt = nbt.update({Modifiers : traits});
    print(nbt.asString());
    return ticItem.withTag(nbt);
});
upgradeAttackDamage.addItemOutput(<draconicevolution:tool_upgrade:0> * 1);
upgradeAttackDamage.addRecipeTooltip("§f请使用§b秩序§f及以上等级的龙研材料进行升级");
upgradeAttackDamage.build();
}}

//RF（护甲）
var upgradeRFANbt as IData = {EvolvedTier: 1, StatsOriginal: {Toughness: 0.0 as float, FreeModifiers: 3, Durability: 1, Defense: 0.0 as float}, Unbreakable: 0 as byte, ConArmEvolvedInit: 1 as byte, Stats: {Toughness: 0.0 as float, FreeModifiers: 5, Durability: 1, Defense: 0.0 as float}, ConArmEquipmentSlot: 5, Modifiers: [{identifier: "leveling_armor", color: 16777215, level: 1}, {identifier: "tconevo.evolved_armor", color: 13146868, level: 1}, {identifier: "tconevo.draconic_energy_armor", color: 43690, level: 5}, {identifier: "leveling_durability_armor", color: 16777215, level: 1}], TinkerData: {Modifiers: ["leveling_armor", "tconevo.evolved_armor", "tconevo.draconic_energy_armor"]}, Traits: ["leveling_armor", "tconevo.evolved_armor", "tconevo.draconic_energy_armor", "leveling_durability_armor"]};
var upgradeRFANew as IData = {EvolvedTier: 1, StatsOriginal: {Toughness: 0.0 as float, FreeModifiers: 3, Durability: 1, Defense: 0.0 as float}, Unbreakable: 0 as byte, ConArmEvolvedInit: 1 as byte, Stats: {Toughness: 0.0 as float, FreeModifiers: 5, Durability: 1, Defense: 0.0 as float}, ConArmEquipmentSlot: 5, Modifiers: [{identifier: "leveling_armor", color: 16777215, level: 1}, {identifier: "tconevo.evolved_armor", color: 13146868, level: 1}, {identifier: "tconevo.draconic_energy_armor", color: 43690, level: 6}, {identifier: "leveling_durability_armor", color: 16777215, level: 1}], TinkerData: {Modifiers: ["leveling_armor", "tconevo.evolved_armor", "tconevo.draconic_energy_armor"]}, Traits: ["leveling_armor", "tconevo.evolved_armor", "tconevo.draconic_energy_armor", "leveling_durability_armor"]};

for ticItem in TicTraitLib.getAllTicItem() {
if (TicLib.isTicArmor(ticItem)) {
var upgradeAttackDamage = RecipeBuilder.newBuilder("fusion_tic_armors_rf" + ticItem.definition.id, "order_fusioner", 256);
upgradeAttackDamage.addItemInput(<gct_ores:stormy_core> * 2);
upgradeAttackDamage.addItemInput(<draconicevolution:chaotic_core> * 2);
upgradeAttackDamage.addItemInput(<gct_ores:ordered_core> * 1);
upgradeAttackDamage.addItemInput(<contenttweaker:chaos_heart> * 1);
upgradeAttackDamage.addItemInput(<ageofminecraft:withered_nether_star> * 1);
upgradeAttackDamage.addItemInput(<gct_ores:order_crystal> * 2);
upgradeAttackDamage.addItemInput(ticItem * 1).setPreViewNBT(upgradeRFANbt).setNBTChecker(function(ctrl as IMachineController, item as IItemStack) {
    if (TicTraitLib.hasTicTrait(item, "tconevo.draconic_energy_armor")) {
        if (TicTraitLib.getTraitLevel(item, "tconevo.draconic_energy_armor") == 5) {
            if (isNull(item.tag.EvolvedTierExtra)) return false;
            if (item.tag.EvolvedTierExtra as int < 4) {
                return false;
            }
        }
    }
    if (TicTraitLib.hasTicTrait(item, "tconevo.draconic_energy_armor")) {
        if (TicTraitLib.getTraitLevel(item, "tconevo.draconic_energy_armor") == 5) {
            ctrl.customData = item.tag as IData;
            return true;
        }
    }
    return false;
});
upgradeAttackDamage.addItemInput(<draconicevolution:tool_upgrade:0> * 1);
upgradeAttackDamage.addEnergyPerTickInput(128000000);
upgradeAttackDamage.addItemOutput(ticItem * 1).setPreViewNBT(upgradeRFANew).addItemModifier(function(ctrl as IMachineController, oldItem as IItemStack) as IItemStack {
    var nbt as IData = ctrl.customData as IData;
    var traits as IData = nbt.Modifiers;
    var remove as IData = [{identifier: "tconevo.draconic_energy_armor", color: 43690, level: 5}];
    var add as IData = [{identifier: "tconevo.draconic_energy_armor", color: 43690, level: 6}];
    traits = traits.deepUpdate(remove, REMOVE);
    traits = traits.deepUpdate(add, APPEND);
    nbt = nbt.update({Modifiers : traits});
    print(nbt.asString());
    return ticItem.withTag(nbt);
});
upgradeAttackDamage.addItemOutput(<draconicevolution:tool_upgrade:0> * 1);
upgradeAttackDamage.addRecipeTooltip("§f请使用§b秩序§f及以上等级的龙研材料进行升级");
upgradeAttackDamage.build();
}}
