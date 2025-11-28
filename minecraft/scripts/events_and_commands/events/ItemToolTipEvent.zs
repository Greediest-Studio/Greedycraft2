#priority 3000
#sideonly client

import crafttweaker.item.IItemStack;

import native.net.minecraftforge.event.entity.player.ItemTooltipEvent;
import native.net.minecraft.client.gui.GuiScreen;

var itemStackString as string[] = [
    "ometweaks:blackhole_capacitor",
    "ometweaks:creative_capacitor",
    "avaritiaio:infinitecapacitor"
];

var itemLevelList as string[string] = {
    "ometweaks:blackhole_capacitor": "§7全局等级： §f6.0",
    "ometweaks:creative_capacitor": "§7全局等级： §b7.0",
    "avaritiaio:infinitecapacitor": "§7全局等级： §c1§e0§a.§b0"
};

events.register(function(event as ItemTooltipEvent) {
    var itemStack as IItemStack = event.getItemStack().wrapper;
    if (itemStackString has itemStack.definition.id) {
        if (GuiScreen.isShiftKeyDown()) {
            event.getToolTip()[0 .. 1].add("§7机器升级\n增加储能和速率/工作范围");
        } else {
            event.getToolTip()[0 .. 1].add("§7机器升级\n§f§o<按住Shift>");
        }
        event.getToolTip()[0 .. 3].add(itemLevelList[itemStack.definition.id]);
    }
});
