#priority 3000

import crafttweaker.item.IItemStack;
import crafttweaker.data.IData;
import crafttweaker.item.IIngredient;

import mods.avaritia.ExtremeCrafting;
import mods.avaritia.Compressor;
import mods.ctintegration.util.RecipePattern;
import mods.extendedcrafting.TableCrafting;

TableCrafting.addShaped(0, <denseneutroncollectors:triple_compressed_neutron_collector>, [
	[null, null, <ore:ingotBalancedMatrix>, <ore:ingotEverite>, <ore:ingotBalancedMatrix>, <ore:ingotEverite>, <ore:ingotBalancedMatrix>, null, null], 
	[null, <ore:ingotIron>, <ore:ingotCosmicNeutronium>, <ore:ingotCosmicNeutronium>, <ore:ingotCosmicNeutronium>, <ore:ingotCosmicNeutronium>, <ore:ingotCosmicNeutronium>, <ore:ingotIron>, null], 
	[<ore:ingotBalancedMatrix>, <ore:ingotCosmicNeutronium>, <ore:ingotIron>, <ore:ingotCosmicNeutronium>, <ore:ingotCosmicNeutronium>, <ore:ingotCosmicNeutronium>, <ore:ingotIron>, <ore:ingotCosmicNeutronium>, <ore:ingotBalancedMatrix>], 
	[<ore:ingotEverite>, <ore:ingotCosmicNeutronium>, <ore:ingotCosmicNeutronium>, <ore:ingotIron>, <ore:ingotCosmicNeutronium>, <ore:ingotIron>, <ore:ingotCosmicNeutronium>, <ore:ingotCosmicNeutronium>, <ore:ingotEverite>], 
	[<ore:ingotBalancedMatrix>, <ore:ingotCosmicNeutronium>, <ore:ingotCosmicNeutronium>, <ore:ingotCosmicNeutronium>, <denseneutroncollectors:double_compressed_neutron_collector>, <ore:ingotCosmicNeutronium>, <ore:ingotCosmicNeutronium>, <ore:ingotCosmicNeutronium>, <ore:ingotBalancedMatrix>], 
	[<ore:ingotEverite>, <ore:ingotCosmicNeutronium>, <ore:ingotCosmicNeutronium>, <ore:ingotIron>, <ore:ingotCosmicNeutronium>, <ore:ingotIron>, <ore:ingotCosmicNeutronium>, <ore:ingotCosmicNeutronium>, <ore:ingotEverite>], 
	[<ore:ingotBalancedMatrix>, <ore:ingotCosmicNeutronium>, <ore:ingotIron>, <ore:ingotCosmicNeutronium>, <ore:ingotCosmicNeutronium>, <ore:ingotCosmicNeutronium>, <ore:ingotIron>, <ore:ingotCosmicNeutronium>, <ore:ingotBalancedMatrix>], 
	[null, <ore:ingotIron>, <ore:ingotCosmicNeutronium>, <ore:ingotCosmicNeutronium>, <ore:ingotCosmicNeutronium>, <ore:ingotCosmicNeutronium>, <ore:ingotCosmicNeutronium>, <ore:ingotIron>, null], 
	[null, null, <ore:ingotBalancedMatrix>, <ore:ingotEverite>, <ore:ingotBalancedMatrix>, <ore:ingotEverite>, <ore:ingotBalancedMatrix>, null, null]
]);

TableCrafting.remove(<extendedcrafting:material:24>);
TableCrafting.addShaped(0, <extendedcrafting:storage:3> * 2, [
	[<extendedcrafting:material:7>, <avaritia:resource>, <avaritia:resource>, <avaritia:resource>, <avaritia:resource>, <avaritia:resource>, <avaritia:resource>, <avaritia:resource>, <extendedcrafting:material:7>], 
	[<avaritia:resource>, <ore:ingotSignalum>, <ore:ingotSignalum>, <ore:ingotSignalum>, <ore:ingotSignalum>, <ore:ingotSignalum>, <ore:ingotSignalum>, <ore:ingotSignalum>, <avaritia:resource>], 
	[<avaritia:resource>, <ore:ingotSignalum>, <ore:ingotLumium>, <ore:ingotLumium>, <ore:ingotLumium>, <ore:ingotLumium>, <ore:ingotLumium>, <ore:ingotSignalum>, <avaritia:resource>], 
	[<avaritia:resource>, <ore:ingotSignalum>, <ore:ingotLumium>, <avaritia:resource>, <avaritia:resource>, <avaritia:resource>, <ore:ingotLumium>, <ore:ingotSignalum>, <avaritia:resource>], 
	[<avaritia:resource>, <ore:ingotSignalum>, <ore:ingotLumium>, <avaritia:resource>, <ore:blockFusionMatrix>, <avaritia:resource>, <ore:ingotLumium>, <ore:ingotSignalum>, <avaritia:resource>], 
	[<avaritia:resource>, <ore:ingotSignalum>, <ore:ingotLumium>, <avaritia:resource>, <avaritia:resource>, <avaritia:resource>, <ore:ingotLumium>, <ore:ingotSignalum>, <avaritia:resource>], 
	[<avaritia:resource>, <ore:ingotSignalum>, <ore:ingotLumium>, <ore:ingotLumium>, <ore:ingotLumium>, <ore:ingotLumium>, <ore:ingotLumium>, <ore:ingotSignalum>, <avaritia:resource>], 
	[<avaritia:resource>, <ore:ingotSignalum>, <ore:ingotSignalum>, <ore:ingotSignalum>, <ore:ingotSignalum>, <ore:ingotSignalum>, <ore:ingotSignalum>, <ore:ingotSignalum>, <avaritia:resource>], 
	[<extendedcrafting:material:7>, <avaritia:resource>, <avaritia:resource>, <avaritia:resource>, <avaritia:resource>, <avaritia:resource>, <avaritia:resource>, <avaritia:resource>, <extendedcrafting:material:7>]
]);

