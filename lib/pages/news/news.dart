import 'package:flutter/cupertino.dart';

import '../../main.dart';
import '../news_detail/controller.dart';
import 'controller.dart';
import 'hot_comments.dart';
import 'news_list_container.dart';
import 'news_tab.dart';
import 'skeleton.dart';

class NewsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => NewsDetailController());
    Get.lazyPut(() => NewsListController());

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
        bottom: const PreferredSize(
          preferredSize: Size(double.infinity, 40),
          child: NewsTab(),
        ),
      ),
      body: GetBuilder<NewsListController>(
        id: 'news_tab',
        builder: (_) {
          final controller = Get.find<NewsListController>();

          if (controller.tabController == null) return const Loading();

          return TabBarView(
            controller: controller.tabController,
            children: homeTabs.map((it) {
              if (it['code'] == 'hotComment') return const HotCommentsList();
              return NewsListContainer(it['code']);
            }).toList(),
          );
        },
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
