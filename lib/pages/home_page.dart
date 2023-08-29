import 'package:flutter/material.dart';
import 'package:shoe_app/consts.dart';
import 'package:shoe_app/models/brand_model.dart';
import 'package:shoe_app/models/product_model.dart';
import 'package:shoe_app/pages/detail_page.dart';
import 'package:shoe_app/widgets/brand_logo_item.dart';
import 'package:shoe_app/widgets/category_item.dart';
import 'package:shoe_app/widgets/popular_product_item.dart';
import 'package:shoe_app/widgets/product_item.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedBrand = 0;
  int selectedCategory = 1;
  @override
  Widget build(BuildContext context) {
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
            Container(
              width: 50,
              height: 50,
              decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(image: AssetImage('assets/user.jpg'))),
            ),
          ],
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text('Good Morning',
                    style: poppins.copyWith(fontSize: 14, color: black)),
                Image.asset('assets/hand.png', width: 18)
              ],
            ),
            Text('Serhli Helchynskyi',
                style: poppins.copyWith(
                    fontSize: 14, color: black, fontWeight: FontWeight.bold)),
          ],
        ),
        actions: [
          Icon(Icons.favorite_outline_rounded, color: black.withOpacity(0.6)),
          const SizedBox(width: 24),
          Icon(Icons.notifications_outlined, color: black.withOpacity(0.6)),
          const SizedBox(width: 24),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 24),
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                  color: grey.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(10)),
              child: TextFormField(
                decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.search_rounded),
                    prefixIconColor: black.withOpacity(0.6),
                    hintText: 'Search',
                    hintStyle: poppins.copyWith(color: black.withOpacity(0.6)),
                    border: InputBorder.none),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Text(
              'Brand',
              style:
                  poppins.copyWith(fontWeight: FontWeight.bold, fontSize: 14),
            ),
          ),
          const SizedBox(height: 20),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                ...List.generate(
                    brands.length,
                    (index) => Padding(
                          padding: index == 0
                              ? const EdgeInsets.only(left: 24, right: 14)
                              : index == brands.length - 1
                                  ? const EdgeInsets.only(right: 24)
                                  : const EdgeInsets.only(right: 14),
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedBrand = index;
                              });
                            },
                            child: BrandLogoItem(
                              brand: brands[index],
                              selected: index == selectedBrand,
                            ),
                          ),
                        ))
              ],
            ),
          ),
          const SizedBox(height: 24),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Text(
              'Categories',
              style:
                  poppins.copyWith(fontWeight: FontWeight.bold, fontSize: 14),
            ),
          ),
          const SizedBox(height: 20),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                ...List.generate(
                    categories.length,
                    (index) => Padding(
                          padding: index == 0
                              ? const EdgeInsets.only(left: 24, right: 14)
                              : index == categories.length - 1
                                  ? const EdgeInsets.only(right: 24)
                                  : const EdgeInsets.only(right: 14),
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedCategory = index;
                              });
                            },
                            child: CategoryItem(
                              category: categories[index],
                              selected: selectedCategory == index,
                            ),
                          ),
                        ))
              ],
            ),
          ),
          const SizedBox(height: 20),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                ...List.generate(
                    products.length,
                    (index) => Padding(
                          padding: index == 0
                              ? const EdgeInsets.only(left: 24, right: 20)
                              : index == products.length - 1
                                  ? const EdgeInsets.only(right: 24)
                                  : const EdgeInsets.only(right: 20),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => DetailPage(
                                            product: products[index],
                                          )));
                            },
                            child: ProductItem(
                              product: products[index],
                            ),
                          ),
                        ))
              ],
            ),
          ),
          const SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Popular',
                  style: poppins.copyWith(
                      fontWeight: FontWeight.bold, fontSize: 14),
                ),
                Text(
                  'Show all',
                  style: poppins.copyWith(
                      fontWeight: FontWeight.normal,
                      fontSize: 14,
                      color: black.withOpacity(0.5)),
                ),
              ],
            ),
          ),
          const SizedBox(height: 15),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                ...List.generate(
                    products.length,
                    (index) => Padding(
                          padding: index == 0
                              ? const EdgeInsets.only(left: 24, right: 24)
                              : const EdgeInsets.only(right: 24),
                          child: PopularProductItem(
                            product: products[index],
                          ),
                        ))
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
          unselectedItemColor: black.withOpacity(0.5),
          selectedItemColor: black,
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: ''),
            BottomNavigationBarItem(
                icon: Icon(Icons.message_rounded), label: ''),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.add_circle_rounded,
                  size: 48,
                ),
                label: ''),
            BottomNavigationBarItem(icon: Icon(Icons.group_rounded), label: ''),
            BottomNavigationBarItem(icon: Icon(Icons.explore), label: ''),
          ]),
    );
  }
}
