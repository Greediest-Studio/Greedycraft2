/*
 * This script is created for the GreedyCraft modpack by TCreopargh.
 * You may NOT use this script in any other publicly distributed modpack without my permission.
 */

#loader contenttweaker

#modloaded tconstruct
#modloaded conarm

#priority 2601

import crafttweaker.player.IPlayer;
import crafttweaker.entity.IEntityLivingBase;
import crafttweaker.damage.IDamageSource;
import crafttweaker.entity.IEntityMob;
import crafttweaker.entity.IEntity;
import crafttweaker.item.IItemStack;
import crafttweaker.item.IMutableItemStack;
import crafttweaker.data.IData;
import crafttweaker.item.IIngredient;
import crafttweaker.liquid.ILiquidStack;
import crafttweaker.game.IGame;
import crafttweaker.world.IExplosion;
import crafttweaker.world.IBiome;
import crafttweaker.entity.AttributeModifier;
import crafttweaker.entity.AttributeInstance;
import crafttweaker.entity.Attribute;
import crafttweaker.potions.IPotionEffect;

import mods.ctutils.utils.Math;
import mods.contenttweaker.tconstruct.Material;
import mods.contenttweaker.tconstruct.MaterialBuilder;
import mods.contenttweaker.Fluid;
import mods.contenttweaker.VanillaFactory;
import mods.contenttweaker.Color;
import mods.contenttweaker.conarm.ArmorTraitBuilder;
import mods.contenttweaker.conarm.ArmorTrait;
import mods.contenttweaker.conarm.ArmorTraitDataRepresentation;
import mods.conarm.utils.IArmorModifications;
import mods.zenutils.I18n;
import mods.zenutils.DataUpdateOperation.OVERWRITE;
import mods.zenutils.DataUpdateOperation.APPEND;
import mods.zenutils.DataUpdateOperation.MERGE;
import mods.zenutils.DataUpdateOperation.REMOVE;
import mods.zenutils.DataUpdateOperation.BUMP;
import mods.zenutils.StaticString;
import mods.nuclearcraft.RadiationScrubber;
import mods.ctintegration.scalinghealth.DifficultyManager;

import native.slimeknights.tconstruct.library.utils.ToolHelper;

$expand IItemStack$hasTicTrait(traitid as string) as bool {
    return CotTicTraitLib.hasTicTrait(this, traitid);
}
$expand IItemStack$isTicTool() as bool {
    return CotTicLib.isTicTool(this);
}
$expand IItemStack$isTicArmor() as bool {
    return CotTicLib.isTicArmor(this);
}
$expand IItemStack$getOverslime() as int {
    if (this.isTicTool() || this.isTicArmor()) {
        if (!isNull(this.tag."moretcon.overslime".remaining)) {
            return this.tag."moretcon.overslime".remaining as int;
        }
    } else {
        return 0;
    }
}
$expand IMutableItemStack$setOverslime(num as int) as void {
    if (this.hasTicTrait("moretcon.overslime")) {
        this.updateTag({"moretcon.overslime" : {remaining : num as int}});
    }
}
$expand IMutableItemStack$addOverslime(num as int) as void {
    this.setOverslime(this.getOverslime() + num);
}
$expand IMutableItemStack$removeOverslime(num as int) as void {
    if (num >= this.getOverslime()) {
        this.setOverslime(0);
    } else {
        this.setOverslime(this.getOverslime() - num);
    }
}
$expand IItemStack$hasOverslime() as bool {
    if (CotTicTraitLib.hasTicTrait(this, "moretcon.overslime") && this.getOverslime() != 0) {
        return true;
    } else {
        return false;
    }
}
$expand IItemStack$hasEnergy() as bool {
    if ((!isNull(this.tag.EnergizedEnergy)) || (!isNull(this.tag.EvolvedEnergy)) || (!isNull(this.tag.FluxedEnergy))) {
        return true;
    } else {
        return false;
    }
}
$expand IItemStack$getEnergy() as int {
    if (this.hasEnergy()) {
        if (!isNull(this.tag.EvolvedEnergy)) {
            return this.tag.EvolvedEnergy as int;
        } else if (!isNull(this.tag.EnergizedEnergy)) {
            return this.tag.EnergizedEnergy as int;
        } else if (!isNull(this.tag.FluxedEnergy)) {
            return this.tag.FluxedEnergy as int;
        } else {
            return 0;
        }
    } else {
        return 0;
    }
}
$expand IMutableItemStack$setEnergy(num as int) as void {
    if (this.hasEnergy()) {
        if (!isNull(this.tag.EvolvedEnergy)) {
            this.updateTag({EvolvedEnergy : num});
        } else if (!isNull(this.tag.EnergizedEnergy)) {
            this.updateTag({EnergizedEnergy : num});
        } else if (!isNull(this.tag.FluxedEnergy)) {
            this.updateTag({FluxedEnergy : num});
        }
    }
}
$expand IMutableItemStack$addEnergy(num as int) as void {
    if (this.hasEnergy()) {
        this.setEnergy(this.getEnergy() + num);
    }
}
$expand IMutableItemStack$removeEnergy(num as int) as void {
    if (this.hasEnergy()) {
        this.setEnergy(this.getEnergy() - num);
    }
}
$expand IMutableItemStack$attemptDamageItemWithEnergy(num as int, player as IPlayer) as void {
    if (this.hasEnergy()) {
        var energyDura as int = this.getEnergy() / 640;
        if (energyDura >= num) {
            this.removeEnergy(num * 640);
        } else {
            var remainDura as int = num - energyDura;
            this.setEnergy(0);
            if (remainDura >= this.maxDamage) {
                ToolHelper.breakTool(this.native, player.native);
            } else {
                this.attemptDamageItem(remainDura, player);
            }
        }
    } else {
        if (num >= this.maxDamage) {
            ToolHelper.breakTool(this.native, player.native);
        } else {
            this.attemptDamageItem(num, player);
        }
    }
}

function lognum(a as int, b as int) as float {
    return (Math.log(b) as float / Math.log(a) as float) as float;
}

// Calculates what the effect of one piece of armor should be
// Many traits are implemented to bethe effect of 4 pieces of armor stacked together; This turns them into what the effect of a single armor piece should be.
// Special thanks to BDWSSBB
function calcSingleArmor(reduction as float) as float {
    // Bounds check to be safe
    var reduct = reduction;
    if (reduct > 1.0f) {
        reduct = 1.0f;
    } else if (reduct < 0.0f) {
        reduct = 0.0f;
    }
    return pow(1.0 - reduct as double, 0.25) as float;
}

val warmTrait = ArmorTraitBuilder.create("warm");
warmTrait.color = Color.fromHex("2196f3").getIntColor();
warmTrait.localizedName = game.localize("greedycraft.tconstruct.armor_trait.warmTrait.name");
warmTrait.localizedDescription = game.localize("greedycraft.tconstruct.armor_trait.warmTrait.desc");
warmTrait.onHurt = function(trait, armor, player, source, damage, newDamage, evt) {
    var reduction = 0.0f;
    if (!isNull(player) && player.world.getBiome(player.position).isSnowyBiome) {
        reduction += 0.05f;
        if (player.world.raining) {
            reduction += 0.025f;
        }
    }
    return newDamage * (1.0f - reduction as float) as float;
};
warmTrait.register();

val fortifiedTrait = ArmorTraitBuilder.create("fortified");
fortifiedTrait.color = Color.fromHex("bbbbbb").getIntColor();
fortifiedTrait.localizedName = game.localize("greedycraft.tconstruct.armor_trait.fortifiedTrait.name");
fortifiedTrait.localizedDescription = game.localize("greedycraft.tconstruct.armor_trait.fortifiedTrait.desc");
fortifiedTrait.onHurt = function(trait, armor, player, source, damage, newDamage, evt) {
    if (source.isProjectile()) {
        return (newDamage * 0.85f) as float;
    }
    return newDamage;
};
fortifiedTrait.register();

val infernoTrait = ArmorTraitBuilder.create("inferno");
infernoTrait.color = Color.fromHex("ff5722").getIntColor();
infernoTrait.localizedName = game.localize("greedycraft.tconstruct.armor_trait.infernoTrait.name");
infernoTrait.localizedDescription = game.localize("greedycraft.tconstruct.armor_trait.infernoTrait.desc");
infernoTrait.onHurt = function(trait, armor, player, source, damage, newDamage, evt) {
    if (!isNull(source.getTrueSource()) && source.getTrueSource() instanceof IEntityLivingBase) {
        var attacker as IEntity = source.getTrueSource();
        if (Math.random() < 0.2) {
            attacker.setFire(8);
        }
    }
    return newDamage;
};
infernoTrait.register();

val cryonicTrait = ArmorTraitBuilder.create("cryonic");
cryonicTrait.color = Color.fromHex("00e5ff").getIntColor();
cryonicTrait.localizedName = game.localize("greedycraft.tconstruct.armor_trait.cryonicTrait.name");
cryonicTrait.localizedDescription = game.localize("greedycraft.tconstruct.armor_trait.cryonicTrait.desc");
cryonicTrait.onHurt = function(trait, armor, player, source, damage, newDamage, evt) {
    if (!isNull(source.getTrueSource()) && source.getTrueSource() instanceof IEntityLivingBase) {
        var attacker as IEntityLivingBase = source.getTrueSource();
        if (Math.random() < 0.2) {
            attacker.addPotionEffect(<potion:minecraft:slowness>.makePotionEffect(200, 2, false, false));
        }
    }
    return newDamage;
};
cryonicTrait.register();

val knowledgefulTrait = ArmorTraitBuilder.create("knowledgeful");
knowledgefulTrait.color = Color.fromHex("76ff03").getIntColor();
knowledgefulTrait.localizedName = game.localize("greedycraft.tconstruct.armor_trait.knowledgefulTrait.name");
knowledgefulTrait.localizedDescription = game.localize("greedycraft.tconstruct.armor_trait.knowledgefulTrait.desc");
knowledgefulTrait.onHurt = function(trait, armor, player, source, damage, newDamage, evt) {
    var reduction = 0.0f;
    if (!isNull(player)) {
        var xp = player.xp as float;
        if(xp > 1000.0f) {
            xp = 1000.0f;
        }
        reduction = (xp / 1000.0f) as float * 0.36f;
    }
    
    return newDamage * calcSingleArmor(reduction as float) as float;
};
knowledgefulTrait.register();

val visionTrait = ArmorTraitBuilder.create("vision");
visionTrait.color = Color.fromHex("ffeb3b").getIntColor();
visionTrait.localizedName = game.localize("greedycraft.tconstruct.armor_trait.visionTrait.name");
visionTrait.localizedDescription = game.localize("greedycraft.tconstruct.armor_trait.visionTrait.desc");
visionTrait.onAbility = function(trait, level, world, player) {
    if (!isNull(player)) {
        if (player.getDimension() != 20) player.addPotionEffect(<potion:minecraft:night_vision>.makePotionEffect(330, 2, false, false));
    }
};
visionTrait.register();

val tidalForceTrait = ArmorTraitBuilder.create("tidal_force");
tidalForceTrait.color = Color.fromHex("69f0ae").getIntColor();
tidalForceTrait.localizedName = game.localize("greedycraft.tconstruct.armor_trait.tidalForceTrait.name");
tidalForceTrait.localizedDescription = game.localize("greedycraft.tconstruct.armor_trait.tidalForceTrait.desc");
tidalForceTrait.onAbility = function(trait, level, world, player) {
    if (!isNull(player)) {
        player.addPotionEffect(<potion:minecraft:water_breathing>.makePotionEffect(25, 2, false, false));
    }
};
tidalForceTrait.register();

val spartanTrait = ArmorTraitBuilder.create("spartan");
spartanTrait.color = Color.fromHex("fdd835").getIntColor();
spartanTrait.localizedName = game.localize("greedycraft.tconstruct.armor_trait.spartanTrait.name");
spartanTrait.localizedDescription = game.localize("greedycraft.tconstruct.armor_trait.spartanTrait.desc");
spartanTrait.onHurt = function(trait, armor, player, source, damage, newDamage, evt) {
    var reduction = 0.0f;
    if ((player.health as float / player.maxHealth as float) as float < 0.33f) {
        reduction = 0.3f + (1.0f - player.health as float / (player.maxHealth as float * 0.33f)) * 0.45f;
    }
    return newDamage * calcSingleArmor(reduction as float) as float;
};
spartanTrait.register();

val crystalTrait = ArmorTraitBuilder.create("crystal_force");
crystalTrait.color = Color.fromHex("18ffff").getIntColor(); 
crystalTrait.localizedName = game.localize("greedycraft.tconstruct.armor_trait.crystalTrait.name");
crystalTrait.localizedDescription = game.localize("greedycraft.tconstruct.armor_trait.crystalTrait.desc");
crystalTrait.onHurt = function(trait, armor, player, source, damage, newDamage, evt) {
    var damagePercent as float = 1.0f;
    if (armor.maxDamage != 0) {
        var dmg as float = 0.0f + armor.damage as float;
        var maxDmg as float = 0.0f + armor.maxDamage as float;
        var durabilityPercent as float = 1.0f - (dmg as float / maxDmg as float) as float;
        damagePercent = (1.05f - (durabilityPercent as float * 0.12f) as float);
    }
    return (newDamage * damagePercent) as float;
};
crystalTrait.register();

val secondLifeTrait = ArmorTraitBuilder.create("second_life");
secondLifeTrait.color = Color.fromHex("4caf50").getIntColor(); 
secondLifeTrait.localizedName = game.localize("greedycraft.tconstruct.armor_trait.secondLifeTrait.name");
secondLifeTrait.localizedDescription = game.localize("greedycraft.tconstruct.armor_trait.secondLifeTrait.desc");
secondLifeTrait.onHurt = function(trait, armor, player, source, damage, newDamage, evt) {
    if (!isNull(player) && damage < player.maxHealth && !source.isDamageAbsolute()) {
        if (damage > player.health && Math.random() < 0.05) {
            evt.cancel();
            player.addPotionEffect(<potion:minecraft:absorption>.makePotionEffect(200, 3, false, false));
            player.addPotionEffect(<potion:minecraft:regeneration>.makePotionEffect(100, 3, false, false));
            player.addPotionEffect(<potion:minecraft:resistance>.makePotionEffect(45, 4, false, false));
            return 0.0f;
        }
    }
    return newDamage;
};
secondLifeTrait.register();

val perfectionistTrait = ArmorTraitBuilder.create("perfectionist");
perfectionistTrait.color = Color.fromHex("00c853").getIntColor(); 
perfectionistTrait.localizedName = game.localize("greedycraft.tconstruct.armor_trait.perfectionistTrait.name");
perfectionistTrait.localizedDescription = game.localize("greedycraft.tconstruct.armor_trait.perfectionistTrait.desc");
perfectionistTrait.onHurt = function(trait, armor, player, source, damage, newDamage, evt) {
    if (!isNull(player) && newDamage > 5.0) {
        return (Math.round(newDamage / 5.0) as float * 5.0f) as float;
    }
    return newDamage as float;
};
perfectionistTrait.register();

val gambleTrait = ArmorTraitBuilder.create("gamble");
gambleTrait.color = Color.fromHex("fdd835").getIntColor(); 
gambleTrait.localizedName = game.localize("greedycraft.tconstruct.armor_trait.gambleTrait.name");
gambleTrait.localizedDescription = game.localize("greedycraft.tconstruct.armor_trait.gambleTrait.desc");
gambleTrait.onHurt = function(trait, armor, player, source, damage, newDamage, evt) {
    if (Math.random() < 0.05) {
        return newDamage * 2.0f;
    }
    if (Math.random() < 0.25) {
        return (newDamage / 2.0f) as float;
    }
    return newDamage;
};
gambleTrait.register();

val firstGuardTrait = ArmorTraitBuilder.create("first_guard");
firstGuardTrait.color = Color.fromHex("f44336").getIntColor(); 
firstGuardTrait.localizedName = game.localize("greedycraft.tconstruct.armor_trait.firstGuardTrait.name");
firstGuardTrait.localizedDescription = game.localize("greedycraft.tconstruct.armor_trait.firstGuardTrait.desc");
firstGuardTrait.onHurt = function(trait, armor, player, source, damage, newDamage, evt) {
    if (!isNull(player) && (player.maxHealth - player.health) as float < 1.0f) {
        return (newDamage * 0.84f) as float;
    }
    return newDamage;
};
firstGuardTrait.register();

val levelingdefenseTrait = ArmorTraitBuilder.create("levelingdefense");
levelingdefenseTrait.color = Color.fromHex("7e57c2").getIntColor(); 
levelingdefenseTrait.localizedName = game.localize("greedycraft.tconstruct.armor_trait.levelingdefenseTrait.name");
levelingdefenseTrait.addItem(<ore:plateHonor>);
levelingdefenseTrait.maxLevel = 1;
levelingdefenseTrait.localizedDescription = game.localize("greedycraft.tconstruct.armor_trait.levelingdefenseTrait.desc");
levelingdefenseTrait.extraInfo = function(thisTrait, item, tag) {
    if (isNull(tag) || isNull(tag.memberGet("Modifiers"))) {
        return [] as string[];
    }
    var modifiers = tag.memberGet("Modifiers") as IData;
    var armorLevel = {} as IData;
    if (modifiers.asString().contains("leveling_armor")) {
        for i in 0 to modifiers.length {
            var current as IData = modifiers[i];
            if (current.asString().contains("leveling_armor")) {
                armorLevel = current;
                break;
            }
        }
    }
    var multiplier as float = 0.0f;
    if (!isNull(armorLevel.memberGet("level"))) {
        var level = armorLevel.memberGet("level").asInt() as int;
        multiplier += 0.025f * level as float;
        if (multiplier > 0.5f) {
            multiplier = 0.5f + (multiplier as float - 1.0f) / 4.0f;
        }
    }
    var percentage as int = Math.round((1.0f - (1.0f / (multiplier + 1.0f))) * 100.0f) as int;
    var desc as string[] = [I18n.format("greedycraft.armor_trait.tooltip.damage_reduction", "" + calcSingleArmor(percentage))];
    return desc;
};
levelingdefenseTrait.onHurt = function(trait, armor, player, source, damage, newDamage, evt) {
    var modifiers = armor.tag.memberGet("Modifiers") as IData;
    var armorLevel = {} as IData;
    if (modifiers.asString().contains("leveling_armor")) {
        for i in 0 to modifiers.length {
            var current as IData = modifiers[i];
            if (current.asString().contains("leveling_armor")) {
                armorLevel = current;
                break;
            }
        }
    }
    var multiplier as float = 0.0f;
    if (!isNull(armorLevel.memberGet("level"))) {
        var level = armorLevel.memberGet("level").asInt() as int;
        while(level > 0) {
            level -= 1;
            multiplier += 0.05f;
        }
        if (multiplier > 1.0f) {
            multiplier = 1.0f + (multiplier - 1.0f) / 4.0f;
        }
    }
    // Thanks BDWSSBB for fixing this formula
    val reduction = 1.0f - 1.0f / (multiplier + 1.0f);
    return newDamage as float * calcSingleArmor(reduction);
};
levelingdefenseTrait.register();

val luckyTrait = ArmorTraitBuilder.create("lucky");
luckyTrait.color = Color.fromHex("00e676").getIntColor(); 
luckyTrait.localizedName = game.localize("greedycraft.tconstruct.armor_trait.luckyTrait.name");
luckyTrait.localizedDescription = game.localize("greedycraft.tconstruct.armor_trait.luckyTrait.desc");
luckyTrait.onAbility = function(trait, level, world, player) {
    if (!isNull(player)) {
        player.addPotionEffect(<potion:minecraft:luck>.makePotionEffect(25, 0, false, false));
    }
};
luckyTrait.register();

val purifyingTrait = ArmorTraitBuilder.create("purifying");
purifyingTrait.color = Color.fromHex("eeeeee").getIntColor(); 
purifyingTrait.localizedName = game.localize("greedycraft.tconstruct.armor_trait.purifyingTrait.name");
purifyingTrait.localizedDescription = game.localize("greedycraft.tconstruct.armor_trait.purifyingTrait.desc");
purifyingTrait.onAbility = function(trait, level, world, player) {
    if (!isNull(player)) {
        if (player.isPotionActive(<potion:minecraft:wither>)) {
            player.removePotionEffect(<potion:minecraft:wither>);
        }
    }
};
purifyingTrait.register();

val milkyTrait = ArmorTraitBuilder.create("milky");
milkyTrait.color = Color.fromHex("ffffff").getIntColor(); 
milkyTrait.localizedName = game.localize("greedycraft.tconstruct.armor_trait.milkyTrait.name");
milkyTrait.localizedDescription = game.localize("greedycraft.tconstruct.armor_trait.milkyTrait.desc");
milkyTrait.onAbility = function(trait, level, world, player) {
    if (!isNull(player)) {
        if (world.getWorldTime() as long % 18000 == 0) {
            player.clearActivePotions();
        }
    }
};
milkyTrait.register();

val poopTrait = ArmorTraitBuilder.create("poopy");
poopTrait.color = Color.fromHex("6d4c41").getIntColor(); 
poopTrait.localizedName = game.localize("greedycraft.tconstruct.armor_trait.poopTrait.name");
poopTrait.localizedDescription = game.localize("greedycraft.tconstruct.armor_trait.poopTrait.desc");
poopTrait.onAbility = function(trait, level, world, player) {
    if (!isNull(player)) {
        player.addPotionEffect(<potion:minecraft:nausea>.makePotionEffect(25, 0, false, false));
    }
};
poopTrait.register();

val trueDefenseTrait = ArmorTraitBuilder.create("true_defense");
trueDefenseTrait.color = Color.fromHex("33ffff").getIntColor(); 
trueDefenseTrait.localizedName = game.localize("greedycraft.tconstruct.armor_trait.trueDefenseTrait.name");
trueDefenseTrait.localizedDescription = game.localize("greedycraft.tconstruct.armor_trait.trueDefenseTrait.desc");
trueDefenseTrait.onHurt = function(trait, armor, player, source, damage, newDamage, evt) {
    if (!isNull(player) && source.isDamageAbsolute()) {
        return (newDamage as float * 0.9f) as float;
    }
    return newDamage as float;
};
trueDefenseTrait.register();

val holdGroundTrait = ArmorTraitBuilder.create("hold_ground");
holdGroundTrait.color = Color.fromHex("f44336").getIntColor(); 
holdGroundTrait.localizedName = game.localize("greedycraft.tconstruct.armor_trait.holdGroundTrait.name");
holdGroundTrait.localizedDescription = game.localize("greedycraft.tconstruct.armor_trait.holdGroundTrait.desc");
holdGroundTrait.onHurt = function(trait, armor, player, source, damage, newDamage, evt) {
    if (!isNull(player) && player.isSneaking) {
        return (newDamage as float * 0.92f) as float;
    }
    return newDamage as float;
};
holdGroundTrait.onKnockback = function(trait, armor, player, evt) {
    if (!isNull(player) && player.isSneaking) {
        evt.cancel();
    }
};
holdGroundTrait.register();

val motionTrait = ArmorTraitBuilder.create("motion");
motionTrait.color = Color.fromHex("ffee58").getIntColor(); 
motionTrait.localizedName = game.localize("greedycraft.tconstruct.armor_trait.motionTrait.name");
motionTrait.localizedDescription = game.localize("greedycraft.tconstruct.armor_trait.motionTrait.desc");
motionTrait.onHurt = function(trait, armor, player, source, damage, newDamage, evt) {
    if (!isNull(player) && player.isSprinting) {
        return (newDamage as float * 0.93f) as float;
    }
    return newDamage as float;
};
motionTrait.onKnockback = function(trait, armor, player, evt) {
    if (!isNull(player) && player.isSprinting) {
        evt.strength = (evt.strength * 1.4) as float;
    }
};
motionTrait.register();

val kungfuTrait = ArmorTraitBuilder.create("kungfu");
kungfuTrait.color = Color.fromHex("ffc107").getIntColor(); 
kungfuTrait.localizedName = game.localize("greedycraft.tconstruct.armor_trait.kungfuTrait.name");
kungfuTrait.localizedDescription = game.localize("greedycraft.tconstruct.armor_trait.kungfuTrait.desc");
kungfuTrait.onHurt = function(trait, armor, player, source, damage, newDamage, evt) {
    if (!isNull(player) && !isNull(source.getTrueSource()) && source.getTrueSource() instanceof IEntityLivingBase) {
        var attacker as IEntityLivingBase = source.getTrueSource();
        if (attacker.isChild) {
            return (newDamage * 1.125f) as float;
        }
    }
    if (!isNull(player) && !source.isDamageAbsolute()) {
        if (Math.random() < 0.04) {
            player.addPotionEffect(<potion:minecraft:speed>.makePotionEffect(100, 3, false, false));
            evt.cancel();
            return 0.0f;
        }
    }
    return newDamage as float;
};
kungfuTrait.register();

val thronyTrait = ArmorTraitBuilder.create("throny");
thronyTrait.color = Color.fromHex("4caf50").getIntColor(); 
thronyTrait.localizedName = game.localize("greedycraft.tconstruct.armor_trait.thronyTrait.name");
thronyTrait.localizedDescription = game.localize("greedycraft.tconstruct.armor_trait.thronyTrait.desc");
thronyTrait.onHurt = function(trait, armor, player, source, damage, newDamage, evt) {
    if (!isNull(player)) {
        if (!isNull(source.getTrueSource()) && source.getTrueSource() instanceof IEntityLivingBase) {
            var attacker as IEntityLivingBase = source.getTrueSource();
            var newSource as IDamageSource = IDamageSource.createThornsDamage(player);
            var dmg as float = damage * 0.025f;
            if (dmg > 10.0f) {
                dmg = 10.0f;
            }
            attacker.attackEntityFrom(newSource, dmg);
        }
    }
    return newDamage as float;
};
thronyTrait.register();

val enduranceTrait = ArmorTraitBuilder.create("endurance");
enduranceTrait.color = Color.fromHex("3f51b5").getIntColor(); 
enduranceTrait.localizedName = game.localize("greedycraft.tconstruct.armor_trait.enduranceTrait.name");
enduranceTrait.localizedDescription = game.localize("greedycraft.tconstruct.armor_trait.enduranceTrait.desc");
enduranceTrait.onHurt = function(trait, armor, player, source, damage, newDamage, evt) {
    if (!isNull(player)) {
        if (newDamage < (player.maxHealth * 0.05f) as float) {
            return newDamage * 0.8f as float;
        }
    }
    return newDamage as float;
};
enduranceTrait.register();

val vaccineTrait = ArmorTraitBuilder.create("vaccine");
vaccineTrait.color = Color.fromHex("00ffcc").getIntColor(); 
vaccineTrait.localizedName = game.localize("greedycraft.tconstruct.armor_trait.vaccineTrait.name");
vaccineTrait.localizedDescription = game.localize("greedycraft.tconstruct.armor_trait.vaccineTrait.desc");
vaccineTrait.onAbility = function(trait, level, world, player) {
    if (!isNull(player)) {
        if(player.isPotionActive(<potion:abyssalcraft:cplague>)) {
            player.removePotionEffect(<potion:abyssalcraft:cplague>);
        }
    }
};
vaccineTrait.register();

val strongVaccineTrait = ArmorTraitBuilder.create("strong_vaccine");
strongVaccineTrait.color = Color.fromHex("00ffcc").getIntColor(); 
strongVaccineTrait.localizedName = game.localize("greedycraft.tconstruct.armor_trait.strongVaccineTrait.name");
strongVaccineTrait.localizedDescription = game.localize("greedycraft.tconstruct.armor_trait.strongVaccineTrait.desc");
strongVaccineTrait.onAbility = function(trait, level, world, player) {
    if (!isNull(player)) {
        if(player.isPotionActive(<potion:abyssalcraft:cplague>)) {
            player.removePotionEffect(<potion:abyssalcraft:cplague>);
        }
        if(player.isPotionActive(<potion:abyssalcraft:dplague>)) {
            player.removePotionEffect(<potion:abyssalcraft:dplague>);
        }
    }
};
strongVaccineTrait.register();

val warpDrainTrait = ArmorTraitBuilder.create("warp_drain");
warpDrainTrait.color = Color.fromHex("ab47bc").getIntColor(); 
warpDrainTrait.localizedName = game.localize("greedycraft.tconstruct.armor_trait.warpDrainTrait.name");
warpDrainTrait.localizedDescription = game.localize("greedycraft.tconstruct.armor_trait.warpDrainTrait.desc");
warpDrainTrait.onAbility = function(trait, level, world, player) {
    if (!isNull(player)) {
        if(world.getWorldTime() as long % 18000 == 0) {
            var success = false;
            if(player.warpNormal > 0 && Math.random() < 0.25) {
                player.warpNormal -= 1;
                success = true;
            } else if(player.warpTemporary > 0) {
                player.warpTemporary -= 1;
                success = true;
            }
            if(success) {
                val random = Math.random();
                if(random < 0.2) {
                    player.addPotionEffect(<potion:minecraft:speed>.makePotionEffect(240, 2, false, false));
                } else if(random < 0.4) {
                    player.addPotionEffect(<potion:minecraft:strength>.makePotionEffect(200, 2, false, false));
                } else if(random < 0.6) {
                    player.addPotionEffect(<potion:minecraft:resistance>.makePotionEffect(200, 1, false, false));
                } else if(random < 0.8) {
                    player.addPotionEffect(<potion:minecraft:jump_boost>.makePotionEffect(200, 2, false, false));
                } else {
                    player.addPotionEffect(<potion:minecraft:haste>.makePotionEffect(200, 2, false, false));
                }
            }
        }
    }
};
warpDrainTrait.register();

val overrestrainTrait = ArmorTraitBuilder.create("overrestrain");
overrestrainTrait.color = Color.fromHex("ffffff").getIntColor();
overrestrainTrait.localizedName = game.localize("greedycraft.tconstruct.armor_trait.overrestrainTrait.name");
overrestrainTrait.localizedDescription = game.localize("greedycraft.tconstruct.armor_trait.overrestrainTrait.desc");
overrestrainTrait.onHurt = function(trait, armor, player, source, damage, newDamage, evt) {
    if (!isNull(player)) {
        if (player.health <= (player.maxHealth) * 0.7f) {
            return newDamage * 0.5f;
        } else {
            return newDamage * 2.0f;
        }
    }
    return newDamage;
};
overrestrainTrait.register();

val elementfriendlyTrait = ArmorTraitBuilder.create("elementfriendly");
elementfriendlyTrait.color = Color.fromHex("ffffff").getIntColor();
elementfriendlyTrait.localizedName = game.localize("greedycraft.tconstruct.armor_trait.elementfriendlyTrait.name");
elementfriendlyTrait.localizedDescription = game.localize("greedycraft.tconstruct.armor_trait.elementfriendlyTrait.desc");
elementfriendlyTrait.onHurt = function(trait, armor, player, source, damage, newDamage, evt) {
    if (!isNull(player)) {
        if (Math.random() <= 0.005) {
            player.addPotionEffect(<potion:minecraft:strength>.makePotionEffect(100, 2, false, false));
        }
        if (Math.random() <= 0.005) {
            player.addPotionEffect(<potion:minecraft:speed>.makePotionEffect(100, 2, false, false));
        }
        if (Math.random() <= 0.005) {
            player.addPotionEffect(<potion:minecraft:haste>.makePotionEffect(100, 2, false, false));
        }
        if (Math.random() <= 0.005) {
            player.addPotionEffect(<potion:minecraft:regeneration>.makePotionEffect(100, 2, false, false));
        }
        if (Math.random() <= 0.005) {
            player.addPotionEffect(<potion:minecraft:jump_boost>.makePotionEffect(100, 2, false, false));
        }
        if (Math.random() <= 0.005) {
            player.addPotionEffect(<potion:potioncore:diamond_skin>.makePotionEffect(100, 2, false, false));
        }
        if (Math.random() <= 0.005) {
            player.addPotionEffect(<potion:minecraft:absorption>.makePotionEffect(100, 2, false, false));
        }
        if (Math.random() <= 0.005) {
            player.addPotionEffect(<potion:minecraft:resistance>.makePotionEffect(100, 2, false, false));
        }
        if (Math.random() <= 0.005) {
            player.addPotionEffect(<potion:minecraft:instant_health>.makePotionEffect(1, 4, false, false));
        }
    }
    return newDamage;
};
elementfriendlyTrait.register();

val geneticevolutionTrait = ArmorTraitBuilder.create("geneticevolution");
geneticevolutionTrait.color = Color.fromHex("ffffff").getIntColor();
geneticevolutionTrait.localizedName = game.localize("greedycraft.tconstruct.armor_trait.geneticevolutionTrait.name");
geneticevolutionTrait.localizedDescription = game.localize("greedycraft.tconstruct.armor_trait.geneticevolutionTrait.desc");
geneticevolutionTrait.onHurt = function(trait, armor, player, source, damage, newDamage, evt) {
    if (Math.random() < 0.05f) {
        return newDamage * 0 as int;
    } else {
        return newDamage;
    }
    return newDamage;
};
geneticevolutionTrait.register();

val geneticevolution2Trait = ArmorTraitBuilder.create("geneticevolution2");
geneticevolution2Trait.color = Color.fromHex("ffffff").getIntColor();
geneticevolution2Trait.localizedName = game.localize("greedycraft.tconstruct.armor_trait.geneticevolutionTrait2.name");
geneticevolution2Trait.localizedDescription = game.localize("greedycraft.tconstruct.armor_trait.geneticevolutionTrait2.desc");
geneticevolution2Trait.onHurt = function(trait, armor, player, source, damage, newDamage, evt) {
    if (Math.random() < 0.15f) {
        return newDamage * 0 as int;
    } else {
        return newDamage;
    }
    return newDamage;
};
geneticevolution2Trait.register();

val disappearingTrait = ArmorTraitBuilder.create("disappearing");
disappearingTrait.color = Color.fromHex("ffffff").getIntColor();
disappearingTrait.localizedName = game.localize("greedycraft.tconstruct.armor_trait.disappearingTrait.name");
disappearingTrait.localizedDescription = game.localize("greedycraft.tconstruct.armor_trait.disappearingTrait.desc");
disappearingTrait.onAbility = function(trait, level, world, player) {
    if (!isNull(player)) {
        player.addPotionEffect(<potion:minecraft:invisibility>.makePotionEffect(20, 2, false, false));
    }
};
disappearingTrait.register();

val twilightarmor1Trait = ArmorTraitBuilder.create("twilight_armor1");
twilightarmor1Trait.color = Color.fromHex("ffffff").getIntColor();
twilightarmor1Trait.localizedName = game.localize("greedycraft.tconstruct.armor_trait.twilightarmor1Trait.name");
twilightarmor1Trait.localizedDescription = game.localize("greedycraft.tconstruct.armor_trait.twilightarmorTrait.desc");
twilightarmor1Trait.onHurt = function(trait, armor, player, source, damage, newDamage, evt) {
    if (player.getDimension() == 420||player.getDimension() == 421||player.getDimension() == 422||player.getDimension() == 423||player.getDimension() == 424) {
        return newDamage * 0.95f;
    }
    return newDamage;
};
twilightarmor1Trait.register();

val twilightarmor2Trait = ArmorTraitBuilder.create("twilight_armor2");
twilightarmor2Trait.color = Color.fromHex("ffffff").getIntColor();
twilightarmor2Trait.localizedName = game.localize("greedycraft.tconstruct.armor_trait.twilightarmor2Trait.name");
twilightarmor2Trait.localizedDescription = game.localize("greedycraft.tconstruct.armor_trait.twilightarmorTrait.desc");
twilightarmor2Trait.onHurt = function(trait, armor, player, source, damage, newDamage, evt) {
    if (player.getDimension() == 420||player.getDimension() == 421||player.getDimension() == 422||player.getDimension() == 423||player.getDimension() == 424) {
        return newDamage * 0.9f;
    }
    return newDamage;
};
twilightarmor2Trait.register();

val twilightarmor3Trait = ArmorTraitBuilder.create("twilight_armor3");
twilightarmor3Trait.color = Color.fromHex("ffffff").getIntColor();
twilightarmor3Trait.localizedName = game.localize("greedycraft.tconstruct.armor_trait.twilightarmor3Trait.name");
twilightarmor3Trait.localizedDescription = game.localize("greedycraft.tconstruct.armor_trait.twilightarmorTrait.desc");
twilightarmor3Trait.onHurt = function(trait, armor, player, source, damage, newDamage, evt) {
    if (player.getDimension() == 420||player.getDimension() == 421||player.getDimension() == 422||player.getDimension() == 423||player.getDimension() == 424) {
        return newDamage * 0.85f;
    }
    return newDamage;
};
twilightarmor3Trait.register();

val twilightarmor4Trait = ArmorTraitBuilder.create("twilight_armor4");
twilightarmor4Trait.color = Color.fromHex("ffffff").getIntColor();
twilightarmor4Trait.localizedName = game.localize("greedycraft.tconstruct.armor_trait.twilightarmor4Trait.name");
twilightarmor4Trait.localizedDescription = game.localize("greedycraft.tconstruct.armor_trait.twilightarmorTrait.desc");
twilightarmor4Trait.onHurt = function(trait, armor, player, source, damage, newDamage, evt) {
    if (player.getDimension() == 420||player.getDimension() == 421||player.getDimension() == 422||player.getDimension() == 423||player.getDimension() == 424) {
        return newDamage * 0.8f;
    }
    return newDamage;
};
twilightarmor4Trait.register();

val twilightarmor5Trait = ArmorTraitBuilder.create("twilight_armor5");
twilightarmor5Trait.color = Color.fromHex("ffffff").getIntColor();
twilightarmor5Trait.localizedName = game.localize("greedycraft.tconstruct.armor_trait.twilightarmor5Trait.name");
twilightarmor5Trait.localizedDescription = game.localize("greedycraft.tconstruct.armor_trait.twilightarmorTrait.desc");
twilightarmor5Trait.onHurt = function(trait, armor, player, source, damage, newDamage, evt) {
    if (player.getDimension() == 420||player.getDimension() == 421||player.getDimension() == 422||player.getDimension() == 423||player.getDimension() == 424) {
        return newDamage * 0.75f;
    }
    return newDamage;
};
twilightarmor5Trait.register();

val nightmareTrait = ArmorTraitBuilder.create("nightmare");
nightmareTrait.color = Color.fromHex("ffffff").getIntColor();
nightmareTrait.localizedName = game.localize("greedycraft.tconstruct.armor_trait.nightmareTrait.name");
nightmareTrait.localizedDescription = game.localize("greedycraft.tconstruct.armor_trait.nightmareTrait.desc");
nightmareTrait.onHurt = function(trait, armor, player, source, damage, newDamage, evt) { 
    var mutiplier = player.maxHealth / 1000;
    if (mutiplier >= 0.2) {
        return newDamage * 0.8;
    }
    return newDamage * (1 - mutiplier);
};
nightmareTrait.register();

val foglightTrait = ArmorTraitBuilder.create("fog_light");
foglightTrait.color = Color.fromHex("ffeb3b").getIntColor();
foglightTrait.localizedName = game.localize("greedycraft.tconstruct.armor_trait.foglightTrait.name");
foglightTrait.localizedDescription = game.localize("greedycraft.tconstruct.armor_trait.foglightTrait.desc");
foglightTrait.onAbility = function(trait, level, world, player) {
    if (!isNull(player)) {
        if (player.getDimension() == 69){
                if(player.getY() < 100 ){
                        player.addPotionEffect(<potion:minecraft:regeneration>.makePotionEffect(99, 1, false, false));
                }
        }
    }
};
foglightTrait.register();

val timeturnTrait = ArmorTraitBuilder.create("time_turn");
timeturnTrait.color = Color.fromHex("ff5722").getIntColor();
timeturnTrait.localizedName = game.localize("greedycraft.tconstruct.armor_trait.timeturnTrait.name");
timeturnTrait.localizedDescription = game.localize("greedycraft.tconstruct.armor_trait.timeturnTrait.desc");
timeturnTrait.onHurt = function(trait, armor, player, source, damage, newDamage, evt) {
        if(Math.random()< 0.05){
            val player as IPlayer = player;
            mods.contenttweaker.Commands.call("time add 12000",player,player.world,false,true);
        }
        return newDamage;
};
timeturnTrait.register();

val soul_absourceTrait = ArmorTraitBuilder.create("soul_absource");
soul_absourceTrait.color = Color.fromHex("ff5722").getIntColor();
soul_absourceTrait.localizedName = game.localize("greedycraft.tconstruct.armor_trait.soul_absourceTrait.name");
soul_absourceTrait.localizedDescription = game.localize("greedycraft.tconstruct.armor_trait.soul_absourceTrait.desc");
soul_absourceTrait.onHurt = function(trait, armor, player, source, damage, newDamage, evt) {
    if(!player.world.remote && Math.random() < 0.5 && player.xp >= 30){
            player.xp -= 1;
            return newDamage * 0.6f;
    }
    return newDamage;
};
soul_absourceTrait.register();

val void_walkTrait = ArmorTraitBuilder.create("void_walk");
void_walkTrait.color = Color.fromHex("ffeb3b").getIntColor();
void_walkTrait.localizedName = game.localize("greedycraft.tconstruct.armor_trait.void_walkTrait.name");
void_walkTrait.localizedDescription = game.localize("greedycraft.tconstruct.armor_trait.void_walkTrait.desc");
void_walkTrait.onAbility = function(trait, level, world, player) {
    if (!isNull(player)) {
        if(player.getY() < 0 ){
            player.addPotionEffect(<potion:minecraft:levitation>.makePotionEffect(300, 2, false, false));
        }
    }
};
void_walkTrait.register();

val void_radiationTrait = ArmorTraitBuilder.create("void_radiation");
void_radiationTrait.color = Color.fromHex("ffeb3b").getIntColor();
void_radiationTrait.localizedName = game.localize("greedycraft.tconstruct.armor_trait.void_radiationTrait.name");
void_radiationTrait.localizedDescription = game.localize("greedycraft.tconstruct.armor_trait.void_radiationTrait.desc");
void_radiationTrait.onAbility = function(trait, level, world, player) {
for entity in world.getEntitiesInArea(crafttweaker.util.Position3f.create(((player.x)- 3),((player.y)- 3),((player.z)- 3)),crafttweaker.util.Position3f.create(((player.x)+ 3),((player.y)+ 3),((player.z)+ 3))){
    if(entity instanceof IEntityLivingBase && !entity instanceof IPlayer){
        val en as IEntityLivingBase = entity;
            if(!en.isPotionActive(<potion:minecraft:wither>)){
                en.addPotionEffect(<potion:minecraft:wither>.makePotionEffect(60, 2, false, false));
            }
        }
    }
};
void_radiationTrait.register();

val self_poisonTrait = ArmorTraitBuilder.create("self_poison");
self_poisonTrait.color = Color.fromHex("ff5722").getIntColor();
self_poisonTrait.localizedName = game.localize("greedycraft.tconstruct.armor_trait.self_poisonTrait.name");
self_poisonTrait.localizedDescription = game.localize("greedycraft.tconstruct.armor_trait.self_poisonTrait.desc");
self_poisonTrait.onHurt = function(trait, armor, player, source, damage, newDamage, evt) {
    if (!isNull(source.getTrueSource()) && source.getTrueSource() instanceof IEntityLivingBase) {
        var attacker as IEntityLivingBase = source.getTrueSource();
        if(Math.random() < 0.4){
            attacker.addPotionEffect(<potion:minecraft:wither>.makePotionEffect(200, 1, false, false));
        }
        if(Math.random() < 0.2){
            player.addPotionEffect(<potion:minecraft:wither>.makePotionEffect(100, 1, false, false));
        }
    }
    return newDamage;
};
self_poisonTrait.register();

val old_ones_barrierTrait = ArmorTraitBuilder.create("old_ones_barrier");
old_ones_barrierTrait.color = Color.fromHex("ffeb3b").getIntColor();
old_ones_barrierTrait.localizedName = game.localize("greedycraft.tconstruct.armor_trait.old_ones_barrierTrait.name");
old_ones_barrierTrait.localizedDescription = game.localize("greedycraft.tconstruct.armor_trait.old_ones_barrierTrait.desc");
old_ones_barrierTrait.onAbility = function(trait, level, world, player) {
    if (!isNull(player)) {
        player.addPotionEffect(<potion:potioncore:diamond_skin>.makePotionEffect(20, 6, false, false));
    }
};
old_ones_barrierTrait.register();

val old_ones_barrier2Trait = ArmorTraitBuilder.create("old_ones_barrier2");
old_ones_barrier2Trait.color = Color.fromHex("ffeb3b").getIntColor();
old_ones_barrier2Trait.localizedName = game.localize("greedycraft.tconstruct.armor_trait.old_ones_barrierTrait2.name");
old_ones_barrier2Trait.localizedDescription = game.localize("greedycraft.tconstruct.armor_trait.old_ones_barrierTrait.desc");
old_ones_barrier2Trait.onAbility = function(trait, level, world, player) {
    if (!isNull(player)) {
        player.addPotionEffect(<potion:potioncore:diamond_skin>.makePotionEffect(20, 11, false, false));
    }
};
old_ones_barrier2Trait.register();

val permanent_antibodyTrait = ArmorTraitBuilder.create("permanent_antibody");
permanent_antibodyTrait.color = Color.fromHex("ffeb3b").getIntColor();
permanent_antibodyTrait.localizedName = game.localize("greedycraft.tconstruct.armor_trait.permanent_antibodyTrait.name");
permanent_antibodyTrait.localizedDescription = game.localize("greedycraft.tconstruct.armor_trait.permanent_antibodyTrait.desc");
permanent_antibodyTrait.onAbility = function(trait, level, world, player) {
    if (!isNull(player)) {
        player.removePotionEffect(<potion:champions:plague>);
        player.removePotionEffect(<potion:abyssalcraft:cplague>);
        player.removePotionEffect(<potion:abyssalcraft:dplague_long>);
    }
};
permanent_antibodyTrait.register();

val electric_shockTrait = ArmorTraitBuilder.create("electric_shock");
electric_shockTrait.color = Color.fromHex("ffeb3b").getIntColor();
electric_shockTrait.localizedName = game.localize("greedycraft.tconstruct.armor_trait.electric_shockTrait.name");
electric_shockTrait.localizedDescription = game.localize("greedycraft.tconstruct.armor_trait.electric_shockTrait.desc");
electric_shockTrait.onHurt = function(trait, armor, player, source, damage, newDamage, evt) {
    if (!isNull(player)) {
        for entity in player.world.getEntitiesInArea(crafttweaker.util.Position3f.create(((player.x)- 5),((player.y)- 5),((player.z)- 5)),crafttweaker.util.Position3f.create(((player.x)+ 5),((player.y)+ 5),((player.z)+ 5))){
            if (entity instanceof IEntityLivingBase && !entity instanceof IPlayer){
                val en as IEntityLivingBase = entity;
                if (en.isUndead) {
                    en.addPotionEffect(<potion:minecraft:instant_health>.makePotionEffect(1, 3, false, false));
                } else {
                    en.addPotionEffect(<potion:minecraft:instant_damage>.makePotionEffect(1, 3, false, false));
                }
            }
        }
    }
    return newDamage;
};
electric_shockTrait.register();

for i in 2 to 11 {
    ArmorTraitBuilder.create("lighting" + i).color = Color.fromHex("ffffff").getIntColor(); 
    ArmorTraitBuilder.create("lighting" + i).localizedName = game.localize("greedycraft.tconstruct.armor_trait.lightingTrait" + i + ".name");
    ArmorTraitBuilder.create("lighting" + i).localizedDescription = game.localize("greedycraft.tconstruct.armor_trait.lightingTrait.desc");
    ArmorTraitBuilder.create("lighting" + i).onHurt = function(trait, armor, player, source, damage, newDamage, evt) {
        if (player.getDimension() < 830 && player.getDimension() > 819) {
            var amp = (1 - (Math.log(i) / Math.log(10))) as float;
            return newDamage * amp;
        }
        return newDamage;
    };
    ArmorTraitBuilder.create("lighting" + i).register();
}

val unstableTrait = ArmorTraitBuilder.create("unstable");
unstableTrait.color = Color.fromHex("ffeb3b").getIntColor();
unstableTrait.localizedName = game.localize("greedycraft.tconstruct.armor_trait.unstableTrait.name");
unstableTrait.localizedDescription = game.localize("greedycraft.tconstruct.armor_trait.unstableTrait.desc");
unstableTrait.onHurt = function(trait, armor, player, source, damage, newDamage, evt) {
    if (!isNull(player)) {
        if (Math.random() <= 0.02) {
            mods.contenttweaker.Commands.call("summon minecraft:tnt",player,player.world,false,true);
        }
    }
    return newDamage;
};
unstableTrait.register();

val IAmetalTrait = ArmorTraitBuilder.create("ia_metals");
IAmetalTrait.color = Color.fromHex("ffeb3b").getIntColor();
IAmetalTrait.localizedName = game.localize("greedycraft.tconstruct.armor_trait.IAmetalTrait.name");
IAmetalTrait.localizedDescription = game.localize("greedycraft.tconstruct.armor_trait.IAmetalTrait.desc");
IAmetalTrait.onHurt = function(trait, armor, player, source, damage, newDamage, evt) {
    if (!isNull(source.getTrueSource()) && source.getTrueSource() instanceof IEntityLivingBase) {
        var attacker as IEntityLivingBase = source.getTrueSource();
        if (attacker.isInWater) {
            if (player.isInWater) {
                return newDamage * 1.2f;
            } else {
                return newDamage * 0.4f;
            }
            return newDamage;
        }
        return newDamage;
    }
    return newDamage;
};
IAmetalTrait.register();

val IAmetal2Trait = ArmorTraitBuilder.create("ia_metals2");
IAmetal2Trait.color = Color.fromHex("ffeb3b").getIntColor();
IAmetal2Trait.localizedName = game.localize("greedycraft.tconstruct.armor_trait.IAmetalTrait2.name");
IAmetal2Trait.localizedDescription = game.localize("greedycraft.tconstruct.armor_trait.IAmetalTrait.desc");
IAmetal2Trait.onHurt = function(trait, armor, player, source, damage, newDamage, evt) {
    if (!isNull(source.getTrueSource()) && source.getTrueSource() instanceof IEntityLivingBase) {
        var attacker as IEntityLivingBase = source.getTrueSource();
        if (attacker.isInWater) {
            if (player.isInWater) {
                return newDamage * 1.4f;
            } else {
                return newDamage * 0.2f;
            }
            return newDamage;
        }
        return newDamage;
    }
    return newDamage;
};
IAmetal2Trait.register();

val active_sourceTrait = ArmorTraitBuilder.create("active_source");
active_sourceTrait.color = Color.fromHex("ffffff").getIntColor(); 
active_sourceTrait.localizedName = game.localize("greedycraft.tconstruct.armor_trait.active_sourceTrait.name");
active_sourceTrait.localizedDescription = game.localize("greedycraft.tconstruct.armor_trait.active_sourceTrait.desc");
active_sourceTrait.onAbility = function(trait, level, world, player) {
    if (!isNull(player)) {
        var slowdown as float = 1.0f;
        for armor in player.armorInventory {
            if (CotTicTraitLib.hasTicTrait(armor, "slowdown_armor")) {
                slowdown -= 0.2f;
            }
        }
        player.addRadiation(0.00000006d * 1 * slowdown as double, true);
    }
};
active_sourceTrait.register();
val active_source2Trait = ArmorTraitBuilder.create("active_source2");
active_source2Trait.color = Color.fromHex("ffffff").getIntColor(); 
active_source2Trait.localizedName = game.localize("greedycraft.tconstruct.armor_trait.active_source2Trait.name");
active_source2Trait.localizedDescription = game.localize("greedycraft.tconstruct.armor_trait.active_sourceTrait.desc");
active_source2Trait.onAbility = function(trait, level, world, player) {
    if (!isNull(player)) {
        var slowdown as float = 1.0f;
        for armor in player.armorInventory {
            if (CotTicTraitLib.hasTicTrait(armor, "slowdown_armor")) {
                slowdown -= 0.2f;
            }
        }
        player.addRadiation(0.00000006d * 20 * slowdown as double, true);
    }
};
active_source2Trait.register();
val active_source3Trait = ArmorTraitBuilder.create("active_source3");
active_source3Trait.color = Color.fromHex("ffffff").getIntColor(); 
active_source3Trait.localizedName = game.localize("greedycraft.tconstruct.armor_trait.active_source3Trait.name");
active_source3Trait.localizedDescription = game.localize("greedycraft.tconstruct.armor_trait.active_sourceTrait.desc");
active_source3Trait.onAbility = function(trait, level, world, player) {
    if (!isNull(player)) {
        var slowdown as float = 1.0f;
        for armor in player.armorInventory {
            if (CotTicTraitLib.hasTicTrait(armor, "slowdown_armor")) {
                slowdown -= 0.2f;
            }
        }
        player.addRadiation(0.00000006d * 400 * slowdown as double, true);
    }
};
active_source3Trait.register();
val active_source4Trait = ArmorTraitBuilder.create("active_source4");
active_source4Trait.color = Color.fromHex("ffffff").getIntColor(); 
active_source4Trait.localizedName = game.localize("greedycraft.tconstruct.armor_trait.active_source4Trait.name");
active_source4Trait.localizedDescription = game.localize("greedycraft.tconstruct.armor_trait.active_sourceTrait.desc");
active_source4Trait.onAbility = function(trait, level, world, player) {
    if (!isNull(player)) {
        var slowdown as float = 1.0f;
        for armor in player.armorInventory {
            if (CotTicTraitLib.hasTicTrait(armor, "slowdown_armor")) {
                slowdown -= 0.2f;
            }
        }
        player.addRadiation(0.00000006d * 8000 * slowdown as double, true);
    }
};
active_source4Trait.register();
val active_source5Trait = ArmorTraitBuilder.create("active_source5");
active_source5Trait.color = Color.fromHex("ffffff").getIntColor(); 
active_source5Trait.localizedName = game.localize("greedycraft.tconstruct.armor_trait.active_source5Trait.name");
active_source5Trait.localizedDescription = game.localize("greedycraft.tconstruct.armor_trait.active_sourceTrait.desc");
active_source5Trait.onAbility = function(trait, level, world, player) {
    if (!isNull(player)) {
        var slowdown as float = 1.0f;
        for armor in player.armorInventory {
            if (CotTicTraitLib.hasTicTrait(armor, "slowdown_armor")) {
                slowdown -= 0.2f;
            }
        }
        player.addRadiation(0.00000006d * 160000 * slowdown as double, true);
    }
};
active_source5Trait.register();
val active_source6Trait = ArmorTraitBuilder.create("active_source6");
active_source6Trait.color = Color.fromHex("ffffff").getIntColor(); 
active_source6Trait.localizedName = game.localize("greedycraft.tconstruct.armor_trait.active_source6Trait.name");
active_source6Trait.localizedDescription = game.localize("greedycraft.tconstruct.armor_trait.active_sourceTrait.desc");
active_source6Trait.onAbility = function(trait, level, world, player) {
    if (!isNull(player)) {
        var slowdown as float = 1.0f;
        for armor in player.armorInventory {
            if (CotTicTraitLib.hasTicTrait(armor, "slowdown_armor")) {
                slowdown -= 0.2f;
            }
        }
        player.addRadiation(0.00000006d * 3200000 * slowdown as double, true);
    }
};
active_source6Trait.register();

val changeableTrait = ArmorTraitBuilder.create("changeable");
changeableTrait.color = Color.fromHex("ffeb3b").getIntColor();
changeableTrait.localizedName = game.localize("greedycraft.tconstruct.armor_trait.changeableTrait.name");
changeableTrait.localizedDescription = game.localize("greedycraft.tconstruct.armor_trait.changeableTrait.desc");
changeableTrait.onHurt = function(trait, armor, player, source, damage, newDamage, evt) {
    if (!isNull(player)) {
        return newDamage * (Math.random() + 0.5f);
    }
    return newDamage;
};
changeableTrait.register();

val specific_immunityTrait = ArmorTraitBuilder.create("specific_immunity");
specific_immunityTrait.color = Color.fromHex("ffeb3b").getIntColor();
specific_immunityTrait.localizedName = game.localize("greedycraft.tconstruct.armor_trait.specific_immunityTrait.name");
specific_immunityTrait.localizedDescription = game.localize("greedycraft.tconstruct.armor_trait.specific_immunityTrait.desc");
specific_immunityTrait.onAbility = function(trait, level, world, player) {
    if (!isNull(player)) {
        player.removePotionEffect(<potion:champions:plague>);
        player.removePotionEffect(<potion:abyssalcraft:cplague>);
        player.removePotionEffect(<potion:abyssalcraft:dplague>);
        player.removePotionEffect(<potion:gct_aby:abyssplague>);
    }
};
specific_immunityTrait.register();

val timedefenceTrait = ArmorTraitBuilder.create("time_defence");
timedefenceTrait.color = Color.fromHex("ffeb3b").getIntColor();
timedefenceTrait.localizedName = game.localize("greedycraft.tconstruct.armor_trait.timedefenceTrait.name");
timedefenceTrait.localizedDescription = game.localize("greedycraft.tconstruct.armor_trait.timedefenceTrait.desc");
timedefenceTrait.onHurt = function(trait, armor, player, source, damage, newDamage, evt) {
    if (!isNull(player)) {
        var mtp = (1.2 - (player.world.getWorldTime() % 240000) * 0.001 * 0.003);
        return newDamage * mtp;
    }
    return newDamage;
};
timedefenceTrait.register();

val bellyfulTrait = ArmorTraitBuilder.create("bellyful");
bellyfulTrait.color = Color.fromHex("ffeb3b").getIntColor();
bellyfulTrait.localizedName = game.localize("greedycraft.tconstruct.armor_trait.bellyfulTrait.name");
bellyfulTrait.localizedDescription = game.localize("greedycraft.tconstruct.armor_trait.bellyfulTrait.desc");
bellyfulTrait.onAbility = function(trait, level, world, player) {
    if (!isNull(player)) {
        if (Math.random() < 0.003f) {
            player.addPotionEffect(<potion:minecraft:saturation>.makePotionEffect(40, 0, false, false));
        }
    }
};
bellyfulTrait.register();

val healthshieldTrait = ArmorTraitBuilder.create("health_shield");
healthshieldTrait.color = Color.fromHex("ffffff").getIntColor();
healthshieldTrait.localizedName = game.localize("greedycraft.tconstruct.armor_trait.healthshieldTrait.name");
healthshieldTrait.localizedDescription = game.localize("greedycraft.tconstruct.armor_trait.healthshieldTrait.desc");
healthshieldTrait.onHurt = function(trait, armor, player, source, damage, newDamage, evt) {
    if (!isNull(player)) {
        if (player.soulNetwork.currentEssence >= (damage * 1000)) {
            player.soulNetwork.currentEssence -= (damage * 1000);
            return newDamage * ((Math.random() * 0.3f) + 0.4f);
        } else {
            return newDamage * 1.1f;
        }
    }
    return newDamage;
};
healthshieldTrait.register();

val soul_ascendTrait = ArmorTraitBuilder.create("soul_ascend");
soul_ascendTrait.color = Color.fromHex("ffeb3b").getIntColor();
soul_ascendTrait.localizedName = game.localize("greedycraft.tconstruct.armor_trait.soul_ascendTrait.name");
soul_ascendTrait.localizedDescription = game.localize("greedycraft.tconstruct.armor_trait.soul_ascendTrait.desc");
soul_ascendTrait.onAbility = function(trait, level, world, player) {
    if (!isNull(player)) {
        if (player.isPotionActive(<potion:biomesoplenty:curse>)) {
            player.addPotionEffect(<potion:minecraft:regeneration>.makePotionEffect(100, 2, false, false));
        }
    }
};
soul_ascendTrait.register();

val pyrophoricTrait = ArmorTraitBuilder.create("pyrophoric");
pyrophoricTrait.color = Color.fromHex("00ffcc").getIntColor(); 
pyrophoricTrait.localizedName = game.localize("greedycraft.tconstruct.armor_trait.pyrophoricTrait.name");
pyrophoricTrait.localizedDescription = game.localize("greedycraft.tconstruct.armor_trait.pyrophoricTrait.desc");
pyrophoricTrait.onArmorTick = function(trait, armor, world, player) {
    if(Math.random() < 0.02){
        player.setFire(Math.random()*8+2);
    }
};
pyrophoricTrait.register();

val stripeTrait = ArmorTraitBuilder.create("stripe");
stripeTrait.color = Color.fromHex("00ffcc").getIntColor(); 
stripeTrait.localizedName = game.localize("greedycraft.tconstruct.armor_trait.stripeTrait.name");
stripeTrait.localizedDescription = game.localize("greedycraft.tconstruct.armor_trait.stripeTrait.desc");
stripeTrait.onHurt = function(trait, armor, player, source, damage, newDamage, evt) {
    player.addPotionEffect(<potion:minecraft:instant_damage>.makePotionEffect(1, 1, false, false));
    return newDamage * 0.5f;
};
stripeTrait.register();

val heaven_guardTrait = ArmorTraitBuilder.create("heaven_guard");
heaven_guardTrait.color = Color.fromHex("00ffcc").getIntColor(); 
heaven_guardTrait.localizedName = game.localize("greedycraft.tconstruct.armor_trait.heaven_guardTrait.name");
heaven_guardTrait.localizedDescription = game.localize("greedycraft.tconstruct.armor_trait.heaven_guardTrait.desc");
heaven_guardTrait.onAbility = function(trait, level, world, player) {
    if (!isNull(player)) {
        player.addPotionEffect(<potion:minecraft:regeneration>.makePotionEffect(25, 1, false, false));
        player.addPotionEffect(<potion:minecraft:health_boost>.makePotionEffect(25, 1, false, false));
        player.addPotionEffect(<potion:minecraft:resistance>.makePotionEffect(25, 1, false, false));
    }
};
heaven_guardTrait.register();

val give_spirit_backTrait = ArmorTraitBuilder.create("give_spirit_back");
give_spirit_backTrait.color = Color.fromHex("00ffcc").getIntColor(); 
give_spirit_backTrait.localizedName = game.localize("greedycraft.tconstruct.armor_trait.give_spirit_backTrait.name");
give_spirit_backTrait.localizedDescription = game.localize("greedycraft.tconstruct.armor_trait.give_spirit_backTrait.desc");
give_spirit_backTrait.onDamaged = function(trait, armor, player, source, damage, newDamage, evt) {
    if(Math.random() < 0.02){
        mods.contenttweaker.Commands.call("summon twilightforest:wraith ~ ~1 ~ {CanPickUpLoot:1b}", player, player.world, false, true);
        mods.contenttweaker.Commands.call("summon twilightforest:wraith ~ ~1 ~ {CanPickUpLoot:1b}", player, player.world, false, true);
        return newDamage * 0.2f; 
    }
    return newDamage;
};
give_spirit_backTrait.register();

val ghostmovingTrait = ArmorTraitBuilder.create("ghostmoving");
ghostmovingTrait.color = Color.fromHex("00ffcc").getIntColor(); 
ghostmovingTrait.localizedName = game.localize("greedycraft.tconstruct.armor_trait.ghostmovingTrait.name");
ghostmovingTrait.localizedDescription = game.localize("greedycraft.tconstruct.armor_trait.ghostmovingTrait.desc");
ghostmovingTrait.onAbility = function(trait, level, world, player) {
    if (!isNull(player)) {
        player.addPotionEffect(<potion:minecraft:speed>.makePotionEffect(25, 0, false, false));
    }
};
ghostmovingTrait.onDamaged = function(trait, armor, player, source, damage, newDamage, evt) {
    if(Math.random() < 0.03){
        evt.cancel();
        return 0.0f; 
    }
    return newDamage;
};
ghostmovingTrait.register();

val cooperationTrait = ArmorTraitBuilder.create("cooperation");
cooperationTrait.color = Color.fromHex("00ffcc").getIntColor(); 
cooperationTrait.localizedName = game.localize("greedycraft.tconstruct.armor_trait.cooperationTrait.name");
cooperationTrait.localizedDescription = game.localize("greedycraft.tconstruct.armor_trait.cooperationTrait.desc");
cooperationTrait.onAbility = function(trait, level, world, player) {
    if (!isNull(player)) {
        player.addPotionEffect(<potion:gct_tcon:cooperation_2>.makePotionEffect(20, 0, false, false));
    }
};
cooperationTrait.onHurt = function(trait, armor, player, source, damage, newDamage, evt) {
    if (!isNull(player)) {
        if (player.isPotionActive(<potion:gct_tcon:cooperation_1>) && player.isPotionActive(<potion:gct_tcon:cooperation_2>)) {
            return newDamage * 0.65f;
        }
        return newDamage;
    }
    return newDamage;
};
cooperationTrait.register();

val tieringTrait = ArmorTraitBuilder.create("tiering");
tieringTrait.color = Color.fromHex("00ffcc").getIntColor(); 
tieringTrait.localizedName = game.localize("greedycraft.tconstruct.armor_trait.tieringTrait.name");
tieringTrait.localizedDescription = game.localize("greedycraft.tconstruct.armor_trait.tieringTrait.desc");
tieringTrait.onAbility = function(trait, level, world, player) {
    player.addPotionEffect(<potion:minecraft:weakness>.makePotionEffect(100, 0, false, false));
};
tieringTrait.onDamaged = function(trait, armor, player, source, damage, newDamage, evt) {
    return newDamage *0.9f;
};
tieringTrait.register();

val climbTrait = ArmorTraitBuilder.create("climb");
climbTrait.color = Color.fromHex("00ffcc").getIntColor(); 
climbTrait.localizedName = game.localize("greedycraft.tconstruct.armor_trait.climbTrait.name");
climbTrait.localizedDescription = game.localize("greedycraft.tconstruct.armor_trait.climbTrait.desc");
climbTrait.onAbility = function(trait, level, world, player) {
    if (!isNull(player)) {
        player.addPotionEffect(<potion:potioncore:climb>.makePotionEffect(25, 0, false, false));
    }
};
climbTrait.register();

val light_markTrait = ArmorTraitBuilder.create("light_mark");
light_markTrait.color = Color.fromHex("00ffcc").getIntColor(); 
light_markTrait.localizedName = game.localize("greedycraft.tconstruct.armor_trait.light_markTrait.name");
light_markTrait.localizedDescription = game.localize("greedycraft.tconstruct.armor_trait.light_markTrait.desc");
light_markTrait.onAbility = function(trait, level, world, player) {
    if (!isNull(player)) {
        player.addPotionEffect(<potion:minecraft:glowing>.makePotionEffect(25, 0, false, false));
    }
};
light_markTrait.register();

val rushingTrait = ArmorTraitBuilder.create("rushing");
rushingTrait.color = Color.fromHex("ffeb3b").getIntColor();
rushingTrait.localizedName = game.localize("greedycraft.tconstruct.armor_trait.rushingTrait.name");
rushingTrait.localizedDescription = game.localize("greedycraft.tconstruct.armor_trait.rushingTrait.desc");
rushingTrait.onAbility = function(trait, level, world, player) {
for entity in world.getEntitiesInArea(crafttweaker.util.Position3f.create(((player.x)- 5),((player.y)- 5),((player.z)- 5)),crafttweaker.util.Position3f.create(((player.x)+ 5),((player.y)+ 5),((player.z)+ 5))){
    if(entity instanceof IEntityLivingBase && !entity instanceof IPlayer){
        val en as IEntityLivingBase = entity;
        if(!en.isPotionActive(<potion:minecraft:weakness>)){
        en.addPotionEffect(<potion:minecraft:weakness>.makePotionEffect(60, 4, false, false));
        }
        }
    }
};
rushingTrait.register();

val dangerousTrait = ArmorTraitBuilder.create("dangerous");
dangerousTrait.color = Color.fromHex("ffeb3b").getIntColor();
dangerousTrait.localizedName = game.localize("greedycraft.tconstruct.armor_trait.dangerousTrait.name");
dangerousTrait.localizedDescription = game.localize("greedycraft.tconstruct.armor_trait.dangerousTrait.desc");
dangerousTrait.onAbility = function(trait, level, world, player) {
    val x = player.maxHealth * 0.25f;
    val y = player.maxHealth * 0.1f;
    if(player.health < x && player.health > y){
        player.addPotionEffect(<potion:minecraft:resistance>.makePotionEffect(60, 1, false, false));
    }else if(player.health < y){
        player.addPotionEffect(<potion:minecraft:resistance>.makePotionEffect(60, 2, false, false));
    }
};
dangerousTrait.register();

val againstTrait = ArmorTraitBuilder.create("against");
againstTrait.color = Color.fromHex("ffeb3b").getIntColor();
againstTrait.localizedName = game.localize("greedycraft.tconstruct.armor_trait.againstTrait.name");
againstTrait.localizedDescription = game.localize("greedycraft.tconstruct.armor_trait.againstTrait.desc");
againstTrait.onDamaged = function(trait, armor, player, source, damage, newDamage, evt) {
    val x = player.health * 0.4f;
    if(damage > x){
        player.addPotionEffect(<potion:minecraft:resistance>.makePotionEffect(80, 2, false, false));
        player.addPotionEffect(<potion:minecraft:strength>.makePotionEffect(80, 5, false, false));
    }
    return newDamage;
};
againstTrait.register();

val meteor_fallTrait = ArmorTraitBuilder.create("meteor_fall");
meteor_fallTrait.color = Color.fromHex("ffeb3b").getIntColor();
meteor_fallTrait.localizedName = game.localize("greedycraft.tconstruct.armor_trait.meteor_fallTrait.name");
meteor_fallTrait.localizedDescription = game.localize("greedycraft.tconstruct.armor_trait.meteor_fallTrait.desc");
meteor_fallTrait.onDamaged = function(trait, armor, player, source, damage, newDamage, evt) {
    if(Math.random() < 0.04){
        player.give(itemUtils.getItem("additions:ignite_ingot"));
    }
    return newDamage;
};
meteor_fallTrait.register();

val antiwaterTrait = ArmorTraitBuilder.create("antiwater");
antiwaterTrait.color = Color.fromHex("ffeb3b").getIntColor();
antiwaterTrait.localizedName = game.localize("greedycraft.tconstruct.armor_trait.antiwaterTrait.name");
antiwaterTrait.localizedDescription = game.localize("greedycraft.tconstruct.armor_trait.antiwaterTrait.desc");
antiwaterTrait.onAbility = function(trait, level, world, player) {
    if(player.isInWater){
        player.addPotionEffect(<potion:abyssalcraft:antimatter>.makePotionEffect(80, 0, false, false));
    }
};
antiwaterTrait.register();

val promiseTrait = ArmorTraitBuilder.create("promise");
promiseTrait.color = Color.fromHex("ffeb3b").getIntColor();
promiseTrait.localizedName = game.localize("greedycraft.tconstruct.armor_trait.promiseTrait.name");
promiseTrait.localizedDescription = game.localize("greedycraft.tconstruct.armor_trait.promiseTrait.desc");
promiseTrait.onAbility = function(trait, level, world, player) {
    if (!(player.isPotionActive(<potion:minecraft:absorption>))) {
        player.addPotionEffect(<potion:minecraft:absorption>.makePotionEffect(200, 9, false, false));
    }
};
promiseTrait.register();

val inserveTrait = ArmorTraitBuilder.create("inserve");
inserveTrait.color = Color.fromHex("ffeb3b").getIntColor();
inserveTrait.localizedName = game.localize("greedycraft.tconstruct.armor_trait.inserveTrait.name");
inserveTrait.localizedDescription = game.localize("greedycraft.tconstruct.armor_trait.inserveTrait.desc");
inserveTrait.onAbility = function(trait, level, world, player) {
    if(Math.random() < 0.0001){
        player.addPotionEffect(<potion:potioncore:invert>.makePotionEffect(20, 0, false, false));
    }
};
inserveTrait.register();

val strongdefenseTrait = ArmorTraitBuilder.create("strongdefense");
strongdefenseTrait.color = Color.fromHex("ffeb3b").getIntColor();
strongdefenseTrait.localizedName = game.localize("greedycraft.tconstruct.armor_trait.strongdefenseTrait.name");
strongdefenseTrait.localizedDescription = game.localize("greedycraft.tconstruct.armor_trait.strongdefenseTrait.desc");
strongdefenseTrait.onAbility = function(trait, level, world, player) {
        player.addPotionEffect(<potion:potioncore:iron_skin>.makePotionEffect(80, 3, false, false));
};
strongdefenseTrait.register();

val magic_fusionTrait = ArmorTraitBuilder.create("magic_fusion");
magic_fusionTrait.color = Color.fromHex("ffeb3b").getIntColor();
magic_fusionTrait.localizedName = game.localize("greedycraft.tconstruct.armor_trait.magic_fusionTrait.name");
magic_fusionTrait.localizedDescription = game.localize("greedycraft.tconstruct.armor_trait.magic_fusionTrait.desc");
magic_fusionTrait.onAbility = function(trait, level, world, player) {
        player.addPotionEffect(<potion:potioncore:magic_focus>.makePotionEffect(80, 0, false, false));
};
magic_fusionTrait.register();

val helpful_radiationTrait = ArmorTraitBuilder.create("helpful_radiation");
helpful_radiationTrait.color = Color.fromHex("ffeb3b").getIntColor();
helpful_radiationTrait.localizedName = game.localize("greedycraft.tconstruct.armor_trait.helpful_radiationTrait.name");
helpful_radiationTrait.localizedDescription = game.localize("greedycraft.tconstruct.armor_trait.helpful_radiationTrait.desc");
helpful_radiationTrait.onDamaged = function(trait, armor, player, source, damage, newDamage, evt) {
    if(Math.random() < 0.6){
        if(Math.random() < 0.20){
        player.addPotionEffect(<potion:minecraft:resistance>.makePotionEffect(100, 1, false, false));
        }else if(Math.random() < 0.20){
        player.addPotionEffect(<potion:minecraft:regeneration>.makePotionEffect(100, 1, false, false));
        }else if(Math.random() < 0.20){
        player.addPotionEffect(<potion:minecraft:absorption>.makePotionEffect(100, 3, false, false));
        }else if(Math.random() < 0.20){
        player.addPotionEffect(<potion:minecraft:jump_boost>.makePotionEffect(100, 2, false, false));
        }else {
        player.addPotionEffect(<potion:minecraft:speed>.makePotionEffect(100, 2, false, false));
        }
    }
    return newDamage;
};
helpful_radiationTrait.register();

val true_limitingTrait = ArmorTraitBuilder.create("true_limiting");
true_limitingTrait.color = Color.fromHex("00ffcc").getIntColor(); 
true_limitingTrait.localizedName = game.localize("greedycraft.tconstruct.armor_trait.true_limitingTrait.name");
true_limitingTrait.localizedDescription = game.localize("greedycraft.tconstruct.armor_trait.true_limitingTrait.desc");
true_limitingTrait.onDamaged = function(trait, armor, player, source, damage, newDamage, evt) {
    val x = player.health * 0.3f;
    if(damage > x){
        player.health -= x;
        evt.cancel();
        return 0.0f;
    }
    return newDamage;
};
true_limitingTrait.register();

val barrierTrait = ArmorTraitBuilder.create("barrier");
barrierTrait.color = Color.fromHex("ffeb3b").getIntColor();
barrierTrait.localizedName = game.localize("greedycraft.tconstruct.armor_trait.barrierTrait.name");
barrierTrait.localizedDescription = game.localize("greedycraft.tconstruct.armor_trait.barrierTrait.desc");
barrierTrait.onAbility = function(trait, level, world, player) {
    if (Math.random() < 0.005) {
        player.addPotionEffect(<potion:potioncore:burst>.makePotionEffect(1, 0, false, false));
    }
};
barrierTrait.register();

val thadTrait = ArmorTraitBuilder.create("tinkers_heartwork");
thadTrait.color = Color.fromHex("ffeb3b").getIntColor();
thadTrait.localizedName = game.localize("greedycraft.tconstruct.armor_trait.thadTrait.name");
thadTrait.localizedDescription = game.localize("greedycraft.tconstruct.armor_trait.thadTrait.desc");
thadTrait.onDamaged = function(trait, armor, player, source, damage, newDamage, evt) {
    if (!isNull(player)) {
        var multiplier as int = CotTicTraitLib.getTicTrait(armor).length - 2 as int;
        return newDamage / (pow(1.05, multiplier) - 1) as float;
    }
    return newDamage;
};
thadTrait.register();

val counterattackTrait = ArmorTraitBuilder.create("counterattack");
counterattackTrait.color = Color.fromHex("ffeb3b").getIntColor();
counterattackTrait.localizedName = game.localize("greedycraft.tconstruct.armor_trait.counterattackTrait.name");
counterattackTrait.localizedDescription = game.localize("greedycraft.tconstruct.armor_trait.counterattackTrait.desc");
counterattackTrait.onHurt = function(trait, armor, player, source, damage, newDamage, evt) {
    if (!isNull(player) && !isNull(source.getTrueSource()) && source.getTrueSource() instanceof IEntityLivingBase) {
        var attacker as IEntityLivingBase = source.getTrueSource();
        if (Math.random() <= 0.2) {
            player.health += (attacker.health / 100.0) as float;
            attacker.health += player.health;
        }
        return newDamage;
    }
    return newDamage;
};
counterattackTrait.register();

val falldownTrait = ArmorTraitBuilder.create("falldown");
falldownTrait.color = Color.fromHex("ffeb3b").getIntColor();
falldownTrait.localizedName = game.localize("greedycraft.tconstruct.armor_trait.falldownTrait.name");
falldownTrait.localizedDescription = game.localize("greedycraft.tconstruct.armor_trait.falldownTrait.desc");
falldownTrait.onHurt = function(trait, armor, player, source, damage, newDamage, evt) {
    if (!isNull(player) && source.getDamageType() == "FALL") {
        for entity in player.world.getEntitiesInArea(crafttweaker.util.Position3f.create(((player.x)- 4),((player.y)- 4),((player.z)- 4)),crafttweaker.util.Position3f.create(((player.x)+ 4),((player.y)+ 4),((player.z)+ 4))){
            if (entity instanceof IEntityLivingBase && !entity instanceof IPlayer) {
                val en as IEntityLivingBase = entity;
                en.health -= damage * 2.0f;
            }
        }
        return 0.0f;
    }
    return newDamage;
};
falldownTrait.register();

val penetrationTrait = ArmorTraitBuilder.create("penetration");
penetrationTrait.color = Color.fromHex("ffeb3b").getIntColor();
penetrationTrait.localizedName = game.localize("greedycraft.tconstruct.armor_trait.penetrationTrait.name");
penetrationTrait.localizedDescription = game.localize("greedycraft.tconstruct.armor_trait.penetrationTrait.desc");
penetrationTrait.onHurt = function(trait, armor, player, source, damage, newDamage, evt) {
    if (!isNull(player)) {
        for i in 0 to 9 {
            if (!isNull(player.getHotbarStack(i))) {
                if (player.getHotbarStack(i).ores has <ore:blockAluminium>) {
                    player.getHotbarStack(i).mutable().shrink(1);
                    return newDamage * 0.6f;
                    break;
                }
            }
        }
        return newDamage;
    }
    return newDamage;
};
penetrationTrait.register();

val sunnyTrait = ArmorTraitBuilder.create("sunny");
sunnyTrait.color = Color.fromHex("ffeb3b").getIntColor();
sunnyTrait.localizedName = game.localize("greedycraft.tconstruct.armor_trait.sunnyTrait.name");
sunnyTrait.localizedDescription = game.localize("greedycraft.tconstruct.armor_trait.sunnyTrait.desc");
sunnyTrait.onHurt = function(trait, armor, player, source, damage, newDamage, evt) {
    if (!isNull(player)) {
        if (Math.random() <= 0.1) {
            if (player.world.raining) {
                mods.contenttweaker.Commands.call("weather clear",player,player.world,false,true);
            }
            return newDamage;
        }
        return newDamage;
    }
    return newDamage;
};
sunnyTrait.register();

val aura_infusedTrait = ArmorTraitBuilder.create("aura_infused");
aura_infusedTrait.color = Color.fromHex("ffeb3b").getIntColor();
aura_infusedTrait.localizedName = game.localize("greedycraft.tconstruct.armor_trait.aura_infusedTrait.name");
aura_infusedTrait.localizedDescription = game.localize("greedycraft.tconstruct.armor_trait.aura_infusedTrait.desc");
aura_infusedTrait.onArmorTick = function(trait, armor, world, player) {
        if (!isNull(armor.tag.aura)) {
            var auraBefore as int = armor.tag.aura.asInt();
            if (!(player.isPotionActive(<potion:naturesaura:breathless>))) {
                if (auraBefore <= 250000) {
                    mods.contenttweaker.Commands.call("naaura drain 1000", player, player.world, false, true);
                    armor.mutable().updateTag({aura : (auraBefore + 1000) as int});
                }
            }
            if (auraBefore >= 10000) {
                if (armor.damage != 0) {
                    armor.mutable().updateTag({aura : (auraBefore - 10000) as int});
                    ToolHelper.healTool(armor.mutable().native, 1, player.native);
                }
            }
        } else {
            armor.mutable().updateTag({aura : 0 as int});
        }
};
aura_infusedTrait.register();

val full_of_auraTrait = ArmorTraitBuilder.create("full_of_aura");
full_of_auraTrait.color = Color.fromHex("ffeb3b").getIntColor();
full_of_auraTrait.localizedName = game.localize("greedycraft.tconstruct.armor_trait.full_of_auraTrait.name");
full_of_auraTrait.localizedDescription = game.localize("greedycraft.tconstruct.armor_trait.full_of_auraTrait.desc");
full_of_auraTrait.onHurt = function(trait, armor, player, source, damage, newDamage, evt) {
    if(!isNull(player)) {
        var mtpstr = (Math.random() * 4500 + 500) as string;
        mods.contenttweaker.Commands.call("naaura store " + mtpstr, player, player.world, false, true);
    }
    return newDamage;
};
full_of_auraTrait.register();

val aura_effectTrait = ArmorTraitBuilder.create("aura_effect");
aura_effectTrait.color = Color.fromHex("ffeb3b").getIntColor();
aura_effectTrait.localizedName = game.localize("greedycraft.tconstruct.armor_trait.aura_effectTrait.name");
aura_effectTrait.localizedDescription = game.localize("greedycraft.tconstruct.armor_trait.aura_effectTrait.desc");
aura_effectTrait.onHurt = function(trait, armor, player, source, damage, newDamage, evt) {
    if (!isNull(player)) {
        if (player.isPotionActive(<potion:naturesaura:breathless>)) {
            return newDamage * 0.8f;
        }
    }
    return newDamage;
};
aura_effectTrait.register();

val correctingTrait = ArmorTraitBuilder.create("correcting");
correctingTrait.color = Color.fromHex("ffeb3b").getIntColor();
correctingTrait.localizedName = game.localize("greedycraft.tconstruct.armor_trait.correctingTrait.name");
correctingTrait.localizedDescription = game.localize("greedycraft.tconstruct.armor_trait.correctingTrait.desc");
correctingTrait.onHurt = function(trait, armor, player, source, damage, newDamage, evt) {
    if (!isNull(player)) {
        if (Math.random() < 0.08) {
            player.addPotionEffect(<potion:gct_mobs:correcting>.makePotionEffect(60, 0, false, false));
        }
        if (player.isPotionActive(<potion:gct_mobs:correcting>)) {
            return 0.0f;
        }
    }
    return newDamage;
};
correctingTrait.register();

val air_protectionTrait = ArmorTraitBuilder.create("air_protection");
air_protectionTrait.color = Color.fromHex("ffeb3b").getIntColor();
air_protectionTrait.localizedName = game.localize("greedycraft.tconstruct.armor_trait.air_protectionTrait.name");
air_protectionTrait.localizedDescription = game.localize("greedycraft.tconstruct.armor_trait.air_protectionTrait.desc");
air_protectionTrait.onHurt = function(trait, armor, player, source, damage, newDamage, evt) {
    if (!isNull(player) && !isNull(source.getTrueSource()) && source.getTrueSource() instanceof IEntityLivingBase) {
        var attacker as IEntityLivingBase = source.getTrueSource();
        if (attacker.y > player.y) {
            var mtp as float = 0.02f * (attacker.y - player.y);
            if (mtp >= 0.95f) {
                mtp = 0.95f;
            }
            return newDamage * (1.0f - mtp);
        }        
    }
    return newDamage;
};
air_protectionTrait.register();

val asleepTrait = ArmorTraitBuilder.create("asleep");
asleepTrait.color = 0xffaadd;
asleepTrait.localizedName = game.localize("greedycraft.tconstruct.armor_trait.asleepTrait.name");
asleepTrait.localizedDescription = game.localize("greedycraft.tconstruct.armor_trait.asleepTrait.desc");
asleepTrait.onHurt = function(trait, armor, player, source, damage, newDamage, evt){
    if (isNull(source.trueSource)) return newDamage;
    if (source.trueSource.isBoss){
        return (newDamage * 0.6f) as float;
    }
    return newDamage;
};
asleepTrait.register();

val endershellTrait = ArmorTraitBuilder.create("ender_shell");
endershellTrait.color = Color.fromHex("ffffff").getIntColor();
endershellTrait.localizedName = game.localize("greedycraft.tconstruct.armor_trait.endershellTrait.name");
endershellTrait.localizedDescription = game.localize("greedycraft.tconstruct.armor_trait.endershellTrait.desc");
endershellTrait.onHurt = function(trait, armor, player, source, damage, newDamage, evt) {
    if (!isNull(player) && !isNull(source.getTrueSource()) && source.getTrueSource() instanceof IEntityLivingBase) {
        var attacker as IEntityLivingBase = source.getTrueSource();
        if ((attacker.definition.name has "ender")||(attacker.definition.name has "Ender")) {
            return newDamage * 0.2f;
        }
    }
    return newDamage;
};
endershellTrait.register();

val windyTrait = ArmorTraitBuilder.create("windy");
windyTrait.color = Color.fromHex("ffffff").getIntColor();
windyTrait.localizedName = game.localize("greedycraft.tconstruct.armor_trait.windyTrait.name");
windyTrait.localizedDescription = game.localize("greedycraft.tconstruct.armor_trait.windyTrait.desc");
windyTrait.onArmorTick = function(trait, armor, world, player) {
        if (player.isSprinting) {
            if (player.isPotionActive(<potion:minecraft:speed>)) {
                if (Math.random() < (1.0f / pow(2, player.getActivePotionEffect(<potion:minecraft:speed>).amplifier)) as float) {
                    player.addPotionEffect(<potion:minecraft:speed>.makePotionEffect(50, player.getActivePotionEffect(<potion:minecraft:speed>).amplifier + 1 as int, false, false));
                }
            } else {
                player.addPotionEffect(<potion:minecraft:speed>.makePotionEffect(50, 0, false, false));
            }
        }
};
windyTrait.register();

val pe_infusionTrait = ArmorTraitBuilder.create("pe_infusion");
pe_infusionTrait.color = Color.fromHex("ffffff").getIntColor();
pe_infusionTrait.localizedName = game.localize("greedycraft.tconstruct.armor_trait.pe_infusionTrait.name");
pe_infusionTrait.localizedDescription = game.localize("greedycraft.tconstruct.armor_trait.pe_infusionTrait.desc");
pe_infusionTrait.onArmorTick = function(trait, armor, world, player) {
        var abyss as int[] = [50,51,52,53,54,55];
        if (abyss has world.getDimension() as int) {
            if (isNull(armor.tag.peinfuse)) {
                armor.mutable().updateTag({peinfuse : 1 as int});
            } else {
                armor.mutable().updateTag({peinfuse : armor.tag.peinfuse + 1 as int});
            }
            if (!isNull(armor.tag.peinfuse)) {
                if (armor.tag.peinfuse >= 10000) {
                    armor.mutable().updateTag({peinfuse : 0 as int});
                    player.give(itemUtils.getItem("additions:greedycraft-pe_ingot"));
                }
            }
        }
};
pe_infusionTrait.register();

val floatingTrait = ArmorTraitBuilder.create("floating");
floatingTrait.color = Color.fromHex("ffffff").getIntColor();
floatingTrait.localizedName = game.localize("greedycraft.tconstruct.armor_trait.floatingTrait.name");
floatingTrait.localizedDescription = game.localize("greedycraft.tconstruct.armor_trait.floatingTrait.desc");
floatingTrait.onArmorTick = function(trait, armor, world, player) {
        if (player.isSneaking) {
            player.addPotionEffect(<potion:minecraft:levitation>.makePotionEffect(10, 2, false, false));
        }
};
floatingTrait.register();

val antilevitationTrait = ArmorTraitBuilder.create("antilevitation");
antilevitationTrait.color = Color.fromHex("ffffff").getIntColor();
antilevitationTrait.localizedName = game.localize("greedycraft.tconstruct.armor_trait.antilevitationTrait.name");
antilevitationTrait.localizedDescription = game.localize("greedycraft.tconstruct.armor_trait.antilevitationTrait.desc");
antilevitationTrait.onAbility = function(trait, level, world, player) {
    if (!isNull(player)) {
        if (player.isPotionActive(<potion:minecraft:levitation>)) {
            player.removePotionEffect(<potion:minecraft:levitation>);
        }
    }
};
antilevitationTrait.register();

val power_decreaseTrait = ArmorTraitBuilder.create("power_decrease");
power_decreaseTrait.color = Color.fromHex("ffffff").getIntColor();
power_decreaseTrait.localizedName = game.localize("greedycraft.tconstruct.armor_trait.power_decreaseTrait.name");
power_decreaseTrait.localizedDescription = game.localize("greedycraft.tconstruct.armor_trait.power_decreaseTrait.desc");
power_decreaseTrait.onHurt = function(trait, armor, player, source, damage, newDamage, evt) {
    if (!isNull(player)) {
        mods.contenttweaker.Commands.call("/fill ~2 ~2 ~2 ~-2 ~-2 ~-2 minecraft:sand 0 replace minecraft:gravel", player, player.world, false, true);
        mods.contenttweaker.Commands.call("/fill ~2 ~2 ~2 ~-2 ~-2 ~-2 minecraft:gravel 0 replace minecraft:cobblestone", player, player.world, false, true);
        mods.contenttweaker.Commands.call("/fill ~2 ~2 ~2 ~-2 ~-2 ~-2 minecraft:cobblestone 0 replace minecraft:stone", player, player.world, false, true);
        return newDamage * 0.95f;
    }
    return newDamage;
};
power_decreaseTrait.register();

val comfortTrait = ArmorTraitBuilder.create("comfort");
comfortTrait.color = Color.fromHex("ffffff").getIntColor();
comfortTrait.localizedName = game.localize("greedycraft.tconstruct.armor_trait.comfortTrait.name");
comfortTrait.localizedDescription = game.localize("greedycraft.tconstruct.armor_trait.comfortTrait.desc");
comfortTrait.onHurt = function(trait, armor, player, source, damage, newDamage, evt) {
    if (!isNull(player) && !isNull(source.getTrueSource()) && source.getTrueSource() instanceof IEntityLivingBase) {
        var entity as IEntityLivingBase = source.getTrueSource();
        var id as string = entity.definition.id as string;
        if (isNull(armor.tag.comfort)) {
            armor.mutable().updateTag(
                {
                    comfort : {
                        name : id as string,
                        times : 1 as int
                    }
                }
            );
            return newDamage;
        } else {
            if (id != armor.tag.comfort.name as string) {
                armor.mutable().updateTag(
                    {
                        comfort : {
                            name : id as string,
                            times : 1 as int
                        }
                    }
                );
                return newDamage;
            } else {
                var time as int = armor.tag.comfort.times as int + 1;
                armor.mutable().updateTag(
                    {
                        comfort : {
                            times : time as int
                        }
                    }
                );
                if (time >= 9) {
                    time = 9;
                }
                return newDamage * pow(0.85f as float, time - 1 as float) as float;
            }
        }
    }
    return newDamage;
};
comfortTrait.register();

val soul_callingTrait = ArmorTraitBuilder.create("soul_calling");
soul_callingTrait.color = Color.fromHex("ffffff").getIntColor();
soul_callingTrait.localizedName = game.localize("greedycraft.tconstruct.armor_trait.soul_callingTrait.name");
soul_callingTrait.localizedDescription = game.localize("greedycraft.tconstruct.armor_trait.soul_callingTrait.desc");
soul_callingTrait.onAbility = function(trait, level, world, player) {
    if (!isNull(player)) {
        if (!player.isPotionActive(<potion:gct_tcon:spirit_possession>)) {
            if (Math.random() < 0.01) {
                if (Math.random() < 0.05) {
                    player.addPotionEffect(<potion:gct_tcon:spirit_possession>.makePotionEffect(1, 0, true, false));
                }
            }
        } else {
            player.addPotionEffect(<potion:gct_tcon:spirit_possession>.makePotionEffect(1, 0, true, false));
        }
    }
};
soul_callingTrait.onHurt = function(trait, armor, player, source, damage, newDamage, evt) {
    if (!isNull(player)) {
        if (player.isPotionActive(<potion:gct_tcon:spirit_possession>)) {
            player.removePotionEffect((<potion:gct_tcon:spirit_possession>));
            return newDamage * 0.0f;
        }
    }
    return newDamage;
};
soul_callingTrait.register();

val undefeatableTrait = ArmorTraitBuilder.create("undefeatable");
undefeatableTrait.color = Color.fromHex("ffffff").getIntColor();
undefeatableTrait.localizedName = game.localize("greedycraft.tconstruct.armor_trait.undefeatableTrait.name");
undefeatableTrait.localizedDescription = game.localize("greedycraft.tconstruct.armor_trait.undefeatableTrait.desc");
undefeatableTrait.onHurt = function(trait, armor, player, source, damage, newDamage, evt) {
    if (!isNull(player)) {
        if (!isNull(player.activePotionEffects)) {
            var timer as int = 0;
            for effect in player.activePotionEffects {
                if (effect.potion.badEffect) {
                    timer += 1;
                }
            }
            if (timer >= 8) {
                timer = 8;
            }
            return newDamage * pow(0.8f, timer) as float;
        }
    }
    return newDamage;
};
undefeatableTrait.register();

val oxylessTrait = ArmorTraitBuilder.create("oxyless");
oxylessTrait.color = Color.fromHex("ffffff").getIntColor();
oxylessTrait.localizedName = game.localize("greedycraft.tconstruct.armor_trait.oxylessTrait.name");
oxylessTrait.localizedDescription = game.localize("greedycraft.tconstruct.armor_trait.oxylessTrait.desc");
oxylessTrait.onArmorTick = function(trait, armor, world, player) {
        if (isNull(armor.tag.oxide)) {
            armor.mutable().updateTag(
                {
                    oxide : 0 as int
                }
            );
        } else {
            armor.mutable().updateTag(
                {
                    display : {Lore : ["§f厌氧：氧化§b" + armor.tag.oxide as int as string + "§f层"]}
                }
            );
            if (armor.tag.oxide as int == 0 && Math.random() < 0.001) {
                armor.mutable().updateTag(
                    {
                        oxide : 1 as int
                    }
                );
            } else if (armor.tag.oxide as int >= 1 && Math.random() <= 0.001) {
                if (Math.random() < 0.3) {
                    var level as int = armor.tag.oxide as int + 1;
                    if (level >= 5) {
                        level = 5;
                    }
                    armor.mutable().updateTag(
                        {
                            oxide : level as int
                        }
                    );
                }
            }
        }
};
oxylessTrait.onHurt = function(trait, armor, player, source, damage, newDamage, evt) {
    if (!isNull(player) && !isNull(armor.tag.oxide)) {
        if (armor.tag.oxide as int >= 1 && armor.tag.oxide as int != 5) {
            var level as int = armor.tag.oxide as int;
            armor.mutable().updateTag(
                {
                    oxide : 0 as int
                }
            );
            if ((armor.damage + pow(2, level)) >= armor.maxDamage) {
                ToolHelper.breakTool(armor.mutable().native, player.native);
            } else {
                armor.mutable().attemptDamageItemWithEnergy(pow(2, level) as int, player);
            }            
            return newDamage * (1.0f - (pow(2.15f, level as int) * 0.01f));
        } else if (armor.tag.oxide as int == 5) {
            if (Math.random() < 0.4) {
                ToolHelper.breakTool(armor.mutable().native, player.native);
            } else {
                if ((armor.damage + 32) >= armor.maxDamage) {
                    ToolHelper.breakTool(armor.mutable().native, player.native);
                } else {
                    armor.mutable().attemptDamageItemWithEnergy(32 as int, player);
                }            
            }
            armor.mutable().updateTag(
                {
                    oxide : 0 as int
                }
            );
            return newDamage * 0.25f;
        }
    }
    return newDamage;
};
oxylessTrait.register();

val levitatedTrait = ArmorTraitBuilder.create("levitated");
levitatedTrait.color = Color.fromHex("ffffff").getIntColor();
levitatedTrait.localizedName = game.localize("greedycraft.tconstruct.armor_trait.levitatedTrait.name");
levitatedTrait.localizedDescription = game.localize("greedycraft.tconstruct.armor_trait.levitatedTrait.desc");
levitatedTrait.onAbility = function(trait, level, world, player) {
    if (!isNull(player)) {
        player.addPotionEffect(<potion:minecraft:jump_boost>.makePotionEffect(1, 2, false, false));
        player.addPotionEffect(<potion:potioncore:slow_fall>.makePotionEffect(1, 1, false, false));
    }
};
levitatedTrait.register();

val astralingTrait = ArmorTraitBuilder.create("astraling");
astralingTrait.color = Color.fromHex("3cffff").getIntColor();
astralingTrait.localizedName = game.localize("greedycraft.tconstruct.armor_trait.astralingTrait.name");
astralingTrait.localizedDescription = game.localize("greedycraft.tconstruct.armor_trait.astralingTrait.desc");
astralingTrait.register();

val taintedTrait = ArmorTraitBuilder.create("tainted");
taintedTrait.color = Color.fromHex("ffffff").getIntColor();
taintedTrait.localizedName = game.localize("greedycraft.tconstruct.armor_trait.taintedTrait.name");
taintedTrait.localizedDescription = game.localize("greedycraft.tconstruct.armor_trait.taintedTrait.desc");
taintedTrait.onHurt = function(trait, armor, player, source, damage, newDamage, evt) {
    return newDamage * 0.91f;
};
taintedTrait.register();

val erosionTrait = ArmorTraitBuilder.create("erosion");
erosionTrait.color = Color.fromHex("ffffff").getIntColor();
erosionTrait.localizedName = game.localize("greedycraft.tconstruct.armor_trait.erosionTrait.name");
erosionTrait.localizedDescription = game.localize("greedycraft.tconstruct.armor_trait.erosionTrait.desc");
erosionTrait.onArmorTick = function(trait, armor, world, player) {
        if (Math.random() < 0.01) {
            if (Math.random() < 0.005) {
                if ((armor.damage + 10000) >= armor.maxDamage) {
                    ToolHelper.breakTool(armor.mutable().native, player.native);
                } else {
                    armor.mutable().attemptDamageItemWithEnergy(10000 as int, player);
                }            
            }
            if (Math.random() < 0.003) {
                player.health -= 32.0f;
            }
            if (Math.random() < 0.01) {
                if (Math.random() < 0.333) {
                    player.warpTemporary += 1; 
                } else if (Math.random() < 0.5) {
                    player.warpTemporary += 2;
                } else {
                    player.warpTemporary += 3;
                }
            }
            if (Math.random() < 0.005) {
                player.addPotionEffect(<potion:thebetweenlands:effect_decay>.makePotionEffect(60, 1, false, false));
            }
            if (Math.random() < 0.01) {
                if (Math.random() < 0.1) {
                    player.addPotionEffect(<potion:thaumcraft:fluxtaint>.makePotionEffect(240, 0, false, false));
                }
            }
        }
};
erosionTrait.register();

val nucleus_of_betweenlandTrait = ArmorTraitBuilder.create("nucleus_of_betweenland");
nucleus_of_betweenlandTrait.color = Color.fromHex("ffffff").getIntColor();
nucleus_of_betweenlandTrait.localizedName = game.localize("greedycraft.tconstruct.armor_trait.nucleus_of_betweenlandTrait.name");
nucleus_of_betweenlandTrait.localizedDescription = game.localize("greedycraft.tconstruct.armor_trait.nucleus_of_betweenlandTrait.desc");
nucleus_of_betweenlandTrait.onArmorTick = function(trait, armor, world, player) {
    if (player.getDimension() == 20) {
        player.addPotionEffect(<potion:minecraft:regeneration>.makePotionEffect(1, 0, false, false));
        player.addPotionEffect(<potion:minecraft:resistance>.makePotionEffect(1, 0, false, false));
        player.addPotionEffect(<potion:minecraft:health_boost>.makePotionEffect(20, 7, false, false));
    }
};
nucleus_of_betweenlandTrait.register();

val nucleus_of_betweenland2Trait = ArmorTraitBuilder.create("nucleus_of_betweenland2");
nucleus_of_betweenland2Trait.color = Color.fromHex("ffffff").getIntColor();
nucleus_of_betweenland2Trait.localizedName = game.localize("greedycraft.tconstruct.armor_trait.nucleus_of_betweenland2Trait.name");
nucleus_of_betweenland2Trait.localizedDescription = game.localize("greedycraft.tconstruct.armor_trait.nucleus_of_betweenland2Trait.desc");
nucleus_of_betweenland2Trait.onArmorTick = function(trait, armor, world, player) {
    if (player.getDimension() == 20) {
        player.addPotionEffect(<potion:minecraft:regeneration>.makePotionEffect(1, 0, false, false));
        player.addPotionEffect(<potion:minecraft:resistance>.makePotionEffect(1, 1, false, false));
        player.addPotionEffect(<potion:minecraft:health_boost>.makePotionEffect(20, 9, false, false));
        player.addPotionEffect(<potion:thebetweenlands:effect_ripening>.makePotionEffect(1, 0, false, false));
    }
};
nucleus_of_betweenland2Trait.register();

val ethernalTrait = ArmorTraitBuilder.create("ethernal");
ethernalTrait.color = Color.fromHex("ffffff").getIntColor();
ethernalTrait.localizedName = game.localize("greedycraft.tconstruct.armor_trait.ethernalTrait.name");
ethernalTrait.localizedDescription = game.localize("greedycraft.tconstruct.armor_trait.ethernalTrait.desc");
ethernalTrait.onArmorDamaged = function(trait, armor, damageSource, amount, newAmount, player, index) {
    return 0;
};
ethernalTrait.register();

val fascicledTrait = ArmorTraitBuilder.create("fascicled");
fascicledTrait.color = Color.fromHex("ffffff").getIntColor();
fascicledTrait.localizedName = game.localize("greedycraft.tconstruct.armor_trait.fascicledTrait.name");
fascicledTrait.localizedDescription = game.localize("greedycraft.tconstruct.armor_trait.fascicledTrait.desc");
fascicledTrait.onHurt = function(trait, armor, player, source, damage, newDamage, evt) {
    if (!isNull(player)) {
        if (!isNull(player.currentItem)) {
            if (player.currentItem.definition.id == "additions:greedycraft-valonitedruse") {
                if (isNull(armor.tag.fascicled)) {
                    player.currentItem.mutable().shrink(1);
                    armor.mutable().updateTag({fascicled : 1 as int}); 
                    client.player.sendChat("§f你的护甲已经附着了 1 枚法罗钠晶簇！");  
                } else {
                    var new as int = armor.tag.fascicled as int + 1;
                    var pass as bool = true;
                    if (new > 250) pass = false;
                    if (pass) {
                        player.currentItem.mutable().shrink(1);
                        armor.mutable().updateTag({fascicled : new as int});
                        client.player.sendChat("§f你的护甲已经附着了 " + new as string + " 枚法罗钠晶簇！");
                    } else {
                        client.player.sendChat("§f你的护甲附着的法罗钠晶簇数量已达到上限！");
                    }
                }
            }
        }
    }
    return newDamage;
};
fascicledTrait.onArmorTick = function(trait, armor, world, player) {
        if (!isNull(armor.tag.fascicled)) {
            var level as int = armor.tag.fascicled as int;
            var mtp as float = 0.1f * (level as float);
            CotTicLib.addTicDefense(armor, mtp, "fascicled_armor");
            CotTicLib.addTicToughness(armor, mtp / 10.0f, "fascicled_toughness");
            armor.mutable().updateTag({display : {Lore : ["簇生：" + level as string + "枚"]}});
        }
};
fascicledTrait.register();

val splitTrait = ArmorTraitBuilder.create("split");
splitTrait.color = Color.fromHex("ffffff").getIntColor();
splitTrait.localizedName = game.localize("greedycraft.tconstruct.armor_trait.splitTrait.name");
splitTrait.localizedDescription = game.localize("greedycraft.tconstruct.armor_trait.splitTrait.desc");
splitTrait.onHurt = function(trait, armor, player, source, damage, newDamage, evt) {
    if (!isNull(player)) {
        if (Math.random() < 0.01) {
            if ((armor.damage + (armor.maxDamage * 0.07f)) >= armor.maxDamage) {
                ToolHelper.breakTool(armor.mutable().native, player.native);
            } else {
                armor.mutable().attemptDamageItemWithEnergy((armor.maxDamage * 0.07f) as int, player);
            }            
            return 0.0f;
        }
    }
    return newDamage;
};
splitTrait.register();

val pharmacologyTrait = ArmorTraitBuilder.create("pharmacology");
pharmacologyTrait.color = Color.fromHex("ffffff").getIntColor();
pharmacologyTrait.localizedName = game.localize("greedycraft.tconstruct.armor_trait.pharmacologyTrait.name");
pharmacologyTrait.localizedDescription = game.localize("greedycraft.tconstruct.armor_trait.pharmacologyTrait.desc");
pharmacologyTrait.onAbility = function(trait, level, world, player) {
    if (!isNull(player)) {
        if (Math.random() < 0.001) {
            if (Math.random() as double < (1.0d / 10.0d) as double) {
                player.addPotionEffect(<potion:thebetweenlands:effect_decay>.makePotionEffect(100, 1, false, false));
            } else if (Math.random() as double < (1.0d / 9.0d) as double) {
                player.addPotionEffect(<potion:thebetweenlands:effect_decay>.makePotionEffect(60, 2, false, false));
            } else if (Math.random() as double < (1.0d / 8.0d) as double) {
                player.addPotionEffect(<potion:thebetweenlands:effect_basilisk>.makePotionEffect(40, 0, false, false));
            } else if (Math.random() as double < (1.0d / 7.0d) as double) {
                player.addPotionEffect(<potion:thebetweenlands:effect_slugarm>.makePotionEffect(100, 2, false, false));
            } else if (Math.random() as double < (1.0d / 6.0d) as double) {
                player.addPotionEffect(<potion:minecraft:nausea>.makePotionEffect(160, 2, false, false));
            } else if (Math.random() as double < (1.0d / 5.0d) as double) {
                player.addPotionEffect(<potion:thebetweenlands:effect_feasting>.makePotionEffect(60, 0, false, false));
            } else if (Math.random() as double < (1.0d / 4.0d) as double) {
                player.addPotionEffect(<potion:thebetweenlands:effect_ripening>.makePotionEffect(100, 0, false, false));
            } else if (Math.random() as double < (1.0d / 3.0d) as double) {
                player.addPotionEffect(<potion:thebetweenlands:effect_strength>.makePotionEffect(100, 2, false, false));
            } else if (Math.random() as double < (1.0d / 2.0d) as double) {
                player.addPotionEffect(<potion:thebetweenlands:effect_nimblefeet>.makePotionEffect(60, 1, false, false));
            } else {
                player.addPotionEffect(<potion:thebetweenlands:effect_healing>.makePotionEffect(60, 0, false, false));
            }
        }
    }
};
pharmacologyTrait.register();

val element_forceTrait = ArmorTraitBuilder.create("element_force");
element_forceTrait.color = Color.fromHex("ffffff").getIntColor();
element_forceTrait.localizedName = game.localize("greedycraft.tconstruct.armor_trait.element_forceTrait.name");
element_forceTrait.localizedDescription = game.localize("greedycraft.tconstruct.armor_trait.element_forceTrait.desc");
element_forceTrait.onHurt = function(trait, armor, player, source, damage, newDamage, evt) {
    if (!isNull(player)) {
        if (Math.random() as double < (1.0d / 3.0d) as double) {
            player.world.catenation()
                .run(function(world, context) {
                    CotTicTraitLib.addTicTrait(armor, "moretcon.modredgem", 0xff0000, 1);
                })
                .sleep(20)
                .onStop(function(world, context) {
                    CotTicTraitLib.removeTicTrait(armor, "moretcon.modredgem", 0xff0000, 1);
                })
                .start();
        } else if (Math.random() as double < (1.0d / 2.0d) as double) {
            player.world.catenation()
                .run(function(world, context) {
                    CotTicTraitLib.addTicTrait(armor, "moretcon.modbluegem", 0x0000ff, 1);
                })
                .sleep(20)
                .onStop(function(world, context) {
                    CotTicTraitLib.removeTicTrait(armor, "moretcon.modbluegem", 0x0000ff, 1);
                })
                .start();
        } else {
            player.world.catenation()
                .run(function(world, context) {
                    CotTicTraitLib.addTicTrait(armor, "moretcon.modgreengem", 0x00ff00, 1);
                })
                .sleep(20)
                .onStop(function(world, context) {
                    CotTicTraitLib.removeTicTrait(armor, "moretcon.modgreengem", 0x00ff00, 1);
                })
                .start();
        }
    }
    return newDamage;
};
element_forceTrait.onArmorRemove = function(trait, armor, player, index) {
    if (!isNull(player)) {
        CotTicTraitLib.removeTicTrait(armor, "moretcon.modredgem", 0xff0000, 1);
        CotTicTraitLib.removeTicTrait(armor, "moretcon.modbluegem", 0x0000ff, 1);
        CotTicTraitLib.removeTicTrait(armor, "moretcon.modgreengem", 0x00ff00, 1);
    }
};
element_forceTrait.register();

val stackedTrait = ArmorTraitBuilder.create("stacked");
stackedTrait.color = Color.fromHex("ffffff").getIntColor();
stackedTrait.localizedName = game.localize("greedycraft.tconstruct.armor_trait.stackedTrait.name");
stackedTrait.localizedDescription = game.localize("greedycraft.tconstruct.armor_trait.stackedTrait.desc");
stackedTrait.onHurt = function(trait, armor, player, source, damage, newDamage, evt) {
    if (!isNull(player)) {
        var health as float = player.maxHealth as float;
        return newDamage - health;
    } else {
        return newDamage;
    }
    return newDamage;
};
stackedTrait.register();

val containmentTrait = ArmorTraitBuilder.create("containment");
containmentTrait.color = Color.fromHex("ffffff").getIntColor();
containmentTrait.localizedName = game.localize("greedycraft.tconstruct.armor_trait.containmentTrait.name");
containmentTrait.localizedDescription = game.localize("greedycraft.tconstruct.armor_trait.containmentTrait.desc");
containmentTrait.onHurt = function(trait, armor, player, source, damage, newDamage, evt) {
    if (damage as float >= 3.0f * player.maxHealth as float) {
        if (!isNull(player)) {
            player.addPotionEffect(<potion:minecraft:resistance>.makePotionEffect(160, 3, false, false));
        }
        CotTicLib.setTicBroken(armor, true);
        return 0.0f;
    }
    return newDamage;
};
containmentTrait.register();

val extra_healthTrait = ArmorTraitBuilder.create("extra_health");
extra_healthTrait.color = Color.fromHex("ffffff").getIntColor();
extra_healthTrait.localizedName = game.localize("greedycraft.tconstruct.armor_trait.extra_healthTrait.name");
extra_healthTrait.localizedDescription = game.localize("greedycraft.tconstruct.armor_trait.extra_healthTrait.desc");
extra_healthTrait.onArmorDamaged = function(trait, armor, damageSource, amount, newAmount, player, index) {
    if (Math.random() < 0.01) {
        return -1200 as int;
    } else {
        return newAmount;
    }
    return newAmount;
};
extra_healthTrait.register();

val wolf_roarTrait = ArmorTraitBuilder.create("wolf_roar");
wolf_roarTrait.color = Color.fromHex("ffffff").getIntColor();
wolf_roarTrait.localizedName = game.localize("greedycraft.tconstruct.armor_trait.wolf_roarTrait.name");
wolf_roarTrait.localizedDescription = game.localize("greedycraft.tconstruct.armor_trait.wolf_roarTrait.desc");
wolf_roarTrait.onHurt = function(trait, armor, player, source, damage, newDamage, evt) {
    if (!isNull(player)) {
        var moonphase as int = player.world.getMoonPhase() as int;
        if (moonphase == 1) {
            return newDamage * 0.9f;
        }
    }
    return newDamage;
};
wolf_roarTrait.register();

val land_of_illusionTrait = ArmorTraitBuilder.create("land_of_illusion");
land_of_illusionTrait.color = Color.fromHex("ffffff").getIntColor();
land_of_illusionTrait.localizedName = game.localize("greedycraft.tconstruct.armor_trait.land_of_illusionTrait.name");
land_of_illusionTrait.localizedDescription = game.localize("greedycraft.tconstruct.armor_trait.land_of_illusionTrait.desc");
land_of_illusionTrait.onHurt = function(trait, armor, player, source, damage, newDamage, evt) {
    if (!isNull(player)) {
        if (Math.random() < 0.1) {
            player.world.catenation()
                .run(function(world, context) {
                    player.sendChat("§a[太虚幻境] 隐形！");
                    var mode as int = 0;
                    if (player.creative) mode = 1;
                    var x as float = player.x as float;
                    var y as float = player.y as float;
                    var z as float = player.z as float;
                    armor.mutable().updateTag({loi : {gamemode : mode, dx : x, dy : y, dz : z}});
                })
                .sleep(1)
                .then(function(world, context) {
                    mods.contenttweaker.Commands.call("gamemode 3 @p", player, player.world, false, true);
                })
                .sleep(60)
                .then(function(world, context) {
                    if (!isNull(armor.tag.loi)) {
                        if (armor.tag.loi.gamemode as int == 1) {
                            mods.contenttweaker.Commands.call("gamemode 1 @p", player, player.world, false, true);
                        } else {
                            mods.contenttweaker.Commands.call("gamemode 0 @p", player, player.world, false, true);
                        }
                        player.teleport(crafttweaker.util.Position3f.create(armor.tag.loi.dx as float, armor.tag.loi.dy as float, armor.tag.loi.dz as float));
                    } else {
                        mods.contenttweaker.Commands.call("gamemode 0 @p", player, player.world, false, true);
                    }
                })
                .onStop(function(world, context) {
                    player.sendChat("§a[太虚幻境] 显形！");
                })
                .start();
        }
    }
    return newDamage;
};
land_of_illusionTrait.register();

val parasitismTrait = ArmorTraitBuilder.create("parasitism");
parasitismTrait.color = Color.fromHex("ffffff").getIntColor();
parasitismTrait.localizedName = game.localize("greedycraft.tconstruct.armor_trait.parasitismTrait.name");
parasitismTrait.localizedDescription = game.localize("greedycraft.tconstruct.armor_trait.parasitismTrait.desc");
parasitismTrait.onArmorTick = function(trait, armor, world, player) {
        if (isNull(armor.tag.parasitism)) {
            armor.mutable().updateTag({parasitism : 0 as int});
        }
        if (Math.random() < 0.001) {
            var traits as string[] = CotTicTraitLib.getTicTrait(armor);
            var traitcounts as int = traits.length as int;
            var count as int = Math.floor((Math.random() as float * traitcounts as float)) as int;
            var choice as string = traits[count];
            if ((CotTicTraitLib.getTraitColor(armor, "parasitism_armor") != CotTicTraitLib.getTraitColor(armor, choice)) && (choice != "leveling_armor") && (choice != "parasitism_armor") && (choice != "leveling_durability_armor") && !(choice has "draconic_") && !(choice has "evolved")) {
                var pass as bool = true;
                if (!isNull(armor.tag.parasitismTraits)) {
                    for i in 0 to armor.tag.parasitismTraits.length {
                        if (armor.tag.parasitismTraits[i].name as string == choice) pass = false;
                    }
                }
                if (pass) {
                    CotTicTraitLib.removeTicTrait(armor, choice, CotTicTraitLib.getTraitColor(armor, choice), CotTicTraitLib.getTraitLevel(armor, choice));
                    var time as int = armor.tag.parasitism as int + 1;
                    var data as IData = [{name : choice as string}];
                    armor.mutable().updateTag({parasitism : time, parasitismTraits : armor.tag.parasitismTraits.deepUpdate(data, MERGE)});
                }
            }
        }
        if (!isNull(armor.tag.parasitism)) {
            if (armor.tag.parasitism as int >= 20) {
                armor.mutable().updateTag({parasitism : 20});
            }
            var level as int = armor.tag.parasitism as int;
            armor.mutable().updateTag({display : {Lore : ["§f寄生：" + level as string + "级"]}});
        }
        if (!isNull(armor.tag.parasitismTraits)) {
            for i in 0 to armor.tag.parasitismTraits.length {
                for traitid in CotTicTraitLib.getTicTrait(armor) {
                    if (armor.tag.parasitismTraits[i].name as string == traitid) {
                        CotTicTraitLib.removeTicTrait(armor, traitid, CotTicTraitLib.getTraitColor(armor, traitid), CotTicTraitLib.getTraitLevel(armor, traitid));
                    }
                }
            }
        }
        var materials as IData = armor.tag.TinkerData.Materials;
        if (isNull(armor.tag.parasitismMats)) {
            armor.mutable().updateTag({parasitismMats : materials});
        }
};
parasitismTrait.onHurt = function(trait, armor, player, source, damage, newDamage, evt) {
    if (!isNull(player)) {
        if (!isNull(armor.tag.parasitism)) {
            var level as int = armor.tag.parasitism as int;
            var mtp as float = level as float * 0.045f;
            return newDamage * (1.0f - mtp);
        }
    }
    return newDamage;
};
parasitismTrait.register();

val aethericTrait = ArmorTraitBuilder.create("aetheric");
aethericTrait.color = Color.fromHex("ffffff").getIntColor();
aethericTrait.localizedName = game.localize("greedycraft.tconstruct.armor_trait.aethericTrait.name");
aethericTrait.localizedDescription = game.localize("greedycraft.tconstruct.armor_trait.aethericTrait.desc");
aethericTrait.onHurt = function(trait, armor, player, source, damage, newDamage, evt) {
    if (!isNull(player)) {
        if (player.getDimension() == 173) {
            return newDamage * 0.8f;
        }
    }
    return newDamage;
};
aethericTrait.register();

val turtle_defenseTrait = ArmorTraitBuilder.create("turtle_defense");
turtle_defenseTrait.color = Color.fromHex("ffffff").getIntColor();
turtle_defenseTrait.localizedName = game.localize("greedycraft.tconstruct.armor_trait.turtle_defenseTrait.name");
turtle_defenseTrait.localizedDescription = game.localize("greedycraft.tconstruct.armor_trait.turtle_defenseTrait.desc");
turtle_defenseTrait.onHurt = function(trait, armor, player, source, damage, newDamage, evt) {
    if (!isNull(player) && !isNull(source.getTrueSource())) {
        if (source.getTrueSource() instanceof IEntityLivingBase) {
            var entity as IEntityLivingBase = source.getTrueSource();
            if (entity.isPotionActive(<potion:minecraft:resistance>)) {
                var resistanceLevel as int = entity.getActivePotionEffect(<potion:minecraft:resistance>).amplifier as int + 1;
                var defense as int = entity.totalArmorValue;
                if (player.totalArmorValue < (resistanceLevel * defense)) {
                    return newDamage * 0.75f;
                }
            }
        }
    }
    return newDamage;
};
turtle_defenseTrait.register();

function sendFuneralChat(player as IPlayer) {
    var random as int = Math.ceil(Math.random() as float * 10.0f) as int;
    player.sendChat(game.localize("greedycraft.tconstruct.funeral.text." + random as string)); 
}

val funeral_armorTrait = ArmorTraitBuilder.create("funeral");
funeral_armorTrait.color = Color.fromHex("ffffff").getIntColor();
funeral_armorTrait.localizedName = game.localize("greedycraft.tconstruct.armor_trait.funeral_armorTrait.name");
funeral_armorTrait.localizedDescription = game.localize("greedycraft.tconstruct.armor_trait.funeral_armorTrait.desc");
funeral_armorTrait.onAbility = function(trait, level, world, player) {
    if (Math.random() < 0.01) {
        sendFuneralChat(player);
    }
};
funeral_armorTrait.register();

val restlamentTrait = ArmorTraitBuilder.create("rest_lament");
restlamentTrait.color = Color.fromHex("ffffff").getIntColor();
restlamentTrait.localizedName = game.localize("greedycraft.tconstruct.armor_trait.restlamentTrait.name");
restlamentTrait.localizedDescription = game.localize("greedycraft.tconstruct.armor_trait.restlamentTrait.desc");
restlamentTrait.onHurt = function(trait, armor, player, source, damage, newDamage, evt) {
    if (!isNull(player) && !isNull(source.getTrueSource())) {
        if (source.getTrueSource() instanceof IEntityLivingBase) {
            var entity as IEntityLivingBase = source.getTrueSource();
            if (entity.isUndead) {
                return 0.5f;
            }
        }
    }
    return newDamage;
};
restlamentTrait.register();

val slowdownTrait = ArmorTraitBuilder.create("slowdown");
slowdownTrait.color = Color.fromHex("ffffff").getIntColor();
slowdownTrait.localizedName = game.localize("greedycraft.tconstruct.armor_trait.slowdownTrait.name");
slowdownTrait.localizedDescription = game.localize("greedycraft.tconstruct.armor_trait.slowdownTrait.desc");
slowdownTrait.register();

val antiterrorismTrait = ArmorTraitBuilder.create("antiterrorism");
antiterrorismTrait.color = Color.fromHex("ffffff").getIntColor();
antiterrorismTrait.localizedName = game.localize("greedycraft.tconstruct.armor_trait.antiterrorismTrait.name");
antiterrorismTrait.localizedDescription = game.localize("greedycraft.tconstruct.armor_trait.antiterrorismTrait.desc");
antiterrorismTrait.onHurt = function(trait, armor, player, source, damage, newDamage, evt) {
    if (!isNull(player)) {
        if (source.isExplosion() == true) {
            return newDamage * 0.2f;
        }
    }
    return newDamage;
};
antiterrorismTrait.register();

function getOverslime(tool as IItemStack) as int {
    if (!isNull(tool.tag."moretcon.overslime".remaining)) {
        return tool.tag."moretcon.overslime".remaining as int;
    }
    return 0;
}

val overdominateTrait = ArmorTraitBuilder.create("overdominate");
overdominateTrait.color = Color.fromHex("ffffff").getIntColor();
overdominateTrait.localizedName = game.localize("greedycraft.tconstruct.armor_trait.overdominateTrait.name");
overdominateTrait.localizedDescription = game.localize("greedycraft.tconstruct.armor_trait.overdominateTrait.desc");
overdominateTrait.onHurt = function(trait, armor, player, source, damage, newDamage, evt) {
    if (!isNull(player)) {
        var overslime as int = getOverslime(armor) as int;
        if (overslime <= 10000) {
            var mutiplier as float = (Math.sqrt(overslime) / 250) as float;
            return newDamage * (1.0f - mutiplier) as float;
        } else {
            return newDamage * 0.6f;
        }
    }
    return newDamage;
};
overdominateTrait.register();

//飞龙之怒
//§o根据末影龙动力学研究！\n§r末影龙对自己的伤害减免30%
val wyvernTrait = ArmorTraitBuilder.create("wyvern");
wyvernTrait.color = Color.fromHex("ffffff").getIntColor();
wyvernTrait.localizedName = game.localize("greedycraft.tconstruct.armor_trait.wyvernTrait.name");
wyvernTrait.localizedDescription = game.localize("greedycraft.tconstruct.armor_trait.wyvernTrait.desc");
wyvernTrait.onHurt = function(trait, armor, player, source, damage, newDamage, evt) {
    if (!isNull(player) && !isNull(source.getTrueSource())) {
        if (source.getTrueSource() instanceof IEntityLivingBase) {
            var entity as IEntityLivingBase = source.getTrueSource();
            if !(isNull(entity.definition)) {
                if (entity.definition.id == "minecraft:ender_dragon") {
                    return newDamage * 0.7f;
                }
            }
        }
    }
    return newDamage;
};
wyvernTrait.register();

//堕落之心
//§o根据凋灵生物学研究！\n§r凋灵对自己的伤害减免30%
val fallenTrait = ArmorTraitBuilder.create("fallen");
fallenTrait.color = Color.fromHex("ffffff").getIntColor();
fallenTrait.localizedName = game.localize("greedycraft.tconstruct.armor_trait.fallenTrait.name");
fallenTrait.localizedDescription = game.localize("greedycraft.tconstruct.armor_trait.fallenTrait.desc");
fallenTrait.onHurt = function(trait, armor, player, source, damage, newDamage, evt) {
    if (!isNull(player) && !isNull(source.getTrueSource())) {
        if (source.getTrueSource() instanceof IEntityLivingBase) {
            var entity as IEntityLivingBase = source.getTrueSource();
            if !(isNull(entity.definition)) {
                if (entity.definition.id == "minecraft:wither") {
                    return newDamage * 0.7f;
                }
            }
        }
    }
    return newDamage;
};
fallenTrait.register();

//神龙之啸
//§o根据末影龙动力学研究！2.0？\n§r末影龙对自己的伤害减免50%
val draconicTrait = ArmorTraitBuilder.create("draconic");
draconicTrait.color = Color.fromHex("ffffff").getIntColor();
draconicTrait.localizedName = game.localize("greedycraft.tconstruct.armor_trait.draconicTrait.name");
draconicTrait.localizedDescription = game.localize("greedycraft.tconstruct.armor_trait.draconicTrait.desc");
draconicTrait.onHurt = function(trait, armor, player, source, damage, newDamage, evt) {
    if (!isNull(player) && !isNull(source.getTrueSource())) {
        if (source.getTrueSource() instanceof IEntityLivingBase) {
            var entity as IEntityLivingBase = source.getTrueSource();
            if !(isNull(entity.definition)) {
                if (entity.definition.id == "minecraft:ender_dragon") {
                    return newDamage * 0.5f;
                }
            }
        }
    }
    return newDamage;
};
draconicTrait.register();

//重生之罚
//§o根据凋灵生物学研究！2.0？\n§r凋灵对自己的伤害减免50%
val relifedTrait = ArmorTraitBuilder.create("relifed");
relifedTrait.color = Color.fromHex("ffffff").getIntColor();
relifedTrait.localizedName = game.localize("greedycraft.tconstruct.armor_trait.relifedTrait.name");
relifedTrait.localizedDescription = game.localize("greedycraft.tconstruct.armor_trait.relifedTrait.desc");
relifedTrait.onHurt = function(trait, armor, player, source, damage, newDamage, evt) {
    if (!isNull(player) && !isNull(source.getTrueSource())) {
        if (source.getTrueSource() instanceof IEntityLivingBase) {
            var entity as IEntityLivingBase = source.getTrueSource();
            if !(isNull(entity.definition)) {
                if (entity.definition.id == "minecraft:wither") {
                    return newDamage * 0.5f;
                }
            }
        }
    }
    return newDamage;
};
relifedTrait.register();

//混沌之劫
//§o多了一个，一起算上！\n§r末影龙对自己的伤害减免60%，混沌守卫对自己的伤害减免50%
val chaoticTrait = ArmorTraitBuilder.create("chaotic");
chaoticTrait.color = Color.fromHex("ffffff").getIntColor();
chaoticTrait.localizedName = game.localize("greedycraft.tconstruct.armor_trait.chaoticTrait.name");
chaoticTrait.localizedDescription = game.localize("greedycraft.tconstruct.armor_trait.chaoticTrait.desc");
chaoticTrait.onHurt = function(trait, armor, player, source, damage, newDamage, evt) {
    if (!isNull(player) && !isNull(source.getTrueSource())) {
        if (source.getTrueSource() instanceof IEntityLivingBase) {
            var entity as IEntityLivingBase = source.getTrueSource();
            if !(isNull(entity.definition)) {
                if (entity.definition.id == "minecraft:ender_dragon") {
                    return newDamage * 0.4f;
                }
                if (entity.definition.id has "draconicevolution") {
                    return newDamage * 0.5f;
                }
            }
        }
    }
    return newDamage;
};
chaoticTrait.register();

//风暴之触
//§o多了一个，一起算上！2.0\n§r凋灵对自己的伤害减免60%，凋灵风暴对自己的伤害减免50%
val stormyTrait = ArmorTraitBuilder.create("stormy");
stormyTrait.color = Color.fromHex("ffffff").getIntColor();
stormyTrait.localizedName = game.localize("greedycraft.tconstruct.armor_trait.stormyTrait.name");
stormyTrait.localizedDescription = game.localize("greedycraft.tconstruct.armor_trait.stormyTrait.desc");
stormyTrait.onHurt = function(trait, armor, player, source, damage, newDamage, evt) {
    if (!isNull(player) && !isNull(source.getTrueSource())) {
        if (source.getTrueSource() instanceof IEntityLivingBase) {
            var entity as IEntityLivingBase = source.getTrueSource();
            if !(isNull(entity.definition)) {
                if (entity.definition.id == "minecraft:wither") {
                    return newDamage * 0.4f;
                }
                if (entity.definition.id has "ageofminecraft:witherstorm") {
                    return newDamage * 0.5f;
                }
            }
        }
    }
    return newDamage;
};
stormyTrait.register();

//秩序之灵
//§o很棒，很平衡。\n§rBOSS对自己的伤害减少40%!
val orderedTrait = ArmorTraitBuilder.create("ordered");
orderedTrait.color = Color.fromHex("ffffff").getIntColor();
orderedTrait.localizedName = game.localize("greedycraft.tconstruct.armor_trait.orderedTrait.name");
orderedTrait.localizedDescription = game.localize("greedycraft.tconstruct.armor_trait.orderedTrait.desc");
orderedTrait.onHurt = function(trait, armor, player, source, damage, newDamage, evt) {
    if (!isNull(player) && !isNull(source.getTrueSource())) {
        if (source.getTrueSource() instanceof IEntityLivingBase) {
            var entity as IEntityLivingBase = source.getTrueSource();
            if (entity.isBoss) {
                return newDamage * 0.6f;
            }
        }
    }
    return newDamage;
};
orderedTrait.register();

function getEntityBiome(entity as IEntity) as IBiome {
    return entity.world.getBiome(entity.getPosition3f()) as IBiome;
}

//寰球
//§o探索的时光proooooo\n§r你走过的生物群系将强化你的护甲！
val globiomeTrait = ArmorTraitBuilder.create("globiome");
globiomeTrait.color = Color.fromHex("ffffff").getIntColor();
globiomeTrait.localizedName = game.localize("greedycraft.tconstruct.armor_trait.globiomeTrait.name");
globiomeTrait.localizedDescription = game.localize("greedycraft.tconstruct.armor_trait.globiomeTrait.desc");
globiomeTrait.onArmorTick = function(trait, armor, world, player) {
    if (!isNull(player)) {
        var biome as IBiome = getEntityBiome(player);
        if (isNull(armor.tag.globiome)) {
            var newBiomeSet as IData = [biome.name as string] as IData;
            armor.mutable().updateTag(
                {globiome : newBiomeSet}
            );
        } else {
            var biomesTag as IData = armor.tag.globiome as IData;
            var isNewBiome as bool = true;
            for i in 0 to (biomesTag.length as int) {
                if (biomesTag[i] as string == biome.name) isNewBiome = false;             
            }
            if (isNewBiome) {
                var newBiomeSet as IData = [biome.name as string];
                biomesTag = biomesTag.deepUpdate(newBiomeSet, MERGE);
                armor.mutable().updateTag(
                    {globiome: biomesTag}
                );
            }
        }        
    }
};
globiomeTrait.onHurt = function(trait, armor, player, source, damage, newDamage, evt) {
    if (!isNull(player)) {
        var length as int = (armor.tag.globiome as IData).length as int;
        return newDamage * 2.0f / (2.0f + lognum(10, length)) as float;
    }
    return newDamage;
};
globiomeTrait.register();

var EvolvedTiersMap as int[string] = {
    "wyvern_metal" : 1,
    "fallen_metal" : 1,
    "draconic_metal" : 2,
    "relifed_metal": 2,
    "chaotic_metal" : 3,
    "stormy_metal" : 3,
    "ordered_metal" : 4
};

var EvolvedTiersMap1 as int[string] = {
    "wyvern_armor" : 1,
    "fallen_armor" : 1,
    "draconic_armor" : 2,
    "relifed_armor": 2,
    "chaotic_armor" : 3,
    "stormy_armor" : 3,
    "ordered_armor" : 4
};

//游戏难度
//§o快说：谢谢ED！\n§r护甲耐久损耗将受到游戏难度加成。
val leveling_durabilityTrait = ArmorTraitBuilder.create("leveling_durability");
leveling_durabilityTrait.color = Color.fromHex("ffffff").getIntColor();
leveling_durabilityTrait.localizedName = game.localize("greedycraft.tconstruct.armor_trait.leveling_durabilityTrait.name");
leveling_durabilityTrait.localizedDescription = game.localize("greedycraft.tconstruct.armor_trait.leveling_durabilityTrait.desc");
leveling_durabilityTrait.hidden = true;
leveling_durabilityTrait.onArmorDamaged = function(trait, armor, damageSource, amount, newAmount, player, index) {

    if (!isNull(player)) {

        var extradamage as int = 0;

        if (!isNull(armor.tag.EnergizedEnergy)) {extradamage = armor.tag.EnergizedEnergy.asInt();}
        if (!isNull(armor.tag.FluxedEnergy)) {extradamage = armor.tag.FluxedEnergy.asInt();}
        if (!isNull(armor.tag.EvolvedEnergy)) {extradamage = armor.tag.EvolvedEnergy.asInt();}

        extradamage = (extradamage / 320);
        var difficulty = player.difficulty;

        var needDamage  = 1 * ((Math.sqrt(amount * 3.14) * Math.log10(amount) / Math.log10(2.7) * Math.sqrt(difficulty * 25) * 1.5) as float);

        if (needDamage > (armor.maxDamage - armor.damage + extradamage)) {
            ToolHelper.breakTool(armor.mutable().native, player.native);
        } else {
            armor.mutable().attemptDamageItemWithEnergy(needDamage, player);
        }
    }
    return 0;
};
leveling_durabilityTrait.onArmorTick = function(trait, armor, world, player) {
    if (!isNull(armor.tag.Unbreakable)) {
        if (armor.tag.Unbreakable as byte == 1 as byte) {
            armor.mutable().updateTag({Unbreakable : 0 as byte});
        }
    }
    //匠魂进化等级修正
    /*
    if (!isNull(armor.tag.EvolvedTier)) {
        var materialIdlist as string[] = [];
        if (CotTicLib.getTicMaterial(armor).length != 0) {
            materialIdlist = CotTicLib.getTicMaterial(armor) as string[];
        }
        for materialId in materialIdlist {
            for metal in EvolvedTiersMap {
                if (materialId == metal) {
                    var tier as int = EvolvedTiersMap[metal] as int;
                    if (armor.tag.EvolvedTier as int < tier) {
                        if (tier >= 3) {
                            armor.mutable().updateTag({EvolvedTier: 3, EvolvedTierExtra: tier as int});
                        } else {
                            armor.mutable().updateTag({EvolvedTier: tier as int, EvolvedTierExtra: tier as int});
                        }
                    }
                    break;
                }
            }
        }
    }*/

    if (!isNull(armor.tag.EvolvedTier)) {
        var traitIdlist as string[] = [];
        if (CotTicTraitLib.getTicTrait(armor).length != 0) {
            traitIdlist = CotTicTraitLib.getTicTrait(armor) as string[];
        }
        for trait in EvolvedTiersMap1 {
            for traitId in traitIdlist {
            if (traitId == trait) {
                    var tier as int = EvolvedTiersMap1[trait] as int;
                    if (armor.tag.EvolvedTier as int < tier) {
                        if (tier >= 3) {
                            armor.mutable().updateTag({EvolvedTier: 3, EvolvedTierExtra: tier as int});
                        } else {
                            armor.mutable().updateTag({EvolvedTier: tier as int, EvolvedTierExtra: tier as int});
                        }
                    }
                    break;
                }
            }
        }
    }
};
leveling_durabilityTrait.register();

//破镜重圆
//§o大难不死，必有后福。\n§r受击时，若你还能活上几秒……恢复一些生命。
val recureTrait = ArmorTraitBuilder.create("recure");
recureTrait.color = Color.fromHex("ffffff").getIntColor();
recureTrait.localizedName = game.localize("greedycraft.tconstruct.armor_trait.recureTrait.name");
recureTrait.localizedDescription = game.localize("greedycraft.tconstruct.armor_trait.recureTrait.desc");
recureTrait.onHurt = function(trait, armor, player, source, damage, newDamage, evt) {
    if (!isNull(player)) {
        if (damage >= player.maxHealth * 0.5f) {
            player.world.catenation()
                .run(function(world, context) {})
                .sleep(1)
                .then(function(world, context) {
                    if (player.isAlive()) {
                        armor.mutable().updateTag({recure : true});
                    } else {
                        armor.mutable().updateTag({recure : false});
                    }
                })
                .sleep(4)
                .then(function(world, context) {
                    if (!player.isAlive()) {
                        armor.mutable().updateTag({recure : false});
                    }
                })
                .sleep(5)
                .then(function(world, context) {
                    if (!player.isAlive()) {
                        armor.mutable().updateTag({recure : false});
                    }
                })
                .sleep(5)
                .then(function(world, context) {
                    if (!player.isAlive()) {
                        armor.mutable().updateTag({recure : false});
                    }
                })
                .sleep(4)
                .then(function(world, context) {
                    if (!player.isAlive()) {
                        armor.mutable().updateTag({recure : false});
                    }
                })
                .sleep(1)
                .then(function(world, context) {
                    if (!isNull(armor.tag.recure)) {
                        if (armor.tag.recure as bool == true) {
                            player.heal(damage * 0.2f as float);
                        }
                    }
                })
                .onStop(function(world, context) {})
                .start();
        }
    }
    return newDamage;
};
recureTrait.register();

//暗夜馈赠
//§o古怪……\n§r夜晚对护甲的耐久有点好处。
val arcaneTrait = ArmorTraitBuilder.create("arcane");
arcaneTrait.color = Color.fromHex("ffffff").getIntColor();
arcaneTrait.localizedName = game.localize("greedycraft.tconstruct.armor_trait.arcaneTrait.name");
arcaneTrait.localizedDescription = game.localize("greedycraft.tconstruct.armor_trait.arcaneTrait.desc");
arcaneTrait.onArmorHealed = function(trait, armor, healSource, amount, newAmount, player, index) {
    if (!isNull(player)) {
        if (!player.world.isDayTime()) {
            return newAmount * 2.0f;
        }
    }
    return newAmount;
};
arcaneTrait.register();

//失明
//§o一个漆黑的夜晚，我甚至看不见！\n§r黑暗带给你虚弱及失明。
val blindTrait = ArmorTraitBuilder.create("blind");
blindTrait.color = Color.fromHex("ffffff").getIntColor();
blindTrait.localizedName = game.localize("greedycraft.tconstruct.armor_trait.blindTrait.name");
blindTrait.localizedDescription = game.localize("greedycraft.tconstruct.armor_trait.blindTrait.desc");
blindTrait.onArmorTick = function(trait, armor, world, player) {
    if (!isNull(player)) {
        if (Math.random() < 0.01f) {
            if (Math.random() < 0.1f) {
                if (Math.random() <= 0.5f) {
                    player.addPotionEffect(<potion:minecraft:blindness>.makePotionEffect(100, 0, false, false));
                } else {
                    player.addPotionEffect(<potion:minecraft:weakness>.makePotionEffect(100, 1, false, false));
                }
            }
        }
    }
};
blindTrait.register();

//复刻
//§oCtrl+C！\n§r获得经验时回复耐久。
val copyTrait = ArmorTraitBuilder.create("copy");
copyTrait.color = Color.fromHex("ffffff").getIntColor();
copyTrait.localizedName = game.localize("greedycraft.tconstruct.armor_trait.copyTrait.name");
copyTrait.localizedDescription = game.localize("greedycraft.tconstruct.armor_trait.copyTrait.desc");
copyTrait.onArmorTick = function(trait, armor, world, player) {
    if (isNull(armor.tag.copy)) {
        armor.mutable().updateTag({copy : true});
    }
};
copyTrait.register();

//黑暗
//§o夜晚使你更具战斗力。\n§r在晚上增加护甲值。
val darkTrait = ArmorTraitBuilder.create("dark");
darkTrait.color = Color.fromHex("ffffff").getIntColor();
darkTrait.localizedName = game.localize("greedycraft.tconstruct.armor_trait.darkTrait.name");
darkTrait.localizedDescription = game.localize("greedycraft.tconstruct.armor_trait.darkTrait.desc");
darkTrait.getModifications = function(trait, player, mods, armor, damageSource, damage, index) {
    if (!isNull(player)) {
        if (!player.world.isDayTime()) {
            var modsNew as IArmorModifications = mods;
            modsNew.addArmor(8.0f);
            return modsNew;
        }
    }
    return mods;
};
darkTrait.register();

//吸氢
//§o并非催化剂！\n§r可以作为燃料电池！
val hydrogen_absorbTrait = ArmorTraitBuilder.create("hydrogen_absorb");
hydrogen_absorbTrait.color = Color.fromHex("ffffff").getIntColor();
hydrogen_absorbTrait.localizedName = game.localize("greedycraft.tconstruct.armor_trait.hydrogen_absorbTrait.name");
hydrogen_absorbTrait.localizedDescription = game.localize("greedycraft.tconstruct.armor_trait.hydrogen_absorbTrait.desc");
hydrogen_absorbTrait.onArmorTick = function(trait, armor, world, player) {
    if (Math.random() < 0.01f && !isNull(player)) {
        if (Math.random() < 0.01f) {
            if ((armor.damage + 10) >= armor.maxDamage) {
                ToolHelper.breakTool(armor.mutable().native, player.native);
            } else {
                armor.mutable().attemptDamageItemWithEnergy(10 as int, player);
            }
            var itemId as string = <ore:ingotHydrogen>.firstItem.definition.id as string;
            player.give(itemUtils.getItem(itemId));
        }
    }
};
hydrogen_absorbTrait.register();

//消溶
//§o我不在乎失去的经验。\n§r这下可不是冒险模式了:(
val dissolvingTrait = ArmorTraitBuilder.create("dissolving");
dissolvingTrait.color = Color.fromHex("ffffff").getIntColor();
dissolvingTrait.localizedName = game.localize("greedycraft.tconstruct.armor_trait.dissolvingTrait.name");
dissolvingTrait.localizedDescription = game.localize("greedycraft.tconstruct.armor_trait.dissolvingTrait.desc");
dissolvingTrait.onHurt = function(trait, armor, player, source, damage, newDamage, evt) {
    if (!isNull(player)) {
        player.world.catenation()
            .run(function(world, context) {})
            .sleep(1)
            .then(function(world, context) {
                if (!player.isAlive()) {
                    player.removeXP(player.xp);
                }
            })
            .onStop(function(world, context) {})
            .start();
    }
    return newDamage;
};
dissolvingTrait.register();

//千斤沉重
//§o好沉……快喘不过气来了……\n§r你的跳跃能力下降了，但你变得更坚韧了。
val superheavyTrait = ArmorTraitBuilder.create("superheavy");
superheavyTrait.color = Color.fromHex("ffffff").getIntColor();
superheavyTrait.localizedName = game.localize("greedycraft.tconstruct.armor_trait.superheavyTrait.name");
superheavyTrait.localizedDescription = game.localize("greedycraft.tconstruct.armor_trait.superheavyTrait.desc");
superheavyTrait.getModifications = function(trait, player, mods, armor, damageSource, damage, index) {
    if (!isNull(player)) {
        var modsNew as IArmorModifications = mods;
        modsNew.armorMod = 2.0f;
        return modsNew;
    }
    return mods;
};
superheavyTrait.onArmorTick = function(trait, armor, world, player) {
    if (!isNull(player)) {
        player.addPotionEffect(<potion:potioncore:weight>.makePotionEffect(20, 2, false, false));
    }
};
superheavyTrait.register();

//断层
//§o这不是落井下石！\n§r当你的护甲耐久较低时，你的防御力会更高……但是耐久消耗的也越快。
val sectionalTrait = ArmorTraitBuilder.create("sectional");
sectionalTrait.color = Color.fromHex("ffffff").getIntColor();
sectionalTrait.localizedName = game.localize("greedycraft.tconstruct.armor_trait.sectionalTrait.name");
sectionalTrait.localizedDescription = game.localize("greedycraft.tconstruct.armor_trait.sectionalTrait.desc");
sectionalTrait.onHurt = function(trait, armor, player, source, damage, newDamage, evt) {
    if (!isNull(player)) {
        if (armor.damage >= 0.5f * armor.maxDamage) {
            return newDamage * 0.7f;
        }
    }
    return newDamage;
};
sectionalTrait.onArmorDamaged = function(trait, armor, damageSource, amount, newAmount, player, index) {
    if (!isNull(player)) {
        if (armor.damage >= 0.5f * armor.maxDamage) {
            return newAmount * 2;
        }
    }
    return newAmount;
};
sectionalTrait.register();

//特化
//§o简称：拆东墙补西墙。\n§r削弱其他抗性以增强物理抗性！
val specializationTrait = ArmorTraitBuilder.create("specialization");
specializationTrait.color = Color.fromHex("ffffff").getIntColor();
specializationTrait.localizedName = game.localize("greedycraft.tconstruct.armor_trait.specializationTrait.name");
specializationTrait.localizedDescription = game.localize("greedycraft.tconstruct.armor_trait.specializationTrait.desc");
specializationTrait.onHurt = function(trait, armor, player, source, damage, newDamage, evt) {
    if (!isNull(player)) {
        if (source.damageType == "GENERIC") {
            return newDamage * 0.7f;
        } else {
            return newDamage * 1.5f;
        }
    }
    return newDamage;
};
specializationTrait.register();

//帝皇
//§oI am the king!\n§r增加20%护甲和护甲韧性。
val emperoricTrait = ArmorTraitBuilder.create("emperoric");
emperoricTrait.color = Color.fromHex("ffffff").getIntColor();
emperoricTrait.localizedName = game.localize("greedycraft.tconstruct.armor_trait.emperoricTrait.name");
emperoricTrait.localizedDescription = game.localize("greedycraft.tconstruct.armor_trait.emperoricTrait.desc");
emperoricTrait.getModifications = function(trait, player, mods, armor, damageSource, damage, index) {
    if (!isNull(player)) {
        var modsNew as IArmorModifications = mods;
        modsNew.armorMod = 1.2f;
        modsNew.toughnessMod = 1.2f;
        return modsNew;
    }
    return mods;
};
emperoricTrait.register();

//热烈
//§o我现在high到不行啦~~~~\n§r令你周围的所有目标更加活跃（指力量）。
val enthusiasticTrait = ArmorTraitBuilder.create("enthusiastic");
enthusiasticTrait.color = Color.fromHex("ffffff").getIntColor();
enthusiasticTrait.localizedName = game.localize("greedycraft.tconstruct.armor_trait.enthusiasticTrait.name");
enthusiasticTrait.localizedDescription = game.localize("greedycraft.tconstruct.armor_trait.enthusiasticTrait.desc");
enthusiasticTrait.onArmorTick = function(trait, armor, world, player) {
    if (!isNull(player)) {
        for entity in world.getEntitiesInArea(crafttweaker.util.Position3f.create(((player.x)- 3),((player.y)- 3),((player.z)- 3)),crafttweaker.util.Position3f.create(((player.x)+ 3),((player.y)+ 3),((player.z)+ 3))){
            if (entity instanceof IEntityLivingBase) {
                val en as IEntityLivingBase = entity;
                if (!en.isPotionActive(<potion:minecraft:strength>)) {
                    en.addPotionEffect(<potion:minecraft:strength>.makePotionEffect(100, 1, false, false));
                }
            }
        }
    }
};
enthusiasticTrait.register();

//复苏
//§o一视同仁？\n§r行走的治愈药水！
val revivalingTrait = ArmorTraitBuilder.create("revivaling");
revivalingTrait.color = Color.fromHex("ffffff").getIntColor();
revivalingTrait.localizedName = game.localize("greedycraft.tconstruct.armor_trait.revivalingTrait.name");
revivalingTrait.localizedDescription = game.localize("greedycraft.tconstruct.armor_trait.revivalingTrait.desc");
revivalingTrait.onHurt = function(trait, armor, player, source, damage, newDamage, evt) {
    if (!isNull(player) && !isNull(source.getTrueSource())) {
        if (source.getTrueSource() instanceof IEntityLivingBase) {
            var entity as IEntityLivingBase = source.getTrueSource();
            player.heal(player.maxHealth as float * 0.02f as float);
            entity.heal(entity.maxHealth as float * 0.02f as float); 
        }
    }
    return newDamage;
};
revivalingTrait.register();

//自然之束
//§o你与自然融为一体！\n§r以自然之名复原。
val natureboundTrait = ArmorTraitBuilder.create("naturebound");
natureboundTrait.color = Color.fromHex("ffffff").getIntColor();
natureboundTrait.localizedName = game.localize("greedycraft.tconstruct.armor_trait.natureboundTrait.name");
natureboundTrait.localizedDescription = game.localize("greedycraft.tconstruct.armor_trait.natureboundTrait.desc");
natureboundTrait.onArmorTick = function(trait, armor, world, player) {
    if (!isNull(player)) {
        if ((player.world.getBlock(player.x as int, player.y as int - 1, player.z as int)).definition.id has "dirt") {
            if (Math.random() <= 0.01f) {
                ToolHelper.healTool(armor.mutable().native, 1, player.native);
            }
        }
    }
};
natureboundTrait.register();

//交互
//§o有些过于保守了……\n§r受到致命伤害时将玩家传送至地面（冷却时间5min）
val portedTrait = ArmorTraitBuilder.create("ported");
portedTrait.color = Color.fromHex("ffffff").getIntColor();
portedTrait.localizedName = game.localize("greedycraft.tconstruct.armor_trait.portedTrait.name");
portedTrait.localizedDescription = game.localize("greedycraft.tconstruct.armor_trait.portedTrait.desc");
portedTrait.onDamaged = function(trait, armor, player, source, damage, newDamage, evt) {
    if (!isNull(player)) {
        if (!isNull(armor.tag.ported) && damage >= player.health) {
            if (armor.tag.ported.timer as int > 6000) {
                player.addPotionEffect(<potion:potioncore:teleport_surface>.makePotionEffect(5, 0, false, false));
                armor.mutable().updateTag({ported : {timer : 0 as int}});
                return 0.0f;
            }
        }
    }
    return newDamage;
};
portedTrait.onArmorTick = function(trait, armor, world, player) {
    if (!isNull(player)) {
        if (isNull(armor.tag.ported)) {
            armor.mutable().updateTag({ported : {timer : 0 as int}});
        } else {
            var timerNew as int = armor.tag.ported.timer as int + 1;
            armor.mutable().updateTag({ported : {timer : timerNew as int}});
        }
    }
};
portedTrait.register();

//万象
//§o兼收并蓄。\n§r非原版生物对你的伤害会被削弱。
val panoramaTrait = ArmorTraitBuilder.create("panorama");
panoramaTrait.color = Color.fromHex("ffffff").getIntColor();
panoramaTrait.localizedName = game.localize("greedycraft.tconstruct.armor_trait.panoramaTrait.name");
panoramaTrait.localizedDescription = game.localize("greedycraft.tconstruct.armor_trait.panoramaTrait.desc");
panoramaTrait.onHurt = function(trait, armor, player, source, damage, newDamage, evt) {
    if (!isNull(player) && !isNull(source.getTrueSource())) {
        var entity as IEntityLivingBase = source.getTrueSource();
        if (!isNull(entity.definition)) {
            if (entity.definition.name.split(":")[0] != "minecraft") {
                return newDamage * 0.75f;
            }
        }
    }
    return newDamage;
};
panoramaTrait.register();

//基石
//§o它如基岩一般！\n§r你的护甲仅会有20%几率消耗耐久。
val bedrockTrait = ArmorTraitBuilder.create("bedrock");
bedrockTrait.color = Color.fromHex("ffffff").getIntColor();
bedrockTrait.localizedName = game.localize("greedycraft.tconstruct.armor_trait.bedrockTrait.name");
bedrockTrait.localizedDescription = game.localize("greedycraft.tconstruct.armor_trait.bedrockTrait.desc");
bedrockTrait.onArmorDamaged = function(trait, armor, damageSource, amount, newAmount, player, index) {
    if (Math.random() < 0.8f) {
        return 0;
    }
    return newAmount;
};
bedrockTrait.register();

val overbreakTrait = ArmorTraitBuilder.create("overbreak");
overbreakTrait.color = Color.fromHex("ffffff").getIntColor();
overbreakTrait.localizedName = game.localize("greedycraft.tconstruct.armor_trait.overbreakTrait.name");
overbreakTrait.localizedDescription = game.localize("greedycraft.tconstruct.armor_trait.overbreakTrait.desc");
overbreakTrait.onArmorTick = function(trait, armor, world, player) {
    if (!isNull(player) && armor.hasOverslime()) {
        if (!isNull(armor.tag.Stats.Broken) && isNull(armor.tag.overbreak)) {
            if (armor.tag.Stats.Broken as byte == 0 as byte) {
                armor.mutable().updateTag({overbreak : 1 as byte});
                CotTicLib.addTicFreeModifiers(armor, 2, "overbreak");
            }
        }
    }
};
overbreakTrait.register();

val overbounceTrait = ArmorTraitBuilder.create("overbounce");
overbounceTrait.color = Color.fromHex("ffffff").getIntColor();
overbounceTrait.localizedName = game.localize("greedycraft.tconstruct.armor_trait.overbounceTrait.name");
overbounceTrait.localizedDescription = game.localize("greedycraft.tconstruct.armor_trait.overbounceTrait.desc");
overbounceTrait.onArmorTick = function(trait, armor, world, player) {
    if (!isNull(player) && armor.hasOverslime()) {
        player.addPotionEffect(<potion:minecraft:jump_boost>.makePotionEffect(5, 3, false, false));
    }
};
overbounceTrait.onJumping = function(trait, armor, player, evt) {
    if (!isNull(player) && armor.hasOverslime()) {
        armor.mutable().removeOverslime(Math.ceil(Math.random() * 8.0f) as int);
    }
};
overbounceTrait.register();

val overdefenseTrait = ArmorTraitBuilder.create("overdefense");
overdefenseTrait.color = Color.fromHex("ffffff").getIntColor();
overdefenseTrait.localizedName = game.localize("greedycraft.tconstruct.armor_trait.overdefenseTrait.name");
overdefenseTrait.localizedDescription = game.localize("greedycraft.tconstruct.armor_trait.overdefenseTrait.desc");
overdefenseTrait.onArmorTick = function(trait, armor, world, player) {
    if (!isNull(player) && armor.hasOverslime()) {
        if (armor.getOverslime() <= (armor.maxDamage / 20)) {
            CotTicLib.addTicDefense(armor, 4, "overdefense");
        }
    }
};
overdefenseTrait.register();

val overreflectTrait = ArmorTraitBuilder.create("overreflect");
overreflectTrait.color = Color.fromHex("ffffff").getIntColor();
overreflectTrait.localizedName = game.localize("greedycraft.tconstruct.armor_trait.overreflectTrait.name");
overreflectTrait.localizedDescription = game.localize("greedycraft.tconstruct.armor_trait.overreflectTrait.desc");
overreflectTrait.onHurt = function(trait, armor, player, source, damage, newDamage, evt) {
    if (!isNull(player) && !isNull(source.getTrueSource()) && armor.hasOverslime()) {
        if (source.getTrueSource() instanceof IEntityLivingBase) {
            var entity as IEntityLivingBase = source.getTrueSource();
            for potion in player.activePotionEffects {
                if (potion.potion.badEffect) {
                    entity.addPotionEffect(potion);
                }
            }
        }
    }
    return newDamage;
};
overreflectTrait.register();

val overfusedTrait = ArmorTraitBuilder.create("overfused");
overfusedTrait.color = Color.fromHex("ffffff").getIntColor();
overfusedTrait.localizedName = game.localize("greedycraft.tconstruct.armor_trait.overfusedTrait.name");
overfusedTrait.localizedDescription = game.localize("greedycraft.tconstruct.armor_trait.overfusedTrait.desc");
overfusedTrait.onHurt = function(trait, armor, player, source, damage, newDamage, evt) {
    if (!isNull(player) && !isNull(source.getTrueSource()) && armor.hasOverslime()) {
        if (source.getTrueSource() instanceof IEntityLivingBase) {
            var entity as IEntityLivingBase = source.getTrueSource();
            if (entity.definition.id.toLowerCase() has "slime") {
                armor.mutable().removeOverslime(2);
                return newDamage * 0.15f;
            }
        }
    }
    return newDamage;
};
overfusedTrait.register();

val enhancedTrait = ArmorTraitBuilder.create("enhanced");
enhancedTrait.color = Color.fromHex("ffffff").getIntColor();
enhancedTrait.localizedName = game.localize("greedycraft.tconstruct.armor_trait.enhancedTrait.name");
enhancedTrait.localizedDescription = game.localize("greedycraft.tconstruct.armor_trait.enhancedTrait.desc");
enhancedTrait.onArmorTick = function(trait, armor, world, player) {
    CotTicLib.addTicFreeModifiers(armor, 2, "enhanced");
};
enhancedTrait.register();

val loveTrait = ArmorTraitBuilder.create("love");
loveTrait.color = Color.fromHex("ffffff").getIntColor();
loveTrait.localizedName = game.localize("greedycraft.tconstruct.armor_trait.loveTrait.name");
loveTrait.localizedDescription = game.localize("greedycraft.tconstruct.armor_trait.loveTrait.desc");
loveTrait.onArmorTick = function(trait, armor, world, player) {
    if (!isNull(player)) {
        player.addPotionEffect(<potion:potioncore:love>.makePotionEffect(5, 0, false, false));
    }
};
loveTrait.register();

val orthogonalityTrait = ArmorTraitBuilder.create("orthogonality");
orthogonalityTrait.color = Color.fromHex("ffffff").getIntColor();
orthogonalityTrait.localizedName = game.localize("greedycraft.tconstruct.armor_trait.orthogonalityTrait.name");
orthogonalityTrait.localizedDescription = game.localize("greedycraft.tconstruct.armor_trait.orthogonalityTrait.desc");
orthogonalityTrait.onHurt = function(trait, armor, player, source, damage, newDamage, evt) {
    if (!isNull(player) && !isNull(source.getTrueSource())) {
        if (source.getTrueSource() instanceof IEntityLivingBase) {
            var entity as IEntityLivingBase = source.getTrueSource();
            if (Math.abs(player.x - entity.x) as float < 1.0f && Math.abs(player.z - entity.z) as float < 1.0f) {
                if (entity.getPassengers() has player || player.getPassengers() has entity) {
                    return newDamage;
                } else {
                    return 0.0f;
                }
            }
        }
    }
    return newDamage;
};
orthogonalityTrait.register();

val diffractionTrait = ArmorTraitBuilder.create("diffraction");
diffractionTrait.color = Color.fromHex("ffffff").getIntColor();
diffractionTrait.localizedName = game.localize("greedycraft.tconstruct.armor_trait.diffractionTrait.name");
diffractionTrait.localizedDescription = game.localize("greedycraft.tconstruct.armor_trait.diffractionTrait.desc");
diffractionTrait.onDamaged = function(trait, armor, player, source, damage, newDamage, evt) {
    if (!isNull(player)) {
        player.world.catenation()
        .run(function(world, context) {
            var health as float = player.health;
            armor.mutable().updateTag({diffraction : health as float});
        })
        .sleep(40)
        .then(function(world, context) {
            var health as float = player.health;
            if (Math.abs(armor.tag.diffraction as float - health) <= 1) {
                player.heal(player.maxHealth * 0.1f);
            }
        })
        .start();
    }
    return newDamage;
};
diffractionTrait.register();

val emberTrait = ArmorTraitBuilder.create("ember");
emberTrait.color = Color.fromHex("ffffff").getIntColor();
emberTrait.localizedName = game.localize("greedycraft.tconstruct.armor_trait.emberTrait.name");
emberTrait.localizedDescription = game.localize("greedycraft.tconstruct.armor_trait.emberTrait.desc");
emberTrait.onHurt = function(trait, armor, player, source, damage, newDamage, evt) {
    if (!isNull(player)) {
        var mtp as float = (armor.damage as float / armor.maxDamage as float) as float / 5.0f;
        return newDamage * (1.0f - mtp);
    }
    return newDamage;
};
emberTrait.register();

val rekindledTrait = ArmorTraitBuilder.create("rekindled");
rekindledTrait.color = Color.fromHex("ffffff").getIntColor();
rekindledTrait.localizedName = game.localize("greedycraft.tconstruct.armor_trait.rekindledTrait.name");
rekindledTrait.localizedDescription = game.localize("greedycraft.tconstruct.armor_trait.rekindledTrait.desc");
rekindledTrait.onArmorTick = function(trait, armor, world, player) {
    if (!isNull(player)) {
        if (player.isBurning) {
            var dura as int = armor.maxDamage / 100 as int; 
            ToolHelper.healTool(armor.mutable().native, dura, player.native);
        }
    }
};
rekindledTrait.register();

val sutureTrait = ArmorTraitBuilder.create("suture");
sutureTrait.color = Color.fromHex("ffffff").getIntColor();
sutureTrait.localizedName = game.localize("greedycraft.tconstruct.armor_trait.sutureTrait.name");
sutureTrait.localizedDescription = game.localize("greedycraft.tconstruct.armor_trait.sutureTrait.desc");
sutureTrait.onArmorTick = function(trait, armor, world, player) {
    if (!isNull(player)) {
        var jumpBoost as AttributeModifier = AttributeModifier.createModifier("potioncore.jumpHeight", 1, 0, "7f6d3a59-b3e4-4c7a-b7a8-53412a929a0e");
        var speed as AttributeModifier = AttributeModifier.createModifier("generic.movementSpeed", 0.15f, 2, "7f6d3a59-b3e4-4c7a-b7a8-53412a929a0f");
        if (!(player.getAttribute("potioncore.jumpHeight").hasModifier(jumpBoost))) {
            player.getAttribute("potioncore.jumpHeight").applyModifier(jumpBoost);
        }
        if (!(player.getAttribute("generic.movementSpeed").hasModifier(speed))) {
            player.getAttribute("generic.movementSpeed").applyModifier(speed);
        }
    }
};
sutureTrait.onArmorRemove = function(trait, armor, player, index) {
    if (!isNull(player)) {
        player.getAttribute("potioncore.jumpHeight").removeModifier("7f6d3a59-b3e4-4c7a-b7a8-53412a929a0e");
        player.getAttribute("generic.movementSpeed").removeModifier("7f6d3a59-b3e4-4c7a-b7a8-53412a929a0f");
    }
};
sutureTrait.onHurt = function(trait, armor, player, source, damage, newDamage, evt) {
    if (!isNull(player)) {
        if (Math.random() < 0.1f) {
            if ((armor.damage + armor.maxDamage * 0.1f) >= armor.maxDamage) {
                ToolHelper.breakTool(armor.mutable().native, player.native);
            } else {
                armor.mutable().attemptDamageItemWithEnergy(armor.maxDamage * 0.1f as int, player);
            }
        }
    }
    return newDamage;
};
sutureTrait.register();

val ripeningTrait = ArmorTraitBuilder.create("ripening");
ripeningTrait.color = Color.fromHex("ffffff").getIntColor();
ripeningTrait.localizedName = game.localize("greedycraft.tconstruct.armor_trait.ripeningTrait.name");
ripeningTrait.localizedDescription = game.localize("greedycraft.tconstruct.armor_trait.ripeningTrait.desc");
ripeningTrait.onArmorTick = function(trait, armor, world, player) {
    if (!isNull(player)) {
        if (player.getDimension() == 20) {
            if (!isNull(world.getBlock(player.x as int, player.y as int, player.z as int).fluid)) {
                if (world.getBlock(player.x as int, player.y as int, player.z as int).fluid.name has "swamp_water") {
                    player.addPotionEffect(<potion:thebetweenlands:effect_ripening>.makePotionEffect(1, 2, false, false));
                }
            }
        }
    }
};
ripeningTrait.register();

val underwaterregenTrait = ArmorTraitBuilder.create("underwaterregen");
underwaterregenTrait.color = Color.fromHex("ffffff").getIntColor();
underwaterregenTrait.localizedName = game.localize("greedycraft.tconstruct.armor_trait.underwaterregenTrait.name");
underwaterregenTrait.localizedDescription = game.localize("greedycraft.tconstruct.armor_trait.underwaterregenTrait.desc");
underwaterregenTrait.onArmorTick = function(trait, armor, world, player) {
    if (!isNull(player)) {
        if (armor.isEnchanted) {
            var successful as bool = true;
            for enchant in armor.enchantments {
                if (enchant.definition.name == <enchantment:minecraft:depth_strider>.name) {
                    successful = false;                    
                    break;
                }
            }
            if (successful) {
                armor.mutable().addEnchantment(<enchantment:minecraft:depth_strider>.makeEnchantment(2));
            }
        } else {
            armor.mutable().addEnchantment(<enchantment:minecraft:depth_strider>.makeEnchantment(2));
        }
        if (player.isInWater) {
            player.addPotionEffect(<potion:minecraft:regeneration>.makePotionEffect(1, 3, false, false));
        }
    }
};
underwaterregenTrait.register();

val collapseTrait = ArmorTraitBuilder.create("collapse");
collapseTrait.color = Color.fromHex("ffffff").getIntColor();
collapseTrait.localizedName = game.localize("greedycraft.tconstruct.armor_trait.collapseTrait.name");
collapseTrait.localizedDescription = game.localize("greedycraft.tconstruct.armor_trait.collapseTrait.desc");
collapseTrait.onArmorTick = function(trait, armor, world, player) {
    if (!isNull(player)) {
        var dura as int = (armor.maxDamage * 0.002f) as int;
    if ((armor.damage + dura) >= armor.maxDamage) {
            ToolHelper.breakTool(armor.mutable().native, player.native);
        } else {
            armor.mutable().attemptDamageItemWithEnergy(dura as int, player);
        }    
    }
};
collapseTrait.register();

val scalesTrait = ArmorTraitBuilder.create("scales");
scalesTrait.color = Color.fromHex("ffffff").getIntColor();
scalesTrait.localizedName = game.localize("greedycraft.tconstruct.armor_trait.scalesTrait.name");
scalesTrait.localizedDescription = game.localize("greedycraft.tconstruct.armor_trait.scalesTrait.desc");
scalesTrait.getModifications = function(trait, player, mods, armor, damageSource, damage, index) {
    if (!isNull(player)) {
        var modsNew as IArmorModifications = mods;
        modsNew.armor += 3.0f;
        modsNew.toughness += 1.0f;
        return modsNew;
    }
    return mods;
};
scalesTrait.register();

val primordial_malevolenceTrait = ArmorTraitBuilder.create("malevolence");
primordial_malevolenceTrait.color = Color.fromHex("ffffff").getIntColor();
primordial_malevolenceTrait.localizedName = game.localize("greedycraft.tconstruct.armor_trait.primordial_malevolenceTrait.name");
primordial_malevolenceTrait.localizedDescription = game.localize("greedycraft.tconstruct.armor_trait.primordial_malevolenceTrait.desc");
primordial_malevolenceTrait.onHurt = function(trait, armor, player, source, damage, newDamage, evt) {
    if (!isNull(player)) {
        if (Math.random() < 0.15f) {
            var dmg as float = player.maxHealth * 0.13f;
            var source as IDamageSource = IDamageSource.createEntityDamage("chaos", player);
            player.attackEntityFrom(source, dmg);
        }
    }
    return newDamage;
};
primordial_malevolenceTrait.register();

val watcherTrait = ArmorTraitBuilder.create("watcher");
watcherTrait.color = Color.fromHex("ffffff").getIntColor();
watcherTrait.localizedName = game.localize("greedycraft.tconstruct.armor_trait.watcherTrait.name");
watcherTrait.localizedDescription = game.localize("greedycraft.tconstruct.armor_trait.watcherTrait.desc");
watcherTrait.onHurt = function(trait, armor, player, source, damage, newDamage, evt) {
    if (!isNull(player)) {
        if (source.damageType == "mob") {
            return newDamage * 0.9f;
         } else if (source.damageType == "magic" || source.damageType == "indirectMagic") {
            return newDamage * 0.93f;
        }
    }
    return newDamage;
};
watcherTrait.register();

val world_beginningTrait = ArmorTraitBuilder.create("world_beginning");
world_beginningTrait.color = Color.fromHex("ffffff").getIntColor();
world_beginningTrait.localizedName = game.localize("greedycraft.tconstruct.armor_trait.world_beginningTrait.name");
world_beginningTrait.localizedDescription = game.localize("greedycraft.tconstruct.armor_trait.world_beginningTrait.desc");
world_beginningTrait.onHurt = function(trait, armor, player, source, damage, newDamage, evt) {
    if (!isNull(player)) {
        if (player.isPotionActive(<potion:contenttweaker:worldguard>)) {
            return newDamage * 0.6f;
        }
    }
    return newDamage;
};
world_beginningTrait.register();

val energy_fixTrait = ArmorTraitBuilder.create("energy_fix");
energy_fixTrait.color = Color.fromHex("ffffff").getIntColor();
energy_fixTrait.localizedName = game.localize("greedycraft.tconstruct.armor_trait.energy_fixTrait.name");
energy_fixTrait.localizedDescription = game.localize("greedycraft.tconstruct.armor_trait.energy_fixTrait.desc");
energy_fixTrait.hidden = true;
energy_fixTrait.onArmorTick = function(trait, armor, world, player) {
    var newenergy as IData = {};
    var energy = 0;
    if (!isNull(armor.tag.EnergizedEnergy)) {
        energy = armor.tag.EnergizedEnergy.asInt();
        newenergy = {EnergizedEnergy: (energy - 320)};
        if (energy > 320 && armor.damage > 0) {
            armor.mutable().tag.update(armor.tag.deepUpdate(newenergy, {EnergizedEnergy: OVERWRITE}));
            armor.mutable().damageItem(-1,player);
        }
    }
    if (!isNull(armor.tag.FluxedEnergy)) {
        energy = armor.tag.FluxedEnergy.asInt();
        newenergy = {FluxedEnergy: (energy - 320)};
        if (energy > 320 && armor.damage > 0) {
            armor.mutable().tag.update(armor.tag.deepUpdate(newenergy, {FluxedEnergy: OVERWRITE}));
            armor.mutable().damageItem(-1,player);
        }
    }
    if (!isNull(armor.tag.EvolvedEnergy)) {
        energy = armor.tag.EvolvedEnergy.asInt();
        newenergy = {EvolvedEnergy: (energy - 320)};
        if (energy > 320 && armor.damage > 0) {
            armor.mutable().tag.update(armor.tag.deepUpdate(newenergy, {EvolvedEnergy: OVERWRITE}));
            armor.mutable().damageItem(-1,player);
        }
    }
};
energy_fixTrait.register();