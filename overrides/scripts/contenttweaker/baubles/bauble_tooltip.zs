#priority 7
import crafttweaker.item.IItemStack;
import crafttweaker.player.IPlayer;

var Tooltipitem as string[IItemStack] = {
    <contenttweaker:bauble_lucky> : game.localize('test.bauble1.name'),
    <contenttweaker:bauble_vitamins> : game.localize('test.bauble2.name'),
    <contenttweaker:bauble_gaste> : game.localize('test.bauble3.name'),
    <contenttweaker:bauble_energy_gum> : game.localize('content.bauble_energy_gum_tooltip.name'),
};

for m , k in Tooltipitem{
    m.addTooltip(k);
}