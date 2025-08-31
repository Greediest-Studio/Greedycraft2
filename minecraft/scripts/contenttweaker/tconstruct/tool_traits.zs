/*
 * This script is created for the GreedyCraft modpack by TCreopargh.
 * You may NOT use this script in any other publicly distributed modpack without my permission.
 */

#loader contenttweaker

#modloaded tconstruct

#priority 2602

import crafttweaker.player.IPlayer;
import crafttweaker.entity.IEntityLivingBase;
import crafttweaker.damage.IDamageSource;
import crafttweaker.entity.IEntityMob;
import crafttweaker.item.IItemStack;
import crafttweaker.item.IMutableItemStack;
import crafttweaker.data.IData;
import crafttweaker.item.IIngredient;
import crafttweaker.liquid.ILiquidStack;
import crafttweaker.game.IGame;
import crafttweaker.world.IBlockPos;
import crafttweaker.world.IBiome;
import crafttweaker.enchantments.IEnchantment;
import crafttweaker.item.WeightedItemStack;
import crafttweaker.world.IWorld;
import crafttweaker.world.IFacing;
import crafttweaker.block.IBlock;
import crafttweaker.entity.IEntity;
import crafttweaker.util.Position3f;
import crafttweaker.event.EntityLivingHealEvent;

import mods.ctutils.utils.Math;
import mods.contenttweaker.tconstruct.Material;
import mods.contenttweaker.tconstruct.MaterialBuilder;
import mods.contenttweaker.Fluid;
import mods.contenttweaker.VanillaFactory;
import mods.contenttweaker.Color;
import mods.contenttweaker.tconstruct.Trait;
import mods.contenttweaker.tconstruct.TraitDataRepresentation;
import mods.contenttweaker.tconstruct.TraitBuilder;
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
    if ((!isNull(this.tag.EnergizedEnergy)) || (!isNull(this.tag.EvolvedEnergy)) || (!isNull(this.tag.FluxedEnergy)) || (!isNull(this.tag.Energy))) {
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
        } else if (!isNull(this.tag.Energy)) {
            return this.tag.Energy as int;
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
        } else if (!isNull(this.tag.Energy)) {
            this.updateTag({Energy : num});
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

val poopTrait = TraitBuilder.create("poopy");
poopTrait.color = Color.fromHex("5d4037").getIntColor(); 
poopTrait.localizedName = game.localize("greedycraft.tconstruct.tool_trait.poopTrait.name");
poopTrait.localizedDescription = game.localize("greedycraft.tconstruct.tool_trait.poopTrait.desc");
poopTrait.onHit = function(trait, tool, attacker, target, damage, isCritical) {
    if (attacker instanceof IPlayer && target instanceof IEntityMob) {
        if (Math.random() < 0.005) {
            val player as IPlayer = attacker;
            player.give(itemUtils.getItem("additions:poop"));
        }
    }
};
poopTrait.register();

val pinkyTrait = TraitBuilder.create("pinky");
pinkyTrait.color = Color.fromHex("ff80ab").getIntColor(); 
pinkyTrait.localizedName = game.localize("greedycraft.tconstruct.tool_trait.pinkyTrait.name");
pinkyTrait.localizedDescription = game.localize("greedycraft.tconstruct.tool_trait.pinkyTrait.desc");
pinkyTrait.onBlockHarvestDrops = function(trait, tool, event) {
    if (!event.silkTouch && event.block.definition.id == "minecraft:diamond_ore") {
        if (Math.random() < 0.2) {
            event.addItem(<item:sakura:sakura_diamond>);
        }
    }
};
pinkyTrait.register();

val cotlifestealTrait = TraitBuilder.create("cotlifesteal");
cotlifestealTrait.color = Color.fromHex("ff5252").getIntColor(); 
cotlifestealTrait.localizedName = game.localize("greedycraft.tconstruct.tool_trait.cotlifestealTrait.name");
cotlifestealTrait.localizedDescription = game.localize("greedycraft.tconstruct.tool_trait.cotlifestealTrait.desc");
cotlifestealTrait.afterHit = function(trait, tool, attacker, target, damageDealt, wasCritical, wasHit) {
    if (attacker instanceof IPlayer && wasHit && target instanceof IEntityMob && !target.isUndead) {
        if (Math.random() < 0.33) {
            var heal as float = damageDealt * 0.05f;
            if (heal > 5.0f) {
                heal = 5.0f;
            }
            attacker.heal(heal);
        }
    }
};
cotlifestealTrait.register();

val superknockpackTrait = TraitBuilder.create("superknockback");
superknockpackTrait.color = Color.fromHex("7e57c2").getIntColor(); 
superknockpackTrait.localizedName = game.localize("greedycraft.tconstruct.tool_trait.superknockpackTrait.name");
superknockpackTrait.localizedDescription = game.localize("greedycraft.tconstruct.tool_trait.superknockpackTrait.desc");
superknockpackTrait.calcCrit = function(trait, tool, attacker, target) {
    if (Math.random() < 0.25) {
        return true;
    }
    return false;
};
superknockpackTrait.calcKnockBack = function(trait, tool, attacker, target, damage, originalKnockBack, newKnockBack, isCritical) {
    if (isCritical) {
        return (newKnockBack * 10.0 + 20.0) as float; 
    }
    return newKnockBack;
};
superknockpackTrait.register();

val gambleTrait = TraitBuilder.create("gamble");
gambleTrait.color = Color.fromHex("ffa000").getIntColor(); 
gambleTrait.localizedName = game.localize("greedycraft.tconstruct.tool_trait.gambleTrait.name");
gambleTrait.localizedDescription = game.localize("greedycraft.tconstruct.tool_trait.gambleTrait.desc");
gambleTrait.calcDamage = function(trait, tool, attacker, target, originalDamage, newDamage, isCritical) {
    var dmg = newDamage;
    var rand as double = Math.random();
    if (rand < 0.15) {
        dmg = newDamage * 2 as float; 
    } else if (rand < 0.45) {
        dmg = newDamage / 2 as float; 
    }
    return dmg;
};
gambleTrait.register();

val gamble2Trait = TraitBuilder.create("gamble2");
gamble2Trait.color = Color.fromHex("ffa000").getIntColor(); 
gamble2Trait.localizedName = game.localize("greedycraft.tconstruct.tool_trait.gamble2Trait.name");
gamble2Trait.localizedDescription = game.localize("greedycraft.tconstruct.tool_trait.gamble2Trait.desc");
gamble2Trait.calcDamage = function(trait, tool, attacker, target, originalDamage, newDamage, isCritical) {
    var dmg = newDamage;
    var rand as double = Math.random();
    if (rand < 0.15) {
        dmg = newDamage * 3 as float; 
    } else if (rand < 0.45) {
        dmg = newDamage / 3 as float; 
    }
    return dmg;
};
gamble2Trait.register();


val ragingTrait = TraitBuilder.create("raging");
ragingTrait.color = Color.fromHex("e040fb").getIntColor(); 
ragingTrait.localizedName = game.localize("greedycraft.tconstruct.tool_trait.ragingTrait.name");
ragingTrait.localizedDescription = game.localize("greedycraft.tconstruct.tool_trait.ragingTrait.desc");
ragingTrait.calcDamage = function(trait, tool, attacker, target, originalDamage, newDamage, isCritical) {
    if (!isCritical) {
        return newDamage * 1.2f;
    }
    return newDamage * 0.75f;
};
ragingTrait.register();

val levelingdamageTrait = TraitBuilder.create("levelingdamage");
levelingdamageTrait.color = Color.fromHex("7e57c2").getIntColor(); 
levelingdamageTrait.localizedName = game.localize("greedycraft.tconstruct.tool_trait.levelingdamageTrait.name");
levelingdamageTrait.addItem(<ore:plateHonor>);
levelingdamageTrait.maxLevel = 3;
levelingdamageTrait.localizedDescription = game.localize("greedycraft.tconstruct.tool_trait.levelingdamageTrait.desc");
levelingdamageTrait.extraInfo = function(thisTrait, item, tag) {
    if (isNull(tag) || isNull(tag.memberGet("Modifiers"))) {
        return [] as string[];
    }
    var modifiers = tag.memberGet("Modifiers") as IData;
    var toolLevel = {} as IData;
    if (modifiers.asString().contains("toolleveling")) {
        for i in 0 to modifiers.length {
            var current as IData = modifiers[i];
            if (current.asString().contains("toolleveling")) {
                toolLevel = current;
                break;
            }
        }
    }
    var multiplier = 1.0;
    if (!isNull(toolLevel.memberGet("level"))) {
        var level = toolLevel.memberGet("level").asInt() as int;
        multiplier += 0.025f * level as float;
        if (multiplier > 1.5) {
            multiplier = 1.5 + (multiplier - 1.5) / 4;
        }
    }
    var data as TraitDataRepresentation = thisTrait.getData(item);
    var level = 0;
    if (!isNull(data)) {
        level = data.level;
    }
    multiplier = (multiplier - 1.0f) * (level / 3) + 1.0f;
    var percentage as int = Math.round((multiplier - 1.0) * 100) as int;
    return [I18n.format("greedycraft.tool_trait.tooltip.damage_increase", "" + percentage)] as string[];
};
levelingdamageTrait.calcDamage = function(trait, tool, attacker, target, originalDamage, newDamage, isCritical) {
    var modifiers = tool.tag.memberGet("Modifiers") as IData;
    var toolLevel = {} as IData;
    if (modifiers.asString().contains("toolleveling")) {
        for i in 0 to modifiers.length {
            var current as IData = modifiers[i];
            if (current.asString().contains("toolleveling")) {
                toolLevel = current;
                break;
            }
        }
    }
    var multiplier = 1.0;
    if (!isNull(toolLevel.memberGet("level"))) {
        var level = toolLevel.memberGet("level").asInt() as int;
        while(level > 0) {
            level -= 1;
            multiplier += 0.05;
        }
        if (multiplier > 2.0) {
            multiplier = 2.0 + (multiplier - 2.0) / 4;
        }
    }    
    var data as TraitDataRepresentation = trait.getData(tool);
    var level = 0;
    if (!isNull(data)) {
        level = data.level;
    }
    multiplier = (multiplier - 1.0f) * (level as float / 3.0f) + 1.0f;
    return newDamage * multiplier as float;
};
levelingdamageTrait.register();

val thunderingTrait = TraitBuilder.create("lightning");
thunderingTrait.color = Color.fromHex("ffee58").getIntColor(); 
thunderingTrait.localizedName = game.localize("greedycraft.tconstruct.tool_trait.thunderingTrait.name");
thunderingTrait.localizedDescription = game.localize("greedycraft.tconstruct.tool_trait.thunderingTrait.desc");
thunderingTrait.afterHit = function(trait, tool, attacker, target, damageDealt, wasCritical, wasHit) {
    if (attacker instanceof IPlayer && wasHit && target instanceof IEntityMob) {
        if (Math.random() < 0.04) {
            target.world.addWeatherEffect(target.world.createLightningBolt(target.x, target.y, target.z, false));
        }
    }
};
thunderingTrait.register();

val visionTrait = TraitBuilder.create("vision");
visionTrait.color = Color.fromHex("ffeb3b").getIntColor(); 
visionTrait.localizedName = game.localize("greedycraft.tconstruct.tool_trait.visionTrait.name");
visionTrait.localizedDescription = game.localize("greedycraft.tconstruct.tool_trait.visionTrait.desc");
visionTrait.onUpdate = function(trait, tool, world, owner, itemSlot, isSelected) {
    if (owner instanceof IEntityLivingBase) {
        var ownerBase as IEntityLivingBase = owner;
        if (isSelected) {
            if (ownerBase.getDimension() != 20) ownerBase.addPotionEffect(<potion:minecraft:night_vision>.makePotionEffect(330, 0, false, false));
        } 
    }
};
visionTrait.register();

val fortifiedTrait = TraitBuilder.create("fortified");
fortifiedTrait.color = Color.fromHex("bdbdbd").getIntColor(); 
fortifiedTrait.localizedName = game.localize("greedycraft.tconstruct.tool_trait.fortifiedTrait.name");
fortifiedTrait.localizedDescription = game.localize("greedycraft.tconstruct.tool_trait.fortifiedTrait.desc");
fortifiedTrait.onBlock = function(trait, tool, player, event) {
    if (!isNull(player)) {
        player.addPotionEffect(<potion:minecraft:resistance>.makePotionEffect(99, 1, false, false));
    }
};
fortifiedTrait.register();

val reliableTrait = TraitBuilder.create("reliable");
reliableTrait.color = Color.fromHex("78909c").getIntColor(); 
reliableTrait.localizedName = game.localize("greedycraft.tconstruct.tool_trait.reliableTrait.name");
reliableTrait.localizedDescription = game.localize("greedycraft.tconstruct.tool_trait.reliableTrait.desc");
reliableTrait.onToolDamage = function(trait, tool, unmodifiedAmount, newAmount, holder) {
    if (holder.health > (holder.maxHealth * 0.9f)) {
        if (Math.random() < 0.25) {
            return newAmount;
        } else {
            return 0;
        }
    } else {
        return newAmount * 2;
    }
};
reliableTrait.register();

val sacrificialTrait = TraitBuilder.create("sacrificial");
sacrificialTrait.color = Color.fromHex("c62828").getIntColor(); 
sacrificialTrait.localizedName = game.localize("greedycraft.tconstruct.tool_trait.sacrificialTrait.name");
sacrificialTrait.localizedDescription = game.localize("greedycraft.tconstruct.tool_trait.sacrificialTrait.desc");
sacrificialTrait.calcDamage = function(trait, tool, attacker, target, originalDamage, newDamage, isCritical) {
    if (isCritical) {
        var sacrifice as float = attacker.maxHealth * 0.2f;
        var source as IDamageSource = crafttweaker.damage.IDamageSource.OUT_OF_WORLD();
        source.setDamageIsAbsolute();
        attacker.attackEntityFrom(source, sacrifice);
        return newDamage + sacrifice * 3 as float; 
    }
    return newDamage;
};
sacrificialTrait.register();

val halloweenTrait = TraitBuilder.create("halloween");
halloweenTrait.color = Color.fromHex("fb8c00").getIntColor(); 
halloweenTrait.localizedName = game.localize("greedycraft.tconstruct.tool_trait.halloweenTrait.name");
halloweenTrait.localizedDescription = game.localize("greedycraft.tconstruct.tool_trait.halloweenTrait.desc");
halloweenTrait.onHit = function(trait, tool, attacker, target, damage, isCritical) {
    if (!isNull(attacker) && !isNull(target) && attacker instanceof IPlayer && target instanceof IEntityMob) {
        if (Math.random() < 0.01) {
            val player as IPlayer = attacker;
            player.give(<item:extrabotany:candybag>);
        }
    }
};
halloweenTrait.register();

val milkyTrait = TraitBuilder.create("milky");
milkyTrait.color = Color.fromHex("ffffff").getIntColor(); 
milkyTrait.localizedName = game.localize("greedycraft.tconstruct.tool_trait.milkyTrait.name");
milkyTrait.localizedDescription = game.localize("greedycraft.tconstruct.tool_trait.milkyTrait.desc");
milkyTrait.onUpdate = function(trait, tool, world, owner, itemSlot, isSelected) {
    if (!isNull(owner) && owner instanceof IEntityLivingBase) {
        var ownerBase as IEntityLivingBase = owner;
        if (world.getWorldTime() as long % 12000 == 0) {
            ownerBase.clearActivePotions();
        }
    }
};
milkyTrait.register();

val giantslayerTrait = TraitBuilder.create("giantslayer");
giantslayerTrait.color = Color.fromHex("ffb74d").getIntColor(); 
giantslayerTrait.localizedName = game.localize("greedycraft.tconstruct.tool_trait.giantslayerTrait.name");
giantslayerTrait.localizedDescription = game.localize("greedycraft.tconstruct.tool_trait.giantslayerTrait.desc");
giantslayerTrait.calcDamage = function(trait, tool, attacker, target, originalDamage, newDamage, isCritical) {
    var multiplier = 0.05f * (target.health / attacker.maxHealth) as float;
    if (multiplier < 1.0f) {
        multiplier = 1.0f;
    }
    if (multiplier > 2.5f) { 
        multiplier = 2.5f;
    }
    return newDamage * multiplier as float;
};
giantslayerTrait.register();

val crystalTrait = TraitBuilder.create("crystal_force");
crystalTrait.color = Color.fromHex("18ffff").getIntColor(); 
crystalTrait.localizedName = game.localize("greedycraft.tconstruct.tool_trait.crystalTrait.name");
crystalTrait.localizedDescription = game.localize("greedycraft.tconstruct.tool_trait.crystalTrait.desc");
crystalTrait.calcDamage = function(trait, tool, attacker, target, originalDamage, newDamage, isCritical) {
    if (tool.maxDamage != 0) {
        var dmg as float = 0.0f + tool.damage as float;
        var maxDmg as float = 0.0f + tool.maxDamage as float;
        var durabilityPercent as float = 1.0f - (dmg as float / maxDmg as float) as float;
        var multiplier as float = 0.8f + (durabilityPercent as float * 0.5f) as float;
        return newDamage as float * multiplier as float;
    }
    return newDamage;
};
crystalTrait.register();

val spartanTrait = TraitBuilder.create("spartan");
spartanTrait.color = Color.fromHex("e53935").getIntColor(); 
spartanTrait.localizedName = game.localize("greedycraft.tconstruct.tool_trait.spartanTrait.name");
spartanTrait.localizedDescription = game.localize("greedycraft.tconstruct.tool_trait.spartanTrait.desc");
spartanTrait.calcDamage = function(trait, tool, attacker, target, originalDamage, newDamage, isCritical) {
    if ((attacker.health as float / attacker.maxHealth as float) as float < 0.33f) {
        var multiplier as float = 1.5f + (1.0f - (attacker.health as float / (attacker.maxHealth as float * 0.33) as float)) * 1.0f;
        return newDamage as float * multiplier as float;
    }
    return newDamage;
};
spartanTrait.register();

val knowledgefulTrait = TraitBuilder.create("knowledgeful");
knowledgefulTrait.color = Color.fromHex("76ff03").getIntColor(); 
knowledgefulTrait.localizedName = game.localize("greedycraft.tconstruct.tool_trait.knowledgefulTrait.name");
knowledgefulTrait.localizedDescription = game.localize("greedycraft.tconstruct.tool_trait.knowledgefulTrait.desc");
knowledgefulTrait.calcDamage = function(trait, tool, attacker, target, originalDamage, newDamage, isCritical) {
    if (attacker instanceof IPlayer) {
        val player as IPlayer = attacker;
        var xpLevel = player.xp;
        if (xpLevel > 1000) {
            xpLevel = 1000;
        }
        return newDamage as float * (1.0f + xpLevel as float * 0.0008f) as float;
    }
    return newDamage;
};
knowledgefulTrait.register();

val matterTrait1 = TraitBuilder.create("matter_condensing1");
matterTrait1.color = Color.fromHex("691b9a").getIntColor(); 
matterTrait1.localizedName = game.localize("greedycraft.tconstruct.tool_trait.matterTrait1.name");
matterTrait1.localizedDescription = game.localize("greedycraft.tconstruct.tool_trait.matterTrait1.desc");
matterTrait1.afterHit = function(trait, tool, attacker, target, damageDealt, wasCritical, wasHit) {
    if (attacker instanceof IPlayer && target instanceof IEntityMob) {
        val player as IPlayer = attacker;
        player.personalEMC = (player.personalEMC as long + (Math.floor(damageDealt * 0.1) as long)) as long;
    }
};
matterTrait1.register();

val matterTrait2 = TraitBuilder.create("matter_condensing2");
matterTrait2.color = Color.fromHex("691b9a").getIntColor(); 
matterTrait2.localizedName = game.localize("greedycraft.tconstruct.tool_trait.matterTrait2.name");
matterTrait2.localizedDescription = game.localize("greedycraft.tconstruct.tool_trait.matterTrait2.desc");
matterTrait2.afterHit = function(trait, tool, attacker, target, damageDealt, wasCritical, wasHit) {
    if (attacker instanceof IPlayer && target instanceof IEntityMob) {
        val player as IPlayer = attacker;
        player.personalEMC = (player.personalEMC as long + (Math.floor(damageDealt * 0.25) as long)) as long;
    }
};
matterTrait2.register();

val perfectionist = TraitBuilder.create("perfectionist");
perfectionist.color = Color.fromHex("4caf50").getIntColor(); 
perfectionist.localizedName = game.localize("greedycraft.tconstruct.tool_trait.perfectionist.name");
perfectionist.localizedDescription = game.localize("greedycraft.tconstruct.tool_trait.perfectionist.desc");
perfectionist.calcDamage = function(trait, tool, attacker, target, originalDamage, newDamage, isCritical) {
    return (Math.round(newDamage as float / 10 as float) as float * 10 as float) as float;
};
perfectionist.register();

val tidal_force = TraitBuilder.create("tidal_force");
tidal_force.color = Color.fromHex("64ffda").getIntColor(); 
tidal_force.localizedName = game.localize("greedycraft.tconstruct.tool_trait.tidal_force.name");
tidal_force.localizedDescription = game.localize("greedycraft.tconstruct.tool_trait.tidal_force.desc");
tidal_force.onUpdate = function(trait, tool, world, owner, itemSlot, isSelected) {
    if (owner instanceof IEntityLivingBase) {
        var ownerBase as IEntityLivingBase = owner;
        if (isSelected) {
            ownerBase.addPotionEffect(<potion:minecraft:water_breathing>.makePotionEffect(50, 0, false, false));
        }
    }
};
tidal_force.calcDamage = function(trait, tool, attacker, target, originalDamage, newDamage, isCritical) {
    if (attacker.isInWater || (attacker.wet)) {
        return newDamage * 1.33;
    } else {
        return newDamage;
    }
};
tidal_force.register();

val holdGroundTrait = TraitBuilder.create("hold_ground");
holdGroundTrait.color = Color.fromHex("f44336").getIntColor(); 
holdGroundTrait.localizedName = game.localize("greedycraft.tconstruct.tool_trait.holdGroundTrait.name");
holdGroundTrait.localizedDescription = game.localize("greedycraft.tconstruct.tool_trait.holdGroundTrait.desc");
holdGroundTrait.calcDamage = function(trait, tool, attacker, target, originalDamage, newDamage, isCritical) {
    if (attacker.isSneaking) {
        return newDamage * 1.25;
    } else {
        return newDamage;
    }
};
holdGroundTrait.onBlock = function(trait, tool, player, event) {
    if (!isNull(player) && player.isSneaking) {
        player.addPotionEffect(<potion:minecraft:strength>.makePotionEffect(125, 1, false, false));
    }
};
holdGroundTrait.register();

val motionTrait = TraitBuilder.create("motion");
motionTrait.color = Color.fromHex("ffee58").getIntColor(); 
motionTrait.localizedName = game.localize("greedycraft.tconstruct.tool_trait.motionTrait.name");
motionTrait.localizedDescription = game.localize("greedycraft.tconstruct.tool_trait.motionTrait.desc");
motionTrait.onPlayerHurt = function(trait, tool, player, attacker, event) {
    if (!isNull(player) && player.isSprinting) {
        event.amount = event.amount * 1.5f;
    }
};
motionTrait.calcDamage = function(trait, tool, attacker, target, originalDamage, newDamage, isCritical) {
    if (attacker.isSprinting) {
        return newDamage * 1.33;
    } else {
        return newDamage;
    }
};
motionTrait.calcKnockBack = function(trait, tool, attacker, target, damage, originalKnockBack, newKnockBack, isCritical) {
    if (attacker.isSprinting) {
        return (newKnockBack * 2.5) as float; 
    }
    return newKnockBack;
};
motionTrait.register();

val executionerTrait = TraitBuilder.create("executioner");
executionerTrait.color = Color.fromHex("e53935").getIntColor(); 
executionerTrait.localizedName = game.localize("greedycraft.tconstruct.tool_trait.executionerTrait.name");
executionerTrait.localizedDescription = game.localize("greedycraft.tconstruct.tool_trait.executionerTrait.desc");
executionerTrait.onHit = function(trait, tool, attacker, target, damage, isCritical) {
    if (isNull(target) || !(target instanceof IEntityLivingBase) || !(attacker instanceof IPlayer) || damage < 0.1) {
        return;
    }
    val player as IPlayer = attacker;
    var threshold as float = 0.2f;
    if (target.isBoss) {
        threshold = 0.1f;
    }
    if ((target.health as float / target.maxHealth as float) as float < threshold) {
        var source as IDamageSource = IDamageSource.createPlayerDamage(player);
        source.setDamageIsAbsolute();
        target.attackEntityFrom(source, 2147483647.0f);
    }
};
executionerTrait.register();

val penetrationTrait = TraitBuilder.create("penetration");
penetrationTrait.color = Color.fromHex("2979ff").getIntColor(); 
penetrationTrait.localizedName = game.localize("greedycraft.tconstruct.tool_trait.penetrationTrait.name");
penetrationTrait.localizedDescription = game.localize("greedycraft.tconstruct.tool_trait.penetrationTrait.desc");
penetrationTrait.calcDamage = function(trait, tool, attacker, target, originalDamage, newDamage, isCritical) {
    if (target.totalArmorValue > 0) {
        var multiplier as float = (target.totalArmorValue as float * 0.02f) as float;
        if (multiplier > 1.0f) {
            multiplier = 1.0f;
        }
        return (newDamage * (1.0f + multiplier) as float) as float;
    } else {
        return newDamage;
    }
};
penetrationTrait.register();

val thronyTrait = TraitBuilder.create("throny");
thronyTrait.color = Color.fromHex("4caf50").getIntColor(); 
thronyTrait.localizedName = game.localize("greedycraft.tconstruct.tool_trait.thronyTrait.name");
thronyTrait.localizedDescription = game.localize("greedycraft.tconstruct.tool_trait.thronyTrait.desc");
thronyTrait.onBlock = function(trait, tool, player, event) {
    if (!isNull(player)) {
        var source as IDamageSource = event.damageSource;
        if (!isNull(source.getTrueSource()) && source.getTrueSource() instanceof IEntityLivingBase) {
            var attacker as IEntityLivingBase = source.getTrueSource();
            var source as IDamageSource = IDamageSource.createThornsDamage(player);
            var dmg as float = player.maxHealth * 0.2;
            attacker.attackEntityFrom(source, dmg);
        }
    }
};
thronyTrait.register();

val nightBaneTrait = TraitBuilder.create("bane_of_night");
nightBaneTrait.color = Color.fromHex("fff176").getIntColor(); 
nightBaneTrait.localizedName = game.localize("greedycraft.tconstruct.tool_trait.nightBaneTrait.name");
nightBaneTrait.localizedDescription = game.localize("greedycraft.tconstruct.tool_trait.nightBaneTrait.desc");
nightBaneTrait.calcDamage = function(trait, tool, attacker, target, originalDamage, newDamage, isCritical) {
    var lightLevel as int = attacker.world.getBlockLight(attacker.position3f as IBlockPos);
    lightLevel -= 7;
    if (lightLevel < 0) {
        lightLevel = 0;
    }
    return newDamage * (1.0f + 0.025f * lightLevel) as float;
};
nightBaneTrait.register();

val bloodlustTrait = TraitBuilder.create("bloodlust");
bloodlustTrait.color = Color.fromHex("f44336").getIntColor(); 
bloodlustTrait.localizedName = game.localize("greedycraft.tconstruct.tool_trait.bloodlustTrait.name");
bloodlustTrait.localizedDescription = game.localize("greedycraft.tconstruct.tool_trait.bloodlustTrait.desc");
bloodlustTrait.calcDamage = function(trait, tool, attacker, target, originalDamage, newDamage, isCritical) {
    var ratio as float = target.health as float / target.maxHealth as float;
    return newDamage * (1.0f + (1.0f - ratio) * 0.5f) as float;
};
bloodlustTrait.register();

val assassinTrait = TraitBuilder.create("assassin");
assassinTrait.color = Color.fromHex("fff176").getIntColor(); 
assassinTrait.localizedName = game.localize("greedycraft.tconstruct.tool_trait.assassinTrait.name");
assassinTrait.localizedDescription = game.localize("greedycraft.tconstruct.tool_trait.assassinTrait.desc");
assassinTrait.calcDamage = function(trait, tool, attacker, target, originalDamage, newDamage, isCritical) {
    val enemyLooking = target.lookingDirection;
    val playerLooking = attacker.lookingDirection;
    if(!isNull(enemyLooking) && !(isNull(playerLooking))) {
        if(enemyLooking.dotProduct(playerLooking) > 0.0) {
            return newDamage * 1.4f;
        }
    }
    return newDamage;
};
assassinTrait.register();


val madnessTrait = TraitBuilder.create("madness");
madnessTrait.color = Color.fromHex("2979ff").getIntColor(); 
madnessTrait.localizedName = game.localize("greedycraft.tconstruct.tool_trait.madnessTrait.name");
madnessTrait.localizedDescription = game.localize("greedycraft.tconstruct.tool_trait.madnessTrait.desc");
madnessTrait.onUpdate = function(trait, tool, world, owner, itemSlot, isSelected) {
    if (!(owner instanceof IPlayer)) {
        return;
    }
    val player as IPlayer = owner;
    if(isSelected) {
        if(Math.random() < 1.0 / 900.0) {
            player.warpTemporary += 1;
        }
        if(Math.random() < 1.0 / 2400.0) {
            player.warpNormal += 1;
        }
    }
};
madnessTrait.calcDamage = function(trait, tool, attacker, target, originalDamage, newDamage, isCritical) {
    
    if (isNull(target) || !(attacker instanceof IPlayer)) {
        return newDamage;
    }
    val player as IPlayer = attacker;
    val warpTotal = player.warpNormal + player.warpTemporary + player.warpPermanent;
    val dmgBoost = Math.sqrt(warpTotal as double) / 40.0;
    return newDamage * (1.0f + dmgBoost as float);
};
madnessTrait.register();

val madness2Trait = TraitBuilder.create("madness2");
madness2Trait.color = Color.fromHex("2979ff").getIntColor(); 
madness2Trait.localizedName = game.localize("greedycraft.tconstruct.tool_trait.madness2Trait.name");
madness2Trait.localizedDescription = game.localize("greedycraft.tconstruct.tool_trait.madnessTrait.desc");
madness2Trait.onUpdate = function(trait, tool, world, owner, itemSlot, isSelected) {
    if (!(owner instanceof IPlayer)) {
        return;
    }
    val player as IPlayer = owner;
    if(isSelected) {
        if(Math.random() < 1.0 / 600.0) {
            player.warpTemporary += 1;
        }
        if(Math.random() < 1.0 / 1800.0) {
            player.warpNormal += 1;
        }
    }
};
madness2Trait.calcDamage = function(trait, tool, attacker, target, originalDamage, newDamage, isCritical) {
    
    if (isNull(target) || !(attacker instanceof IPlayer)) {
        return newDamage;
    }
    val player as IPlayer = attacker;
    val warpTotal = player.warpNormal + player.warpTemporary + player.warpPermanent;
    val dmgBoost = Math.sqrt(warpTotal as double) / 25.0;
    return newDamage * (1.0f + dmgBoost as float);
};
madness2Trait.register();

val plasmafusionTrait = TraitBuilder.create("plasmafusion");
plasmafusionTrait.color = Color.fromHex("ffffff").getIntColor(); 
plasmafusionTrait.localizedName = game.localize("greedycraft.tconstruct.tool_trait.plasmafusionTrait.name");
plasmafusionTrait.localizedDescription = game.localize("greedycraft.tconstruct.tool_trait.plasmafusionTrait.desc");
plasmafusionTrait.onHit = function(trait, tool, attacker, target, damage, isCritical) {
    if (attacker instanceof IPlayer) {
        val player as IPlayer = attacker;
        if (Math.random() < 0.1) {
            mods.contenttweaker.Commands.call("give @p gct_tcon:tinyplasmariumdust 1 0", player, player.world, false, true);
        }
    }   
};
plasmafusionTrait.register();

val abysscallingTrait = TraitBuilder.create("abysscalling");
abysscallingTrait.color = Color.fromHex("ffffff").getIntColor(); 
abysscallingTrait.localizedName = game.localize("greedycraft.tconstruct.tool_trait.abysscallingTrait.name");
abysscallingTrait.localizedDescription = game.localize("greedycraft.tconstruct.tool_trait.abysscallingTrait.desc");
abysscallingTrait.calcDamage = function(trait, tool, attacker, target, originalDamage, newDamage, isCritical) {
    val player as IPlayer = attacker;
    if (player.getDimension() < 56 && player.getDimension() > 49) {
        return newDamage * 1.5f;
    }
    return newDamage;
};
abysscallingTrait.register();
val abysscalling2Trait = TraitBuilder.create("abysscalling2");
abysscalling2Trait.color = Color.fromHex("ffffff").getIntColor(); 
abysscalling2Trait.localizedName = game.localize("greedycraft.tconstruct.tool_trait.abysscalling2Trait.name");
abysscalling2Trait.localizedDescription = game.localize("greedycraft.tconstruct.tool_trait.abysscallingTrait.desc");
abysscalling2Trait.calcDamage = function(trait, tool, attacker, target, originalDamage, newDamage, isCritical) {
    val player as IPlayer = attacker;
    if (player.getDimension() < 56 && player.getDimension() > 49) {
        return newDamage * 2.0f;
    }
    return newDamage;
};
abysscalling2Trait.register();

val elementfriendlyTrait = TraitBuilder.create("elementfriendly");
elementfriendlyTrait.color = Color.fromHex("ffffff").getIntColor(); 
elementfriendlyTrait.localizedName = game.localize("greedycraft.tconstruct.tool_trait.elementfriendlyTrait.name");
elementfriendlyTrait.localizedDescription = game.localize("greedycraft.tconstruct.tool_trait.elementfriendlyTrait.desc");
elementfriendlyTrait.calcDamage = function(trait, tool, attacker, target, originalDamage, newDamage, isCritical) {
    val player as IPlayer = attacker;
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
    return newDamage;
};
elementfriendlyTrait.register();

val dnaengineeringTrait = TraitBuilder.create("dnaengineering");
dnaengineeringTrait.color = Color.fromHex("ffffff").getIntColor();
dnaengineeringTrait.localizedName = game.localize("greedycraft.tconstruct.tool_trait.dnaengineeringTrait.name");
dnaengineeringTrait.localizedDescription = game.localize("greedycraft.tconstruct.tool_trait.dnaengineeringTrait.desc");
dnaengineeringTrait.calcDamage = function(trait, tool, attacker, target, originalDamage, newDamage, isCritical)  {
    var amp as float = 1.0f;
    if (target.isPotionActive(<potion:minecraft:speed>)) {
        amp = amp + 0.2f;
    }
    if (target.isPotionActive(<potion:minecraft:strength>)) {
        amp = amp + 0.2f;
    }
    if (target.isPotionActive(<potion:minecraft:regeneration>)) {
        amp = amp + 0.3f;
    }
    if (target.isPotionActive(<potion:minecraft:resistance>)) {
        amp = amp + 0.3f;
    }
    return newDamage * amp;
};
dnaengineeringTrait.register();

val starskyTrait = TraitBuilder.create("starsky");
starskyTrait.color = Color.fromHex("ffffff").getIntColor();
starskyTrait.localizedName = game.localize("greedycraft.tconstruct.tool_trait.starskyTrait.name");
starskyTrait.localizedDescription = game.localize("greedycraft.tconstruct.tool_trait.starskyTrait.desc");
starskyTrait.calcDamage = function(trait, tool, attacker, target, originalDamage, newDamage, isCritical)  {
    var y as double = attacker.getY();
    if (y <= 300) {
        return newDamage * (1 + y / 200);
    } else {
        return newDamage * 2.5f;
    }
};
starskyTrait.register();

val disappearingTrait = TraitBuilder.create("disappearing");
disappearingTrait.color = Color.fromHex("ffffff").getIntColor();
disappearingTrait.localizedName = game.localize("greedycraft.tconstruct.tool_trait.disappearingTrait.name");
disappearingTrait.localizedDescription = game.localize("greedycraft.tconstruct.tool_trait.disappearingTrait.desc");
disappearingTrait.onUpdate = function(trait, tool, world, owner, itemSlot, isSelected) {
    if (owner instanceof IEntityLivingBase) {
        var ownerBase as IEntityLivingBase = owner;
        if (isSelected) {
            ownerBase.addPotionEffect(<potion:minecraft:invisibility>.makePotionEffect(20, 0, false, false));
        } 
    }
};
disappearingTrait.register();

val twilighthand1Trait = TraitBuilder.create("twilight_hand1");
twilighthand1Trait.color = Color.fromHex("ffffff").getIntColor();
twilighthand1Trait.localizedName = game.localize("greedycraft.tconstruct.tool_trait.twilighthandTrait1.name");
twilighthand1Trait.localizedDescription = game.localize("greedycraft.tconstruct.tool_trait.twilighthandTrait.desc");
twilighthand1Trait.calcDamage = function(trait, tool, attacker, target, originalDamage, newDamage, isCritical) {
    if (attacker.getDimension() == 420||attacker.getDimension() == 421||attacker.getDimension() == 422||attacker.getDimension() == 423||attacker.getDimension() == 424) {
        return newDamage * 1.2f;
    }
    return newDamage;
};
twilighthand1Trait.register();

val twilighthand2Trait = TraitBuilder.create("twilight_hand2");
twilighthand2Trait.color = Color.fromHex("ffffff").getIntColor();
twilighthand2Trait.localizedName = game.localize("greedycraft.tconstruct.tool_trait.twilighthandTrait2.name");
twilighthand2Trait.localizedDescription = game.localize("greedycraft.tconstruct.tool_trait.twilighthandTrait.desc");
twilighthand2Trait.calcDamage = function(trait, tool, attacker, target, originalDamage, newDamage, isCritical) {
    if (attacker.getDimension() == 420||attacker.getDimension() == 421||attacker.getDimension() == 422||attacker.getDimension() == 423||attacker.getDimension() == 424) {
        return newDamage * 1.4f;
    }
    return newDamage;
};
twilighthand2Trait.register();

val twilighthand3Trait = TraitBuilder.create("twilight_hand3");
twilighthand3Trait.color = Color.fromHex("ffffff").getIntColor();
twilighthand3Trait.localizedName = game.localize("greedycraft.tconstruct.tool_trait.twilighthandTrait3.name");
twilighthand3Trait.localizedDescription = game.localize("greedycraft.tconstruct.tool_trait.twilighthandTrait.desc");
twilighthand3Trait.calcDamage = function(trait, tool, attacker, target, originalDamage, newDamage, isCritical) {
    if (attacker.getDimension() == 420||attacker.getDimension() == 421||attacker.getDimension() == 422||attacker.getDimension() == 423||attacker.getDimension() == 424) {
        return newDamage * 1.6f;
    }
    return newDamage;
};
twilighthand3Trait.register();

val twilighthand4Trait = TraitBuilder.create("twilight_hand4");
twilighthand4Trait.color = Color.fromHex("ffffff").getIntColor();
twilighthand4Trait.localizedName = game.localize("greedycraft.tconstruct.tool_trait.twilighthandTrait4.name");
twilighthand4Trait.localizedDescription = game.localize("greedycraft.tconstruct.tool_trait.twilighthandTrait.desc");
twilighthand4Trait.calcDamage = function(trait, tool, attacker, target, originalDamage, newDamage, isCritical) {
    if (attacker.getDimension() == 420||attacker.getDimension() == 421||attacker.getDimension() == 422||attacker.getDimension() == 423||attacker.getDimension() == 424) {
        return newDamage * 1.8f;
    }
    return newDamage;
};
twilighthand4Trait.register();

val twilighthand5Trait = TraitBuilder.create("twilight_hand5");
twilighthand5Trait.color = Color.fromHex("ffffff").getIntColor();
twilighthand5Trait.localizedName = game.localize("greedycraft.tconstruct.tool_trait.twilighthandTrait5.name");
twilighthand5Trait.localizedDescription = game.localize("greedycraft.tconstruct.tool_trait.twilighthandTrait.desc");
twilighthand5Trait.calcDamage = function(trait, tool, attacker, target, originalDamage, newDamage, isCritical) {
    if (attacker.getDimension() == 420||attacker.getDimension() == 421||attacker.getDimension() == 422||attacker.getDimension() == 423||attacker.getDimension() == 424) {
        return newDamage * 2.0f;
    }
    return newDamage;
};
twilighthand5Trait.register();

val worldendTrait = TraitBuilder.create("world_end");
worldendTrait.color = Color.fromHex("ffffff").getIntColor();
worldendTrait.localizedName = game.localize("greedycraft.tconstruct.tool_trait.worldendTrait.name");
worldendTrait.localizedDescription = game.localize("greedycraft.tconstruct.tool_trait.worldendTrait.desc");
worldendTrait.calcDamage = function(trait, tool, attacker, target, originalDamage, newDamage, isCritical) {
    target.addPotionEffect(<potion:gct_mobs:anti_anyposion>.makePotionEffect(20, 0, false, false));
    return newDamage;
};
worldendTrait.register();

val nightmareTrait = TraitBuilder.create("nightmare");
nightmareTrait.color = Color.fromHex("ffffff").getIntColor();
nightmareTrait.localizedName = game.localize("greedycraft.tconstruct.tool_trait.nightmareTrait.name");
nightmareTrait.localizedDescription = game.localize("greedycraft.tconstruct.tool_trait.nightmareTrait.desc");
nightmareTrait.calcDamage = function(trait, tool, attacker, target, originalDamage, newDamage, isCritical) {
    if (attacker.getDimension() == 427) {
        return newDamage + (target.maxHealth * 0.03f);
    }
    return newDamage;
};
nightmareTrait.register();

val strongmoonTrait = TraitBuilder.create("strong_moon");
strongmoonTrait.color = Color.fromHex("ffffff").getIntColor(); 
strongmoonTrait.localizedName = game.localize("greedycraft.tconstruct.tool_trait.strongmoonTrait.name");
strongmoonTrait.localizedDescription = game.localize("greedycraft.tconstruct.tool_trait.strongmoonTrait.desc");
strongmoonTrait.calcDamage = function(trait, tool, attacker, target, originalDamage, newDamage, isCritical){
        val player as IPlayer = attacker;
        if(player.world.isDayTime()==false){
                return newDamage * 2;
        }
                return newDamage / 2;
};
strongmoonTrait.register();

val aurorapowerTrait = TraitBuilder.create("aurora_power");
aurorapowerTrait.color = Color.fromHex("ffffff").getIntColor(); 
aurorapowerTrait.localizedName = game.localize("greedycraft.tconstruct.tool_trait.aurorapowerTrait.name");
aurorapowerTrait.localizedDescription = game.localize("greedycraft.tconstruct.tool_trait.aurorapowerTrait.desc");
aurorapowerTrait.calcDamage = function(trait, tool, attacker, target, originalDamage, newDamage, isCritical){
        var nowMoonPhase as int = attacker.world.getMoonPhase();
        if (attacker.getDimension() == 645){
                return newDamage * 2;
        }else if (nowMoonPhase >= 3 & !attacker.world.isDayTime()){
                return newDamage *(nowMoonPhase /2);
        }
        return newDamage;

};
aurorapowerTrait.register();

val foglightTrait = TraitBuilder.create("fog_light");
foglightTrait.color = Color.fromHex("ffffff").getIntColor();
foglightTrait.localizedName = game.localize("greedycraft.tconstruct.tool_trait.foglightTrait.name");
foglightTrait.localizedDescription = game.localize("greedycraft.tconstruct.tool_trait.foglightTrait.desc");
foglightTrait.onUpdate = function(trait, tool, world, owner, itemSlot, isSelected){
      if (owner instanceof IEntityLivingBase) {
        val player as IPlayer = owner;//\u6240\u6709\u5DE5\u5177\u57FA\u672C\u90FD\u9700\u8981\u58F0\u660E\u5BF9\u8C61\uFF0C
        if (isSelected){
              if (player.getDimension() == 69){
                if(player.getY() < 80 ){
                        player.addPotionEffect(<potion:minecraft:haste>.makePotionEffect(99, 2, false, false));
                }
        }
        }
      }
};
foglightTrait.register();

val soul_absorbTrait = TraitBuilder.create("soul_absorb");
soul_absorbTrait.color = Color.fromHex("76ff03").getIntColor(); 
soul_absorbTrait.localizedName = game.localize("greedycraft.tconstruct.tool_trait.soul_absorbTrait.name");
soul_absorbTrait.localizedDescription = game.localize("greedycraft.tconstruct.tool_trait.soul_absorbTrait.desc");
soul_absorbTrait.calcDamage = function(trait, tool, attacker, target, originalDamage, newDamage, isCritical) {
        val player as IPlayer = attacker;
          if(!player.world.remote && Math.random() < 0.5 && player.xp >= 30){
            player.xp -= 1;
            return newDamage * 2.5f;
          }
    return newDamage;
};
soul_absorbTrait.register();

val time_turnTrait = TraitBuilder.create("time_turn");
time_turnTrait.color = Color.fromHex("76ff03").getIntColor(); 
time_turnTrait.localizedName = game.localize("greedycraft.tconstruct.tool_trait.time_turnTrait.name");
time_turnTrait.localizedDescription = game.localize("greedycraft.tconstruct.tool_trait.time_turnTrait.desc");
time_turnTrait.calcDamage = function(trait, tool, attacker, target, originalDamage, newDamage, isCritical) {
        val player as IPlayer = attacker;
        if(Math.random()< 0.02){
            mods.contenttweaker.Commands.call("time add 12000",player,player.world,false,true);
        }
    return newDamage;
};
time_turnTrait.register();

val ignitingTrait = TraitBuilder.create("igniting");
ignitingTrait.color = Color.fromHex("76ff03").getIntColor(); 
ignitingTrait.localizedName = game.localize("greedycraft.tconstruct.tool_trait.ignitingTrait.name");
ignitingTrait.localizedDescription = game.localize("greedycraft.tconstruct.tool_trait.ignitingTrait.desc");
ignitingTrait.calcDamage = function(trait, tool, attacker, target, originalDamage, newDamage, isCritical) {
        var entity as IEntityLivingBase = target;
        if(entity.isBurning){
            entity.setFire(15);
            return newDamage * 1.2f;
        }
    return newDamage;
};
ignitingTrait.register();

val freezedTrait = TraitBuilder.create("freezed");
freezedTrait.color = Color.fromHex("76ff03").getIntColor(); 
freezedTrait.localizedName = game.localize("greedycraft.tconstruct.tool_trait.freezedTrait.name");
freezedTrait.localizedDescription = game.localize("greedycraft.tconstruct.tool_trait.freezedTrait.desc");
freezedTrait.calcDamage = function(trait, tool, attacker, target, originalDamage, newDamage, isCritical) {
    val entity as IEntityLivingBase = target;
        entity.addPotionEffect(<potion:minecraft:slowness>.makePotionEffect(60, 3, false, false));
    return newDamage;
};
freezedTrait.register();

val demon_hunterTrait = TraitBuilder.create("demon_hunter");
demon_hunterTrait.color = Color.fromHex("76ff03").getIntColor(); 
demon_hunterTrait.localizedName = game.localize("greedycraft.tconstruct.tool_trait.demon_hunterTrait.name");
demon_hunterTrait.localizedDescription = game.localize("greedycraft.tconstruct.tool_trait.demon_hunterTrait.desc");
demon_hunterTrait.calcDamage = function(trait, tool, attacker, target, originalDamage, newDamage, isCritical) {
        val player as IEntityLivingBase=target;
        if(player.isBoss){
            player.addPotionEffect(<potion:minecraft:slowness>.makePotionEffect(60, 2, false, false));
            return newDamage *1.5;
        }
    return newDamage;
};
demon_hunterTrait.register();

val self_poisonTrait = TraitBuilder.create("self_poison");
self_poisonTrait.color = Color.fromHex("76ff03").getIntColor(); 
self_poisonTrait.localizedName = game.localize("greedycraft.tconstruct.tool_trait.self_poisonTrait.name");
self_poisonTrait.localizedDescription = game.localize("greedycraft.tconstruct.tool_trait.self_poisonTrait.desc");
self_poisonTrait.calcDamage = function(trait, tool, attacker, target, originalDamage, newDamage, isCritical) {
    val entity as IEntityLivingBase = target;
    val player as IPlayer = attacker;
    if(Math.random() < 0.1){
        entity.addPotionEffect(<potion:minecraft:wither>.makePotionEffect(200, 1, false, false));
    }
    if(Math.random() < 0.04){
        player.addPotionEffect(<potion:minecraft:wither>.makePotionEffect(100, 1, false, false));
    }
    return newDamage;
};
self_poisonTrait.register();

val babTrait = TraitBuilder.create("battle_and_braver");
babTrait.color = Color.fromHex("ffffff").getIntColor(); 
babTrait.localizedName = game.localize("greedycraft.tconstruct.tool_trait.battle_and_braverTrait.name");
babTrait.localizedDescription = game.localize("greedycraft.tconstruct.tool_trait.battle_and_braverTrait.desc");
babTrait.onHit = function(trait, tool, attacker, target, damage, isCritical) {
    if (attacker instanceof IPlayer) {
        val player as IPlayer = attacker;
        var level = 1.0 as double;
        if (player.isPotionActive(<potion:minecraft:strength>)) {
            level += (player.getActivePotionEffect(<potion:minecraft:strength>).amplifier) + 1;
        }
        if (Math.random() < (1.0 / level)) {
            player.addPotionEffect(<potion:minecraft:strength>.makePotionEffect(60, level - 1, false, false));
        }
    }
};
babTrait.register();

val alkalinityTrait = TraitBuilder.create("alkalinity");
alkalinityTrait.color = Color.fromHex("ffffff").getIntColor(); 
alkalinityTrait.localizedName = game.localize("greedycraft.tconstruct.tool_trait.alkalinityTrait.name");
alkalinityTrait.localizedDescription = game.localize("greedycraft.tconstruct.tool_trait.alkalinityTrait.desc");
alkalinityTrait.onHit = function(trait, tool, attacker, target, damage, isCritical) {
    if (Math.random() < 0.2) {
        target.addPotionEffect(<potion:gct_tcon:alkalinity>.makePotionEffect(200, 0, false, false));
    }
};
alkalinityTrait.register();

val acidityTrait = TraitBuilder.create("acidity");
acidityTrait.color = Color.fromHex("ffffff").getIntColor(); 
acidityTrait.localizedName = game.localize("greedycraft.tconstruct.tool_trait.acidityTrait.name");
acidityTrait.localizedDescription = game.localize("greedycraft.tconstruct.tool_trait.acidityTrait.desc");
acidityTrait.onHit = function(trait, tool, attacker, target, damage, isCritical) {
    if (Math.random() < 0.2) {
        target.addPotionEffect(<potion:gct_tcon:acidity>.makePotionEffect(200, 0, false, false));
    }
};
acidityTrait.register();

val packlightTrait = TraitBuilder.create("pack_light");
packlightTrait.color = Color.fromHex("ffffff").getIntColor(); 
packlightTrait.localizedName = game.localize("greedycraft.tconstruct.tool_trait.packlightTrait.name");
packlightTrait.localizedDescription = game.localize("greedycraft.tconstruct.tool_trait.packlightTrait.desc");
packlightTrait.calcDamage = function(trait, tool, attacker, target, originalDamage, newDamage, isCritical) {
    if (attacker instanceof IPlayer) {
        val player as IPlayer = attacker;
        if (player.totalArmorValue <= 20) {
            return newDamage * 1.8f;
        }
        if (player.totalArmorValue >= 180) {
            return newDamage * 0.2f;
        }
        return newDamage * (1.0f + ((100.0f - player.totalArmorValue) / 100.0f));
    }
    return newDamage;
};
packlightTrait.register();

val luxuryTrait = TraitBuilder.create("luxury");
luxuryTrait.color = Color.fromHex("ffffff").getIntColor(); 
luxuryTrait.localizedName = game.localize("greedycraft.tconstruct.tool_trait.luxuryTrait.name");
luxuryTrait.localizedDescription = game.localize("greedycraft.tconstruct.tool_trait.luxuryTrait.desc");
luxuryTrait.onHit = function(trait, tool, attacker, target, damage, isCritical) {
    if (attacker instanceof IPlayer) {
        val player as IPlayer = attacker;
        if (Math.random() < 0.03) {
            mods.contenttweaker.Commands.call("give @p minecraft:gold_ingot 1 0", player, player.world, false, true);
        }
    }
};
luxuryTrait.onBlockHarvestDrops = function(trait, tool, event) {
    val player as IPlayer = event.player;
    if (Math.random() < 0.001) {
        mods.contenttweaker.Commands.call("give @p minecraft:gold_ingot 1 0", player, player.world, false, true);
    }
};
luxuryTrait.register();

val spsTrait = TraitBuilder.create("superposition_state");
spsTrait.color = Color.fromHex("ffffff").getIntColor(); 
spsTrait.localizedName = game.localize("greedycraft.tconstruct.tool_trait.superposition_stateTrait.name");
spsTrait.localizedDescription = game.localize("greedycraft.tconstruct.tool_trait.superposition_stateTrait.desc");
spsTrait.calcDamage = function(trait, tool, attacker, target, originalDamage, newDamage, isCritical) {
    if (attacker instanceof IPlayer) {
        val player as IPlayer = attacker;
        if (player.isPotionActive(<potion:gct_tcon:superposition>)) {
            if (player.getActivePotionEffect(<potion:gct_tcon:superposition>).amplifier <= 3) {
                var level = player.getActivePotionEffect(<potion:gct_tcon:superposition>).amplifier;
                player.addPotionEffect(<potion:gct_tcon:superposition>.makePotionEffect(40, level + 1, false, false));
                return newDamage * (0.7f + 0.2f * level);
            } else if (player.getActivePotionEffect(<potion:gct_tcon:superposition>).amplifier >= 4) {
                player.addPotionEffect(<potion:gct_tcon:superposition>.makePotionEffect(40, 4, false, false));
                return newDamage * 1.5f;
            }
            return newDamage;
        } else {
            player.addPotionEffect(<potion:gct_tcon:superposition>.makePotionEffect(40, 0, false, false));
            return newDamage * 0.5f;
        }
        return newDamage;
    }
    return newDamage;
};
spsTrait.register();

val strong_shockTrait = TraitBuilder.create("strong_shock");
strong_shockTrait.color = Color.fromHex("ffffff").getIntColor(); 
strong_shockTrait.localizedName = game.localize("greedycraft.tconstruct.tool_trait.strong_shockTrait.name");
strong_shockTrait.localizedDescription = game.localize("greedycraft.tconstruct.tool_trait.strong_shockTrait.desc");
strong_shockTrait.onUpdate = function(trait, tool, world, owner, itemSlot, isSelected){
    if (owner instanceof IEntityLivingBase) {
        val player as IPlayer = owner;
        if (isSelected) {
            if (!(player.isPotionActive(<potion:gct_tcon:shock>))) {
                if (Math.random() < 0.003) {
                    player.addPotionEffect(<potion:gct_tcon:shock>.makePotionEffect(200, 0, false, false));
                }
            } else {
                player.addPotionEffect(<potion:gct_tcon:shock>.makePotionEffect(200, 0, false, false));
            }
        }
    }
};
strong_shockTrait.calcDamage = function(trait, tool, attacker, target, originalDamage, newDamage, isCritical) {
    if (attacker instanceof IPlayer) {
        val player as IPlayer = attacker;
        if (player.isPotionActive(<potion:gct_tcon:shock>)) {
            player.removePotionEffect(<potion:gct_tcon:shock>);
            return newDamage * 2.75f;
        }
        return newDamage;
    }
    return newDamage;
};
strong_shockTrait.onBlockHarvestDrops = function(trait, tool, event) {
    val player as IPlayer = event.player;
    if (player.isPotionActive(<potion:gct_tcon:shock>)) {
        player.removePotionEffect(<potion:gct_tcon:shock>);
        player.addPotionEffect(<potion:minecraft:haste>.makePotionEffect(100, 4, false, false));
    }
};
strong_shockTrait.register();

for i in 2 to 11 {
    TraitBuilder.create("lighting" + i).color = Color.fromHex("ffffff").getIntColor(); 
    TraitBuilder.create("lighting" + i).localizedName = game.localize("greedycraft.tconstruct.tool_trait.lightingTrait" + i + ".name");
    TraitBuilder.create("lighting" + i).localizedDescription = game.localize("greedycraft.tconstruct.tool_trait.lightingTrait.desc");
    TraitBuilder.create("lighting" + i).calcDamage = function(trait, tool, attacker, target, originalDamage, newDamage, isCritical) {
        val player as IPlayer = attacker;
        if (player.getDimension() < 830 && player.getDimension() > 819) {
            var amp = (1 + 2 * (Math.log(i) / Math.log(10))) as float;
            return newDamage * amp;
        }
        return newDamage;
    };
    TraitBuilder.create("lighting" + i).register();
}

val active_sourceTrait = TraitBuilder.create("active_source");
active_sourceTrait.color = Color.fromHex("ffffff").getIntColor(); 
active_sourceTrait.localizedName = game.localize("greedycraft.tconstruct.tool_trait.active_sourceTrait.name");
active_sourceTrait.localizedDescription = game.localize("greedycraft.tconstruct.tool_trait.active_sourceTrait.desc");
active_sourceTrait.onUpdate = function(thisTrait, tool, world, entity, itemSlot, isSelected) {
    if (entity instanceof IPlayer) {
        val player as IPlayer = entity;
        var slowdown as float = 1.0f;
        if (CotTicTraitLib.hasTicTrait(tool, "slowdown")) {
            slowdown = 0.5f;
        }
        player.addRadiation(0.00000012d * 1 * slowdown as double, true);
    }
};
active_sourceTrait.register();
val active_source2Trait = TraitBuilder.create("active_source2");
active_source2Trait.color = Color.fromHex("ffffff").getIntColor(); 
active_source2Trait.localizedName = game.localize("greedycraft.tconstruct.tool_trait.active_source2Trait.name");
active_source2Trait.localizedDescription = game.localize("greedycraft.tconstruct.tool_trait.active_sourceTrait.desc");
active_source2Trait.onUpdate = function(thisTrait, tool, world, entity, itemSlot, isSelected) {
    if (entity instanceof IPlayer) {
        val player as IPlayer = entity;
        var slowdown as float = 1.0f;
        if (CotTicTraitLib.hasTicTrait(tool, "slowdown")) {
            slowdown = 0.5f;
        }
        player.addRadiation(0.00000012d * 20 * slowdown as double, true);
    }
};
active_source2Trait.register();
val active_source3Trait = TraitBuilder.create("active_source3");
active_source3Trait.color = Color.fromHex("ffffff").getIntColor(); 
active_source3Trait.localizedName = game.localize("greedycraft.tconstruct.tool_trait.active_source3Trait.name");
active_source3Trait.localizedDescription = game.localize("greedycraft.tconstruct.tool_trait.active_sourceTrait.desc");
active_source3Trait.onUpdate = function(thisTrait, tool, world, entity, itemSlot, isSelected) {
    if (entity instanceof IPlayer) {
        val player as IPlayer = entity;
        var slowdown as float = 1.0f;
        if (CotTicTraitLib.hasTicTrait(tool, "slowdown")) {
            slowdown = 0.5f;
        }
        player.addRadiation(0.00000012d * 400 * slowdown as double, true);
    }
};
active_source3Trait.register();
val active_source4Trait = TraitBuilder.create("active_source4");
active_source4Trait.color = Color.fromHex("ffffff").getIntColor(); 
active_source4Trait.localizedName = game.localize("greedycraft.tconstruct.tool_trait.active_source4Trait.name");
active_source4Trait.localizedDescription = game.localize("greedycraft.tconstruct.tool_trait.active_sourceTrait.desc");
active_source4Trait.onUpdate = function(thisTrait, tool, world, entity, itemSlot, isSelected) {
    if (entity instanceof IPlayer) {
        val player as IPlayer = entity;
        var slowdown as float = 1.0f;
        if (CotTicTraitLib.hasTicTrait(tool, "slowdown")) {
            slowdown = 0.5f;
        }
        player.addRadiation(0.00000012d * 8000 * slowdown as double, true);
    }
};
active_source4Trait.register();
val active_source5Trait = TraitBuilder.create("active_source5");
active_source5Trait.color = Color.fromHex("ffffff").getIntColor(); 
active_source5Trait.localizedName = game.localize("greedycraft.tconstruct.tool_trait.active_source5Trait.name");
active_source5Trait.localizedDescription = game.localize("greedycraft.tconstruct.tool_trait.active_sourceTrait.desc");
active_source5Trait.onUpdate = function(thisTrait, tool, world, entity, itemSlot, isSelected) {
    if (entity instanceof IPlayer) {
        val player as IPlayer = entity;
        var slowdown as float = 1.0f;
        if (CotTicTraitLib.hasTicTrait(tool, "slowdown")) {
            slowdown = 0.5f;
        }
        player.addRadiation(0.00000012d * 160000 * slowdown as double, true);
    }
};
active_source5Trait.register();
val active_source6Trait = TraitBuilder.create("active_source6");
active_source6Trait.color = Color.fromHex("ffffff").getIntColor(); 
active_source6Trait.localizedName = game.localize("greedycraft.tconstruct.tool_trait.active_source6Trait.name");
active_source6Trait.localizedDescription = game.localize("greedycraft.tconstruct.tool_trait.active_sourceTrait.desc");
active_source6Trait.onUpdate = function(thisTrait, tool, world, entity, itemSlot, isSelected) {
    if (entity instanceof IPlayer) {
        val player as IPlayer = entity;
        var slowdown as float = 1.0f;
        if (CotTicTraitLib.hasTicTrait(tool, "slowdown")) {
            slowdown = 0.5f;
        }
        player.addRadiation(0.00000012d * 3200000 * slowdown as double, true);
    }
};
active_source6Trait.register();

val moronismTrait = TraitBuilder.create("moronism");
moronismTrait.color = Color.fromHex("ffffff").getIntColor(); 
moronismTrait.localizedName = game.localize("greedycraft.tconstruct.tool_trait.moronismTrait.name");
moronismTrait.localizedDescription = game.localize("greedycraft.tconstruct.tool_trait.moronismTrait.desc");
moronismTrait.onHit = function(trait, tool, attacker, target, damage, isCritical) {
    if (attacker instanceof IPlayer) {
        val player as IPlayer = attacker;
        if (Math.random() < 0.2) {
            target.addPotionEffect(<potion:gct_aby:abyssplague>.makePotionEffect(40, 0, false, false));
            target.addPotionEffect(<potion:potioncore:spin>.makePotionEffect(80, 0, false, false));
        }
        if (Math.random() < 0.05) {
            player.addPotionEffect(<potion:gct_aby:abyssplague>.makePotionEffect(40, 0, false, false));
        }
    }
};
moronismTrait.register();

val thousandfaceTrait = TraitBuilder.create("thousand_face");
thousandfaceTrait.color = Color.fromHex("ffffff").getIntColor(); 
thousandfaceTrait.localizedName = game.localize("greedycraft.tconstruct.tool_trait.thousandfaceTrait.name");
thousandfaceTrait.localizedDescription = game.localize("greedycraft.tconstruct.tool_trait.thousandfaceTrait.desc");
thousandfaceTrait.calcDamage = function(trait, tool, attacker, target, originalDamage, newDamage, isCritical) {
    if (attacker instanceof IPlayer) {
        val player as IPlayer = attacker;
        return newDamage * (Math.random() + 0.5f);
    }
    return newDamage;
};
thousandfaceTrait.register();

val timeattackTrait = TraitBuilder.create("time_attack");
timeattackTrait.color = Color.fromHex("ffffff").getIntColor(); 
timeattackTrait.localizedName = game.localize("greedycraft.tconstruct.tool_trait.timeattackTrait.name");
timeattackTrait.localizedDescription = game.localize("greedycraft.tconstruct.tool_trait.timeattackTrait.desc");
timeattackTrait.calcDamage = function(trait, tool, attacker, target, originalDamage, newDamage, isCritical) {
    if (attacker instanceof IPlayer) {
        var mtp = (attacker.world.getWorldTime() % 240000) / 133333.0d;
        return newDamage * mtp;
    }
    return newDamage;
};
timeattackTrait.register();

val shubTrait = TraitBuilder.create("shub");
shubTrait.color = Color.fromHex("ffffff").getIntColor(); 
shubTrait.localizedName = game.localize("greedycraft.tconstruct.tool_trait.shubTrait.name");
shubTrait.localizedDescription = game.localize("greedycraft.tconstruct.tool_trait.shubTrait.desc");
shubTrait.afterHit = function(trait, tool, attacker, target, damageDealt, wasCritical, wasHit) {
    if (attacker instanceof IPlayer) {
        if (!(target instanceof IPlayer)) {
            if (Math.random() < 0.2) {
                if (target.health <= (target.maxHealth * 0.2f)) {
                    if (target.isBoss == false) {
                        target.setDead();
                        val player as IPlayer = attacker;
                        mods.contenttweaker.Commands.call("give @p minecraft:wool 2 15", player, player.world, false, true);
                    }
                }
            }
        }
    }
};
shubTrait.register();

val IAmetalTrait = TraitBuilder.create("ia_metals");
IAmetalTrait.color = Color.fromHex("ffffff").getIntColor(); 
IAmetalTrait.localizedName = game.localize("greedycraft.tconstruct.tool_trait.IAmetalTrait.name");
IAmetalTrait.localizedDescription = game.localize("greedycraft.tconstruct.tool_trait.IAmetalTrait.desc");
IAmetalTrait.calcDamage = function(trait, tool, attacker, target, originalDamage, newDamage, isCritical) {
    if (attacker instanceof IPlayer) {
        if (target.isInWater) {
            if (attacker.isInWater) {
                return newDamage * 0.8f;
            } else {
                return newDamage * 1.3f;
            }
            return newDamage;
        }
        return newDamage;
    }
    return newDamage;
};
IAmetalTrait.register();

val IAmetal2Trait = TraitBuilder.create("ia_metals2");
IAmetal2Trait.color = Color.fromHex("ffffff").getIntColor(); 
IAmetal2Trait.localizedName = game.localize("greedycraft.tconstruct.tool_trait.IAmetalTrait2.name");
IAmetal2Trait.localizedDescription = game.localize("greedycraft.tconstruct.tool_trait.IAmetalTrait.desc");
IAmetal2Trait.calcDamage = function(trait, tool, attacker, target, originalDamage, newDamage, isCritical) {
    if (attacker instanceof IPlayer) {
        if (target.isInWater) {
            if (attacker.isInWater) {
                return newDamage * 0.6f;
            } else {
                return newDamage * 1.8f;
            }
            return newDamage;
        }
        return newDamage;
    }
    return newDamage;
};
IAmetal2Trait.register();

val naturalrefinerTrait = TraitBuilder.create("natural_refiner");
naturalrefinerTrait.color = Color.fromHex("ffffff").getIntColor(); 
naturalrefinerTrait.localizedName = game.localize("greedycraft.tconstruct.tool_trait.naturalrefinerTrait.name");
naturalrefinerTrait.localizedDescription = game.localize("greedycraft.tconstruct.tool_trait.naturalrefinerTrait.desc");
naturalrefinerTrait.onBlockHarvestDrops = function(trait, tool, event) {
    if (event.block.definition.id == "gct_mobs:botanical_stone") {
        mods.contenttweaker.Commands.call("give @p gct_mobs:botanical_soul 1 0", event.player, event.player.world, false, true);
        event.drops = [];
    }
};
naturalrefinerTrait.register();

val light_discoveryTrait = TraitBuilder.create("light_discovery");
light_discoveryTrait.color = Color.fromHex("ffffff").getIntColor(); 
light_discoveryTrait.localizedName = game.localize("greedycraft.tconstruct.tool_trait.light_discoveryTrait.name");
light_discoveryTrait.localizedDescription = game.localize("greedycraft.tconstruct.tool_trait.light_discoveryTrait.desc");
light_discoveryTrait.afterHit = function(trait, tool, attacker, target, damageDealt, wasCritical, wasHit) {
    val player as IPlayer = attacker;
    if(Math.random() < 0.15){
        for entity in player.world.getEntitiesInArea(crafttweaker.util.Position3f.create(((player.x)- 32),((player.y)- 32),((player.z)- 32)),crafttweaker.util.Position3f.create(((player.x)+ 32),((player.y)+ 32),((player.z)+ 32))){
    if(entity instanceof IEntityLivingBase && !entity instanceof IPlayer){
        val en as IEntityLivingBase = entity;
        en.addPotionEffect(<potion:minecraft:glowing>.makePotionEffect(600, 0, false, false));
        }
    }
    }
};
light_discoveryTrait.register();

val curseflameTrait = TraitBuilder.create("curseflame");
curseflameTrait.color = Color.fromHex("ffffff").getIntColor(); 
curseflameTrait.localizedName = game.localize("greedycraft.tconstruct.tool_trait.curseflameTrait.name");
curseflameTrait.localizedDescription = game.localize("greedycraft.tconstruct.tool_trait.curseflameTrait.desc");
curseflameTrait.afterHit = function(trait, tool, attacker, target, damageDealt, wasCritical, wasHit) {
    if(Math.random() < 0.1){
        target.addPotionEffect(<potion:biomesoplenty:curse>.makePotionEffect(100, 0, false, false));
    }
};
curseflameTrait.register();

val swallow_soulTrait = TraitBuilder.create("swallow_soul");
swallow_soulTrait.color = Color.fromHex("ffffff").getIntColor(); 
swallow_soulTrait.localizedName = game.localize("greedycraft.tconstruct.tool_trait.swallow_soulTrait.name");
swallow_soulTrait.localizedDescription = game.localize("greedycraft.tconstruct.tool_trait.swallow_soulTrait.desc");
swallow_soulTrait.afterHit = function(trait, tool, attacker, target, damageDealt, wasCritical, wasHit) {
    val player as IPlayer = attacker;
    player.world.drainVis(player.position,5,false);
};
swallow_soulTrait.register();

val below_heavenTrait = TraitBuilder.create("below_heaven");
below_heavenTrait.color = Color.fromHex("ffffff").getIntColor(); 
below_heavenTrait.localizedName = game.localize("greedycraft.tconstruct.tool_trait.below_heavenTrait.name");
below_heavenTrait.localizedDescription = game.localize("greedycraft.tconstruct.tool_trait.below_heavenTrait.desc");
below_heavenTrait.calcDamage = function(trait, tool, attacker, target, originalDamage, newDamage, isCritical) {
    val player as IPlayer = attacker;
    if(player.world.getDimensionType() != "cave"){
        if(player.getY() > 64){
            if (isCritical) {
        return newDamage * 3.0f;
    }
        }else if(player.getY() < 24 ){
            player.addPotionEffect(<potion:minecraft:mining_fatigue>.makePotionEffect(100, 1, false, false));
            return newDamage;
        }
    }else if(player.world.getDimensionType() == "cave"){
        if(player.getY() > 128){
            if (isCritical) {
        return newDamage * 3.0f;
    }
        }else if(player.getY() < 64 ){
            player.addPotionEffect(<potion:minecraft:mining_fatigue>.makePotionEffect(100, 1, false, false));
            return newDamage;
        }
    }
    return newDamage;
};
below_heavenTrait.register();

val antidropTrait = TraitBuilder.create("antidrop");
antidropTrait.color = Color.fromHex("ffffff").getIntColor(); 
antidropTrait.localizedName = game.localize("greedycraft.tconstruct.tool_trait.antidropTrait.name");
antidropTrait.localizedDescription = game.localize("greedycraft.tconstruct.tool_trait.antidropTrait.desc");
antidropTrait.onBlockHarvestDrops = function(thisTrait, tool, event) {
    if(Math.random() < 0.8){
        event.dropChance = 0;
    }
};
antidropTrait.register();

val ghostyTrait = TraitBuilder.create("ghosty");
ghostyTrait.color = Color.fromHex("ffffff").getIntColor(); 
ghostyTrait.localizedName = game.localize("greedycraft.tconstruct.tool_trait.ghostyTrait.name");
ghostyTrait.localizedDescription = game.localize("greedycraft.tconstruct.tool_trait.ghostyTrait.desc");
ghostyTrait.afterHit = function(trait, tool, attacker, target, damageDealt, wasCritical, wasHit) {
    val entity as IEntityLivingBase = target;
    entity.addPotionEffect(<potion:minecraft:wither>.makePotionEffect(100, 4, false, false));
};
ghostyTrait.onUpdate = function(thisTrait, tool, world, entity, itemSlot, isSelected) {
    if(!isSelected){
        if(Math.random() < 0.05){
            val player as IPlayer = entity;
            player.health= player.health-player.health*0.02f;
        }
    }
};
ghostyTrait.register();

val woundedTrait = TraitBuilder.create("wounded");
woundedTrait.color = Color.fromHex("ffffff").getIntColor(); 
woundedTrait.localizedName = game.localize("greedycraft.tconstruct.tool_trait.woundedTrait.name");
woundedTrait.localizedDescription = game.localize("greedycraft.tconstruct.tool_trait.woundedTrait.desc");
woundedTrait.calcDamage = function(trait, tool, attacker, target, originalDamage, newDamage, isCritical) {
    if(isCritical){
        val entity as IEntityLivingBase = target;
        entity.addPotionEffect(<potion:minecraft:slowness>.makePotionEffect(60, 126, false, false));
        return newDamage * 0.6f;
    }
    return newDamage;
};
woundedTrait.register();

val cutawayTrait = TraitBuilder.create("cutaway");
cutawayTrait.color = Color.fromHex("ffffff").getIntColor(); 
cutawayTrait.localizedName = game.localize("greedycraft.tconstruct.tool_trait.cutawayTrait.name");
cutawayTrait.localizedDescription = game.localize("greedycraft.tconstruct.tool_trait.cutawayTrait.desc");
cutawayTrait.afterHit = function(trait, tool, attacker, target, damageDealt, wasCritical, wasHit) {
    if(Math.random() < 0.01){
        if (Math.random() < 0.01) {
            val player as IPlayer = attacker;
            player.setDimension(426);
        }
    }
};
cutawayTrait.register();

val artTrait = TraitBuilder.create("arty");
artTrait.color = Color.fromHex("5d4037").getIntColor(); 
artTrait.localizedName = game.localize("greedycraft.tconstruct.tool_trait.artTrait.name");
artTrait.localizedDescription = game.localize("greedycraft.tconstruct.tool_trait.artTrait.desc");
artTrait.onHit = function(trait, tool, attacker, target, damage, isCritical) {
    if (attacker instanceof IPlayer && target instanceof IEntityMob) {
        if (Math.random() < 0.1) {
            val player as IPlayer = attacker;
            if(Math.random() < 0.0625){
            player.give(itemUtils.getItem("botania:petal"));
            }else if(Math.random() < 0.0625){
                player.give(itemUtils.getItem("botania:petal:1"));
            }else if(Math.random() < 0.0625){
                player.give(itemUtils.getItem("botania:petal:2"));
            }else if(Math.random() < 0.0625){
                player.give(itemUtils.getItem("botania:petal:3"));
            }else if(Math.random() < 0.0625){
                player.give(itemUtils.getItem("botania:petal:4"));
            }else if(Math.random() < 0.0625){
                player.give(itemUtils.getItem("botania:petal:5"));
            }else if(Math.random() < 0.0625){
                player.give(itemUtils.getItem("botania:petal:6"));
            }else if(Math.random() < 0.0625){
                player.give(itemUtils.getItem("botania:petal:7"));
            }else if(Math.random() < 0.0625){
                player.give(itemUtils.getItem("botania:petal:8"));
            }else if(Math.random() < 0.0625){
                player.give(itemUtils.getItem("botania:petal:9"));
            }else if(Math.random() < 0.0625){
                player.give(itemUtils.getItem("botania:petal:10"));
            }else if(Math.random() < 0.0625){
                player.give(itemUtils.getItem("botania:petal:11"));
            }else if(Math.random() < 0.0625){
                player.give(itemUtils.getItem("botania:petal:12"));
            }else if(Math.random() < 0.0625){
                player.give(itemUtils.getItem("botania:petal:13"));
            }else if(Math.random() < 0.0625){
                player.give(itemUtils.getItem("botania:petal:14"));
            }else{
                player.give(itemUtils.getItem("botania:petal:15"));
            }
        }
    }
};
artTrait.register();

val cooperationTrait = TraitBuilder.create("cooperation");
cooperationTrait.color = Color.fromHex("5d4037").getIntColor(); 
cooperationTrait.localizedName = game.localize("greedycraft.tconstruct.tool_trait.cooperationTrait.name");
cooperationTrait.localizedDescription = game.localize("greedycraft.tconstruct.tool_trait.cooperationTrait.desc");
cooperationTrait.onUpdate = function(thisTrait, tool, world, entity, itemSlot, isSelected) {
    if (entity instanceof IPlayer) {
        val player as IPlayer = entity;
        if (isSelected) {
            player.addPotionEffect(<potion:gct_tcon:cooperation_1>.makePotionEffect(20, 0, false, false));
        }
        if (player.isPotionActive(<potion:gct_tcon:cooperation_1>) && player.isPotionActive(<potion:gct_tcon:cooperation_2>)) {
            player.addPotionEffect(<potion:minecraft:strength>.makePotionEffect(20, 4, false, false));
        }
    }
};
cooperationTrait.register();

val lucklessTrait = TraitBuilder.create("luckless");
lucklessTrait.color = Color.fromHex("5d4037").getIntColor(); 
lucklessTrait.localizedName = game.localize("greedycraft.tconstruct.tool_trait.lucklessTrait.name");
lucklessTrait.localizedDescription = game.localize("greedycraft.tconstruct.tool_trait.lucklessTrait.desc");
lucklessTrait.onHit = function(trait, tool, attacker, target, damage, isCritical) {
    if (attacker instanceof IPlayer && target instanceof IEntityMob) {
        if (Math.random() < 0.05) {
            val player as IPlayer = attacker;
            player.addPotionEffect(<potion:potioncore:chance>.makePotionEffect(1, 0, false, false));
        }
    }
};
lucklessTrait.register();

val trapTrait = TraitBuilder.create("trap");
trapTrait.color = Color.fromHex("ffffff").getIntColor(); 
trapTrait.localizedName = game.localize("greedycraft.tconstruct.tool_trait.trapTrait.name");
trapTrait.localizedDescription = game.localize("greedycraft.tconstruct.tool_trait.trapTrait.desc");
trapTrait.afterHit = function(trait, tool, attacker, target, damageDealt, wasCritical, wasHit)  {
        val entity as IEntityLivingBase = target;
        if(Math.random() < 0.02){
        entity.addPotionEffect(<potion:gct_aby:stop>.makePotionEffect(100, 0, false, false));
        }
};
trapTrait.register();

val make_believeTrait = TraitBuilder.create("make_believe");
make_believeTrait.color = Color.fromHex("ffffff").getIntColor(); 
make_believeTrait.localizedName = game.localize("greedycraft.tconstruct.tool_trait.make_believeTrait.name");
make_believeTrait.localizedDescription = game.localize("greedycraft.tconstruct.tool_trait.make_believeTrait.desc");
make_believeTrait.calcDamage = function(trait, tool, attacker, target, originalDamage, newDamage, isCritical) {
    if(Math.random() < 0.3){
        return newDamage * 0.1f;
    }
    return newDamage;
};
make_believeTrait.register();

val pain_hitTrait = TraitBuilder.create("pain_hit");
pain_hitTrait.color = Color.fromHex("ffffff").getIntColor(); 
pain_hitTrait.localizedName = game.localize("greedycraft.tconstruct.tool_trait.pain_hitTrait.name");
pain_hitTrait.localizedDescription = game.localize("greedycraft.tconstruct.tool_trait.pain_hitTrait.desc");
pain_hitTrait.calcDamage = function(trait, tool, attacker, target, originalDamage, newDamage, isCritical) {
    attacker.health -= (originalDamage * 0.15f);
    return newDamage + originalDamage * 1.0f;
};
pain_hitTrait.register();

val extinctionTrait = TraitBuilder.create("extinction");
extinctionTrait.color = Color.fromHex("ffffff").getIntColor(); 
extinctionTrait.localizedName = game.localize("greedycraft.tconstruct.tool_trait.extinctionTrait.name");
extinctionTrait.localizedDescription = game.localize("greedycraft.tconstruct.tool_trait.extinctionTrait.desc");
extinctionTrait.calcDamage = function(trait, tool, attacker, target, originalDamage, newDamage, isCritical) {
    val entity as IEntityLivingBase = target;
    var x = entity.health * (0.03f + Math.random() * 0.02f) as float;
    return newDamage + x;
};
extinctionTrait.register();

val cutdownTrait = TraitBuilder.create("cutdown");
cutdownTrait.color = Color.fromHex("ffffff").getIntColor(); 
cutdownTrait.localizedName = game.localize("greedycraft.tconstruct.tool_trait.cutdownTrait.name");
cutdownTrait.localizedDescription = game.localize("greedycraft.tconstruct.tool_trait.cutdownTrait.desc");
cutdownTrait.afterHit = function(trait, tool, attacker, target, damageDealt, wasCritical, wasHit) {
    val entity as IEntityLivingBase = target;
    if(Math.random() < 0.03){
        entity.addPotionEffect(<potion:minecraft:slowness>.makePotionEffect(60, 29, false, false));
        entity.addPotionEffect(<potion:minecraft:weakness>.makePotionEffect(60, 29, false, false));
    }
};
cutdownTrait.register();

val choice_of_godsTrait = TraitBuilder.create("choice_of_gods");
choice_of_godsTrait.color = Color.fromHex("ffffff").getIntColor(); 
choice_of_godsTrait.localizedName = game.localize("greedycraft.tconstruct.tool_trait.choice_of_godsTrait.name");
choice_of_godsTrait.localizedDescription = game.localize("greedycraft.tconstruct.tool_trait.choice_of_godsTrait.desc");
choice_of_godsTrait.getMiningSpeed = function(thisTrait, tool, event) {
    val player as IPlayer = event.player;
    if(event.block.definition.id == "chancecubes:chance_cube"){
        player.addPotionEffect(<potion:minecraft:resistance>.makePotionEffect(100, 3, false, false));
        player.addPotionEffect(<potion:minecraft:absorption>.makePotionEffect(100, 5, false, false));

    }
};
choice_of_godsTrait.register();

val weatherturnTrait = TraitBuilder.create("weatherturn");
weatherturnTrait.color = Color.fromHex("ffffff").getIntColor(); 
weatherturnTrait.localizedName = game.localize("greedycraft.tconstruct.tool_trait.weatherturnTrait.name");
weatherturnTrait.localizedDescription = game.localize("greedycraft.tconstruct.tool_trait.weatherturnTrait.desc");
weatherturnTrait.afterHit = function(trait, tool, attacker, target, damageDealt, wasCritical, wasHit) {
    val player as IPlayer = attacker;
    if(Math.random() < 0.03){
        mods.contenttweaker.Commands.call("toggledownfall", player, player.world, false, true);
    }
};
weatherturnTrait.register();

val meteor_fallTrait = TraitBuilder.create("meteor_fall");
meteor_fallTrait.color = Color.fromHex("5d4037").getIntColor(); 
meteor_fallTrait.localizedName = game.localize("greedycraft.tconstruct.tool_trait.meteor_fallTrait.name");
meteor_fallTrait.localizedDescription = game.localize("greedycraft.tconstruct.tool_trait.meteor_fallTrait.desc");
meteor_fallTrait.onHit = function(trait, tool, attacker, target, damage, isCritical) {
    if (attacker instanceof IPlayer && target instanceof IEntityMob) {
        if (Math.random() < 0.02) {
            val player as IPlayer = attacker;
            player.give(itemUtils.getItem("additions:ignite_ingot"));
        }
    }
};
meteor_fallTrait.register();

val inserveTrait = TraitBuilder.create("inserve");
inserveTrait.color = Color.fromHex("5d4037").getIntColor(); 
inserveTrait.localizedName = game.localize("greedycraft.tconstruct.tool_trait.inserveTrait.name");
inserveTrait.localizedDescription = game.localize("greedycraft.tconstruct.tool_trait.inserveTrait.desc");
inserveTrait.onUpdate = function(trait, tool, world, owner, itemSlot, isSelected) {
    if (owner instanceof IEntityLivingBase) {
        val player as IPlayer = owner;
    if(Math.random() < 0.0005){
        player.addPotionEffect(<potion:potioncore:invert>.makePotionEffect(20, 0, false, false));
    }
    }
};
inserveTrait.register();

val relifeTrait = TraitBuilder.create("relife");
relifeTrait.color = Color.fromHex("5d4037").getIntColor(); 
relifeTrait.localizedName = game.localize("greedycraft.tconstruct.tool_trait.relifeTrait.name");
relifeTrait.localizedDescription = game.localize("greedycraft.tconstruct.tool_trait.relifeTrait.desc");
relifeTrait.calcDamage = function(trait, tool, attacker, target, originalDamage, newDamage, isCritical) {
    val player as IPlayer = attacker;
    val entity as IEntityMob = target;
    if(player.health < player.health * 0.15f){
        player.addPotionEffect(<potion:minecraft:fire_resistance>.makePotionEffect(20, 0, false, false));
        entity.setFire(10);
        if(entity.isBurning){
            return newDamage * 2.5f;
        }
    }
    return newDamage;
};
relifeTrait.register();

val depth_abyssTrait = TraitBuilder.create("depth_abyss");
depth_abyssTrait.color = Color.fromHex("5d4037").getIntColor(); 
depth_abyssTrait.localizedName = game.localize("greedycraft.tconstruct.tool_trait.depth_abyssTrait.name");
depth_abyssTrait.localizedDescription = game.localize("greedycraft.tconstruct.tool_trait.depth_abyssTrait.desc");
depth_abyssTrait.onHit = function(trait, tool, attacker, target, damage, isCritical) {
    val entity as IEntityLivingBase = target;
    val x = damage * 0.5f;
    if(Math.random() < 0.03){
       entity.health -= x;
    }
};
depth_abyssTrait.register();

val disorientedTrait = TraitBuilder.create("disoriented");
disorientedTrait.color = Color.fromHex("5d4037").getIntColor(); 
disorientedTrait.localizedName = game.localize("greedycraft.tconstruct.tool_trait.disorientedTrait.name");
disorientedTrait.localizedDescription = game.localize("greedycraft.tconstruct.tool_trait.disorientedTrait.desc");
disorientedTrait.calcDamage = function(trait, tool, attacker, target, originalDamage, newDamage, isCritical) {
    val entity as IEntityLivingBase = target;
    entity.addPotionEffect(<potion:potioncore:spin>.makePotionEffect(100, 2, false, false));
    return newDamage;
};
disorientedTrait.register();

val killallTrait = TraitBuilder.create("killall");
killallTrait.color = Color.fromHex("5d4037").getIntColor(); 
killallTrait.localizedName = game.localize("greedycraft.tconstruct.tool_trait.killallTrait.name");
killallTrait.localizedDescription = game.localize("greedycraft.tconstruct.tool_trait.killallTrait.desc");
killallTrait.calcDamage = function(trait, tool, attacker, target, originalDamage, newDamage, isCritical) {
    val entity as IEntityLivingBase = target;
    if(entity.health > entity.maxHealth * 0.9f){
        return newDamage + entity.maxHealth * 0.1f;
    }
    return newDamage;
};
killallTrait.register();

val true_damageTrait = TraitBuilder.create("true_damage");
true_damageTrait.color = Color.fromHex("5d4037").getIntColor(); 
true_damageTrait.localizedName = game.localize("greedycraft.tconstruct.tool_trait.true_damageTrait.name");
true_damageTrait.localizedDescription = game.localize("greedycraft.tconstruct.tool_trait.true_damageTrait.desc");
true_damageTrait.calcDamage = function(trait, tool, attacker, target, originalDamage, newDamage, isCritical) {
    if (!(isCritical)) {
        return newDamage * 0.1f;
    } else {
        if (!(target.isBoss)) {
            target.health -= 150.0f;
            return newDamage * 0.0f;
        }
        return newDamage * 0.1f;
    }
};
true_damageTrait.register();

val blue_screenTrait = TraitBuilder.create("blue_screen");
blue_screenTrait.color = Color.fromHex("5d4037").getIntColor(); 
blue_screenTrait.localizedName = game.localize("greedycraft.tconstruct.tool_trait.blue_screenTrait.name");
blue_screenTrait.localizedDescription = game.localize("greedycraft.tconstruct.tool_trait.blue_screenTrait.desc");
blue_screenTrait.onHit = function(trait, tool, attacker, target, damage, isCritical) {
    if (attacker instanceof IPlayer) {
        if (Math.random() < 0.3f) {
            target.addPotionEffect(<potion:gct_mobs:blue_screen>.makePotionEffect(100, 0, false, false));
        }
    }
};
blue_screenTrait.register();

val vigorousTrait = TraitBuilder.create("vigorous");
vigorousTrait.color = Color.fromHex("5d4037").getIntColor(); 
vigorousTrait.localizedName = game.localize("greedycraft.tconstruct.tool_trait.vigorousTrait.name");
vigorousTrait.localizedDescription = game.localize("greedycraft.tconstruct.tool_trait.vigorousTrait.desc");
vigorousTrait.calcDamage = function(trait, tool, attacker, target, originalDamage, newDamage, isCritical) {
    val entity as IEntityLivingBase = target;
    entity.addPotionEffect(<potion:minecraft:speed>.makePotionEffect(100, 1, false, false));
    return newDamage * 1.2f;
};
vigorousTrait.register();

val sky_shockingTrait = TraitBuilder.create("sky_shocking");
sky_shockingTrait.color = Color.fromHex("ffee58").getIntColor(); 
sky_shockingTrait.localizedName = game.localize("greedycraft.tconstruct.tool_trait.sky_shockingTrait.name");
sky_shockingTrait.localizedDescription = game.localize("greedycraft.tconstruct.tool_trait.sky_shockingTrait.desc");
sky_shockingTrait.afterHit = function(trait, tool, attacker, target, damageDealt, wasCritical, wasHit) {
    if (attacker instanceof IPlayer && wasHit && target instanceof IEntityMob) {
        target.world.addWeatherEffect(target.world.createLightningBolt(target.x, target.y, target.z, false));
    }
};
sky_shockingTrait.register();

val peakTrait = TraitBuilder.create("peak");
peakTrait.color = Color.fromHex("ffee58").getIntColor(); 
peakTrait.localizedName = game.localize("greedycraft.tconstruct.tool_trait.peakTrait.name");
peakTrait.localizedDescription = game.localize("greedycraft.tconstruct.tool_trait.peakTrait.desc");
peakTrait.calcDamage = function(trait, tool, attacker, target, originalDamage, newDamage, isCritical) {
    if (attacker instanceof IPlayer) {
        var mtp = target.world.getBiome(attacker.getPosition3f()).heightVariation as float;
        return newDamage * mtp;
    }
    return newDamage;
};
peakTrait.register();

val fihTrait = TraitBuilder.create("fire_in_heart");
fihTrait.color = Color.fromHex("ffee58").getIntColor(); 
fihTrait.localizedName = game.localize("greedycraft.tconstruct.tool_trait.fihTrait.name");
fihTrait.localizedDescription = game.localize("greedycraft.tconstruct.tool_trait.fihTrait.desc");
fihTrait.calcDamage = function(trait, tool, attacker, target, originalDamage, newDamage, isCritical) {
    if (attacker instanceof IPlayer) {
        var player as IPlayer = attacker;
        if (!(player.isPotionActive(<potion:gct_tcon:angry_accumulation>))) {
            player.addPotionEffect(<potion:gct_tcon:angry_accumulation>.makePotionEffect(60, 0, false, false));
            if (player.isPotionActive(<potion:gct_tcon:angry>)) {
                return newDamage * (1.0f + 0.03f * (player.getActivePotionEffect(<potion:gct_tcon:angry>).amplifier + 1));
            } else {
                return newDamage;
            }
        } else if (player.getActivePotionEffect(<potion:gct_tcon:angry_accumulation>).amplifier < 7) {
            player.addPotionEffect(<potion:gct_tcon:angry_accumulation>.makePotionEffect(60, player.getActivePotionEffect(<potion:gct_tcon:angry_accumulation>).amplifier + 1, false, false));
            if (player.isPotionActive(<potion:gct_tcon:angry>)) {
                return newDamage * (1.0f + 0.03f * (player.getActivePotionEffect(<potion:gct_tcon:angry>).amplifier + 1));
            } else {
                return newDamage;
            }
        } else {
            player.removePotionEffect(<potion:gct_tcon:angry_accumulation>);
            if (!(player.isPotionActive(<potion:gct_tcon:angry>))) {
                player.addPotionEffect(<potion:gct_tcon:angry>.makePotionEffect(200, 0, false, false));
                return newDamage * 1.03f;
            } else if (player.getActivePotionEffect(<potion:gct_tcon:angry>).amplifier < 7) {
                player.addPotionEffect(<potion:gct_tcon:angry>.makePotionEffect(200, player.getActivePotionEffect(<potion:gct_tcon:angry>).amplifier + 1, false, false));
                return newDamage * (1.0f + 0.03f * (player.getActivePotionEffect(<potion:gct_tcon:angry>).amplifier + 1));
            } else {
                player.addPotionEffect(<potion:gct_tcon:angry>.makePotionEffect(200, 7, false, false));
                return newDamage * 1.24f;
            }
        }
    }
    return newDamage;
};
fihTrait.register();

val vowelTrait = TraitBuilder.create("vowel");
vowelTrait.color = Color.fromHex("ffee58").getIntColor(); 
vowelTrait.localizedName = game.localize("greedycraft.tconstruct.tool_trait.vowelTrait.name");
vowelTrait.localizedDescription = game.localize("greedycraft.tconstruct.tool_trait.vowelTrait.desc");
vowelTrait.calcDamage = function(trait, tool, attacker, target, originalDamage, newDamage, isCritical) {
    if (attacker instanceof IPlayer) {
        var player as IPlayer = attacker;
        var name as string = player.name;
        if ((name has "a") || (name has "e") || (name has "i") || (name has "o") || (name has "u") || (name has "A") || (name has "E") || (name has "I") || (name has "O") || (name has "U")) {
            return newDamage * 1.1f;
        }
        return newDamage;
    }
    return newDamage;
};
vowelTrait.register();

val sacrificeTrait = TraitBuilder.create("sacrifice");
sacrificeTrait.color = Color.fromHex("ffee58").getIntColor(); 
sacrificeTrait.localizedName = game.localize("greedycraft.tconstruct.tool_trait.sacrificeTrait.name");
sacrificeTrait.localizedDescription = game.localize("greedycraft.tconstruct.tool_trait.sacrificeTrait.desc");
sacrificeTrait.calcDamage = function(trait, tool, attacker, target, originalDamage, newDamage, isCritical) {
    if (attacker instanceof IPlayer) {
        var player as IPlayer = attacker;
        player.health -= (player.maxHealth * 0.05f);
        return newDamage * 1.8f;
    }
    return newDamage;
};
sacrificeTrait.register();

val transmigrationTrait = TraitBuilder.create("transmigration");
transmigrationTrait.color = Color.fromHex("ffee58").getIntColor(); 
transmigrationTrait.localizedName = game.localize("greedycraft.tconstruct.tool_trait.transmigrationTrait.name");
transmigrationTrait.localizedDescription = game.localize("greedycraft.tconstruct.tool_trait.transmigrationTrait.desc");
transmigrationTrait.onHit = function(trait, tool, attacker, target, damage, isCritical) {
    if (attacker instanceof IPlayer && target instanceof IEntityMob) {
        var player as IPlayer = attacker;
        if (!(target.isBoss) && (target.health <= (target.maxHealth * 0.2f))) {
            if (Math.random() < 0.15) {
                target.posY = -10;
                target.setDead();
            }
        }
    }
};
transmigrationTrait.register();



val blood_reaperTrait = TraitBuilder.create("blood_reaper");
blood_reaperTrait.color = Color.fromHex("ffee58").getIntColor(); 
blood_reaperTrait.localizedName = game.localize("greedycraft.tconstruct.tool_trait.blood_reaperTrait.name");
blood_reaperTrait.localizedDescription = game.localize("greedycraft.tconstruct.tool_trait.blood_reaperTrait.desc");
blood_reaperTrait.calcDamage = function(trait, tool, attacker, target, originalDamage, newDamage, isCritical) {
    val entity as IEntityLivingBase = target;
    if (entity.isPotionActive(<potion:moretcon:bleeding>)) {
        return newDamage * 1.3f;
    }
    return newDamage;
};
blood_reaperTrait.register();

val crystalystTrait = TraitBuilder.create("crystalyst");
crystalystTrait.color = Color.fromHex("ffee58").getIntColor(); 
crystalystTrait.localizedName = game.localize("greedycraft.tconstruct.tool_trait.crystalystTrait.name");
crystalystTrait.localizedDescription = game.localize("greedycraft.tconstruct.tool_trait.crystalystTrait.desc");
crystalystTrait.onHit = function(trait, tool, attacker, target, damage, isCritical) {
    if (attacker instanceof IPlayer && target instanceof IEntityMob) {
        if (Math.random() < 0.01) {
            val player as IPlayer = attacker;
            player.give(itemUtils.getItem("additions:catalyst_star_shard"));
        }
    }
};
crystalystTrait.register();

val thadTrait = TraitBuilder.create("tinkers_heartwork");
thadTrait.color = Color.fromHex("ffee58").getIntColor();
thadTrait.localizedName = game.localize("greedycraft.tconstruct.tool_trait.thadTrait.name");
thadTrait.localizedDescription = game.localize("greedycraft.tconstruct.tool_trait.thadTrait.desc");
thadTrait.calcDamage = function(trait, tool, attacker, target, originalDamage, newDamage, isCritical) {
    if (attacker instanceof IPlayer) {
        var multiplier as int = CotTicTraitLib.getTicTrait(tool).length - 2 as int;
            if (multiplier <= 28) {
                return newDamage * (pow(1.05, multiplier) - 1) as float;
            } else {
                return newDamage * 2.0f;
            }
    }
    return newDamage;
};
thadTrait.register();

val aura_infusedTrait = TraitBuilder.create("aura_infused");
aura_infusedTrait.color = Color.fromHex("ffee58").getIntColor();
aura_infusedTrait.localizedName = game.localize("greedycraft.tconstruct.tool_trait.aura_infusedTrait.name");
aura_infusedTrait.localizedDescription = game.localize("greedycraft.tconstruct.tool_trait.aura_infusedTrait.desc");
aura_infusedTrait.onUpdate = function(trait, tool, world, owner, itemSlot, isSelected) {
    if (owner instanceof IPlayer) {
        var player as IPlayer = owner;
        if (!isNull(tool.tag.aura)) {
            var auraBefore as int = tool.tag.aura.asInt();
            if (!(player.isPotionActive(<potion:naturesaura:breathless>))) {
                if (auraBefore <= 1000000) {
                    mods.contenttweaker.Commands.call("naaura drain 1000", player, player.world, false, true);
                    tool.mutable().updateTag({aura : (auraBefore + 1000) as int});
                }
            }
            if (auraBefore >= 10000) {
                if (tool.damage != 0) {
                    tool.mutable().updateTag({aura : (auraBefore - 10000) as int});
                    ToolHelper.healTool(tool.mutable().native, 1, player.native);
                }
            }
        } else {
            tool.mutable().updateTag({aura : 0 as int});
        }
    }
};
aura_infusedTrait.register();

val full_of_auraTrait = TraitBuilder.create("full_of_aura");
full_of_auraTrait.color = Color.fromHex("ffee58").getIntColor(); 
full_of_auraTrait.localizedName = game.localize("greedycraft.tconstruct.tool_trait.full_of_auraTrait.name");
full_of_auraTrait.localizedDescription = game.localize("greedycraft.tconstruct.tool_trait.full_of_auraTrait.desc");
full_of_auraTrait.afterHit = function(trait, tool, attacker, target, damageDealt, wasCritical, wasHit) {
    if (attacker instanceof IPlayer) {
        var player as IPlayer = attacker;
        if (target instanceof IEntityLivingBase && target.health == 0) {
            var mtpstr = (Math.random() * 45000 + 5000) as string;
            mods.contenttweaker.Commands.call("naaura store " + mtpstr, player, player.world, false, true);
        }
    }
};
full_of_auraTrait.register();

val manipulateTrait = TraitBuilder.create("manipulate");
manipulateTrait.color = Color.fromHex("ffee58").getIntColor(); 
manipulateTrait.localizedName = game.localize("greedycraft.tconstruct.tool_trait.manipulateTrait.name");
manipulateTrait.localizedDescription = game.localize("greedycraft.tconstruct.tool_trait.manipulateTrait.desc");
manipulateTrait.afterHit = function(trait, tool, attacker, target, damageDealt, wasCritical, wasHit) {
    if (attacker instanceof IPlayer) {
        var player as IPlayer = attacker;
        if (target instanceof IEntityLivingBase && target.health == 0) {
            if (isNull(tool.tag.manipulate)) {
                tool.mutable().updateTag({manipulate : {a : "null", b : "null", c : "null", d : "null", e : "null"}});
            } else {
                var newa as string = target.definition.name;
                print(target.definition.name);
                print(target.definition.id);
                var newb as string = tool.tag.manipulate.a as string;
                var newc as string = tool.tag.manipulate.b as string;
                var newd as string = tool.tag.manipulate.c as string;
                var newe as string = tool.tag.manipulate.d as string;
                tool.mutable().updateTag({manipulate : {a : newa, b : newb, c : newc, d : newd, e : newe}});
            }
        }
    }
};
manipulateTrait.calcDamage = function(trait, tool, attacker, target, originalDamage, newDamage, isCritical) {
    if (attacker instanceof IPlayer) {
        if (!isNull(tool.tag.manipulate)) {
            var id as string = target.definition.name;
            var a as string = tool.tag.manipulate.a as string;
            var b as string = tool.tag.manipulate.b as string;
            var c as string = tool.tag.manipulate.c as string;
            var d as string = tool.tag.manipulate.d as string;
            var e as string = tool.tag.manipulate.e as string;
            if (id == a||id == b||id == c||id == d||id == e) {
                return newDamage * 2.0f;
            }
        }
    }
    return newDamage;
};
manipulateTrait.register();

val disarmTrait = TraitBuilder.create("disarm");
disarmTrait.color = Color.fromHex("ffee58").getIntColor(); 
disarmTrait.localizedName = game.localize("greedycraft.tconstruct.tool_trait.disarmTrait.name");
disarmTrait.localizedDescription = game.localize("greedycraft.tconstruct.tool_trait.disarmTrait.desc");
disarmTrait.afterHit = function(trait, tool, attacker, target, damageDealt, wasCritical, wasHit) {
    if (attacker instanceof IPlayer) {
        var player as IPlayer = attacker;
        if (Math.random() < 0.05f) {
            if (!isNull(target.heldEquipment) && !(target instanceof IPlayer)) {
                for item in target.heldEquipment {
                    item.mutable().shrink(1);
                }
            }
        }
    }
};
disarmTrait.register();

val test_damageTrait = TraitBuilder.create("test_damage");
test_damageTrait.color = Color.fromHex("ffffff").getIntColor(); 
test_damageTrait.localizedName = game.localize("greedycraft.tconstruct.tool_trait.test_damageTrait.name");
test_damageTrait.localizedDescription = game.localize("greedycraft.tconstruct.tool_trait.test_damageTrait.desc");
test_damageTrait.afterHit = function(trait, tool, attacker, target, damageDealt, wasCritical, wasHit) {
    if (attacker instanceof IPlayer) {
        client.player.sendChat("\u00A7b\u4F60\u9020\u6210\u4E86" + damageDealt as string + "\u70B9\u4F24\u5BB3");
    }
};
test_damageTrait.register();

val aura_effectTrait = TraitBuilder.create("aura_effect");
aura_effectTrait.color = Color.fromHex("ffffff").getIntColor(); 
aura_effectTrait.localizedName = game.localize("greedycraft.tconstruct.tool_trait.aura_effectTrait.name");
aura_effectTrait.localizedDescription = game.localize("greedycraft.tconstruct.tool_trait.aura_effectTrait.desc");
aura_effectTrait.calcDamage = function(trait, tool, attacker, target, originalDamage, newDamage, isCritical) {
    if (attacker instanceof IPlayer) {
        var player as IPlayer = attacker;
        if (player.isPotionActive(<potion:naturesaura:breathless>)) {
            return newDamage * 1.3f;
        }
    }
    return newDamage;
};
aura_effectTrait.register();

val soul_eaterTrait = TraitBuilder.create("soul_eater_refined");
soul_eaterTrait.color = Color.fromHex("ffffff").getIntColor(); 
soul_eaterTrait.localizedName = game.localize("greedycraft.tconstruct.tool_trait.soul_eaterTrait.name");
soul_eaterTrait.localizedDescription = game.localize("greedycraft.tconstruct.tool_trait.soul_eaterTrait.desc");
soul_eaterTrait.afterHit = function(trait, tool, attacker, target, damageDealt, wasCritical, wasHit) {
    if (attacker instanceof IPlayer) {
        var player as IPlayer = attacker;
        if (target instanceof IEntityLivingBase && target.health == 0) {
            if (isNull(tool.tag.killcount)) {
                tool.mutable().updateTag({killcount : 1 as int});
            } else {
                if (!(tool.tag.killcount as int >= 200)) {
                    tool.mutable().updateTag({killcount : (tool.tag.killcount + 1) as int});
                }
            }
            if (!isNull(tool.tag.killcount)) {
                var mtp as float = 0.1f * tool.tag.killcount as float;
                tool.mutable().updateTag({display : {Lore : ["\u00A7f\u51FB\u6740\u6570\uFF1A" + tool.tag.killcount as string, "\u00A7f\u4F24\u5BB3\u52A0\u6210\uFF1A" + mtp as string]}});
            }
        }
    }
};
soul_eaterTrait.calcDamage = function(trait, tool, attacker, target, originalDamage, newDamage, isCritical) {
    if (attacker instanceof IPlayer) {
        var player as IPlayer = attacker;
        if (!isNull(tool.tag.killcount)) {
            return newDamage + tool.tag.killcount as float * 0.1f;
        }
    }
    return newDamage;
};
soul_eaterTrait.register();

val soul_eater2Trait = TraitBuilder.create("soul_eater_refined2");
soul_eater2Trait.color = Color.fromHex("ffffff").getIntColor(); 
soul_eater2Trait.localizedName = game.localize("greedycraft.tconstruct.tool_trait.soul_eater2Trait.name");
soul_eater2Trait.localizedDescription = game.localize("greedycraft.tconstruct.tool_trait.soul_eaterTrait.desc");
soul_eater2Trait.afterHit = function(trait, tool, attacker, target, damageDealt, wasCritical, wasHit) {
    if (attacker instanceof IPlayer) {
        var player as IPlayer = attacker;
        if (target instanceof IEntityLivingBase && target.health == 0) {
            if (isNull(tool.tag.killcount)) {
                tool.mutable().updateTag({killcount : 1 as int});
            } else {
                if (!(tool.tag.killcount as int >= 400)) {
                    tool.mutable().updateTag({killcount : (tool.tag.killcount + 1) as int});
                }
            }
            if (!isNull(tool.tag.killcount)) {
                var mtp as float = 0.1f * tool.tag.killcount as float;
                tool.mutable().updateTag({display : {Lore : ["\u00A7f\u51FB\u6740\u6570\uFF1A" + tool.tag.killcount as string, "\u00A7f\u4F24\u5BB3\u52A0\u6210\uFF1A" + mtp as string]}});
            }
        }
    }
};
soul_eater2Trait.calcDamage = function(trait, tool, attacker, target, originalDamage, newDamage, isCritical) {
    if (attacker instanceof IPlayer) {
        var player as IPlayer = attacker;
        if (!isNull(tool.tag.killcount)) {
            return newDamage + tool.tag.killcount as float * 0.1f;
        }
    }
    return newDamage;
};
soul_eater2Trait.register();

val soul_eater3Trait = TraitBuilder.create("soul_eater_refined3");
soul_eater3Trait.color = Color.fromHex("ffffff").getIntColor(); 
soul_eater3Trait.localizedName = game.localize("greedycraft.tconstruct.tool_trait.soul_eater3Trait.name");
soul_eater3Trait.localizedDescription = game.localize("greedycraft.tconstruct.tool_trait.soul_eaterTrait.desc");
soul_eater3Trait.afterHit = function(trait, tool, attacker, target, damageDealt, wasCritical, wasHit) {
    if (attacker instanceof IPlayer) {
        var player as IPlayer = attacker;
        if (target instanceof IEntityLivingBase && target.health == 0) {
            if (isNull(tool.tag.killcount)) {
                tool.mutable().updateTag({killcount : 1 as int});
            } else {
                if (!(tool.tag.killcount as int >= 800)) {
                    tool.mutable().updateTag({killcount : (tool.tag.killcount + 1) as int});
                }
            }
            if (!isNull(tool.tag.killcount)) {
                var mtp as float = 0.1f * tool.tag.killcount as float;
                tool.mutable().updateTag({display : {Lore : ["\u00A7f\u51FB\u6740\u6570\uFF1A" + tool.tag.killcount as string, "\u00A7f\u4F24\u5BB3\u52A0\u6210\uFF1A" + mtp as string]}});
            }
        }
    }
};
soul_eater3Trait.calcDamage = function(trait, tool, attacker, target, originalDamage, newDamage, isCritical) {
    if (attacker instanceof IPlayer) {
        var player as IPlayer = attacker;
        if (!isNull(tool.tag.killcount)) {
            return newDamage + tool.tag.killcount as float * 0.1f;
        }
    }
    return newDamage;
};
soul_eater3Trait.register();

val soul_eater4Trait = TraitBuilder.create("soul_eater_refined4");
soul_eater4Trait.color = Color.fromHex("ffffff").getIntColor(); 
soul_eater4Trait.localizedName = game.localize("greedycraft.tconstruct.tool_trait.soul_eater4Trait.name");
soul_eater4Trait.localizedDescription = game.localize("greedycraft.tconstruct.tool_trait.soul_eaterTrait.desc");
soul_eater4Trait.afterHit = function(trait, tool, attacker, target, damageDealt, wasCritical, wasHit) {
    if (attacker instanceof IPlayer) {
        var player as IPlayer = attacker;
        if (target instanceof IEntityLivingBase && target.health == 0) {
            if (isNull(tool.tag.killcount)) {
                tool.mutable().updateTag({killcount : 1 as int});
            } else {
                if (!(tool.tag.killcount as int >= 1600)) {
                    tool.mutable().updateTag({killcount : (tool.tag.killcount + 1) as int});
                }
            }
            if (!isNull(tool.tag.killcount)) {
                var mtp as float = 0.1f * tool.tag.killcount as float;
                tool.mutable().updateTag({display : {Lore : ["\u00A7f\u51FB\u6740\u6570\uFF1A" + tool.tag.killcount as string, "\u00A7f\u4F24\u5BB3\u52A0\u6210\uFF1A" + mtp as string]}});
            }
        }
    }
};
soul_eater4Trait.calcDamage = function(trait, tool, attacker, target, originalDamage, newDamage, isCritical) {
    if (attacker instanceof IPlayer) {
        var player as IPlayer = attacker;
        if (!isNull(tool.tag.killcount)) {
            return newDamage + tool.tag.killcount as float * 0.1f;
        }
    }
    return newDamage;
};
soul_eater4Trait.register();

val soul_eater5Trait = TraitBuilder.create("soul_eater_refined5");
soul_eater5Trait.color = Color.fromHex("ffffff").getIntColor(); 
soul_eater5Trait.localizedName = game.localize("greedycraft.tconstruct.tool_trait.soul_eater5Trait.name");
soul_eater5Trait.localizedDescription = game.localize("greedycraft.tconstruct.tool_trait.soul_eaterTrait.desc");
soul_eater5Trait.afterHit = function(trait, tool, attacker, target, damageDealt, wasCritical, wasHit) {
    if (attacker instanceof IPlayer) {
        var player as IPlayer = attacker;
        if (target instanceof IEntityLivingBase && target.health == 0) {
            if (isNull(tool.tag.killcount)) {
                tool.mutable().updateTag({killcount : 1 as int});
            } else {
                if (!(tool.tag.killcount as int >= 3200)) {
                    tool.mutable().updateTag({killcount : (tool.tag.killcount + 1) as int});
                }
            }
            if (!isNull(tool.tag.killcount)) {
                var mtp as float = 0.1f * tool.tag.killcount as float;
                tool.mutable().updateTag({display : {Lore : ["\u00A7f\u51FB\u6740\u6570\uFF1A" + tool.tag.killcount as string, "\u00A7f\u4F24\u5BB3\u52A0\u6210\uFF1A" + mtp as string]}});
            }
        }
    }
};
soul_eater5Trait.calcDamage = function(trait, tool, attacker, target, originalDamage, newDamage, isCritical) {
    if (attacker instanceof IPlayer) {
        var player as IPlayer = attacker;
        if (!isNull(tool.tag.killcount)) {
            return newDamage + tool.tag.killcount as float * 0.1f;
        }
    }
    return newDamage;
};
soul_eater5Trait.register();

val burntTrait = TraitBuilder.create("burnt");
burntTrait.color = Color.fromHex("ffffff").getIntColor(); 
burntTrait.localizedName = game.localize("greedycraft.tconstruct.tool_trait.burntTrait.name");
burntTrait.localizedDescription = game.localize("greedycraft.tconstruct.tool_trait.burntTrait.desc");
burntTrait.afterHit = function(trait, tool, attacker, target, damageDealt, wasCritical, wasHit) {
    if (attacker instanceof IPlayer) {
        var player as IPlayer = attacker;
        if (target instanceof IEntityLivingBase && target.health == 0) {
            var x as int = target.getX() as int;
            var y as int = target.getY() as int;
            var z as int = target.getZ() as int;
            mods.contenttweaker.Commands.call("setblock " + x as string + " " + y as string + " " + z as string + " fire", player, player.world, false, true);
        }
    }
};
burntTrait.register();

val imagineTrait = TraitBuilder.create("imagine");
imagineTrait.color = Color.fromHex("ffffff").getIntColor(); 
imagineTrait.localizedName = game.localize("greedycraft.tconstruct.tool_trait.imagineTrait.name");
imagineTrait.localizedDescription = game.localize("greedycraft.tconstruct.tool_trait.imagineTrait.desc");
imagineTrait.calcDamage = function(trait, tool, attacker, target, originalDamage, newDamage, isCritical) {
    if (attacker instanceof IPlayer) {
        var player as IPlayer = attacker;
        if (Math.random() < 0.8f) {
            return newDamage * 1.4f;
        } else {
            target.health = target.health * 1.1f;
            return newDamage;
        }
    }
    return newDamage;
};
imagineTrait.register();

val state_additionTrait = TraitBuilder.create("state_addition");
state_additionTrait.color = Color.fromHex("ffffff").getIntColor(); 
state_additionTrait.localizedName = game.localize("greedycraft.tconstruct.tool_trait.state_additionTrait.name");
state_additionTrait.localizedDescription = game.localize("greedycraft.tconstruct.tool_trait.state_additionTrait.desc");
state_additionTrait.calcDamage = function(trait, tool, attacker, target, originalDamage, newDamage, isCritical) {
    if (attacker instanceof IPlayer) {
        var player as IPlayer = attacker;
        if ((target.health / player.health) as int != 0) {
            var num as int = (target.health / player.health) as int;
            if (num >= 16) {
                return newDamage * 1.25f;
            } else if (num >= 8) {
                return newDamage * 1.2f;
            } else if (num >= 4) {
                return newDamage * 1.15f;
            } else if (num >= 2) {
                return newDamage * 1.1f;
            } else if (num >= 1) {
                return newDamage * 1.05f;
            }
        }
    }
    return newDamage;
};
state_additionTrait.register();

val overrunTrait = TraitBuilder.create("overrun");
overrunTrait.color = Color.fromHex("ffffff").getIntColor(); 
overrunTrait.localizedName = game.localize("greedycraft.tconstruct.tool_trait.overrunTrait.name");
overrunTrait.localizedDescription = game.localize("greedycraft.tconstruct.tool_trait.overrunTrait.desc");
overrunTrait.getMiningSpeed = function(trait, tool, event) {
    if (event.block.definition.hardness >= 3 * event.originalSpeed) {
        event.newSpeed = event.originalSpeed * 3.0f;
    }
};
overrunTrait.register();

val sweepTrait = TraitBuilder.create("sweep");
sweepTrait.color = Color.fromHex("ffffff").getIntColor(); 
sweepTrait.localizedName = game.localize("greedycraft.tconstruct.tool_trait.sweepTrait.name");
sweepTrait.localizedDescription = game.localize("greedycraft.tconstruct.tool_trait.sweepTrait.desc");
sweepTrait.beforeBlockBreak = function(trait, tool, event) {
    if (isNull(tool.tag.sweep)) {
        tool.mutable().updateTag({
            sweep : {
                id : event.block.definition.id as string,
                times : 1 as int
            }
        });
    } else if (tool.tag.sweep.id as string == event.block.definition.id as string) {
        tool.mutable().updateTag({
            sweep : {
                times : tool.tag.sweep.times + 1 as int
            }
        });
    } else {
        tool.mutable().updateTag({
            sweep : {
                id : event.block.definition.id as string,
                times : 1 as int
            }
        });
    }
};
sweepTrait.getMiningSpeed = function(trait, tool, event) {
    if (!isNull(tool.tag.sweep)) {
        if (event.block.definition.id as string == tool.tag.sweep.id as string) {
            event.newSpeed = event.originalSpeed * (1.0f + (0.001f * tool.tag.sweep.times as int) as float);
        }
    }
};
sweepTrait.register();

val air_controlTrait = TraitBuilder.create("air_control");
air_controlTrait.color = Color.fromHex("ffffff").getIntColor(); 
air_controlTrait.localizedName = game.localize("greedycraft.tconstruct.tool_trait.air_controlTrait.name");
air_controlTrait.localizedDescription = game.localize("greedycraft.tconstruct.tool_trait.air_controlTrait.desc");
air_controlTrait.calcDamage = function(trait, tool, attacker, target, originalDamage, newDamage, isCritical) {
    if (attacker instanceof IPlayer) {
        var player as IPlayer = attacker;
        if (target.y >= (player.y + 6)) {
            return newDamage * 1.05f;
        }
    }
    return newDamage;
};
air_controlTrait.register();

val transitionTrait = TraitBuilder.create("transition");
transitionTrait.color = Color.fromHex("ffffff").getIntColor(); 
transitionTrait.localizedName = game.localize("greedycraft.tconstruct.tool_trait.transitionTrait.name");
transitionTrait.localizedDescription = game.localize("greedycraft.tconstruct.tool_trait.transitionTrait.desc");
transitionTrait.onUpdate = function(trait, tool, world, owner, itemSlot, isSelected) {
    if (owner instanceof IPlayer) {
        var player as IPlayer = owner;
        if (isSelected) {
            if (!(player.isPotionActive(<potion:gct_tcon:excited_state>))) {
                player.addPotionEffect(<potion:gct_tcon:ground_state>.makePotionEffect(1, 0, false, false));
            } else {
                player.addPotionEffect(<potion:gct_tcon:excited_state>.makePotionEffect(1, 0, false, false));
            }
        }
    }
};
transitionTrait.calcDamage = function(trait, tool, attacker, target, originalDamage, newDamage, isCritical) {
    if (attacker instanceof IPlayer) {
        var player as IPlayer = attacker;
        if (player.isPotionActive(<potion:gct_tcon:excited_state>)) {
            if (Math.random() < 0.0625f) {
                player.removePotionEffect(<potion:gct_tcon:excited_state>);
                player.addPotionEffect(<potion:gct_tcon:ground_state>.makePotionEffect(1, 0, false, false));
                return newDamage * 1.4f;
            } else {
                return newDamage * 1.4f;
            }
        } else {
            if (Math.random() < 0.142857f) {
                player.removePotionEffect(<potion:gct_tcon:ground_state>);
                player.addPotionEffect(<potion:gct_tcon:excited_state>.makePotionEffect(1, 0, false, false));
                return newDamage * 0.85f;
            } else {
                return newDamage * 0.85f;
            }
        }
    }
    return newDamage;
};
transitionTrait.register();

val transition2Trait = TraitBuilder.create("transition2");
transition2Trait.color = Color.fromHex("ffffff").getIntColor(); 
transition2Trait.localizedName = game.localize("greedycraft.tconstruct.tool_trait.transition2Trait.name");
transition2Trait.localizedDescription = game.localize("greedycraft.tconstruct.tool_trait.transitionTrait.desc");
transition2Trait.onUpdate = function(trait, tool, world, owner, itemSlot, isSelected) {
    if (owner instanceof IPlayer) {
        var player as IPlayer = owner;
        if (isSelected) {
            if (!(player.isPotionActive(<potion:gct_tcon:excited_state>))) {
                player.addPotionEffect(<potion:gct_tcon:ground_state>.makePotionEffect(1, 0, false, false));
            } else {
                player.addPotionEffect(<potion:gct_tcon:excited_state>.makePotionEffect(1, 0, false, false));
            }
        }
    }
};
transition2Trait.calcDamage = function(trait, tool, attacker, target, originalDamage, newDamage, isCritical) {
    if (attacker instanceof IPlayer) {
        var player as IPlayer = attacker;
        if (player.isPotionActive(<potion:gct_tcon:excited_state>)) {
            if (Math.random() < 0.0375f) {
                player.removePotionEffect(<potion:gct_tcon:excited_state>);
                player.addPotionEffect(<potion:gct_tcon:ground_state>.makePotionEffect(1, 0, false, false));
                return newDamage * 1.4f;
            } else {
                return newDamage * 1.4f;
            }
        } else {
            if (Math.random() < 0.285714f) {
                player.removePotionEffect(<potion:gct_tcon:ground_state>);
                player.addPotionEffect(<potion:gct_tcon:excited_state>.makePotionEffect(1, 0, false, false));
                return newDamage * 0.85f;
            } else {
                return newDamage * 0.85f;
            }
        }
    }
    return newDamage;
};
transition2Trait.register();

val tiredTrait = TraitBuilder.create("tired");
tiredTrait.color = Color.fromHex("ffffff").getIntColor(); 
tiredTrait.localizedName = game.localize("greedycraft.tconstruct.tool_trait.tiredTrait.name");
tiredTrait.localizedDescription = game.localize("greedycraft.tconstruct.tool_trait.tiredTrait.desc");
tiredTrait.beforeBlockBreak = function(trait, tool, event) {
    if (isNull(tool.tag.tired)) {
        tool.mutable().updateTag({
            tired : {
                id : event.block.definition.id as string,
                times : 1 as int
            }
        });
    } else if (tool.tag.tired.id as string == event.block.definition.id as string) {
        tool.mutable().updateTag({
            tired : {
                times : tool.tag.tired.times + 1 as int
            }
        });
    } else {
        tool.mutable().updateTag({
            tired : {
                id : event.block.definition.id as string,
                times : 1 as int
            }
        });
    }
};
tiredTrait.getMiningSpeed = function(trait, tool, event) {
    if (!isNull(tool.tag.tired)) {
        if (event.block.definition.id as string == tool.tag.tired.id as string) {
            if (tool.tag.tired.times as int >= 10) {
                event.newSpeed = event.originalSpeed * 0.01f;
            }
        }
    }
};
tiredTrait.register();

val easier_brokenTrait = TraitBuilder.create("harder_and_easier_broken");
easier_brokenTrait.color = Color.fromHex("ffffff").getIntColor(); 
easier_brokenTrait.localizedName = game.localize("greedycraft.tconstruct.tool_trait.easier_brokenTrait.name");
easier_brokenTrait.localizedDescription = game.localize("greedycraft.tconstruct.tool_trait.easier_brokenTrait.desc");
easier_brokenTrait.calcDamage = function(trait, tool, attacker, target, originalDamage, newDamage, isCritical) {
    if (attacker instanceof IPlayer) {
        var player as IPlayer = attacker;
        var durablility as int = tool.maxDamage as int;
        if (durablility != 0) {
            var mtp as float = lognum(10, durablility) * 0.1f;
            return newDamage * (1.0f - mtp);
        }
    }
    return newDamage;
};
easier_brokenTrait.register();

val criticalityTrait = TraitBuilder.create("criticality");
criticalityTrait.color = Color.fromHex("ffffff").getIntColor(); 
criticalityTrait.localizedName = game.localize("greedycraft.tconstruct.tool_trait.criticalityTrait.name");
criticalityTrait.localizedDescription = game.localize("greedycraft.tconstruct.tool_trait.criticalityTrait.desc");
criticalityTrait.calcDamage = function(trait, tool, attacker, target, originalDamage, newDamage, isCritical) {
    if (attacker instanceof IPlayer) {
        var player as IPlayer = attacker;
        target.addRadiation(originalDamage as double / 100000.0d, true);
    }
    return newDamage;
};
criticalityTrait.register();

val dragon_roaringTrait = TraitBuilder.create("dragon_roaring");
dragon_roaringTrait.color = Color.fromHex("ffffff").getIntColor(); 
dragon_roaringTrait.localizedName = game.localize("greedycraft.tconstruct.tool_trait.dragon_roaringTrait.name");
dragon_roaringTrait.localizedDescription = game.localize("greedycraft.tconstruct.tool_trait.dragon_roaringTrait.desc");
dragon_roaringTrait.afterHit = function(trait, tool, attacker, target, damageDealt, wasCritical, wasHit) {
    if (attacker instanceof IPlayer && !target.isBoss) {
        var player as IPlayer = attacker;
        if (target.health > target.maxHealth * 0.5f) {
            target.health -= target.maxHealth * 0.01f;
            mods.contenttweaker.Commands.call("playsound minecraft:entity.enderdragon.ambient player @p ~ ~ ~ 0.1", player, player.world, false, true);
        }
    }
};
dragon_roaringTrait.register();

val final_woundTrait = TraitBuilder.create("final_wound");
final_woundTrait.color = Color.fromHex("ffffff").getIntColor(); 
final_woundTrait.localizedName = game.localize("greedycraft.tconstruct.tool_trait.final_woundTrait.name");
final_woundTrait.localizedDescription = game.localize("greedycraft.tconstruct.tool_trait.final_woundTrait.desc");
final_woundTrait.afterHit = function(trait, tool, attacker, target, damageDealt, wasCritical, wasHit) {
    if (attacker instanceof IPlayer && target instanceof IEntityLivingBase && !(target instanceof IPlayer) && !target.isBoss && Math.random() < 0.1f) {
        var player as IPlayer = attacker;
        var maxHealthBase as double = target.getAttribute("generic.maxHealth").getBaseValue();
        target.getAttribute("generic.maxHealth").setBaseValue(maxHealthBase * 0.95d);
    }
};
final_woundTrait.register();

val adjustment_of_placesTrait = TraitBuilder.create("adjustment_of_places");
adjustment_of_placesTrait.color = Color.fromHex("ffffff").getIntColor(); 
adjustment_of_placesTrait.localizedName = game.localize("greedycraft.tconstruct.tool_trait.adjustment_of_placesTrait.name");
adjustment_of_placesTrait.localizedDescription = game.localize("greedycraft.tconstruct.tool_trait.adjustment_of_placesTrait.desc");
adjustment_of_placesTrait.calcDamage = function(trait, tool, attacker, target, originalDamage, newDamage, isCritical) {
    if (attacker instanceof IPlayer) {
        var player as IPlayer = attacker;
        var vanila as int[] = [-1, 0, 1];
        if (vanila has player.getDimension()) {
            return newDamage * 1.3f;
        }
    }
    return newDamage;
};
adjustment_of_placesTrait.register();

val charitableTrait = TraitBuilder.create("charitable");
charitableTrait.color = Color.fromHex("ffffff").getIntColor(); 
charitableTrait.localizedName = game.localize("greedycraft.tconstruct.tool_trait.charitableTrait.name");
charitableTrait.localizedDescription = game.localize("greedycraft.tconstruct.tool_trait.charitableTrait.desc");
charitableTrait.onHit = function(trait, tool, attacker, target, damage, isCritical) {
    if (attacker instanceof IPlayer && !(target instanceof IPlayer)) {
        var player as IPlayer = attacker;
        var ids as string = target.definition.id as string;
        if (isNull(tool.tag.charitable)) {
            tool.mutable().updateTag(
                {
                    charitable : {
                        name : ids as string,
                        times : 1 as int
                    }
                }
            );
        } else {
            if (tool.tag.charitable.name as string == ids) {
                var time as int = tool.tag.charitable.times as int + 1;
                tool.mutable().updateTag(
                    {
                        charitable : {
                            times : time as int
                        }
                    }
                );
            } else {
                tool.mutable().updateTag(
                    {
                        charitable : {
                            name : ids as string,
                            times : 1 as int
                        }
                    }
                );
            }
        }
    }
};
charitableTrait.calcDamage = function(trait, tool, attacker, target, originalDamage, newDamage, isCritical) {
    if (attacker instanceof IPlayer && !(target instanceof IPlayer)) {
        var player as IPlayer = attacker;
        if (!isNull(tool.tag.charitable)) {
            if (target.definition.id == tool.tag.charitable.name as string && tool.tag.charitable.times as int >= 7) {
                return newDamage * 0.3f;
            }
        }
    }
    return newDamage;
};
charitableTrait.register();

val murderTrait = TraitBuilder.create("murder");
murderTrait.color = Color.fromHex("ffffff").getIntColor(); 
murderTrait.localizedName = game.localize("greedycraft.tconstruct.tool_trait.murderTrait.name");
murderTrait.localizedDescription = game.localize("greedycraft.tconstruct.tool_trait.murderTrait.desc");
murderTrait.calcDamage = function(trait, tool, attacker, target, originalDamage, newDamage, isCritical) {
    if (attacker instanceof IPlayer) {
        var player as IPlayer = attacker;
        if (target.definition.id == "headcrumbs:human") {
            return newDamage * 1.5f;
        }
    }
    return newDamage;
};
murderTrait.register();

val suicideTrait = TraitBuilder.create("suicide");
suicideTrait.color = Color.fromHex("ffffff").getIntColor(); 
suicideTrait.localizedName = game.localize("greedycraft.tconstruct.tool_trait.suicideTrait.name");
suicideTrait.localizedDescription = game.localize("greedycraft.tconstruct.tool_trait.suicideTrait.desc");
suicideTrait.calcDamage = function(trait, tool, attacker, target, originalDamage, newDamage, isCritical) {
    if (attacker instanceof IPlayer) {
        var player as IPlayer = attacker;
        if (Math.random() < 0.02) {
            player.health = 0.0f;
        }
        return newDamage * 2.0f;
    }
    return newDamage;
};
suicideTrait.register();

val compressionTrait = TraitBuilder.create("compression");
compressionTrait.color = Color.fromHex("ffffff").getIntColor(); 
compressionTrait.localizedName = game.localize("greedycraft.tconstruct.tool_trait.compressionTrait.name");
compressionTrait.localizedDescription = game.localize("greedycraft.tconstruct.tool_trait.compressionTrait.desc");
compressionTrait.onBlockHarvestDrops = function(thisTrait, tool, event) {
    if (event.block.definition.id == "minecraft:coal_ore") {
        event.dropChance = 0;
        event.player.give(itemUtils.getItem("minecraft:diamond"));
    }
};
compressionTrait.register();

val radiatedTrait = TraitBuilder.create("radiated");
radiatedTrait.color = Color.fromHex("ffffff").getIntColor(); 
radiatedTrait.localizedName = game.localize("greedycraft.tconstruct.tool_trait.radiatedTrait.name");
radiatedTrait.localizedDescription = game.localize("greedycraft.tconstruct.tool_trait.radiatedTrait.desc");
radiatedTrait.calcDamage = function(trait, tool, attacker, target, originalDamage, newDamage, isCritical) {
    if (attacker instanceof IPlayer) {
        var player as IPlayer = attacker;
        var radiation as double = player.getRadiation() as double;
        var mtp as float = radiation as float / 5000.0f;
        return newDamage * (1.0f + mtp as float);
    }
    return newDamage;
};
radiatedTrait.register();

val levitatedTrait = TraitBuilder.create("levitated");
levitatedTrait.color = Color.fromHex("ffffff").getIntColor(); 
levitatedTrait.localizedName = game.localize("greedycraft.tconstruct.tool_trait.levitatedTrait.name");
levitatedTrait.localizedDescription = game.localize("greedycraft.tconstruct.tool_trait.levitatedTrait.desc");
levitatedTrait.calcDamage = function(trait, tool, attacker, target, originalDamage, newDamage, isCritical) {
    if (attacker instanceof IPlayer) {
        var player as IPlayer = attacker;
        if (target.isPotionActive(<potion:potioncore:slow_fall>)) {
            return newDamage * 1.1f;
        } else {
            target.addPotionEffect(<potion:potioncore:slow_fall>.makePotionEffect(200, 0, false, false));
        }
    }
    return newDamage;
};
levitatedTrait.register();

val amaratsuTrait = TraitBuilder.create("amaratsu");
amaratsuTrait.color = Color.fromHex("ffffff").getIntColor(); 
amaratsuTrait.localizedName = game.localize("greedycraft.tconstruct.tool_trait.amaratsuTrait.name");
amaratsuTrait.localizedDescription = game.localize("greedycraft.tconstruct.tool_trait.amaratsuTrait.desc");
amaratsuTrait.calcDamage = function(trait, tool, attacker, target, originalDamage, newDamage, isCritical) {
    if (attacker instanceof IPlayer) {
        var player as IPlayer = attacker;
        var mtp as int = ((attacker.world.time + 6000 as long) % 24000 as long) as int;
        if (Math.abs(mtp - 12000) < 5000) {
            return newDamage * (((5000.0f - Math.abs(mtp as float - 12000.0f)) / 20000.0f) + 1.0f) as float;
        }
    }
    return newDamage;
};
amaratsuTrait.register();

val taintedTrait = TraitBuilder.create("tainted");
taintedTrait.color = Color.fromHex("ffffff").getIntColor(); 
taintedTrait.localizedName = game.localize("greedycraft.tconstruct.tool_trait.taintedTrait.name");
taintedTrait.localizedDescription = game.localize("greedycraft.tconstruct.tool_trait.taintedTrait.desc");
taintedTrait.afterHit = function(trait, tool, attacker, target, damageDealt, wasCritical, wasHit) {
    if (attacker instanceof IPlayer) {
        var player as IPlayer = attacker;
        var dmg as float = player.maxHealth * 0.13f;
        var source as IDamageSource = IDamageSource.createEntityDamage("chaos", player);
        target.attackEntityFrom(source, dmg);
    }
};
taintedTrait.register();

val erosionTrait = TraitBuilder.create("erosion");
erosionTrait.color = Color.fromHex("ffffff").getIntColor(); 
erosionTrait.localizedName = game.localize("greedycraft.tconstruct.tool_trait.erosionTrait.name");
erosionTrait.localizedDescription = game.localize("greedycraft.tconstruct.tool_trait.erosionTrait.desc");
erosionTrait.onUpdate = function(trait, tool, world, owner, itemSlot, isSelected) {
    if (owner instanceof IPlayer && isSelected) {
        var player as IPlayer = owner;
        if (Math.random() < 0.01) {
            if (Math.random() < 0.01) {
                if (Math.random() < 0.05) {
                    ToolHelper.breakTool(tool.mutable().native, player.native);
                }
            }
        }
        if (Math.random() < 0.01) {
            if (Math.random() < 0.07) {
                if (Math.random() < 0.333) {
                    player.warpTemporary += 1; 
                } else if (Math.random() < 0.5) {
                    player.warpTemporary += 2;
                } else {
                    player.warpTemporary += 3;
                }
            }
        }
        if (Math.random() < 0.01) {
            if (Math.random() < 0.002) {
                player.health -= 80.0f;
            }
        }
        if (Math.random() < 0.01) {
            if (Math.random() < 0.01) {
                player.addPotionEffect(<potion:champions:injured>.makePotionEffect(200, 0, false, false));
            }
        }
    }
};
erosionTrait.register();

val tdotblTrait = TraitBuilder.create("the_devour_of_the_betweenlands");
tdotblTrait.color = Color.fromHex("ffffff").getIntColor(); 
tdotblTrait.localizedName = game.localize("greedycraft.tconstruct.tool_trait.tdotblTrait.name");
tdotblTrait.localizedDescription = game.localize("greedycraft.tconstruct.tool_trait.tdotblTrait.desc");
tdotblTrait.calcDamage = function(trait, tool, attacker, target, originalDamage, newDamage, isCritical) {
    if (attacker instanceof IPlayer) {
        var player as IPlayer = attacker;
        if (player.getDimension() == 20) {
            return newDamage * 1.3f;
        }
    }
    return newDamage;
};
tdotblTrait.register();

val tdotbl2Trait = TraitBuilder.create("the_devour_of_the_betweenlands2");
tdotbl2Trait.color = Color.fromHex("ffffff").getIntColor(); 
tdotbl2Trait.localizedName = game.localize("greedycraft.tconstruct.tool_trait.tdotblTrait2.name");
tdotbl2Trait.localizedDescription = game.localize("greedycraft.tconstruct.tool_trait.tdotblTrait2.desc");
tdotbl2Trait.calcDamage = function(trait, tool, attacker, target, originalDamage, newDamage, isCritical) {
    if (attacker instanceof IPlayer) {
        var player as IPlayer = attacker;
        if (player.getDimension() == 20) {
            return newDamage * 1.4f;
        }
    }
    return newDamage;
};
tdotbl2Trait.onUpdate = function(trait, tool, world, owner, itemSlot, isSelected) {
    if (owner instanceof IPlayer && isSelected) {
        var player as IPlayer = owner;
        player.addPotionEffect(<potion:minecraft:speed>.makePotionEffect(1, 3, false, false));
        player.addPotionEffect(<potion:minecraft:water_breathing>.makePotionEffect(1, 0, false, false));
    }
};
tdotbl2Trait.register();

val astralingTrait = TraitBuilder.create("astraling");
astralingTrait.color = Color.fromHex("3cffff").getIntColor(); 
astralingTrait.localizedName = game.localize("greedycraft.tconstruct.tool_trait.astralingTrait.name");
astralingTrait.localizedDescription = game.localize("greedycraft.tconstruct.tool_trait.astralingTrait.desc");
astralingTrait.register();

val starlight_refinedTrait = TraitBuilder.create("starlight_refined");
starlight_refinedTrait.color = Color.fromHex("ffffff").getIntColor(); 
starlight_refinedTrait.localizedName = game.localize("greedycraft.tconstruct.tool_trait.starlight_refinedTrait.name");
starlight_refinedTrait.localizedDescription = game.localize("greedycraft.tconstruct.tool_trait.starlight_refinedTrait.desc");
starlight_refinedTrait.onBlockHarvestDrops = function(thisTrait, tool, event) {
    if (event.block.definition.id == "minecraft:iron_ore") {
        event.dropChance = 0;
        event.player.give(itemUtils.getItem("additions:star_metal_ore"));
    }
};
starlight_refinedTrait.register();

val ethernalTrait = TraitBuilder.create("ethernal");
ethernalTrait.color = Color.fromHex("ffffff").getIntColor(); 
ethernalTrait.localizedName = game.localize("greedycraft.tconstruct.tool_trait.ethernalTrait.name");
ethernalTrait.localizedDescription = game.localize("greedycraft.tconstruct.tool_trait.ethernalTrait.desc");
ethernalTrait.onToolDamage = function(trait, tool, unmodifiedAmount, newAmount, holder) {
    return 0;
};
ethernalTrait.register();

val fascicledTrait = TraitBuilder.create("fascicled");
fascicledTrait.color = Color.fromHex("ffffff").getIntColor(); 
fascicledTrait.localizedName = game.localize("greedycraft.tconstruct.tool_trait.fascicledTrait.name");
fascicledTrait.localizedDescription = game.localize("greedycraft.tconstruct.tool_trait.fascicledTrait.desc");
fascicledTrait.calcDamage = function(trait, tool, attacker, target, originalDamage, newDamage, isCritical) {
    if (attacker instanceof IPlayer) {
        var player as IPlayer = attacker;
        if (!isNull(player.getItemInSlot(offhand))) {
            if (player.getItemInSlot(offhand).definition.id == "additions:valonitedruse") {
                if (isNull(tool.tag.fascicled)) {
                    player.getItemInSlot(offhand).mutable().shrink(1);
                    tool.mutable().updateTag({fascicled : 1 as int}); 
                    client.player.sendChat("\u00A7f\u4F60\u7684\u5DE5\u5177\u5DF2\u7ECF\u9644\u7740\u4E86 1 \u679A\u6CD5\u7F57\u94A0\u6676\u7C07\uFF01");  
                } else {
                    var new as int = tool.tag.fascicled as int + 1;
                    var pass as bool = true;
                    if (new > 250) pass = false;
                    if (pass) {
                        player.getItemInSlot(offhand).mutable().shrink(1);
                        tool.mutable().updateTag({fascicled : new as int});
                        client.player.sendChat("\u00A7f\u4F60\u7684\u5DE5\u5177\u5DF2\u7ECF\u9644\u7740\u4E86 " + new as string + " \u679A\u6CD5\u7F57\u94A0\u6676\u7C07\uFF01");
                    } else {
                        client.player.sendChat("\u00A7f\u4F60\u7684\u5DE5\u5177\u9644\u7740\u7684\u6CD5\u7F57\u94A0\u6676\u7C07\u6570\u91CF\u5DF2\u8FBE\u5230\u4E0A\u9650\uFF01");
                    }
                }
            }
        }
        if (!isNull(tool.tag.fascicled)) {
            var level as int = tool.tag.fascicled as int;
            var mtp as float = 0.18f * (level as float);
            return newDamage + mtp;
        }
    }
    return newDamage;
};
fascicledTrait.onUpdate = function(trait, tool, world, owner, itemSlot, isSelected) {
    if (!isNull(tool.tag.fascicled)) {
        var level as int = tool.tag.fascicled as int;
        tool.mutable().updateTag({display : {Lore : ["\u7C07\u751F\uFF1A" + level as string + "\u679A"]}});
    }
};
fascicledTrait.register();

val fragmentationTrait = TraitBuilder.create("fragmentation");
fragmentationTrait.color = Color.fromHex("ffffff").getIntColor(); 
fragmentationTrait.localizedName = game.localize("greedycraft.tconstruct.tool_trait.fragmentationTrait.name");
fragmentationTrait.localizedDescription = game.localize("greedycraft.tconstruct.tool_trait.fragmentationTrait.desc");
fragmentationTrait.calcDamage = function(trait, tool, attacker, target, originalDamage, newDamage, isCritical) {
    if (attacker instanceof IPlayer) {
        var player as IPlayer = attacker;
        if (Math.random() < 0.05) {
            var random as double = Math.random() as double;
            if (random <= 0.45) {
                player.give(itemUtils.getItem("thebetweenlands:sap_spit"));
            } else if (random <= 0.75) {
                player.give(itemUtils.getItem("mysticalagriculture:valonite_essence"));
            } else if (random <= 0.95) {
                player.give(itemUtils.getItem("thebetweenlands:items_misc:19"));
            } else {
                player.give(itemUtils.getItem("additions:valonitedruse"));
            }
            return newDamage * 0.3f;
        }
    }
    return newDamage;
};
fragmentationTrait.register();

val betweenland_controllerTrait = TraitBuilder.create("betweenland_controller");
betweenland_controllerTrait.color = Color.fromHex("ffffff").getIntColor(); 
betweenland_controllerTrait.localizedName = game.localize("greedycraft.tconstruct.tool_trait.betweenland_controllerTrait.name");
betweenland_controllerTrait.localizedDescription = game.localize("greedycraft.tconstruct.tool_trait.betweenland_controllerTrait.desc");
betweenland_controllerTrait.calcDamage = function(trait, tool, attacker, target, originalDamage, newDamage, isCritical) {
    if (attacker instanceof IPlayer) {
        var player as IPlayer = attacker;
        if (target.definition.id has "betweenland") {
            if (target.isBoss) return newDamage;
            return newDamage * 2.5f;
        }
    }
    return newDamage;
};
betweenland_controllerTrait.register();

val malevolenceTrait = TraitBuilder.create("malevolence");
malevolenceTrait.color = Color.fromHex("ffffff").getIntColor(); 
malevolenceTrait.localizedName = game.localize("greedycraft.tconstruct.tool_trait.malevolenceTrait.name");
malevolenceTrait.localizedDescription = game.localize("greedycraft.tconstruct.tool_trait.malevolenceTrait.desc");
malevolenceTrait.onHit = function(trait, tool, attacker, target, damage, isCritical) {
    if (attacker instanceof IPlayer) {
        var player as IPlayer = attacker;
        if (Math.random() < 0.05) {
            player.health -= player.maxHealth * 0.13d;
        }
    }
};
malevolenceTrait.register();

val stackedTrait = TraitBuilder.create("stacked");
stackedTrait.color = Color.fromHex("ffffff").getIntColor(); 
stackedTrait.localizedName = game.localize("greedycraft.tconstruct.tool_trait.stackedTrait.name");
stackedTrait.localizedDescription = game.localize("greedycraft.tconstruct.tool_trait.stackedTrait.desc");
stackedTrait.calcDamage = function(trait, tool, attacker, target, originalDamage, newDamage, isCritical) {
    if (attacker instanceof IPlayer) {
        var player as IPlayer = attacker;
        var armor as float = player.totalArmorValue as float;
        var mtp as float = 1.0f + armor * 0.005f as float;
        return newDamage * mtp;
    }
    return newDamage;
};
stackedTrait.register();

val extra_healthTrait = TraitBuilder.create("extra_health");
extra_healthTrait.color = Color.fromHex("ffffff").getIntColor(); 
extra_healthTrait.localizedName = game.localize("greedycraft.tconstruct.tool_trait.extra_healthTrait.name");
extra_healthTrait.localizedDescription = game.localize("greedycraft.tconstruct.tool_trait.extra_healthTrait.desc");
extra_healthTrait.onToolDamage = function(trait, tool, unmodifiedAmount, newAmount, holder) {
    if (Math.random() < 0.01) {
        return -1200 as int;
    } else {
        return newAmount;
    }
    return newAmount;
};
extra_healthTrait.register();

val radianceTrait = TraitBuilder.create("radiance");
radianceTrait.color = Color.fromHex("ffffff").getIntColor(); 
radianceTrait.localizedName = game.localize("greedycraft.tconstruct.tool_trait.radianceTrait.name");
radianceTrait.localizedDescription = game.localize("greedycraft.tconstruct.tool_trait.radianceTrait.desc");
radianceTrait.afterHit = function(trait, tool, attacker, target, damageDealt, wasCritical, wasHit) {
    if (attacker instanceof IPlayer) {
        var player as IPlayer = attacker;
        var world as IWorld = attacker.world;
        for entity in world.getEntitiesInArea(crafttweaker.util.Position3f.create(((target.x)- 3),((target.y)- 3),((target.z)- 3)),crafttweaker.util.Position3f.create(((target.x)+ 3),((target.y)+ 3),((target.z)+ 3))){
            if (entity instanceof IEntityLivingBase && !entity instanceof IPlayer) {
                var en as IEntityLivingBase = entity;
                if (en.id != target.id) en.attackEntityFrom(<damageSource:MAGIC>, damageDealt * 0.7f);
            }
        }
    }
};
radianceTrait.register();

val ender_lordTrait = TraitBuilder.create("ender_lord");
ender_lordTrait.color = Color.fromHex("ffffff").getIntColor(); 
ender_lordTrait.localizedName = game.localize("greedycraft.tconstruct.tool_trait.ender_lordTrait.name");
ender_lordTrait.localizedDescription = game.localize("greedycraft.tconstruct.tool_trait.ender_lordTrait.desc");
ender_lordTrait.calcDamage = function(trait, tool, attacker, target, originalDamage, newDamage, isCritical) {
    if (attacker instanceof IPlayer) {
        var player as IPlayer = attacker;
        if (target instanceof IEntityLivingBase) {
            var entity as IEntityLivingBase = target;
            if ((entity.definition.name has "ender")||(target.definition.name has "Ender")) return newDamage * 2.5f;
        }
    }
    return newDamage;
};
ender_lordTrait.register();

val parasitismTrait = TraitBuilder.create("parasitism");
parasitismTrait.color = Color.fromHex("ffffff").getIntColor(); 
parasitismTrait.localizedName = game.localize("greedycraft.tconstruct.tool_trait.parasitismTrait.name");
parasitismTrait.localizedDescription = game.localize("greedycraft.tconstruct.tool_trait.parasitismTrait.desc");
parasitismTrait.onUpdate = function(trait, tool, world, owner, itemSlot, isSelected) {
    if (owner instanceof IPlayer) {
        var player as IPlayer = owner;
        if (isNull(tool.tag.parasitism)) {
            tool.mutable().updateTag({parasitism : 0 as int});
        }
        if (Math.random() < 0.001) {
            var traits as string[] = CotTicTraitLib.getTicTrait(tool);
            var traitcounts as int = traits.length as int;
            var count as int = Math.floor((Math.random() as float * traitcounts as float)) as int;
            var choice as string = traits[count];
            if ((CotTicTraitLib.getTraitColor(tool, "parasitism") != CotTicTraitLib.getTraitColor(tool, choice)) && (choice != "tool_leveling") && (choice != "parasitism") && (choice != "leveling_durability") && !(choice has "draconic_") && !(choice has "evolved")) {
                var pass as bool = true;
                if (!isNull(tool.tag.parasitismTraits)) {
                    for i in 0 to tool.tag.parasitismTraits.length {
                        if (tool.tag.parasitismTraits[i].name as string == choice) pass = false;
                    }
                }
                if (pass) {
                    CotTicTraitLib.removeTicTrait(tool, choice, CotTicTraitLib.getTraitColor(tool, choice), CotTicTraitLib.getTraitLevel(tool, choice));
                    var time as int = tool.tag.parasitism as int + 1;
                    var data as IData = [{name : choice as string}];
                    tool.mutable().updateTag({parasitism : time, parasitismTraits : tool.tag.parasitismTraits.deepUpdate(data, MERGE)});
                }
            }
        }
        if (!isNull(tool.tag.parasitism)) {
            if (tool.tag.parasitism as int >= 20) {
                tool.mutable().updateTag({parasitism : 20});
            }
            var level as int = tool.tag.parasitism as int;
            tool.mutable().updateTag({display : {Lore : ["\u00A7f\u5BC4\u751F\uFF1A" + level as string + "\u7EA7"]}});
        }
        if (!isNull(tool.tag.parasitismTraits)) {
            for i in 0 to tool.tag.parasitismTraits.length {
                for traitid in CotTicTraitLib.getTicTrait(tool) {
                    if (tool.tag.parasitismTraits[i].name as string == traitid) {
                        CotTicTraitLib.removeTicTrait(tool, traitid, CotTicTraitLib.getTraitColor(tool, traitid), CotTicTraitLib.getTraitLevel(tool, traitid));
                    }
                }
            }
        }
        var materials as IData = tool.tag.TinkerData.Materials;
        if (isNull(tool.tag.parasitismMats)) {
            tool.mutable().updateTag({parasitismMats : materials});
        }
    }
};
parasitismTrait.calcDamage = function(trait, tool, attacker, target, originalDamage, newDamage, isCritical) {
    if (!isNull(tool.tag.parasitism)) {
        var level as int = tool.tag.parasitism as int;
        var mtp as float = 0.2f * level as float;
        if (!isNull(tool.tag.parasitismMats)) {
            if (tool.tag.TinkerData.Materials as string != tool.tag.parasitismMats as string) {
                return 0.0f;
            }
        }
        return newDamage * (1.0f + mtp);
    }
    return newDamage;
};
parasitismTrait.register();

val sharper_harvestingTrait = TraitBuilder.create("sharper_harvesting");
sharper_harvestingTrait.color = Color.fromHex("ffffff").getIntColor(); 
sharper_harvestingTrait.localizedName = game.localize("greedycraft.tconstruct.tool_trait.sharper_harvestingTrait.name");
sharper_harvestingTrait.localizedDescription = game.localize("greedycraft.tconstruct.tool_trait.sharper_harvestingTrait.desc");
sharper_harvestingTrait.calcDamage = function(trait, tool, attacker, target, originalDamage, newDamage, isCritical) {
    if (attacker instanceof IPlayer) {
        var player as IPlayer = attacker;
        var listTools as IItemStack[] = [
            <item:tconstruct:hammer>,
            <item:tconstruct:pickaxe>,
            <item:tconstruct:shovel>,
            <item:tconstruct:excavator>,
            <item:moretcon:blshovel>,
            <item:moretcon:blpick>
        ];
        for listTool in listTools {
            if (listTool.definition.id == tool.definition.id) {
                return newDamage * 1.6f;
            }
        }
    }
    return newDamage;
};
sharper_harvestingTrait.register();

val solemnlamentTrait = TraitBuilder.create("solemnlament");
solemnlamentTrait.color = Color.fromHex("ffffff").getIntColor(); 
solemnlamentTrait.localizedName = game.localize("greedycraft.tconstruct.tool_trait.solemnlamentTrait.name");
solemnlamentTrait.localizedDescription = game.localize("greedycraft.tconstruct.tool_trait.solemnlamentTrait.desc");
solemnlamentTrait.calcDamage = function(trait, tool, attacker, target, originalDamage, newDamage, isCritical) {
    if (attacker instanceof IPlayer) {
        var player as IPlayer = attacker;
        if (target instanceof IEntityLivingBase) {
            var entity as IEntityLivingBase = target;
            if (entity.tags has "solemnlament") {
                entity.removeTag("solemnlament");
                entity.attackEntityFrom(<damageSource:MAGIC>, originalDamage * 0.65f);
                return newDamage;
            } else {
                entity.addTag("solemnlament");
                return newDamage * 0.5f;
            }
        }
    }
    return newDamage;
};
solemnlamentTrait.register();

val flyingbutterflyTrait = TraitBuilder.create("flying_butterfly");
flyingbutterflyTrait.color = Color.fromHex("ffffff").getIntColor(); 
flyingbutterflyTrait.localizedName = game.localize("greedycraft.tconstruct.tool_trait.flyingbutterflyTrait.name");
flyingbutterflyTrait.localizedDescription = game.localize("greedycraft.tconstruct.tool_trait.flyingbutterflyTrait.desc");
flyingbutterflyTrait.onUpdate = function(trait, tool, world, owner, itemSlot, isSelected) {
    if (owner instanceof IPlayer) {
        var player as IPlayer = owner;
        CotTicLib.addTicMiningSpeed(tool, 15, "butterfly_harvest");
        CotTicLib.addTicAttackSpeedMultiplier(tool, 0.5, "butterfly_attackspeed");
    }
};
flyingbutterflyTrait.register();

function harvestBlock(blockpos as IBlockPos, tool as IItemStack, player as IPlayer) {
    var block as IBlock = player.world.getBlock(blockpos);
    if (!(blockpos.getY() <= 0 || blockpos.getY() >= 256 || player.world.isAirBlock(blockpos))) {
        if (!isNull(tool.tag.Stats.HarvestLevel)) {
            if (tool.tag.Stats.HarvestLevel >= block.definition.harvestLevel) {
                if (block.definition.hardness != -1) {
                    player.world.destroyBlock(blockpos, true);
                }
            }   
        }
    }
}

val fractureTrait = TraitBuilder.create("fracture_refined");
fractureTrait.color = Color.fromHex("ffffff").getIntColor(); 
fractureTrait.localizedName = game.localize("greedycraft.tconstruct.tool_trait.fractureTrait.name");
fractureTrait.localizedDescription = game.localize("greedycraft.tconstruct.tool_trait.fractureTrait.desc");
fractureTrait.afterBlockBreak = function(trait, tool, world, blockstate, blockPos, miner, wasEffective) {
    if (miner instanceof IPlayer) {
        var player as IPlayer = miner;
        var facing as IFacing = IFacing.getDirectionFromEntityLiving(blockPos, player).opposite();
        for i in 1 to Math.floor(Math.random() * 6) as int {
            if (!(world.isRemote())) {
                harvestBlock(blockPos.getOffset(facing, i), tool, player);
            }
        }
    }
};
fractureTrait.register();

val fracture2Trait = TraitBuilder.create("fracture2");
fracture2Trait.color = Color.fromHex("ffffff").getIntColor(); 
fracture2Trait.localizedName = game.localize("greedycraft.tconstruct.tool_trait.fracture2Trait.name");
fracture2Trait.localizedDescription = game.localize("greedycraft.tconstruct.tool_trait.fracture2Trait.desc");
fracture2Trait.afterBlockBreak = function(trait, tool, world, blockstate, blockPos, miner, wasEffective) {
    if (miner instanceof IPlayer) {
        var player as IPlayer = miner;
        var facing as IFacing = IFacing.getDirectionFromEntityLiving(blockPos, player).opposite();
        for i in 1 to 6 {
            if (!(world.isRemote())) {
                harvestBlock(blockPos.getOffset(facing, i), tool, player);
            }
        }
    }
};
fracture2Trait.register();

val maze_breakerTrait = TraitBuilder.create("maze_breaker");
maze_breakerTrait.color = Color.fromHex("ffffff").getIntColor(); 
maze_breakerTrait.localizedName = game.localize("greedycraft.tconstruct.tool_trait.maze_breakerTrait.name");
maze_breakerTrait.localizedDescription = game.localize("greedycraft.tconstruct.tool_trait.maze_breakerTrait.desc");
maze_breakerTrait.getMiningSpeed = function(trait, tool, event) {
    if (event.block.definition.id has "maze_stone") {
        event.newSpeed = event.originalSpeed * 1000.0f;
    }
};
maze_breakerTrait.onBlockHarvestDrops = function(thisTrait, tool, event) {
    if (event.block.definition.id has "maze_stone") {
        ToolHelper.healTool(tool.mutable().native, 17, event.player.native);
    }
};
maze_breakerTrait.register();

val slowdownTrait = TraitBuilder.create("slowdown");
slowdownTrait.color = Color.fromHex("ffffff").getIntColor(); 
slowdownTrait.localizedName = game.localize("greedycraft.tconstruct.tool_trait.slowdownTrait.name");
slowdownTrait.localizedDescription = game.localize("greedycraft.tconstruct.tool_trait.slowdownTrait.desc");
slowdownTrait.register();


function getOverslime(tool as IItemStack) as int {
    if (!isNull(tool.tag."moretcon.overslime".remaining)) {
        return tool.tag."moretcon.overslime".remaining as int;
    }
    return 0;
}

val overdominateTrait = TraitBuilder.create("overdominate");
overdominateTrait.color = Color.fromHex("ffa000").getIntColor(); 
overdominateTrait.localizedName = game.localize("greedycraft.tconstruct.tool_trait.overdominateTrait.name");
overdominateTrait.localizedDescription = game.localize("greedycraft.tconstruct.tool_trait.overdominateTrait.desc");
overdominateTrait.calcDamage = function(trait, tool, attacker, target, originalDamage, newDamage, isCritical) {
    if (attacker instanceof IPlayer) {
        var player as IPlayer = attacker;
        var overslime as int = getOverslime(tool) as int;
        if (overslime <= 10000) {
            var mutiplier as float = (Math.sqrt(overslime) / 100) as float;
            return newDamage * (1.0f + mutiplier) as float;
        } else {
            return newDamage * 2.0f;
        }
    }
    return newDamage;
};
overdominateTrait.register();

val erase_commandTrait = TraitBuilder.create("erase_command");
erase_commandTrait.color = Color.fromHex("f64700").getIntColor(); 
erase_commandTrait.localizedName = game.localize("greedycraft.tconstruct.tool_trait.erase_commandTrait.name");
erase_commandTrait.localizedDescription = game.localize("greedycraft.tconstruct.tool_trait.erase_commandTrait.desc");
erase_commandTrait.maxLevel = 5;
erase_commandTrait.countPerLevel = 1;
erase_commandTrait.addItem(<item:gct_ores:command_core>);
erase_commandTrait.onHit = function(trait, tool, attacker, target, damage, isCritical) {
    if (attacker instanceof IPlayer && target instanceof IEntityLivingBase) {
        var entity as IEntityLivingBase = target;
        var player as IPlayer = attacker;
        if (!isNull(entity.definition)) {
            if (entity.definition.id has "witherstorm") {
                var level as int = trait.getData(tool).level as int;
                if (!isNull(<ticontrait:stormy>.getData(tool))) {
                    if (<ticontrait:stormy>.getData(tool).level == 1) {
                        level *= 2;
                    }
                }
                if (entity.health > 100 * level as float) {
                    entity.health -= (100 * level as float);
                } else {
                    var dmg as IDamageSource = IDamageSource.createPlayerDamage(player);
                    entity.attackEntityFrom(dmg, 2147483647.0f);
                }
            }
        }
    }
};
erase_commandTrait.register();

val wyvernTrait = TraitBuilder.create("wyvern");
wyvernTrait.color = Color.fromHex("ffa000").getIntColor(); 
wyvernTrait.localizedName = game.localize("greedycraft.tconstruct.tool_trait.wyvernTrait.name");
wyvernTrait.localizedDescription = game.localize("greedycraft.tconstruct.tool_trait.wyvernTrait.desc");
wyvernTrait.calcDamage = function(trait, tool, attacker, target, originalDamage, newDamage, isCritical) {
    if (attacker instanceof IPlayer && target instanceof IEntityLivingBase) {
        var entity as IEntityLivingBase = target;
        if (!isNull(entity.definition) && entity.definition.id has "ender_dragon") {
            return newDamage * 2.0f;
        }
    }
    return newDamage;
};
wyvernTrait.register();

val fallenTrait = TraitBuilder.create("fallen");
fallenTrait.color = Color.fromHex("ffa000").getIntColor(); 
fallenTrait.localizedName = game.localize("greedycraft.tconstruct.tool_trait.fallenTrait.name");
fallenTrait.localizedDescription = game.localize("greedycraft.tconstruct.tool_trait.fallenTrait.desc");
fallenTrait.calcDamage = function(trait, tool, attacker, target, originalDamage, newDamage, isCritical) {
    if (attacker instanceof IPlayer && target instanceof IEntityLivingBase) {
        var entity as IEntityLivingBase = target;
        if (!isNull(entity.definition) && entity.definition.id has "minecraft:wither") {
            return newDamage * 2.0f;
        }
    }
    return newDamage;
};
fallenTrait.register();

val draconicTrait = TraitBuilder.create("draconic");
draconicTrait.color = Color.fromHex("ffa000").getIntColor(); 
draconicTrait.localizedName = game.localize("greedycraft.tconstruct.tool_trait.draconicTrait.name");
draconicTrait.localizedDescription = game.localize("greedycraft.tconstruct.tool_trait.draconicTrait.desc");
draconicTrait.calcDamage = function(trait, tool, attacker, target, originalDamage, newDamage, isCritical) {
    if (attacker instanceof IPlayer && target instanceof IEntityLivingBase) {
        var entity as IEntityLivingBase = target;
        if (!isNull(entity.definition) && entity.definition.id has "ender_dragon") {
            return newDamage * 3.0f;
        }
    }
    return newDamage;
};
draconicTrait.register();

val relifedTrait = TraitBuilder.create("relifed");
relifedTrait.color = Color.fromHex("ffa000").getIntColor(); 
relifedTrait.localizedName = game.localize("greedycraft.tconstruct.tool_trait.relifedTrait.name");
relifedTrait.localizedDescription = game.localize("greedycraft.tconstruct.tool_trait.relifedTrait.desc");
relifedTrait.calcDamage = function(trait, tool, attacker, target, originalDamage, newDamage, isCritical) {
    if (attacker instanceof IPlayer && target instanceof IEntityLivingBase) {
        var entity as IEntityLivingBase = target;
        if (!isNull(entity.definition) && entity.definition.id has "minecraft:wither") {
            return newDamage * 3.0f;
        }
    }
    return newDamage;
};
relifedTrait.register();

val chaoticTrait = TraitBuilder.create("chaotic");
chaoticTrait.color = Color.fromHex("ffa000").getIntColor(); 
chaoticTrait.localizedName = game.localize("greedycraft.tconstruct.tool_trait.chaoticTrait.name");
chaoticTrait.localizedDescription = game.localize("greedycraft.tconstruct.tool_trait.chaoticTrait.desc");
chaoticTrait.calcDamage = function(trait, tool, attacker, target, originalDamage, newDamage, isCritical) {
    if (attacker instanceof IPlayer && target instanceof IEntityLivingBase) {
        var entity as IEntityLivingBase = target;
        if (!isNull(entity.definition) && entity.definition.id has "minecraft:ender_dragon") {
            return newDamage * 4.0f;
        } else if (!isNull(entity.definition) && entity.definition.id has "draconicevolution") {
            return newDamage * 2.0f;
        }
    }
    return newDamage;
};
chaoticTrait.register();

val stormyTrait = TraitBuilder.create("stormy");
stormyTrait.color = Color.fromHex("ffa000").getIntColor(); 
stormyTrait.localizedName = game.localize("greedycraft.tconstruct.tool_trait.stormyTrait.name");
stormyTrait.localizedDescription = game.localize("greedycraft.tconstruct.tool_trait.stormyTrait.desc");
stormyTrait.calcDamage = function(trait, tool, attacker, target, originalDamage, newDamage, isCritical) {
    if (attacker instanceof IPlayer && target instanceof IEntityLivingBase) {
        var entity as IEntityLivingBase = target;
        if (!isNull(entity.definition) && entity.definition.id has "minecraft:wither") {
            return newDamage * 4.0f;
        }
    }
    return newDamage;
};
stormyTrait.register();

val orderedTrait = TraitBuilder.create("ordered");
orderedTrait.color = Color.fromHex("ffa000").getIntColor(); 
orderedTrait.localizedName = game.localize("greedycraft.tconstruct.tool_trait.orderedTrait.name");
orderedTrait.localizedDescription = game.localize("greedycraft.tconstruct.tool_trait.orderedTrait.desc");
orderedTrait.calcDamage = function(trait, tool, attacker, target, originalDamage, newDamage, isCritical) {
    if (attacker instanceof IPlayer && target instanceof IEntityLivingBase) {
        var entity as IEntityLivingBase = target;
        if (entity.isBoss) {
            return newDamage * 1.5f;
        }
    }
    return newDamage;
};
orderedTrait.register();

function getEntityBiome(entity as IEntity) as IBiome {
    return entity.world.getBiome(entity.getPosition3f()) as IBiome;
}

//寰球
//§o探索的时光proooooo\n§r你走过的生物群系将强化你的工具！
val globiomeTrait = TraitBuilder.create("globiome");
globiomeTrait.color = Color.fromHex("ffffff").getIntColor(); 
globiomeTrait.localizedName = game.localize("greedycraft.tconstruct.tool_trait.globiomeTrait.name");
globiomeTrait.localizedDescription = game.localize("greedycraft.tconstruct.tool_trait.globiomeTrait.desc");
globiomeTrait.onUpdate = function(trait, tool, world, owner, itemSlot, isSelected) {
    if (owner instanceof IPlayer) {
        var player as IPlayer = owner;
        var biome as IBiome = getEntityBiome(player);
        if (isNull(tool.tag.globiome)) {
            var newBiomeSet as IData = [biome.name as string] as IData;
            tool.mutable().updateTag(
                {globiome : newBiomeSet}
            );
        } else {
            var biomesTag as IData = tool.tag.globiome as IData;
            var isNewBiome as bool = true;
            for i in 0 to (biomesTag.length as int) {
                if (biomesTag[i] as string == biome.name) isNewBiome = false;             
            }
            if (isNewBiome) {
                var newBiomeSet as IData = [biome.name as string];
                biomesTag = biomesTag.deepUpdate(newBiomeSet, MERGE);
                tool.mutable().updateTag(
                    {globiome: biomesTag}
                );
            }
        }
    }
};
globiomeTrait.calcDamage = function(trait, tool, attacker, target, originalDamage, newDamage, isCritical) {
    if (attacker instanceof IPlayer && !isNull(tool.tag.globiome)) {
        var length as int = (tool.tag.globiome as IData).length as int;
        return newDamage * (1.0f + lognum(10, length)) as float;
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
    "wyvern" : 1,
    "fallen" : 1,
    "draconic" : 2,
    "relifed": 2,
    "chaotic" : 3,
    "stormy" : 3,
    "ordered" : 4
};

//游戏难度
//§o快说：谢谢ED！\n§r工具耐久损耗将受到游戏难度加成。
val leveling_durabilityTrait = TraitBuilder.create("leveling_durability");
leveling_durabilityTrait.color = Color.fromHex("ffffff").getIntColor(); 
leveling_durabilityTrait.localizedName = game.localize("greedycraft.tconstruct.tool_trait.leveling_durabilityTrait.name");
leveling_durabilityTrait.localizedDescription = game.localize("greedycraft.tconstruct.tool_trait.leveling_durabilityTrait.desc");
leveling_durabilityTrait.hidden = true;
leveling_durabilityTrait.onToolDamage = function(trait, tool, unmodifiedAmount, newAmount, holder) {
    if (holder instanceof IPlayer && !holder.world.isRemote()) {

        var player as IPlayer = holder;
        var extradamage as int = 0;

        if (!isNull(tool.tag.Energy)) {extradamage = tool.tag.Energy.asInt();}
        if (!isNull(tool.tag.EnergizedEnergy)) {extradamage = tool.tag.EnergizedEnergy.asInt();}
        if (!isNull(tool.tag.FluxedEnergy)) {extradamage = tool.tag.FluxedEnergy.asInt();}
        if (!isNull(tool.tag.EvolvedEnergy)) {extradamage = tool.tag.EvolvedEnergy.asInt();}

        extradamage = (extradamage / 640);

        var difficulty as float = player.difficulty as float;
        var needDamage = 1 + Math.ceil(pow((difficulty / 256), 1.5));
        needDamage *= unmodifiedAmount;

        if (needDamage > (tool.maxDamage - tool.damage + extradamage)) {
            ToolHelper.breakTool(tool.mutable().native, player.native);
        } else {
            tool.mutable().attemptDamageItemWithEnergy(needDamage, player);
        }
    }
    return 0;
};/*
leveling_durabilityTrait.afterBlockBreak = function(trait, tool, world, blockstate, blockPos, miner, wasEffective) {
    if (miner instanceof IPlayer) {
        var player as IPlayer = miner;
        var difficulty as int = DifficultyManager.getDifficulty(player) as int;
        var mtp as float = 1.0f;
        if (difficulty < 256) {
            mtp = (1.0f / 640.0f) * difficulty as float + 1.0f;
        } else {
            mtp = (93.0f / 4160.0f) * difficulty as float - (43.0f / 13.0f) as float;
        }
        if (min((tool.maxDamage * 0.03f),(tool.damage + 2 * mtp)) as int >= (tool.maxDamage - tool.damage)) {
            ToolHelper.breakTool(tool.mutable().native, player.native);
        } else {
            tool.mutable().attemptDamageItemWithEnergy(min((tool.maxDamage * 0.03f) as int,(2 * (mtp - 1.0f) as float) as int), player);
        }
    }
}; */
leveling_durabilityTrait.onUpdate = function(trait, tool, world, owner, itemSlot, isSelected) {
    if (!isNull(tool.tag.Unbreakable)) {
        if (tool.tag.Unbreakable as byte == 1 as byte) {
            tool.mutable().updateTag({Unbreakable : 0 as byte});
        }
    }
    //Draconic Evolution Tweaks
    /*
    if (!isNull(tool.tag.EvolvedTier)) {
        var materialIdlist as string[] = [];
        if (CotTicLib.getTicMaterial(tool).length != 0) {
            materialIdlist = CotTicLib.getTicMaterial(tool) as string[];
        }
        for metal in EvolvedTiersMap {
            for materialId in materialIdlist {
            if (materialId == metal) {
                    var tier as int = EvolvedTiersMap[metal] as int;
                    if (tool.tag.EvolvedTier as int < tier) {
                        if (tier >= 3) {
                            tool.mutable().updateTag({EvolvedTier: 3, EvolvedTierExtra: tier as int});
                        } else {
                            tool.mutable().updateTag({EvolvedTier: tier as int, EvolvedTierExtra: tier as int});
                        }
                    }
                    break;
                }
            }
        }
    }*/

    if (!isNull(tool.tag.EvolvedTier)) {
        var traitIdlist as string[] = [];
        if (CotTicTraitLib.getTicTrait(tool).length != 0) {
            traitIdlist = CotTicTraitLib.getTicTrait(tool) as string[];
        }
        for trait in EvolvedTiersMap1 {
            for traitId in traitIdlist {
            if (traitId == trait) {
                    var tier as int = EvolvedTiersMap1[trait] as int;
                    if (tool.tag.EvolvedTier as int < tier) {
                        if (tier >= 3) {
                            tool.mutable().updateTag({EvolvedTier: 3, EvolvedTierExtra: tier as int});
                        } else {
                            tool.mutable().updateTag({EvolvedTier: tier as int, EvolvedTierExtra: tier as int});
                        }
                    }
                    break;
                }
            }
        }
    }
};
leveling_durabilityTrait.register();

//倒置
//§o啊？彩蛋！\n§r攻击时使敌人翻转，对翻转的目标造成更高伤害！
val turning_downTrait = TraitBuilder.create("turning_down");
turning_downTrait.color = Color.fromHex("ffffff").getIntColor(); 
turning_downTrait.localizedName = game.localize("greedycraft.tconstruct.tool_trait.turning_downTrait.name");
turning_downTrait.localizedDescription = game.localize("greedycraft.tconstruct.tool_trait.turning_downTrait.desc");
turning_downTrait.onHit = function(trait, tool, attacker, target, damage, isCritical) {
    if (attacker instanceof IPlayer && !(target instanceof IPlayer)) {
        var player as IPlayer = attacker;
        if (Math.random() < 0.1f && !target.hasCustomName) {
            target.setCustomName("Dinnerbone");
        }
        if (Math.random() < 0.05f && target.hasCustomName) {
            if (target.customName as string == "Dinnerbone") target.setCustomName("");
        }
    }
};
turning_downTrait.calcDamage = function(trait, tool, attacker, target, originalDamage, newDamage, isCritical) {
    if (attacker instanceof IPlayer && !(target instanceof IPlayer) && target instanceof IEntityLivingBase) {
        var entity as IEntityLivingBase = target;
        var player as IPlayer = attacker;
        if (target.hasCustomName) {
            if (target.customName as string == "Dinnerbone") {
                return newDamage * 1.65f;
            }
        }
    }
    return newDamage;
};
turning_downTrait.register();

//终了结束
//§o都停下来！\n§r削减对手的护甲！
val finiteTrait = TraitBuilder.create("finite");
finiteTrait.color = Color.fromHex("ffffff").getIntColor(); 
finiteTrait.localizedName = game.localize("greedycraft.tconstruct.tool_trait.finiteTrait.name");
finiteTrait.localizedDescription = game.localize("greedycraft.tconstruct.tool_trait.finiteTrait.desc");
finiteTrait.afterHit = function(trait, tool, attacker, target, damageDealt, wasCritical, wasHit) {
    if (attacker instanceof IPlayer && !(target instanceof IPlayer)) {
        var player as IPlayer = attacker;
        var maxArmorBase as int = target.getAttribute("generic.armor").getBaseValue() as int;
        if (maxArmorBase >= 10) {
            target.getAttribute("generic.armor").setBaseValue(0.85d * maxArmorBase as double);
        }
    }
};
finiteTrait.register();

function harvestBlockIfSame(blockposHarvest as IBlockPos, blockposCompare as IBlockPos, tool as IItemStack, player as IPlayer) {
    var block1 as IBlock = player.world.getBlock(blockposHarvest);
    var block2 as IBlock = player.world.getBlock(blockposCompare);
    if (block1.definition.id == block2.definition.id) {
        harvestBlock(blockposHarvest, tool, player);
    }
}

//并联
//§o啥？你故意的吧？\n§r挖掘方块时，可以挖掉其周围的同种方块。
val parallelingTrait = TraitBuilder.create("paralleling");
parallelingTrait.color = Color.fromHex("ffffff").getIntColor(); 
parallelingTrait.localizedName = game.localize("greedycraft.tconstruct.tool_trait.parallelingTrait.name");
parallelingTrait.localizedDescription = game.localize("greedycraft.tconstruct.tool_trait.parallelingTrait.desc");
parallelingTrait.afterBlockBreak = function(trait, tool, world, blockstate, blockPos, miner, wasEffective) {
    if (miner instanceof IPlayer) {
        var player as IPlayer = miner;
        if (!(world.isRemote())) {
            harvestBlockIfSame(blockPos.getOffset(IFacing.north(), 1), blockPos, tool, player);
            harvestBlockIfSame(blockPos.getOffset(IFacing.south(), 1), blockPos, tool, player);
            harvestBlockIfSame(blockPos.getOffset(IFacing.east(), 1), blockPos, tool, player);
            harvestBlockIfSame(blockPos.getOffset(IFacing.west(), 1), blockPos, tool, player);
            harvestBlockIfSame(blockPos.getOffset(IFacing.up(), 1), blockPos, tool, player);
            harvestBlockIfSame(blockPos.getOffset(IFacing.down(), 1), blockPos, tool, player);            
        }
    }
};
parallelingTrait.register();

//万象
//§o兼收并蓄。\n§r对于非原版的生物和方块作用效果更好。
val panoramaTrait = TraitBuilder.create("panorama");
panoramaTrait.color = Color.fromHex("ffffff").getIntColor(); 
panoramaTrait.localizedName = game.localize("greedycraft.tconstruct.tool_trait.panoramaTrait.name");
panoramaTrait.localizedDescription = game.localize("greedycraft.tconstruct.tool_trait.panoramaTrait.desc");
panoramaTrait.calcDamage = function(trait, tool, attacker, target, originalDamage, newDamage, isCritical) {
    if (attacker instanceof IPlayer) {
        var player as IPlayer = attacker;
        if (!isNull(target.definition)) {
            if (target.definition.id.split(":")[0] != "minecraft") {
                return newDamage * 1.3f;
            }
        }
    }
    return newDamage;
};
panoramaTrait.getMiningSpeed = function(trait, tool, event) {
    val player as IPlayer = event.player;
    if (event.block.definition.id.split(":")[0] != "minecraft") {
        event.newSpeed = event.originalSpeed * 1.5f;
    }
};
panoramaTrait.register();

//基石
//§o它如基岩一般！\n§r你的工具仅会有20%几率消耗耐久。
val bedrockTrait = TraitBuilder.create("bedrock");
bedrockTrait.color = Color.fromHex("ffffff").getIntColor(); 
bedrockTrait.localizedName = game.localize("greedycraft.tconstruct.tool_trait.bedrockTrait.name");
bedrockTrait.localizedDescription = game.localize("greedycraft.tconstruct.tool_trait.bedrockTrait.desc");
bedrockTrait.onToolDamage = function(trait, tool, unmodifiedAmount, newAmount, holder) {
    if (Math.random() < 0.85f) {
        return 0;
    }
    return newAmount;
};
bedrockTrait.register();

val pureTrait = TraitBuilder.create("pure");
pureTrait.color = Color.fromHex("ffffff").getIntColor();
pureTrait.localizedName = game.localize("greedycraft.tconstruct.tool_trait.pureTrait.name");
pureTrait.localizedDescription = game.localize("greedycraft.tconstruct.tool_trait.pureTrait.desc");
pureTrait.calcDamage = function(trait, tool, attacker, target, originalDamage, newDamage, isCritical) {
    if (attacker instanceof IPlayer) {
        return newDamage * 3.0f;
    }
    return newDamage;
};
pureTrait.onUpdate = function(trait, tool, world, owner, itemSlot, isSelected) {
    if (owner instanceof IPlayer && isSelected) {
        var player as IPlayer = owner;
        if (player.health > 1.0f) player.health = 1.0f;
    }
};
pureTrait.register();
events.onEntityLivingHeal(function(event as EntityLivingHealEvent) {
    if (event.entityLivingBase instanceof IPlayer) {
        var player as IPlayer = event.entityLivingBase;
        if CotTicTraitLib.hasTicTrait(player.currentItem, "pure") || CotTicTraitLib.hasTicTrait(player.offHandHeldItem, "pure") {
            event.cancel();
        }
    }
});

val unshapedTrait = TraitBuilder.create("unshaped");
unshapedTrait.color = Color.fromHex("ffffff").getIntColor(); 
unshapedTrait.localizedName = game.localize("greedycraft.tconstruct.tool_trait.unshapedTrait.name");
unshapedTrait.localizedDescription = game.localize("greedycraft.tconstruct.tool_trait.unshapedTrait.desc");
unshapedTrait.onUpdate = function(trait, tool, world, owner, itemSlot, isSelected) {
    if (owner instanceof IPlayer) {
        var player as IPlayer = owner;
        if (player.getDimension() == 20) {
            ToolHelper.healTool(tool.mutable().native, 1, player.native);
        }
    }
};
unshapedTrait.register();


val overattackTrait = TraitBuilder.create("overattack");
overattackTrait.color = Color.fromHex("ffffff").getIntColor(); 
overattackTrait.localizedName = game.localize("greedycraft.tconstruct.tool_trait.overattackTrait.name");
overattackTrait.localizedDescription = game.localize("greedycraft.tconstruct.tool_trait.overattackTrait.desc");
overattackTrait.calcDamage = function(trait, tool, attacker, target, originalDamage, newDamage, isCritical) {
    if (attacker instanceof IPlayer && tool.hasOverslime()) {
        var player as IPlayer = attacker;
        if (tool.getOverslime() >= 15 && Math.random() < 0.2f && !target.isBoss) {
            tool.mutable().removeOverslime(15);
            var dmg as float = originalDamage * 0.1f;
            var source as IDamageSource = IDamageSource.createIndirectMagicDamage(player);
            target.attackEntityFrom(source, dmg);
            return newDamage * 0.9f;
        }
    }
    return newDamage;
};
overattackTrait.register();

val overarmyTrait = TraitBuilder.create("overarmy");
overarmyTrait.color = Color.fromHex("ffffff").getIntColor(); 
overarmyTrait.localizedName = game.localize("greedycraft.tconstruct.tool_trait.overarmyTrait.name");
overarmyTrait.localizedDescription = game.localize("greedycraft.tconstruct.tool_trait.overarmyTrait.desc");
overarmyTrait.calcDamage = function(trait, tool, attacker, target, originalDamage, newDamage, isCritical) {
    if (attacker instanceof IPlayer && tool.hasOverslime()) {
        var player as IPlayer = attacker;
        var count as int = 0;
        for counter in CotTicTraitLib.getPlayerTicArmorTrait(player) {
            if (counter == "moretcon.overslime") count += 1;
        }
        return newDamage * (1.0f + 0.3f * count as float) as float;
    }
    return newDamage;
};
overarmyTrait.register();

val overbreakTrait = TraitBuilder.create("overbreak");
overbreakTrait.color = Color.fromHex("ffffff").getIntColor(); 
overbreakTrait.localizedName = game.localize("greedycraft.tconstruct.tool_trait.overbreakTrait.name");
overbreakTrait.localizedDescription = game.localize("greedycraft.tconstruct.tool_trait.overbreakTrait.desc");
overbreakTrait.onUpdate = function(trait, tool, world, owner, itemSlot, isSelected) {
    if (owner instanceof IPlayer && tool.hasOverslime()) {
        var player as IPlayer = owner;
        if (!isNull(tool.tag.Stats.Broken) && isNull(tool.tag.overbreak)) {
            if (tool.tag.Stats.Broken as byte == 0 as byte) {
                tool.mutable().updateTag({overbreak : 1 as byte});
                CotTicLib.addTicFreeModifiers(tool, 2, "overbreak");
            }
        }
    }
};
overbreakTrait.register();

val overmeltTrait = TraitBuilder.create("overmelt");
overmeltTrait.color = Color.fromHex("ffffff").getIntColor(); 
overmeltTrait.localizedName = game.localize("greedycraft.tconstruct.tool_trait.overmeltTrait.name");
overmeltTrait.localizedDescription = game.localize("greedycraft.tconstruct.tool_trait.overmeltTrait.desc");
overmeltTrait.calcDamage = function(trait, tool, attacker, target, originalDamage, newDamage, isCritical) {
    if (attacker instanceof IPlayer && tool.hasOverslime()) {
        var player as IPlayer = attacker;
        if (target.definition.id.toLowerCase() has "slime") {
            tool.mutable().removeOverslime(2);
            return newDamage * 2.5f;
        }
    }
    return newDamage;
};
overmeltTrait.register();

val overglueTrait = TraitBuilder.create("overglue");
overglueTrait.color = Color.fromHex("ffffff").getIntColor(); 
overglueTrait.localizedName = game.localize("greedycraft.tconstruct.tool_trait.overglueTrait.name");
overglueTrait.localizedDescription = game.localize("greedycraft.tconstruct.tool_trait.overglueTrait.desc");
overglueTrait.onHit = function(trait, tool, attacker, target, damage, isCritical) {
    if (attacker instanceof IPlayer && tool.hasOverslime()) {
        var player as IPlayer = attacker;
        tool.mutable().removeOverslime(8);
        target.addPotionEffect(<potion:potioncore:strong_weight>.makePotionEffect(100, 4, false, false));
    }
};
overglueTrait.register();

val enhancedTrait = TraitBuilder.create("enhanced");
enhancedTrait.color = Color.fromHex("ffffff").getIntColor(); 
enhancedTrait.localizedName = game.localize("greedycraft.tconstruct.tool_trait.enhancedTrait.name");
enhancedTrait.localizedDescription = game.localize("greedycraft.tconstruct.tool_trait.enhancedTrait.desc");
enhancedTrait.onUpdate = function(trait, tool, world, owner, itemSlot, isSelected) {
    CotTicLib.addTicFreeModifiers(tool, 2, "enhanced");
};
enhancedTrait.register();

val loveTrait = TraitBuilder.create("love");
loveTrait.color = Color.fromHex("ffffff").getIntColor(); 
loveTrait.localizedName = game.localize("greedycraft.tconstruct.tool_trait.loveTrait.name");
loveTrait.localizedDescription = game.localize("greedycraft.tconstruct.tool_trait.loveTrait.desc");
loveTrait.onUpdate = function(trait, tool, world, owner, itemSlot, isSelected) {
    if (owner instanceof IPlayer && isSelected) {
        var player as IPlayer = owner;
        player.addPotionEffect(<potion:potioncore:love>.makePotionEffect(5, 0, false, false));
    }
};
loveTrait.onHit = function(trait, tool, attacker, target, damage, isCritical) {
    if (attacker instanceof IPlayer && target instanceof IEntityLivingBase) {
        target.addPotionEffect(<potion:potioncore:love>.makePotionEffect(200, 0, false, false));
    }
};
loveTrait.register();

val wavecrestTrait = TraitBuilder.create("wavecrest");
wavecrestTrait.color = Color.fromHex("ffffff").getIntColor(); 
wavecrestTrait.localizedName = game.localize("greedycraft.tconstruct.tool_trait.wavecrestTrait.name");
wavecrestTrait.localizedDescription = game.localize("greedycraft.tconstruct.tool_trait.wavecrestTrait.desc");
wavecrestTrait.calcDamage = function(trait, tool, attacker, target, originalDamage, newDamage, isCritical) {
    if (attacker instanceof IPlayer) {
        var player as IPlayer = attacker;
        var traits as string[] = CotTicTraitLib.getTicTrait(tool);
        var maxCounter as int = 0;
        for id in traits {
            var counter as int = 0;
            for checker in traits {
                if (id == checker) counter += 1;
            }
            if (counter > maxCounter) maxCounter = counter;
        }
        if (maxCounter == 1) maxCounter = 0;
        return newDamage * (pow(1.7, maxCounter) as float) as float;
    }
    return newDamage;
};
wavecrestTrait.register();

val wavetroughTrait = TraitBuilder.create("wavetrough");
wavetroughTrait.color = Color.fromHex("ffffff").getIntColor(); 
wavetroughTrait.localizedName = game.localize("greedycraft.tconstruct.tool_trait.wavetroughTrait.name");
wavetroughTrait.localizedDescription = game.localize("greedycraft.tconstruct.tool_trait.wavetroughTrait.desc");
wavetroughTrait.calcDamage = function(trait, tool, attacker, target, originalDamage, newDamage, isCritical) {
    if (attacker instanceof IPlayer && target instanceof IEntityLivingBase) {
        var player as IPlayer = attacker;
        var entity as IEntityLivingBase = target;
        if (target.health >= target.maxHealth * 0.5f) {
            return newDamage * 1.5f;
        }
    }
    return newDamage;
};
wavetroughTrait.afterHit = function(trait, tool, attacker, target, damageDealt, wasCritical, wasHit) {
    if (attacker instanceof IPlayer && target instanceof IEntityLivingBase) {
        var player as IPlayer = attacker;
        var entity as IEntityLivingBase = target;
        if (target.health == 0 && player.health <= target.maxHealth * 0.5f) {
            player.heal(8.0f);
        }
    }
};
wavetroughTrait.register();

val polarizationTrait = TraitBuilder.create("polarization");
polarizationTrait.color = Color.fromHex("ffffff").getIntColor(); 
polarizationTrait.localizedName = game.localize("greedycraft.tconstruct.tool_trait.polarizationTrait.name");
polarizationTrait.localizedDescription = game.localize("greedycraft.tconstruct.tool_trait.polarizationTrait.desc");
polarizationTrait.calcDamage = function(trait, tool, attacker, target, originalDamage, newDamage, isCritical) {
    if (attacker instanceof IPlayer) {
        var player as IPlayer = attacker;
        var mtp as float = 1.0f;
        if (Math.random() < 0.05f) {
            mtp -= 0.15f;
            target.attackEntityFrom(crafttweaker.damage.IDamageSource.FALL(), originalDamage * 0.15f);
        }
        if (Math.random() < 0.05f) {
            mtp -= 0.15f;
            target.attackEntityFrom(crafttweaker.damage.IDamageSource.IN_FIRE(), originalDamage * 0.15f);
        }
        if (Math.random() < 0.05f) {
            mtp -= 0.15f;
            target.attackEntityFrom(crafttweaker.damage.IDamageSource.MAGIC(), originalDamage * 0.15f);
        }
        if (Math.random() < 0.05f) {
            mtp -= 0.15f;
            target.attackEntityFrom(crafttweaker.damage.IDamageSource.OUT_OF_WORLD(), originalDamage * 0.15f);
        }
        if (Math.random() < 0.05f) {
            mtp -= 0.15f;
            target.attackEntityFrom(crafttweaker.damage.IDamageSource.FIREWORKS(), originalDamage * 0.15f);
        }
        return newDamage * mtp as float;
    }
    return newDamage;
};
polarizationTrait.register();

val emberTrait = TraitBuilder.create("ember");
emberTrait.color = Color.fromHex("ffffff").getIntColor(); 
emberTrait.localizedName = game.localize("greedycraft.tconstruct.tool_trait.emberTrait.name");
emberTrait.localizedDescription = game.localize("greedycraft.tconstruct.tool_trait.emberTrait.desc");
emberTrait.calcDamage = function(trait, tool, attacker, target, originalDamage, newDamage, isCritical) {
    if (attacker instanceof IPlayer) {
        var player as IPlayer = attacker;
        var mtp as float = (tool.damage as float / tool.maxDamage as float) as float / 2.0f;
        return newDamage * (1.0f + mtp);
    }
    return newDamage;
};
emberTrait.register();

val rekindledTrait = TraitBuilder.create("rekindled");
rekindledTrait.color = Color.fromHex("ffffff").getIntColor(); 
rekindledTrait.localizedName = game.localize("greedycraft.tconstruct.tool_trait.rekindledTrait.name");
rekindledTrait.localizedDescription = game.localize("greedycraft.tconstruct.tool_trait.rekindledTrait.desc");
rekindledTrait.onUpdate = function(trait, tool, world, owner, itemSlot, isSelected) {
    if (owner instanceof IPlayer && isSelected) {
        var player as IPlayer = owner;
        if (player.isBurning) {
            var dura as int = tool.maxDamage / 100 as int;
            ToolHelper.healTool(tool.mutable().native, dura, player.native);
        }
    }
};
rekindledTrait.register();

val burn_bridgesTrait = TraitBuilder.create("burn_bridges");
burn_bridgesTrait.color = Color.fromHex("ffffff").getIntColor(); 
burn_bridgesTrait.localizedName = game.localize("greedycraft.tconstruct.tool_trait.burn_bridgesTrait.name");
burn_bridgesTrait.localizedDescription = game.localize("greedycraft.tconstruct.tool_trait.burn_bridgesTrait.desc");
burn_bridgesTrait.calcDamage = function(trait, tool, attacker, target, originalDamage, newDamage, isCritical) {
    if (attacker instanceof IPlayer) {
        var player as IPlayer = attacker;
        if ((player.health / player.maxHealth) <= (target.health / target.maxHealth)) {
            return newDamage * 1.4f;
        }
    }
    return newDamage;
};
burn_bridgesTrait.register();

val world_beginningTrait = TraitBuilder.create("world_beginning");
world_beginningTrait.color = Color.fromHex("ffffff").getIntColor(); 
world_beginningTrait.localizedName = game.localize("greedycraft.tconstruct.tool_trait.world_beginningTrait.name");
world_beginningTrait.localizedDescription = game.localize("greedycraft.tconstruct.tool_trait.world_beginningTrait.desc");
world_beginningTrait.calcDamage = function(trait, tool, attacker, target, originalDamage, newDamage, isCritical) {
    if (attacker instanceof IPlayer) {
        var player as IPlayer = attacker;
        if (player.isPotionActive(<potion:contenttweaker:worldguard>)) {
            return newDamage * 1.35f;
        }
    }
    return newDamage;
};
world_beginningTrait.register();

val energy_fixTrait = TraitBuilder.create("energy_fix");
energy_fixTrait.color = Color.fromHex("ffffff").getIntColor();
energy_fixTrait.localizedName = game.localize("greedycraft.tconstruct.tool_trait.energy_fixTrait.name");
energy_fixTrait.localizedDescription = game.localize("greedycraft.tconstruct.tool_trait.energy_fixTrait.desc");
energy_fixTrait.hidden = true;
energy_fixTrait.onUpdate = function(trait, tool, world, owner, itemSlot, isSelected) {
    var newenergy as IData = {};
    var energy = 0;
    if (!isNull(tool.tag.EnergizedEnergy)) {
        energy = tool.tag.EnergizedEnergy.asInt();
        newenergy = {EnergizedEnergy: (energy - 320)};
        if (energy > 320 && tool.damage > 0) {
            tool.mutable().tag.update(tool.tag.deepUpdate(newenergy, {EnergizedEnergy: OVERWRITE}));
            tool.mutable().damageItem(-1,owner);
        }
    }
    if (!isNull(tool.tag.FluxedEnergy)) {
        energy = tool.tag.FluxedEnergy.asInt();
        newenergy = {FluxedEnergy: (energy - 320)};
        if (energy > 320 && tool.damage > 0) {
            tool.mutable().tag.update(tool.tag.deepUpdate(newenergy, {FluxedEnergy: OVERWRITE}));
            tool.mutable().damageItem(-1,owner);
        }
    }
    if (!isNull(tool.tag.EvolvedEnergy)) {
        energy = tool.tag.EvolvedEnergy.asInt();
        newenergy = {EvolvedEnergy: (energy - 320)};
        if (energy > 320 && tool.damage > 0) {
            tool.mutable().tag.update(tool.tag.deepUpdate(newenergy, {EvolvedEnergy: OVERWRITE}));
            tool.mutable().damageItem(-1,owner);
        }
    }
};
energy_fixTrait.register();