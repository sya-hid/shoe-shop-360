import 'package:shoe_app/models/product_model.dart';

class CartModel {
  final ProductModel product;
  int quantity;
  final int size;
  bool selected;

  CartModel(
      {this.selected = false,
      required this.product,
      required this.quantity,
      required this.size});
}
