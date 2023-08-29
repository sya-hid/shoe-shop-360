import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:shoe_app/models/cart_model.dart';
import 'package:shoe_app/models/product_model.dart';

class CartProvider with ChangeNotifier {
  List<CartModel> _carts = [];
  List<CartModel> get carts => _carts;
  set carts(List<CartModel> carts) {
    _carts = carts;
    notifyListeners();
  }

  addCart(ProductModel product, int size) {
    if (cartExist(product, size)) {
      int index = _carts.indexWhere(
          (element) => element.product == product && size == element.size);
      log(index.toString());
      if (_carts[index].size == size) {
        _carts[index].quantity = _carts[index].quantity + 1;
      } else if (_carts[index].size != size) {
        _carts.add(CartModel(product: product, quantity: 1, size: size));
      }
    } else {
      _carts.add(CartModel(product: product, quantity: 1, size: size));
    }
    notifyListeners();
  }

  addQuantity(ProductModel product, int size) {
    int index = _carts.indexWhere(
        (element) => element.product == product && element.size == size);
    _carts[index].quantity = _carts[index].quantity + 1;
    notifyListeners();
  }

  reduceQuantity(ProductModel product, int size) {
    int index = _carts.indexWhere(
        (element) => element.product == product && element.size == size);
    _carts[index].quantity = _carts[index].quantity - 1;
    notifyListeners();
  }

  isSelected(ProductModel product, int size) {
    int index = _carts.indexWhere(
        (element) => element.product == product && element.size == size);
    _carts[index].selected = !_carts[index].selected;
    notifyListeners();
  }

  cartExist(ProductModel product, int size) {
    if (_carts.indexWhere(
            (element) => element.product == product && element.size == size) ==
        -1) {
      return false;
    } else {
      return true;
    }
  }

  totalSelected() {
    double total = 0;
    for (var i = 0; i < _carts.length; i++) {
      total = total +
          (_carts[i].selected == true
              ? _carts[i].quantity * _carts[i].product.price
              : 0);
    }
    return total;
  }
}
