import '../../main.dart';
import 'all.dart';
import 'controller.dart';
import 'product_list.dart';

class LapinPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => LapinController());

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        // title widget两边不留间隙
        titleSpacing: 0,
        title: Container(
          padding: const EdgeInsets.only(left: 15),
          child: Row(
            children: [
              Image.asset('assets/lapin_logo.png', height: 25, width: 50),
              const SizedBox(width: 15),
              Expanded(
                child: Align(
                  alignment: Alignment.center,
                  child: Theme(
                    data: ThemeData(
                      ///默认显示的背影颜色
                      backgroundColor: Colors.transparent,

                      ///点击的高亮颜色
                      highlightColor: Colors.transparent,

                      ///水波纹颜色
                      splashColor: Colors.transparent,
                    ),
                    child: const _LapinTabBar(),
                  ),
                ),
              )
            ],
          ),
        ),
        actions: [
          IconButton(
            icon: Image.asset('assets/search.png', width: 20, height: 20),
            splashRadius: 15,
            onPressed: () {},
          )
        ],
      ),
      body: const _LapinTabView(),
    );
  }
}

/// 封装 TabBar
class _LapinTabBar extends StatefulWidget {
  const _LapinTabBar();

  @override
  __LapinTabBarState createState() => __LapinTabBarState();
}

class __LapinTabBarState extends State<_LapinTabBar>
    with SingleTickerProviderStateMixin {
  TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: lapinTabs.length, vsync: this);
    Get.find<LapinController>().tabController = tabController;
    Get.find<LapinController>().update(['lapin_tab']);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabBar(
      tabs: lapinTabs.map((e) => Tab(text: e['title'])).toList(),
      tabController: tabController,
    );
  }
}

/// 封装 TabView
class _LapinTabView extends GetView<LapinController> {
  const _LapinTabView();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LapinController>(
        id: 'lapin_tab',
        builder: (_) {
          if (controller.tabController == null) return const Loading();

          return TabBarView(
            controller: controller.tabController,
            children: lapinTabs.asMap().keys.map((index) {
              if (lapinTabs[index]['code'] == 'all') {
                return const LapinAllList();
              }
              return ProductList(lapinTabs[index]['code'], index);
            }).toList(),
          );
        });
  }
}
