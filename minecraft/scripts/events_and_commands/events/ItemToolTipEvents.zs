#priority 3000
#sideonly client

import crafttweaker.item.IItemStack;

import native.net.minecraftforge.event.entity.player.ItemTooltipEvent;
import native.net.minecraft.client.gui.GuiScreen;

var EIOitemStackString as string[] = [
    "ometweaks:blackhole_capacitor",
    "ometweaks:creative_capacitor",
    "avaritiaio:infinitecapacitor"
];

var EIOitemLevelList as string[string] = {
    "ometweaks:blackhole_capacitor": "§7全局等级： §f6.0",
    "ometweaks:creative_capacitor": "§7全局等级： §b7.0",
    "avaritiaio:infinitecapacitor": "§7全局等级： §c1§e0§a.§b0"
};

events.register(function(event as ItemTooltipEvent) {
    var itemStack as IItemStack = event.getItemStack().wrapper;
    
    //EIO Capacitor Tooltip
    if (!isNull(itemStack.definition)) {
        if (EIOitemStackString has itemStack.definition.id) {
            if (GuiScreen.isShiftKeyDown()) {
                event.getToolTip()[0 .. 1].add("§7机器升级\n增加储能和速率/工作范围");
            } else {
                event.getToolTip()[0 .. 1].add("§7机器升级\n§f§o<按住Shift>");
            }
            event.getToolTip()[0 .. 3].add(EIOitemLevelList[itemStack.definition.id]);
        }
    }

    //Crimson Ring Tooltip
    if (!isNull(itemStack.definition)) {
        if (itemStack.definition.id == <contenttweaker:bauble_crimson_ring>.definition.id) {
            if (!isNull(itemStack.tag.crimsonPower)) {
                var crimsonPower as int = itemStack.tag.crimsonPower as int;
                event.getToolTip()[0 .. 3].add("§7血腥意志：" + crimsonPower as string);
            }
        }
    }

    //Imitation Trait Tooltip
    if (!isNull(itemStack.definition)) {
        if (TicTraitLib.hasTicTrait(itemStack, "imitation")) {
            var tooltips = event.getToolTip();
            var location as int = -1;
            var str as string = "";
            var count as int = -1;
            for i in 0 to tooltips.length {
                var tooltip as string = tooltips[i];
                if (tooltip has "模拟") {
                    location = i;
                    str = tooltip;
                    break;
                }
            }
            if (!isNull(itemStack.tag.imitationCount)) {
                count = itemStack.tag.imitationCount as int;
            }
            if (location != -1 && count != -1) {
                event.getToolTip()[0 .. location].add(str + ": " + count + "/10");
                event.getToolTip().remove(location + 1);
            }
        }
        if (TicTraitLib.hasTicTrait(itemStack, "imitation_armor")) {
            var tooltips = event.getToolTip();
            var location as int = -1;
            var str as string = "";
            var count as int = -1;
            for i in 0 to tooltips.length {
                var tooltip as string = tooltips[i];
                if (tooltip has "模拟") {
                    location = i;
                    str = tooltip;
                    break;
                }
            }
            if (!isNull(itemStack.tag.imitationCount)) {
                count = itemStack.tag.imitationCount as int;
            }
            if (location != -1 && count != -1) {
                event.getToolTip()[0 .. location].add(str + ": " + count + "/4");
                event.getToolTip().remove(location + 1);
            }
        }
    }

});

