import 'package:flutter/cupertino.dart';

import '../../main.dart';
import 'controller.dart';

class LapinAllList extends GetView<LapinController> {
  const LapinAllList();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final _homeList = controller.homeList;

      if (controller.loading()) return const Loading();

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
            child: NetImageCache(controller.banners[index].picture),
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
                  onPressed: () {},
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

/// 商品
class ProductItem extends StatelessWidget {
  final LapinProduct _info;

  const ProductItem(this._info);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: InkWell(
        onTap: () {},
        child: Container(
          height: 130,
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          decoration: const BoxDecoration(
            border: Border(
              bottom: BorderSide(color: Color(0xfff1f1f1), width: 0.5),
            ),
          ),
          child: Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(
                    color: const Color(0xfff1f1f1),
                    width: 0.5,
                  ),
                ),
                child: NetImageCache(
                  _info.picture,
                  width: 100,
                  height: 100,
                ),
              ),
              const SizedBox(width: 15),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        _info.productName,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 14,
                          color: Color(0xff242424),
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Row(
                            children: [
                              Text(
                                '¥${_info.realPrice}',
                                style: const TextStyle(
                                  fontSize: 12,
                                  color: Color(0xffAAAAAA),
                                  decoration: TextDecoration.lineThrough,
                                  decorationColor: Color(0xffAAAAAA),
                                ),
                              ),
                              const SizedBox(width: 3),

                              /// 不打折就不显示折扣率
                              _info.discountRate != 10.0
                                  ? Text(
                                      '(${_info.discountRate.fixed()}折)',
                                      style: const TextStyle(
                                        fontSize: 12,
                                        color: Color(0xffAAAAAA),
                                      ),
                                    )
                                  : const SizedBox()
                            ],
                          ),
                        ),
                        Text(
                          '${_info.salesVolume}月销',
                          style: const TextStyle(
                            fontSize: 12,
                            color: Color(0xffAAAAAA),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '券后${_info.proPrice.fixed()}元',
                          style: const TextStyle(
                            fontSize: 13,
                            color: Color(0xffEA3238),
                          ),
                        ),
                        CupertinoButton(
                          onPressed: () {},
                          padding: EdgeInsets.zero,
                          pressedOpacity: 0.6,
                          child: Container(
                              height: 30,
                              alignment: Alignment.center,
                              padding: const EdgeInsets.symmetric(
                                horizontal: 15,
                              ),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: const Color(0xffD45341),
                                ),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Text(
                                _info.quanPrice == 0.0
                                    ? '立即前往'
                                    : '领 ${_info.quanPrice.fixed()} 元券',
                                style: const TextStyle(
                                  color: Color(0xffD45341),
                                  fontSize: 14,
                                ),
                              )),
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

/// 正在加载
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
