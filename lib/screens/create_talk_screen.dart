import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';
import '../providers/talk_provider.dart';
import '../providers/user_provider.dart';
import '../models/talk_model.dart';

class CreateTalkScreen extends ConsumerStatefulWidget {
  const CreateTalkScreen({super.key});

  @override
  ConsumerState<CreateTalkScreen> createState() => _CreateTalkScreenState();
}

class _CreateTalkScreenState extends ConsumerState<CreateTalkScreen> {
  String _selectedType = 'casual';
  String _selectedLevel = 'Beginner';
  final TextEditingController _messageController = TextEditingController();

  void _createTalk() {
    final userName = ref.read(userNameProvider);
    final userLevel = ref.read(userLevelProvider);

    final newTalk = Talk(
      id: const Uuid().v4(),
      creatorName: userName,
      creatorLevel: userLevel,
      message: _messageController.text.trim(),
      level: _selectedLevel,
      type: _selectedType,
      createdAt: DateTime.now(),
    );

    addTalk(ref, newTalk);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('募集を作成'),
        backgroundColor: const Color(0xFF4F5BD5),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('トークタイプ', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            ToggleButtons(
              isSelected: [_selectedType == 'casual', _selectedType == 'short'],
              onPressed: (index) {
                setState(() {
                  _selectedType = index == 0 ? 'casual' : 'short';
                });
              },
              borderRadius: BorderRadius.circular(10),
              fillColor: const Color(0xFF4F5BD5),
              selectedColor: Colors.white,
              children: const [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Text('Casual Talk'),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Text('Short Talk'),
                ),
              ],
            ),
            const SizedBox(height: 20),
            const Text(
              '求める相手のレベル',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            DropdownButton<String>(
              value: _selectedLevel,
              items: ['Beginner', 'Intermediate', 'Advanced']
                  .map(
                    (level) =>
                        DropdownMenuItem(value: level, child: Text(level)),
                  )
                  .toList(),
              onChanged: (value) {
                setState(() {
                  _selectedLevel = value!;
                });
              },
            ),
            const SizedBox(height: 20),
            const Text(
              '募集メッセージ',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: _messageController,
              decoration: InputDecoration(
                hintText: '例: Let’s talk about movies 🎬',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              maxLines: 2,
              maxLength: 40, // ★ これを追加（30〜40くらいがちょうどいい）
              buildCounter:
                  (
                    context, {
                    required currentLength,
                    required isFocused,
                    maxLength,
                  }) => null, // カウンター非表示
            ),

            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _createTalk,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 1, 1, 2),
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text(
                  '募集を作成',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
