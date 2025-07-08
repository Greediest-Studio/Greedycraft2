#loader contenttweaker
#priority 3000

import mods.contenttweaker.ItemFood;
import mods.contenttweaker.VanillaFactory;

function FoodCreate(name as string,foodValue as int,foodSaturation as float) {
  val item = VanillaFactory.createItemFood(name, foodValue) as ItemFood;
  item.creativeTab = <creativetab:foodcore>;
  item.saturation = foodSaturation;
  item.alwaysEdible = true;
  item.register();
}

function FoodCreateBowl(name as string,foodValue as int,foodSaturation as float) {
  val item = VanillaFactory.createItemFood(name, foodValue) as ItemFood;
  item.creativeTab = <creativetab:foodcore>;
  item.saturation = foodSaturation;
  item.alwaysEdible = true;
  item.maxStackSize = 1;
  item.onItemFoodEaten = function(stack, world, player) {
  if (!world.remote) {
      player.give(<item:minecraft:bowl>);
  }
  };
  item.register();
}


/*用法：FoodCreate(字符串物品ID,整数可恢复饥饿值,该食物的相对饱和度);
  例子：FoodCreate('rftg',5,0.8);*/

//复现艹mod
FoodCreate('kusa',1,0.5);
//复现苹果胡萝卜
FoodCreate('apple_carrot',8,0.3);
//复现胡萝卜苹果
FoodCreate('carrot_apple',8,0.3);