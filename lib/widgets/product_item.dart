import 'dart:math';

import 'package:flutter/material.dart';
import 'package:shoe_app/consts.dart';
import 'package:shoe_app/models/product_model.dart';

class ProductItem extends StatelessWidget {
  final ProductModel product;
  const ProductItem({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 285,
      width: 203,
      decoration: BoxDecoration(
          color: grey.withOpacity(0.5),
          borderRadius: BorderRadius.circular(20)),
      child: Stack(
        children: [
          const Positioned(
            left: 15,
            top: 20,
            child: Icon(
              Icons.favorite_outline_rounded,
              color: lightGreen,
            ),
          ),
          Positioned(
            top: 60,
            right: 0,
            child: Transform.rotate(
              angle: pi / 180 * -30,
              child: Image.asset(
                'assets/shoes/${product.images[0]}',
                width: 200,
                fit: BoxFit.fitWidth,
              ),
            ),
          ),
          Positioned(
            bottom: 20,
            left: 15,
            right: 15,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.name,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: poppins.copyWith(
                      fontWeight: FontWeight.bold, fontSize: 14),
                ),
                const SizedBox(height: 5),
                Text(
                  product.subCategory,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: poppins.copyWith(color: black.withOpacity(0.5)),
                ),
                const SizedBox(height: 5),
                Text(
                  currencyFormatter.format(product.price),
                  style: poppins.copyWith(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
