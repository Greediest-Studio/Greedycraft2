#loader contenttweaker

import crafttweaker.player.IPlayer;
import crafttweaker.item.IItemStack;
import mods.contenttweaker.VanillaFactory;
import mods.ctutils.utils.Math;
import mods.randomtweaker.item.IManaItem;
import mods.randomtweaker.item.IManaBauble;
import mods.randomtweaker.botania.IManaItemHandler;
import mods.zenutils.DataUpdateOperation.OVERWRITE;

function getManaBaublesAndItems(player as IPlayer) as IItemStack[] {
    var outputList as IItemStack[] = [];
    val manaItems = IManaItemHandler.getManaItems(player);
    if (!isNull(manaItems) && manaItems.length > 0) {
        for manaItem in manaItems {
            if (!isNull(manaItem) && !manaItem.isEmpty) {
                outputList += manaItem;
            }
        }
    }
    val manaBaubles = IManaItemHandler.getManaBaubles(player);
    if (!isNull(manaBaubles) && manaBaubles.length > 0) {
        for manaBauble in manaBaubles.values {
            if (!isNull(manaBauble) && !manaBauble.isEmpty) {
                outputList += manaBauble;
            }
        }
    }
    return outputList;
}

val core_of_22_pass = VanillaFactory.createBaubleItem("bauble_core_of_22_pass");
core_of_22_pass.rarity = "epic";
core_of_22_pass.baubleType = "TRINKET";
core_of_22_pass.onWornTick = function(i, wearer) {
    if (!(wearer instanceof IPlayer)) {
        return;
    }
    var player as IPlayer = wearer;
    if (player.world.remote || player.world.time % 20 != 0) {
        return;
    }
    val manaItemList = getManaBaublesAndItems(player);
    if (isNull(manaItemList) || manaItemList.length == 0) {
        return;
    }
    val masterManaRing = <item:extrabotany:mastermanaring:*>;
    for manaItem in manaItemList {
        if (isNull(manaItem) || manaItem.isEmpty) {
            continue;
        }
        if (masterManaRing.matches(manaItem)) {
            val mana = isNull(manaItem.tag.mana) ? 0 : manaItem.tag.mana;
            manaItem.mutable().updateTag(manaItem.tag.deepUpdate({mana: (mana > 2147481446 ? 2147483646 : (mana + 2200))}, {mana: OVERWRITE}));
        } else {
            IManaItemHandler.dispatchMana(manaItem, player, 2200, true);
        }
    }
};
core_of_22_pass.register();