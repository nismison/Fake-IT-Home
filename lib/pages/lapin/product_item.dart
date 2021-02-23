import 'package:flutter/cupertino.dart';

import '../../main.dart';

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
