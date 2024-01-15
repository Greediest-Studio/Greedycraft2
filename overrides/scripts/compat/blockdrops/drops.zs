/*
 * This script is created for the GreedyCraft modpack by TCreopargh.
 * You may NOT use this script in any other publicly distributed modpack without my permission.
 */

#priority 40

import mods.dropt.Dropt;

vanilla.seeds.addSeed(<additions:greedycraft-plant_fibre> % 2);

Dropt.list("bedrock")
    .add(Dropt.rule()
    .matchBlocks(["minecraft:bedrock:*"])
    .replaceStrategy("ADD")
    .matchHarvester(Dropt.harvester()
          .type("PLAYER")
          .mainHand("WHITELIST", [], "pickaxe;10;-1")
    )
    .addDrop(Dropt.drop().items([<minecraft:bedrock>]))
);
Dropt.list("sapling_evileye")
    .add(Dropt.rule()
    .matchBlocks(["gct_mobs:evileye_leaves:*"])
    .replaceStrategy("ADD")
    .matchHarvester(Dropt.harvester()
          .type("PLAYER")
          .mainHand("BLACKLIST", [], "shears;127;-1")
    )
    .addDrop(Dropt.drop()
          .selector(Dropt.weight(19)) 
    ).addDrop(Dropt.drop()
          .selector(Dropt.weight(1))
          .items([<treetweaker:evileye>])
    )
);    
Dropt.list("sapling_livingwood")
    .add(Dropt.rule()
    .matchBlocks(["gct_mobs:livingwood_leaves:*"])
    .replaceStrategy("ADD")
    .matchHarvester(Dropt.harvester()
          .type("PLAYER")
          .mainHand("BLACKLIST", [], "shears;127;-1")
    )
    .addDrop(Dropt.drop()
          .selector(Dropt.weight(19)) 
    ).addDrop(Dropt.drop()
          .selector(Dropt.weight(1))
          .items([<treetweaker:livingwood>])
    )
);    
Dropt.list("sapling_dreamwood")
    .add(Dropt.rule()
    .matchBlocks(["gct_mobs:dreamwood_leaves:*"])
    .replaceStrategy("ADD")
    .matchHarvester(Dropt.harvester()
          .type("PLAYER")
          .mainHand("BLACKLIST", [], "shears;127;-1")
    )
    .addDrop(Dropt.drop()
          .selector(Dropt.weight(19)) 
    ).addDrop(Dropt.drop()
          .selector(Dropt.weight(1))
          .items([<treetweaker:dreamwood>])
    )
);    
Dropt.list("end_portal_frame")
    .add(Dropt.rule()
    .matchBlocks(["minecraft:end_portal_frame:*"])
    .replaceStrategy("ADD")
    .matchHarvester(Dropt.harvester()
          .type("PLAYER")
          .mainHand("WHITELIST", [], "pickaxe;5;-1")
      )
      .addDrop(Dropt.drop().items([<minecraft:end_portal_frame>])
));
Dropt.list("end_portal_frame_vertical")
    .add(Dropt.rule()
    .matchBlocks(["randomportals:vertical_end_portal_frame"])
    .replaceStrategy("ADD")
    .matchHarvester(Dropt.harvester()
          .type("PLAYER")
          .mainHand("WHITELIST", [], "pickaxe;5;-1")
      )
      .addDrop(Dropt.drop().items([<randomportals:vertical_end_portal_frame>])
));
Dropt.list("end_portal_frame_upside_down")
    .add(Dropt.rule()
    .matchBlocks(["randomportals:upside_down_end_portal_frame"])
    .replaceStrategy("ADD")
    .matchHarvester(Dropt.harvester()
          .type("PLAYER")
          .mainHand("WHITELIST", [], "pickaxe;5;-1")
      )
      .addDrop(Dropt.drop().items([<randomportals:upside_down_end_portal_frame>])
));

Dropt.list("barrier")
    .add(Dropt.rule()
    .matchBlocks(["minecraft:barrier:*"])
    .replaceStrategy("ADD")
    .matchHarvester(Dropt.harvester()
          .type("PLAYER")
          .mainHand("WHITELIST", [], "pickaxe;12;-1")
      )
      .addDrop(Dropt.drop().items([<minecraft:barrier>])
));

Dropt.list("lucky_clover")
    .add(Dropt.rule()
    .matchBlocks([
        "minecraft:tallgrass:*",
        "minecraft:vine:*",
        "biomesoplenty:plant_0:*",
        "biomesoplenty:plant_1:*",
        "biomesoplenty:willow_vine:*",
        "xlfoodmod:grass:*",
        "minecraft:double_plant:*"
    ])
    .replaceStrategy("ADD")
    .addDrop(Dropt.drop()
          .selector(Dropt.weight(199)) 
    ).addDrop(Dropt.drop()
          .selector(Dropt.weight(1))
          .items([<additions:greedycraft-lucky_clover>])
    )
);
