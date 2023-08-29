import 'package:flutter/material.dart';
import 'package:shoe_app/consts.dart';
import 'package:shoe_app/models/product_model.dart';

class PopularProductItem extends StatelessWidget {
  final ProductModel product;
  const PopularProductItem({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: MediaQuery.of(context).size.width - 48,
      decoration: BoxDecoration(
        color: grey,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Stack(
        fit: StackFit.expand,
        children: [
          Positioned(
            top: 40,
            bottom: 15,
            left: 15,
            child: Transform.flip(
              flipX: true,
              child: Image.asset(
                'assets/shoes/${product.images[1]}',
                fit: BoxFit.fitHeight,
              ),
            ),
          ),
          Positioned(
            top: 15,
            left: 230,
            right: 15,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const Icon(
                  Icons.favorite_outline_rounded,
                  color: lightGreen,
                ),
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
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
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
