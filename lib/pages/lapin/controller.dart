import '../../main.dart';

class LapinController extends GetxController {
  final connect = Get.find<Connect>();
  final banners = <LapinBanner>[].obs;
  final homeRanks = <LapinProduct>[].obs; // 首页辣榜
  final homeList = <LapinProduct>[].obs; // 首页商品列表
  final loading = true.obs;

  @override
  void onInit() async {
    super.onInit();

    banners.assignAll(await connect.fetchLapinBanners());
    homeRanks.assignAll(await connect.fetchLapinRanks());
    homeList.assignAll(await fetchHomeList());

    loading.value = false;
  }

  Future<List<LapinProduct>> fetchHomeList([int productId = 0]) async {
    final _homeList = await connect.fetchLapinAllList(productId);
    for (var it in _homeList) {
      it.discountRate =
          (Decimal.parse('${1 - it.discountRate}') * Decimal.fromInt(10))
              .toDouble();
    }
    return _homeList;
  }
}
