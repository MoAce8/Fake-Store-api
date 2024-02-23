import 'package:flutter/material.dart';
import 'package:store/models/product_model.dart';
import 'package:store/screens/update_product/product_update_screen.dart';
import 'package:store/shared/constants.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({Key? key, required this.product}) : super(key: key);
  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, ProductUpdateScreen.id,
            arguments: product);
        print(product.id);
        print(product.price);
        print(product.rating!.count);
        print(product.rating!.rate);
      },
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  offset: Offset(
                    screenWidth(context) * 0.015,
                    screenHeight(context) * 0.012,
                  ),
                  blurRadius: 5)
            ]),
            child: Card(
              surfaceTintColor: Colors.white,
              elevation: 7,
              child: Padding(
                padding: EdgeInsets.symmetric(
                    vertical: screenHeight(context) * 0.015,
                    horizontal: screenWidth(context) * 0.025),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      product.title,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(
                      height: screenHeight(context) * 0.005,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('\$${product.price}'),
                        const Icon(Icons.favorite),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            right: screenWidth(context) * 0.01,
            top: screenHeight(context) * -0.063,
            child: Image.network(
              product.image,
              height: 100,
              width: 100,
            ),
          )
        ],
      ),
    );
  }
}
