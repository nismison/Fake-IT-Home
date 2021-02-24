import '../../main.dart';

class NewsDetailController extends GetxController {
  NewsDetail newsDetail;
  News newsInfo;

  final loading = true.obs;

  final connect = Get.find<Connect>();

  @override
  void onInit() async {
    super.onInit();
  }

  /// 获取文章详情
  Future<void> fetchNewsDetail() async{
    loading.value = true;
    newsDetail = await connect.fetchNewsContent(newsInfo.newsId);
    loading.value = false;

    update(['newsDetail']);
  }
}
