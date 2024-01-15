直接将整个lib文件夹放入scripts文件夹（放其他地方会报错，除非你知道怎么改，不然就这么放！）
Cot就用Cot开头的!

用法：
    例子：
    [
        若这个玩家穿的盔甲的特性中含有"www"这个特性就打印true
        if(TicTraitLib.getPlayerTicArmorTrait(player) has "www"){
            print("true);
        }
    ]
    [
        TicLib.addTicFreeModifiers(itemStack, level, uuid)
    ]

函数讲解：

TicTraitLib(这个当中的函数主要是跟特性相关):

TicTraitLib.getTraitColor(itemStack as IItemStack, traitid as string)
获取该词条在匠魂物品中的int格式颜色(若没有则返回白色).

TicTraitLib.getTraitLevel(itemStack as IItemStack, traitid as string)
获取该词条在匠魂物品中的int格式等级(若没有则返回1级).

TicTraitLib.removeTicTrait(itemStack as IItemStack, traitid as string, traitcolor as int, traitlevel as int)
返回bool,可确定是否成功移除特性.

TicTraitLib.addTicTrait(itemStack as IItemStack, traitid as string, traitcolor as int, traitlevel as int)
返回bool,可确定是否成功添加特性.

TicTraitLib.removeTicTraitAsItem(itemStack as IItemStack, traitid as string, traitcolor as int, traitlevel as int)
返回IItemStack，与前者不同，它只会返回修改后的物品.

TicTraitLib.addTicTraitAsItem(itemStack as IItemStack, traitid as string, traitcolor as int, traitlevel as int)
返回IItemStack，与前者不同，它只会返回修改后的物品.

TicTraitLib.getTicTrait(itemStack as IItemStack)
获取该物品的特性(若不是匠魂物品则返回空[])

TicTraitLib.hasTicTrait(itemStack as IItemStack, traitid as string)
返回bool,检测该物品是否拥有某一特性(若不是匠魂物品则返回false)

TicTraitLib.getPlayerTicBootsTrait(player as IPlayer)
获取这个玩家鞋子的特性(若不是匠魂物品则返回空[])

TicTraitLib.getPlayerTicLeggingsTrait(player as IPlayer)
获取这个玩家裤子的特性(若不是匠魂物品则返回空[])

TicTraitLib.getPlayerTicChestplateTrait(player as IPlayer)
获取这个玩家胸甲的特性(若不是匠魂物品则返回空[])

TicTraitLib.getPlayerTicHelmetTrait(player as IPlayer)
获取这个玩家头盔的特性(若不是匠魂物品则返回空[])

TicTraitLib.getPlayerTicArmorTrait(player as IPlayer)
获取这个玩家盔甲(鞋子,裤子,胸甲,头盔)的特性(若不是匠魂物品则返回空[])

提示:若有两个重复的特性那么在数组中就会有两个.


TicLib(这个当中的函数主要是不跟特性相关的):

TicLib.getTicMaterial(itemStack as IItemStack)
获取该物品的材料(若不是匠魂物品则返回空[])

TicLib.setTicBroken(itemStack as IItemStack, isBroken as bool)
设置是否损坏,返回bool,可确定是否成功设置.

TicLib.addTicMiningSpeed(itemStack as IItemStack, level as float, uuid as string)
增加挖掘速度,返回bool,可确定是否成功增加.

TicLib.addTicAttack(itemStack as IItemStack, level as float, uuid as string)
增加攻击伤害,返回bool,可确定是否成功增加.

TicLib.addTicFreeModifiers(itemStack as IItemStack, level as int, uuid as string)
增加挖掘速度,返回bool,可确定是否成功增加.

TicLib.addTicHarvestLevel(itemStack as IItemStack, level as int, uuid as string)
增加挖掘等级,返回bool,可确定是否成功增加.

TicLib.addTicMiningSpeed(itemStack as IItemStack, level as float, uuid as string)
增加挖掘速度,返回bool,可确定是否成功增加.

TicLib.addTicToughness(itemStack as IItemStack, level as float, uuid as string)
增加盔甲韧性,返回bool,可确定是否成功增加.

TicLib.addTicDefense(itemStack as IItemStack, level as float, uuid as string)
增加盔甲,返回bool,可确定是否成功增加.

TicLib.addTicDrawspeed(itemStack as IItemStack, level as float, uuid as string)
减少拉弓速度,返回bool,可确定是否成功减少.

提示:为了保证只增加一次,所以填入的uuid请不要重复!
