/*
Copyright Bob Bartsch, 2023

This code is governed by the
Creative Commons Attribution–NonCommercial License
https://creativecommons.org/licenses/by-nc/3.0/

(Meaning: credit me if you modify and/or redistribute
this code. Also, you may not sell this code.)
*/

#modloaded qmd

import crafttweaker.oredict.IOreDict;
import crafttweaker.oredict.IOreDictEntry;
import mods.nuclearcraft.FissionModerator;


oreDict.ingotYttriumHydride;
<ore:ingotYttriumHydride>.add(<contenttweaker:yttrium_hydride>);

mods.nuclearcraft.Infuser.addRecipe(<ore:ingotYttrium>, <fluid:hydrogen> * 1000, <ore:ingotYttriumHydride>);


recipes.addShaped(<contenttweaker:yttriumhydride_mod>,[[<ore:ingotYttriumHydride>, <ore:ingotYttriumHydride>, <ore:ingotYttriumHydride>],[<ore:ingotYttriumHydride>, <ore:ingotYttriumHydride>, <ore:ingotYttriumHydride>],[<ore:ingotYttriumHydride>,<ore:ingotYttriumHydride>,<ore:ingotYttriumHydride>]]);
mods.nuclearcraft.FissionModerator.add(<contenttweaker:yttriumhydride_mod>, 15, 1.08);
