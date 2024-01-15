#loader contenttweaker
import mods.contenttweaker.MaterialBuilder;
import mods.contenttweaker.MaterialSystem;
import mods.contenttweaker.Material;
import mods.contenttweaker.Part;
import mods.contenttweaker.PartBuilder;
import mods.contenttweaker.RegisterMaterialPart;
import mods.contenttweaker.MaterialPart;
import mods.mekatweaker.Gas;
import mods.mekatweaker.GasFactory;
import mods.mekatweaker.InfuserType;

val gasPartType = MaterialSystem.createPartType("mekanism_gas_type", function(materialPart) {
    val material = materialPart.getMaterial();
    val part = materialPart.getPart();
    logger.logInfo("Registering Gas MaterialPart with Part " ~ materialPart.getPart().getName() ~ " and Material " ~ material.getName());
	var gas = GasFactory.createGas(material.getName().toLowerCase() ~ part.getName().toLowerCase());

	gas.setIcon("blocks/gas/" ~ part.getName().toLowerCase());
	gas.setColor(material.getColor());
	gas.setColorize(true);

	game.setLocalization("gas." ~ material.getName().toLowerCase() ~ part.getName().toLowerCase(), materialPart.getLocalizedName());
    gas.register();
});

//创建部件(纯净的矿物浆液气体)
val CleanOreSlurryGasPart = MaterialSystem.getPartBuilder()
    .setName("clean_ore_slurry_gas")
    .setPartType(gasPartType)
.build();

//创建部件(污浊的矿物浆液气体)
val DirtyOreSlurryGasPart = MaterialSystem.getPartBuilder()
    .setName("dirty_ore_slurry_gas")
    .setPartType(gasPartType)
.build();

function addMaterial(name as string , Color as string , Part as string[]) {
    MaterialSystem.getMaterialBuilder().setName(name).setColor(Color).build().registerParts(Part);
}


//例子
//addMaterial("矿物辞典名称", 0x+16进制颜色代码, Part1);
//水晶，碎片，碎块，污浊粉，纯净矿物浆液，污浊矿物浆液
//val Part2 as string[]=["crystal","shard","clump","dirty_dust","clean_ore_slurry_gas","dirty_ore_slurry_gas"];
//addMaterial("Abyssalnite",0x6227b3,Part2);