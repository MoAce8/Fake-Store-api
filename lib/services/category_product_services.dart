import 'package:store/models/product_model.dart';
import 'package:store/shared/api.dart';

class CategoryProductsServices {
  Future<List<ProductModel>> getCategory({required String categoryName}) async {
    List data = await Api().get(url: 'https://fakestoreapi.com/products/category/$categoryName');

    List<ProductModel> list = [];
    for (int i = 0; i < data.length; i++) {
      list.add(ProductModel.fromJson(data[i]));
    }
    return list;
  }
}
