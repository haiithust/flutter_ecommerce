import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shop_app/models/FavoriteProduct.dart';
import 'package:shop_app/models/Product.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/screens/cart/components/cart_card.dart';

class FavoriteItemCard extends StatelessWidget {
  final Product product;

  const FavoriteItemCard({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Dismissible(
        key: Key(product.id.toString()),
        child: CartCard(
          product: product,
        ),
        direction: DismissDirection.endToStart,
        onDismissed: (direction) {
          _removeFavoriteProduct(context);
        },
        background: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
            color: const Color(0xFFFFE6E6),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Row(
            children: [
              const Spacer(),
              SvgPicture.asset("assets/icons/Trash.svg"),
            ],
          ),
        ),
      ),
    );
  }

  void _removeFavoriteProduct(BuildContext context) {
    final favoriteProduct = context.read<FavoriteProduct>();
    favoriteProduct.remove(product.id);
  }
}
