import 'package:flutter/cupertino.dart';

import '../../main.dart';
import 'controller.dart';

class NewsTab extends StatefulWidget {
  const NewsTab();

  @override
  _NewsTabState createState() => _NewsTabState();
}

class _NewsTabState extends State<NewsTab> with SingleTickerProviderStateMixin {
  final _controller = Get.find<NewsListController>();
  TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: homeTabs.length, vsync: this);
    _controller.tabController = _tabController;
    _controller.update(['news_tab']);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: DefaultTabBar(
            tabs: homeTabs.map((e) => Tab(text: e['title'])).toList(),
            tabController: _tabController,
            onSwitch: (index) {
              _controller.code = homeTabs[index]['code'];
              _controller.fetchNewsData();
            },
          ),
        ),
        CupertinoButton(
          onPressed: () {},
          padding: EdgeInsets.zero,
          child: Image.asset(
            'assets/home_menu_manger.png',
            width: 18,
            height: 18,
          ),
        )
      ],
    );
  }
}
