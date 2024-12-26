// Created by xian_bei010,QQ:2234690032,mcmod:https://center.mcmod.cn/680553/
// 由仙贝010制作，QQ：2234690032，mcmod：https://center.mcmod.cn/680553/，QQ交流群：624487948

import mods.customfishing.FishingInCustomLiquid;

import crafttweaker.event.ItemFishedEvent;
import crafttweaker.event.EntityJoinWorldEvent;
import crafttweaker.entity.IEntityItem;
import crafttweaker.util.IAxisAlignedBB;
import crafttweaker.world.IBiome;
import crafttweaker.world.IWorld;
import crafttweaker.world.IBlockPos;
import crafttweaker.item.IIngredient;
import crafttweaker.item.WeightedItemStack;
import crafttweaker.item.IItemStack;
import crafttweaker.liquid.ILiquidStack;

//刚需mod：CraftTweaker，Zen Utils，CustomFishing。
//非刚需mod：RandomTweaker。用于添加jei。物品输出需要小于等于64种。
//----------需要安装RandomTweaker！否则需要删除这部分魔改----------↓
val xBFJ=mods.jei.JEI.createJei("xian_bei010_fish","钓鱼");
xBFJ.setModid("customfishing");
xBFJ.setIcon(<minecraft:fishing_rod>);
xBFJ.setBackground(mods.randomtweaker.jei.IJeiUtils.createBackground(235,235));
xBFJ.addSlot(mods.randomtweaker.jei.IJeiUtils.createItemSlot(0,0,true));
xBFJ.addSlot(mods.randomtweaker.jei.IJeiUtils.createItemSlot(18,0,true,false));
xBFJ.addSlot(mods.randomtweaker.jei.IJeiUtils.createItemSlot(36,0,true,false));
xBFJ.addSlot(mods.randomtweaker.jei.IJeiUtils.createItemSlot(54,0,true,false));
xBFJ.addSlot(mods.randomtweaker.jei.IJeiUtils.createItemSlot(72,0,true,false));
xBFJ.addSlot(mods.randomtweaker.jei.IJeiUtils.createItemSlot(0,18,true));
xBFJ.addSlot(mods.randomtweaker.jei.IJeiUtils.createItemSlot(0,36,true));
for y in 1 to 9{
    for x in 1 to 9{
        xBFJ.addSlot(mods.randomtweaker.jei.IJeiUtils.createItemSlot(1 + (25 * x),1 + (25 * y),false));
    }
}
xBFJ.register();
//----------需要安装RandomTweaker！否则需要删除这部分魔改----------↑

zenClass fishWeight{
    var item as IItemStack;
    var weight as int;
    zenConstructor(i as IItemStack,w as int){
        item=i;
        weight=w;
    }
}

zenClass fish{
    zenConstructor(){}
    var fluid as ILiquidStack=<liquid:water>;
    var dimension as int=114514;
    var biome as string;
    var damage as int=0;
    var items as fishWeight[]=[];
    var fishRods as string[]=[];
    var fishBaitIDs as string[]=[];
    var fishBaitMetas as int[]=[];
    var fishBaits as IItemStack[]=[];
    var ItemStackOutput as IItemStack;
    var altitudeBegin as int=0;
    var altitudeEnd as int=0;
    var dayTime as string;
    static fishMap as fishWeight[][string]={};
    function setFluid(f as ILiquidStack)as fish{
        fluid=f;
        return this;
    }
    function setDimension(d as int)as fish{
        dimension=d;
        return this;
    }
    function setBiome(b as string)as fish{
        biome=b;
        return this;
    }
    function additionalDamage(d as int)as fish{
        damage=d;
        return this;
    }
    function addWeightedItemStack(i as fishWeight)as fish{
        items += i;
        return this;
    }
    function addWeightedItemStacks(is as fishWeight[])as fish{
        for i in is{
            items += i;
        }
        return this;
    }
    function setFishRod(i as IItemStack)as fish{
        fishRods += i.definition.id;
        return this;
    }
    function addFishRods(is as IItemStack[])as fish{
        for i in is{
            fishRods += i.definition.id;
        }
        return this;
    }
    function setFishBait(i as IItemStack)as fish{
        fishBaits += i;
        fishBaitIDs += i.definition.id;
        fishBaitMetas += i.metadata;
        return this;
    }
    function addFishBaits(is as IItemStack[])as fish{
        for i in is{
            fishBaits += i;
            fishBaitIDs += i.definition.id;
            fishBaitMetas += i.metadata;
        }
        return this;
    }
    function setAltitude(begin as int,end as int=0)as fish{
        if(begin < end||end == 0){
            altitudeBegin=begin;
            altitudeEnd=end;
        }else print("[ERROR]:fish.zs:begin lower than end!!!");
        return this;
    }
    function setTime(dayornight as string)as fish{
        dayTime=dayornight.toLowerCase() == "day" ? "day" : "night";
        return this;
    }
    function getTotalWeight(is as fishWeight[])as int{
        var totalWeight=1;
        if(is.length > 0){
            totalWeight -= 1;
            for i in is{
                totalWeight += i.weight;
            }
        }
        return totalWeight;
    }
    function getWeightedItemStack(is as fishWeight[],world as IWorld)as IItemStack{
        if(is.length > 0){
            val randomWeight=world.random.nextInt(0,this.getTotalWeight(is));
            var cumulativeWeight = 0;
            for i in is{
                cumulativeWeight += i.weight;
                if(randomWeight <= cumulativeWeight) {
                    ItemStackOutput=i.item;
                    return i.item;
                }
            }
        }else return null;
    }
    //----------需要安装RandomTweaker！否则需要删除这部分魔改----------↓
    function addFishRecipe(fishRods as string[],fishBaits as IItemStack[],outputItems as fishWeight[],dayTime as string,altitudeBegin as int,altitudeEnd as int,fluid as ILiquidStack,dimension as int,biome as string)as void{
        var fRs=<minecraft:fishing_rod>.withDisplayName("鱼竿需求").withLore(["任意鱼竿"])as IIngredient;
        if(fishRods.length > 0){
            var fR=[]as IItemStack[];
            for i in fishRods{
                fR += itemUtils.getItem(i);
            }
            for i in fR{
                if(fRs.matchesExact(<minecraft:fishing_rod>.withDisplayName("鱼竿需求").withLore(["任意鱼竿"]))){
                    fRs=i;
                }else fRs=fRs.or(i);
            }
        }
        var fBs=<minecraft:ender_pearl>.withDisplayName("鱼饵需求").withLore(["任意鱼饵"])as IIngredient;
        if(fishBaits.length > 0){
            for i in fishBaits{
                if(fBs.matchesExact(<minecraft:ender_pearl>.withDisplayName("鱼饵需求").withLore(["任意鱼饵"]))){
                    fBs=i;
                }else fBs=fBs.or(i);
            }
        }
        val time=<minecraft:clock>.withDisplayName("时间需求").withLore(["需求时间："~((isNull(dayTime) ? "任意时间" : dayTime) == "任意时间" ? "任意时间" : (dayTime == "day" ? "白天" : "夜晚"))]);
        val altitude=<minecraft:compass>.withDisplayName("纬度需求").withLore(["需求最低高度："~altitudeBegin~"，需求最高高度："~(altitudeEnd == 0 ? "任意高度" : altitudeEnd)]);
        val d=<minecraft:grass>.withDisplayName("维度需求").withLore(["需求维度："~(dimension == 114514 ? "任意维度" : dimension)]);
        val b=<minecraft:pumpkin>.withDisplayName("生物群系需求").withLore(["需求群系："~(isNull(biome) ? "任意群系" : biome)]);
        val aFR=mods.jei.JEI.createJeiRecipe("xian_bei010_fish");
        aFR.addInput(fRs);
        aFR.addInput(time);
        aFR.addInput(altitude);
        aFR.addInput(d);
        aFR.addInput(b);
        aFR.addInput(fluid);
        aFR.addInput(fBs);
        for i in outputItems{
            aFR.addOutput(i.item.withLore(["产出概率："~(((i.weight as float) / this.getTotalWeight(outputItems) as float) * 100.0f)~"%"]));
        }
        aFR.build();
    }
    //----------需要安装RandomTweaker！否则需要删除这部分魔改----------↑
    function register()as void{
        FishingInCustomLiquid.inLiquidItemChancePoolDimBiome(isNull(fluid) ? null : fluid,'',<minecraft:fish>,0.1f,isNull(biome) ? '' : biome,dimension == 114514 ? null : dimension);
        if(items.length == 0){
            print("[ERROR]:fish.zs: item is null!!!");
            return;
        }
        //----------需要安装RandomTweaker！否则需要删除这部分魔改----------↓
        this.addFishRecipe(fishRods,fishBaits,items,dayTime,altitudeBegin,altitudeEnd,fluid,dimension,biome);
        //----------需要安装RandomTweaker！否则需要删除这部分魔改----------↑
        fishMap[fluid.definition.name]=items;
        events.onItemFished(function(event as ItemFishedEvent){
            val hook=event.fishHook;
            val p=event.player;
            val w=p.world;
            val drops=event.drops;
            val item=drops[0];
            if(!w.remote&&!isNull(w.getBlock(hook.position))&&!isNull(w.getBlock(hook.position).fluid)){
                val f=w.getBlock(hook.position).fluid;
                var hasFishRod=fishRods.length == 0;
                val handItems=[p.mainHandHeldItem,p.offHandHeldItem]as IItemStack[];
                if(!isNull(fishMap[f.name])&&(isNull(biome)||(!isNull(biome)&&w.getBiome(hook.position).name == biome))&&(dimension == 114514||(dimension != 114514&&w.dimension == dimension))){
                    if(!hasFishRod){
                        for fr in handItems{
                            if(!isNull(fr)&&fishRods has fr.definition.id){
                                hasFishRod=true;
                                break;
                            }
                        }
                    }
                    var rightAltitude=altitudeBegin == 0&&altitudeEnd == 0;
                    if(!rightAltitude&&hasFishRod){
                        val y=hook.position.y;
                        rightAltitude=(altitudeBegin <= y&&(y <= altitudeEnd||altitudeEnd == 0));
                    }
                    var rightTime=isNull(dayTime);
                    if(!rightTime){
                        rightTime=(dayTime == "day"&&w.dayTime)||(dayTime == "night"&&!w.dayTime);
                    }
                    var hasBait=fishBaitIDs.length == 0;
                    if(!hasBait&&!isNull(p.getPlayerInventoryItemHandler())){
                        val itemHandler=p.getPlayerInventoryItemHandler();
                        for i in 0 to itemHandler.size{
                            if(hasBait)break;
                            val it=itemHandler.getStackInSlot(i);
                            if(!isNull(it)&&fishBaitIDs has it.definition.id){
                                for ii in 0 to fishBaitIDs.length{
                                    if(it.definition.id == fishBaitIDs[ii]&&it.metadata == fishBaitMetas[ii]){
                                        hasBait=true;
                                        if(hasFishRod&&rightAltitude&&rightTime){
                                            if(it.amount > 1){
                                                itemHandler.setStackInSlot(i,it.withAmount(it.amount - 1));
                                            }else itemHandler.setStackInSlot(i,null);
                                        }
                                        break;
                                    }
                                }
                            }
                        }
                    }
                    if(!hasBait){
                        p.sendChat("需要鱼饵！");
                        var bs="";
                        var number=0;
                        for i in fishBaits{
                            number += 1;
                            bs ~= (i.displayName~(number == fishBaits.length ? "" : "，"));
                        }
                        p.sendChat("可供选择的鱼饵："~bs);
                    }
                    if(!hasFishRod){
                        p.sendChat("需要鱼杆！");
                        var rs="";
                        var number=0;
                        for i in fishRods{
                            number += 1;
                            rs ~= (itemUtils.getItem(i).displayName~(number == fishRods.length ? "" : "，"));
                        }
                        p.sendChat("可供选择的鱼杆："~rs);
                    }
                    if(!rightAltitude){
                        p.sendChat("需要在固定的高度钓鱼！");
                        p.sendChat("Y最低："~altitudeBegin~"，Y最高："~(altitudeEnd == 0 ? "任意高度" : altitudeEnd)~"！！！");
                    }
                    if(!rightTime){
                        p.sendChat("需要在固定的时间钓鱼！");
                        p.sendChat("需求时间："~(dayTime == "day" ? "白天" : "夜晚"));
                    }
                    if(hasFishRod&&hasBait&&rightAltitude&&rightTime){
                        event.additionalDamage=damage;
                        hook.update({"itemID":item.definition.id,"itemMeta":item.metadata,"fished":0,"fluid":f.name});
                    }
                }
            }
        });
        events.onEntityJoinWorld(function(event as EntityJoinWorldEvent){
            val e=event.entity;
            val w=event.world;
            if(!w.remote&&!isNull(e)&&e instanceof IEntityItem){
                val ei as IEntityItem=e;
                val pos=ei.position;
                var fishHookE=e;
                for fh in w.getEntitiesWithinAABB(IAxisAlignedBB.create(IBlockPos.create(pos.x - 1,pos.y - 1,pos.z - 1),IBlockPos.create(pos.x + 1,pos.y + 1,pos.z + 1))){
                    if(fh.forgeData.asString() has "fished"&&fh.forgeData.fished.asInt() == 0){
                        fishHookE=fh;
                        fh.update({"fished":1});
                        break;
                    }
                }
                if(!e.isEntityEqual(fishHookE)){
                    val data=fishHookE.forgeData;
                    if(ei.item.definition.id == data.itemID.asString()&&ei.item.metadata == data.itemMeta.asInt()&&!isNull(w.getBlock(fishHookE.position))&&!isNull(w.getBlock(fishHookE.position).fluid)){
                        val f=w.getBlock(fishHookE.position).fluid;
                        if(!isNull(fishMap[f.name]))ei.setItem(this.getWeightedItemStack(fishMap[f.name],w));
                    }
                }
            }
        });

    }
}

function createFishWeigthItemList(item as IItemStack[],weight as int[])as fishWeight[]{
    var fw as fishWeight[]=[];
    if(item.length == weight.length){
        for i in 0 to item.length{
            fw += fishWeight(item[i],weight[i]);
        }
    }else print("[ERROR]:fish.zs:List length are different!!!");
    return fw;
}