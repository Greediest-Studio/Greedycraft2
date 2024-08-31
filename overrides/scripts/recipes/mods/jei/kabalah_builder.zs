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

var kabbalahJEI as IJeiPanel = JEI.createJei("kabbalah", "生命树构建器");
kabbalahJEI.setModid("gct_ores");
kabbalahJEI.setIcon(<gct_mobs:kabalah_builder_block>);
kabbalahJEI.setBackground(IJeiUtils.createBackground(150, 130));
kabbalahJEI.addRecipeCatalyst(<gct_mobs:kabalah_builder_block>);
kabbalahJEI.addSlot(IJeiUtils.createItemSlot("1", 70, 10, true, true));
kabbalahJEI.addSlot(IJeiUtils.createItemSlot("2", 100, 22, true, true));
kabbalahJEI.addSlot(IJeiUtils.createItemSlot("3", 40, 22, true, true));
kabbalahJEI.addSlot(IJeiUtils.createItemSlot("4", 100, 46, true, true));
kabbalahJEI.addSlot(IJeiUtils.createItemSlot("5", 40, 46, true, true));
kabbalahJEI.addSlot(IJeiUtils.createItemSlot("6", 70, 58, true, true));
kabbalahJEI.addSlot(IJeiUtils.createItemSlot("7", 40, 70, true, true));
kabbalahJEI.addSlot(IJeiUtils.createItemSlot("8", 100, 70, true, true));
kabbalahJEI.addSlot(IJeiUtils.createItemSlot("9", 70, 82, true, true));
kabbalahJEI.addSlot(IJeiUtils.createItemSlot("10", 70, 106, true, true));
kabbalahJEI.addSlot(IJeiUtils.createItemSlot("aur", 4, 22, true, true));
kabbalahJEI.addSlot(IJeiUtils.createItemSlot("soph", 4, 46, true, true));
kabbalahJEI.addSlot(IJeiUtils.createItemSlot("ain", 4, 70, true, true));
kabbalahJEI.addSlot(IJeiUtils.createItemSlot("output", 125, 46, false, true));
kabbalahJEI.addElement(IJeiUtils.createFontInfoElement("Aur", 5, 14, 0x000000));
kabbalahJEI.addElement(IJeiUtils.createFontInfoElement("Soph", 5, 38, 0x000000));
kabbalahJEI.addElement(IJeiUtils.createFontInfoElement("Ain", 5, 62, 0x000000));
kabbalahJEI.register();

function createKabbalahBuilderJEI(output as IItemStack, slot1 as IItemStack, slot2 as IItemStack, slot3 as IItemStack, slot4 as IItemStack, slot5 as IItemStack, slot6 as IItemStack, slot7 as IItemStack, slot8 as IItemStack, slot9 as IItemStack, slot10 as IItemStack, level as int) as bool {
    var recipe as IJeiRecipe = JEI.createJeiRecipe("kabbalah");
    recipe.addInput(slot1);
    recipe.addInput(slot2);
    recipe.addInput(slot3);
    recipe.addInput(slot4);
    recipe.addInput(slot5);
    recipe.addInput(slot6);
    recipe.addInput(slot7);
    recipe.addInput(slot8);
    recipe.addInput(slot9);
    recipe.addInput(slot10);
    if (level == 1) {
        recipe.addInput(<gct_mobs:kabalah_ring_aur>);
    } else if (level == 2) {
        recipe.addInput(<gct_mobs:kabalah_ring_aur>);
        recipe.addInput(<gct_mobs:kabalah_ring_soph>);
    } else if (level == 3) {
        recipe.addInput(<gct_mobs:kabalah_ring_aur>);
        recipe.addInput(<gct_mobs:kabalah_ring_soph>);
        recipe.addInput(<gct_mobs:kabalah_ring_ain>);
    }
    recipe.addOutput(output);
    recipe.build();
}

createKabbalahBuilderJEI(<gct_mobs:kabalah_ring_aur>,
    <gct_mobs:rune_active_1>,
    <gct_mobs:rune_active_2>,
    <gct_mobs:rune_active_3>,
    <gct_mobs:rune_active_4>,
    <gct_mobs:rune_active_5>,
    <gct_mobs:rune_active_6>,
    <gct_mobs:rune_active_7>,
    <gct_mobs:rune_active_8>,
    <gct_mobs:rune_active_9>,
    <gct_mobs:rune_active_10>, 0);

createKabbalahBuilderJEI(<gct_mobs:elf_passes> * 2, 
    <gct_mobs:elementium_fusionplate>,
    <gct_mobs:elementium_fusionplate>,
    <gct_mobs:elementium_fusionplate>,
    <gct_mobs:elementium_fusionplate>,
    <gct_mobs:elementium_fusionplate>,
    <gct_mobs:orichalcos_fusionplate>,
    <gct_mobs:elementium_fusionplate>,
    <gct_mobs:elementium_fusionplate>,
    <gct_mobs:elementium_fusionplate>,
    null, 1);