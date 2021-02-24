import '../../main.dart';
import 'controller.dart';

class BannerTitle extends GetView<BannerDetailController> {
  const BannerTitle();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 30),
      padding: const EdgeInsets.symmetric(horizontal: 7),
      decoration: const BoxDecoration(
        border: Border(
          left: BorderSide(
            width: 7,
            color: Color(0xffC1362D),
          ),
        ),
      ),
      child: Text(
        controller.bannerDetail.title,
        softWrap: true,
        style: const TextStyle(
          color: Colors.black,
          fontSize: 25,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
