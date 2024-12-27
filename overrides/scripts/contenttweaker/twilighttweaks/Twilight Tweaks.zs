#reloadable

import mods.twilightforest.Transformation;
import mods.twilightforest.UncraftingTable;
import mods.twilightforest.event.BossConstructionEvent;
import mods.twilightforest.event.BossSpawnEvent;

//转换粉转换生物单向配方
//Transformation.addEntityTransformation(<entity:minecraft:mooshroom>, <entity:minecraft:cow>);
//Transformation.addEntityTransformation("minecraft:polar_bear", "minecraft:rabbit");
// 移除转换粉转换生物配方
//Transformation.removeEntityTransformation(<entity:minecraft:cow>);
//Transformation.removeEntityTransformation("minecraft:sheep");
//转换粉转换方块单向配方
//Transformation.addBlockTransformation(<minecraft:grass>, <minecraft:dirt>);
//Transformation.addBlockTransformation(<minecraft:stone:*>, <minecraft:iron_block>);
//Transformation.addBlockTransformation(<ore:blockIron>, <minecraft:gold_block>);
//移除所有配方
//Transformation.removeAll();

//分解台例子
//UncraftingTable.addShaped(<minecraft:stone>, 4, [[<ore:ingotIron>, null, <ore:ingotIron>], [<ore:ingotIron>, null, <ore:ingotIron>]]);
//UncraftingTable.addShapeless(<minecraft:dirt>, 3, [<minecraft:stone>, <minecraft:iron_block>]);
//添加输出黑名单
//UncraftingTable.addStackToList(<ore:gemDiamond>);
//根据config中的黑白名单，将物品添加到对应项
//UncraftingTable.addRecipeToList("minecraft:furnace");

//boss事件
/*
    All boss events inherit mods.twilightforest.event.IBossEvent.

    The boss events include this variables:
    IWorld             |  world   - The world spawner is in. See https://docs.blamejared.com/1.12/en/Vanilla/World/IWorld for more information.
    IBlockPos          |  pos     - Position of the spawner. See https://docs.blamejared.com/1.12/en/Vanilla/World/IBlockPos for more information.
    string             |  variant - The boss type spawner will spawn by default. Variants are listed below.
    IEntityLivingBase  |  boss    - The boss spawner will spawn by default. See https://docs.blamejared.com/1.12/en/Vanilla/Entities/IEntityLivingBase for more information.

    None of them are mutable.

    The values variant can be:
      naga
      lich
      hydra
      ur_ghast
      knight_phantom
      snow_queen
      minoshroom
      alpha_yeti
      final_boss
*/

/*
    This event also includes this method:
    setBoss(IEntityLivingBase living) | Sets boss to spawn. Even after setting using this method, boss getter will still going to return the default boss.
*/
events.onBossConstruction(function (event as BossConstructionEvent) {
    if (event.variant == "final_boss") {
        event.setBoss(<entity:gct_mobs:apocalypse_holder>.createEntity(event.world));
    }
});

/*
    IEventManager.onBossSpawn(event as mods.twilightforest.event.BossSpawnEvent)
    import mods.twilightforest.event.BossSpawnEvent if needed.

    This event inherits mods.twilightforest.event.IBossEvent.
    This means variables of IBossEvent are also included in this event.

    This event is IEventHasResult. See https://docs.blamejared.com/1.12/en/Vanilla/Events/Events/IEventHasResult for more information.
    If result is:
        allow: It will spawn the boss even if default check doesn't pass.
        default: It will spawn the boss if default check passes
        deny: It will not spawn the boss even if default check passes.
*/
// Entirely disables boss spawn.
//events.onBossSpawn(function (event as mods.twilightforest.event.BossConstructionEvent)) {
//    event.setResult("deny");
//}

/*
    IEventManager.onBossDeath(event as mods.twilightforest.event.BossDeathEvent)
    import mods.twilightforest.event.BossDeathEvent if needed.

     This event inherits mods.twilightforest.event.IBossEvent.
     This means variables of IBossEvent are also included in this event.

     This event is IEventCancellable. See https://docs.blamejared.com/1.12/en/Vanilla/Events/Events/IEventCancelable for more information.
     If cancelled, it will not grant achievements and if it's Ur Ghast or Phantom Knight it will not generate loot chests.
*/
// Does absolutely nothing. You can add gamestage stages or grant more advancements for example.
//events.onBossDeath(function (event as mods.twilightforest.event.BossDeathEvent)) {
//}