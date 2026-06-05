#loader contenttweaker

import mods.contenttweaker.VanillaFactory;

import crafttweaker.player.IPlayer;

import crafttweaker.entity.IEntity;
import crafttweaker.entity.AttributeModifier;
import crafttweaker.entity.AttributeInstance;
import crafttweaker.entity.Attribute;

var living_dew = VanillaFactory.createBaubleItem("bauble_living_dew");
living_dew.rarity = "rare";
living_dew.onEquipped = function(bauble, wearer) {
    if(wearer instanceof IPlayer) {
        var player as IPlayer = wearer;
        val amount = 25.0f;
        val uuid = "c4737c85-1220-4ac4-8530-e170e8b4902e";
        var attribute as AttributeInstance = player.getAttribute("generic.maxHealth");
        var modifier as AttributeModifier = AttributeModifier.createModifier("cot_living_dew", amount, 0, uuid);

        if (isNull(attribute.getModifier(uuid))) {
            attribute.applyModifier(modifier);
        }
    }
};
living_dew.onWornTick = function(bauble, wearer) {
    var player as IPlayer = wearer;
    if(player.world.getWorldTime() as long % 20 == 0) {
        player.heal(1.0f);
    }
};
living_dew.onUnequipped = function(bauble, wearer) {
    if(wearer instanceof IPlayer) {
        var player as IPlayer = wearer;
        val attribute as AttributeInstance = player.getAttribute("generic.maxHealth");
        val uuid = "c4737c85-1220-4ac4-8530-e170e8b4902e";

        if (!isNull(attribute.getModifier(uuid))) {
            attribute.removeModifier(uuid);
        }
        if(player.health > player.maxHealth){
            player.health = player.maxHealth;
        }
    }
};
living_dew.baubleType = "TRINKET";
living_dew.register();