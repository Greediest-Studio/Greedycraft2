#loader contenttweaker

//参考整合包https://github.com/Krutoy242/Enigmatica2Expert-Extended

import crafttweaker.world.IBlockPos;
import crafttweaker.world.IWorld;
import crafttweaker.util.Position3f;

function play(soundId as string, pos as IBlockPos, world as IWorld) as void {
    val targetDim = world.dimension;
    val center as Position3f = Position3f.create(pos.x as float, pos.y as float, pos.z as float);
    val maxDistSq = 4.0 * 4.0;

    for player in world.getAllPlayers() {

        if(player.world.dimension != targetDim) continue;

        val dx = player.x - center.x;
        val dy = player.y - center.y;
        val dz = player.z - center.z;
        val distSq = dx*dx + dy*dy + dz*dz;

        if(distSq > maxDistSq) continue;

        player.sendPlaySoundPacket(soundId,"ambient",center,0.05F,1.0F);
    }
}
