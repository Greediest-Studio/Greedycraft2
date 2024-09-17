
inWorldCrafting.fluidToItem.recipeBuilder()
        .fluidInput(fluid('blackhole_alloy'),0.0f)
        .input(item('gct_aby:shadownuclear'))
        .input(item('additions:cosmilite_ingot'))
        .output(item('thebetweenlands:swamp_talisman:1'))
        .register()

inWorldCrafting.fluidToItem.recipeBuilder()
        .fluidInput(fluid('blackhole_alloy'),0.0f)
        .input(item('aether_legacy:dungeon_key:2'))
        .input(item('aether_legacy:dungeon_key:1'))
        .input(item('aether_legacy:dungeon_key'))
        .input(item('additions:cosmilite_ingot'))
        .output(item('thebetweenlands:swamp_talisman:2'))
        .register()

inWorldCrafting.fluidToItem.recipeBuilder()
        .fluidInput(fluid('blackhole_alloy'),0.0f)
        .input(item('gct_aby:ancientmud'))
        .input(item('additions:cosmilite_ingot'))
        .output(item('thebetweenlands:swamp_talisman:3'))
        .register()

inWorldCrafting.fluidToItem.recipeBuilder()
        .fluidInput(fluid('blackhole_alloy'),0.0f)
        .input(item('gct_aby:shoggothtancale'))
        .input(item('additions:cosmilite_ingot'))
        .output(item('thebetweenlands:swamp_talisman:4'))
        .register()

inWorldCrafting.fluidToItem.recipeBuilder()
        .fluidInput(fluid('endacid'))
        .input(item('endreborn:item_ingot_endorium')*6)
        .input(item('moretcon:gemenderal')*5)
        .input(item('tiths:ender_crevice_shard')*5)
        .input(item('gct_mobs:resonated_scrap'))
        .output(item('moretcon:repitem:2')*3)
        .register()

inWorldCrafting.fluidToItem.recipeBuilder()
        .fluidInput(fluid('darkest'))
        .input(item('abyssalcraft:shadowgem')*8)
        .input(item('thaumcraft:void_seed')*16)
        .input(item('gct_ores:stormy_witherium_ingot')*3)
        .input(item('additions:shadowium_ingot')*4)
        .output(item('moretcon:repitem:3')*3)
        .register()

inWorldCrafting.fluidToItem.recipeBuilder()
        .fluidInput(fluid('liquidgoldenamber'))
        .input(item('aether_legacy:aether_log')*16)
        .input(item('aether_legacy:golden_amber')*4)
        .input(item('additions:asgardium_ingot')*2)
        .input(item('extrabotany:material:8')*2)
        .output(item('moretcon:repitem:4')*3)
        .register()

inWorldCrafting.fluidToItem.recipeBuilder()
        .fluidInput(fluid('fierymetal'))
        .input(item('twilightforest:steeleaf_ingot')*4)
        .input(item('twilightforest:ironwood_raw')*6)
        .input(item('twilightforest:knightmetal_ingot')*2)
        .output(item('moretcon:repitem:5')*3)
        .register()











inWorldCrafting.explosion.recipeBuilder()
    .input(item('biomesoplenty:crystal'))
    .output(item('moretcon:oreenderal'))
    .chance(0.1f)
    .register()
