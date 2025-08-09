#priority 16384

import mods.ooi.ConversionItem;
import mods.ooi.ConversionFluid;
import mods.ooi.BlackList;

BlackList.addMatchItem("chisel");

ConversionItem.create(<botanicadds:mana_lapis>).addMatchItem(<ore:gemManaLapis>).register();
ConversionItem.create(<botania:quartz:1>).addMatchItem(<ore:gemManaQuartz>).register();
ConversionItem.create(<botania:manaresource:2>).addMatchItem(<ore:gemManaDiamond>).register();
ConversionItem.create(<aether_legacy:ambrosium_block>).addMatchItem(<ore:blockAmbrosium>).register();
ConversionItem.create(<astralsorcery:itemcraftingcomponent>).addMatchItem(<ore:gemAquamarine>).register();
ConversionItem.create(<thermalfoundation:material:866>).addMatchItem(<ore:crystalCinnabar>).register();
ConversionItem.create(<mekanism:fluoriteclump>).addMatchItem(<ore:gemFluorite>).register();
ConversionItem.create(<botania:quartztypemana>).addMatchItem(<ore:blockManaQuartz>).register();
ConversionItem.create(<thebetweenlands:scabyst_block>).addMatchItem(<ore:blockScabyst>).register();
ConversionItem.create(<additions:sulfur_ingot>)
    .addMatchItem(<ore:ingotSulfur>)
    .addMatchItem(<betterendforge:crystalline_sulphur>)
    .addMatchItem(<betterendforge:sulphur_crystal>).register();
ConversionItem.create(<tiths:nitre>).addMatchItem(<ore:dustSaltpeter>).register();
ConversionItem.create(<tiths:block_nitre>).addMatchItem(<ore:blockSaltpeter>).register();
ConversionItem.create(<thaumcraft:amber>).addMatchItem(<ore:gemAmber>).register();