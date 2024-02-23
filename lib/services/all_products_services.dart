import 'package:store/models/product_model.dart';
import 'package:store/shared/api.dart';

class AllProductsServices {
  Future<List<ProductModel>> getAllProducts() async {
    print('before');
    List data = await Api().get(url: 'https://fakestoreapi.com/products');
    print(data);
    print('after');
    List<ProductModel> list = [];
    for (int i = 0; i < data.length; i++) {
      list.add(ProductModel.fromJson(data[i]));
    }
    return list;
  }
}
