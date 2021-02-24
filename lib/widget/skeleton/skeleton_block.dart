/*
* 骨架屏方块
* */

import '../../main.dart';

class SkeletonBlock extends StatelessWidget {
  final double width;
  final double height;
  final double radius;
  final double margin;

  const SkeletonBlock({
    this.width,
    this.height = 170,
    this.radius = 0,
    this.margin = 2.5,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? Get.width,
      height: height,
      margin: EdgeInsets.symmetric(vertical: margin),
      decoration: BoxDecoration(
        color: Colors.white, // 颜色必须要指定，不然不显示
        borderRadius: BorderRadius.circular(radius),
      ),
    );
  }
}
