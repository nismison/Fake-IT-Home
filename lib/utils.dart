import 'dart:io';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'main.dart';

final _connect = Get.find<Connect>();

void toast(String message) {
  if (Platform.isAndroid || Platform.isIOS) {
    Fluttertoast.showToast(
      msg: message,
      gravity: ToastGravity.CENTER,
      backgroundColor: const Color(0xFF666666),
    );
  }
}

Future<void> hideKeyboard() {
  // 隐藏键盘
  return SystemChannels.textInput.invokeMethod('TextInput.hide');
}

final List<Map> homeTabs = [
  {
    'title': '最新',
    'code': 'news',
  },
  {
    'title': '热榜',
    'code': 'rank',
  },
  // {
  //   'title': '热评',
  //   'code': 'hotComment',
  // },
  {
    'title': '精读',
    'code': 'jingdu',
  },
  {
    'title': '苹果',
    'code': 'ios',
  },
  {
    'title': '原创',
    'code': 'original',
  },
  {
    'title': '评测',
    'code': 'labs',
  },
  {
    'title': 'IT号',
    'code': 'itaccount',
  },
  {
    'title': '5G',
    'code': '5g',
  },
  {
    'title': '阳台',
    'code': 'balcony',
  },
  {
    'title': '手机',
    'code': 'phone',
  },
  {
    'title': '数码',
    'code': 'digi',
  },
  {
    'title': '学院',
    'code': 'geek',
  },
  {
    'title': 'VR',
    'code': 'vr',
  },
  {
    'title': '智能汽车',
    'code': 'auto',
  },
  {
    'title': '电脑',
    'code': 'pc',
  },
  {
    'title': '京东精选',
    'code': 'jd',
  },
];