//新研究类
mods.thaumcraft.research.researchCategoryBuilder()
    .key('ABYSSISM')
    .researchKey(null)
    .formulaAspect(aspect('coralos') * 10)
    .formulaAspect(aspect('dreadia') * 10)
    .formulaAspect(aspect('abyss') * 10)
    .icon(resource('abyssalcraft:textures/items/abyssalnomicon.png'))
    .background(resource('thaumcraft:textures/backgrounds/abyssism.png'))
    .background2(resource('thaumcraft:textures/backgrounds/abyssism.png'))
    .register()

//新扫描
mods.thaumcraft.research.addScannable("SHADOW_BEAST", entity('abyssalcraft:shadowbeast').entityClass, true)
mods.thaumcraft.research.addScannable("SPECTRAL_DRAGON", entity('abyssalcraft:dragonminion').entityClass, true)
mods.thaumcraft.research.addScannable("DREAD_GUARD", entity('abyssalcraft:dreadguard').entityClass, true)
mods.thaumcraft.research.addScannable("MINION_OF_GATEKEEPER", entity('abyssalcraft:jzaharminion').entityClass, true)
mods.thaumcraft.research.addScannable("LESSER_SHOGGOTH", entity('abyssalcraft:lessershoggoth').entityClass, true)
mods.thaumcraft.research.addScannable("ABYSSALNOMICON", item('abyssalcraft:abyssalnomicon'))