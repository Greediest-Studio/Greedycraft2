import crafttweaker.data.IData;
import crafttweaker.item.IItemStack;
 
val basicdrawers4 as IItemStack[]=[<storagedrawers:basicdrawers:2>,<storagedrawers:basicdrawers:4>];
val basicdrawers2 as IItemStack[]=basicdrawers4 + <storagedrawers:basicdrawers:1> + <storagedrawers:basicdrawers:3>;
val basicdrawers1 as IItemStack[]=basicdrawers2 + <storagedrawers:basicdrawers>;
 
for i in basicdrawers1{
    i.addAdvancedTooltip(function(item){
        var ii0="§b空";
        if(item.hasTag&&!isNull(item.tag.tile)&&!isNull(item.tag.tile.Drawers)){
            val d=item.tag.tile.Drawers as IData;
            if(!isNull(d[0])&&!isNull(d[0].Item)){
                val i=itemUtils.getItem(
                    d[0].Item.id.asString(),
                    d[0].Item.Damage.asShort()
                );
                val t=!isNull(d[0].Item.tag) ? d[0].Item.tag as IData : {};
                val c=d[0].Count.asInt() as int;
                ii0=i.withTag(t).displayName~"§r*§b"~c;
            }
        }
        return "§a第一槽位物品为：§b"~ii0;
    });
}
for i in basicdrawers2{
    i.addAdvancedTooltip(function(item){
        var ii1="§b空";
        if(item.hasTag&&!isNull(item.tag.tile)&&!isNull(item.tag.tile.Drawers)){
            val d=item.tag.tile.Drawers as IData;
            if(!isNull(d[1])&&!isNull(d[1].Item))ii1=itemUtils.getItem(d[1].Item.id.asString(),d[1].Item.Damage.asShort()).withTag(!isNull(d[1].Item.tag) ? d[1].Item.tag as IData : {}).displayName~"§r*§b"~d[1].Count.asInt();
        }
        return "§a第二槽位物品为：§b"~ii1;
    });
}
for i in basicdrawers4{
    i.addAdvancedTooltip(function(item){
        var ii2="§b空";
        if(item.hasTag&&!isNull(item.tag.tile)&&!isNull(item.tag.tile.Drawers)){
            val d=item.tag.tile.Drawers as IData;
            if(!isNull(d[2])&&!isNull(d[2].Item))ii2=itemUtils.getItem(d[2].Item.id.asString(),d[2].Item.Damage.asShort()).withTag(!isNull(d[2].Item.tag) ? d[2].Item.tag as IData : {}).displayName~"§r*§b"~d[2].Count.asInt();
        }
        return "§a第三槽位物品为：§b"~ii2;
    });
}
for i in basicdrawers4{
    i.addAdvancedTooltip(function(item){
        var ii3="§b空";
        if(item.hasTag&&!isNull(item.tag.tile)&&!isNull(item.tag.tile.Drawers)){
            val d=item.tag.tile.Drawers as IData;
            if(!isNull(d[3])&&!isNull(d[3].Item))ii3=itemUtils.getItem(d[3].Item.id.asString(),d[3].Item.Damage.asShort()).withTag(!isNull(d[3].Item.tag) ? d[3].Item.tag as IData : {}).displayName~"§r*§b"~d[3].Count.asInt();
        }
        return "§a第四槽位物品为：§b"~ii3;
    });
}
