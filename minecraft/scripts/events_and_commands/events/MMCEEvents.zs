import crafttweaker.item.IItemStack;
import crafttweaker.player.IPlayer;

import mods.modularmachinery.MMEvents;
import mods.modularmachinery.MachineTickEvent;
import mods.modularmachinery.IMachineController;
import mods.modularmachinery.MachineModifier;
import mods.modularmachinery.MachineUpgradeBuilder;
import mods.modularmachinery.MachineUpgradeHelper;
import mods.modularmachinery.RecipeModifierBuilder;

var machines as string[] = [];

for item in <ore:controllerLevel0>.items {
    machines += item.definition.id.split("machinery:")[1].split("_factory_controller")[0];
}
for item in <ore:controllerLevel1>.items {
    machines += item.definition.id.split("machinery:")[1].split("_factory_controller")[0];
}
for item in <ore:controllerLevel2>.items {
    machines += item.definition.id.split("machinery:")[1].split("_factory_controller")[0];
}
for item in <ore:controllerLevel3>.items {
    machines += item.definition.id.split("machinery:")[1].split("_factory_controller")[0];
}
for item in <ore:controllerLevel4>.items {
    machines += item.definition.id.split("machinery:")[1].split("_factory_controller")[0];
}
for item in <ore:controllerLevel5>.items {
    machines += item.definition.id.split("machinery:")[1].split("_factory_controller")[0];
}
for item in <ore:controllerLevel6>.items {
    machines += item.definition.id.split("machinery:")[1].split("_factory_controller")[0];
}

val flopsOverclockModifier = RecipeModifierBuilder.create("modularmachinery:duration", "input", 0.75f, 1, false).build();

for machine in machines {
    MMEvents.onMachinePostTick(machine, function(event as MachineTickEvent) {
        val controller as IMachineController = event.controller;
        if (controller.world.isRemote() || controller.world.getWorldTime() % 20 != 0) {
            return;
        }
        controller.removeModifier("flops_overclock");
        val player as IPlayer = controller.ownerPlayer;
        val hasPotion as bool = !isNull(player) && player.isPotionActive(<potion:contenttweaker:flops_overclock>);
        if (hasPotion) {
            if (!controller.hasModifier("flops_overclock")) {
                controller.addPermanentModifier("flops_overclock", flopsOverclockModifier);
            }
            return;
        }
        if (controller.hasModifier("flops_overclock")) {
            controller.removePermanentModifier("flops_overclock");
        }
    });
}
