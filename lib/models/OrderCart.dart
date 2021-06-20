import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/models/Cart.dart';
import 'package:shop_app/helper/extension.dart';
import 'package:shop_app/models/Product.dart';

class OrderCart extends ChangeNotifier {
  final List<Cart> _carts = [];
  final Box box = Hive.box(cartTable);

  OrderCart() {
    _carts.addAll(box.keys
        .map((id) => demoProducts.find((element) => element.id == id)!)
        .map((product) => Cart(
            product: product,
            numOfItem: box.get(product.id, defaultValue: 1))));
  }

  void add(Cart cart) {
    Cart? currentCart =
        _carts.find((element) => element.product.id == cart.product.id);
    if (currentCart == null) {
      _carts.add(cart);
      currentCart = cart;
    } else {
      currentCart.increase();
    }
    box.put(cart.product.id, currentCart.numOfItem);
    notifyListeners();
  }

  void removeAt(int index) {
    if (index >= 0 && index < _carts.length) {
      final cart = _carts.removeAt(index);
      box.delete(cart.product.id);
    }
    notifyListeners();
  }

  List<Cart> get carts => _carts;

  int get totalCart => _carts.length;

  double get totalPrice => carts.sumBy((item) => item.getPrice()).toDouble();
}
