#loader contenttweaker
import mods.contenttweaker.MaterialBuilder;
import mods.contenttweaker.MaterialSystem;
import mods.contenttweaker.Part;


function addMaterial(name as string , Color as string , Part as string[]) {
    MaterialSystem.getMaterialBuilder().setName(name).setColor(Color).build().registerParts(Part);
}

//例子
//addMaterial("矿物辞典名称", 0x+16进制颜色代码, Part1);
//生成锭，粉，板，块，矿石
//val Part1 as string[]=["ingot","dust","plate","block","ore"];
//addMaterial("Abyssalnite",0x6227b3,Part1);

