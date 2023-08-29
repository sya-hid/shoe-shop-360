import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shoe_app/consts.dart';
import 'package:shoe_app/models/brand_model.dart';

class BrandLogoItem extends StatelessWidget {
  final BrandModel brand;
  final bool selected;
  const BrandLogoItem({
    super.key,
    required this.brand,
    required this.selected,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 70,
          padding: const EdgeInsets.symmetric(vertical: 5),
          decoration: BoxDecoration(
              color: selected ? lightGreen : grey.withOpacity(0.3),
              borderRadius: BorderRadius.circular(5)),
          child: SvgPicture.asset(
            'assets/svg/${brand.image}',
            height: 20,
            color: selected ? white : black,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          '${brand.totalItem} items',
          style: poppins.copyWith(fontSize: 10, color: black.withOpacity(0.5)),
        )
      ],
    );
  }
}
