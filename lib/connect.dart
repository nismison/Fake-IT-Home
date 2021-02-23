import 'main.dart';

class Connect extends GetConnect {
  Future _request(String path, [body, method = 'GET']) async {
    // final controller = Get.find<UserController>();
    final headers = <String, String>{};
    // if (controller.user != null) {
    //   headers['x-app-token'] = controller.user.token;
    //   print('token: ${headers['x-app-token']}');
    // }
    Response response;
    try {
      if (method == 'POST') {
        print('request: $baseUrl$path ${jsonEncode(body)}');
        headers['content-type'] = 'application/json';
        response = await post(path, body, headers: headers);
      } else if (method == 'GET') {
        print('request: $baseUrl$path ${jsonEncode(body)}');
        headers['content-type'] = 'application/json';
        response = await get(path, headers: headers);
      } else {
        print('request: $baseUrl$path $body');
        response = await post(path, body, headers: headers);
      }
    } on Exception catch (e) {
      toast(e.toString());
      rethrow;
    }

    if (response.statusCode != 200) {
      toast(response.body['error']);
      throw RequestException(response.statusCode, response.body['error']);
    }

    final json = jsonDecode(response.bodyString);
    print('response: $baseUrl$path $json');

    return json;

    // if (json['error'] == 0) {
    //   return json['data'];
    // } else if (json['error'] == 401) {
    //   toast(json['error']);
    // } else {
    //   toast(json['error']);
    //   throw RequestException(json['errCode'], json['errMsg']);
    // }
  }

  /// 获取最新列表
  Future<List<News>> fetchNews(String code) async {
    baseUrl = 'https://api.ithome.com';
    final res = await _request('/json/newslist/$code');

    if (code == 'news') {
      for (var item in res['toplist']) {
        item['top'] = true;
      }

      final list = [...res['toplist'], ...res['newslist']];
      return list.map<News>((it) => News.fromJson(it)).toList();
    }

    return res['newslist'].map<News>((it) => News.fromJson(it)).toList();
  }

  /// 获取新闻轮播图
  Future<List<NewsBanner>> fetchNewsBanner() async {
    baseUrl = 'https://api.ithome.com';
    final res = await _request('/json/slide/index');
    return res.map<NewsBanner>((it) => NewsBanner.fromJson(it)).toList();
  }

  /// 获取热评列表
  /// TODO: 不懂为什么获取不到数据，特么的
  Future<List<HotComment>> fetchHotCommentList() async {
    baseUrl = 'https://cmt.ithome.com';
    final res = await _request('/api/comment/hotcommentlist');
    return res['content']['commentlist']
        .map<HotComment>((it) => HotComment.fromJson(it))
        .toList();
  }

  /// 获取热榜列表
  Future<List<News>> fetchRankList() async {
    baseUrl = 'https://api.ithome.com';
    final res = await _request('/json/newslist/rank');
    final list = [
      ...res['channel48rank'],
      ...res['channelweekhotrank'],
      ...res['channelweekcommentrank'],
      ...res['channelmonthrank'],
    ];
    return list.map<News>((it) => News.fromJson(it)).toList();
  }
}

class RequestException implements Exception {
  final int code;
  final String message;

  const RequestException(this.code, this.message);

  @override
  String toString() => message;
}
