#priority 30

import crafttweaker.oredict.IOreDictEntry;
import crafttweaker.item.IItemStack;
import crafttweaker.data.IData;
import crafttweaker.item.IIngredient;
import crafttweaker.liquid.ILiquidStack;

import native.nc.capability.radiation.source.IRadiationSource;
import native.nc.radiation.RadiationHelper;
import native.net.minecraft.util.math.BlockPos;
import native.net.minecraft.world.World;

import mods.modularmachinery.RecipeBuilder;
import mods.modularmachinery.MachineUpgradeBuilder;
import mods.modularmachinery.MachineUpgradeHelper;
import mods.modularmachinery.MachineModifier;
import mods.modularmachinery.IMachineController;
import mods.modularmachinery.RecipePrimer;
import mods.modularmachinery.RecipeModifier;
import mods.modularmachinery.RecipeModifierBuilder;
import mods.modularmachinery.FactoryRecipeThread;
import mods.modularmachinery.RecipeAdapterBuilder;
import mods.modularmachinery.RecipeCheckEvent;
import mods.modularmachinery.FactoryRecipeFinishEvent;
import mods.modularmachinery.ControllerGUIRenderEvent;
import mods.modularmachinery.MMEvents;
import mods.modularmachinery.Sync;
import mods.ctutils.utils.Math;

MachineModifier.setMaxParallelism("radiation_cleaner", 1);
MachineModifier.setInternalParallelism("radiation_cleaner", 1);
MachineModifier.setMaxThreads("radiation_cleaner", 1);

MMEvents.onControllerGUIRender("radiation_cleaner", function(event as ControllerGUIRenderEvent) {
    var info as string[] = [
        "§a///辐射清洁器控制面板///",
        "§a机器名称：§eLV5 - 辐射清洁器"
    ];
    event.extraInfo = info;
});

function cleanRadiationInChunkRadius(controller as IMachineController) as void {
    if (isNull(controller) || isNull(controller.world) || controller.world.remote) {
        return;
    }

    Sync.addSyncTask(function() {
        val ctWorld = controller.world;
        val pos = controller.pos;
        if (isNull(ctWorld) || ctWorld.remote || isNull(pos)) {
            return;
        }

        val world as World = ctWorld.native as World;
        val offsets = [-1, 0, 1] as int[];

        for xOffset in offsets {
            for zOffset in offsets {
                val targetPos = pos.add(xOffset * 16, 0, zOffset * 16);
                if (!ctWorld.isBlockLoaded(targetPos)) {
                    continue;
                }

                val chunkPos as BlockPos = BlockPos(targetPos.x, targetPos.y, targetPos.z);
                val radiationSource as IRadiationSource = RadiationHelper.getRadiationSource(world.getChunk(chunkPos));
                if (!isNull(radiationSource)) {
                    radiationSource.setRadiationLevel(0.0d);
                    radiationSource.setRadiationBuffer(0.0d);
                }
            }
        }
    });
}

RecipeBuilder.newBuilder("clean_radiation", "radiation_cleaner", 1)
    .addEnergyPerTickInput(124800000)
    .addItemOutput(<jaopca:nugget.electronium>).setChance(0.0001f)
    .addItemOutput(<jaopca:nugget.protonium>).setChance(0.0001f)
    .addItemOutput(<avaritia:resource:3>).setChance(0.0001f)
    .addFactoryFinishHandler(function(event as FactoryRecipeFinishEvent) {
        cleanRadiationInChunkRadius(event.controller);
    })
    .setParallelized(false)
    .build();
