#loader contenttweaker
import mods.contenttweaker.VanillaFactory;
import mods.contenttweaker.Item;

function ItemCreate(unlocalizedName as string) {
  val item = VanillaFactory.createItem(unlocalizedName);
  item.register();
}

ItemCreate("chaos_heart");
ItemCreate("chaotic_energy_core");