import 'package:flutter/cupertino.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_html/style.dart';

import '../../main.dart';
import 'controller.dart';

class NewsContent extends GetView<NewsDetailController> {
  const NewsContent();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NewsDetailController>(
      id: 'newsDetail',
      builder: (_) {
        final _detail = controller.newsDetail;

        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              _detail.accountInfo != null
                  ? const NewsAccountInfo()
                  : const NewsDescription(),
              Html(
                data: _detail.detail,
                style: {
                  'body': Style(
                    margin: EdgeInsets.zero,
                  ),
                  'p': Style(fontSize: const FontSize(16), lineHeight: 2),
                  'span.accentTextColor': Style(
                    backgroundColor: const Color(0x22FF5252),
                  ),
                  'a': Style(color: const Color(0xffC0352C))
                },
              )
            ],
          ),
        );
      },
    );
  }
}

/// 媒体账号
class NewsAccountInfo extends GetView<NewsDetailController> {
  const NewsAccountInfo();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NewsDetailController>(
      id: 'newsDetail',
      builder: (_) {
        final _accountInfo = controller.newsDetail.accountInfo;

        return Container(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Row(
            children: [
              Stack(
                alignment: Alignment.bottomRight,
                children: [
                  NetImageCache(
                    _accountInfo.avatarUrl,
                    width: 40,
                    height: 40,
                    radius: 20,
                  ),
                  Image.asset(
                    'assets/media_account.png',
                    width: 17,
                    height: 17,
                  )
                ],
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      _accountInfo.accountName,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 3),
                    Text(
                      controller.newsInfo.postdate,
                      style: const TextStyle(
                        color: Color(0xff9CA3AA),
                        fontSize: 11,
                      ),
                    )
                  ],
                ),
              ),
              CupertinoButton(
                onPressed: () {},
                padding: EdgeInsets.zero,
                pressedOpacity: 0.8,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                  decoration: BoxDecoration(
                    color: const Color(0xffC0352C),
                    borderRadius: BorderRadius.circular(1000),
                  ),
                  child: Row(
                    children: [
                      const Icon(Icons.add, color: Colors.white, size: 13),
                      const SizedBox(width: 3),
                      const Text(
                        '关注',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}

/// 普通账号
class NewsDescription extends GetView<NewsDetailController> {
  const NewsDescription();

  @override
  Widget build(BuildContext context) {
    final _detail = controller.newsDetail;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          Text(
            controller.newsInfo.postdate,
            style: const TextStyle(
              color: Color(0xff666666),
              fontSize: 12,
            ),
          ),
          const SizedBox(width: 15),
          Text(
            '${_detail.newsSource}(${_detail.newsAuthor})',
            style: const TextStyle(
              color: Color(0xff666666),
              fontSize: 12,
            ),
          )
        ],
      ),
    );
  }
}
