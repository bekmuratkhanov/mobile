import 'package:flutter/material.dart';

class CalendarPage extends StatefulWidget {
  const CalendarPage({super.key});

  @override
  State<CalendarPage> createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  DateTime _selectedDate = DateTime(2026, 7, 12);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F9FC),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black, size: 20),
          onPressed: () {},
        ),
        title: const Text(
          'Календарь',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        actions: [
          // Аватарки участников в шапке
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Row(
              children: const [
                CircleAvatar(
                  radius: 12,
                  backgroundColor: Colors.orange,
                  child: Text('👨', style: TextStyle(fontSize: 10)),
                ),
                SizedBox(width: 4),
                CircleAvatar(
                  radius: 12,
                  backgroundColor: Colors.blue,
                  child: Text('👩', style: TextStyle(fontSize: 10)),
                ),
                SizedBox(width: 4),
                CircleAvatar(
                  radius: 12,
                  backgroundColor: Colors.purple,
                  child: Text('👧', style: TextStyle(fontSize: 10)),
                ),
              ],
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // 1. Блок Календаря
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
              ),
              child: CalendarDatePicker(
                initialDate: _selectedDate,
                firstDate: DateTime(2024),
                lastDate: DateTime(2030),
                onDateChanged: (date) {
                  setState(() {
                    _selectedDate = date;
                  });
                },
              ),
            ),
            const SizedBox(height: 16),

            // 2. Сетка карточек с событиями (2 колонки)
            GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              mainAxisSpacing: 12,
              crossAxisSpacing: 12,
              childAspectRatio: 1.1,
              children: [
                // Карточка 1: Сегодня
                _buildDayCard(
                  title: 'СЕГОДНЯ, 12 ИЮЛЯ',
                  events: [
                    _buildEventItem(
                      'Покупки на ужин',
                      Colors.blue.shade50,
                      Colors.blue,
                      icon: Icons.check_box,
                    ),
                    _buildEventItem(
                      'День рождения: София',
                      Colors.green.shade50,
                      Colors.green,
                      emoji: '🎂',
                    ),
                  ],
                ),
                // Карточка 2: Завтра
                _buildDayCard(
                  title: 'ЗАВТРА, 13 ИЮЛЯ',
                  events: [
                    _buildEventItem(
                      'Той у Абишевых',
                      Colors.amber.shade50,
                      Colors.amber.shade800,
                      emoji: '🎁',
                    ),
                    _buildEventItem(
                      'День Столицы',
                      Colors.teal.shade50,
                      Colors.teal,
                      emoji: '🏛️',
                    ),
                  ],
                ),
                // Карточка 3: Пятница
                _buildDayCard(
                  title: 'ПЯТНИЦА, 17 ИЮЛЯ',
                  events: [
                    _buildEventItem(
                      'Той у Абишевых',
                      Colors.amber.shade50,
                      Colors.amber.shade800,
                      emoji: '🎁',
                    ),
                    _buildEventItem(
                      'День эмодзи',
                      Colors.green.shade50,
                      Colors.green,
                      emoji: '😂',
                    ),
                  ],
                ),
                // Карточка 4: Суббота
                _buildDayCard(
                  title: 'СУББОТА, 25 ИЮЛЯ',
                  events: [
                    _buildEventItem(
                      'Сбор семьи: За городом',
                      Colors.purple.shade50,
                      Colors.purple,
                      emoji: '🏡',
                    ),
                    _buildEventItem(
                      'Годовщина свадьбы',
                      Colors.pink.shade50,
                      Colors.pink,
                      emoji: '💍',
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),

      // Кнопка "+" добавления события
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        child: const Icon(Icons.add, color: Colors.white, size: 28),
        onPressed: () {
          // Вызов модального окна для добавления события
          _showAddEventDialog(context);
        },
      ),
    );
  }

  // Виджет контейнера дня
  Widget _buildDayCard({required String title, required List<Widget> events}) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.bold,
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: 6),
          ...events,
        ],
      ),
    );
  }

  // Виджет одной плашки события
  Widget _buildEventItem(
    String text,
    Color bgColor,
    Color textColor, {
    IconData? icon,
    String? emoji,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 4),
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          if (emoji != null) Text(emoji, style: const TextStyle(fontSize: 11)),
          if (icon != null) Icon(icon, size: 12, color: textColor),
          const SizedBox(width: 4),
          Expanded(
            child: Text(
              text,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.w600,
                color: textColor,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Диалог добавления события по кнопке "+"
  void _showAddEventDialog(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Новое событие',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 12),
              const TextField(
                decoration: InputDecoration(
                  labelText: 'Название события',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Добавить'),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
