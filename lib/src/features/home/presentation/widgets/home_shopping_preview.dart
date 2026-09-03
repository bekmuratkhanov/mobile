import 'package:flutter/material.dart';

class HomeShoppingPreview extends StatelessWidget {
  final int completedCount;
  final int totalCount;
  final List<String> items;
  final VoidCallback onTap;

  const HomeShoppingPreview({
    super.key,
    required this.completedCount,
    required this.totalCount,
    required this.items,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Список покупок',
                  style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
                ),
                Icon(Icons.shopping_bag_outlined, size: 16, color: Colors.grey),
              ],
            ),
            const SizedBox(height: 10),
            // Пункты покупок
            ...items.map(
              (item) => Padding(
                padding: const EdgeInsets.only(bottom: 4),
                child: Row(
                  children: [
                    const Icon(
                      Icons.check_box_outline_blank,
                      size: 14,
                      color: Colors.grey,
                    ),
                    const SizedBox(width: 6),
                    Text(item, style: const TextStyle(fontSize: 12)),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              '$completedCount из $totalCount куплено',
              style: const TextStyle(
                fontSize: 10,
                color: Colors.teal,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
