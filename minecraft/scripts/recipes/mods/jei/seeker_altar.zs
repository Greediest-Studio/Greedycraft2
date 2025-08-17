/*
 * This script is created for the GreedyCraft II modpack by mc_Edwin.
 * You may NOT use this script in any other publicly distributed modpack without my permission.
 */

#priority 1400

import crafttweaker.item.IItemStack;

import mods.jei.JEI;
import mods.randomtweaker.jei.IJeiPanel;
import mods.randomtweaker.jei.IJeiUtils;
import mods.randomtweaker.jei.IJeiRecipe;

var seeker_altarJEI as IJeiPanel = JEI.createJei("seeker_altar", "窥视祭坛");
seeker_altarJEI.setModid("gct_aby");
seeker_altarJEI.setIcon(<gct_aby:seek_altar>);
seeker_altarJEI.addRecipeCatalyst(<gct_aby:seek_altar>);
seeker_altarJEI.setBackground(IJeiUtils.createBackground(0, 0, 128, 128, "randomtweaker:textures/gui/seeker_altar.png"));
seeker_altarJEI.addSlot(IJeiUtils.createItemSlot("PE", 79, 47, true, false));
seeker_altarJEI.addSlot(IJeiUtils.createItemSlot("input", 79, 79, true, false));
seeker_altarJEI.addSlot(IJeiUtils.createItemSlot("output", 105, 64, false, true));
seeker_altarJEI.register();

function createSeekerAltarJEI(output as IItemStack, input as IItemStack) {
    JEI.createJeiRecipe("seeker_altar").addInput(<gct_aby:solid_pot_energy> * 4).addInput(input).addOutput(output).build();
}

createSeekerAltarJEI(<gct_aby:azathothium_ore>, <gct_aby:azathothium_ore_complex>);
createSeekerAltarJEI(<gct_aby:nyarlathotepium_ore>, <gct_aby:nyralathotepium_ore_complex>);
createSeekerAltarJEI(<gct_aby:yogsothothium_ore>, <gct_aby:yogsothothium_ore_complex>);
createSeekerAltarJEI(<gct_aby:shubniggurathium_ore>, <gct_aby:shubniggurathium_ore_complex>);