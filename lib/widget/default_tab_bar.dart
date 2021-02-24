import '../main.dart';

class DefaultTabBar extends StatelessWidget {
  final List<Widget> tabs;
  final TabController tabController;

  const DefaultTabBar({
    @required this.tabs,
    this.tabController,
  });

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        ///默认显示的背影颜色
        backgroundColor: Colors.transparent,

        ///点击的高亮颜色
        highlightColor: Colors.transparent,

        ///水波纹颜色
        splashColor: Colors.transparent,
      ),
      child: TabBar(
        controller: tabController,
        isScrollable: true,
        indicator: const CustomTabIndicator(
          borderSide: BorderSide(width: 2.5, color: Colors.red),
        ),
        indicatorColor: const Color(0xffC1352E),
        indicatorSize: TabBarIndicatorSize.label,
        labelColor: Colors.black,
        labelPadding: const EdgeInsets.symmetric(horizontal: 10),
        tabs: tabs,
      ),
    );
  }
}
