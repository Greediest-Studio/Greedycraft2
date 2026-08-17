import crafttweaker.item.IItemStack;

val tooltip as string[][IItemStack] = {
    <modularmachinery:elysia_reactor_factory_controller> : [
        "§f——————————————————————————————",
        "§e埃拉西亚™计划所构造的世界中不能没有现实的化学反应，",
        "§e而大型反应单元便是为此而生的。",
        "§e它可以在一台巨大的机器中同时进行多种化学反应，",
        "§a妥善的使用它可以让你在短时间内获得大量的化工产物。",
        "§f——————————————————————————————",
        "§e机械分类：§b单元",
        "§e附属模块：",
        "  §6升级模块（advanced）：",
        "  §a允许安装额外2个高级仓（具体请查询任务书）",
        "  §a允许安装额外4个并行控制器"
    ],
    <modularmachinery:elysia_etcher_factory_controller> : [
        "§f——————————————————————————————",
        "§e每一台高级机器都少不了大量控制电路的支持，",
        "§e如今，压印器的速度远远无法跟上装配室的制造速度。",
        "§e因此这台麻花一样的蚀刻工厂就由此诞生了，",
        "§a它可以执行一切电路板、处理器的制作任务。",
        "§f——————————————————————————————",
        "§e机械分类：§b单元",
        "§e附属模块：",
        "  §6符文模块（rune）：",
        "  §a允许机器雕刻植物魔法符文",
        "  §6升级模块（advanced）：",
        "  §a允许安装额外2个高级仓（具体请查询任务书）",
        "  §a允许安装额外4个并行控制器"
    ],
    <modularmachinery:organic_infuser_factory_controller> : [
        "§f——————————————————————————————",
        "§e这或许是你最希望拥有的机器之一，",
        "§e它可以代替低效的传统资源农场，",
        "§e只要有一枚不起眼的种子，它的潜力就是无限的！",
        "§f——————————————————————————————",
        "§e机械分类：§b等级2",
        "§e附属模块：",
        "  §6升级模块（advanced）：",
        "  §a允许安装额外1个高级仓（具体请查询任务书）",
        "  §a允许安装额外2个并行控制器",
        "  §6树场模块（tree）：",
        "  §a允许机器处理盆栽配方",
        "  §6渔场模块（fish）：",
        "  §a允许机器处理水产繁殖配方"
    ]
};

for item in tooltip.keys {
    var tooltips as string[] = tooltip[item];
    for tooltip in tooltips {
        item.addTooltip(tooltip);
    }
}