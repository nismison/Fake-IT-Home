import 'package:flutter/cupertino.dart';

import '../../main.dart';
import 'controller.dart';
import 'skeleton.dart';

class HotCommentsList extends GetView<NewsListController> {
  const HotCommentsList();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.hotComments().isEmpty) return const Skeleton();

      return Scrollbar(
        child: ListView.builder(
          itemCount: controller.hotComments.length + 1,
          itemBuilder: (context, index) {
            if (index == controller.hotComments.length) return const NoMore();

            return CommentItem(controller.hotComments[index], index: index);
          },
        ),
      );
    });
  }
}

/// 评论
class CommentItem extends StatelessWidget {
  final HotComment _comment;
  final int index;

  const CommentItem(this._comment, {this.index});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(color: Color(0xffF2F1F2), width: 0.5),
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: CircleAvatar(
                radius: 10,
                backgroundColor: index > 2
                    ? const Color(0xffF4F6F5)
                    : const Color(0xffC1362D),
                child: Text(
                  '${index + 1}',
                  style: TextStyle(
                    color: index > 2 ? const Color(0xff242424) : Colors.white,
                    fontSize: 11,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 15),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      NetImageCache(
                        _comment.comment.avatarUrl,
                        width: 30,
                        height: 30,
                        radius: 30,
                        placeholderPath: 'assets/avatar_default.png',
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  _comment.comment.username,
                                  style: const TextStyle(
                                    color: Color(0xff242424),
                                    fontSize: 12,
                                  ),
                                ),
                                const SizedBox(width: 7),
                                Image.asset(
                                  'assets/device_iphone.png',
                                  width: 15,
                                  height: 15,
                                ),
                                const SizedBox(width: 2),
                                Text(
                                  _comment.comment.phone,
                                  style: const TextStyle(
                                      color: Color(0xff4D69AC), fontSize: 11),
                                )
                              ],
                            ),
                            Text(
                              _comment.comment.description,
                              style: const TextStyle(
                                fontSize: 11,
                                color: Color(0xffA1A6AA),
                              ),
                            )
                          ],
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        splashRadius: 15,
                        icon: Image.asset(
                          'assets/more.png',
                          width: 20,
                          height: 20,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 5),
                  Text(
                    _comment.comment.comment,
                    style: const TextStyle(
                      color: Color(0xff242424),
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Image.asset(
                      'assets/arrow_top.png',
                      width: 18,
                      height: 7,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(7),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: const Color(0xffF3F3F6),
                      borderRadius: BorderRadius.circular(3),
                    ),
                    child: Text(
                      '原文：${_comment.news.newsTitle}',
                      style: const TextStyle(
                        color: Color(0xff666666),
                        fontSize: 12,
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          _comment.comment.postTime,
                          style: const TextStyle(
                            fontSize: 12,
                            color: Color(0xff242424),
                          ),
                        ),
                      ),
                      CupertinoButton(
                        padding: EdgeInsets.zero,
                        pressedOpacity: 0.6,
                        child: Row(
                          children: [
                            Image.asset(
                              'assets/comment_support.png',
                              width: 15,
                              height: 15,
                            ),
                            Text(
                              '(${_comment.comment.likeCount})',
                              style: const TextStyle(
                                color: Color(0xff758A44),
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                        onPressed: () {},
                      ),
                      const SizedBox(width: 5),
                      CupertinoButton(
                        onPressed: () {},
                        pressedOpacity: 0.6,
                        padding: EdgeInsets.zero,
                        child: const Text(
                          '分享',
                          style: TextStyle(
                            color: Color(0xff242424),
                            fontSize: 12,
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
