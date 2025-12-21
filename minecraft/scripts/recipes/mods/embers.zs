#priority 20

import mods.embers.Mixer;
import mods.embers.Alchemy;
import mods.embers.Stamper;

Mixer.remove(<liquid:dawnstone> * 8);

Mixer.add(<liquid:dawnstone> * 6, [<liquid:putrallium> * 12, <liquid:spironium> * 8, <liquid:rose_gold> * 24]);

Stamper.add(<additions:aspectus_mercury>, <liquid:mercury> * 144, <embers:stamp_plate>, <embers:shard_ember>);
Stamper.add(<additions:aspectus_salt>, <liquid:brine> * 150, <embers:stamp_plate>, <embers:shard_ember>);
Stamper.add(<additions:aspect_sulfur>, <liquid:sulfur> * 144, <embers:stamp_plate>, <embers:shard_ember>);

Alchemy.addAspect("antimony", <soot:signet_antimony>);
Alchemy.addAspect("mercury", <additions:aspectus_mercury>);
Alchemy.addAspect("salt", <additions:aspectus_salt>);
Alchemy.addAspect("sulfur", <additions:aspect_sulfur>);

Alchemy.add(<additions:lumerunine_scrap> * 4, [
    <additions:gemundyingember>,
    <extendedcrafting:material:7>,
    <additions:extended_primal_metal_ingot>,
    <aether_legacy:golden_amber>,
    <embers:ember_cluster>
], {
    "dawnstone": 16 .. 48,
    "antimony": 16 .. 48,
    "mercury": 16 .. 48,
    "salt": 16 .. 48,
    "sulfur": 16 .. 48
});

Alchemy.add(<additions:ancient_scrab>, [
    <erebus:materials:35>,
    <additions:solarys>,
    <additions:solarys>,
    <additions:ancient_sand>,
    <additions:ancient_sand>
], {
    "dawnstone": 24 .. 60,
    "antimony": 24 .. 60,
    "copper": 24 .. 60,
    "silver": 24 .. 60,
    "salt": 24 .. 60
});