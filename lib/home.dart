import 'main.dart';
import 'pages/index.dart';

DateTime time;

class HomePage extends StatelessWidget {
  const HomePage();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Scaffold(body: IndexPage()),
      onWillPop: () async {
        final now = DateTime.now();
        if (time != null && now.difference(time).inSeconds < 4) {
          return true;
        }
        time = now;
        toast('再按一次退出应用');
        return false;
      },
    );
  }
}
