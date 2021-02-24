import '../../main.dart';

class BannerDetailController extends GetxController {
  BannerContent bannerDetail;

  final loading = true.obs;

  final connect = Get.find<Connect>();

  @override
  void onInit() async {
    super.onInit();
  }

  /// 获取轮播图文章详情
  Future<void> fetchBannerDetail(String linkId) async{
    loading.value = true;
    bannerDetail = await connect.fetchBannerContent(linkId);
    loading.value = false;

    update(['bannerDetail']);
  }
}
