import 'package:flutter/material.dart';
import 'fake_shopping_list.dart'; // Проверь путь к файлу модели в своём проекте

class ShoppingItemTile extends StatelessWidget {
  final FakeShoppingListModel item;
  final ValueChanged<bool?> onToggle;

  const ShoppingItemTile({
    super.key,
    required this.item,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Checkbox(value: item.isBought, onChanged: onToggle),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Название товара
                Text(
                  item.title,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    decoration: item.isBought
                        ? TextDecoration.lineThrough
                        : null,
                    color: item.isBought ? Colors.grey : Colors.black,
                  ),
                ),

                Text(
                  '${item.category} • ${item.assignee}',
                  style: const TextStyle(fontSize: 12, color: Colors.grey),
                ),
              ],
            ),
          ),

          Text(
            item.price,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
