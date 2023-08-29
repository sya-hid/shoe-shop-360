import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoe_app/consts.dart';
import 'package:shoe_app/models/cart_model.dart';
import 'package:shoe_app/providers/cart_provider.dart';

class CartItem extends StatelessWidget {
  final CartModel cart;
  final bool checked;
  const CartItem({
    super.key,
    required this.cart,
    required this.checked,
  });

  @override
  Widget build(BuildContext context) {
    CartProvider cartProvider = Provider.of<CartProvider>(context);
    return Row(
      children: [
        SizedBox(
          height: 24,
          width: 24,
          child: Checkbox(
            value: checked,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(2)),
            fillColor: const MaterialStatePropertyAll(lightGreen),
            onChanged: (value) {
              cartProvider.isSelected(cart.product, cart.size);
            },
          ),
        ),
        const SizedBox(width: 15),
        Container(
          height: 80,
          width: 80,
          decoration: BoxDecoration(
            color: grey.withOpacity(.5),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Image.asset(
            'assets/shoes/${cart.product.images[1]}',
            fit: BoxFit.contain,
          ),
        ),
        const SizedBox(width: 15),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                cart.product.name,
                maxLines: 1,
                style: poppins.copyWith(
                    fontSize: 14, fontWeight: FontWeight.bold, color: black),
              ),
              const SizedBox(height: 5),
              Text(
                'Size ${cart.size}',
                style: poppins.copyWith(
                    fontSize: 12,
                    color: black.withOpacity(0.5),
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    currencyFormatter.format(cart.product.price),
                    style: poppins.copyWith(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: black),
                  ),
                  Row(
                    children: [
                      SizedBox(
                        height: 18,
                        width: 18,
                        child: IconButton(
                            padding: const EdgeInsets.all(1),
                            style: ButtonStyle(
                                backgroundColor:
                                    const MaterialStatePropertyAll(grey),
                                shape: MaterialStatePropertyAll(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(5)))),
                            onPressed: () {
                              cart.quantity > 1
                                  ? cartProvider.reduceQuantity(
                                      cart.product, cart.size)
                                  : null;
                            },
                            iconSize: 14,
                            icon: const Icon(
                              Icons.remove,
                              color: Colors.white,
                            )),
                      ),
                      const SizedBox(width: 10),
                      Text(
                        cart.quantity.toString(),
                        style: poppins.copyWith(
                            fontSize: 14,
                            color: black,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(width: 10),
                      SizedBox(
                        height: 18,
                        width: 18,
                        child: IconButton(
                            padding: const EdgeInsets.all(1),
                            style: ButtonStyle(
                                backgroundColor:
                                    const MaterialStatePropertyAll(lightGreen),
                                shape: MaterialStatePropertyAll(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(5)))),
                            onPressed: () {
                              cartProvider.addQuantity(cart.product, cart.size);
                            },
                            iconSize: 14,
                            icon: const Icon(
                              Icons.add,
                              color: Colors.white,
                            )),
                      ),
                    ],
                  )
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}
