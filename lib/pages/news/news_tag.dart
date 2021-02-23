import '../../main.dart';

class NewsTag extends StatelessWidget {
  final String text;

  const NewsTag(this.text);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      margin: const EdgeInsets.only(right: 7),
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xffC1352E)),
        borderRadius: BorderRadius.circular(3),
      ),
      child: Text(
        text,
        style: const TextStyle(
          color: Color(0xffC1352E),
          fontSize: 10,
        ),
      ),
    );
  }
}
