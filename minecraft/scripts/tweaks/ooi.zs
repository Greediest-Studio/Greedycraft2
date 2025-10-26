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
ConversionItem.create(<thaumcraft:amber_block>)
    .addMatchItem(<biomesoplenty:gem_block:7>)
    .addMatchItem(<betterendforge:amber_block>).register();
ConversionItem.create(<quark:end_bricks_stairs>)
    .addMatchItem(<ee:end_stone_stairs>)
    .addMatchItem(<endreborn:e_end_bricks_stairs>).register();
ConversionItem.create(<quark:end_bricks_slab>).addMatchItem(<ee:end_brick_half>).register();
ConversionItem.create(<quark:end_bricks_wall>)
    .addMatchItem(<ee:end_stone_wall>)
    .addMatchItem(<endreborn:e_end_bricks_wall>).register();
ConversionItem.create(<thermalfoundation:material:132>).addMatchItem(<ore:ingotAluminum>).register();
ConversionItem.create(<thermalfoundation:material:163>).addMatchItem(<ore:ingotBronze>).register();
ConversionItem.create(<thermalfoundation:material:128>).addMatchItem(<ore:ingotCopper>).register();
ConversionItem.create(<thermalfoundation:material:129>).addMatchItem(<ore:ingotTin>).register();
ConversionItem.create(<additions:manganese_ingot>).addMatchItem(<ore:ingotManganese>).register();
ConversionItem.create(<additions:titanium_ingot>).addMatchItem(<ore:ingotTitanium>).register();
ConversionItem.create(<additions:shadowium_ingot>).addMatchItem(<extrabotany:material:5>).register();
ConversionItem.create(<thermalfoundation:storage:4>).addMatchItem(<nuclearcraft:ingot_block:12>).register();
ConversionItem.create(<tconstruct:metal>).addMatchItem(<nuclearcraft:material_block:2>).register();
ConversionItem.create(<taiga:palladium_block>).addMatchItem(<nuclearcraft:ingot_block2:1>).register();
ConversionItem.create(<taiga:palladium_ingot>).addMatchItem(<ore:ingotPalladium>).register();
ConversionItem.create(<biomesoplenty:gem:6>).addMatchItem(<ore:gemSapphire>).register();
ConversionItem.create(<biomesoplenty:gem_block:6>).addMatchItem(<ore:blockSapphire>).register();
ConversionItem.create(<biomesoplenty:gem_ore:6>).addMatchItem(<ore:oreSapphire>).register();
ConversionItem.create(<thermalfoundation:material:192>).addMatchItem(<ore:nuggetCopper>).register();
ConversionItem.create(<thermalfoundation:material:194>).addMatchItem(<ore:nuggetSilver>).register();

ConversionFluid.create(<liquid:sulfur>).addMatchFluid(<liquid:burningsulfurflow>).register();
ConversionFluid.create(<liquid:liquidantimatter>).addMatchFluid(<liquid:blockfluidantimatter>).register();
ConversionFluid.create(<liquid:fluxed_electrum>).addMatchFluid(<liquid:electrum_flux>).register();