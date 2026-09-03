class FakeSubtask {
  final String title;
  final String assignee;
  final String priority;
  final bool isDone;

  const FakeSubtask({
    required this.title,
    required this.assignee,
    required this.priority,
    required this.isDone,
  });
}

class FakeComment {
  final String author;
  final String time;
  final String text;

  const FakeComment({
    required this.author,
    required this.time,
    required this.text,
  });
}
