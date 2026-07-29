import crafttweaker.item.IItemStack;

val tooltip as string[][IItemStack] = {
    <modularmachinery:elysia_reactor_factory_controller> : [
        "§f——————————————————————————————",
        "§e埃拉西亚计划所构造的世界中不能没有现实的化学反应，",
        "§e而大型反应单元便是为此而生的。",
        "§e它可以在一台巨大的机器中同时进行多种化学反应。",
        "§a妥善的使用它可以让你在短时间内获得大量的化工产物。",
        "§f——————————————————————————————",
        "§e机械分类：§b单元",
        "§e附属模块：",
        "  §6升级模块（advanced）：",
        "  §a允许安装高级仓（具体请查询任务书）",
        "  §a允许安装额外4个并行控制器",
        "§f——————————————————————————————"
    ]
};

for item in tooltip.keys {
    var tooltips as string[] = tooltip[item];
    for tooltip in tooltips {
        item.addTooltip(tooltip);
    }
}