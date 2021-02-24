import '../../main.dart';
import 'controller.dart';

class EditorInfo extends GetView<BannerDetailController> {
  const EditorInfo();

  @override
  Widget build(BuildContext context) {
    if (controller.bannerDetail.editor == null) {
      return const SizedBox(height: 20);
    }

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Text(
        '责任编辑：${controller.bannerDetail.editor}',
        style: const TextStyle(fontSize: 14, color: Colors.black),
      ),
    );
  }
}
