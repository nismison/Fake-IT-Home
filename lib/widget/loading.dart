import 'package:flutter/material.dart';

class Loading extends StatelessWidget {
  final double size;
  final Color color;
  final double width;

  const Loading({
    this.size = 20,
    this.color = const Color(0xffEA3238),
    this.width = 2,
  });

  Widget build(_) {
    return Center(
      child: SizedBox(
        width: size,
        height: size,
        child: CircularProgressIndicator(
            strokeWidth: width,
            valueColor: AlwaysStoppedAnimation<Color>(color)),
      ),
    );
  }
}
