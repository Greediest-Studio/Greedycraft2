/*
 * This script is created for the GreedyCraft modpack by TCreopargh.
 * You may NOT use this script in any other publicly distributed modpack without my permission. 
 */ 

#priority 120
// Powered by TCreopargh

import loottweaker.vanilla.loot.LootTables;
import loottweaker.vanilla.loot.LootTable;
import loottweaker.vanilla.loot.LootPool;
import loottweaker.vanilla.loot.Conditions;
import loottweaker.vanilla.loot.Functions;
import loottweaker.LootTweaker;

import crafttweaker.item.IItemStack;
import crafttweaker.data.IData;
import crafttweaker.item.IIngredient;
import crafttweaker.entity.IEntity;
import crafttweaker.entity.IEntityLivingBase;

import native.net.minecraft.util.ResourceLocation;
import native.net.minecraft.entity.EntityLivingBase;

import scripts.util.date as CalendarUtil;

val mobList as string[] = [
    "zombie",
    "skeleton",
    "husk",
    "zombie_villager",
    "spider",
    "wither_skeleton",
    "stray",
    "endermite",
    "enderman",
    "creeper",
    "zombie_pigman",
    "ghast",
    "blaze",
    "cave_spider",
    "witch",
    "slime",
    "magma_cube"
];

val slimeTables as string[] = [
    "minecraft:entities/slime",
    "minecraft:entities/magma_cube",
    "betterslimes:blue_slime",
    "betterslimes:gold_slime",
    "betterslimes:ice_slime",
    "betterslimes:knight_slime",
    "betterslimes:red_slime",
    "betterslimes:sky_slime",
    "betterslimes:yellow_slime"
];

LootTweaker.getTable("betterslimes:quazar").getPool("main").setRolls(1.0, 1.0);
LootTweaker.getTable("betterslimes:quazar").getPool("main").setBonusRolls(0.0, 0.0);
LootTweaker.getTable("betterslimes:quazar").getPool("main").addItemEntry(<additions:royal_gel>, 100, 1, [Functions.setCount(24, 50)], []);
var quazarLootPool = LootTweaker.getTable("betterslimes:quazar").addPool("loot", 1.0, 1.0, 0.0, 0.0);
quazarLootPool.addLootTableEntry("minecraft:chests/simple_dungeon", 1, 1, [Conditions.killedByPlayer()]);

LootTweaker.getTable("betterslimes:knight_slime").getPool("main").setRolls(1.0, 1.0);
LootTweaker.getTable("betterslimes:knight_slime").getPool("main").setBonusRolls(0.0, 0.0);
LootTweaker.getTable("betterslimes:knight_slime").getPool("main").addConditions([Conditions.randomChance(0.5)]);
LootTweaker.getTable("betterslimes:knight_slime").getPool("main").addItemEntry(<tconstruct:nuggets:3>, 100, 1, [Functions.setCount(1, 2)], []);
LootTweaker.getTable("betterslimes:knight_slime").getPool("main").addItemEntry(<tconstruct:nuggets:3>, 10, 1, [Functions.setCount(2, 7)], []);
LootTweaker.getTable("betterslimes:knight_slime").getPool("main").addItemEntry(<tconstruct:ingots:3>, 4, 1, [Functions.setCount(1, 2)], []);
LootTweaker.getTable("betterslimes:gold_slime").getPool("main").setRolls(1.0, 1.0);
LootTweaker.getTable("betterslimes:gold_slime").getPool("main").setBonusRolls(0.0, 0.0);
LootTweaker.getTable("betterslimes:gold_slime").getPool("main").addConditions([Conditions.randomChance(0.5)]);
LootTweaker.getTable("betterslimes:gold_slime").getPool("main").addItemEntry(<minecraft:gold_nugget>, 200, 1, [Functions.setCount(1, 3)], []);
LootTweaker.getTable("betterslimes:gold_slime").getPool("main").addItemEntry(<minecraft:gold_ingot>, 20, 1, [Functions.setCount(1, 2)], []);
LootTweaker.getTable("betterslimes:gold_slime").getPool("main").addItemEntry(<minecraft:golden_apple>, 10, 1, [Functions.setCount(1, 1)], []);
LootTweaker.getTable("betterslimes:gold_slime").getPool("main").addItemEntry(<minecraft:golden_apple:1>, 1, 1, [Functions.setCount(1, 1)], []);

LootTweaker.getTable("mowziesmobs:entities/ferrous_wroughtnaut").getPool("main").setRolls(2.0, 2.0);
LootTweaker.getTable("mowziesmobs:entities/ferrous_wroughtnaut").getPool("main").setBonusRolls(0.0, 0.0);
LootTweaker.getTable("mowziesmobs:entities/ferrous_wroughtnaut").getPool("main").addItemEntry(<thermalfoundation:material:160>, 1, 1, [Functions.setCount(4, 16)], []);
LootTweaker.getTable("mowziesmobs:entities/ferrous_wroughtnaut").getPool("main").addItemEntry(<minecraft:iron_ingot>, 1, 1, [Functions.setCount(32, 64)], []);
LootTweaker.getTable("mowziesmobs:entities/ferrous_wroughtnaut").getPool("main").addLootTableEntry("minecraft:chests/simple_dungeon", 1, 1, [Conditions.killedByPlayer()]);
LootTweaker.getTable("netherex:entity/ghast/ghast_queen").getPool("main").addItemEntry(<additions:lavarite_ingot>, 1, 1, [Functions.setCount(1, 2)], []);

LootTweaker.getTable("aether_legacy:entities/bosses/slider").getPool("main").addItemEntry(<additions:soul_of_slider>, 1, 1, [Functions.setCount(2, 8)], []);
LootTweaker.getTable("aether_legacy:entities/bosses/valkyrie_queen").getPool("main").addItemEntry(<additions:gem_of_valkyrie>, 1, 1, [Functions.setCount(2, 8)], []);
LootTweaker.getTable("aether_legacy:entities/bosses/sun_spirit").getPool("main").addItemEntry(<additions:sun_crystal>, 1, 1, [Functions.setCount(2, 8)], []);

LootTweaker.getTable("journey:mobs/boss/nether_beast").getPool("main").addItemEntry(<additions:hellite_ingot>, 1, 1, [Functions.setCount(1, 1)], []);
LootTweaker.getTable("journey:mobs/boss/withering_beast").getPool("main").addItemEntry(<additions:hellite_ingot>, 1, 1, [Functions.setCount(1, 1)], []);
LootTweaker.getTable("journey:mobs/boss/calcia").getPool("main").addItemEntry(<additions:hellite_ingot>, 1, 1, [Functions.setCount(1, 1)], []);
LootTweaker.getTable("journey:mobs/boss/soul_watcher").getPool("main").addItemEntry(<additions:hellite_ingot>, 1, 1, [Functions.setCount(1, 1)], []);

LootTweaker.getTable("gct_mobs:entities/bligtz").addPool("bligtz", 1, 1, 0, 0).addItemEntry(<gct_mobs:bligtz_rod>, 1, 1, [Functions.setCount(1, 4)], []);
LootTweaker.getTable("gct_mobs:entities/bninz").addPool("bninz", 1, 1, 0, 0).addItemEntry(<gct_mobs:bninz_rod>, 1, 1, [Functions.setCount(1, 4)], []);
LootTweaker.getTable("gct_mobs:entities/bthdz").addPool("bthdz", 1, 1, 0, 0).addItemEntry(<gct_mobs:bthdz_rod>, 1, 1, [Functions.setCount(1, 4)], []);
LootTweaker.getTable("gct_mobs:entities/bnatuz").addPool("bnatuz", 1, 1, 0, 0).addItemEntry(<gct_mobs:bnatuz_rod>, 1, 1, [Functions.setCount(1, 4)], []);

LootTweaker.getTable("journey:mobs/boss/eudor").removePool("journey:eudor_sword");
LootTweaker.getTable("divinerpg:entities/vanilla/rainbour").removePool("divinerpg:rainbour");
LootTweaker.getTable("journey:mobs/overworld/floro").getPool("main").removeEntry("journey:hoeofeternallife");
LootTweaker.getTable("divinerpg:entities/boss/eternal_archer").removePool("divinerpg:eternal_archer");
LootTweaker.getTable("divinerpg:entities/boss/ayeraco_green").clear();
LootTweaker.getTable("divinerpg:entities/boss/ayeraco_green").addPool("divinerpg:ayeraco_statue_drop",1,1,0,0).addItemEntry(<divinerpg:ayeraco_statue_green>,1,1,[Functions.setCount(1,1)],[Conditions.killedByPlayer()]);
LootTweaker.getTable("divinerpg:entities/boss/ayeraco_green").addPool("divinerpg:shard",1,1,0,0).addItemEntry(<divinerpg:divine_shards>,1,1,[Functions.setCount(2,3)],[]);
LootTweaker.getTable("divinerpg:entities/boss/ayeraco_red").clear();
LootTweaker.getTable("divinerpg:entities/boss/ayeraco_red").addPool("divinerpg:ayeraco_statue_drop",1,1,0,0).addItemEntry(<divinerpg:ayeraco_statue_red>,1,1,[Functions.setCount(1,1)],[Conditions.killedByPlayer()]);
LootTweaker.getTable("divinerpg:entities/boss/ayeraco_red").addPool("divinerpg:shard",1,1,0,0).addItemEntry(<divinerpg:divine_shards>,1,1,[Functions.setCount(2,3)],[]);
LootTweaker.getTable("divinerpg:entities/boss/ayeraco_blue").clear();
LootTweaker.getTable("divinerpg:entities/boss/ayeraco_blue").addPool("divinerpg:ayeraco_statue_drop",1,1,0,0).addItemEntry(<divinerpg:ayeraco_statue_blue>,1,1,[Functions.setCount(1,1)],[Conditions.killedByPlayer()]);
LootTweaker.getTable("divinerpg:entities/boss/ayeraco_blue").addPool("divinerpg:shard",1,1,0,0).addItemEntry(<divinerpg:divine_shards>,1,1,[Functions.setCount(2,3)],[]);
LootTweaker.getTable("divinerpg:entities/boss/ayeraco_yellow").clear();
LootTweaker.getTable("divinerpg:entities/boss/ayeraco_yellow").addPool("divinerpg:ayeraco_statue_drop",1,1,0,0).addItemEntry(<divinerpg:ayeraco_statue_yellow>,1,1,[Functions.setCount(1,1)],[Conditions.killedByPlayer()]);
LootTweaker.getTable("divinerpg:entities/boss/ayeraco_yellow").addPool("divinerpg:shard",1,1,0,0).addItemEntry(<divinerpg:divine_shards>,1,1,[Functions.setCount(2,3)],[]);
LootTweaker.getTable("divinerpg:entities/boss/ayeraco_purple").clear();
LootTweaker.getTable("divinerpg:entities/boss/ayeraco_purple").addPool("divinerpg:ayeraco_statue_drop",1,1,0,0).addItemEntry(<divinerpg:ayeraco_statue_purple>,1,1,[Functions.setCount(1,1)],[Conditions.killedByPlayer()]);
LootTweaker.getTable("divinerpg:entities/boss/ayeraco_purple").addPool("divinerpg:shard",1,1,0,0).addItemEntry(<divinerpg:divine_shards>,1,1,[Functions.setCount(2,3)],[]);
LootTweaker.getTable("journey:mobs/boss/sky_stalker").removePool("journey:sky_stalker_piercer");
LootTweaker.getTable("journey:mobs/boss/sky_stalker").removePool("journey:sky_stalker_weapons");
LootTweaker.getTable("journey:mobs/boss/withering_beast").removePool("journey:wither_beast_sword");
LootTweaker.getTable("journey:mobs/boss/logger").removePool("journey:logger_weapons");
LootTweaker.getTable("journey:mobs/boss/logger").removePool("journey:logger_helmet");
LootTweaker.getTable("journey:mobs/boss/logger").removePool("journey:logger_chest");
LootTweaker.getTable("journey:mobs/boss/logger").removePool("journey:logger_legs");
LootTweaker.getTable("journey:mobs/boss/logger").removePool("journey:logger_boots");
LootTweaker.getTable("divinerpg:entities/boss/soul_fiend").removePool("divinerpg:soul_fiend");
LootTweaker.getTable("divinerpg:entities/boss/sunstorm").getPool("divinerpg:sunstorm").removeEntry("divinerpg:eden_blitz");
LootTweaker.getTable("divinerpg:entities/boss/reyvor").removePool("divinerpg:reyvor");
LootTweaker.getTable("journey:mobs/boss/thunderbird").removePool("journey:thunderbird_weapons");
LootTweaker.getTable("divinerpg:entities/boss/vamacheron").removePool("divinerpg:vamacheron");
LootTweaker.getTable("journey:mobs/boss/calcia").removePool("journey:calcia_sword");
LootTweaker.getTable("divinerpg:entities/boss/experienced_cori").removePool("divinerpg:experienced_cori");
LootTweaker.getTable("journey:mobs/boss/corallator").removePool("journey:corallator_sword");
LootTweaker.getTable("journey:mobs/boss/corallator").removePool("journey:corallator_bow");
LootTweaker.getTable("divinerpg:entities/boss/ancient_entity").clear();
LootTweaker.getTable("divinerpg:entities/boss/ancient_entity").addPool("divinerpg:ancient_entity",1,1,0,0).addItemEntry(<divinerpg:divine_shards>,1,1,[Functions.setCount(3,6)],[]);
LootTweaker.getTable("divinerpg:entities/boss/ancient_entity").addPool("divinerpg:ancient_entity_statue_drop",1,1,0,0).addItemEntry(<divinerpg:ancient_entity_statue>,1,1,[Functions.setCount(1,1)],[Conditions.killedByPlayer()]);
LootTweaker.getTable("journey:mobs/boss/soul_watcher").removePool("journey:soul_watcher_helm");
LootTweaker.getTable("journey:mobs/boss/soul_watcher").removePool("journey:soul_watcher_boots");
LootTweaker.getTable("journey:mobs/boss/soul_watcher").removePool("journey:soul_watcher_bow");
LootTweaker.getTable("journey:mobs/boss/soul_watcher").removePool("journey:soul_watcher_chest");
LootTweaker.getTable("journey:mobs/boss/soul_watcher").removePool("journey:soul_watcher_legs");
LootTweaker.getTable("divinerpg:entities/boss/densos").removePool("divinerpg:densos");
LootTweaker.getTable("journey:mobs/boss/scale").removePool("journey:scale_weapons");
LootTweaker.getTable("journey:mobs/boss/terranian_protector").removePool("journey:terranian_protector_swords");
LootTweaker.getTable("divinerpg:entities/boss/twilight_demon").removePool("divinerpg:twilight_demon");
LootTweaker.getTable("divinerpg:entities/boss/termasect").clear();
LootTweaker.getTable("divinerpg:entities/boss/termasect").addPool("divinerpg:wildwood_fragments",1,1,0,0).addItemEntry(<divinerpg:wildwood_fragments>,1,1,[Functions.setCount(1,4),Functions.lootingEnchantBonus(1,2,8)],[]);
LootTweaker.getTable("divinerpg:entities/boss/termasect").addPool("divinerpg:wildwood_heart",1,1,0,0).addItemEntry(<divinerpg:wildwood_heart>,1,1,[Functions.setCount(1,4),Functions.lootingEnchantBonus(0,1,1)],[]);
LootTweaker.getTable("divinerpg:entities/boss/termasect").addPool("divinerpg:wildwood_log",1,1,0,0).addItemEntry(<divinerpg:wildwood_log>,1,1,[Functions.setCount(64,100)],[]);
LootTweaker.getTable("divinerpg:entities/boss/termasect").addPool("divinerpg:termasect_statue",1,1,0,0).addItemEntry(<divinerpg:termasect_statue>,1,1,[Functions.setCount(1,1)],[Conditions.killedByPlayer()]);
LootTweaker.getTable("journey:mobs/boss/nether_beast").removePool("journey:nether_beast_sword");
LootTweaker.getTable("journey:mobs/boss/sentry_king").removePool("journey:sentry_king_weapons");
LootTweaker.getTable("journey:mobs/overworld/rockite").removePool("journey:rockite_shovel");
LootTweaker.getTable("journey:mobs/boss/blazier").removePool("journey:blazier_sword");
LootTweaker.getTable("journey:mobs/boss/blazier").removePool("journey:blazier_bow");
LootTweaker.getTable("journey:mobs/boss/blazier").removePool("journey:blazier_body");
LootTweaker.getTable("journey:mobs/boss/blazier").removePool("journey:blazier_legs");
LootTweaker.getTable("journey:mobs/boss/blazier").removePool("journey:blazier_helmet");
LootTweaker.getTable("journey:mobs/boss/blazier").removePool("journey:blazier_boots");
LootTweaker.getTable("journey:mobs/boss/blazier").removePool("journey:blazier_knife");
LootTweaker.getTable("divinerpg:entities/boss/karot").removePool("divinerpg:karot");

if (CalendarUtil.isChristmas()) {
    for mob in mobList {
        var table as LootTable = LootTweaker.getTable("minecraft:entities/" + mob);
        var pool as LootPool = table.addPool("christmas_gift", 1, 1, 0, 0);
        pool.addItemEntry(<additions:gift>, 1, 1, [Functions.setCount(1, 1)], []);
        pool.addConditions([Conditions.randomChanceWithLooting(0.00, 0.005), Conditions.killedByPlayer()]);
    }
}

if (CalendarUtil.isLunarNewYear()) {
    for mob in mobList {
        var table as LootTable = LootTweaker.getTable("minecraft:entities/" + mob);
        var pool as LootPool = table.addPool("red_envelope", 1, 1, 0, 0);
        pool.addItemEntry(<additions:red_packet>, 1, 1, [Functions.setCount(1, 1)], []);
        pool.addConditions([Conditions.randomChanceWithLooting(0.00, 0.005), Conditions.killedByPlayer()]);
    }
}

for table in slimeTables {
    var table as LootTable = LootTweaker.getTable(table);
    var pool as LootPool = table.addPool("slime_crown", 1, 1, 0, 0); 
    pool.addItemEntry(<additions:slime_crown>, 1, 1, [Functions.setCount(1, 1)], []);
    pool.addConditions([Conditions.randomChanceWithLooting(0.005, 0.0025), Conditions.killedByPlayer()]);
}
