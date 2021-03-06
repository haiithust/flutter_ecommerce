import 'package:flutter/material.dart';
import 'package:shop_app/models/Product.dart';
import 'package:shop_app/screens/details/details_screen.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class CartCard extends StatelessWidget {
  const CartCard({
    Key? key,
    required this.product,
    this.total = -1,
  }) : super(key: key);

  final Product product;
  final int total;

  @override
  Widget build(BuildContext context) {
    final isOrderCart = total > 0;
    return GestureDetector(
      onTap: () => Navigator.pushNamed(
        context,
        DetailsScreen.routeName,
        arguments: ProductDetailsArguments(product: product),
      ),
      child: Row(
        children: [
          SizedBox(
            width: 88,
            child: AspectRatio(
              aspectRatio: 0.88,
              child: Container(
                padding: EdgeInsets.all(getProportionateScreenWidth(10)),
                decoration: BoxDecoration(
                  color: Color(0xFFF5F6F9),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Image.asset(product.images[0]),
              ),
            ),
          ),
          SizedBox(width: 20),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.title,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(color: Colors.black, fontSize: 16),
                  maxLines: 2,
                ),
                SizedBox(height: 4),
                if (isOrderCart)
                  Text(
                    "Color: ${product.colorNames[product.colors.indexOf(product.selectedColor)]}",
                    style: Theme.of(context).textTheme.overline!.copyWith(color: Colors.red[800]),
                  ),
                SizedBox(height: 12),
                Text.rich(
                  TextSpan(
                    text: "\$${product.price}",
                    style: TextStyle(
                        fontWeight: FontWeight.w600, color: kPrimaryColor),
                    children: [
                      if (isOrderCart)
                        TextSpan(
                            text: " x$total",
                            style: Theme.of(context).textTheme.bodyText1),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
