/*
 * This script is created for the GreedyCraft Tweaks by 咕咕咕.
 */


#priority 50

import crafttweaker.oredict.IOreDictEntry;
import crafttweaker.item.IItemStack;
import crafttweaker.data.IData;
import crafttweaker.item.IIngredient;
import crafttweaker.liquid.ILiquidStack;
import crafttweaker.events.IEventManager;
import mods.modularmachinery.RecipeFinishEvent;
import mods.zenutils.command.ZenCommand;
import mods.zenutils.command.ZenUtilsCommandSender;
import mods.zenutils.command.CommandUtils;

import mods.modularmachinery.RecipeBuilder;
import mods.modularmachinery.RecipeCheckEvent;
import mods.ctutils.utils.Math;
import mods.jei.JEI;

RecipeBuilder.newBuilder("bot_soul", "asgard_portal", 20)
    .addFluidInput(<liquid:mana> * 10000)
    .addItemInput(<botania:manaresource:5> * 2)
    .addItemOutput(<gct_mobs:botanical_soul> * 1)
    .build();

RecipeBuilder.newBuilder("photonium", "asgard_portal", 20)
    .addFluidInput(<liquid:mana> * 100)
    .addItemInput(<ore:ingotIron> * 2)
    .addItemOutput(<extrabotany:material:8> * 1)
    .build();

RecipeBuilder.newBuilder("shadow", "asgard_portal", 20)
    .addFluidInput(<liquid:mana> * 100)
    .addItemInput(<extendedcrafting:material> * 2)
    .addItemOutput(<additions:shadowium_ingot> * 1)
    .build();

RecipeBuilder.newBuilder("dirt", "asgard_portal", 200)
    .addFluidInput(<liquid:mana> * 100000)
    .addItemInput(<minecraft:grass> * 1)
    .addItemOutput(<botania:enchantedsoil> * 1)
    .build();

RecipeBuilder.newBuilder("diamond1", "asgard_portal", 1)
    .addFluidInput(<liquid:mana> * 30)
    .addItemInput(<minecraft:diamond> * 1)
    .addItemOutput(<botania:manaresource:2> * 1)
    .build();

RecipeBuilder.newBuilder("diamond2", "asgard_portal", 1)
    .addFluidInput(<liquid:mana> * 30)
    .addItemInput(<botania:manaresource:2> * 1)
    .addItemOutput(<botania:manaresource:9> * 1)
    .build();

RecipeBuilder.newBuilder("pearl1", "asgard_portal", 1)
    .addFluidInput(<liquid:mana> * 20)
    .addItemInput(<minecraft:ender_pearl> * 1)
    .addItemOutput(<botania:manaresource:1> * 1)
    .build();

RecipeBuilder.newBuilder("pearl2", "asgard_portal", 1)
    .addFluidInput(<liquid:mana> * 20)
    .addItemInput(<botania:manaresource:1> * 1)
    .addItemOutput(<botania:manaresource:8> * 1)
    .build();

RecipeBuilder.newBuilder("iron1", "asgard_portal", 1)
    .addFluidInput(<liquid:mana> * 10)
    .addItemInput(<minecraft:iron_ingot> * 1)
    .addItemOutput(<botania:manaresource> * 1)
    .build();

RecipeBuilder.newBuilder("iron2", "asgard_portal", 1)
    .addFluidInput(<liquid:mana> * 10)
    .addItemInput(<botania:manaresource>* 1)
    .addItemOutput(<botania:manaresource:7> * 1)
    .build();

RecipeBuilder.newBuilder("wood1", "asgard_portal", 1)
    .addFluidInput(<liquid:mana> * 10)
    .addItemInput(<ore:logWood>* 1)
    .addItemOutput(<botania:livingwood> * 1)
    .build();

RecipeBuilder.newBuilder("wood2", "asgard_portal", 1)
    .addFluidInput(<liquid:mana> * 10)
    .addItemInput(<botania:livingwood>* 1)
    .addItemOutput(<botania:dreamwood> * 1)
    .build();

RecipeBuilder.newBuilder("lapis1", "asgard_portal", 1)
    .addFluidInput(<liquid:mana> * 10)
    .addItemInput(<minecraft:dye:4>* 1)
    .addItemOutput(<botanicadds:mana_lapis> * 1)
    .build();

RecipeBuilder.newBuilder("lapis2", "asgard_portal", 1)
    .addFluidInput(<liquid:mana> * 10)
    .addItemInput(<botanicadds:mana_lapis> * 1)
    .addItemOutput(<botanicadds:elven_lapis> * 1)
    .build();

RecipeBuilder.newBuilder("emerald", "asgard_portal", 1)
    .addFluidInput(<liquid:mana> * 50)
    .addItemInput(<minecraft:emerald> * 1)
    .addItemOutput(<defiledlands:scarlite> * 1)
    .build();

RecipeBuilder.newBuilder("stone1", "asgard_portal", 1)
    .addFluidInput(<liquid:mana> * 1)
    .addItemInput(<minecraft:cobblestone> * 1)
    .addItemOutput(<botania:livingrock> * 1)
    .build();

RecipeBuilder.newBuilder("stone2", "asgard_portal", 1)
    .addFluidInput(<liquid:mana> * 1)
    .addItemInput(<botania:livingrock> * 1)
    .addItemOutput(<botanicadds:dreamrock> * 1)
    .build();

RecipeBuilder.newBuilder("lens", "asgard_portal", 100)
    .addFluidInput(<liquid:mana> * 1000)
    .addItemInput(<botania:lens:0> * 1)
    .addItemInput(<extrabotany:material:3> * 4)
    .addItemOutput(<extrabotany:lens:6>.withTag({}) * 1)
    .build();

RecipeBuilder.newBuilder("Otto_Apocalypse", "asgard_portal", 1000)
    .addFluidInput(<liquid:mana> * 1000000)
    .addItemInput(<akashictome:tome>.withTag({"akashictome:is_morphing": 1 as byte, display: {Lore: ["§6第14版", "§a§o好好看书了吗？"], Name: "§d§ka§r §b百科全书 §d§ka§r"}, "akashictome:data": {tconstruct: {id: "tconstruct:book", Count: 1 as byte, tag: {"akashictome:definedMod": "tconstruct"}, Damage: 0 as short}, bloodarsenal: {id: "guideapi:bloodarsenal-guide", Count: 1 as byte, tag: {"akashictome:definedMod": "bloodarsenal"}, Damage: 0 as short}, theoneprobe: {id: "theoneprobe:probenote", Count: 1 as byte, tag: {"akashictome:definedMod": "theoneprobe"}, Damage: 0 as short}, astralsorcery: {id: "astralsorcery:itemjournal", Count: 1 as byte, tag: {"akashictome:definedMod": "astralsorcery"}, Damage: 0 as short}, ftbquests: {id: "ftbquests:book", Count: 1 as byte, tag: {"akashictome:definedMod": "ftbquests"}, Damage: 0 as short}, rftools: {id: "rftools:rftools_shape_manual", Count: 1 as byte, tag: {"akashictome:definedMod": "rftools"}, Damage: 0 as short}, patchouli1: {id: "patchouli:guide_book", Count: 1 as byte, tag: {"akashictome:definedMod": "patchouli1", "patchouli:book": "patchouli:greedycraft_guide_book"}, Damage: 0 as short}, botania: {id: "botania:lexicon", Count: 1 as byte, tag: {"akashictome:definedMod": "botania"}, Damage: 0 as short}, rustic: {id: "rustic:book", Count: 1 as byte, tag: {"akashictome:definedMod": "rustic"}, Damage: 0 as short}, draconicevolution: {id: "draconicevolution:info_tablet", Count: 1 as byte, tag: {"akashictome:definedMod": "draconicevolution"}, Damage: 0 as short}, bloodmagic1: {id: "guideapi:bloodmagic-guide", Count: 1 as byte, tag: {"akashictome:definedMod": "bloodmagic1"}, Damage: 0 as short}, bibliocraft2: {id: "bibliocraft:atlasbook", Count: 1 as byte, tag: {"akashictome:definedMod": "bibliocraft2", atlasID: 1422948728}, Damage: 33 as short}, bibliocraft1: {id: "bibliocraft:slottedbook", Count: 1 as byte, tag: {"akashictome:definedMod": "bibliocraft1", authorName: "by Sir Hidington"}, Damage: 0 as short}, projecte: {id: "projecte:item.pe_manual", Count: 1 as byte, tag: {"akashictome:definedMod": "projecte"}, Damage: 0 as short}, mekanism: {id: "mekanism:dictionary", Count: 1 as byte, tag: {"akashictome:definedMod": "mekanism"}, Damage: 0 as short}, extrautils2: {id: "extrautils2:book", Count: 1 as byte, tag: {"akashictome:definedMod": "extrautils2"}, Damage: 0 as short}, thermalfoundation: {id: "thermalfoundation:tome_lexicon", Count: 1 as byte, tag: {"akashictome:definedMod": "thermalfoundation"}, Damage: 0 as short}, bibliocraft4: {id: "bibliocraft:testeritem", Count: 1 as byte, tag: {"akashictome:definedMod": "bibliocraft4", containerUpdate: 0 as byte, Inventory: []}, Damage: 0 as short}, actuallyadditions: {id: "actuallyadditions:item_booklet", Count: 1 as byte, tag: {"akashictome:definedMod": "actuallyadditions"}, Damage: 0 as short}, bibliocraft3: {id: "bibliocraft:biblioredbook", Count: 1 as byte, tag: {"akashictome:definedMod": "bibliocraft3", redstonebook: "by James Maxwell"}, Damage: 0 as short}, touhou_little_maid: {id: "patchouli:guide_book", Count: 1 as byte, tag: {"akashictome:definedMod": "touhou_little_maid", "patchouli:book": "touhou_little_maid:memorizable_gensokyo"}, Damage: 0 as short}, patchouli: {id: "patchouli:guide_book", Count: 1 as byte, tag: {"akashictome:definedMod": "patchouli", "patchouli:book": "patchouli:the_elysia_project"}, Damage: 0 as short}, abyssalcraft: {id: "abyssalcraft:necronomicon", Count: 1 as byte, tag: {"akashictome:definedMod": "abyssalcraft", PotEnergy: 0.0 as float}, Damage: 0 as short}, forestry1: {id: "forestry:catalogue", Count: 1 as byte, tag: {"akashictome:definedMod": "forestry1"}, Damage: 0 as short}, hammercore: {id: "hammercore:manual", Count: 1 as byte, tag: {"akashictome:definedMod": "hammercore"}, Damage: 0 as short}, cookingforblockheads: {id: "cookingforblockheads:recipe_book", Count: 1 as byte, tag: {"akashictome:definedMod": "cookingforblockheads"}, Damage: 0 as short}, xnet: {id: "xnet:xnet_manual", Count: 1 as byte, tag: {"akashictome:definedMod": "xnet"}, Damage: 0 as short}, rftoolscontrol: {id: "rftoolscontrol:rftoolscontrol_manual", Count: 1 as byte, tag: {"akashictome:definedMod": "rftoolscontrol"}, Damage: 0 as short}, cyclicmagic1: {id: "cyclicmagic:tool_trade", Count: 1 as byte, tag: {"akashictome:definedMod": "cyclicmagic1"}, Damage: 0 as short}, sakura: {id: "patchouli:guide_book", Count: 1 as byte, tag: {"akashictome:definedMod": "sakura", "patchouli:book": "sakura:sakura_guide"}, Damage: 0 as short}, compactmachines3: {id: "compactmachines3:psd", Count: 1 as byte, tag: {"akashictome:definedMod": "compactmachines3"}, Damage: 0 as short}, conarm: {id: "conarm:book", Count: 1 as byte, tag: {"akashictome:definedMod": "conarm"}, Damage: 0 as short}, cfm: {id: "cfm:item_recipe_book", Count: 1 as byte, tag: {"akashictome:definedMod": "cfm"}, Damage: 0 as short}, cookingforblockheads1: {id: "cookingforblockheads:recipe_book", Count: 1 as byte, tag: {"akashictome:definedMod": "cookingforblockheads1"}, Damage: 1 as short}, cookingforblockheads2: {id: "cookingforblockheads:recipe_book", Count: 1 as byte, tag: {"akashictome:definedMod": "cookingforblockheads2"}, Damage: 2 as short}, solcarrot: {id: "solcarrot:food_book", Count: 1 as byte, tag: {"akashictome:definedMod": "solcarrot"}, Damage: 0 as short}, rftools2: {id: "rftools:rftools_manual", Count: 1 as byte, tag: {"akashictome:definedMod": "rftools2"}, Damage: 0 as short}, aether_legacy: {id: "aether_legacy:lore_book", Count: 1 as byte, tag: {"akashictome:definedMod": "aether_legacy"}, Damage: 0 as short}, spiceoflife: {id: "spiceoflife:bookfoodjournal", Count: 1 as byte, tag: {"akashictome:definedMod": "spiceoflife"}, Damage: 0 as short}, thaumcraft: {id: "thaumcraft:thaumonomicon", Count: 1 as byte, tag: {"akashictome:definedMod": "thaumcraft"}, Damage: 0 as short}, bloodmagic: {id: "bloodmagic:sanguine_book", Count: 1 as byte, tag: {"akashictome:definedMod": "bloodmagic"}, Damage: 0 as short}, twilightforest: {id: "patchouli:guide_book", Count: 1 as byte, tag: {"akashictome:definedMod": "twilightforest", "patchouli:book": "twilightforest:guide"}, Damage: 0 as short}, cyclicmagic: {id: "guideapi:cyclicmagic-guide", Count: 1 as byte, tag: {"akashictome:definedMod": "cyclicmagic"}, Damage: 0 as short}, openblocks: {id: "openblocks:info_book", Count: 1 as byte, tag: {"akashictome:definedMod": "openblocks"}, Damage: 0 as short}, forestry: {id: "forestry:book_forester", Count: 1 as byte, tag: {"akashictome:definedMod": "forestry"}, Damage: 0 as short}}}) * 1)
    .addItemInput(<extrabotany:material:3> * 128)
    .addItemInput(<extrabotany:blockorichalcos> * 64)
    .addItemInput(<botaniverse:morerune:3> * 8)
    .addItemInput(<additions:creative_shard> * 1)
    .addItemOutput(<extrabotany:buddhistrelics> * 1)
    .build();