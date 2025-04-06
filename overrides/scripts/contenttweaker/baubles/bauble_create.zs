#loader contenttweaker
import mods.contenttweaker.VanillaFactory;

import crafttweaker.item.IItemStack;

import crafttweaker.entity.IEntity;
import crafttweaker.entity.IEntityLivingBase;

import crafttweaker.world.IWorld;

import crafttweaker.player.IPlayer;

import crafttweaker.potions.IPotionEffect;



//幸运戒指
var lucky = VanillaFactory.createBaubleItem("bauble_lucky");
lucky.rarity = "uncommon";
lucky.onWornTick = function(bauble, wearer) {
    if(wearer instanceof IPlayer && !wearer.world.remote) {
        var player as IPlayer = wearer;
        player.addPotionEffect(<potion:minecraft:luck>.makePotionEffect(40, 0));

}};
lucky.onUnequipped = function(bauble, wearer) {
    if(wearer instanceof IPlayer && !wearer.world.remote) {
        var player as IPlayer = wearer;
        player.addPotionEffect(<potion:minecraft:luck>.makePotionEffect(100, 0));
    }
};
lucky.baubleType = "RING";
lucky.register();

//挖掘戒指
var haste = VanillaFactory.createBaubleItem("bauble_gaste");
haste.rarity = "uncommon";
haste.onWornTick = function(bauble, wearer) {
    if(wearer instanceof IPlayer && !wearer.world.remote) {
        var player as IPlayer = wearer;
        player.addPotionEffect(<potion:minecraft:haste>.makePotionEffect(40, 1));
}};
haste.baubleType = "RING";
haste.register();

//维生素
var vitamins = VanillaFactory.createBaubleItem("bauble_vitamins");
vitamins.rarity = "uncommon";
vitamins.onWornTick = function(bauble, wearer) {
    if(wearer instanceof IPlayer && !wearer.world.remote) {
        var player as IPlayer = wearer;
    if (player.isPotionActive(<potion:minecraft:weakness>)) {
    player.removePotionEffect(<potion:minecraft:weakness>);
    }
    if (player.isPotionActive(<potion:minecraft:mining_fatigue>)) {
    player.removePotionEffect(<potion:minecraft:mining_fatigue>);
    }
}};
vitamins.baubleType = "TRINKET";
vitamins.register();
