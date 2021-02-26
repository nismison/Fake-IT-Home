import '../../main.dart';

/*
* 资讯列表骨架屏
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
            children: [
              const SkeletonItem(),
              const SkeletonItem(),
              const SkeletonItem(),
              const SkeletonItem(),
              const SkeletonItem(),
              const SkeletonItem(),
              const SkeletonItem(),
            ],
          ),
        ),
      ),
    );
  }
}

class SkeletonItem extends StatelessWidget {
  const SkeletonItem();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SkeletonLine(proportion: 1),
                const SkeletonLine(proportion: 2),
                const SizedBox(height: 35),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SkeletonLine(proportion: 5),
                    const SkeletonLine(proportion: 9),
                  ],
                )
              ],
            ),
          ),
          const SizedBox(width: 20),
          const SkeletonBlock(width: 120, height: 90, radius: 5),
        ],
      ),
    );
  }
}

