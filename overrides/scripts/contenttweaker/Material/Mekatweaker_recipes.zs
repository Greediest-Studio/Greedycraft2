import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;
import crafttweaker.oredict.IOreDictEntry;
import crafttweaker.oredict.IOreDict;
import mod.mekanism.gas.IGasStack;

for ench in oreDict.entries /* oreDict.entries 在所有注册OD中循环 */ {
    var oreName as string = ench.name;
    var enchGear as IItemStack = ench.firstItem; // 获得OD的第一个物品

    // 进行条件判断获取cot新建的矿物水晶，第二条是排除mek原版已经搞好的的5倍
    if (oreName.startsWith("crystal") && enchGear.definition.owner != "mekanism") {
        var key as string = oreName.substring("crystal".length); // 获取金属名

        // 获取魔改需要的该金属的其他部件，水晶，碎片，碎块，污浊粉，粉,矿石
        var ore as IOreDictEntry= oreDict.get("ore" ~ key);//矿石
        var shard as IOreDictEntry = oreDict.get("shard" ~ key);//碎片
        var clump as IOreDictEntry = oreDict.get("clump" ~ key);//碎块
        var dirty_dust as IOreDictEntry = oreDict.get("dirtyDust" ~ key);//污浊粉
        var dust as IOreDictEntry = oreDict.get("dust" ~ key);//粉
        //因为气体的名称通常为“矿物名字+类型”
        //例如<gas:abyssalnitedirty_ore_slurry_gas>所以获取的金属名要小写
        //所以将key转成小写
        var key1 as string = key.toLowerCase();
        //获取魔改需要的该金属的其他气体，污浊的矿物浆，纯净的矿物浆液
        var dirty_ore_slurry_gas as IGasStack = mods.mekanism.MekanismHelper.getGas(key1 ~ "dirty_ore_slurry_gas");//污浊的矿物浆液
        var clean_ore_slurry_gas as IGasStack = mods.mekanism.MekanismHelper.getGas(key1 ~ "clean_ore_slurry_gas");//纯净的矿物浆液
        //避免撒B忘记注册导致脚本错误
        if (! dust.empty && ! shard.empty && ! clump.empty && ! dirty_dust.empty && ! ore.empty) {
            mods.mekanism.chemical.dissolution.addRecipe(ore.firstItem, dirty_ore_slurry_gas*1000);
            mods.mekanism.chemical.washer.addRecipe(dirty_ore_slurry_gas, clean_ore_slurry_gas);
            mods.mekanism.chemical.crystallizer.addRecipe(clean_ore_slurry_gas*200, enchGear);
            mods.mekanism.chemical.injection.addRecipe(enchGear, <gas:hydrogenchloride>, shard.firstItem);
            mods.mekanism.chemical.injection.addRecipe(ore.firstItem, <gas:hydrogenchloride>, shard.firstItem * 4);
            mods.mekanism.purification.addRecipe(shard.firstItem, clump.firstItem);
            mods.mekanism.purification.addRecipe(ore.firstItem, clump.firstItem * 3);
            mods.mekanism.crusher.addRecipe(clump.firstItem, dirty_dust.firstItem);
            mods.mekanism.crusher.addRecipe(ore.firstItem, dirty_dust.firstItem *2);
            mods.mekanism.enrichment.addRecipe(dirty_dust.firstItem, dust.firstItem);
        }
    }
}
