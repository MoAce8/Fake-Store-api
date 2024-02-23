import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:store/screens/home/widgets/product_card.dart';
import 'package:store/services/all_products_services.dart';
import 'package:store/shared/constants.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  static String id = 'HomeScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New Trends'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(FontAwesomeIcons.cartShopping),
          ),
        ],
      ),
      body: FutureBuilder(
        future: AllProductsServices().getAllProducts(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return GridView.builder(
              padding: EdgeInsets.only(
                top: screenHeight(context)*0.063,
                right: screenWidth(context)*0.015,
                left: screenWidth(context)*0.015,
              ),
              clipBehavior: Clip.none,
            itemCount: snapshot.data!.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: screenWidth(context)*0.015,
              mainAxisSpacing: screenHeight(context)*0.085,
              childAspectRatio: 1.55
            ),
            itemBuilder: (context, index) => ProductCard(product: snapshot.data![index]),
                    );
          }else{
            print(snapshot);
            return Center(child: CircularProgressIndicator(),);
          }
        }
      ),
    );
  }
}
