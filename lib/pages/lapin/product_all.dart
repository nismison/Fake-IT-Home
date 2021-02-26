import 'package:fake_it_home/pages/lapin/skeleton.dart';
import 'package:flutter/cupertino.dart';

import '../../main.dart';
import 'controller.dart';
import 'loading_tile.dart';
import 'product_all_skeleton.dart';
import 'product_item.dart';

class LapinAllList extends GetView<LapinController> {
  const LapinAllList();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final _homeList = controller.homeList;

      if (controller.loading()) return const ProductsSkeleton();

      return ListView.builder(
        physics: const ClampingScrollPhysics(), // 关闭滚动时回弹效果
        itemCount: _homeList.length + 4,
        primary: true,
        itemBuilder: (_, index) {
          if (index == 0) return const BannerSwiper();
          if (index == 1) return const Rank();
          if (index == 2) {
            return const Divider(thickness: 20, color: Color(0xffF5F5F5));
          }
          if (index == _homeList.length + 3) {
            /// 加载下一页
            final _productId = _homeList[_homeList.length - 1].productId;
            controller.fetchHomeList(_productId).then((res) {
              controller.homeList.addAll(res);
            });

            return const LoadingTile();
          }

          return ProductItem(_homeList[index - 3]);
        },
      );
    });
  }
}

/// 轮播图
class BannerSwiper extends GetView<LapinController> {
  const BannerSwiper();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Swiper(
        itemBuilder: (_, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: NetImageCache(
              controller.banners[index].picture,
              placeholderPath: 'assets/banner_placeholder.png',
            ),
          );
        },
        itemCount: controller.banners.length,
        autoplay: true,
        autoplayDelay: 5000,
        pagination: SwiperCustomPagination(builder: (_, config) {
          return Align(
            alignment: const Alignment(0, 0.85),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: controller.banners
                  .asMap()
                  .keys
                  .map((index) => Container(
                        width: index == config.activeIndex ? 16 : 8,
                        height: 8,
                        margin: const EdgeInsets.symmetric(horizontal: 5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: index == config.activeIndex
                              ? const Color(0xffC0372D)
                              : Colors.white,
                        ),
                      ))
                  .toList(),
            ),
          );
        }),
      ),
    );
  }
}

/// 辣榜
class Rank extends GetView<LapinController> {
  const Rank();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              children: [
                const Expanded(
                  child: Text(
                    '辣榜',
                    style: TextStyle(
                      color: Color(0xff242424),
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                CupertinoButton(
                  onPressed: () {
                    Get.find<LapinController>().tabController.index = 1;
                  },
                  pressedOpacity: 0.6,
                  padding: EdgeInsets.zero,
                  child: Row(
                    children: [
                      const Text(
                        '更多',
                        style: TextStyle(
                          color: Color(0xff242424),
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const Icon(
                        Icons.keyboard_arrow_right_rounded,
                        size: 20,
                        color: Color(0xff242424),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 230,
            margin: const EdgeInsets.only(top: 5),
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: controller.homeRanks.length,
              itemBuilder: (_, index) {
                return RankItem(controller.homeRanks[index]);
              },
            ),
          )
        ],
      ),
    );
  }
}

/// 辣榜商品
class RankItem extends StatelessWidget {
  final LapinProduct _info;

  const RankItem(this._info);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        margin: const EdgeInsets.only(right: 10),
        width: 100,
        child: Column(
          children: [
            NetImageCache(
              _info.picture,
              width: 100,
              height: 100,
              radius: 0,
            ),
            const SizedBox(height: 5),
            Text(
              _info.productName,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 12,
                color: Color(0xff242424),
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              '券后${_info.proPrice.fixed()}元',
              style: const TextStyle(
                fontSize: 13,
                color: Color(0xffEA3238),
              ),
            ),
            CupertinoButton(
              onPressed: () {},
              pressedOpacity: 0.8,
              padding: EdgeInsets.zero,
              child: Container(
                width: 100,
                height: 30,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  gradient: const LinearGradient(
                    colors: [Color(0xFFEA683D), Color(0xFFEA513A)],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                ),
                child: Text(
                  _info.quanPrice == 0.0
                      ? '立即前往'
                      : '领 ${_info.quanPrice.fixed()} 元券',
                  style: const TextStyle(
                    fontSize: 13,
                    color: Colors.white,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
