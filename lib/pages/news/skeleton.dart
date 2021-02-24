import '../../main.dart';

/*
* 文章详情骨架屏
* */
class Skeleton extends StatelessWidget {
  const Skeleton();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Shimmer.fromColors(
        baseColor: const Color(0xffF1F1F1),
        highlightColor: const Color(0xffdfdfdf),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SkeletonLine(proportion: 1),
            const SkeletonLine(proportion: 2),
            const SkeletonLine(proportion: 3),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const SkeletonLine(proportion: 7, height: 10),
                    const SizedBox(width: 20),
                    const SkeletonLine(proportion: 5, height: 10),
                  ],
                ),
                const SizedBox(width: 150),
                const SkeletonLine(proportion: 7, height: 10),
              ],
            ),
            const SizedBox(height: 30),
            const SkeletonLine(proportion: 2),
            const SkeletonLine(proportion: 4),
            const SkeletonLine(proportion: 1.2),
            const SkeletonBlock(margin: 10),
            const SkeletonLine(proportion: 2),
            const SkeletonLine(proportion: 4),
            const SkeletonLine(proportion: 1.2),
          ],
        ),
      ),
    );
  }
}
