/*
 * This script is created for the GreedyCraft modpack by TCreopargh.
 * You may NOT use this script in any other publicly distributed modpack without my permission.
 */

#priority 90
#reloadable

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
import crafttweaker.item.IItemStack;
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

import native.net.minecraft.entity.player.EntityPlayerMP;
import native.net.minecraft.inventory.Container;
import native.net.minecraft.world.WorldProvider;
import native.net.minecraft.item.ItemStack;
import native.net.mcreator.gctmobs.gui.GuiKabalahBuilder.GuiContainerMod;

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

    // Prevent saturation overdose
    if (!player.creative && player.isPotionActive(<potion:minecraft:saturation>) && player.getActivePotionEffect(<potion:minecraft:saturation>).duration > 1) {
        var effect as IPotionEffect = player.getActivePotionEffect(<potion:minecraft:saturation>);
        player.removePotionEffect(<potion:minecraft:saturation>);
        player.addPotionEffect(<potion:minecraft:saturation>.makePotionEffect(1, effect.amplifier, effect.isAmbient, effect.doesShowParticles));
    }

    // Hint while trying to go to disallowed dimensions
    if (player.world.getWorldTime() as long % 20 == 0) {
        if (player.world.getBlock(player.position).definition.id == "minecraft:portal" && !player.hasGameStageSilent("twilight_shield")) {
            player.sendRichTextStatusMessage(ITextComponent.fromData(["", {translate: "greedycraft.event.nether.reject.message", color: "dark_purple"}]), true);
        }
        if (player.world.getBlock(player.position).definition.id == "minecraft:end_portal" && !player.hasGameStageSilent("ender_charm")) {
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
        var baublesList = [<botania:odinring>] as IItemStack[];
        for bauble in baublesList {
            if (player.isBaubleEquipped(bauble) != -1) {
                isInOcean = false;
            }
        }
        if (TicTraitLib.getPlayerTicHelmetTrait(player as IPlayer) has "amphibious_armor") {
            var i = 1;
            while (i <= player.armorInventory[3].tag.Modifiers.length - 1) {
                if (player.armorInventory[3].tag.Modifiers[i].identifier == "amphibious_armor") {
                    if (player.armorInventory[3].tag.Modifiers[i].oxygen >= 1) {
                        isInOcean = false;
                        if (player.world.getBlock(getHeadBlockPos(player)).definition.id != "minecraft:water") {
                            var armorData = player.armorInventory[3].tag;
                            var ModifiersData = player.armorInventory[3].tag.Modifiers.deepUpdate(player.armorInventory[3].tag.Modifiers[i], REMOVE) as IData;
                            ModifiersData = ModifiersData.deepUpdate({identifier: "amphibious_armor",color: 52479,level: 1,oxygen: (player.armorInventory[3].tag.Modifiers[i].oxygen - 1)}, APPEND);
                            player.armorInventory[3].mutable().updateTag(armorData.deepUpdate(ModifiersData, OVERWRITE));
                            if (!player.world.remote) {
                                player.world.catenation().sleep(1).then(function(world as IWorld, context) {
                                    if (!isNull(player.armorInventory[3])) {
                                        player.armorInventory[3].mutable().updateTag(armorData.deepUpdate(ModifiersData, OVERWRITE));
                                    }
                                }).start();
                            }
                        }
                    }
                    break;
                }
                i += 1;
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

    // Vethea
    if (!isNull(player.currentItem)) {
        val item = player.currentItem;
        if (TicLib.isTicTool(item) || TicLib.isTicArmor(item)) {
            if (!player.hasGameStage("vethea_breaker") && player.getDimension() != 427 && isNull(item.tag.vetheaBreaker)) {
                item.mutable().updateTag({vetheaBreaker: 0 as byte});
            }
            if (player.getDimension() == 427 && isNull(item.tag.vetheaBreaker)) {
            item.mutable().updateTag({vetheaBreaker: 1 as byte});
            }
            if (player.hasGameStage("vethea_breaker") && (isNull(item.tag.vetheaBreaker) || item.tag.vetheaBreaker == 0)) {
                item.mutable().updateTag({vetheaBreaker: 1 as byte});
            }
        }
    }
    if (!isNull(player.armorInventory)) {
        for armor in player.armorInventory {
            if (TicLib.isTicArmor(armor)) {
                if (!player.hasGameStage("vethea_breaker") && player.getDimension() != 427 && isNull(armor.tag.vetheaBreaker)) {
                    armor.mutable().updateTag({vetheaBreaker: 0 as byte});
                }
                if (player.getDimension() == 427 && isNull(armor.tag.vetheaBreaker)) {
                    armor.mutable().updateTag({vetheaBreaker: 1 as byte});
                }
                if (player.hasGameStage("vethea_breaker") && (isNull(armor.tag.vetheaBreaker) || armor.tag.vetheaBreaker == 0)) {
                    armor.mutable().updateTag({vetheaBreaker: 1 as byte});
                }
            }
        }
    }
    if (player.getDimension() == 427 && !isNull(player.armorInventory) && player.world.getWorldTime() as long % 20 == 0) {
        for armor in player.armorInventory {
            if (!isNull(armor) && !isNull(armor.tag) && !isNull(armor.tag.vetheaBreaker) && armor.tag.vetheaBreaker == 0) {
                player.health = 1;
                player.addPotionEffect(<potion:minecraft:blindness>.makePotionEffect(50, 0, false, false));
                player.sendRichTextStatusMessage(ITextComponent.fromString("§d梦魇世界尚未认可你，你还不能使用外来装备！"));
            }
        }
    }

    // Remove radiation if the stage is locked
    if (!(player.hasGameStageSilent("epic_engineer"))) {
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
                if (TicTraitLib.hasTicTrait(armor, "tconevo.astral_armor") && !(TicTraitLib.hasTicTrait(armor, "astraling_armor"))) {
                    TicTraitLib.addTicTrait(armor, "astraling_armor", TicTraitLib.getTraitColor(armor, "tconevo.astral_armor"), 1);
                    TicTraitLib.removeTicTrait(armor, "tconevo.astral_armor", TicTraitLib.getTraitColor(armor, "tconevo.astral_armor"), 1);
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
            if (TicTraitLib.hasTicTrait(item, "tconevo.astral") && !(TicTraitLib.hasTicTrait(item, "astraling"))) {
                TicTraitLib.addTicTrait(item, "astraling", TicTraitLib.getTraitColor(item, "tconevo.astral"), 1);
                TicTraitLib.removeTicTrait(item, "tconevo.astral", TicTraitLib.getTraitColor(item, "tconevo.astral"), 1);
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
    //Astral perk(StarAbility) fix
    if (!isNull(player.getPerkLevel()) && player.getPerkLevel() > 25 && player.world.getWorldTime() as long % 20 == 0) {
        player.sendRichTextStatusMessage(ITextComponent.fromString("§d你知道自己干了什么喵，改回去重进游戏喵"));
        player.addPotionEffect(<potion:minecraft:blindness>.makePotionEffect(50, 0, false, false));
        player.addPotionEffect(<potion:astralsorcery:potiontimefreeze>.makePotionEffect(50, 0, false, false));
    }

    //Laser Gun Mode Lock
    if (!isNull(player.currentItem)) {
        var item = player.currentItem;
        if ((item.definition.id == "plustic:laser_gun") && !isNull(item.tag.Mode) && item.tag.Mode == 1) {
            item.mutable().updateTag(item.tag.deepUpdate({Mode: 0}, {Mode: OVERWRITE}));
        }
    }
    if (!isNull(player.offHandHeldItem)) {
        var item = player.offHandHeldItem;
        if ((item.definition.id == "plustic:laser_gun") && !isNull(item.tag.Mode) && item.tag.Mode == 1) {
            item.mutable().updateTag(item.tag.deepUpdate({Mode: 0}, {Mode: OVERWRITE}));
        }
    }

    //Unforgiving Void
    if (player.posY as int < -16) {
        val specialDim as int[int] = {
            -1 : 0
        };
        var x = 1 * (player.posX / 8.0d);
        var y = 64 as int;
        var z = 1 * (player.posZ / 8.0d);
        var tp = true;

        val destination = isNull(specialDim[player.dimension]) ? IWorld.getFromID(-1) : IWorld.getFromID(specialDim[player.dimension]);
        if ((destination.getBlock(x,y,z).definition.id == "minecraft:air") && (destination.getBlock(x,y + 1,z).definition.id == "minecraft:air") && (destination.getBlock(x,y - 1,z).definition.id != "minecraft:air") && destination.getBlock(x,y - 1,z).definition.id != "minecraft:lava") {
            server.commandManager.executeCommand(server, "/forge setdimension " ~ player.name ~ " -1 " ~ (x as string) ~ " " ~ (y as string) ~ " " ~ (z as string));
            tp = false;
        }
        if (tp) {
            var i as int = -16;
            var j as int = -16;
            var k as int = -16;
            while ((i <= 16) && tp) {
                while ((j <= 16) && tp) {
                    while ((k <= 16) && tp) {
                        if ((destination.getBlock(x + i,y + j,z + k).definition.id == "minecraft:air") && (destination.getBlock(x + i,y + j + 1,z + k).definition.id == "minecraft:air") && (destination.getBlock(x + i,y + j - 1,z + k).definition.id != "minecraft:air") && destination.getBlock(x + i,y + j - 1,z + k).definition.id != "minecraft:lava") {
                            player.attackEntityFrom(IDamageSource.FALL(), 10.0);
                            server.commandManager.executeCommand(server, "/forge setdimension " ~ player.name ~ " -1 " ~ (x + i) as string ~ " " ~ (y + j) as string ~ " " ~ (z + k) as string);
                            tp = false;
                        }
                        k += 1;
                    }
                    k = -16;
                    j += 1;
                }
                j = -16;
                i += 1;
            }
        }
        if (tp) {
            var i as int = -64;
            var j as int = -63;
            var k as int = -64;
            while ((i <= 64) && tp) {
                while ((j <= 128) && tp) {
                    while ((k <= 64) && tp) {
                        if ((destination.getBlock(x + i,y + j,z + k).definition.id == "minecraft:air") && (destination.getBlock(x + i,y + j + 1,z + k).definition.id == "minecraft:air") && (destination.getBlock(x + i,y + j - 1,z + k).definition.id != "minecraft:air") && destination.getBlock(x + i,y + j - 1,z + k).definition.id != "minecraft:lava") {
                            player.attackEntityFrom(IDamageSource.FALL(), 10.0);
                            server.commandManager.executeCommand(server, "/forge setdimension " ~ player.name ~ " -1 " ~ (x + i) as string ~ " " ~ (y + j) as string ~ " " ~ (z + k) as string);
                            tp = false;
                        }
                        k += 1;
                    }
                    k = -64;
                    j += 1;
                }
                j = -64;
                i += 1;
            }
        }
        if (tp) {
            var i as int = -128;
            var j as int = -63;
            var k as int = -128;
            while ((i <= 128) && tp) {
                while ((j <= 256) && tp) {
                    while ((k <= 128) && tp) {
                        if ((destination.getBlock(x + i,y + j,z + k).definition.id == "minecraft:air") && (destination.getBlock(x + i,y + j + 1,z + k).definition.id == "minecraft:air") && (destination.getBlock(x + i,y + j - 1,z + k).definition.id != "minecraft:air") && destination.getBlock(x + i,y + j - 1,z + k).definition.id != "minecraft:lava") {
                            player.attackEntityFrom(IDamageSource.FALL(), 10.0);
                            server.commandManager.executeCommand(server, "/forge setdimension " ~ player.name ~ " -1 " ~ (x + i) as string ~ " " ~ (y + j) as string ~ " " ~ (z + k) as string);
                            tp = false;
                        }
                        k += 1;
                    }
                    k = -128;
                    j += 1;
                }
                j = -128;
                i += 1;
            }
        }
        player.addPotionEffect(<potion:minecraft:blindness>.makePotionEffect(50, 2, false, false));
    }

    //Alfheim Portal
    if (player.dimension == 0 && player.hasGameStage("gaia_deleter")) {
        var pos as IBlockPos = player.position.down(1);
        var position3f as Position3f = player.position3f;
        if (pos.y >= 1 && pos.y <= 255) {
            if (!isNull(player.world.getBlock(pos))) {
                var block as IBlock = player.world.getBlock(pos);
                if (!(isNull(block.data) || isNull(block.data.ForgeData))) {
                    if (!isNull(block.data.ForgeData.isPortable) && !isNull(block.data.ticksOpen)) {
                        var portable as byte = block.data.ForgeData.isPortable as byte;
                        if (portable == 1 && block.data.ticksOpen as int != 0) {
                            player.setDimension(42);
                            player.position3f = position3f;
                        }
                    }
                }
            }
        }
    }

    //Erebus Curse
    if (player.dimension == 66 && !player.creative) {
        if (!player.isPotionActive(<potion:contenttweaker:erebus_protection>)) {
            if (player.world.time % 20 == 0 && player.health / player.maxHealth > 0.05f) {
                player.health -= player.maxHealth * 0.05f;
            } else {
                player.attackEntityFrom(IDamageSource.createOfType("erebus_curse"), player.maxHealth);
            }
        }
    }

});

$expand Container$isStack(slotIndex as int, stackTarget as IItemStack) as bool {
    if (!isNull(this.inventorySlots[slotIndex].getStack())) {
        var stack as ItemStack = this.inventorySlots[slotIndex].getStack();
        var stackCT as IItemStack = stack.wrapper;
        if (!(isNull(stackCT) || isNull(stackCT.definition) || isNull(stackCT.definition.id))) {
            if (stackCT.definition.id == stackTarget.definition.id) {
                return true;
            }
        }
    }
    return false;
}

$expand IItemStack[]$matches(target as IItemStack[]) as bool {
    if (this.length != target.length) {
        return false;
    }
    for i in 0 to this.length {
        if (isNull(this[i]) && isNull(target[i])) {
            continue;
        } else if (isNull(this[i]) || isNull(target[i])) {
            return false;
        } else if (this[i].definition.id != target[i].definition.id) {
            return false;
        } else if (this[i].metadata != target[i].metadata) {
            return false;
        }
    }
    return true;
}

events.onPlayerTick(function(event as PlayerTickEvent) {
    if (event.side != "SERVER") {
        return;
    }
    var player as IPlayer = event.player;
    // Kabalah Builder GUI check
    if ((player.native as EntityPlayerMP).openContainer instanceof GuiContainerMod) {
        var container as Container = (player.native as EntityPlayerMP).openContainer;
        var recipeCheckList as IItemStack[] = [];
        var recipeLevel as int = 0;
        for i in 0 to 10 {
            if (!isNull(container.inventorySlots[i].getStack())) {
                var stack as ItemStack = container.inventorySlots[i].getStack();
                var stackCT as IItemStack = stack.wrapper;
                recipeCheckList += stackCT;
            } else {
                recipeCheckList += null;
            }
        }
        if (container.isStack(10, <gct_mobs:kabalah_ring_aur>)) {
            if (container.isStack(11, <gct_mobs:kabalah_ring_soph>)) {
                if (container.isStack(12, <gct_mobs:kabalah_ring_ain>)) {
                    recipeLevel = 3;
                } else {
                    recipeLevel = 2;
                }
            } else {
                recipeLevel = 1;
            }
        }
        var targetLevelRecipes as IItemStack[][IItemStack] = KabbalahBuilderRecipeList[recipeLevel];
        var pass as bool = false;
        for allMatchedRecipes in targetLevelRecipes {
            if (targetLevelRecipes[allMatchedRecipes].matches(recipeCheckList)) {
                container.inventorySlots[13].putStack(allMatchedRecipes.native);
                pass = true;
                break;
            }
        }
        if (!pass) {
            container.inventorySlots[13].putStack(ItemStack.EMPTY);
        }
    }
});
