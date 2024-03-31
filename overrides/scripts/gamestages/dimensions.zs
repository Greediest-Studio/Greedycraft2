/*
 * This script is created for the GreedyCraft modpack by TCreopargh.
 * You may NOT use this script in any other publicly distributed modpack without my permission. 
 */ 

/*小小的注释：维度ID
-11325 漆黑世界
-1 下界
0 主世界
1 末地
7 暮色森林
20 交错次元
23 糖果世界
25 太初
41 裂隙彼端
50 深渊荒原
51 恐惧之地
52 奥穆索
53 黑暗领域
54 深暗领域
55 扭曲遗址
56 豆腐世界
69 朦胧世界
76 永昼之地
77 恒晓之地
78 深空之域
100 虚空之地
101 无名之地
102 秩序之地
111 失落的城市
144 压缩空间内部
173 天境
420 伊甸
421 原始
422 阿帕拉契亚
423 冰刺
424 黑金
425 冰晶雪原
426 秘界
427 梦魇
645 极光幽境
820 桉域
821 噬渊
822 怒焰石林
823 遗忘冰川
824 尘泥沼泽
826 苍穹之城
827 迷雾丛林
829 黑岩迷宫
14676 虚域
*/

#priority 910

import crafttweaker.item.IItemStack;
import crafttweaker.data.IData;
import crafttweaker.item.IIngredient;

import mods.zenstages.ZenStager;
import mods.zenstages.Stage;
import mods.ItemStages;

import scripts.util.gamestages as GameStagesUtil;

GameStagesUtil.stageTwilightShield.addDimension(-1);
GameStagesUtil.stageEnderCharm.addDimension(1);
GameStagesUtil.stageFearlessMan.addDimension(51);
GameStagesUtil.stageHardmode.addDimension(52);
GameStagesUtil.stageNether.addDimension(4);
GameStagesUtil.stageNether.addDimension(425);
GameStagesUtil.stageNether.addDimension(645);
GameStagesUtil.stageHardmode.addDimension(-11325);
GameStagesUtil.stageWitherSlayer.addDimension(822);
GameStagesUtil.stageWitherSlayer.addDimension(823);
GameStagesUtil.stageWitherSlayer.addDimension(426);
GameStagesUtil.stageHardmode.addDimension(420);
GameStagesUtil.stageHardmode.addDimension(421);
GameStagesUtil.stageHardmode.addDimension(422);
GameStagesUtil.stageHardmode.addDimension(423);
GameStagesUtil.stageHardmode.addDimension(424);
GameStagesUtil.stageFusionMatrix.addDimension(76);
GameStagesUtil.stageFusionMatrix.addDimension(77);
GameStagesUtil.stageFusionMatrix.addDimension(820);
GameStagesUtil.stageFusionMatrix.addDimension(821);
GameStagesUtil.stageFusionMatrix.addDimension(824);
GameStagesUtil.stageFusionMatrix.addDimension(69);
GameStagesUtil.stageWyvern.addDimension(827);
GameStagesUtil.stageWyvern.addDimension(826);
GameStagesUtil.stageWyvern.addDimension(829);
GameStagesUtil.stageChaotic.addDimension(78);
GameStagesUtil.stageChaotic.addDimension(100);
GameStagesUtil.stageChaotic.addDimension(101);
GameStagesUtil.stageChaotic.addDimension(54);
GameStagesUtil.stageChaotic.addDimension(324987);
GameStagesUtil.stageBetweenlandTraveller.addDimension(20);
GameStagesUtil.stageWarped.addDimension(55);
GameStagesUtil.stageWarped.addDimension(102);
GameStagesUtil.stageFinal.addDimension(2);
