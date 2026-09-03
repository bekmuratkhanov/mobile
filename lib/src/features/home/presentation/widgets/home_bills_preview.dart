import 'package:flutter/material.dart';

class HomeBillsPreview extends StatelessWidget {
  final String internetPrice;
  final String electricityPrice;
  final String dueDate;
  final VoidCallback onTap;

  const HomeBillsPreview({
    super.key,
    required this.internetPrice,
    required this.electricityPrice,
    required this.dueDate,
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
                  'Счета',
                  style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
                ),
                Icon(Icons.receipt_long, size: 16, color: Colors.grey),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Интернет',
                  style: TextStyle(fontSize: 11, color: Colors.grey),
                ),
                Text(
                  internetPrice,
                  style: const TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 4),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Электричество',
                  style: TextStyle(fontSize: 11, color: Colors.grey),
                ),
                Text(
                  electricityPrice,
                  style: const TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
              decoration: BoxDecoration(
                color: Colors.green.shade50,
                borderRadius: BorderRadius.circular(6),
              ),
              child: Text(
                'Ближайшая оплата: $dueDate',
                style: const TextStyle(fontSize: 9, color: Colors.green),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
