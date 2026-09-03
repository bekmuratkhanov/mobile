import 'package:flutter/material.dart';

// Импортируем модель и виджеты
import '../widgets/fake_task_model.dart';
import '../widgets/home_header_widget.dart';
import '../widgets/task_progress_card.dart';
import '../widgets/today_tasks_list.dart';
import '../widgets/home_shopping_preview.dart';
import '../widgets/home_bills_preview.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F9FC),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 1. ШАПКА
              HomeHeaderWidget(
                userName: 'Тамир',
                houseName: 'Наша квартира',
                onNotificationTap: () {},
              ),
              const SizedBox(height: 16),

              // 2. КАРТОЧКА ПРОГРЕССА
              const TaskProgressCard(
                completedTasks: 12,
                totalTasks: 18,
                message: 'Хорошая работа команды 👏',
              ),
              const SizedBox(height: 20),

              // 3. СЕКЦИЯ "СЕГОДНЯ"
              TodayTasksList(
                tasks: const [
                  FakeTaskModel(
                    title: 'Убрать кухню',
                    category: 'Уборка',
                    assignee: 'Алекс',
                    priority: 'Высокий',
                    time: '09:00',
                    isDone: true,
                  ),
                  FakeTaskModel(
                    title: 'Вынести мусор',
                    category: 'Дом',
                    assignee: 'Данияр',
                    priority: 'Средний',
                    time: '12:00',
                    isDone: false,
                  ),
                  FakeTaskModel(
                    title: 'Полить растения',
                    category: 'Растения',
                    assignee: 'София',
                    priority: 'Низкий',
                    time: '18:00',
                    isDone: false,
                  ),
                ],
                onTaskToggle: (index, isDone) {},
              ),
              const SizedBox(height: 20),

              // 4. НИЖНЯЯ СЕКЦИЯ
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: HomeShoppingPreview(
                      completedCount: 4,
                      totalCount: 8,
                      items: const ['Молоко', 'Хлеб', 'Овощи'],
                      onTap: () {},
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: HomeBillsPreview(
                      internetPrice: '8 500 ₸',
                      electricityPrice: '12 300 ₸',
                      dueDate: '25 июля',
                      onTap: () {},
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
