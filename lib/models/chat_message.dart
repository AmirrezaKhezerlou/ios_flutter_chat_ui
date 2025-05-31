class ChatMessage {
  final String id;
  final String text;
  final bool isSender; // true for current user, false for other

  ChatMessage({
    required this.id,
    required this.text,
    required this.isSender,
  });
}
