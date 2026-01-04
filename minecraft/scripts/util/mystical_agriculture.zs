/*
 * This script is created for the GreedyCraft modpack by TCreopargh.
 * You may NOT use this script in any other publicly distributed modpack without my permission. 
 */

#priority 31990

import crafttweaker.item.IItemStack;
import crafttweaker.data.IData;
import crafttweaker.item.IIngredient;

import mods.extendedcrafting.TableCrafting;
import mods.zenutils.I18n;

static regName as string = "organic_infuser";
static energy as int[] = [160, 240, 320, 480, 560, 800, 1600, 4800, 12800, 64000] as int[];
static time as int[] = [4, 6, 10, 16, 24, 40, 48, 80, 180, 400] as int[];
static fluid as int[] = [50, 55, 60, 65, 70, 80, 320, 1280, 5120, 48000] as int[];
static timeCarpenter as int[] = [60, 75, 80, 100, 140, 210, 1200, 1800, 2400, 3000] as int[];
static fluidCarpenter as int[] = [600, 750, 900, 1200, 1600, 2400, 10000, 10000, 10000, 10000] as int[];
static seedChance as float[] = [0.36f, 0.3f, 0.24f, 0.18f, 0.12f, 0.06f, 0.03f, 0.01f, 0.0025f, 0.0005f] as float[];

function registerSeedRecipe(seed as IItemStack, baseItem as IItemStack, tier as int, outputAmount as int, essence as IItemStack, outputStack as IItemStack) {

    val regName = "organic_infuser";
    var fertilizer = [
        <thermalfoundation:fertilizer>,
        <thermalfoundation:fertilizer>,
        <thermalfoundation:fertilizer:1>,
        <thermalfoundation:fertilizer:1>,
        <thermalfoundation:fertilizer:2>,
        <thermalfoundation:fertilizer:2>,
        <mysticalagriculture:mystical_fertilizer>,
        <additions:between_essence>,
        <additions:solid_culture_medium>
    ] as IItemStack[];
    var output = outputStack;
    val essences as IIngredient[] = [
        null,
        <ore:essenceInfernium>,
        <ore:essencePrudentium>,
        <ore:essenceIntermedium>,
        <ore:essenceSuperium>,
        <ore:essenceSupremium>,
        <ore:essenceInsanium>,
        <ore:essenceExtremium>,
        <ore:essenceGodlikeum>,
        <ore:essenceNonenium>
    ];
    val bases as IIngredient[] = [
        null,
        <mysticalagriculture:crafting:17>,
        <mysticalagriculture:crafting:18>,
        <mysticalagriculture:crafting:19>,
        <mysticalagriculture:crafting:20>,
        <mysticalagriculture:crafting:21>, 
        <mysticalagradditions:insanium:1>,
        <additions:seed_tier_7>,
        <additions:seed_tier_8>,
        <additions:seed_tier_9>];
    if (isNull(output)) {
        output = baseItem;
    }
    
    if (tier <= 9 && tier > 0) {
    
        if (tier == 1) {
            <ore:seedsTier1>.add(seed);
        } else if (tier == 2) {
            <ore:seedsTier2>.add(seed);
        } else if (tier == 3) {
            <ore:seedsTier3>.add(seed);
        } else if (tier == 4) {
            <ore:seedsTier4>.add(seed);
        } else if (tier == 5) {
            <ore:seedsTier5>.add(seed);
        } else if (tier == 6) {
            <ore:seedsTier6>.add(seed);
        } else if (tier == 7) {
            <ore:seedsTier7>.add(seed);
        } else if (tier == 8) {
            <ore:seedsTier8>.add(seed);
        } else if (tier == 9) {
            <ore:seedsTier9>.add(seed);
        }
        
        var baseItemName as string = game.localize("greedycraft.mysticalagriculture.base_item");
        baseItemName = baseItem.displayName;
        seed.addTooltip(I18n.format("greedycraft.mysticalagriculture.seed_tooltip", baseItemName));
        mods.jei.JEI.addDescription(seed, I18n.format("greedycraft.mysticalagriculture.jei_info", baseItemName));

        mods.forestry.Carpenter.addRecipe(seed, [
            [baseItem, essences[tier], baseItem],
            [essences[tier], bases[tier], essences[tier]],
            [baseItem, essences[tier], baseItem]
        ] as IIngredient[][], timeCarpenter[tier], <liquid:organic_fluid> * fluidCarpenter[tier], fertilizer[tier]);
        if (tier <= 6) {
            recipes.addShaped(seed.definition.name + "_essence", (output * outputAmount) as IItemStack, [ 
                [essence, essence, essence],
                [essence, null, essence],
                [essence, essence, essence]] as IIngredient[][]
            );
        } else if (tier == 7) {
            TableCrafting.addShaped((output * outputAmount) as IItemStack, [
                [essence, null, essence, null, essence],
                [null, essence, essence, essence, null],
                [essence, essence, null, essence, essence],
                [null, essence, essence, essence, null],
                [essence, null, essence, null, essence]] as IIngredient[][]
            );
        } else if (tier == 8) {
            TableCrafting.addShaped((output * outputAmount) as IItemStack, [
                [essence, essence, essence, essence, essence],
                [essence, essence, essence, essence, essence],
                [essence, essence, essence, essence, essence],
                [essence, essence, essence, essence, essence],
                [essence, essence, essence, essence, essence]] as IIngredient[][]
            );
        } else if (tier == 9) {
            TableCrafting.addShaped((output * outputAmount) as IItemStack, [
                [essence, essence, null, essence, null, essence, essence],
                [essence, essence, essence, essence, essence, essence, essence],
                [null, essence, essence, essence, essence, essence, null],
                [essence, essence, essence, null, essence, essence, essence],
                [null, essence, essence, essence, essence, essence, null],
                [essence, essence, essence, essence, essence, essence, essence],
                [essence, essence, null, essence, null, essence, essence]] as IIngredient[][]
            );
        }
        mods.modularmachinery.RecipeBuilder.newBuilder(regName + "_grow_" + seed.name, regName, time[tier] * 10, 0)
            .addItemInput(seed)
            .setChance(0.0f)
            .addEnergyPerTickInput(energy[tier])
            .addItemOutput(seed)
            .setChance(seedChance[tier] as float)
            .addItemOutput(essence)
            .addItemOutput(essence)
            .setChance(0.5f)
            .addItemOutput(essence)
            .setChance(0.25f)
            .addItemOutput(essence)
            .setChance(0.125f)
            .addItemOutput(<mysticalagriculture:fertilized_essence>)
            .setChance(0.03f)
            .build();
    }
}
