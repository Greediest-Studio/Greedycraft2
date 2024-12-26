
import scripts.contenttweaker.custom_fish.lib.fish;
import scripts.contenttweaker.custom_fish.lib.fishWeight;
import scripts.contenttweaker.custom_fish.lib.createFishWeigthItemList;
/*
fish()
.setFluid(<liquid:fluidedmana>)设置钓鱼液体
.setDimension(0)设置钓鱼的维度id
.setBiome("Plains")设置钓鱼的生物群系
.additionalDamage(5)//设置对鱼竿的额外耐久损耗
.addWeightedItemStacks([
    fishWeight(<botania:manaresource:23>.withAmount(5),5),
    fishWeight(<botania:manaresource:1>,10),
    fishWeight(<botania:manaresource:2>,15),
    fishWeight(<botania:manaresource:22>,16),
    fishWeight(<botania:manaresource>.withAmount(2),20)
]as fishWeight[])添加权重物品输出列表
.setFishRod(<minecraft:fishing_rod>)设置一个或多个钓鱼的鱼竿
.addFishBaits([<botania:petal>,<botania:petal:8>])设置一个或多个钓鱼的鱼饵
.setAltitude(1,15)设置钓鱼所需高度(最低，最高)，若只填begin或end为0，则不限制最高处
.setTime("day")设置钓鱼时的时间，可以为"day"或者"night"
.register();
*/
/*
fish()
.addWeightedItemStacks(createFishWeigthItemList(
    [<botania:manaresource:23>.withAmount(5),<botania:manaresource:1>,<botania:manaresource:2>,<botania:manaresource:22>,<botania:manaresource>.withAmount(2)],
    [5,10,15,16,20]
))权重物品输出列表的简化写法
.register();
*/

