import 'package:store/shared/api.dart';

class AllCategoriesServices {
  Future<List> getAllCategories() async {
    List data = await Api().get(url: 'https://fakestoreapi.com/products/categories');

    return data;
  }
}
