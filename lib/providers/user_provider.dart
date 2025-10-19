import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/talk_model.dart';

/// 仮のユーザー情報（後でプロフィール画面で編集できるようにする）
final userNameProvider = StateProvider<String>((ref) => 'Joshua');
final userLevelProvider = StateProvider<String>((ref) => 'Intermediate');

final talkListProvider = StateProvider<List<Talk>>((ref) => []);

void addTalk(WidgetRef ref, Talk talk) {
  final currentList = ref.read(talkListProvider);
  ref.read(talkListProvider.notifier).state = [...currentList, talk];
}

void removeTalk(WidgetRef ref, String id) {
  final currentList = ref.read(talkListProvider);
  ref.read(talkListProvider.notifier).state = currentList
      .where((t) => t.id != id)
      .toList();
}
