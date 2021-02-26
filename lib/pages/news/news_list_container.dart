import 'package:flutter/cupertino.dart';

import '../../main.dart';
import '../banner_detail/controller.dart';
import 'controller.dart';
import 'news_item.dart';
import 'news_item_multiple.dart';
import 'skeleton.dart';

class NewsListContainer extends StatefulWidget {
  final String _code;

  const NewsListContainer(this._code);

  @override
  _NewsListContainerState createState() => _NewsListContainerState();
}

class _NewsListContainerState extends State<NewsListContainer> {
  final controller = Get.find<NewsListController>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NewsListController>(
      id: 'news-list',
      builder: (_) {
        // final _code = controller.code;
        final _code = widget._code;
        final _codeIndex = homeTabs.indexWhere((it) => it['code'] == _code);
        final newsList = controller.newsList[_codeIndex];

        if (newsList.isEmpty) return const Skeleton();

        return Column(
          children: [
            _code == 'rank' ? RankTabs(controller.scrollTo) : const SizedBox(),
            Expanded(
              child: Scrollbar(
                child: ListView.builder(
                  controller: controller.scrollController,
                  itemCount: newsList.length + (_code == 'news' ? 2 : 1),
                  itemBuilder: (context, index) {
                    if ((_code == 'news' && index == newsList.length + 1) ||
                        (_code != 'news' && index == newsList.length)) {
                      return const NoMore();
                    }

                    if (_code == 'rank') {
                      return NewsItem(newsList[index]);
                    } else if (_code == 'news' && index == 0) {
                      return BannerSwiper(controller.banners);
                    }

                    final _news = newsList[_code == 'news' ? index - 1 : index];
                    return _news.imageList.isEmpty
                        ? NewsItem(_news)
                        : NewsItemMultiple(_news);
                  },
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

/// 热榜 tabs
class RankTabs extends StatefulWidget {
  final Function(int) onPressed;

  const RankTabs(this.onPressed);

  @override
  _RankTabsState createState() => _RankTabsState();
}

class _RankTabsState extends State<RankTabs> {
  int rankTabIndex = 0;

  void tabClicked(int index) {
    setState(() => rankTabIndex = index);
    widget.onPressed(index);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 7),
      child: Row(
        children: [
          RankTab(
            '日榜',
            active: rankTabIndex == 0,
            onPressed: () => tabClicked(0),
          ),
          RankTab(
            '周榜',
            active: rankTabIndex == 1,
            onPressed: () => tabClicked(1),
          ),
          RankTab(
            '热评',
            active: rankTabIndex == 2,
            onPressed: () => tabClicked(2),
          ),
          RankTab(
            '月榜',
            active: rankTabIndex == 3,
            onPressed: () => tabClicked(3),
          ),
        ],
      ),
    );
  }
}

class RankTab extends StatelessWidget {
  final String text;
  final bool active;
  final Function onPressed;

  const RankTab(this.text, {this.active = false, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Ink(
        width: 60,
        height: 30,
        decoration: BoxDecoration(
          color: active ? const Color(0xffC2362F) : const Color(0xffF4F4F4),
          borderRadius: BorderRadius.circular(15),
        ),
        child: InkWell(
          onTap: onPressed,
          borderRadius: BorderRadius.circular(15),
          child: Align(
            alignment: Alignment.center,
            child: Text(
              text,
              style: TextStyle(
                fontSize: 13,
                color: active ? Colors.white : const Color(0xff242424),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/// 轮播图
class BannerSwiper extends StatelessWidget {
  final List<NewsBanner> banners;

  const BannerSwiper(this.banners);

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => BannerDetailController());

    return Container(
      height: 150,
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Swiper(
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              String link;
              if (banners[index].openType == 1) {
                link = banners[index].link;
              } else {
                link = getBannerIdByLink(banners[index].link);
              }

              Get.find<BannerDetailController>().fetchBannerDetail(link);

              Get.to(() => BannerDetailPage());
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: NetImageCache(
                banners[index].image,
                placeholderPath: 'assets/banner_placeholder.png',
              ),
            ),
          );
        },
        itemCount: banners.length,
        autoplay: true,
        autoplayDelay: 5000,
        pagination: SwiperCustomPagination(builder: (_, config) {
          return Align(
            alignment: const Alignment(0, 0.85),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: banners
                  .asMap()
                  .keys
                  .map((index) => Container(
                        width: index == config.activeIndex ? 16 : 8,
                        height: 8,
                        margin: const EdgeInsets.symmetric(horizontal: 5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: index == config.activeIndex
                              ? const Color(0xffC0372D)
                              : Colors.white,
                        ),
                      ))
                  .toList(),
            ),
          );
        }),
      ),
    );
  }
}
