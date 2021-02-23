import '../../main.dart';

class NoMore extends StatelessWidget {
  const NoMore();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: Row(
        children: [
          const Expanded(child: Divider(indent: 10)),
          const SizedBox(width: 10),
          const Text(
            '没有更多数据',
            style: TextStyle(
                color: Color(0xff242424),
                fontSize: 14,
                fontWeight: FontWeight.w500),
          ),
          const SizedBox(width: 10),
          const Expanded(child: Divider(endIndent: 10)),
        ],
      ),
    );
  }
}
