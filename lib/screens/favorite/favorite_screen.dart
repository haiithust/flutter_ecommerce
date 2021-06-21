import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/models/FavoriteProduct.dart';
import 'package:shop_app/models/Product.dart';
import 'package:shop_app/screens/favorite/favorite_item_card.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Favorites"),
      ),
      body: Consumer<FavoriteProduct>(
        builder: (context, favoriteProduct, widget) {
          final products = demoProducts
              .where(
                  (element) => favoriteProduct.productIds.contains(element.id))
              .toList();
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: ListView.separated(
              itemCount: products.length,
              itemBuilder: (context, index) {
                return FavoriteItemCard(product: products[index]);
              },
              separatorBuilder: (BuildContext context, int index) {
                return Divider();
              },
            ),
          );
        },
      ),
    );
  }
}
