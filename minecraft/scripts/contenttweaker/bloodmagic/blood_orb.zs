#loader preinit

import native.WayofTime.bloodmagic.orb.BloodOrb;
import native.WayofTime.bloodmagic.core.RegistrarBloodMagicItems;
import native.net.minecraftforge.event.RegistryEvent;
import native.net.minecraft.util.ResourceLocation;
import native.net.minecraftforge.fml.relauncher.Side;
import native.net.minecraftforge.fml.common.FMLCommonHandler;
import native.net.minecraft.client.renderer.block.model.ModelResourceLocation;

static murderOrb as BloodOrb = BloodOrb("murder", 6, 200000000, 6400);

events.register(function(event as RegistryEvent.Register) {
    val registerName as string = event.name.toString();
    if (registerName == "bloodmagic:blood_orb") {

        if (FMLCommonHandler.instance().getSide().isClient()) {
            val orbItem as ModelResourceLocation = RegistrarBloodMagicItems.BLOOD_ORB.getRegistryName();
            murderOrb.withModel(ModelResourceLocation(orbItem, "type=murder"));
        }
        
        murderOrb.setRegistryName(ResourceLocation("contenttweaker", "murder"));
        event.registry.register(murderOrb);
    }
});