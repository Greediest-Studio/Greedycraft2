import mods.fluidintetweaker.FITweaker;
import mods.fluidintetweaker.FBTweaker;

FITweaker.addJEIRecipeWrapper(<liquid:astralsorcery.liquidstarlight>, 2, <liquid:lava>, 2, FITweaker.outputBuilder()
    .addEvent(FITweaker.eventBuilder().createSetBlockEvent(<blockstate:minecraft:sand>)));
FITweaker.addJEIRecipeWrapper(<liquid:sand>, 2, <liquid:water>, 2, FITweaker.outputBuilder()
    .addEvent(FITweaker.eventBuilder().createSetBlockEvent(<blockstate:biomesoplenty:mud>)));
FITweaker.addJEIRecipeWrapper(<liquid:blood>, 2, <liquid:water>, 2, FITweaker.outputBuilder()
    .addEvent(FITweaker.eventBuilder().createSetBlockEvent(<blockstate:biomesoplenty:flesh>)));
FITweaker.addJEIRecipeWrapper(<liquid:water>, 2, <liquid:liquidcoralium>, 2, FITweaker.outputBuilder()
    .addEvent(FITweaker.eventBuilder().createSetFluidEvent(<liquid:liquidcoralium>, true)), "非海洋群系中");
FITweaker.addJEIRecipeWrapper(<liquid:water>, 2, <liquid:liquidcoralium>, 2, FITweaker.outputBuilder()
    .addEvent(FITweaker.eventBuilder().createSetBlockEvent(<blockstate:minecraft:cobblestone>)), "海洋群系中");
FITweaker.addJEIRecipeWrapper(<blockstate:minecraft:stone>, <liquid:liquidcoralium>, 2, FITweaker.outputBuilder()
    .addEvent(FITweaker.eventBuilder().createSetBlockEvent(<blockstate:abyssalcraft:stone>.withProperty("type", "abyssalstone"))));
FITweaker.addJEIRecipeWrapper(<blockstate:minecraft:cobblestone>, <liquid:liquidcoralium>, 2, FITweaker.outputBuilder()
    .addEvent(FITweaker.eventBuilder().createSetBlockEvent(<blockstate:abyssalcraft:cobblestone>.withProperty("type", "abyssalstone"))));
FITweaker.addJEIRecipeWrapper(<blockstate:minecraft:stonebrick>, <liquid:liquidcoralium>, 2, FITweaker.outputBuilder()
    .addEvent(FITweaker.eventBuilder().createSetBlockEvent(<blockstate:abyssalcraft:abybrick>.withProperty("type", "normal"))));
FITweaker.addJEIRecipeWrapper(<blockstate:minecraft:lapis_ore>, <liquid:liquidcoralium>, 2, FITweaker.outputBuilder()
    .addEvent(FITweaker.eventBuilder().createSpawnEntityItemEvent(<abyssalcraft:coralium>, 1)));
FITweaker.addJEIRecipeWrapper(<blockstate:minecraft:redstone_ore>, <liquid:liquidcoralium>, 2, FITweaker.outputBuilder()
    .addEvent(FITweaker.eventBuilder().createSpawnEntityItemEvent(<abyssalcraft:coralium>, 1)));
FITweaker.addJEIRecipeWrapper(<blockstate:minecraft:coal_ore>, <liquid:liquidcoralium>, 2, FITweaker.outputBuilder()
    .addEvent(FITweaker.eventBuilder().createSpawnEntityItemEvent(<abyssalcraft:coralium>, 1)));
FITweaker.addJEIRecipeWrapper(<blockstate:minecraft:iron_ore>, <liquid:liquidcoralium>, 2, FITweaker.outputBuilder()
    .addEvent(FITweaker.eventBuilder().createSetBlockEvent(<blockstate:abyssalcraft:abyiroore>)));
FITweaker.addJEIRecipeWrapper(<blockstate:minecraft:gold_ore>, <liquid:liquidcoralium>, 2, FITweaker.outputBuilder()
    .addEvent(FITweaker.eventBuilder().createSetBlockEvent(<blockstate:abyssalcraft:abygolore>)));
FITweaker.addJEIRecipeWrapper(<blockstate:minecraft:diamond_ore>, <liquid:liquidcoralium>, 2, FITweaker.outputBuilder()
    .addEvent(FITweaker.eventBuilder().createSetBlockEvent(<blockstate:abyssalcraft:abydiaore>)));
FITweaker.addJEIRecipeWrapper(<blockstate:thermalfoundation:ore>.withProperty("type", "tin"), <liquid:liquidcoralium>, 2, FITweaker.outputBuilder()
    .addEvent(FITweaker.eventBuilder().createSetBlockEvent(<blockstate:abyssalcraft:abytinore>)));
FITweaker.addJEIRecipeWrapper(<blockstate:thermalfoundation:ore>.withProperty("type", "copper"), <liquid:liquidcoralium>, 2, FITweaker.outputBuilder()
    .addEvent(FITweaker.eventBuilder().createSetBlockEvent(<blockstate:abyssalcraft:abycopore>)));
FITweaker.addJEIRecipeWrapper(<blockstate:abyssalcraft:nitreore>, <liquid:liquidcoralium>, 2, FITweaker.outputBuilder()
    .addEvent(FITweaker.eventBuilder().createSetBlockEvent(<blockstate:abyssalcraft:abynitore>)));
FITweaker.addJEIRecipeWrapper(<blockstate:abyssalcraft:coraliumore>, <liquid:liquidcoralium>, 2, FITweaker.outputBuilder()
    .addEvent(FITweaker.eventBuilder().createSetBlockEvent(<blockstate:abyssalcraft:abycorore>)));
FITweaker.addJEIRecipeWrapper(<blockstate:thermalfoundation:ore>.withProperty("type", "silver"), <liquid:liquidcoralium>, 2, FITweaker.outputBuilder()
    .addEvent(FITweaker.eventBuilder().createSetBlockEvent(<blockstate:abyssalcraft:abylcorore>)));
FITweaker.addJEIRecipeWrapper(<blockstate:thermalfoundation:ore>.withProperty("type", "aluminum"), <liquid:liquidcoralium>, 2, FITweaker.outputBuilder()
    .addEvent(FITweaker.eventBuilder().createSetBlockEvent(<blockstate:abyssalcraft:abylcorore>)));
FITweaker.addJEIRecipeWrapper(<blockstate:minecraft:emerald_ore>, <liquid:liquidcoralium>, 2, FITweaker.outputBuilder()
    .addEvent(FITweaker.eventBuilder().createSetBlockEvent(<blockstate:abyssalcraft:abypcorore>)));
FITweaker.addJEIRecipeWrapper(<blockstate:biomesoplenty:gem_ore>.withProperty("variant", "ruby"), <liquid:liquidcoralium>, 2, FITweaker.outputBuilder()
    .addEvent(FITweaker.eventBuilder().createSetBlockEvent(<blockstate:abyssalcraft:abypcorore>)));
FITweaker.addJEIRecipeWrapper(<blockstate:biomesoplenty:gem_ore>.withProperty("variant", "sapphire"), <liquid:liquidcoralium>, 2, FITweaker.outputBuilder()
    .addEvent(FITweaker.eventBuilder().createSetBlockEvent(<blockstate:abyssalcraft:abypcorore>)));
FITweaker.addJEIRecipeWrapper(<liquid:water>, 2, <liquid:liquidantimatter>, 2, FITweaker.outputBuilder()
    .addEvent(FITweaker.eventBuilder().createSetBlockEvent(<blockstate:minecraft:packed_ice>)));
FITweaker.addJEIRecipeWrapper(<liquid:lava>, 2, <liquid:liquidantimatter>, 2, FITweaker.outputBuilder()
    .addEvent(FITweaker.eventBuilder().createSetBlockEvent(<blockstate:minecraft:obsidian>)));
FITweaker.addJEIRecipeWrapper(<liquid:liquidcoralium>, 2, <liquid:liquidantimatter>, 2, FITweaker.outputBuilder()
    .addEvent(FITweaker.eventBuilder().createSetBlockEvent(<blockstate:abyssalcraft:stone>.withProperty("type", "abyssalstone"))));

FITweaker.addRecipe(<blockstate:thaumcraft:ore_amber>, <liquid:dawnstone>, true, <blockstate:additions:solarys_ore>);
