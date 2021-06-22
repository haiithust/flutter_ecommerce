import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/models/Cart.dart';
import 'package:shop_app/helper/extension.dart';
import 'package:shop_app/models/Product.dart';

class OrderCart extends ChangeNotifier {
  final List<Cart> _carts = [];
  final Box box = Hive.box(cartTable);

  OrderCart() {
    _carts.addAll(box.keys.map((key) {
      final List<String> splits = (key as String).split("|");
      assert(splits.length == 2, true);
      final int id = int.parse(splits[0]);
      final Color selectedColor = Color(int.parse(splits[1]));
      final Product product = demoProducts
          .firstWhere((element) => element.id == id);
      return Cart(product: product.clone(selectedColor), numOfItem: box.get(key, defaultValue: 1));
    }));
  }

  void add(Cart cart) {
    Cart? currentCart =
        _carts.find((element) => element.product == cart.product);
    if (currentCart == null) {
      _carts.add(cart);
      currentCart = cart;
    } else {
      currentCart.increase();
    }
    box.put(currentCart.template, currentCart.numOfItem);
    notifyListeners();
  }

  void removeAt(int index) {
    if (index >= 0 && index < _carts.length) {
      final cart = _carts.removeAt(index);
      box.delete(cart.template);
    }
    notifyListeners();
  }

  List<Cart> get carts => _carts;

  int get totalCart => _carts.length;

  double get totalPrice => carts.sumBy((item) => item.getPrice()).toDouble();
}
