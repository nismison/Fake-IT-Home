/*
* 骨架屏横线
* */

import '../../main.dart';

class SkeletonLine extends StatelessWidget {
  final double proportion;
  final double height;
  final double radius;
  final double margin;

  const SkeletonLine({
    this.proportion = 1,
    this.height = 15,
    this.radius = 0,
    this.margin = 2.5,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: (Get.width - 30) / proportion,
      height: height,
      margin: EdgeInsets.symmetric(vertical: margin),
      decoration: BoxDecoration(
        color: Colors.white, // 颜色必须要指定，不然不显示
        borderRadius: BorderRadius.circular(radius),
      ),
    );
  }
}
