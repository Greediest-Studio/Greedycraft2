def tier6Seeds = [
        'awakened_draconium': 'awakened_draconium',
        'nether_star'       : 'nether_star',
        'neutronium'        : 'neutronium',
        'dragon_egg'        : 'dragon_egg'
]

tier6Seeds.each { seedName, essenceName ->
        def seed = item("mysticalagradditions:${seedName}_seeds")
        def essence = item("mysticalagradditions:${essenceName}_essence")

        mods.mysticalagriculture.reprocessor.recipeBuilder()
                .input(seed)
                .output(essence * 2)
                .register()
}
