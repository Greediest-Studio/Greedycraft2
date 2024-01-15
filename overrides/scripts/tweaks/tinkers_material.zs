/*
 * This script is created for the GreedyCraft II modpack by mc_Edwin.
 * You may NOT use this script in any other publicly distributed modpack without my permission.
 */


import modtweaker.tconstruct.ITICMaterial;
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

setMaterialHead(<ticmat:moretcon.shockwave>, 90, 24, 6400, 10);

<conmat:moretcon.shockwave>.durabilityCore = 0;
<conmat:moretcon.shockwave>.durabilityPlates = 0;
<conmat:moretcon.shockwave>.durabilityTrim = 0;
<conmat:moretcon.shockwave>.modifier = 0;
<conmat:moretcon.shockwave>.defense = 0;
<conmat:moretcon.shockwave>.toughness = 0;
