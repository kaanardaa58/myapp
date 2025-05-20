import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

// Uygulama temel widget'ı
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Telegram Clone',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ChatListPage(),
    );
  }
}

// Sohbet listesi sayfası
class ChatListPage extends StatelessWidget {
  const ChatListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Telegram"),
        actions: const [
          Icon(Icons.search),
          SizedBox(width: 16),
        ],
      ),
      body: ListView(
        children: const [
          // Roberto sohbeti
          ChatItem(
            name: "KAAN",
            message: "Nerdesin.",
            time: "17:03",
            unreadCount: 1,
          ),
          // Campus Party sohbeti
          ChatItem(
            name: "HALI SAHA",
            message: "Kimler geliyor",
            time: "17:00",
            unreadCount: 2,
          ),
          // Little Sister sohbeti
          ChatItem(
            name: "MEHMET",
            message: "Bekliyorum",
            time: "17:00",
            unreadCount: 0,
          ),
        ],
      ),
    );
  }
}

// Tek bir sohbet satırı için widget
class ChatItem extends StatelessWidget {
  final String name;
  final String message;
  final String time;
  final int unreadCount;

  const ChatItem({
    super.key,
    required this.name,
    required this.message,
    required this.time,
    required this.unreadCount,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
      subtitle: Text(message),
      trailing: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(time, style: const TextStyle(fontSize: 12)),
          const SizedBox(height: 4),
          if (unreadCount > 0)
            CircleAvatar(
              radius: 10,
              backgroundColor: Colors.green,
              child: Text(
                unreadCount.toString(),
                style: const TextStyle(fontSize: 12, color: Colors.white),
              ),
            ),
        ],
      ),
    );
  }
}
