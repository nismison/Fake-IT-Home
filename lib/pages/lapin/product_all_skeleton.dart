import '../../main.dart';
import 'skeleton_item.dart';

/*
* 辣品首页骨架屏
* */
class ProductsSkeleton extends StatelessWidget {
  const ProductsSkeleton();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Shimmer.fromColors(
        baseColor: const Color(0xffF1F1F1),
        highlightColor: const Color(0xffdfdfdf),
        child: SingleChildScrollView(
          child: Column(
            children: const [
              SkeletonBlock(width: double.infinity, height: 150),
              SizedBox(height: 10),
              SkeletonItem(),
              SkeletonItem(),
              SkeletonItem(),
              SkeletonItem(),
              SkeletonItem(),
            ],
          ),
        ),
      ),
    );
  }
}
