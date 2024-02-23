import 'package:store/models/product_model.dart';
import 'package:store/models/rating_model.dart';
import 'package:store/shared/api.dart';

class UpdateProductService{
  Future<ProductModel> updateProduct({
    required dynamic id,
    required String title,
    required dynamic price,
    required String desc,
    required String image,
    required String category,
  }) async{
    print('+++++++++++++++++++++++++++++++++++++++++');
    Map<String, dynamic> data = await Api().put(url: 'https://fakestoreapi.com/products/$id',body: {
      'id': id.toString(),
      'title': title,
      'price': price.toString(),
      'description': desc,
      'image': image,
      'category': category,
    });

    return ProductModel.fromJson(data);
  }
}