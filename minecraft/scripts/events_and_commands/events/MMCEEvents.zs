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

for machine in machines {
    MMEvents.onMachinePostTick(machine, function(event as MachineTickEvent) {
        var controller as IMachineController = event.controller;
        if (!isNull(controller.ownerPlayer)) {
            var player as IPlayer = controller.ownerPlayer;
            if (player.isPotionActive(<potion:contenttweaker:flops_overclock>)) {
                controller.addModifier("flops_overclock", RecipeModifierBuilder.create("modularmachinery:duration", "input", 0.75f, 1, false).build());
            }
        }
    });
}