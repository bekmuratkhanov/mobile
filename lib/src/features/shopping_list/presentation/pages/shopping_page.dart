import 'package:flutter/material.dart';

// Проверь импорты под свою структуру папок!
import '../widgets/fake_shopping_list.dart';
import '../widgets/shopping_item_tile.dart';

class ShoppingPage extends StatefulWidget {
  const ShoppingPage({super.key});

  @override
  State<ShoppingPage> createState() => _ShoppingPageState();
}

class _ShoppingPageState extends State<ShoppingPage> {
  final List<FakeShoppingListModel> items = [
    const FakeShoppingListModel(
      title: 'Молоко 2.5%',
      category: 'Молочка',
      assignee: 'Данияр',
      priority: 'Высокий',
      price: '450 ₸',
      isBought: false,
    ),
    const FakeShoppingListModel(
      title: 'Хлеб формовой',
      category: 'Выпечка',
      assignee: 'София',
      priority: 'Средний',
      price: '200 ₸',
      isBought: true,
    ),
    const FakeShoppingListModel(
      title: 'Яблоки Гала (1 кг)',
      category: 'Фрукты',
      assignee: 'Тамир',
      priority: 'Низкий',
      price: '850 ₸',
      isBought: false,
    ),
  ];

  int calculateTotalPrice() {
    int total = 0;
    for (var item in items) {
      // Очищаем строку от знака тенге и пробелов, оставляем только цифры
      final cleanPrice = item.price.replaceAll(RegExp(r'[^\d]'), '');
      final parsedPrice = int.tryParse(cleanPrice) ?? 0;
      total += parsedPrice;
    }
    return total;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F9FC),
      appBar: AppBar(
        title: const Text(
          'Список покупок',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            for (int i = 0; i < items.length; i++) ...[
              ShoppingItemTile(
                item: items[i],
                onToggle: (val) {
                  setState(() {
                    final currentItem = items[i];
                    items[i] = FakeShoppingListModel(
                      title: currentItem.title,
                      category: currentItem.category,
                      assignee: currentItem.assignee,
                      priority: currentItem.priority,
                      price: currentItem.price,
                      isBought: !currentItem.isBought,
                    );
                  });
                },
              ),
              const SizedBox(height: 10),
            ],
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        child: const Icon(Icons.add, color: Colors.white),
        onPressed: () {
          setState(() {
            items.add(
              const FakeShoppingListModel(
                title: 'Сок апельсиновый',
                category: 'Напитки',
                assignee: 'Данияр',
                priority: 'Средний',
                price: '600 ₸',
                isBought: false,
              ),
            );
          });
        },
      ),

      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, -4),
            ),
          ],
        ),
        child: SafeArea(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Итого:',
                    style: TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                  Text(
                    '${items.where((e) => e.isBought).length} из ${items.length} куплено',
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),

              Text(
                '${calculateTotalPrice()} ₸',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
