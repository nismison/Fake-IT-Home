import '../../main.dart';
import 'banner_content.dart';
import 'banner_title.dart';
import 'controller.dart';
import 'editor_info.dart';
import 'tool_bar.dart';

class BannerDetailPage extends GetView<BannerDetailController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: PreferredSize(
          preferredSize: const Size(0, 0),
          child: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            leading: const SizedBox(),
          ),
        ),
        body: Obx(() {
          if (controller.loading()) return const Loading();

          return ListView(
            children: const [
              BannerTitle(),
              BannerContentInfo(),
              EditorInfo(),
            ],
          );
        }),
        bottomNavigationBar: Obx(() {
          if (controller.loading()) return const SizedBox();

          return const ToolBar();
        }));
  }
}
