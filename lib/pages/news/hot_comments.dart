import '../../main.dart';

class HotCommentsList extends StatefulWidget {
  const HotCommentsList();

  @override
  _HotCommentsListState createState() => _HotCommentsListState();
}

class _HotCommentsListState extends State<HotCommentsList> {
  List<HotComment> _hotComments;
  bool loading = true;

  @override
  void initState() {
    Get.find<Connect>().fetchHotCommentList().then((res) {
      setState(() {
        _hotComments = res;
        loading = false;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (loading) return const Loading();

    return ListView.builder(
      itemCount: _hotComments.length,
      itemBuilder: (context, index) {
        return CommentItem();
      },
    );
  }
}

/// 评论
class CommentItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          const CircleAvatar(
            child: Text('1', style: TextStyle(
              color: Colors.white,
              fontSize: 12,
            ),),
          )
        ],
      ),
    );
  }
}

