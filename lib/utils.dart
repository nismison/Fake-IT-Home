import 'dart:io';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'main.dart';

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

extension Double2Fixed on double {
  /// 去除小数点后多余的 0
  String fixed() {
    var i = truncate();
    if (this == i) {
      return i.toString();
    }
    return toString();
  }
}

/// 根据 UserId 获取头像地址
String getAvatarUrlByUserId(int userId) {
  var a = userId.toString();
  var b = a[0];
  var c = a.substring(1, 3);
  var d = a.substring(3, 5);
  var e = a.substring(5);
  var url = 'http://avatar.ithome.com/avatars/00$b/$c/$d/${e}_60.jpg';
  return url;
}

/// 根据 链接 获取BannerId
String getBannerIdByLink(String link) {
  final a = link;
  final b = a.split('.');
  final c = b[b.length - 2].split('/');
  final d = '${c[c.length - 2]}${c[c.length - 1]}';
  return d;
}

/// 资讯首页tab
final List<Map> homeTabs = [
  {'title': '最新', 'code': 'news'},
  {'title': '热榜', 'code': 'rank'},
  {'title': '热评', 'code': 'hotComment'},
  {'title': '精读', 'code': 'jingdu'},
  {'title': '苹果', 'code': 'ios'},
  {'title': '原创', 'code': 'original'},
  {'title': '评测', 'code': 'labs'},
  {'title': 'IT号', 'code': 'itaccount'},
  {'title': '5G', 'code': '5g'},
  {'title': '阳台', 'code': 'balcony'},
  {'title': '手机', 'code': 'phone'},
  {'title': '数码', 'code': 'digi'},
  {'title': '学院', 'code': 'geek'},
  {'title': 'VR', 'code': 'vr'},
  {'title': '智能汽车', 'code': 'auto'},
  {'title': '电脑', 'code': 'pc'},
  {'title': '京东精选', 'code': 'jd'},
];

/// 辣品首页tab
final List<Map> lapinTabs = [
  {'title': '全部', 'code': 'all'},
  {'title': '辣榜', 'code': '爆品'},
  {'title': '1元包邮', 'code': '1元'},
  {'title': '9块9', 'code': '9kuai9'},
  {'title': '福包', 'code': '福利'},
];
