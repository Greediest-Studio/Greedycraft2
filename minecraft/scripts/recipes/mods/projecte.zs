/*
 * This script is created for the GreedyCraft modpack by TCreopargh.
 * You may NOT use this script in any other publicly distributed modpack without my permission.
 */

#priority 1000

import mods.projecte.WorldTransmutation;

WorldTransmutation.add(<blockstate:additions:matter_block>, <blockstate:abyssalcraft:antiwater>);
WorldTransmutation.add(<blockstate:abyssalcraft:antiwater>, <blockstate:additions:matter_block>);

WorldTransmutation.add(<blockstate:nuclearcraft:wasteland_portal>, <blockstate:nuclearcraft:fluid_corium>);
WorldTransmutation.add(<blockstate:nuclearcraft:fluid_corium>, <blockstate:nuclearcraft:wasteland_portal>);