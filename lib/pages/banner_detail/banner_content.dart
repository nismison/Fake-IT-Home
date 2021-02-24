import 'package:flutter/cupertino.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_html/style.dart';

import '../../main.dart';
import 'controller.dart';

class BannerContentInfo extends GetView<BannerDetailController> {
  const BannerContentInfo();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BannerDetailController>(
      id: 'bannerDetail',
      builder: (_) {
        final _detail = controller.bannerDetail;

        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              const BannerDescription(),
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

class BannerDescription extends GetView<BannerDetailController> {
  const BannerDescription();

  @override
  Widget build(BuildContext context) {
    final _detail = controller.bannerDetail;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          Text(
            _detail.postdate,
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
