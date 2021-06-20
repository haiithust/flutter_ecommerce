import 'Product.dart';

class Cart {
  final Product product;
  int numOfItem;

  Cart({required this.product, required this.numOfItem});

  double getPrice() => product.price * numOfItem;

  void increase() {
    numOfItem++;
  }
}
