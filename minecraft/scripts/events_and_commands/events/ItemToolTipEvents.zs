#priority 3000
#sideonly client

import crafttweaker.item.IItemStack;

import native.net.minecraftforge.event.entity.player.ItemTooltipEvent;
import native.net.minecraft.client.gui.GuiScreen;

var EIOitemLevelList as string[string] = {
    "ometweaks:blackhole_capacitor": "§7全局等级： §f6.0",
    "ometweaks:creative_capacitor": "§7全局等级： §d7.0",
    "ometweaks:twilit_capacitor": "§7全局等级： §f6.3",
    "ometweaks:clock_capacitor": "§7全局等级： §b4.4",
    "ometweaks:curse_capacitor": "§7全局等级： §f6.2",
    "ometweaks:killer_capacitor": "§7全局等级： §f6.6",
    "ometweaks:mist_capacitor": "§7全局等级： §b4.7",
    "ometweaks:sharpen_capacitor": "§7全局等级： §f5.5",
    "avaritiaio:infinitecapacitor": "§7全局等级： §c1§e0§a.§b0"
};

events.register(function(event as ItemTooltipEvent) {
    var itemStack as IItemStack = event.getItemStack().wrapper;
    
    //EIO Capacitor Tooltip
    if (!isNull(itemStack.definition)) {
        if (EIOitemLevelList.keys has itemStack.definition.id) {
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

    //Hexable Basement Trait Tooltip
    if (!isNull(itemStack.definition)) {
        if (TicTraitLib.hasTicTrait(itemStack, "hexable_basement")) {
            var tooltips = event.getToolTip();
            var location as int = -1;
            var str as string = "";
            for i in 0 to tooltips.length {
                var tooltip as string = tooltips[i];
                if (tooltip has "六元轮转") {
                    location = i;
                    str = tooltip;
                    break;
                }
            }
            if (!isNull(itemStack.tag.hexableBasement)) {
                var aqua as int = itemStack.tag.hexableBasement.aqua as int;
                var ignis as int = itemStack.tag.hexableBasement.ignis as int;
                var terra as int = itemStack.tag.hexableBasement.terra as int;
                var aer as int = itemStack.tag.hexableBasement.aer as int;
                var ordo as int = itemStack.tag.hexableBasement.ordo as int;
                var perditio as int = itemStack.tag.hexableBasement.perditio as int;
                if (location != -1) {
                    event.getToolTip()[0 .. location + 1].add("§3六元-水: " + aqua as string + "/4000§r\n§c六元-火: " + ignis as string + "/4000§r\n§2六元-地: " + terra as string + "/4000§r\n§b六元-风: " + aer as string + "/4000§r\n§f六元-序: " + ordo as string + "/4000§r\n§8六元-熵: " + perditio as string + "/4000§r");
                }
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
        if (TicTraitLib.hasTicTrait(itemStack, "imitation_armor") && !TicTraitLib.hasTicTrait(itemStack, "imitation")) {
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

    //Radiation Trait Tooltip
    if (!isNull(itemStack.definition)) {
        if (TicTraitLib.hasTicTrait(itemStack, "active_source6")) {
            var hasSlowdown as bool = TicTraitLib.hasTicTrait(itemStack, "slowdown");
            event.getToolTip()[0 .. 1].add(hasSlowdown ? "§c辐射： 192 mRad/t" : "§c辐射： 384 mRad/t");
        } else if (TicTraitLib.hasTicTrait(itemStack, "active_source6_armor")) {
            var hasSlowdown as bool = TicTraitLib.hasTicTrait(itemStack, "slowdown_armor");
            event.getToolTip()[0 .. 1].add(hasSlowdown ? "§6辐射： 96 mRad/t" : "§c辐射： 192 mRad/t");
        } else if (TicTraitLib.hasTicTrait(itemStack, "active_source5")) {
            var hasSlowdown as bool = TicTraitLib.hasTicTrait(itemStack, "slowdown");
            event.getToolTip()[0 .. 1].add(hasSlowdown ? "§6辐射： 9.6 mRad/t" : "§6辐射： 19.2 mRad/t");
        } else if (TicTraitLib.hasTicTrait(itemStack, "active_source5_armor")) {
            var hasSlowdown as bool = TicTraitLib.hasTicTrait(itemStack, "slowdown_armor");
            event.getToolTip()[0 .. 1].add(hasSlowdown ? "§6辐射： 4.8 mRad/t" : "§6辐射： 9.6 mRad/t");
        } else if (TicTraitLib.hasTicTrait(itemStack, "active_source4")) {
            var hasSlowdown as bool = TicTraitLib.hasTicTrait(itemStack, "slowdown");
            event.getToolTip()[0 .. 1].add(hasSlowdown ? "§e辐射： 480 uRad/t" : "§e辐射： 960 uRad/t");
        } else if (TicTraitLib.hasTicTrait(itemStack, "active_source4_armor")) {
            var hasSlowdown as bool = TicTraitLib.hasTicTrait(itemStack, "slowdown_armor");
            event.getToolTip()[0 .. 1].add(hasSlowdown ? "§e辐射： 240 uRad/t" : "§e辐射： 480 uRad/t");
        } else if (TicTraitLib.hasTicTrait(itemStack, "active_source3")) {
            var hasSlowdown as bool = TicTraitLib.hasTicTrait(itemStack, "slowdown");
            event.getToolTip()[0 .. 1].add(hasSlowdown ? "§e辐射： 24 uRad/t" : "§e辐射： 48 uRad/t");
        } else if (TicTraitLib.hasTicTrait(itemStack, "active_source3_armor")) {
            var hasSlowdown as bool = TicTraitLib.hasTicTrait(itemStack, "slowdown_armor");
            event.getToolTip()[0 .. 1].add(hasSlowdown ? "§e辐射： 12 uRad/t" : "§e辐射： 24 uRad/t");
        } else if (TicTraitLib.hasTicTrait(itemStack, "active_source2")) {
            var hasSlowdown as bool = TicTraitLib.hasTicTrait(itemStack, "slowdown");
            event.getToolTip()[0 .. 1].add(hasSlowdown ? "§e辐射： 1.2 uRad/t" : "§e辐射： 2.4 uRad/t");
        } else if (TicTraitLib.hasTicTrait(itemStack, "active_source2_armor")) {
            var hasSlowdown as bool = TicTraitLib.hasTicTrait(itemStack, "slowdown_armor");
            event.getToolTip()[0 .. 1].add(hasSlowdown ? "§f辐射： 600 nRad/t" : "§e辐射： 1.2 uRad/t");
        } else if (TicTraitLib.hasTicTrait(itemStack, "active_source")) {
            var hasSlowdown as bool = TicTraitLib.hasTicTrait(itemStack, "slowdown");
            event.getToolTip()[0 .. 1].add(hasSlowdown ? "§f辐射： 60 nRad/t" : "§f辐射： 120 nRad/t");
        } else if (TicTraitLib.hasTicTrait(itemStack, "active_source_armor")) {
            var hasSlowdown as bool = TicTraitLib.hasTicTrait(itemStack, "slowdown_armor");
            event.getToolTip()[0 .. 1].add(hasSlowdown ? "§f辐射： 30 nRad/t" : "§f辐射： 60 nRad/t");
        }
    }
});

