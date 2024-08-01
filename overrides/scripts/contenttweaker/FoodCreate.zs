#loader contenttweaker
#priority 9000

import mods.contenttweaker.ItemFood;
import mods.contenttweaker.VanillaFactory;

function FoodCreate(name as string,foodValue as int,foodSaturation as float) {
  val item = VanillaFactory.createItemFood(name, foodValue) as ItemFood;
  item.saturation = foodSaturation;
  item.register();
}

/*用法：FoodCreate(字符串物品ID,整数可恢复饥饿值,该食物的相对饱和度);
  例子：FoodCreate('rftg',5,0.8);*/

FoodCreate('kusa',1,0.5);