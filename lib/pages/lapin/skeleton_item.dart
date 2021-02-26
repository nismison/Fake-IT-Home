import '../../main.dart';

class SkeletonItem extends StatelessWidget {
  const SkeletonItem();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SkeletonBlock(width: 100, height: 100, radius: 5),
          const SizedBox(width: 20),
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
                    const SkeletonBlock(width: 100, height: 30, radius: 15),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
