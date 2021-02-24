import '../../main.dart';
import '../news_detail/controller.dart';
import 'news_tag.dart';

class NewsItemMultiple extends StatelessWidget {
  final News _news;

  const NewsItemMultiple(this._news);

  @override
  Widget build(BuildContext context) {
    final _tags = <Widget>[];

    if (_news.top) _tags.add(const NewsTag('置顶'));
    if (_news.live) _tags.add(const NewsTag('直播'));
    if (_news.specialSubject) _tags.add(const NewsTag('专题'));
    if (_news.original) _tags.add(const NewsTag('原创'));

    return InkWell(
      onTap: () {
        final _detailController = Get.find<NewsDetailController>();
        _detailController.newsInfo = _news;
        _detailController.fetchNewsDetail();
        Get.to(() => NewsDetailPage());
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 7),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              _news.title,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 15,
                color: Color(0xff242424),
              ),
            ),
            const SizedBox(height: 10),
            _news.imageList.length > 1
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children:
                        _news.imageList.map((it) => NetImageCache(it)).toList(),
                  )
                : NetImageCache(
                    _news.imageList[0],
                    width: double.infinity,
                    height: 200,
                  ),
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      Text(
                        _news.postdate,
                        style: const TextStyle(
                          color: Color(0xffA2A4AB),
                          fontSize: 12,
                        ),
                      ),
                      _tags.isNotEmpty
                          ? Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Row(children: _tags),
                            )
                          : const SizedBox()
                    ],
                  ),
                ),
                Row(
                  children: [
                    Image.asset('assets/comment.png', width: 25, height: 25),
                    Text(
                      '${_news.commentCount}',
                      style: const TextStyle(
                        fontSize: 12,
                        color: Color(0xff242424),
                      ),
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
