#loader contenttweaker
import mods.contenttweaker.VanillaFactory;
import mods.contenttweaker.Item;

function ItemCreate(unlocalizedName as string,isglowing as bool) {
  val item = VanillaFactory.createItem(unlocalizedName);
  item.glowing = isglowing;
  item.register();
}

ItemCreate("dough",false);
ItemCreate("chaos_heart",false);
ItemCreate("chaotic_energy_core",true);
ItemCreate("ordered_energy_core",true);