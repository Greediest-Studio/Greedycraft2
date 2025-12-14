/*
 * This script is created for the GreedyCraft II modpack by mc_Edwin.
 * You may NOT use this script in any other publicly distributed modpack without my permission. 
 */ 

#priority 32400
#reloadable

import native.java.util.Random;
import native.java.util.HexFormat;
import native.java.math.BigInteger;

function encodeCoordinate(x as int, y as int, z as int, key as int) as string {
    val random as Random = Random(key as long);
    var result as string = "";
    val coords as int[] = [x, y, z];
    for coord in coords {
        val randomValue = random.nextInt(32768); // 使用15位随机数，保留1位给符号
        
        // 分离符号位和绝对值
        val isNegative = coord < 0;
        val absCoord = coord < 0 ? -coord : coord;
        
        // 只对绝对值进行加密
        val encrypted = absCoord ^ randomValue;
        
        // 将符号位编码到最高位：负数时设置第16位为1
        val finalValue = isNegative ? (encrypted | 0x8000) : encrypted;
        
        var hex = HexFormat.of().toHexDigits(finalValue as long & 0xFFFF, 4);
        result += hex;
    }
    return result;
}

function decodeCoordinate(encoded as string, key as int) as int[] {
    val random as Random = Random(key as long);
    var result as int[] = [];
    for i in [0, 1, 2] {
        val hexPart as string = encoded.substring(i * 4, i * 4 + 4);
        val encryptedWithSign as int = BigInteger(hexPart, 16).intValue();
        val randomValue as int = random.nextInt(32768); // 使用相同的15位随机数
        
        // 提取符号位（最高位）
        val isNegative = (encryptedWithSign & 0x8000) != 0;
        
        // 移除符号位，只保留数据位
        val encryptedData = encryptedWithSign & 0x7FFF;
        
        // 解密绝对值
        val absCoord = encryptedData ^ randomValue;
        
        // 根据符号位恢复原始坐标
        val coord = isNegative ? -absCoord : absCoord;
        result += coord;
    }
    return result;
}

function decodeCoordinateFromStr(encoded as string, key as string) as int[] {
    // 允许传入字符串形式的数字密钥，便于直接复用 decodeCoordinate 逻辑
    val keyInt as int = BigInteger(key, 10).intValue();
    return decodeCoordinate(encoded, keyInt);
}

function toBinaryBox(number as int) as string {
    if (number == 0) {
        return "□";
    }
    var binary as string = "";
    var num as int = number;
    if (num < 0) {
        num = -num;
        binary = "▲";
    }
    while (num > 0) {
        if (num % 2 == 1) {
            binary = "■" + binary;
        } else {
            binary = "□" + binary;
        }
        num = num / 2;
    }
    return binary;
}