#priority 20

import mods.embers.Mixer;
import mods.embers.Alchemy;
import mods.embers.Stamper;

Mixer.remove(<liquid:dawnstone> * 8);

Mixer.add(<liquid:dawnstone> * 6, [<liquid:putrallium> * 12, <liquid:spironium> * 8, <liquid:rose_gold> * 24]);

Stamper.remove(<additions:hydrogen_ingot>);
Stamper.remove(<additions:helium_ingot>);
Stamper.remove(<additions:nitrogen_ingot>);
Stamper.remove(<additions:oxygen_ingot>);
Stamper.remove(<additions:fluorine_ingot>);
Stamper.remove(<additions:neon_ingot>);
Stamper.remove(<additions:argon_ingot>);
Stamper.remove(<additions:krypton_ingot>);
Stamper.remove(<additions:xenon_ingot>);
Stamper.remove(<additions:radon_ingot>);
Stamper.remove(<jaopca:plate.hydrogen>);
Stamper.remove(<jaopca:plate.helium>);
Stamper.remove(<jaopca:plate.nitrogen>);
Stamper.remove(<jaopca:plate.oxygen>);
Stamper.remove(<jaopca:plate.fluorine>);
Stamper.remove(<jaopca:plate.neon>);
Stamper.remove(<jaopca:plate.argon>);
Stamper.remove(<jaopca:plate.krypton>);
Stamper.remove(<jaopca:plate.xenon>);
Stamper.remove(<jaopca:plate.radon>);

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

Alchemy.add(<additions:nefrathite_ingot> * 2, [
    <gct_mobs:cthulhurite_block>,
    <additions:nefrath_cloth>,
    <additions:nefrath_cloth>,
    <additions:nefrath_cloth>,
    <additions:nefrath_cloth>
], {
    "silver": 32 .. 80,
    "sulfur": 32 .. 80,
    "lead": 16 .. 50,
    "salt": 16 .. 50,
    "dawnstone": 16 .. 50
});