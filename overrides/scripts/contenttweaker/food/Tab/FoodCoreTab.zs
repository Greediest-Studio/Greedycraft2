#loader contenttweaker
#priority 3001

import mods.contenttweaker.CreativeTab;
import mods.contenttweaker.VanillaFactory;
import mods.contenttweaker.Item;

val foodcore as CreativeTab = VanillaFactory.createCreativeTab("foodcore", <item:minecraft:dragon_egg>);
foodcore.register();