import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'connect.dart';
import 'home.dart';

export 'dart:convert';

export 'package:cached_network_image/cached_network_image.dart';
export 'package:decimal/decimal.dart';
export 'package:flutter/material.dart';
export 'package:flutter_swiper/flutter_swiper.dart';
export 'package:get/get.dart';
export 'package:shimmer/shimmer.dart';

export 'connect.dart';
export 'pages/pages.dart';
export 'types.dart';
export 'utils.dart';
export 'widget/widget.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      home: const HomePage(),
      initialBinding: AppBinding(),
    );
  }
}

class AppBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => Connect());
  }
}