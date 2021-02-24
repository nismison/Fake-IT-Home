import 'package:flutter/cupertino.dart';

import '../../main.dart';
import 'hot_comments.dart';
import 'news_list_container.dart';

class NewsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: homeTabs.length,
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
                Image.asset('assets/news_logo.png', height: 25, width: 50),
                const SizedBox(width: 15),
                Expanded(child: HomeSearchBox())
              ],
            ),
          ),
          actions: [
            IconButton(
              icon: Image.asset('assets/home_add.png', width: 20, height: 20),
              splashRadius: 15,
              onPressed: () {},
            )
          ],
          bottom: PreferredSize(
            preferredSize: const Size(double.infinity, 40),
            child: Row(
              children: [
                Expanded(
                  child: DefaultTabBar(
                    tabs: homeTabs.map((e) => Tab(text: e['title'])).toList(),
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
            ),
          ),
        ),
        body: TabBarView(
          children: homeTabs.map((it) {
            if (it['code'] == 'hotComment') return const HotCommentsList();
            return NewsListContainer(it);
          }).toList(),
        ),
      ),
    );
  }
}

class HomeSearchBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        height: 30,
        padding: const EdgeInsets.symmetric(
          vertical: 5,
          horizontal: 10,
        ),
        decoration: BoxDecoration(
          color: const Color(0xFFF7FAFA),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          children: [
            Image.asset('assets/search.png', width: 20, height: 20),
            const SizedBox(width: 5),
            const Text(
              '搜索',
              style: TextStyle(
                fontSize: 14,
                color: Color(0xFF7F7F7F),
              ),
            )
          ],
        ),
      ),
    );
  }
}
