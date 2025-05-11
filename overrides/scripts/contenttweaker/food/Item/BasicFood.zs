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

//复现Food Expansion
FoodCreate("bacon", 1, 0.2);
FoodCreate("cookedbacon", 3, 0.4);
FoodCreate("friedegg", 2, 0.3);
FoodCreate("baconandegg", 7, 0.8);
FoodCreate("squid", 1, 0.2);
FoodCreate("cookedsquid", 3, 0.5);
FoodCreate("compressedflesh", 6, 0.2);
FoodCreate("chocolatebar", 8, 1.0);
FoodCreate("cactusfruit", 1, 0.1);
FoodCreate("horsemeat", 3, 0.3);
FoodCreate("cookedhorsemeat", 8, 0.8);
FoodCreate("cookedmushroom", 2, 0.2);
FoodCreate("carrotpie", 8, 0.8);
FoodCreate("roastedseed", 1, 0.1);
FoodCreate("wolfmeat", 2, 0.3);
FoodCreate("cookedwolfmeat", 6, 0.7);
FoodCreate("ocelotmeat", 2, 0.3);
FoodCreate("cookedocelotmeat", 6, 0.7);
FoodCreate("parrotmeat", 2, 0.3);
FoodCreate("cookedparrotmeat", 6, 0.7);
FoodCreate("llamameat", 2, 0.3);
FoodCreate("cookedllamameat", 7, 0.8);
FoodCreate("polarbearmeat", 3, 0.3);
FoodCreate("cookedpolarbearmeat", 8, 0.8);
FoodCreate("lollipop", 4, 0.5);
//返还碗
FoodCreateBowl("beetrootnoodles", 6, 0.6);
FoodCreateBowl("melonsalad", 6, 0.6);
FoodCreateBowl("carrotseedsoup", 8, 0.8);