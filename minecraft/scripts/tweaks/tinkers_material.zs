/*
 * This script is created for the GreedyCraft II modpack by mc_Edwin.
 * You may NOT use this script in any other publicly distributed modpack without my permission.
 */


import modtweaker.tconstruct.ITICMaterial;
import crafttweaker.conarm.IConArmMaterial;
import zentraits.TraitManager;

#priority 2700


function setMaterialHead(mat as ITICMaterial, atk as float, speed as float, headdura as int, harv as int) {
    mat.attackHead = atk;
    mat.miningSpeedHead = speed;
    mat.durabilityHead = headdura;
    mat.harvestLevelHead = harv;
}

function setMaterialHandle(mat as ITICMaterial, index as float, handdura as int) {
    mat.modifierHandle = index;
    mat.durabilityHandle = handdura;
}

function setMaterialExtra(mat as ITICMaterial, extrdura as int) {
    mat.durabilityExtra = extrdura;
}

function setMaterialCore(mat as IConArmMaterial, coredura as float, def as float) {
    mat.durabilityCore = coredura;
    mat.defense = def;
}

function setMaterialPlates(mat as IConArmMaterial, modify as float, platedura as float, tough as float) {
    mat.modifier = modify;
    mat.durabilityPlates = platedura;
    mat.toughness = tough;
}

function setMaterialTrim(mat as IConArmMaterial, trimdura as float) {
    mat.durabilityTrim = trimdura;
}

function setMaterialArmor(mat as IConArmMaterial, coredura as float, def as float, modify as float, platedura as float, tough as float, trimdura as float) {
    setMaterialCore(mat, coredura, def);
    setMaterialPlates(mat, modify, platedura, tough);
    setMaterialTrim(mat, trimdura);
}

setMaterialHead(<ticmat:moretcon.shockwave>, 90, 24, 6400, 10);

setMaterialArmor(<conmat:polarium>, 170.0, 68.5, 9.0, 115.0, 7.0, 120.0);
setMaterialArmor(<conmat:altairium>, 140.0, 62.4, 7.9, 96.0, 8.0, 98.0);
setMaterialArmor(<conmat:halleium>, 135.0, 59.6, 10.0, 87.0, 8.5, 94.0);
setMaterialArmor(<conmat:hothium>, 158.0, 63.5, 8.5, 105.0, 6.0, 109.0);
setMaterialArmor(<conmat:oraclium>, 200.0, 64.0, 10.0, 140.0, 7.0, 145.0);
setMaterialArmor(<conmat:stellarium>, 240.0, 90.0, 16.0, 200.0, 6.0, 200.0);
setMaterialArmor(<conmat:stellarium_obsidian>, 265.0, 90.0, 18.0, 250.0, 7.0, 225.0);
setMaterialArmor(<conmat:steamium>, 360.0, 85.0, 11.8, 265.0, 7.0, 265.0);
setMaterialArmor(<conmat:tanatonium>, 300.0, 86.0, 16.0, 160.0, 6.5, 160.0);
setMaterialArmor(<conmat:imitatium>, 450.0, 118.0, 14.0, 320.0, 10.0, 320.0);
setMaterialArmor(<conmat:tonium>, 120.0, 60.0, 9.2, 75.0, 7.0, 78.0);
setMaterialArmor(<conmat:immersed_silver>, 140.0, 59.0, 9.0, 80.0, 6.0, 84.0);
setMaterialArmor(<conmat:irisia>, 12.0, 19.0, 1.1, 8.0, 3.0, 7.0);
setMaterialArmor(<conmat:decurrium>, 140.0, 50.0, 7.0, 60.0, 6.0, 75.0);
setMaterialArmor(<conmat:solita>, 85.0, 48.0, 1.3, 40.0, 4.0, 45.0);
setMaterialArmor(<conmat:chloroplast>, 96.0, 36.0, 9.0, 55.0, 3.4, 71.0);