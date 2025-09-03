/*
 * This script is created for the GreedyCraft modpack by TCreopargh.
 * You may NOT use this script in any other publicly distributed modpack without my permission. 
 */

#priority 31999

import crafttweaker.item.IItemStack;
import crafttweaker.data.IData;
import crafttweaker.item.IIngredient;

import mods.zenstages.ZenStager;
import mods.zenstages.Stage;
import mods.ItemStages;

static stageTwilightShield as Stage = ZenStager.initStage("twilight_shield");
static stageHardmode as Stage = ZenStager.initStage("hardmode");
static stageNoobEngineer as Stage = ZenStager.initStage("noob_engineer");
static stageSkilledEngineer as Stage = ZenStager.initStage("skilled_engineer");
static stageNether as Stage = ZenStager.initStage("nether");
static stageNoviceEngineer as Stage = ZenStager.initStage("novice_engineer");
static stageDisabled as Stage = ZenStager.initStage("disabled");
static stageInfinity as Stage = ZenStager.initStage("wielder_of_infinity");
static stageWitherSlayer as Stage = ZenStager.initStage("wither_slayer");
static stageCosmicSword as Stage = ZenStager.initStage("sword_of_cosmos");
static stageAbyssalConquerer as Stage = ZenStager.initStage("abyssal_conquerer");
static stageMasterEngineer as Stage = ZenStager.initStage("master_engineer");
static stageFusionMatrix as Stage = ZenStager.initStage("fusion_matrix");
static stageChallenger1 as Stage = ZenStager.initStage("challenger_a");
static stageChallenger2 as Stage = ZenStager.initStage("challenger_b");
static stageChallenger3 as Stage = ZenStager.initStage("challenger_c");
static stageChallenger4 as Stage = ZenStager.initStage("challenger_d");
static stageChallenger5 as Stage = ZenStager.initStage("challenger_e");
static stageChallenger6 as Stage = ZenStager.initStage("challenger_f");
static stageChallenger7 as Stage = ZenStager.initStage("challenger_g");
static stageChallenger8 as Stage = ZenStager.initStage("challenger_h");
static stageChallenger9 as Stage = ZenStager.initStage("challenger_i");
static stageChallengerMax as Stage = ZenStager.initStage("challenger_all");
static stageFearlessMan as Stage = ZenStager.initStage("fearless_man");
static stageNoobWizard as Stage = ZenStager.initStage("noob_wizard");
static stageNoviceWizard as Stage = ZenStager.initStage("novice_wizard");
static stageSkilledWizard as Stage = ZenStager.initStage("skilled_wizard");
static stageMasterWizard as Stage = ZenStager.initStage("master_wizard");
static stageEpicWizard as Stage = ZenStager.initStage("epic_wizard");
static stageEnderCharm as Stage = ZenStager.initStage("ender_charm");
static stageTransmutationTable as Stage = ZenStager.initStage("transmutation_table");
static stageEnergyMatter as Stage = ZenStager.initStage("energy_matter_core");
static stageAwakened as Stage = ZenStager.initStage("awakened");
static stageWyvern as Stage = ZenStager.initStage("wyvern");
static stageGettingStarted as Stage = ZenStager.initStage("getting_started");
static stageChaotic as Stage = ZenStager.initStage("chaotic");
static stageChaoticDominator as Stage = ZenStager.initStage("chaotic_dominator");
static stageQuardstate as Stage = ZenStager.initStage("quardstate");
static stageGraduated as Stage = ZenStager.initStage("graduated");
static stageVetheaBreaker as Stage = ZenStager.initStage("vethea_breaker");
static stageStormBreaker as Stage = ZenStager.initStage("storm_breaker");
static stageStormy as Stage = ZenStager.initStage("stormy");
static stageGatekeeper as Stage = ZenStager.initStage("gatekeeper");
static stageGaiaDeleter as Stage = ZenStager.initStage("gaia_deleter");
static stageBalancedMatrix as Stage = ZenStager.initStage("balanced_matrix");
static stageBetweenlandTraveller as Stage = ZenStager.initStage("betweenland_traveller");
static stageFinal as Stage = ZenStager.initStage("final");
static stageAbyssGuardian as Stage = ZenStager.initStage("abyss_guardian");
static stageOrder as Stage = ZenStager.initStage("order");
static stageCosmic as Stage = ZenStager.initStage("cosmic");
static stageDeepDream as Stage = ZenStager.initStage("deep_dream");
static stageWakeUp as Stage = ZenStager.initStage("wake_up");
static stageMindShock as Stage = ZenStager.initStage("mind_shock");
static stageWaving as Stage = ZenStager.initStage("waving");
static stageEpicEngineer as Stage = ZenStager.initStage("epic_engineer");
static stageTinkeringBlueprint as Stage = ZenStager.initStage("tinkering_blueprint");
static stageWarped as Stage = ZenStager.initStage("warped");

static zenStageMap as Stage[string] = ZenStager.getStageMap();

function restageItem(stage as string, item as IIngredient) {
    ItemStages.removeItemStage(item);
    ItemStages.addItemStage(stage, item);
}

function restageItems(stage as string, items as IIngredient[]) {
    for item in items {
        ItemStages.removeItemStage(item);
        ItemStages.addItemStage(stage, item);
    }
}

function removeItemStages(items as IIngredient[]) {
    for item in items {
        ItemStages.removeItemStage(item);
    }
}
