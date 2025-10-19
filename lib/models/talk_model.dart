class Talk {
  final String id;
  final String creatorName; // 投稿者名
  final String creatorLevel; // 投稿者の英語レベル ← 追加！
  final String message; // 募集メッセージ
  final String level; // 求める相手のレベル
  final String type; // free / short
  final DateTime createdAt;

  Talk({
    required this.id,
    required this.creatorName,
    required this.creatorLevel,
    required this.message,
    required this.level,
    required this.type,
    required this.createdAt,
  });
}
