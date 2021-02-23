import '../../main.dart';
import 'all.dart';
import 'controller.dart';
import 'product_list.dart';

class LapinPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => LapinController());

    return DefaultTabController(
      length: lapinTabs.length,
      child: Scaffold(
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
                      child: TabBar(
                        isScrollable: true,
                        indicator: const CustomTabIndicator(
                          borderSide: BorderSide(width: 2.5, color: Colors.red),
                        ),
                        indicatorColor: const Color(0xffC1352E),
                        indicatorSize: TabBarIndicatorSize.label,
                        labelColor: Colors.black,
                        labelPadding:
                            const EdgeInsets.symmetric(horizontal: 10),
                        tabs: lapinTabs
                            .map((e) => Tab(text: e['title']))
                            .toList(),
                      ),
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
        body: TabBarView(
          children: lapinTabs.asMap().keys.map((index) {
            if (lapinTabs[index]['code'] == 'all') {
              return const LapinAllList();
            }
            return ProductList(lapinTabs[index]['code'], index);
          }).toList(),
        ),
      ),
    );
  }
}
