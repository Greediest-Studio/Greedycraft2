/*
Copyright Bob Bartsch, 2026

This code is governed by the
Creative Commons Attribution–NonCommercial License
https://creativecommons.org/licenses/by-nc/3.0/

(Meaning: credit me if you modify and/or redistribute
this code. Also, you may not sell this code.)
*/

#modloaded trinity

import crafttweaker.item.IIngredient;
import crafttweaker.item.IItemStack;

/* -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- Subcritical Spheres -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- */
val pitList = [<trinity:u233_pit>,<trinity:u235_pit>,<trinity:pu239_pit>,<trinity:am242_pit>,<trinity:cm247_pit>,<trinity:bk248_pit>,<trinity:cf249_pit>,<trinity:cf251_pit>] as IItemStack[];
val fis = [<contenttweaker:wgu_233>,<contenttweaker:wgu_235>,<contenttweaker:wgp_239>,<contenttweaker:wga_242>,<contenttweaker:wgcm_247>,<contenttweaker:wgb_248>,<contenttweaker:wgcf_249>,<contenttweaker:wgcf_251>] as IIngredient[];
val poSource = <trinity:neutron_initiator>;

for i,pit in pitList {
	recipes.addShaped(pit,[[fis[i], fis[i], fis[i]], [fis[i], poSource, fis[i]], [fis[i], fis[i], fis[i]]]);
}