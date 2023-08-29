import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoe_app/consts.dart';
import 'package:shoe_app/models/cart_model.dart';
import 'package:shoe_app/providers/cart_provider.dart';
import 'package:shoe_app/widgets/cart_item.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    CartProvider cartProvider = Provider.of<CartProvider>(context);
    List<CartModel> carts = cartProvider.carts.reversed.toList();
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: white,
        scrolledUnderElevation: 0,
        leadingWidth: 75,
        leading: Row(
          children: [
            const SizedBox(width: 24),
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(
                Icons.arrow_back_ios_rounded,
                size: 20,
                color: black.withOpacity(0.5),
              ),
            )
          ],
        ),
        centerTitle: true,
        title: Text('Cart',
            style: poppins.copyWith(
                fontSize: 14, color: black, fontWeight: FontWeight.bold)),
        actions: [
          Icon(Icons.more_horiz, color: black.withOpacity(0.6)),
          const SizedBox(width: 24),
        ],
      ),
      body: ListView.separated(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
          itemBuilder: (context, index) {
            return CartItem(cart: carts[index], checked: carts[index].selected);
          },
          separatorBuilder: (context, index) {
            return const SizedBox(height: 24);
          },
          itemCount: carts.length),
      bottomNavigationBar: cartProvider.carts
              .where((element) => element.selected == true)
              .isNotEmpty
          ? ListView(
              padding: const EdgeInsets.all(24),
              shrinkWrap: true,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Selected Item (${cartProvider.carts.where((element) => element.selected == true).length})',
                      style: poppins.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      currencyFormatter.format(cartProvider.totalSelected()),
                      style: poppins.copyWith(fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                const SizedBox(height: 40),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    height: 60,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: lightGreen),
                    child: Center(
                      child: Text(
                        'Checkout',
                        style: poppins.copyWith(
                            color: white, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ],
            )
          : null,
    );
  }
}
