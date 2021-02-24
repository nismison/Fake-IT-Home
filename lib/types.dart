import 'utils.dart';

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
  final String link;
  final int openType;

  NewsBanner.fromJson(json)
      : image = json['image'],
        link = json['link'],
        openType = json['opentype'];
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
  final String avatarUrl;
  final String description;
  final String phone;
  final int likeCount;
  final String postTime;

  HotCommentComment.fromJson(json)
      : comment = json['C'],
        username = json['N'],
        avatarUrl = getAvatarUrlByUserId(json['Ui']),
        description = json['Y'],
        phone = json['Ta'],
        likeCount = json['S'],
        postTime = json['T'];
}

/// 辣品 - banner
class LapinBanner {
  final String picture;

  LapinBanner.fromJson(json)
      : picture = 'https://img.lapin365.com${json['Picture']}';
}

/// 辣品 - 商品信息
class LapinProduct {
  final int productId;
  final String productName;
  final String picture;
  final String originStoreName;
  final double proPrice; // 券后价
  final double quanPrice; // 优惠券面额
  final double realPrice; // 原价
  double discountRate; // 折扣率 0~1
  final int salesVolume; // 月销量
  final String createTime; // 创建时间

  LapinProduct.fromJson(json)
      : productId = json['productid'],
        productName = json['ProductName'],
        picture = json['Picture'],
        originStoreName = json['OriginStoreName'],
        proPrice = json['ProPrice'].toDouble(),
        quanPrice = json['QuanPrice'].toDouble(),
        realPrice = json['RealPrice'].toDouble(),
        discountRate = json['DiscountRate'].toDouble(),
        salesVolume = json['SalesVolume'],
        createTime = json['CreateTime'];
}

/// 文章内容
class NewsDetail {
  final String newsSource;
  final String newsAuthor;
  final String keyword;
  final String detail;
  final String editor; // 责任编辑
  final ItAccountInfo accountInfo;

  NewsDetail.fromJson(json)
      : newsSource = json['newssource'],
        newsAuthor = json['newsauthor'],
        keyword = json['keyword'],
        detail = json['detail'],
        editor = json['z'],
        accountInfo = json['itaccount'] != null
            ? ItAccountInfo.fromJson(json['itaccount'])
            : null;
}

/// IT号信息
class ItAccountInfo {
  final int id;
  final int accountId;
  final String accountName;
  final String avatarUrl;

  ItAccountInfo.fromJson(json)
      : id = json['id'],
        accountId = json['accountid'],
        accountName = json['accountname'],
        avatarUrl = json['avatarurl'];
}

/// 轮播图文章信息
class BannerContent {
  final String title;
  final String newsSource;
  final String newsAuthor;
  final String detail;
  final String postdate;
  final int commentCount;
  final String editor; // 责任编辑

  BannerContent.fromJson(json)
      : title = json['title'],
        newsSource = json['newssource'],
        newsAuthor = json['newsauthor'],
        detail = json['detail'],
        postdate = json['postdate'],
        commentCount = json['commentcount'],
        editor = json['z'];
}
