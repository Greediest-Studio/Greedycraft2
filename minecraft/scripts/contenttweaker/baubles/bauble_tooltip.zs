#priority 7
import crafttweaker.item.IItemStack;
import crafttweaker.player.IPlayer;

var Tooltipitem as string[IItemStack] = {
    <contenttweaker:bauble_lucky> : game.localize('test.bauble1.name'),
    <contenttweaker:bauble_vitamins> : game.localize('test.bauble2.name'),
    <contenttweaker:bauble_gaste> : game.localize('test.bauble3.name'),
    <contenttweaker:bauble_energy_gum> : game.localize('content.bauble_energy_gum_tooltip.name'),
    <contenttweaker:bauble_horseshoe_balloon> : game.localize('content.bauble_horseshoe_balloon_tooltip.name'),
    <contenttweaker:bauble_ranger_badge> : game.localize('content.bauble_ranger_badge_tooltip.name'),
    <contenttweaker:bauble_wizard_badge> : game.localize('content.bauble_wizard_badge_tooltip.name'),
    <contenttweaker:bauble_warrior_badge> : game.localize('content.bauble_warrior_badge_tooltip.name'),
    <contenttweaker:bauble_source_of_swamp> : game.localize('content.bauble_source_of_swamp_tooltip.name'),
    <contenttweaker:bauble_dubhe_night_clown> : game.localize('content.bauble_dubhe_night_clown_tooltip.name'),
    <contenttweaker:bauble_crimson_ring> : game.localize('content.bauble_crimson_ring_tooltip.name')
};

for m , k in Tooltipitem{
    m.addTooltip(k);
}