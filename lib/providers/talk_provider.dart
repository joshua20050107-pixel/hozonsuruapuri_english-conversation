import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/talk_model.dart';

// 🔹 Talk のリストを管理する StateNotifier
class TalkNotifier extends StateNotifier<List<Talk>> {
  TalkNotifier() : super([]);

  // 新しい募集を追加
  void addTalk(Talk talk) {
    state = [...state, talk];
  }

  // 募集を削除（あとで使うかも）
  void removeTalk(String id) {
    state = state.where((t) => t.id != id).toList();
  }

  // 募集をクリア（デバッグ・データリセット用）
  void clearTalks() {
    state = [];
  }
}

// 🔹 Riverpodのプロバイダ定義
final talkProvider = StateNotifierProvider<TalkNotifier, List<Talk>>((ref) {
  return TalkNotifier();
});

// 🔹 外部から使いやすい関数（今のCreateTalkScreenが呼んでるやつ）
void addTalk(WidgetRef ref, Talk newTalk) {
  ref.read(talkProvider.notifier).addTalk(newTalk);
}
