/*
 * This script is created for the GreedyCraft II modpack by mc_Edwin.
 * You may NOT use this script in any other publicly distributed modpack without my permission. 
 */ 

#priority 32400

import native.java.util.Random;
import native.java.util.HexFormat;
import native.java.math.BigInteger;

function encodeCoordinate(x as int, y as int, z as int, key as int) as string {
    val random as Random = Random(key as long);
    var result as string = "";
    val coords as int[] = [x, y, z];
    for coord in coords {
        val randomValue = random.nextInt(65536);
        val encrypted = coord ^ randomValue;

        var hex = HexFormat.of().toHexDigits(encrypted as long & 0xFFFF, 4);
        result += hex;
    }
    return result;
}

function decodeCoordinate(encoded as string, key as int) as int[] {
    val random as Random = Random(key as long);
    var result as int[] = [];
    for i in [0, 1, 2] {
        val hexPart as string = encoded.substring(i * 4, i * 4 + 4);
        val encrypted as int = BigInteger(hexPart, 16).intValue();
        val randomValue as int = random.nextInt(65536);
        val coord as int = encrypted ^ randomValue;
        result += coord;
    }
    return result;
}