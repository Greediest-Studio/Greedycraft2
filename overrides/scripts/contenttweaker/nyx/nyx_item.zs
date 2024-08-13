#loader contenttweaker
import mods.contenttweaker.VanillaFactory;
import mods.contenttweaker.Item;


val fallen_star as Item = VanillaFactory.createItem("fallen_star");
fallen_star.register();

val meteor_ingot as Item = VanillaFactory.createItem("meteor_ingot");
meteor_ingot.register();

val meteor_shard as Item = VanillaFactory.createItem("meteor_shard");
meteor_shard.register();