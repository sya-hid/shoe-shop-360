import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoe_app/consts.dart';
import 'package:shoe_app/models/product_model.dart';
import 'package:imageview360/imageview360.dart';
import 'package:shoe_app/pages/cart_page.dart';
import 'package:shoe_app/providers/cart_provider.dart';

class DetailPage extends StatefulWidget {
  final ProductModel product;
  const DetailPage({super.key, required this.product});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  List<ImageProvider> imageList = <ImageProvider>[];
  bool imagePrecache = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    WidgetsBinding.instance
        .addPostFrameCallback((timeStamp) => upateImageList(context));
  }

  void upateImageList(BuildContext context) async {
    for (var i = 0; i < 72; i++) {
      String newIndex = '${i + 1}'.padLeft(3, '0');
      imageList.add(AssetImage(
          'assets/shoe_360/360-product-photography-tennis-shoe-$newIndex.jpg'));
      await precacheImage(
          AssetImage(
              'assets/shoe_360/360-product-photography-tennis-shoe-$newIndex.jpg'),
          context);
    }
    setState(() {
      imagePrecache = true;
    });
  }

  int selectedSizeType = 0;
  int selectedSize = 38;
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    CartProvider cartProvider = Provider.of<CartProvider>(context);
    return Scaffold(
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
        title: Text(widget.product.subCategory,
            style: poppins.copyWith(
                fontSize: 14, color: black, fontWeight: FontWeight.bold)),
        actions: [
          GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const CartPage()));
              },
              child: Icon(Icons.shopping_bag_outlined,
                  color: black.withOpacity(0.6))),
          const SizedBox(width: 24),
        ],
      ),
      body: ListView(
        children: [
          Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.center,
            children: [
              Positioned(
                bottom: -120,
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Transform(
                    transform: Matrix4.identity()
                      ..setEntry(3, 2, 0.001)
                      ..rotateX(-(pi / 180 * 80)),
                    alignment: Alignment.topCenter,
                    child: Container(
                      height: 300,
                      width: 300,
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                                color: lightGreen,
                                spreadRadius: 0,
                                blurRadius: 5,
                                offset: Offset(0, 7))
                          ]),
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 95,
                child: Container(
                  padding: const EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    color: lightGreen,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.arrow_back_ios_rounded,
                          color: white, size: 14),
                      Icon(Icons.arrow_forward_ios_rounded,
                          color: white, size: 14),
                    ],
                  ),
                ),
              ),
              SizedBox(
                  width: 300,
                  height: 300,
                  child: imagePrecache
                      ? ImageView360(
                          key: UniqueKey(),
                          imageList: imageList,
                          autoRotate: true,
                          frameChangeDuration: const Duration(milliseconds: 30),
                        )
                      : const Center(
                          child: CircularProgressIndicator(
                          color: lightGreen,
                        )))
            ],
          ),
        ],
      ),
      bottomSheet: BottomSheet(
        backgroundColor: grey.withOpacity(0.01),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
        constraints: BoxConstraints(
            maxHeight: MediaQuery.of(context).size.height * 0.63),
        elevation: 0,
        onClosing: () {},
        builder: (context) {
          return ListView(
            shrinkWrap: true,
            padding: const EdgeInsets.symmetric(vertical: 24),
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.product.subCategory,
                      style: poppins.copyWith(
                          fontSize: 14, color: black.withOpacity(0.5)),
                    ),
                    Row(
                      children: [
                        const Icon(Icons.star_rate_rounded,
                            color: lightGreen, size: 16),
                        const SizedBox(width: 5),
                        Text(
                          widget.product.rate.toString(),
                          style: poppins.copyWith(
                              fontSize: 14, color: black.withOpacity(0.5)),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.product.name,
                      style: poppins.copyWith(
                          fontSize: 14,
                          color: black,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      currencyFormatter.format(widget.product.price),
                      style: poppins.copyWith(
                          fontSize: 14,
                          color: black,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Size :',
                      style: poppins.copyWith(
                          fontSize: 14,
                          color: black,
                          fontWeight: FontWeight.bold),
                    ),
                    Row(
                      children: [
                        ...List.generate(
                            sizeType.length,
                            (index) => Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 5),
                                  child: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        selectedSizeType = index;
                                      });
                                    },
                                    child: Text(
                                      sizeType[index],
                                      style: poppins.copyWith(
                                          fontWeight: FontWeight.bold,
                                          color: selectedSizeType == index
                                              ? lightGreen
                                              : black.withOpacity(0.5)),
                                    ),
                                  ),
                                ))
                      ],
                    )
                  ],
                ),
              ),
              const SizedBox(height: 20),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    ...List.generate(
                        availableSize.length,
                        (index) => Padding(
                              padding: index == 0
                                  ? const EdgeInsets.only(left: 24, right: 24)
                                  : const EdgeInsets.only(right: 24),
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    selectedSize = availableSize[index];
                                  });
                                },
                                child: Container(
                                    height: 28,
                                    width: 28,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        color:
                                            selectedSize == availableSize[index]
                                                ? lightGreen
                                                : grey),
                                    child: Center(
                                        child: Text(
                                      availableSize[index].toString(),
                                      style: TextStyle(
                                          color: selectedSize ==
                                                  availableSize[index]
                                              ? white
                                              : black),
                                    ))),
                              ),
                            ))
                  ],
                ),
              ),
              const SizedBox(height: 15),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Text(
                  'Colors:',
                  style: poppins.copyWith(
                      color: black, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  ...List.generate(
                      availableColor.length,
                      (index) => Padding(
                            padding: index == 0
                                ? const EdgeInsets.only(left: 24, right: 24)
                                : const EdgeInsets.only(right: 24),
                            child: SizedBox(
                              width: 16,
                              height: 16,
                              child: Checkbox(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)),
                                fillColor: MaterialStatePropertyAll(
                                    availableColor[index]),
                                value: index == 0 ? true : false,
                                onChanged: (value) {},
                              ),
                            ),
                          ))
                ],
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Text(
                  'Description',
                  style: poppins.copyWith(
                      fontWeight: FontWeight.bold, fontSize: 14),
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Text(
                  widget.product.description,
                  maxLines: 5,
                  overflow: TextOverflow.fade,
                  style: poppins.copyWith(
                      fontSize: 12, color: black.withOpacity(0.5)),
                ),
              ),
              const SizedBox(height: 40),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: GestureDetector(
                  onTap: () {
                    cartProvider.addCart(widget.product, selectedSize);
                  },
                  child: Container(
                    height: 60,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: lightGreen),
                    child: Center(
                      child: Text(
                        'Add to Cart',
                        style: poppins.copyWith(
                            color: white, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
