import '../../main.dart';
import 'news_item.dart';
import 'news_item_multiple.dart';

class NewsListContainer extends StatefulWidget {
  final Map tabInfo;

  const NewsListContainer(this.tabInfo);

  @override
  _NewsListContainerState createState() => _NewsListContainerState();
}

class _NewsListContainerState extends State<NewsListContainer> {
  List<News> newsList = [];
  bool loading = true;
  String _code;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    _code = widget.tabInfo['code'];
    init();
    super.initState();
  }

  /// 初始化数据
  void init() async {
    List<News> news;

    if (_code == 'rank') {
      news = await Get.find<Connect>().fetchRankList();
    } else {
      news = await Get.find<Connect>().fetchNews(_code);
    }

    setState(() {
      newsList = news;
      loading = false;
    });
  }

  /// 滚动列表至指定 index 项
  void scrollTo(int index) {
    _scrollController.animateTo(
      (index * 12 * 105).toDouble(),
      duration: const Duration(milliseconds: 300),
      curve: Curves.ease,
    );
  }

  @override
  Widget build(BuildContext context) {
    if (loading) return const Loading();

    return Column(
      children: [
        _code == 'rank' ? RankTabs(scrollTo) : const SizedBox(),
        Expanded(
          child: ListView.builder(
            controller: _scrollController,
            itemCount: newsList.length,
            itemBuilder: (context, index) {
              if (_code == 'rank') return NewsItem(newsList[index]);

              return newsList[index].imageList.isEmpty
                  ? NewsItem(newsList[index])
                  : NewsItemMultiple(newsList[index]);
            },
          ),
        ),
      ],
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
