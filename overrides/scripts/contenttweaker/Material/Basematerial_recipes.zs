import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;
import crafttweaker.oredict.IOreDictEntry;
import crafttweaker.oredict.IOreDict;

for ench in oreDict.entries {
    var oreName as string = ench.name;
    var enchGear as IItemStack = ench.firstItem;
    if (oreName.startsWith("plate") && enchGear.definition.owner=="contenttweaker") {
        var key as string = oreName.substring("plate".length);
        var block as IOreDictEntry = oreDict.get("block" ~ key);//块
        var ore as IOreDictEntry = oreDict.get("ore" ~ key);//矿石
        var dust as IOreDictEntry = oreDict.get("dust" ~ key);//粉
        var ingot as IOreDictEntry = oreDict.get("ingot" ~ key);//锭
        var plate as IOreDictEntry = oreDict.get("plate" ~ key);//板
    if (! block.empty && ! ore.empty && ! ingot.empty && ! dust.empty) {
        //矿石烧锭
        furnace.addRecipe(ingot.firstItem,ore.firstItem);
        //粉烧锭
        furnace.addRecipe(ingot.firstItem,dust.firstItem);
        //锭块相互转换
        recipes.addShaped(block.firstItem,
                        [[ingot.firstItem,ingot.firstItem,ingot.firstItem],
                         [ingot.firstItem,ingot.firstItem,ingot.firstItem],
                         [ingot.firstItem,ingot.firstItem,ingot.firstItem]]);
        recipes.addShapeless(ingot.firstItem*9,[block.firstItem]);
        //锭转板
        recipes.addShaped(plate.firstItem*3,
                        [[ingot.firstItem,ingot.firstItem,ingot.firstItem],
                         [null,null,null],
                         [null,null,null]]);
        //板烧锭
        furnace.addRecipe(ingot.firstItem,plate.firstItem);
        }
    }
}