class FakeTaskModel {
  final String title;
  final String category;
  final String assignee;
  final String priority;
  final String time;
  final bool isDone;

  const FakeTaskModel({
    required this.title,
    required this.category,
    required this.assignee,
    required this.priority,
    required this.time,
    required this.isDone,
  });
}
