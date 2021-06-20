import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/models/OrderCart.dart';

import 'components/body.dart';
import 'components/check_out_card.dart';

class CartScreen extends StatelessWidget {
  static String routeName = "/cart";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: Body(),
      bottomNavigationBar: CheckoutCard(),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    final totalCart = context.select((OrderCart value) => value.totalCart);
    return AppBar(
      title: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            "Your Cart",
            style: TextStyle(color: Colors.black),
          ),
          const SizedBox(
            width: 10,
          ),
          Text(
            "$totalCart items",
            style: Theme.of(context).textTheme.caption,
          ),
        ],
      ),
    );
  }
}
