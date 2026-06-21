import mods.betterendforge.Alloying;

Alloying.removeRecipe(<betterendforge:terminite_ingot>);
Alloying.removeRecipe(<betterendforge:aeternium_ingot>);

Alloying.addRecipe("enderite", <additions:enderite_ingot>, <gct_mobs:resonated_scrap> * 2, <thermalfoundation:material:135> * 4, 1.0d, 100);
Alloying.addRecipe("resonated_debris", <gct_mobs:resonated_scrap> * 5, <gct_mobs:resonate_debris>, null);
Alloying.addRecipe("resonated_debris2", <gct_mobs:resonated_scrap> * 3, <gct_mobs:resonate_debris_cracked>, null);