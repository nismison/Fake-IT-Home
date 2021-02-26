import '../../main.dart';

class NewsListController extends GetxController {
  final hotComments = <HotComment>[].obs;
  final newsList = <List<News>>[].obs;
  final banners = <NewsBanner>[];

  final connect = Get.find<Connect>();
  final ScrollController scrollController = ScrollController();

  String code = 'news';
  TabController tabController;

  @override
  void onInit() async {
    super.onInit();

    newsList.assignAll(homeTabs.map((e) => <News>[]).toList());
    hotComments.assignAll(await connect.fetchHotCommentList());
    banners.assignAll(await connect.fetchNewsBanner());
    await fetchNewsData();
  }

  /// 获取数据
  Future<void> fetchNewsData() async {
    final _codeIndex = homeTabs.indexWhere((it) => it['code'] == code);

    List<News> _news;

    if (code == 'rank') {
      _news = await connect.fetchRankList();
    } else {
      _news = await connect.fetchNews(code);
    }

    newsList[_codeIndex].assignAll(_news);

    update(['news-list']);
  }

  /// 滚动列表至指定 index 项
  void scrollTo(int index) {
    scrollController.animateTo(
      (index * 12 * 105).toDouble(),
      duration: const Duration(milliseconds: 300),
      curve: Curves.ease,
    );
  }
}
