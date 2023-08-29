import 'package:flutter/material.dart';
import 'package:shoe_app/consts.dart';

class CategoryItem extends StatelessWidget {
  final String category;
  final bool selected;
  final ValueNotifier<Size> notifier = ValueNotifier(const Size(0, 0));
  CategoryItem({
    super.key,
    required this.category,
    required this.selected,
  });

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      notifier.value = (context.findRenderObject() as RenderBox).size;
    });
    return ValueListenableBuilder(
      valueListenable: notifier,
      builder: (context, value, child) {
        return Column(
          children: [
            Text(
              category,
              style: poppins.copyWith(
                  fontSize: 14,
                  color: selected ? lightGreen : black.withOpacity(0.5),
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 2),
            AnimatedContainer(
              duration: const Duration(milliseconds: 250),
              width: selected ? value.width : 0,
              height: 2.5,
              decoration: BoxDecoration(
                  color: lightGreen, borderRadius: BorderRadius.circular(10)),
            )
          ],
        );
      },
    );
  }
}
