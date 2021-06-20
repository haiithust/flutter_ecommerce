import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';

import '../constants.dart';

class FavoriteProduct extends ChangeNotifier {
  final List<int> productIds = [];
  final box = Hive.box(favoriteTable);

  FavoriteProduct() {
    final List<int> ids = box.get(favoriteKey, defaultValue: []).cast<int>();
    productIds.addAll(ids);
  }

  void toggle(int id) {
    if (productIds.contains(id)) {
      productIds.remove(id);
    } else {
      productIds.add(id);
    }
    box.put(favoriteKey, productIds);
    notifyListeners();
  }
}