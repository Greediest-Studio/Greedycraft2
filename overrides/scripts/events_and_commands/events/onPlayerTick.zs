/*
 * This script is created for the GreedyCraft modpack by TCreopargh.
 * You may NOT use this script in any other publicly distributed modpack without my permission.
 */
#loader crafttweaker reloadable

#priority 90

import crafttweaker.event.PlayerLoggedInEvent;
import crafttweaker.event.IPlayerEvent;
import crafttweaker.event.PlayerRespawnEvent;
import crafttweaker.event.PlayerTickEvent;
import crafttweaker.data.IData;
import crafttweaker.damage.IDamageSource;
import crafttweaker.entity.IEntityLivingBase;
import crafttweaker.player.IPlayer;
import crafttweaker.util.Position3f;
import crafttweaker.block.IBlock;
import crafttweaker.world.IBlockPos;
import crafttweaker.block.IBlockState;
import crafttweaker.potions.IPotionEffect;
import crafttweaker.world.IFacing;
import crafttweaker.command.ICommandSender;
import crafttweaker.text.ITextComponent;
import crafttweaker.world.IBiome;
import crafttweaker.world.IBiomeType;
import crafttweaker.world.IWorld;
import crafttweaker.item.IIngredient;
import crafttweaker.entity.IEntityEquipmentSlot;
import crafttweaker.item.IMutableItemStack;
import mods.zenutils.DataUpdateOperation.OVERWRITE;
import mods.zenutils.DataUpdateOperation.APPEND;
import mods.zenutils.DataUpdateOperation.MERGE;
import mods.zenutils.DataUpdateOperation.REMOVE;
import mods.zenutils.DataUpdateOperation.BUMP;

import mods.ctintegration.advancement.AdvancementHelper;
import mods.ctintegration.advancement.IAdvancement;
import mods.ctintegration.advancement.IAdvancementProgress;
import mods.ctutils.utils.Math;
import mods.ctutils.world.IGameRules;
import mods.nuclearcraft.RadiationScrubber;

val advancementMap as string[string] = {
    twilight_forest: "greedycraft:elysia/log1",
    nether: "greedycraft:elysia/log2",
    wither_slayer: "greedycraft:elysia/log3",
    ender_charm: "greedycraft:elysia/log4",
    hardmode: "greedycraft:elysia/log5",
    wyvern: "greedycraft:elysia/log6",
    awakened: "greedycraft:elysia/log7",
    chaotic: "greedycraft:elysia/log8"
} as string[string];

function isOcean(biome as IBiome, world as IWorld) as bool {
    if(world.dimension != 0) {
        return false;
    }
    for oceanBiome in <biomeTypes:OCEAN>.biomes {
        if (biome.name == oceanBiome.name) {
            return true;
        }
    }
    return false;
}

function getHeadBlockPos(player as IPlayer) as IBlockPos {
    var pos as IBlockPos = player.position as IBlockPos;
    return pos.getOffset(IFacing.up(), player.eyeHeight) as IBlockPos;
}

function getBottomBlockPos(player as IPlayer) as IBlockPos {
    var pos as IBlockPos = player.position as IBlockPos;
    return pos.getOffset(IFacing.down(), 1) as IBlockPos;
}

function grantAdvancement(player as IPlayer, advancementId as string) {
    var adv as IAdvancement = AdvancementHelper.getAdvancementById(player.server, advancementId);
    if(!isNull(adv)) {
        var progress as IAdvancementProgress = player.getAdvancementProgress(adv);
        if(!isNull(progress) && !progress.isDone()) {
            // progress.setCompleted();
            server.commandManager.executeCommand(server, "/advancement grant " + player.name + " only " + advancementId);
        }
    } 
}

events.onPlayerTick(function(event as crafttweaker.event.PlayerTickEvent) {

    if (event.phase != "END" || event.side != "SERVER") {
        return;
    }

    var player = event.player;

    // Prevent Night Vision flash
    if (player.isPotionActive(<potion:minecraft:night_vision>) && player.getActivePotionEffect(<potion:minecraft:night_vision>).duration <= 200) {
        player.removePotionEffect(<potion:minecraft:night_vision>);
    }

    //Check for story advancement
    if (player.world.getWorldTime() as long % 40 == 0) {
        grantAdvancement(player, "greedycraft:elysia/root");
        for stage in advancementMap {
            if (player.hasGameStage(stage)) {
                var advancement as string = advancementMap[stage] as string;
                grantAdvancement(player, advancement);
            }
        }
        if (!isNull(player.currentItem) && player.currentItem.definition.id == "patchouli:guide_book" && !isNull(player.currentItem.tag.memberGet("patchouli:book")) && player.currentItem.tag.memberGet("patchouli:book") == "patchouli:the_elysia_project") {
            grantAdvancement(player, "greedycraft:elysia/book");
        }
    }

    // Prevent saturation overdose
    if (!player.creative && player.isPotionActive(<potion:minecraft:saturation>) && player.getActivePotionEffect(<potion:minecraft:saturation>).duration > 1) {
        var effect as IPotionEffect = player.getActivePotionEffect(<potion:minecraft:saturation>);
        player.removePotionEffect(<potion:minecraft:saturation>);
        player.addPotionEffect(<potion:minecraft:saturation>.makePotionEffect(1, effect.amplifier, effect.isAmbient, effect.doesShowParticles));
    }

    // Hint while trying to go to disallowed dimensions
    if (player.world.getWorldTime() as long % 20 == 0) {
        if (player.world.getBlock(player.position).definition.id == "minecraft:portal" && !player.hasGameStage("twilight_shield")) {
            player.sendRichTextStatusMessage(ITextComponent.fromData(["", {translate: "greedycraft.event.nether.reject.message", color: "dark_purple"}]), true);
        }
        if (player.world.getBlock(player.position).definition.id == "minecraft:end_portal" && !player.hasGameStage("ender_charm")) {
            player.sendRichTextStatusMessage(ITextComponent.fromData(["", {translate: "greedycraft.event.end.reject.message", color: "dark_purple"}]), true);
        }
    }
  
    // Hot spring water is banned
    if (player.world.getWorldTime() as long % 10 == 0) {
        if (player.world.getBlock(player.position).definition.id == "biomesoplenty:hot_spring_water" || player.world.getBlock(player.position).definition.id == "sakura:hot_spring_water" || player.world.getBlock(player.position.getOffset(IFacing.up(), player.eyeHeight)).definition.id == "biomesoplenty:hot_spring_water" || player.world.getBlock(player.position.getOffset(IFacing.up(), player.eyeHeight)).definition.id == "sakura:hot_spring_water") {
            player.attackEntityFrom(IDamageSource.GENERIC(), 10.0);
        }
    }

    // Prevent walking on dark wood leaves in twilight forest
    if (!player.creative && player.world.getWorldTime() as long % 20 == 0) {
        var pos as IBlockPos = player.position as IBlockPos;
        if (player.world.getBlock(getBottomBlockPos(player)).definition.id == "twilightforest:dark_leaves") {
            player.attackEntityFrom(IDamageSource.HOT_FLOOR(), 2.0);
        }
    }

    // Fix sticky potion effects
    if (!player.creative && player.world.getWorldTime() as long % 4 == 0) {
        var effects as IPotionEffect[] = player.activePotionEffects as IPotionEffect[];
        for effect in effects {
            if (effect.duration < 5) {
                player.removePotionEffect(effect.potion);
            }
        }
    }

    // Prevent breathing in ocean with a door
    if (!player.creative && isOcean(player.world.getBiome(player.position), player.world) && player.y < 40.0) {
        var checkPoints as Position3f[] = [player.position, player.position, player.position, player.position] as Position3f[];
        var isInOcean = true;
        checkPoints[0].x = checkPoints[0].x + 5.0;
        checkPoints[1].z = checkPoints[1].z + 5.0;
        checkPoints[2].x = checkPoints[2].x - 5.0;
        checkPoints[3].z = checkPoints[3].z - 5.0;
        for checkPoint in checkPoints {
            if (!isOcean(player.world.getBiome(checkPoint), player.world)) {
                isInOcean = false;
                break;
            }
        }
        if (isInOcean && !(player.isPotionActive(<potion:minecraft:water_breathing>) || player.isPotionActive(<potion:potioncore:drown>)) && player.world.getBlock(getHeadBlockPos(player)).definition.id != "minecraft:water") {
            player.air = 0;
            if (player.world.getBlock(getHeadBlockPos(player)).definition.id != "minecraft:air") {
                if (!player.isPotionActive(<potion:minecraft:wither>)) {
                    player.addPotionEffect(<potion:minecraft:wither>.makePotionEffect(100, 1, false, false));
                }
            }
            if (player.world.getWorldTime() as long % 20 == 0) {
                player.addPotionEffect(<potion:minecraft:blindness>.makePotionEffect(50, 0, false, false));
                player.attackEntityFrom(IDamageSource.DROWN(), 10.0);
                player.sendRichTextStatusMessage(ITextComponent.fromData(["", {translate: "greedycraft.event.deep_sea.warning", color: "red"}, {"text": " "}, {translate: "greedycraft.event.deep_sea.message", color: "yellow"}]), true);
            }
        }
    }

    // Remove disabled items in Vethea
    if (<ore:vetheaDisabled> in player.currentItem && player.getDimension() == 427) {
        player.currentItem.mutable().shrink(64);
        player.sendStatusMessage("此物品已经在梦魇世界被禁用！");
    }
    if (<ore:vetheaDisabled> in player.offHandHeldItem && player.getDimension() == 427) {
        player.offHandHeldItem.mutable().shrink(64);
        player.sendStatusMessage("此物品已经在梦魇世界被禁用！");
    }

    // Remove radiation if the stage is locked
    if (!(player.hasGameStage("epic_engineer"))) {
        player.setRadiation(0.0d);
    }

    // Remove the bleeding from Engender Mod
    if (player.isPotionActive(<potion:ageofminecraft:bleeding>)) {
        player.removePotionEffect(<potion:ageofminecraft:bleeding>);
    }

    // Remove the nightvision effect if in betweenlands
    if (player.isPotionActive(<potion:minecraft:night_vision>) && player.dimension == 20) {
        player.removePotionEffect(<potion:minecraft:night_vision>);
    }

    // Add Leveling Durability traits to Tic armors and traits
    if (!isNull(player.armorInventory)) {
        for armor in player.armorInventory {
            if (!isNull(armor)) {
                if (TicLib.isTicArmor(armor)) {
                    if (!(TicTraitLib.hasTicTrait(armor, "leveling_durability_armor"))) {
                        TicTraitLib.addTicTrait(armor, "leveling_durability_armor", 0xffffff, 1);
                    }
                }
            }
        }
    }
    if (!isNull(player.currentItem)) {
        var item = player.currentItem;
        if (TicLib.isTicTool(item)) {
            if (!(TicTraitLib.hasTicTrait(item, "leveling_durability"))) {
                TicTraitLib.addTicTrait(item, "leveling_durability", 0xffffff, 1);
            }
        } else if (TicLib.isTicArmor(item)) {
            if (!(TicTraitLib.hasTicTrait(item, "leveling_durability_armor"))) {
                TicTraitLib.addTicTrait(item, "leveling_durability_armor", 0xffffff, 1);
            }
        }
    }

    //Astral fix
    if (!isNull(player.armorInventory)) {
        for armor in player.armorInventory {
            if (!isNull(armor)) {
                if (TicTraitLib.hasTicTrait(armor, "astraling_armor") && !(TicTraitLib.hasTicTrait(armor, "tconevo.astral_armor"))) {
                    TicTraitLib.addTicTrait(armor, "tconevo.astral_armor", TicTraitLib.getTraitColor(armor, "astraling_armor"), 1);
                }
                if (TicTraitLib.hasTicTrait(armor, "tconevo.astral_armor") && (TicTraitLib.hasTicTrait(armor, "astraling_armor"))) {
                    TicTraitLib.removeTicTrait(armor, "astraling_armor", TicTraitLib.getTraitColor(armor, "astraling_armor"), 1);
                }
                if !(TicTraitLib.hasTicTrait(armor, "astraling_armor") || TicTraitLib.hasTicTrait(armor, "tconevo.astral_armor")) {
                    var str as string = "";
                    for trait in TicTraitLib.getTicTrait(armor) {
                        if (trait has "tconevo.attuned_") {
                            str = trait;
                            break;
                        }
                    }
                    TicTraitLib.removeTicTrait(armor,str,TicTraitLib.getTraitColor(armor,str),1);
                }
            }
        }
    } 
    if (!isNull(player.currentItem)) {
        var item = player.currentItem;
        if (TicLib.isTicTool(item)) {
            if (!(TicTraitLib.hasTicTrait(item, "leveling_durability"))) {
                TicTraitLib.addTicTrait(item, "leveling_durability", 0xffffff, 1);
            }
            if (TicTraitLib.hasTicTrait(item, "astraling") && !(TicTraitLib.hasTicTrait(item, "tconevo.astral"))) {
                TicTraitLib.addTicTrait(item, "tconevo.astral", TicTraitLib.getTraitColor(item, "astraling"), 1);
                item = player.currentItem;
                TicTraitLib.removeTicTrait(item, "astraling", TicTraitLib.getTraitColor(item, "astraling"), 1);
            }
            if !(TicTraitLib.hasTicTrait(item, "astraling") || TicTraitLib.hasTicTrait(item, "tconevo.astral")) {
                var str as string = "";
                for trait in TicTraitLib.getTicTrait(item) {
                    if (trait has "tconevo.attuned_") {
                        str = trait;
                        break;
                    }
                }
                TicTraitLib.removeTicTrait(item,str,TicTraitLib.getTraitColor(item,str),1);
            }
        }
    }

    //test
    if (!isNull(player.currentItem)) {
        var item = player.currentItem;
        if (TicLib.isTicTool(item)) {
            if !(TicTraitLib.hasTicTrait(item, "energy_fix")) && (TicTraitLib.hasTicTrait(item, "tconevo.evolved")) {
                TicTraitLib.addTicTrait(item, "energy_fix", 0xffffff, 1);
            }
        }
    }
    if (!isNull(player.armorInventory)) {
        for armor in player.armorInventory {
            if (!isNull(armor)) {
                if (TicLib.isTicArmor(armor)) {
                    if (!(TicTraitLib.hasTicTrait(armor, "energy_fix_armor"))) {
                        TicTraitLib.addTicTrait(armor, "energy_fix_armor", 0xffffff, 1);
                    }
                }
            }
        }
    }
});
