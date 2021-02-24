import '../../main.dart';
import 'controller.dart';
import 'news_content.dart';
import 'news_title.dart';
import 'skeleton.dart';
import 'tool_bar.dart';

class NewsDetailPage extends GetView<NewsDetailController> {
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
      body: ListView(
        children: [
          const NewsTitle(),
          Obx(() {
            if (controller.loading()) return const Skeleton();

            return Column(
              children: const [NewsContent()],
            );
          })
        ],
      ),
      bottomNavigationBar: const ToolBar(),
    );
  }
}
