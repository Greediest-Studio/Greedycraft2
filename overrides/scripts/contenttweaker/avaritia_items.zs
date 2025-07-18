#loader avaritiaitem
 
import mods.avaritiaitem.AvaritiaItemBuilder;
import mods.avaritiaitem.ItemPrimer;
 
AvaritiaItemBuilder.registerItem("telekill_metal_ingot", 64, "telekill_metal_ingot")
    .shouldDrawHalo(true)
    .haloSize(10)
    .haloColour("b9b9b9")
    .haloOpacity(70)
    .haloTextures("telekill_metal_background")
    .addTooltip(game.localize("tooltip.avaritiaitem.telekill_metal_ingot"))
    .create();

AvaritiaItemBuilder.registerItem("taichi_ingot", 64, "taichi_ingot")
    .shouldDrawHalo(true)
    .haloSize(6)
    .haloOpacity(100)
    .haloTextures("taichi_ingot_halo")
    .addTooltip(game.localize("tooltip.avaritiaitem.taichi_ingot.1"))
    .addTooltip(game.localize("tooltip.avaritiaitem.taichi_ingot.2"))
    .create();