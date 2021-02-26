import '../../main.dart';
import 'skeleton_item.dart';

/*
* 辣品列表骨架屏
* */
class Skeleton extends StatelessWidget {
  const Skeleton();

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
              SkeletonItem(),
              SkeletonItem(),
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
