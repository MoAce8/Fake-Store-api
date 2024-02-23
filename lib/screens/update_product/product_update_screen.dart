import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:store/models/product_model.dart';
import 'package:store/services/update_product.dart';
import 'package:store/shared/app_button.dart';
import 'package:store/shared/constants.dart';
import 'package:store/shared/custom_text_field.dart';

class ProductUpdateScreen extends StatelessWidget {
  ProductUpdateScreen({
    Key? key,
  }) : super(key: key);

  static String id = 'productUpdate';

  TextEditingController title = TextEditingController();
  TextEditingController price = TextEditingController();
  TextEditingController desc = TextEditingController();
  TextEditingController img = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final ProductModel product =
        ModalRoute.of(context)!.settings.arguments as ProductModel;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Update Product'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              SizedBox(
                height: screenHeight(context) * 0.06,
              ),
              AppTextField(label: 'Product Name', controller: title),
              SizedBox(
                height: screenHeight(context) * 0.035,
              ),
              AppTextField(label: 'Price', controller: price),
              SizedBox(
                height: screenHeight(context) * 0.035,
              ),
              AppTextField(label: 'Description', controller: desc),
              SizedBox(
                height: screenHeight(context) * 0.035,
              ),
              AppTextField(label: 'Image', controller: img),
              SizedBox(
                height: screenHeight(context) * 0.05,
              ),
              AppButton(
                  text: 'Update',
                  function: () async{
                    print('******************************************');
                    await UpdateProductService().updateProduct(
                      title: title.text == '' ? product.title : title.text,
                      price: price.text == '' ? product.price : price.text,
                      desc: desc.text == '' ? product.description : desc.text,
                      image: img.text == '' ? product.image : img.text,
                      category: product.category,
                      id: product.id,
                    );
                    print(product.id);
                    print(product.price);
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
