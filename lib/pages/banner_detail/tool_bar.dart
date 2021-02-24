import 'package:flutter/cupertino.dart';

import '../../main.dart';
import 'controller.dart';

class ToolBar extends GetView<BannerDetailController> {
  const ToolBar();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(15, 10, 15, 20),
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(top: BorderSide(color: Color(0xfff5f5f5))),
      ),
      child: Row(
        children: [
          CupertinoButton(
            onPressed: Get.back,
            padding: EdgeInsets.zero,
            pressedOpacity: 0.6,
            child: Image.asset(
              'assets/tool_bar_back.png',
              width: 25,
              height: 25,
              color: const Color(0xff242424),
            ),
          ),
          Expanded(
            child: Container(
              height: 30,
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.symmetric(horizontal: 15),
              decoration: BoxDecoration(
                  color: const Color(0xffECEEEF),
                  borderRadius: BorderRadius.circular(15)),
              child: const Text(
                '说两句...',
                style: TextStyle(color: Color(0xff999999), fontSize: 12),
              ),
            ),
          ),
          const SizedBox(width: 15),
          CupertinoButton(
            onPressed: () {},
            padding: EdgeInsets.zero,
            pressedOpacity: 0.6,
            child: Stack(
              alignment: Alignment.topLeft,
              children: [
                Image.asset(
                  'assets/tool_bar_comment_num.png',
                  width: 25,
                  height: 25,
                  color: const Color(0xff242424),
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(16, 0, 0, 0),
                  color: Colors.white,
                  child: Text(
                    controller.bannerDetail.commentCount > 99
                        ? '99+'
                        : '${controller.bannerDetail.commentCount}',
                    style: const TextStyle(
                      color: Color(0xffC0352C),
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                )
              ],
            ),
          ),
          CupertinoButton(
            onPressed: () {},
            padding: EdgeInsets.zero,
            pressedOpacity: 0.6,
            child: Image.asset(
              'assets/tool_bar_collect.png',
              width: 23,
              height: 23,
              color: const Color(0xff242424),
            ),
          ),
          CupertinoButton(
            onPressed: () {},
            padding: EdgeInsets.zero,
            pressedOpacity: 0.6,
            child: Image.asset(
              'assets/tool_bar_share.png',
              width: 40,
              height: 40,
              color: const Color(0xff242424),
            ),
          ),
          CupertinoButton(
            onPressed: () {},
            padding: EdgeInsets.zero,
            pressedOpacity: 0.6,
            child: Image.asset(
              'assets/more.png',
              width: 25,
              height: 25,
              color: const Color(0xff242424),
            ),
          ),
        ],
      ),
    );
  }
}
