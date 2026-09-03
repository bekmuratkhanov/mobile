import 'package:flutter/material.dart';

class TaskProgressCard extends StatelessWidget {
  final int completedTasks;
  final int totalTasks;
  final String message;

  const TaskProgressCard({
    super.key,
    required this.completedTasks,
    required this.totalTasks,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    final double percent = totalTasks > 0 ? (completedTasks / totalTasks) : 0;
    final int percentInt = (percent * 100).toInt();

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Левая часть: текст и плашка
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '$completedTasks из $totalTasks дел\nвыполнено',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  height: 1.2,
                ),
              ),
              const SizedBox(height: 8),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xFFFFF7ED),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  message,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Color(0xFFC2410C),
                  ),
                ),
              ),
            ],
          ),

          // Правая часть: Круговой прогресс
          Stack(
            alignment: Alignment.center,
            children: [
              SizedBox(
                width: 64,
                height: 64,
                child: CircularProgressIndicator(
                  value: percent,
                  strokeWidth: 7,
                  color: const Color(0xFF0D9488),
                  backgroundColor: const Color(0xFFF1F5F9),
                  strokeCap: StrokeCap.round,
                ),
              ),
              Text(
                '$percentInt%',
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
