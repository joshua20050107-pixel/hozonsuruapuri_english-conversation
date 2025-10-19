class Talk {
  final String id;
  final String creatorName;
  final String creatorLevel;
  final String message;
  final String level; // "Beginner", "Intermediate", "Advanced", "Anyone"
  final String type; // "free" or "short"
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
