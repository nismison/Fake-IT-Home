import '../../main.dart';
import 'controller.dart';
import 'coupons_item.dart';
import 'loading_tile.dart';
import 'product_item.dart';
import 'skeleton.dart';

class ProductList extends GetView<LapinController> {
  final String _code;
  final int _index;

  const ProductList(this._code, this._index);

  @override
  Widget build(BuildContext context) {
    controller.fetchProductList(_code, 1);
    return GetBuilder<LapinController>(
        id: 'lapin',
        builder: (_) {
          final _productList = controller.productList[_index];

          if (_productList.isEmpty) return const Skeleton();

          return Scrollbar(
            child: ListView.builder(
              physics: const ClampingScrollPhysics(), // 关闭滚动时回弹效果
              itemCount: _productList.length + 1,
              itemBuilder: (_, index) {
                if (index == _productList.length) {
                  controller.fetchProductList(_code);
                  return controller.noMore()
                      ? const NoMore()
                      : const LoadingTile();
                }

                if (_code == '福利') return CouponsItem(_productList[index]);
                return ProductItem(_productList[index]);
              },
            ),
          );
        });
  }
}
