import '../main.dart';

class IndexPage extends StatefulWidget {
  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  final List<Widget> _pagesList = [];
  int _curIndex = 0;

  BottomNavigationBarItem _bottomIcon(
      String icon,
      String iconActive,
      String title,
      int index,
      ) {
    return BottomNavigationBarItem(
      icon: _curIndex == index
          ? Image.asset(iconActive, width: 20, height: 20)
          : Image.asset(icon, width: 20, height: 20),
      label: title,
    );
  }

  @override
  void initState() {
    _pagesList
      ..add(NewsPage())
      ..add(LapinPage())
      ..add(ForumPage())
      ..add(FindPage())
      ..add(MinePage());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _pagesList[_curIndex],
        bottomNavigationBar: BottomNavigationBar(
          onTap: (index) {
            setState(() => _curIndex = index);
          },
          backgroundColor: const Color(0xFFF8F8F8),
          elevation: 0,
          selectedFontSize: 11,
          unselectedFontSize: 11,
          unselectedItemColor: const Color(0xFF363636),
          selectedItemColor: const Color(0xFF1925545),
          selectedLabelStyle: const TextStyle(fontWeight: FontWeight.w500),
          currentIndex: _curIndex,
          type: BottomNavigationBarType.fixed,
          items: [
            _bottomIcon(
              'assets/news.png',
              'assets/news_active.png',
              '资讯',
              0,
            ),
            _bottomIcon(
              'assets/lapin.png',
              'assets/lapin_active.png',
              '辣品',
              1,
            ),
            _bottomIcon(
              'assets/forum.png',
              'assets/forum_active.png',
              '圈子',
              2,
            ),
            _bottomIcon(
              'assets/find.png',
              'assets/find_active.png',
              '发现',
              3,
            ),
            _bottomIcon(
              'assets/mine.png',
              'assets/mine_active.png',
              '我的',
              4,
            ),
          ],
        ));
  }
}
