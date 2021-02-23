import '../../main.dart';

class LapinController extends GetxController {
  final connect = Get.find<Connect>();
  final banners = <LapinBanner>[].obs;
  final homeRanks = <LapinProduct>[].obs; // 首页辣榜
  final homeList = <LapinProduct>[].obs; // 首页商品列表
  final productList = <List<LapinProduct>>[].obs; // 普通商品列表
  final loading = true.obs;
  final noMore = false.obs;
  TabController tabController;

  int productPage = 1;

  @override
  void onInit() async {
    super.onInit();

    productList.assignAll(lapinTabs.map((it) => <LapinProduct>[]).toList());
    banners.assignAll(await connect.fetchLapinBanners());
    homeRanks.assignAll(await connect.fetchLapinRanks());
    homeList.assignAll(await fetchHomeList());

    loading.value = false;
  }

  /// 获取全部商品
  Future<List<LapinProduct>> fetchHomeList([int productId = 0]) async {
    final _homeList = await connect.fetchLapinAllList(productId);
    for (var it in _homeList) {
      it.discountRate =
          (Decimal.parse('${1 - it.discountRate}') * Decimal.fromInt(10))
              .toDouble();
    }
    return _homeList;
  }

  /// 获取普通商品列表
  Future<void> fetchProductList(String tag, [int refresh = 0]) async {
    await Future.delayed(const Duration(milliseconds: 0));

    final _tagIndex = lapinTabs.indexWhere((it) => it['code'] == tag);

    if (refresh == 1) {
      productPage = 1;
      noMore.value = false;
      update(['lapin']);
    } else {
      productPage += 1;
    }

    if (noMore()) return;
    final _products = await connect.fetchLapinProductList(tag, productPage);

    if (_products.isEmpty) noMore.value = true;

    if (refresh == 1) {
      productList[_tagIndex].assignAll(_products);
    } else {
      productList[_tagIndex].addAll(_products);
    }

    update(['lapin']);
  }
}
