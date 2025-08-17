//Extra Tooltips for Sakura
//By JackStuart

var introduce as string = "";
//==========各种茶==========
//红茶
introduce = "§r由红茶茶叶泡制而成";
<sakura:tea:0>.addTooltip(introduce);
<sakura:tea:0>.addTooltip("§r·饮下后获得"~stringEffect("0.05","瞬间治疗")~"buff");

//绿茶
introduce = "§r由绿茶茶叶泡制而成";
<sakura:tea:1>.addTooltip(introduce);
<sakura:tea:1>.addTooltip("§r·饮下后获得"~stringEffectInt(30,"急迫I")~"buff");

//奶茶
introduce = "§r由红茶茶叶和牛奶泡制而成";
<sakura:tea:2>.addTooltip(introduce);
<sakura:tea:2>.addTooltip("§r·饮下后获得"~stringEffect("0.05","瞬间治疗")~"和"~stringEffectInt(10,"生命恢复I")~"buff");

//奶绿
introduce = "§r由绿茶茶叶和牛奶泡制而成";
<sakura:tea:3>.addTooltip(introduce);
<sakura:tea:3>.addTooltip("§r·饮下后获得"~stringEffectInt(10,"生命恢复")~"和"~stringEffectInt(30,"急迫")~"buff");

//伯爵茶
introduce = "§r由伯爵茶叶泡制而成";
<sakura:tea:4>.addTooltip(introduce);
<sakura:tea:4>.addTooltip("§r·饮下后获得"~stringEffectInt(30,"水下呼吸")~"buff");

//伯爵奶茶
introduce = "§r由伯爵茶叶和牛奶泡制而成";
<sakura:tea:5>.addTooltip(introduce);
<sakura:tea:5>.addTooltip("§r·饮下后获得"~stringEffectInt(60,"水下呼吸II")~"buff");

//果茶
introduce = "§r由果茶茶叶泡制而成";
<sakura:tea:6>.addTooltip(introduce);
<sakura:tea:6>.addTooltip("§r·饮下后获得"~stringEffectInt(30,"跳跃提升")~"buff");

//水果奶茶
introduce = "§r由果茶茶叶和牛奶泡制而成";
<sakura:tea:7>.addTooltip(introduce);
<sakura:tea:7>.addTooltip("§r·饮下后获得"~stringEffectInt(30,"跳跃提升")~"和"~stringEffectInt(10,"生命恢复")~"buff");

//柠檬红茶
introduce = "§r由柠檬和红茶茶叶泡制而成";
<sakura:tea:8>.addTooltip(introduce);
<sakura:tea:8>.addTooltip("§r·饮下后获得"~stringEffectInt(20,"速度I")~"和"~stringEffect("0.05","瞬间治疗")~"buff");

//柠檬绿茶
introduce = "§r由柠檬和绿茶茶叶泡制而成";
<sakura:tea:9>.addTooltip(introduce);
<sakura:tea:9>.addTooltip("§r·饮下后获得"~stringEffectInt(30,"急迫I")~"和"~stringEffectInt(20,"速度I")~"buff");

//薄荷茶
introduce = "§r由薄荷茶茶叶泡制而成";
<sakura:tea:10>.addTooltip(introduce);
<sakura:tea:10>.addTooltip("§r·饮下后获得"~stringEffectInt(30,"夜视")~"buff");

//大麦茶
introduce = "§r由谷物（小麦、大米、荞麦等）泡制而成";
<sakura:tea:11>.addTooltip(introduce);
<sakura:tea:11>.addTooltip("§r·饮下后获得"~stringEffectInt(30,"抗性提升")~"buff");

//糙米茶
introduce = "§r由玄米茶茶叶泡制而成";
<sakura:tea:12>.addTooltip(introduce);
<sakura:tea:12>.addTooltip("§r·饮下后获得"~stringEffectInt(30,"生命恢复")~"buff");



<sakura:tea:*>.addTooltip("§r·重复使用以§a§o延长§rbuff时间");


//==========基础酒==========
//啤酒
introduce = "§r由水加小麦、酵母和啤酒花§e酿造§r而成的一种常见酒";
<sakura:bottle_alcoholic:0>.addTooltip(introduce);
<sakura:alcoholic:0>.addTooltip(introduce);
<sakura:alcoholic:0>.addTooltip("§r·饮下后获得"~stringEffectInt(10,"饱和")~"和30s§c反胃§rbuff");

//浊酒
introduce = "§r由水加熟米饭和酵母§e酿造§r而成的一种半成品酒";
<sakura:bottle_alcoholic:1>.addTooltip(introduce);
<sakura:alcoholic:1>.addTooltip(introduce);
<sakura:alcoholic:1>.addTooltip("§r·饮下后获得"~stringEffectInt(10,"抗性提升I")~"和30s§c反胃§rbuff");

//清酒
introduce = "§r由浊酒§e酿造§r而成的一种常见酒";
<sakura:bottle_alcoholic:2>.addTooltip(introduce);
<sakura:alcoholic:2>.addTooltip(introduce);
<sakura:alcoholic:2>.addTooltip("§r·饮下后获得"~stringEffectInt(20,"抗性提升I")~"、"~stringEffectInt(5,"生命恢复I")~"和30s§c反胃§rbuff");

//烧酒
introduce = "§r由清酒进一步§e蒸馏§r而成的一种常见酒，别名白酒";
<sakura:bottle_alcoholic:3>.addTooltip(introduce);
<sakura:alcoholic:3>.addTooltip(introduce);
<sakura:alcoholic:3>.addTooltip("§r·饮下后获得"~stringEffectInt(30,"抗性提升I")~"、"~stringEffectInt(10,"生命恢复I")~"和30s§c反胃§rbuff");

//红葡萄酒
introduce = "§r由葡萄汁加糖和酵母§e酿造§r而成的一种常见酒";
<sakura:bottle_alcoholic:4>.addTooltip(introduce);
<sakura:alcoholic:4>.addTooltip(introduce);
<sakura:alcoholic:4>.addTooltip("§r·饮下后获得"~stringEffectInt(20,"夜视")~"和30s§c反胃§rbuff");

//白葡萄酒
introduce = "§r由绿葡萄汁加糖和酵母§e酿造§r而成的一种常见酒";
<sakura:bottle_alcoholic:5>.addTooltip(introduce);
<sakura:alcoholic:5>.addTooltip(introduce);
<sakura:alcoholic:5>.addTooltip("§r·饮下后获得"~stringEffectInt(20,"夜视")~"和30s§c反胃§rbuff");

//香槟
introduce = "§r由§c白§r葡萄酒加糖和酵母进一步§e酿造§r而成的一种高级酒";
<sakura:bottle_alcoholic:6>.addTooltip(introduce);
<sakura:alcoholic:6>.addTooltip(introduce);
<sakura:alcoholic:6>.addTooltip("§r·饮下后获得"~stringEffectInt(30,"夜视II")~"和30s§c反胃§rbuff");

//朗姆
introduce = "§r由水加甘蔗§e蒸馏§r而成的一种酒";
<sakura:bottle_alcoholic:7>.addTooltip(introduce);
<sakura:alcoholic:7>.addTooltip(introduce);
<sakura:alcoholic:7>.addTooltip("§r·饮下后获得"~stringEffectInt(20,"水下呼吸")~"和30s§c反胃§rbuff");

//伏特加
introduce = "§r由水加土豆§e蒸馏§r而成的一种酒";
<sakura:bottle_alcoholic:8>.addTooltip(introduce);
<sakura:alcoholic:8>.addTooltip(introduce);
<sakura:alcoholic:8>.addTooltip("§r·饮下后获得"~stringEffectInt(20,"力量I")~"和30s§c反胃§rbuff");

//威士忌
introduce = "§r由水加谷物（小麦、大米、荞麦等）§e蒸馏§r而成的一种酒";
<sakura:bottle_alcoholic:9>.addTooltip(introduce);
<sakura:alcoholic:9>.addTooltip(introduce);
<sakura:alcoholic:9>.addTooltip("§r·饮下后获得"~stringEffectInt(20,"急迫I")~"和30s§c反胃§rbuff");

//白兰地
introduce = "§r由红/白葡萄汁加糖§e蒸馏§r而成的一种酒";
<sakura:bottle_alcoholic:10>.addTooltip(introduce);
<sakura:alcoholic:10>.addTooltip(introduce);
<sakura:alcoholic:10>.addTooltip("§r·饮下后获得"~stringEffectInt(20,"急迫I")~"和30s§c反胃§rbuff");

//琴酒
introduce = "§r一种用包括杜松子在内的植物香源浸提或串香复蒸馏制成的蒸馏酒，又称金酒、杜松子酒";
<sakura:bottle_alcoholic:11>.addTooltip(introduce);
<sakura:bottle_alcoholic:11>.addTooltip("§b·只能通过酒贩购买获得");
<sakura:alcoholic:11>.addTooltip(introduce);
<sakura:alcoholic:11>.addTooltip("§r·饮下后获得"~stringEffectInt(20,"急迫I")~"和30s§c反胃§rbuff");

//龙舌兰
introduce = "§r一种以龙舌兰为原料，经发酵、蒸馏、陈酿、调配而成的蒸馏酒";
<sakura:bottle_alcoholic:12>.addTooltip(introduce);
<sakura:bottle_alcoholic:12>.addTooltip("§b·只能通过酒贩购买获得");
<sakura:alcoholic:12>.addTooltip(introduce);
<sakura:alcoholic:12>.addTooltip("§r·饮下后获得"~stringEffectInt(20,"急迫I")~"和30s§c反胃§rbuff");

//利口酒
introduce = "§r由朗姆酒/白兰地/伏特加/威士忌加糖和各种水果§e蒸馏§r而成的一种酒精饮料";
<sakura:bottle_alcoholic:13>.addTooltip(introduce);
<sakura:alcoholic:13>.addTooltip(introduce);
<sakura:alcoholic:13>.addTooltip("§r·饮下后获得"~stringEffectInt(20,"跳跃提升I")~"和30s§c反胃§rbuff");

//可可利口酒
introduce = "§r由朗姆酒/白兰地/伏特加或威士忌加糖和可可豆§e蒸馏§r而成的一种蒸馏酒";
<sakura:bottle_alcoholic:14>.addTooltip(introduce);
<sakura:alcoholic:14>.addTooltip(introduce);
<sakura:alcoholic:14>.addTooltip("§r·饮下后获得"~stringEffectInt(20,"跳跃提升I")~"和30s§c反胃§rbuff");

<sakura:bottle_alcoholic:*>.addTooltip("§4§l现实中请适量饮酒！未成年人禁止饮酒！！");
<sakura:alcoholic:*>.addTooltip("§r·重复使用以§a§o延长§rbuff时间并§e§o重置§r§c反胃§r效果");
<sakura:alcoholic:*>.addTooltip("§4§l现实中请适量饮酒！未成年人禁止饮酒！！");

//==========鸡尾酒==========
//基尔酒
introduce = "§r由黑加仑汁、白葡萄酒和利口酒调配而成的著名法国鸡尾酒";
<sakura:cocktail:0>.addTooltip(introduce);
<sakura:cocktail:0>.addTooltip("§r·饮下后获得"~stringEffectInt(10,"经验提升I")~"、"~stringEffectInt(10,"夜视")~"和30s§c反胃§rbuff");

//皇家鸡尾酒
introduce = "§r由黑加仑汁、香槟和利口酒调配而成的著名奥地利鸡尾酒";
<sakura:cocktail:1>.addTooltip(introduce);
<sakura:cocktail:1>.addTooltip("§r·饮下后获得"~stringEffectInt(10,"经验提升I")~"、"~stringEffectInt(20,"夜视II")~"和30s§c反胃§rbuff");

//玛格丽塔
introduce = "§r由柠檬汁、龙舌兰和利口酒调配而成的著名传统鸡尾酒，也叫玛格丽特";
<sakura:cocktail:2>.addTooltip(introduce);
<sakura:cocktail:2>.addTooltip("§r·饮下后获得"~stringEffectInt(10,"速度I")~"、"~stringEffectInt(10,"抗火")~"和30s§c反胃§rbuff");

//天堂
introduce = "§r由橙汁、琴酒和利口酒调配而成的著名鸡尾酒，也叫天堂乐园";
<sakura:cocktail:3>.addTooltip(introduce);
<sakura:cocktail:3>.addTooltip("§r·饮下后获得"~stringEffectInt(10,"速度I")~"、"~stringEffectInt(10,"抗火")~"、"~stringEffect("0.1","瞬间治疗")~"和30s§c反胃§rbuff");

//边车
introduce = "§r由柠檬汁、白兰地和利口酒调配而成的著名鸡尾酒";
<sakura:cocktail:4>.addTooltip(introduce);
<sakura:cocktail:4>.addTooltip("§r·饮下后获得"~stringEffectInt(10,"急迫I")~"、"~stringEffect("0.1","金色生命I")~"和30s§c反胃§rbuff");

//法式七五
introduce = "§r由柠檬汁、糖、白兰地和利口酒调配而成的著名鸡尾酒";
<sakura:cocktail:5>.addTooltip(introduce);
<sakura:cocktail:5>.addTooltip("§r·饮下后获得"~stringEffectInt(10,"大炮I")~"和30s§c反胃§rbuff");

//约翰柯林斯
introduce = "§r由柠檬汁、糖、苏打水和利口酒调配而成的著名鸡尾酒，也叫汤姆柯林斯";
<sakura:cocktail:6>.addTooltip(introduce);
<sakura:cocktail:6>.addTooltip("§r·饮下后获得"~stringEffectInt(10,"急迫I")~"、"~stringEffect("10","抗性提升I")~"和30s§c反胃§rbuff");

//德贵丽
introduce = "§r由柠檬汁、糖和朗姆酒调配而成的著名鸡尾酒，也叫戴吉利";
<sakura:cocktail:7>.addTooltip(introduce);
<sakura:cocktail:7>.addTooltip("§r·饮下后获得"~stringEffectInt(10,"水下呼吸I")~"、"~stringEffect("10","抗性提升I")~"和30s§c反胃§rbuff");

//床笫之间
introduce = "§r由柠檬汁、朗姆酒、白兰地酒和利口酒调配而成的经典鸡尾酒";
<sakura:cocktail:8>.addTooltip(introduce);
<sakura:cocktail:8>.addTooltip("§r·饮下后获得"~stringEffectInt(10,"急迫I")~"、"~stringEffect("10","火焰之刃I")~"和30s§c反胃§rbuff");

//黑俄罗斯
introduce = "§r由伏特加和利口酒调配而成的经典鸡尾酒，全名黑俄罗斯";
<sakura:cocktail:9>.addTooltip(introduce);
<sakura:cocktail:9>.addTooltip("§r·饮下后获得"~stringEffectInt(10,"力量I")~"、"~stringEffect("10","火焰之刃I")~"和30s§c反胃§rbuff");

//教父
introduce = "§r由杏仁、威士忌和利口酒调配而成的经典鸡尾酒";
<sakura:cocktail:10>.addTooltip(introduce);
<sakura:cocktail:10>.addTooltip("§r·饮下后获得"~stringEffectInt(10,"急迫I")~"、"~stringEffect("10","经验提升I")~"和30s§c反胃§rbuff");

//教母
introduce = "§r由杏仁、伏特加和利口酒调配而成的经典鸡尾酒";
<sakura:cocktail:11>.addTooltip(introduce);
<sakura:cocktail:11>.addTooltip("§r·饮下后获得"~stringEffectInt(10,"力量I")~"、"~stringEffect("10","经验提升I")~"和30s§c反胃§rbuff");

//草蚱蜢
introduce = "§r由柠檬汁、牛奶、薄荷和利口酒调配而成的经典鸡尾酒，也叫绿色蚱蜢";
<sakura:cocktail:12>.addTooltip(introduce);
<sakura:cocktail:12>.addTooltip("§r·饮下后获得"~stringEffectInt(10,"速度I")~"、"~stringEffect("10","跳跃提升I")~"和30s§c反胃§rbuff");

//薄荷朱利普
introduce = "§r由水、糖、薄荷和利口酒调配而成的经典鸡尾酒";
<sakura:cocktail:13>.addTooltip(introduce);
<sakura:cocktail:13>.addTooltip("§r·饮下后获得"~stringEffectInt(10,"速度I")~"、"~stringEffect("10","急迫I")~"和30s§c反胃§rbuff");

//莫吉托
introduce = "§r由柠檬汁、糖、薄荷、苏打水和利口酒调配而成的著名鸡尾酒";
<sakura:cocktail:14>.addTooltip(introduce);
<sakura:cocktail:14>.addTooltip("§r·饮下后获得"~stringEffectInt(10,"速度I")~"、"~stringEffect("10","急迫I")~"、"~stringEffect("10","夜视")~"和30s§c反胃§rbuff");

//锈钉
introduce = "§r由朗姆酒和利口酒调配而成的著名鸡尾酒，也叫生锈钉";
<sakura:cocktail:15>.addTooltip(introduce);
<sakura:cocktail:15>.addTooltip("§r·饮下后获得"~stringEffectInt(10,"幸运I")~"、"~stringEffect("10","急迫I")~"和30s§c反胃§rbuff");

//柠檬玛格丽塔
introduce = "§r由柠檬、柠檬汁、龙舌兰和利口酒调配而成的著名传统鸡尾酒，玛格丽塔的变种之一";
<sakura:cocktail:16>.addTooltip(introduce);
<sakura:cocktail:16>.addTooltip("§r·饮下后获得"~stringEffectInt(20,"速度II")~"、"~stringEffectInt(20,"抗火II")~"和30s§c反胃§rbuff");

//俄罗斯之春
introduce = "§r由柠檬汁、黑加仑汁、糖、伏特加和利口酒调配而成的传统鸡尾酒";
<sakura:cocktail:17>.addTooltip(introduce);
<sakura:cocktail:17>.addTooltip("§r·饮下后获得"~stringEffectInt(10,"生命恢复I")~"、"~stringEffectInt(10,"抗性提升I")~"、"~stringEffect("10","力量I")~"和30s§c反胃§rbuff");

//亚历山大
introduce = "§r由柠檬汁、黑加仑汁、糖、伏特加和利口酒调配而成的传统鸡尾酒";
<sakura:cocktail:18>.addTooltip(introduce);
<sakura:cocktail:18>.addTooltip("§r·饮下后获得"~stringEffectInt(10,"生命恢复I")~"、10s§c饥饿II§r和30s§c反胃§rbuff");

//飞行
introduce = "§r由柠檬汁、琴酒和白兰地调配而成的传统鸡尾酒";
<sakura:cocktail:19>.addTooltip(introduce);
<sakura:cocktail:19>.addTooltip("§r·饮下后获得"~stringEffectInt(10,"速度I")~"、5s§c漂浮I§r和30s§c反胃§rbuff");

//波菲利浦
introduce = "§r由鸡蛋、白兰地和红葡萄酒调配而成的传统鸡尾酒";
<sakura:cocktail:20>.addTooltip(introduce);
<sakura:cocktail:20>.addTooltip("§r·饮下后获得"~stringEffectInt(10,"急迫I")~"、"~stringEffectInt(10,"夜视")~"和30s§c反胃§rbuff");

//红眼
introduce = "§r由番茄酱、糖、伏特加和啤酒调配而成的传统鸡尾酒";
<sakura:cocktail:21>.addTooltip(introduce);
<sakura:cocktail:21>.addTooltip("§r·饮下后获得"~stringEffectInt(10,"生命提升I")~"、"~stringEffectInt(10,"夜视")~"和30s§c反胃§rbuff");

//汽酒
introduce = "§r由苏打水和红/白葡萄酒调配而成的流行鸡尾酒，也叫起泡酒、气泡酒";
<sakura:cocktail:22>.addTooltip(introduce);
<sakura:cocktail:22>.addTooltip("§r·饮下后获得"~stringEffectInt(20,"夜视")~"和30s§c反胃§rbuff");

//潘趣酒
introduce = "§r由柠檬汁、糖和啤酒调配而成的流行鸡尾酒，也叫潘趣酒";
<sakura:cocktail:23>.addTooltip(introduce);
<sakura:cocktail:23>.addTooltip("§r·饮下后获得"~stringEffectInt(10,"饱和I")~"、5s§c漂浮I§r和30s§c反胃§rbuff");

//血腥玛丽
introduce = "§r由橙汁和伏特加调配而成的著名传统鸡尾酒";
<sakura:cocktail:24>.addTooltip(introduce);
<sakura:cocktail:24>.addTooltip("§r·饮下后获得"~stringEffectInt(20,"力量II")~"和30s§c反胃§rbuff");

//螺丝起子
introduce = "§r由柠檬汁、盐、黑胡椒、番茄酱和伏特加调配而成的传统鸡尾酒，也叫螺丝起子";
<sakura:cocktail:25>.addTooltip(introduce);
<sakura:cocktail:25>.addTooltip("§r·饮下后获得"~stringEffectInt(10,"生命提升I")~"、"~stringEffectInt(10,"伤害吸收")~"、"~stringEffect("10","力量I")~"和30s§c反胃§rbuff");

//清酒马提尼
introduce = "§r由清酒和利口酒调配而成的日本风味鸡尾酒";
<sakura:cocktail:26>.addTooltip(introduce);
<sakura:cocktail:26>.addTooltip("§r·饮下后获得"~stringEffectInt(10,"生命提升I")~"、"~stringEffectInt(10,"生命恢复I")~"、"~stringEffect("0.1","瞬间治疗I")~"和30s§c反胃§rbuff");

//Boilermaker
introduce = "§r由啤酒和威士忌调配而成的传统鸡尾酒，也叫锅炉厂鸡尾酒";
<sakura:cocktail:27>.addTooltip(introduce);
<sakura:cocktail:27>.addTooltip("§r·饮下后获得"~stringEffectInt(10,"饱和I")~"、"~stringEffectInt(10,"急迫I")~"和30s§c反胃§rbuff");

//啤酒玛格丽塔
introduce = "§r由柠檬汁、啤酒和利口酒调配而成的著名传统鸡尾酒，玛格丽塔的变种之一";
<sakura:cocktail:28>.addTooltip(introduce);
<sakura:cocktail:28>.addTooltip("§r·饮下后获得"~stringEffectInt(10,"饱和I")~"、"~stringEffectInt(10,"速度I")~"和30s§c反胃§rbuff");

//长岛冰茶
introduce = "§r由伏特加、朗姆酒、琴酒、利口酒和龙舌兰，再加入可可豆和柠檬汁调配而成的传统鸡尾酒";
<sakura:cocktail:29>.addTooltip(introduce);
<sakura:cocktail:29>.addTooltip("§r·饮下后获得"~stringEffectInt(10,"金色生命I")~"和30s§c反胃§rbuff");

//海波
introduce = "§r由苏打水加威士忌调配而成的传统鸡尾酒";
<sakura:cocktail:30>.addTooltip(introduce);
<sakura:cocktail:30>.addTooltip("§r·饮下后获得"~stringEffectInt(20,"急迫I")~"和30s§c反胃§rbuff");

//传送走廊
introduce = "§r由苏打水、柠檬汁、薄荷和朗姆酒调配而成的鸡尾酒";
<sakura:cocktail:31>.addTooltip(introduce);
<sakura:cocktail:31>.addTooltip("§r·饮下后获得"~stringEffectInt(10,"饱和I")~"、"~stringEffectInt(10,"急迫I")~"、"~stringEffect("10","力量I")~"和30s§c反胃§rbuff");

//毒刺
introduce = "§r由白葡萄酒、薄荷和利口酒调配而成的经典鸡尾酒，又称史汀格鸡尾酒";
<sakura:cocktail:32>.addTooltip(introduce);
<sakura:cocktail:32>.addTooltip("§r·饮下后获得"~stringEffectInt(10,"毒药")~"和30s§c反胃§rbuff");

//尼格罗尼
introduce = "§r由利口酒、琴酒和§c红§r葡萄酒调配而成的经典鸡尾酒";
<sakura:cocktail:33>.addTooltip(introduce);
<sakura:cocktail:33>.addTooltip("§r·饮下后获得"~stringEffectInt(10,"抗性提升I")~"、"~stringEffectInt(5,"金色生命I")~"和30s§c反胃§rbuff");

//古典酒
introduce = "§r由威士忌、水、糖和朗姆酒调配而成的著名经典鸡尾酒，又称古典酒";
<sakura:cocktail:34>.addTooltip(introduce);
<sakura:cocktail:34>.addTooltip("§r·饮下后获得"~stringEffectInt(10,"速度I")~"、"~stringEffectInt(10,"急迫I")~"、"~stringEffect("10","夜视")~"和30s§c反胃§rbuff");

//威士忌酸
introduce = "§r由柠檬汁、糖和威士忌调配而成的经典鸡尾酒";
<sakura:cocktail:35>.addTooltip(introduce);
<sakura:cocktail:35>.addTooltip("§r·饮下后获得"~stringEffectInt(10,"速度I")~"、"~stringEffectInt(10,"急迫I")~"和30s§c反胃§rbuff");

//琴蕾
introduce = "§r由柠檬汁、苏打水和琴酒调配而成的经典鸡尾酒";
<sakura:cocktail:36>.addTooltip(introduce);
<sakura:cocktail:36>.addTooltip("§r·饮下后获得"~stringEffectInt(20,"速度I")~"、"~stringEffectInt(20,"急迫I")~"和30s§c反胃§rbuff");

//龙舌兰日出
introduce = "§r由橙汁、糖和龙舌兰调配而成的著名经典鸡尾酒，也叫特基拉日出";
<sakura:cocktail:37>.addTooltip(introduce);
<sakura:cocktail:37>.addTooltip("§r·饮下后获得"~stringEffectInt(10,"速度I")~"、"~stringEffect("0.1","瞬间治疗")~"和30s§c反胃§rbuff");

//飞蝗
introduce = "§r由柠檬汁、薄荷、啤酒和利口酒调配而成的经典鸡尾酒，也叫飞天蚱蜢";
<sakura:cocktail:38>.addTooltip(introduce);
<sakura:cocktail:38>.addTooltip("§r·饮下后获得"~stringEffectInt(10,"速度II")~"、"~stringEffectInt(10,"跳跃提升I")~"和30s§c反胃§rbuff");

//蛋奶酒
introduce = "§r由牛奶、鸡蛋、糖和威士忌调配而成的经典圣诞饮品";
<sakura:cocktail:39>.addTooltip(introduce);
<sakura:cocktail:39>.addTooltip("§r·饮下后获得"~stringEffectInt(10,"蝎毒I")~"和30s§c反胃§rbuff");

//天蝎
introduce = "§r由白兰地、柠檬汁、橙汁、糖和朗姆酒调配而成的经典鸡尾酒，也叫天蝎座";
<sakura:cocktail:40>.addTooltip(introduce);
<sakura:cocktail:40>.addTooltip("§r·饮下后获得"~stringEffectInt(10,"饱和I")~"、"~stringEffectInt(10,"力量I")~"和30s§c反胃§rbuff");

//莫斯科骡子
introduce = "§r由柠檬汁、苏打水、柠檬和伏特加调配而成的著名经典鸡尾酒，也叫莫斯科之骡、莫斯科佬";
<sakura:cocktail:41>.addTooltip(introduce);
<sakura:cocktail:41>.addTooltip("§r·饮下后§4只会§r获得30s§c反胃§rbuff");

<sakura:cocktail:*>.addTooltip("§r·重复使用以§a§o延长§r其他buff时间并§e§o重置§r§c反胃§r效果");

//===山猪之悲伤===
//玛格丽塔
<sakura:cocktail:2>.addTooltip("§m§o·然而它并不能给你回血回蓝");
//血腥玛丽
<sakura:cocktail:24>.addTooltip("§m§o·然而它并不能让你在血月提升速度和伤害");
//螺丝起子
<sakura:cocktail:25>.addTooltip("§m§o·然而它并不能给你增加穿透类弹幕的伤害");
//古典酒
<sakura:cocktail:34>.addTooltip("§m§o·然而它并不能给你增加饰品和套装奖励的伤害");
//龙舌兰日出
<sakura:cocktail:37>.addTooltip("§m§o·然而它并不能让你在白天增加伤害、击退和防御");
//莫斯科骡子
<sakura:cocktail:41>.addTooltip("§m§o·然而它并不能增加你的伤害、击退和暴击率");

<sakura:cocktail:*>.addTooltip("§4§l现实中请适量饮酒！未成年人禁止饮酒！！");

function stringEffect(time as string,effectName as string) as string{
    return time~"s§6"~effectName~"§r";
}

function stringEffectInt(time as int,effectName as string) as string{
    return stringEffect(time as string,effectName);
}

function stringEffectIntENG(time as int,effectName as string) as string{
    return "§6" ~ effectName~" §rfor "~(time as string)~" s";
}

