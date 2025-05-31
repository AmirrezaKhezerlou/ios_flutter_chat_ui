class ChatItem {
  final String name;
  final String message;
  final String time;
  final String avatarPath;
  final int unreadCount;

  ChatItem({
    required this.name,
    required this.message,
    required this.time,
    required this.avatarPath,
    required this.unreadCount,
  });
}
