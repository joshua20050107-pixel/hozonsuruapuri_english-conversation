import 'package:flutter/material.dart';

class TalkCardGrid extends StatelessWidget {
  const TalkCardGrid({super.key});

  final List<Map<String, String>> talks = const [
    {"name": "Haru", "desc": "Let's cook in English 🍳", "color": "#9A7BFF"},
    {"name": "Mei", "desc": "Random chat ☕", "color": "#6FFFE9"},
    {"name": "Kai", "desc": "Weekend plans 🌇", "color": "#FFD84D"},
    {"name": "Lina", "desc": "Talk about anime 🎬", "color": "#A977FF"},
    {"name": "Ren", "desc": "Study talk 📚", "color": "#88B4FF"},
    {"name": "Yui", "desc": "Daily routine 🌞", "color": "#B688F9"},
    {"name": "Taro", "desc": "Future dreams 🚀", "color": "#7CC6FE"},
    {"name": "Nana", "desc": "Music talk 🎧", "color": "#6FFFE9"},
    {"name": "Sho", "desc": "Foodie chat 🍜", "color": "#FAD65E"},
    {"name": "Miki", "desc": "Let's chill 😌", "color": "#C6A8FF"},
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      itemCount: talks.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 0.9,
      ),
      itemBuilder: (context, index) {
        final talk = talks[index];
        return Container(
          decoration: BoxDecoration(
            color: Color(int.parse("0xFF${talk['color']!.substring(1)}")),
            borderRadius: BorderRadius.circular(24),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.08),
                blurRadius: 6,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                backgroundColor: Colors.white,
                radius: 26,
                child: Text(
                  talk['name']![0],
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Text(
                talk['name']!,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                talk['desc']!,
                style: const TextStyle(fontSize: 12),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Text(
                  "Join",
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 13),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
