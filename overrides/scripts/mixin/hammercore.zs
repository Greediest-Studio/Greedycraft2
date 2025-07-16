#loader mixin

//来源：https://github.com/friendlyhj/IsolatedCrystal3

import native.com.zeitheron.hammercore.utils.java.io.win32.ModSourceAdapter;
import native.com.zeitheron.hammercore.utils.java.io.win32.ModSourceAdapter.IllegalSite;
import mixin.CallbackInfo;

#mixin {targets: "com.zeitheron.hammercore.utils.java.io.win32.ModSourceAdapter"}
zenClass MixinModSourceAdapter {
    #mixin Shadow
    static ILLEGAL_SITES as [IllegalSite];

    #mixin Static
    #mixin Inject {method: "<clinit>", at: {value: "HEAD"}, cancellable: true}
    function removeWebRequest(ci as CallbackInfo) as void {
        // we are curse packs, all mods are downloaded on official site
        // why we need to check illegal sites? And it would wait for ~20s to connect timeout in China network
        ILLEGAL_SITES = [] as [IllegalSite];
        ci.cancel();
    }
}