#loader contenttweaker
#modloaded tconstruct

import mods.contenttweaker.tconstruct.TraitBuilder;
import mods.contenttweaker.conarm.ArmorTraitBuilder;

val a = TraitBuilder.create('tooltrait');
a.color = 0xD1310D;
a.localizedName = game.localize('test.tooltrait.name');
a.localizedDescription = game.localize('test.tooltrait.description');
a.addItem(<item:minecraft:grass>, 1, 1);
a.register();

val b = ArmorTraitBuilder.create("armortrait");
b.color = 0xD1310D;
b.localizedName = game.localize("test.armortrait.name");
b.localizedDescription = game.localize("test.armortrait.description");
b.addItem(<item:minecraft:dirt>, 1, 1);
b.register();