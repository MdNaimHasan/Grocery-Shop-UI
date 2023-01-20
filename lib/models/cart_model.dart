import 'package:flutter/material.dart';

class Cart_Model extends ChangeNotifier {
  //list of items
  List _shop_items = [
    //[ name, price, image_path, color ],
    ["Avocado", 40.0, "lib/images/avocado.png", Colors.green],
    ["Banana", 60.0, "lib/images/banana.png", Colors.yellow],
    ["Chicken", 160.0, "lib/images/chicken.png", Colors.brown],
    ["Water", 15.0, "lib/images/water.png", Colors.blue],
  ];

  List get shop_items {
    return _shop_items;
  }

  //list of cart items
  List _cart_items = [];

  List get cart_items {
    return _cart_items;
  }

  //add items to cart
  void add_item_to_cart(int index) {
    _cart_items.add(_shop_items[index]);
    notifyListeners();
  }

  //remove items from cart
  void remove_item_from_cart(int index) {
    if (_cart_items.isNotEmpty) {
      _cart_items.removeAt(index);
      notifyListeners();
    }
  }

  //calculate total cost

  String calculate_total_price() {
    double _total_price = 0.0;
    for (var item in _cart_items) {
      _total_price += item[1];
    }
    return _total_price.toStringAsFixed(2);
  }
}
