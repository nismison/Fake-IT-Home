import '../../main.dart';
import 'news_tag.dart';

class NewsItem extends StatelessWidget {
  final News _news;

  const NewsItem(this._news);

  @override
  Widget build(BuildContext context) {
    final _tags = <Widget>[];

    if (_news.top) _tags.add(const NewsTag('置顶'));
    if (_news.live) _tags.add(const NewsTag('直播'));
    if (_news.specialSubject) _tags.add(const NewsTag('专题'));
    if (_news.original) _tags.add(const NewsTag('原创'));

    return InkWell(
      onTap: () {},
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 7),
        height: 105,
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      _news.title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 15,
                        color: Color(0xff242424),
                      ),
                    ),
                  ),
                  const SizedBox(height: 5),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          _news.postdate,
                          style: const TextStyle(
                            color: Color(0xffA2A4AB),
                            fontSize: 12,
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          Image.asset(
                            'assets/comment.png',
                            width: 25,
                            height: 25,
                          ),
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
                  ),
                  _tags.isNotEmpty
                      ? Padding(
                          padding: const EdgeInsets.only(top: 5),
                          child: Row(children: _tags),
                        )
                      : const SizedBox()
                ],
              ),
            ),
            const SizedBox(width: 20),
            NetImageCache(_news.image)
          ],
        ),
      ),
    );
  }
}
