class FakeShoppingListModel {
  final String title;
  final String category;
  final String assignee;
  final String priority;
  final String price;
  final bool isBought;

  const FakeShoppingListModel({
    required this.title,
    required this.category,
    required this.assignee,
    required this.priority,
    required this.price,
    required this.isBought,
  });
}
