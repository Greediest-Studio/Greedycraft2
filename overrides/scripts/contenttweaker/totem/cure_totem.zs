#loader contenttweaker
import mods.contenttweaker.VanillaFactory;
import mods.zenutils.cotx.Block;
import crafttweaker.data.IData;

val cure = VanillaFactory.createActualTileEntity(1);
cure.onTick = function(tileEntity, world, pos) {
    if (world.remote) return;
    val data as IData = tileEntity.data;
    if (!isNull(data) && data has "time") {
        tileEntity.updateCustomData({time: data.time.asInt() + 1});
        if (data.time.asInt() % 200 == 0) {
            val player = world.getClosestPlayer(pos.x, pos.y, pos.z, 64, false);
            if (isNull(player)) return;
            player.addPotionEffect(<potion:minecraft:regeneration>.makePotionEffect(80, 2, false, false));
        }
    } else {
        tileEntity.updateCustomData({time: 1});
    }
};
cure.register();
//治疗图腾
//每10秒给64格内最近的的玩家一次4秒的生命恢复3

val block = VanillaFactory.createExpandBlock("cure_totem", <blockmaterial:wood>);
block.tileEntity = cure;
block.register();
