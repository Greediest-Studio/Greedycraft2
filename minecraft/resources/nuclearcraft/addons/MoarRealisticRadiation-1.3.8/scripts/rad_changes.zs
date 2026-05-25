/*
Copyright Bob Bartsch, 2021

This code is governed by the
Creative Commons Attribution–NonCommercial License
https://creativecommons.org/licenses/by-nc/3.0/

(Meaning: credit me if you modify and/or redistribute
this code. Also, you may not sell this code.)
*/

#loader preinit


//isotopes
mods.nuclearcraft.Radiation.setMaterialRadiationLevel("Tritium",4.06e-2);
mods.nuclearcraft.Radiation.setMaterialRadiationLevel("Strontium90",1.74e-2);
mods.nuclearcraft.Radiation.setMaterialRadiationLevel("Ruthenium106",4.88e-1);
mods.nuclearcraft.Radiation.setMaterialRadiationLevel("Caesium137",4.81e-2);
mods.nuclearcraft.Radiation.setMaterialRadiationLevel("Promethium147",1.91e-1);
mods.nuclearcraft.Radiation.setMaterialRadiationLevel("Europium155",2.85e-1);
mods.nuclearcraft.Radiation.setMaterialRadiationLevel("Bismuth",4.03e-23);
mods.nuclearcraft.Radiation.setMaterialRadiationLevel("Polonium",5.38e-5);
mods.nuclearcraft.Radiation.setMaterialRadiationLevel("Radium",2.51e-3);
mods.nuclearcraft.Radiation.setMaterialRadiationLevel("Thorium",2.70e-10);
mods.nuclearcraft.Radiation.setMaterialRadiationLevel("TBP",2.41e-01);
mods.nuclearcraft.Radiation.setMaterialRadiationLevel("Protactinium233",4.35);
mods.nuclearcraft.Radiation.setMaterialRadiationLevel("Uranium233",1.78e-5);
mods.nuclearcraft.Radiation.setMaterialRadiationLevel("Uranium",2.20e-9);
mods.nuclearcraft.Radiation.setMaterialRadiationLevel("Uranium235",1.07e-8);
mods.nuclearcraft.Radiation.setMaterialRadiationLevel("Uranium238",1.25e-9);
mods.nuclearcraft.Radiation.setMaterialRadiationLevel("Neptunium236",1.62e-5);
mods.nuclearcraft.Radiation.setMaterialRadiationLevel("Neptunium237",1.27e-6);
mods.nuclearcraft.Radiation.setMaterialRadiationLevel("Plutonium238",3.30e-3);
mods.nuclearcraft.Radiation.setMaterialRadiationLevel("Plutonium239",5.35e-5);
mods.nuclearcraft.Radiation.setMaterialRadiationLevel("Plutonium241",3.50e-2);
mods.nuclearcraft.Radiation.setMaterialRadiationLevel("Plutonium242",6.25e-7);
mods.nuclearcraft.Radiation.setMaterialRadiationLevel("Americium241",2.34e-3);
mods.nuclearcraft.Radiation.setMaterialRadiationLevel("Americium242",6.86e-3);
mods.nuclearcraft.Radiation.setMaterialRadiationLevel("Americium243",3.02e-4);
mods.nuclearcraft.Radiation.setMaterialRadiationLevel("Curium243",4.00e-2);
mods.nuclearcraft.Radiation.setMaterialRadiationLevel("Curium245",1.76e-4);
mods.nuclearcraft.Radiation.setMaterialRadiationLevel("Curium246",4.16e-5);
mods.nuclearcraft.Radiation.setMaterialRadiationLevel("Curium247",2.43e-7);
mods.nuclearcraft.Radiation.setMaterialRadiationLevel("Berkelium247",1.42e-3);
mods.nuclearcraft.Radiation.setMaterialRadiationLevel("Berkelium248",8.89e-2);
mods.nuclearcraft.Radiation.setMaterialRadiationLevel("Californium249",2.92e-3);
mods.nuclearcraft.Radiation.setMaterialRadiationLevel("Californium250",1.78e-2);
mods.nuclearcraft.Radiation.setMaterialRadiationLevel("Californium251",1.73e-3);
mods.nuclearcraft.Radiation.setMaterialRadiationLevel("Californium252",1.04);

if(loadedMods has "qmd"){
mods.nuclearcraft.Radiation.setMaterialRadiationLevel("Beryllium7",5.20e-1);
mods.nuclearcraft.Radiation.setMaterialRadiationLevel("Sodium22",1.17);
mods.nuclearcraft.Radiation.setMaterialRadiationLevel("Calcium48",4.45e-20);
mods.nuclearcraft.Radiation.setMaterialRadiationLevel("Cobalt60",4.74e-1);
mods.nuclearcraft.Radiation.setMaterialRadiationLevel("Iridium192",3.46);
mods.nuclearcraft.Radiation.setMaterialRadiationLevel("Protactinium231",1.56e-4);
mods.nuclearcraft.Radiation.setMaterialRadiationLevel("Uranium234",1.75e-5);
mods.nuclearcraft.Radiation.setMaterialRadiationLevel("Copernicium291",8.57e-2);
mods.nuclearcraft.Radiation.setMaterialRadiationLevel("MIX291",9.52E-03);
mods.nuclearcraft.Radiation.setMaterialRadiationLevel("DepletedMIX291",3.18E-02);
}

if(loadedMods has "trinity"){
mods.nuclearcraft.Radiation.setMaterialRadiationLevel("Gold198",7.64E+00);
}

//fuels
mods.nuclearcraft.Radiation.setMaterialRadiationLevel("TBU",9.90e-7);
mods.nuclearcraft.Radiation.setMaterialRadiationLevel("LEU233",1.98e-6);
mods.nuclearcraft.Radiation.setMaterialRadiationLevel("HEU233",5.94e-6);
mods.nuclearcraft.Radiation.setMaterialRadiationLevel("LEU235",2.31e-9);
mods.nuclearcraft.Radiation.setMaterialRadiationLevel("HEU235",4.41e-9);

mods.nuclearcraft.Radiation.setMaterialRadiationLevel("LEN236",2.93e-6);
mods.nuclearcraft.Radiation.setMaterialRadiationLevel("HEN236",6.25e-6);

mods.nuclearcraft.Radiation.setMaterialRadiationLevel("LEP239",6.49e-6);
mods.nuclearcraft.Radiation.setMaterialRadiationLevel("HEP239",1.82e-5);
mods.nuclearcraft.Radiation.setMaterialRadiationLevel("LEP241",3.89e-3);
mods.nuclearcraft.Radiation.setMaterialRadiationLevel("HEP241",1.17e-2);

mods.nuclearcraft.Radiation.setMaterialRadiationLevel("MIX239",5.94e-6);
mods.nuclearcraft.Radiation.setMaterialRadiationLevel("MIX241",3.89e-3);

mods.nuclearcraft.Radiation.setMaterialRadiationLevel("LEA242",1.03e-3);
mods.nuclearcraft.Radiation.setMaterialRadiationLevel("HEA242",2.49e-3);

mods.nuclearcraft.Radiation.setMaterialRadiationLevel("LECm243",4.48e-3);
mods.nuclearcraft.Radiation.setMaterialRadiationLevel("HECm243",1.34e-2);
mods.nuclearcraft.Radiation.setMaterialRadiationLevel("LECm245",5.66e-5);
mods.nuclearcraft.Radiation.setMaterialRadiationLevel("HECm245",8.64e-5);
mods.nuclearcraft.Radiation.setMaterialRadiationLevel("LECm247",3.70e-5);
mods.nuclearcraft.Radiation.setMaterialRadiationLevel("HECm247",2.78e-5);

mods.nuclearcraft.Radiation.setMaterialRadiationLevel("LEB248",1.11e-2);
mods.nuclearcraft.Radiation.setMaterialRadiationLevel("HEB248",3.06e-2);

mods.nuclearcraft.Radiation.setMaterialRadiationLevel("LECf249",9.24e-1);
mods.nuclearcraft.Radiation.setMaterialRadiationLevel("HECf249",6.94e-1);
mods.nuclearcraft.Radiation.setMaterialRadiationLevel("LECf251",9.24e-1);
mods.nuclearcraft.Radiation.setMaterialRadiationLevel("HECf251",6.93e-1);


//depleted fuels
mods.nuclearcraft.Radiation.setMaterialRadiationLevel("DepletedTBU",1.82e-3);
mods.nuclearcraft.Radiation.setMaterialRadiationLevel("DepletedLEU233",5.74e-3);
mods.nuclearcraft.Radiation.setMaterialRadiationLevel("DepletedHEU233",5.49e-3);
mods.nuclearcraft.Radiation.setMaterialRadiationLevel("DepletedLEU235",1.38e-3);
mods.nuclearcraft.Radiation.setMaterialRadiationLevel("DepletedHEU235",4.04e-3);

mods.nuclearcraft.Radiation.setMaterialRadiationLevel("DepletedLEN236",5.22e-3);
mods.nuclearcraft.Radiation.setMaterialRadiationLevel("DepletedHEN236",4.38e-3);

mods.nuclearcraft.Radiation.setMaterialRadiationLevel("DepletedLEP239",6.58e-3);
mods.nuclearcraft.Radiation.setMaterialRadiationLevel("DepletedHEP239",2.66e-2);
mods.nuclearcraft.Radiation.setMaterialRadiationLevel("DepletedLEP241",5.97e-3);
mods.nuclearcraft.Radiation.setMaterialRadiationLevel("DepletedHEP241",1.85e-2);

mods.nuclearcraft.Radiation.setMaterialRadiationLevel("DepletedMIX239",9.70e-3);
mods.nuclearcraft.Radiation.setMaterialRadiationLevel("DepletedMIX241",9.70e-3);

mods.nuclearcraft.Radiation.setMaterialRadiationLevel("DepletedLEA242",1.53e-2);
mods.nuclearcraft.Radiation.setMaterialRadiationLevel("DepletedHEA242",2.06e-2);

mods.nuclearcraft.Radiation.setMaterialRadiationLevel("DepletedLECm243",1.55e-2);
mods.nuclearcraft.Radiation.setMaterialRadiationLevel("DepletedHECm243",2.61e-2);
mods.nuclearcraft.Radiation.setMaterialRadiationLevel("DepletedLECm245",6.98e-3);
mods.nuclearcraft.Radiation.setMaterialRadiationLevel("DepletedHECm245",1.96e-2);
mods.nuclearcraft.Radiation.setMaterialRadiationLevel("DepletedLECm247",1.67e-2);
mods.nuclearcraft.Radiation.setMaterialRadiationLevel("DepletedHECm247",3.00e-2);

mods.nuclearcraft.Radiation.setMaterialRadiationLevel("DepletedLEB248",1.47e-1);
mods.nuclearcraft.Radiation.setMaterialRadiationLevel("DepletedHEB248",4.18e-1);

mods.nuclearcraft.Radiation.setMaterialRadiationLevel("DepletedLECf249",9.44e-1);
mods.nuclearcraft.Radiation.setMaterialRadiationLevel("DepletedHECf249",7.56e-1);
mods.nuclearcraft.Radiation.setMaterialRadiationLevel("DepletedLECf251",9.46e-1);
mods.nuclearcraft.Radiation.setMaterialRadiationLevel("DepletedHECf251",8.76e-1);