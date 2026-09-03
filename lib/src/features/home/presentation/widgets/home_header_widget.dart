import 'package:flutter/material.dart';

class HomeHeaderWidget extends StatelessWidget {
  final String userName;
  final String houseName;
  final VoidCallback onNotificationTap;

  const HomeHeaderWidget({
    super.key,
    required this.userName,
    required this.houseName,
    required this.onNotificationTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Приветствие + Выбор дома + Колокольчик
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Добрый вечер, $userName',
                  style: const TextStyle(color: Colors.grey, fontSize: 14),
                ),
                const SizedBox(height: 2),
                Row(
                  children: [
                    Text(
                      houseName,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Icon(Icons.keyboard_arrow_down, size: 20),
                  ],
                ),
              ],
            ),
            // Кнопка уведомлений
            IconButton(
              onPressed: onNotificationTap,
              icon: const Icon(Icons.notifications_none_rounded),
              style: IconButton.styleFrom(
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),

        // Горизонтальный список аватарок (заглушка)
        SizedBox(
          height: 40,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: const [
              CircleAvatar(
                radius: 18,
                backgroundColor: Colors.amber,
                child: Text('A'),
              ),
              SizedBox(width: 8),
              CircleAvatar(
                radius: 18,
                backgroundColor: Colors.blue,
                child: Text('S'),
              ),
              SizedBox(width: 8),
              CircleAvatar(
                radius: 18,
                backgroundColor: Colors.green,
                child: Text('D'),
              ),
              SizedBox(width: 8),
              CircleAvatar(
                radius: 18,
                backgroundColor: Colors.purple,
                child: Text('T'),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
