#modloaded mekanism
#loader mixin

import native.net.minecraftforge.event.RegistryEvent;

#mixin {targets:"mekanism.common.integration.OreDictManager"}
zenClass MixinOreDictManager {
    #mixin Static
    #mixin Redirect {method:"registerRecipes",at:{value:"INVOKE",target:"Lmekansim/common/integration/OreDictManager;addLogRecipes()V"}}

    function removeLogRecipes(event as RegistryEvent.Register) as void {
    }
}
