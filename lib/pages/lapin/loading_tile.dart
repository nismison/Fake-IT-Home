import '../../main.dart';

class LoadingTile extends StatelessWidget {
  const LoadingTile();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Text(
            '正在加载...',
            style: TextStyle(
                color: Color(0xff242424),
                fontSize: 14,
                fontWeight: FontWeight.w500),
          ),
          SizedBox(width: 10),
          Loading(size: 15)
        ],
      ),
    );
  }
}
