/*
 * This script is created for the GreedyCraft modpack by TCreopargh.
 * You may NOT use this script in any other publicly distributed modpack without my permission. 
 */

#priority 500

import crafttweaker.item.IItemStack;
import crafttweaker.data.IData;
import crafttweaker.item.IIngredient;

import mods.jei.JEI;

val descriptions as string[][IIngredient] = {
    <cyclicmagic:heart_food> : [game.localize("greedycraft.jei.cyclicmagic.heart_food.desc.0")],
    <scalinghealth:heartcontainer> : [game.localize("greedycraft.jei.scalinghealth.heartcontainer.desc.0")],
    <projecte:item.pe_transmutation_tablet> : [game.localize("greedycraft.jei.projecte.item.pe_transmutation_tablet.desc.0")],
    <projectex:arcane_tablet> : [game.localize("greedycraft.jei.projectex.arcane_tablet.desc.0")],
    <additions:matter_block> : [game.localize("greedycraft.jei.additions.greedycraft_matter_block.desc.0")],
    <additions:royal_gel> : [game.localize("greedycraft.jei.additions.greedycraft_royal_gel.desc.0")],
    <defiledlands:essence_destroyer> : [game.localize("greedycraft.jei.defiledlands.essence_destroyer.desc.0")],
    <defiledlands:essence_mourner> : [game.localize("greedycraft.jei.defiledlands.essence_mourner.desc.0")],
    <additions:netherite_scrap> : [game.localize("greedycraft.jei.additions.greedycraft_netherite_scrap.desc.0")],
    <tofucraft:nigari> : [game.localize("greedycraft.jei.tofucraft.nigari.desc.0")],
    <tofucraft:tofu_food:0> : [game.localize("greedycraft.jei.tofucraft.tofukinu.desc.0")],
    <tofucraft:tofu_food:1> : [game.localize("greedycraft.jei.tofucraft.tofumomen.desc.0")],
    <tofucraft:tofu_food:2> : [game.localize("greedycraft.jei.tofucraft.tofuishi.desc.0")],
    <tofucraft:tofu_material> : [game.localize("greedycraft.jei.tofucraft.tofumetal.desc.0")],
    <tofucraft:blocktofukinu> : [game.localize("greedycraft.jei.tofucraft.tofukinu.desc.0")],
    <tofucraft:blocktofumomen> : [game.localize("greedycraft.jei.tofucraft.tofumomen.desc.0")],
    <tofucraft:blocktofuishi> : [game.localize("greedycraft.jei.tofucraft.tofuishi.desc.0")],
    <tofucraft:blocktofumetal> : [game.localize("greedycraft.jei.tofucraft.tofumetal.desc.0")]
};

val hides as IIngredient[] = [
    <additions:ocd_certificate>
] as IIngredient[];

for ingredient in hides {
    for item in ingredient.items {
        JEI.hide(item);
    }
}

for ingredient in descriptions {
    var description = descriptions[ingredient] as string[];
    JEI.addDescription(ingredient, description);
}
