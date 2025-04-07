/*

import native.net.minecraft.item.ItemStack;
import native.net.minecraft.block.state.IBlockState;
import native.vazkii.botania.api.BotaniaAPI;
 
import crafttweaker.item.IItemStack;
 
 
zenClass ManaInfusionR{
    zenConstructor(output as IItemStack,input as IItemStack,mana as int,catalyst as IItemStack){
        val o=output as ItemStack;
        val i=input as ItemStack;
        val c=catalyst.asBlock().definition.getStateFromMeta(catalyst.damage)as IBlockState;
        val r=BotaniaAPI.registerManaInfusionRecipe(o,i,mana);
        r.setCatalyst(c);
    }
}

ManaInfusionR(<minecraft:diamond_block>,<botania:storage:3>,1000,<botania:storage:1>);

 */