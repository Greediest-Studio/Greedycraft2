#loader contenttweaker

import mods.contenttweaker.VanillaFactory;

import crafttweaker.player.IPlayer;

import crafttweaker.entity.IEntity;
import crafttweaker.entity.AttributeModifier;
import crafttweaker.entity.AttributeInstance;
import crafttweaker.entity.Attribute;

 
var bauble_energy_gum = VanillaFactory.createBaubleItem("bauble_energy_gum");
bauble_energy_gum.rarity = "rare";
bauble_energy_gum.onWornTick = function(bauble, wearer) {
    if(wearer instanceof IPlayer) {
        var player as IPlayer = wearer;
        val amount = 0.012f;
        val uuid = "258ceecd-9431-4888-8c44-a19be52662d7";
        var attribute as AttributeInstance = player.getAttribute("generic.movementSpeed");
        var modifier as AttributeModifier = AttributeModifier.createModifier("cot_energy_gum", amount, 0, uuid);

        if (!isNull(attribute.getModifier(uuid))) {
            attribute.removeModifier(uuid);
        }
            attribute.applyModifier(modifier);
    }
};
bauble_energy_gum.onUnequipped = function(bauble, wearer) {
    if(wearer instanceof IPlayer) {
        var player as IPlayer = wearer;
        val attribute as AttributeInstance = player.getAttribute("generic.movementSpeed");
        val uuid = "258ceecd-9431-4888-8c44-a19be52662d7";

        if (!isNull(attribute.getModifier(uuid))) {
            attribute.removeModifier(uuid);
        }
    }
};
bauble_energy_gum.baubleType = "TRINKET";
bauble_energy_gum.register();




