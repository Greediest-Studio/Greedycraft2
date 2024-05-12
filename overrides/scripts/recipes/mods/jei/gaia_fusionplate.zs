/*
 * This script is created for the GreedyCraft modpack by TCreopargh.
 * You may NOT use this script in any other publicly distributed modpack without my permission.
 */

#priority 1400

import crafttweaker.item.IItemStack;

import mods.jei.JEI;
import mods.randomtweaker.jei.IJeiPanel;
import mods.randomtweaker.jei.IJeiUtils;
import mods.randomtweaker.jei.IJeiRecipe;

var gaiaJEI as IJeiPanel = JEI.createJei("gaia_fusionplate", "盖亚凝聚板");
gaiaJEI.setModid("botania_tweaks");
gaiaJEI.setIcon(<botanicadds:gaia_plate>);
gaiaJEI.setBackground(IJeiUtils.createBackground(150, 130));
gaiaJEI.addRecipeCatalyst(<botanicadds:gaia_plate>);
gaiaJEI.addSlot(IJeiUtils.createItemSlot("1", 32, 1, true, false));
gaiaJEI.addSlot(IJeiUtils.createItemSlot("2", 54, 1, true, false));
gaiaJEI.addSlot(IJeiUtils.createItemSlot("3", 76, 1, true, false));
gaiaJEI.addSlot(IJeiUtils.createItemSlot("4", 98, 1, true, false));
gaiaJEI.addSlot(IJeiUtils.createItemSlot("blocktop", 65, 66, true, false));
gaiaJEI.addSlot(IJeiUtils.createItemSlot("blockcorner1", 65, 82, true, false));
gaiaJEI.addSlot(IJeiUtils.createItemSlot("blockcorner2", 33, 98, true, false));
gaiaJEI.addSlot(IJeiUtils.createItemSlot("blockcorner3", 97, 98, true, false));
gaiaJEI.addSlot(IJeiUtils.createItemSlot("blockcorner4", 65, 114, true, false));
gaiaJEI.addSlot(IJeiUtils.createItemSlot("blockside1", 49, 90, true, false));
gaiaJEI.addSlot(IJeiUtils.createItemSlot("blockside2", 81, 90, true, false));
gaiaJEI.addSlot(IJeiUtils.createItemSlot("blockside3", 49, 106, true, false));
gaiaJEI.addSlot(IJeiUtils.createItemSlot("blockside4", 81, 106, true, false));
gaiaJEI.addSlot(IJeiUtils.createItemSlot("blockcenter", 65, 98, true, false));
gaiaJEI.addSlot(IJeiUtils.createItemSlot("output", 65, 44, false, false));
gaiaJEI.addElement(IJeiUtils.createArrowElement(65, 22, 3));
gaiaJEI.addElement(IJeiUtils.createJeiManaBarElement(23, 62, 1000000, 0));
gaiaJEI.register();

var recipe as IJeiRecipe = JEI.createJeiRecipe("gaia_fusionplate");
recipe.addInput(<defiledlands:remorseful_gem>);
recipe.addInput(<botania:manaresource:9>);
recipe.addInput(<botania:manaresource:14>);
recipe.addInput(<minecraft:nether_star>);
recipe.addInput(<botanicadds:gaia_plate>);
for i in 1 to 5 {
    recipe.addInput(<botanicadds:dreamrock>);
}
for i in 1 to 5 {
    recipe.addInput(<botanicadds:elven_lapis_block>);
}
recipe.addInput(<botanicadds:dreamrock>);
recipe.addOutput(<botanicadds:gaiasteel_ingot> * 4);
recipe.build();
