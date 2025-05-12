#loader mixin

//来源：https://github.com/friendlyhj/IsolatedCrystal3

import native.net.minecraftforge.fluids.FluidStack;
import mixin.CallbackInfoReturnable;

#mixin {targets: "xyz.phanta.fluiddrawers.util.DrawerFluidHandler"}
zenClass MixinDrawerFluidHandler {
    #mixin Inject {method: "fill", at: {value: "HEAD"}, cancellable: true}
    function fixFillNPE(fluid as FluidStack, commit as bool, bypass as bool, cir as CallbackInfoReturnable) as void {
        if (isNull(fluid)) {
            cir.setReturnValue(0);
        }
    }

    #mixin Inject {method: "drain(Lnet/minecraftforge/fluids/FluidStack;ZZ)Lnet/minecraftforge/fluids/FluidStack;", at: {value: "HEAD"}, cancellable: true}
    function fixDrainNPE(fluid as FluidStack, commit as bool, bypass as bool, cir as CallbackInfoReturnable) as void {
        if (isNull(fluid)) {
            cir.setReturnValue(null);
        }
    }
}
