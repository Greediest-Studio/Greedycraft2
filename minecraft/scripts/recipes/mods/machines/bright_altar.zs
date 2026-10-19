/*
 * This script is created for the GreedyCraft Tweaks by mc_Edwin.
 */

#priority 50

import crafttweaker.oredict.IOreDictEntry;
import crafttweaker.item.IItemStack;
import crafttweaker.data.IData;
import crafttweaker.item.IIngredient;
import crafttweaker.liquid.ILiquidStack;
import crafttweaker.world.IBlockPos;
import crafttweaker.world.IWorld;
import native.hellfirepvp.modularmachinery.common.tiles.base.TileMultiblockMachineController;
import native.hellfirepvp.modularmachinery.common.machine.DynamicMachine;

import mods.modularmachinery.RecipeBuilder;
import mods.modularmachinery.RecipePrimer;
import mods.modularmachinery.RecipeCheckEvent;
import mods.modularmachinery.FactoryRecipeStartEvent;
import mods.modularmachinery.RecipeModifierBuilder;
import mods.modularmachinery.MMEvents;
import mods.modularmachinery.MachineTickEvent;
import mods.modularmachinery.RecipeTickEvent;
import mods.modularmachinery.MachineModifier;
import mods.modularmachinery.ControllerGUIRenderEvent;
import mods.ctutils.utils.Math;
import mods.jei.JEI;

MachineModifier.setMaxThreads("bright_altar", 4);
MachineModifier.setMaxParallelism("bright_altar", 65536);
MachineModifier.setInternalParallelism("bright_altar", 12);

// 水晶编号以控制器正面为0号，俯视时沿顺时针方向排列。
global brightAltarCrystalOffsets as int[][] = [
    [0, -11], [5, -9], [9, -5], [11, 0], [9, 5], [5, 9],
    [0, 11], [-5, 9], [-9, 5], [-11, 0], [-9, -5], [-5, -9]
] as int[][];

global brightAltarYieldCoefficients as double[string] = {
    "astralsorcery.constellation.discidia" : 0.12d,
    "astralsorcery.constellation.armara" : 0.06d,
    "astralsorcery.constellation.vicio" : 0.03d,
    "astralsorcery.constellation.aevitas" : 0.20d,
    "astralsorcery.constellation.evorsio" : 0.08d,
    "astralsorcery.constellation.lucerna" : 0.10d,
    "astralsorcery.constellation.mineralis" : 0.16d,
    "astralsorcery.constellation.horologium" : 0.02d,
    "astralsorcery.constellation.octans" : 0.04d,
    "astralsorcery.constellation.bootes" : 0.12d,
    "astralsorcery.constellation.fornax" : 0.25d,
    "astralsorcery.constellation.pelotrio" : 0.30d
};

// 每颗水晶的基础速度修正。正数会缩短加工时间，负数表示以产率换取速度损失。
global brightAltarSpeedCoefficients as double[string] = {
    "astralsorcery.constellation.discidia" : 0.10d,
    "astralsorcery.constellation.armara" : 0.45d,
    "astralsorcery.constellation.vicio" : 0.85d,
    "astralsorcery.constellation.aevitas" : 0.05d,
    "astralsorcery.constellation.evorsio" : 0.25d,
    "astralsorcery.constellation.lucerna" : 0.15d,
    "astralsorcery.constellation.mineralis" : 0.10d,
    "astralsorcery.constellation.horologium" : 1.20d,
    "astralsorcery.constellation.octans" : 0.50d,
    "astralsorcery.constellation.bootes" : 0.30d,
    "astralsorcery.constellation.fornax" : -0.10d,
    "astralsorcery.constellation.pelotrio" : -0.20d
};

// 星座 ID 到中文名称的映射。
global brightAltarConstellationNames as string[string] = {
    "astralsorcery.constellation.discidia" : "非攻座",
    "astralsorcery.constellation.armara" : "遁甲座",
    "astralsorcery.constellation.vicio" : "虚御座",
    "astralsorcery.constellation.aevitas" : "生息座",
    "astralsorcery.constellation.evorsio" : "解离座",
    "astralsorcery.constellation.lucerna" : "圣芒座",
    "astralsorcery.constellation.mineralis" : "晶金座",
    "astralsorcery.constellation.horologium" : "时钟座",
    "astralsorcery.constellation.octans" : "南极座",
    "astralsorcery.constellation.bootes" : "牧夫座",
    "astralsorcery.constellation.fornax" : "天炉座",
    "astralsorcery.constellation.pelotrio" : "唤生座"
};

function getBrightAltarBonuses(crystalData as IData[]) as double[] {
    var counts as int[string] = {} as int[string];
    var yieldSums as double[string] = {} as double[string];
    var speedSums as double[string] = {} as double[string];
    var minSizes as int[string] = {} as int[string];
    var maxSizes as int[string] = {} as int[string];
    var minPurities as int[string] = {} as int[string];
    var maxPurities as int[string] = {} as int[string];
    var minPolishes as int[string] = {} as int[string];
    var maxPolishes as int[string] = {} as int[string];
    for constellation in brightAltarYieldCoefficients {
        counts[constellation] = 0;
        yieldSums[constellation] = 0.0d;
        speedSums[constellation] = 0.0d;
        minSizes[constellation] = 2147483647;
        maxSizes[constellation] = 0;
        minPurities[constellation] = 2147483647;
        maxPurities[constellation] = 0;
        minPolishes[constellation] = 2147483647;
        maxPolishes[constellation] = 0;
    }
    for crystal in crystalData {
        if (!isNull(crystal) && (crystal has "constellation")) {
            val constellation as string = crystal.memberGet("constellation") as string;
            if (constellation != "") {
                if (!(counts.keys has constellation)) {
                    counts[constellation] = 0;
                    yieldSums[constellation] = 0.0d;
                    speedSums[constellation] = 0.0d;
                    minSizes[constellation] = 2147483647;
                    maxSizes[constellation] = 0;
                    minPurities[constellation] = 2147483647;
                    maxPurities[constellation] = 0;
                    minPolishes[constellation] = 2147483647;
                    maxPolishes[constellation] = 0;
                }
                val size as int = (crystal has "size") ? crystal.memberGet("size").asInt() : 0;
                val purity as int = (crystal has "purity") ? crystal.memberGet("purity").asInt() : 0;
                val polish as int = (crystal has "polish") ? crystal.memberGet("polish").asInt() : 0;
                counts[constellation] = counts[constellation] + 1;
                if (brightAltarYieldCoefficients.keys has constellation) {
                    yieldSums[constellation] = yieldSums[constellation] + brightAltarYieldCoefficients[constellation];
                    speedSums[constellation] = speedSums[constellation] + brightAltarSpeedCoefficients[constellation];
                }
                minSizes[constellation] = (size < minSizes[constellation]) ? size : minSizes[constellation];
                maxSizes[constellation] = (size > maxSizes[constellation]) ? size : maxSizes[constellation];
                minPurities[constellation] = (purity < minPurities[constellation]) ? purity : minPurities[constellation];
                maxPurities[constellation] = (purity > maxPurities[constellation]) ? purity : maxPurities[constellation];
                minPolishes[constellation] = (polish < minPolishes[constellation]) ? polish : minPolishes[constellation];
                maxPolishes[constellation] = (polish > maxPolishes[constellation]) ? polish : maxPolishes[constellation];
            }
        }
    }
    var totalYield as double = 0.0d;
    var totalSpeed as double = 0.0d;
    for constellation in counts {
        if (counts[constellation] > 0 && (brightAltarYieldCoefficients.keys has constellation)) {
            var correction as double = 1.0d;
            var sizeRatio as double = 0.0d;
            var purityRatio as double = 0.0d;
            var polishRatio as double = 0.0d;
            if (maxSizes[constellation] != minSizes[constellation] && (maxSizes[constellation] + minSizes[constellation]) != 0) {
                sizeRatio = ((maxSizes[constellation] - minSizes[constellation]) as double / (maxSizes[constellation] + minSizes[constellation]) as double);
            }
            if (maxPurities[constellation] != minPurities[constellation] && (maxPurities[constellation] + minPurities[constellation]) != 0) {
                purityRatio = ((maxPurities[constellation] - minPurities[constellation]) as double / (maxPurities[constellation] + minPurities[constellation]) as double);
            }
            if (maxPolishes[constellation] != minPolishes[constellation] && (maxPolishes[constellation] + minPolishes[constellation]) != 0) {
                polishRatio = ((maxPolishes[constellation] - minPolishes[constellation]) as double / (maxPolishes[constellation] + minPolishes[constellation]) as double);
            }
            correction *= (1.0d - sizeRatio) * (1.0d - purityRatio) * (1.0d - polishRatio);
            totalYield += yieldSums[constellation] * correction;
            totalSpeed += speedSums[constellation] * correction;
        }
    }
    return [totalYield, totalSpeed] as double[];
}

// 为工厂配方加入当前水晶组合带来的产率和速度修正。
function addBrightAltarRecipeModifiers(event as FactoryRecipeStartEvent) {
    var yieldBonus as double = isNull(event.controller.customData.yieldBonus) ? 0.0d : event.controller.customData.yieldBonus as double;
    var speedBonus as double = isNull(event.controller.customData.speedBonus) ? 0.0d : event.controller.customData.speedBonus as double;
    val outputMultiplier as float = (1.0d + yieldBonus) as float;
    val durationMultiplier as float = (1.0d / (1.0d + speedBonus)) as float;
    event.factoryRecipeThread.addModifier("bright_altar_item_output", RecipeModifierBuilder.create("modularmachinery:item", "output", outputMultiplier, 1, false).build());
    event.factoryRecipeThread.addModifier("bright_altar_fluid_output", RecipeModifierBuilder.create("modularmachinery:fluid", "output", outputMultiplier, 1, false).build());
    event.factoryRecipeThread.addModifier("bright_altar_gas_output", RecipeModifierBuilder.create("modularmachinery:gas", "output", outputMultiplier, 1, false).build());
    event.factoryRecipeThread.addModifier("bright_altar_duration", RecipeModifierBuilder.create("modularmachinery:duration", "input", durationMultiplier, 1, false).build());
}

// 统计祭坛中二级水晶的数量，每颗二级水晶提供 2 个并行槽位。
function getBrightAltarEternalCrystalCount(crystalData as IData[]) as int {
    var count as int = 0;
    for crystal in crystalData {
        if (!isNull(crystal) && (crystal has "eternal") && crystal.memberGet("eternal").asBool()) {
            count += 1;
        }
    }
    return count;
}

// 将修正值四舍五入到两位小数，避免 GUI 显示冗长的浮点尾数。
function formatBrightAltarBonus(value as double) as string {
    return ((Math.round(value * 100.0d) as double) / 100.0d) as string;
}

// 在原版星能输入的基础上，要求指定星座的水晶尺寸总和达到阈值。
$expand RecipePrimer$addMixStarlightInput(num as int, id as string, minScale as int) as RecipePrimer {
    this.addStarlightInput(num, id);
    this.addPreCheckHandler(function(event as RecipeCheckEvent) {
        if (isNull(event.controller.customData.crystalData)) {
            event.setFailed("未检测到共鸣水晶");
            return;
        }
        val crystalData as IData[] = event.controller.customData.crystalData.asList() as IData[];
        var requiredCount as int = 0;
        var requiredScale as int = 0;
        for crystal in crystalData {
            if (!isNull(crystal) && (crystal has "constellation")) {
                val constellation as string = crystal.memberGet("constellation") as string;
                if (constellation != "") {
                    if (constellation == id) {
                        requiredCount += 1;
                        requiredScale += (crystal has "size") ? crystal.memberGet("size").asInt() : 0;
                    }
                }
            }
        }
        if (requiredCount == 0) {
            val constellationName as string = brightAltarConstellationNames.keys has id ? brightAltarConstellationNames[id] : id;
            event.setFailed("未检测到目标星座水晶：" ~ constellationName);
        } else if (requiredScale <= minScale) {
            event.setFailed("星座水晶尺寸总和不足，需要超过 " ~ minScale as string);
        }
    });
    this.addRecipeTooltip("§b12颗水晶对祭坛配方的影响如下：");
    this.addRecipeTooltip("§e同星座水晶增幅值线性叠加，");
    this.addRecipeTooltip("§e而后乘以如下的修正系数，");
    this.addRecipeTooltip("§e之后异种增幅值再线性叠加。");
    this.addRecipeTooltip("§d(1－尺寸极差/(尺寸最大值+尺寸最小值))");
    this.addRecipeTooltip("§d×(1－纯度极差/(纯度最大值+纯度最小值))");
    this.addRecipeTooltip("§d×(1－抛光极差/(抛光最大值+抛光最小值))");
    this.addRecipeTooltip("§e同项数值完全相同时，该项按0计算。");
    this.addRecipeTooltip("§e产出＝基础产出×§d(1＋总产率增幅值)§e；");
    this.addRecipeTooltip("§e时间＝基础时间÷§d(1＋总速度增幅值)§e。");
    this.addRecipeTooltip("§e二级水晶（永恒水晶）：每颗额外增加§d2§e个并行位。");
    this.addRecipeTooltip("§e星座基础加成（产率/速度）：");
    this.addRecipeTooltip("§e非攻座 §a+12%/+10%§e；遁甲座 §a+6%/+45%§e；");
    this.addRecipeTooltip("§e虚御座 §a+3%/+85%§e；§e生息座 §a+20%/+5%§e；");
    this.addRecipeTooltip("§e解离座 §a+8%/+25%§e；圣芒座 §a+10%/+15%§e；");
    this.addRecipeTooltip("§e晶金座 §a+16%/+10%§e；时钟座 §a+2%/+120%§e；");
    this.addRecipeTooltip("§e南极座 §a+4%/+50%§e；牧夫座 §a+12%/+30%§e；");
    this.addRecipeTooltip("§e天炉座 §a+25%/§c-10%§e；唤生座 §a+30%/§c-20%");
    this.addRecipeTooltip("§e配方运行需要目标星座水晶总尺寸大于" ~ minScale as string ~ "。");
    return this;
}

function readBrightAltarCrystal(world as IWorld, pos as IBlockPos) as IData {
    val block = world.getBlock(pos);
    // 二级水晶通过方块 ID 识别，普通天体共鸣水晶不计入并行加成。
    val eternal as bool = !isNull(block) && !isNull(block.definition) && block.definition.id == "gctcore:eternal_collector_crystal";
    var nbt as IData = block.data;
    if (isNull(nbt)) {
        return {size: 0, purity: 0, polish: 0, constellation: "", eternal: eternal};
    }
    if (nbt has "tag") {
        nbt = nbt.memberGet("tag") as IData;
    }
    if (!isNull(nbt) && (nbt has "BlockEntityTag")) {
        nbt = nbt.memberGet("BlockEntityTag") as IData;
    }
    var astralData as IData = null;
    var crystalProperties as IData = null;
    if (!isNull(nbt) && (nbt has "astralsorcery")) {
        astralData = nbt.memberGet("astralsorcery") as IData;
        if (!isNull(astralData) && (astralData has "crystalProperties")) {
            crystalProperties = astralData.memberGet("crystalProperties") as IData;
        }
    }
    if (!isNull(nbt) && (nbt has "crystalProperties")) {
        crystalProperties = nbt.memberGet("crystalProperties") as IData;
    }
    var size as int = 0;
    var purity as int = 0;
    var polish as int = 0;
    var constellation as string = "";
    if (!isNull(crystalProperties)) {
        if (crystalProperties has "size") {
            size = crystalProperties.memberGet("size").asInt();
        }
        if (crystalProperties has "purity") {
            purity = crystalProperties.memberGet("purity").asInt();
        }
        if (crystalProperties has "collectiveCapability") {
            polish = crystalProperties.memberGet("collectiveCapability").asInt();
        } else if (crystalProperties has "collect") {
            polish = crystalProperties.memberGet("collect").asInt();
        }
    }
    if (!isNull(nbt)) {
        if (nbt has "size") {
            size = nbt.memberGet("size").asInt();
        }
        if (nbt has "purity") {
            purity = nbt.memberGet("purity").asInt();
        }
        if (nbt has "collect") {
            polish = nbt.memberGet("collect").asInt();
        } else if (nbt has "collectiveCapability") {
            polish = nbt.memberGet("collectiveCapability").asInt();
        }
        if (nbt has "constellationName") {
            constellation = nbt.memberGet("constellationName") as string;
        }
    }
    if (constellation == "" && !isNull(astralData) && (astralData has "constellationName")) {
        constellation = astralData.memberGet("constellationName") as string;
    }

    return {
        size: size,
        purity: purity,
        polish: polish,
        constellation: constellation,
        eternal: eternal
    };
}

MMEvents.onControllerGUIRender("bright_altar", function(event as ControllerGUIRenderEvent) {
    var info as string[] = [
        "§a///璀璨祭坛控制面板///",
        "§a机器名称：§eLV4 - 璀璨祭坛"
    ];
    var yieldBonusText as string = isNull(event.controller.customData.yieldBonus) ? "0.00" : formatBrightAltarBonus(event.controller.customData.yieldBonus as double);
    var speedBonusText as string = isNull(event.controller.customData.speedBonus) ? "0.00" : formatBrightAltarBonus(event.controller.customData.speedBonus as double);
    var parallelBonusValue as int = isNull(event.controller.customData.parallelBonus) ? 0 : event.controller.customData.parallelBonus.asInt();
    var parallelBonusText as string = parallelBonusValue as string;
    info += "§a产率乘数：§e" ~ yieldBonusText;
    info += "§a速度乘数：§e" ~ speedBonusText;
    info += "§a内置并行：§e" ~ (12 + parallelBonusValue) as string ~ "（+" ~ parallelBonusText ~ "）";
    info += "§a水晶属性：";
    var crystalList as IData[] = [] as IData[];
    if (!isNull(event.controller.customData.crystalData)) {
        crystalList = event.controller.customData.crystalData.asList() as IData[];
    }
    val crystalIndexSymbols as string[] = [
        "①", "②", "③", "④", "⑤", "⑥", "⑦", "⑧", "⑨", "⑩", "⑪", "⑫"
    ];
    var index as int = 0;
    while (index < 12) {
        var sizeText as string = "未知";
        var purityText as string = "未知";
        var polishText as string = "未知";
        var constellationText as string = "未绑定";
        if (index < crystalList.length && !isNull(crystalList[index])) {
            val crystal as IData = crystalList[index];
            if (crystal has "size") {
                sizeText = crystal.memberGet("size").asInt() as string;
            }
            if (crystal has "purity") {
                purityText = crystal.memberGet("purity").asInt() as string;
            }
            if (crystal has "polish") {
                polishText = crystal.memberGet("polish").asInt() as string;
            }
            if (crystal has "constellation") {
                val constellationId as string = crystal.memberGet("constellation") as string;
                if (constellationId != "") {
                    if (brightAltarConstellationNames.keys has constellationId) {
                        constellationText = brightAltarConstellationNames[constellationId];
                    } else {
                        constellationText = constellationId;
                    }
                }
            }
        }
        info += "§7" ~ crystalIndexSymbols[index] ~ "§b" ~ constellationText ~ " §e" ~ sizeText ~ "尺寸 §e" ~ purityText ~ "%纯度 §e" ~ polishText ~ "%抛光";
        index += 1;
    }
    event.extraInfo = info;
});

MMEvents.onMachinePreTick("bright_altar", function(event as MachineTickEvent) {
    var x as int = event.controller.pos.x;
    var y as int = event.controller.pos.y;
    var z as int = event.controller.pos.z;
    val d as IData = event.controller.customData;
    if (!event.controller.world.isRemote() && event.controller.world.getWorldTime() % 100 == 0) {
        if (event.controller.world.getPlayers().length != 0) {
            event.controller.customData = d.update({playParticle: 1 as byte});
        } else {
            event.controller.customData = d.update({playParticle: 0 as byte});
        }
    }
    if (!event.controller.world.isRemote() && !isNull(d.playParticle) && d.playParticle == 1 as byte) {
        if (event.controller.world.time % 100 == 0) {
            server.commandManager.executeCommandSilent(server, "particleex tickpolarparameter endRod " ~ x as string ~ " " ~ y as string ~ " " ~ z as string ~ " 0 0.8 1 1 240 0 0 0 -10 10 s1,s2,dis=t*100,t*PI/200,t%2+10 0.1 10 20 vy=0.05");
        }
    }
    if (!event.controller.world.isRemote() && event.controller.world.getWorldTime() % 20 == 0) {
        val front = event.controller.facing;
        val right = front.rotateY();
        var crystalData as IData[] = [] as IData[];
        for offset in brightAltarCrystalOffsets {
            val side as int = offset[0];
            val forward as int = -offset[1];
            val crystalPos as IBlockPos = event.controller.pos.getOffset(front, forward).getOffset(right, side).down(4);
            crystalData = crystalData.add(readBrightAltarCrystal(event.controller.world, crystalPos));
        }
        val bonuses as double[] = getBrightAltarBonuses(crystalData);
        val eternalCrystalCount as int = getBrightAltarEternalCrystalCount(crystalData);
        // 直接调整当前机器实例的内置并行数，而不是修改配方最大并行上限。
        val nativeController as TileMultiblockMachineController = event.controller as TileMultiblockMachineController;
        val machine as DynamicMachine = nativeController.getFoundMachine();
        if (!isNull(machine)) {
            machine.setInternalParallelism(12 + eternalCrystalCount * 2);
        }
        event.controller.customData = event.controller.customData.update({
            crystalData: crystalData,
            yieldBonus: bonuses[0],
            speedBonus: bonuses[1],
            parallelBonus: eternalCrystalCount * 2
        });
    }
});

RecipeBuilder.newBuilder("zodiacite", "bright_altar", 600)
    .addItemInput(<ore:ingotBalancedMatrix> * 1)
    .addItemInput(<ore:dustAstralMetal> * 12)
    .addItemInput(<ore:ingotLunarine> * 8)
    .addItemInput(<ore:ingotNasalum> * 8)
    .addItemInput(<ore:ingotIgnite> * 24)
    .addItemInput(<astralsorcery:itemusabledust:1> * 8)
    .addItemInput(<gct_additions:polarisite> * 16)
    .addFluidInput(<liquid:astralsorcery.liquidstarlight> * 16000)
    .addMixStarlightInput(20000, "astralsorcery.constellation.mineralis", 3000)
    .addFactoryStartHandler(function(event as FactoryRecipeStartEvent) {
        addBrightAltarRecipeModifiers(event);
    })
    .addItemOutput(<additions:zodiacite_ingot> * 2)
    .setMaxThreads(1)
    .build();

RecipeBuilder.newBuilder("dubhe_essence_shard", "bright_altar", 600)
    .addItemInput(<erebus:materials:2> * 32)
    .addItemInput(<ore:ingotBreedum> * 24)
    .addItemInput(<ore:gemJade> * 32)
    .addItemInput(<ore:ingotBotanical> * 16)
    .addItemInput(<ore:ingotAntEmperor> * 3)
    .addItemInput(<additions:erebus_complex> * 4)
    .addMixStarlightInput(25000, "astralsorcery.constellation.aevitas", 2000)
    .addFactoryStartHandler(function(event as FactoryRecipeStartEvent) {
        addBrightAltarRecipeModifiers(event);
    })
    .addItemOutput(<additions:dubhe_essence_shard>)
    .setMaxThreads(1)
    .build();

RecipeBuilder.newBuilder("spirit_fuel", "bright_altar", 600)
    .addItemInput(<extrabotany:nightmarefuel> * 16)
    .addMixStarlightInput(18000, "astralsorcery.constellation.vicio", 800)
    .addFactoryStartHandler(function(event as FactoryRecipeStartEvent) {
        addBrightAltarRecipeModifiers(event);
    })
    .addItemOutput(<extrabotany:spiritfuel> * 16)
    .setMaxThreads(1)
    .build();
