/// 首页 新闻
class NewsList {
  final List<News> topList;
  final List<News> newsList;

  NewsList.fromJson(json)
      : topList = json['toplist'].map<News>((it) => News.fromJson(it)).toList(),
        newsList =
            json['newslist'].map<News>((it) => News.fromJson(it)).toList();
}

/// 首页 新闻
class News {
  final int newsId;
  final String title;
  final String description;
  final String image;
  final String postdate;
  final bool live;
  final int hitCount;
  final int commentCount;
  final bool specialSubject; // 专题
  final bool original; // 原创
  final List imageList;
  bool top;

  News.fromJson(json)
      : newsId = json['newsid'],
        title = json['title'],
        description = json['description'],
        image = json['image'],
        postdate = json['postdate'],
        live = json['live'] == 1,
        hitCount = json['hitcount'],
        commentCount = json['commentcount'],
        specialSubject = json['newsid'] == 0,
        original = json['v'] == '001',
        imageList = json['imagelist'] ?? [],
        top = json['top'] ?? false;
}

/// 首页 新闻 轮播图
class NewsBanner {
  final String image;

  NewsBanner.fromJson(json) : image = json['image'];
}

/// 热评
class HotComment {
  final HotCommentNews news;
  final HotCommentComment comment;

  HotComment.fromJson(json)
      : news = HotCommentNews.fromJson(json['News']),
        comment = HotCommentComment.fromJson(json['Comment']);
}

/// 热评 News
class HotCommentNews {
  final int newsId;
  final String newsTitle;

  HotCommentNews.fromJson(json)
      : newsId = json['NewsId'],
        newsTitle = json['NewsTitle'];
}

/// 热评 Comment
class HotCommentComment {
  final String comment;
  final String username;
  final String description;
  final String phone;
  final int likeCount;
  final String postTime;

  HotCommentComment.fromJson(json)
      : comment = json['C'],
        username = json['N'],
        description = json['Y'],
        phone = json['Ta'],
        likeCount = json['S'],
        postTime = json['T'];
}
