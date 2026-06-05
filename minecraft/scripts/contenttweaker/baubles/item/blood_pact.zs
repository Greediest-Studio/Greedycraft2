#loader contenttweaker

import mods.contenttweaker.VanillaFactory;

import crafttweaker.player.IPlayer;

import crafttweaker.entity.IEntity;
import crafttweaker.entity.AttributeModifier;
import crafttweaker.entity.AttributeInstance;
import crafttweaker.entity.Attribute;

var blood_pact = VanillaFactory.createBaubleItem("bauble_blood_pact");
blood_pact.rarity = "rare";
blood_pact.onEquipped = function(bauble, wearer) {
    if(wearer instanceof IPlayer) {
        var player as IPlayer = wearer;
        val amount = 0.25f;
        val uuid = "c26a32a9-0379-404a-b632-9aceaddd27fa";
        var attribute as AttributeInstance = player.getAttribute("generic.maxHealth");
        var modifier as AttributeModifier = AttributeModifier.createModifier("cot_blood_pact", amount, 1, uuid);

        if (isNull(attribute.getModifier(uuid))) {
            attribute.applyModifier(modifier);
        }
    }
};
blood_pact.onUnequipped = function(bauble, wearer) {
    if(wearer instanceof IPlayer) {
        var player as IPlayer = wearer;
        val attribute as AttributeInstance = player.getAttribute("generic.maxHealth");
        val uuid = "c26a32a9-0379-404a-b632-9aceaddd27fa";

        if (!isNull(attribute.getModifier(uuid))) {
            attribute.removeModifier(uuid);
        }
        if(player.health > player.maxHealth){
            player.health = player.maxHealth;
        }
    }
};
blood_pact.baubleType = "TRINKET";
blood_pact.register();