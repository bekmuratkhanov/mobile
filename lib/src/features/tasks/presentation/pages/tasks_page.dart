import 'package:flutter/material.dart';

import '../widgets/fake_task_detail_model.dart';
import '../widgets/subtasks_list_widget.dart';
import '../widgets/task_comments_section.dart';
import '../widgets/task_action_buttons.dart';

class TaskDetailsPage extends StatelessWidget {
  const TaskDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F9FC),
      appBar: AppBar(
        title: const Text(
          'Детали задачи',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: const BackButton(color: Colors.black),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Заголовок задачи и тег
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Убрать кухню',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.blue.shade50,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: const Text(
                    'Уборка',
                    style: TextStyle(color: Colors.blue, fontSize: 12),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Блок с субзадачами
            const SubtasksListWidget(
              subtasks: [
                FakeSubtask(
                  title: 'Почистить плиту',
                  assignee: 'София',
                  priority: 'Высокий',
                  isDone: false,
                ),
                FakeSubtask(
                  title: 'Выкинуть мусор',
                  assignee: 'Данияр',
                  priority: 'Средний',
                  isDone: true,
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Чат / комментарии
            const TaskCommentsSection(
              comments: [
                FakeComment(
                  author: 'Алекс',
                  time: '12:46',
                  text: 'Все готово! Холодильник тоже протер.',
                ),
                FakeComment(
                  author: 'Тамир',
                  time: '12:50',
                  text: 'Отличная работа! 👍',
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Кнопки действий
            const TaskActionButtons(),
          ],
        ),
      ),
    );
  }
}
