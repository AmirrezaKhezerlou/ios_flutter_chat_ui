import 'package:get/get.dart';

import '../../../models/chat_message.dart';


class ChatController extends GetxController {
  final messages = <ChatMessage>[
    ChatMessage(
      text: "سلام! چطوری؟",
      isSender: false,
      id: '43',
    ),
    ChatMessage(
      text: "سلام، من خوبم. تو چطوری؟",
      isSender: true,
      id: '424',
    ),
    ChatMessage(
      text: "منم خوبم. امروز چیکار می‌کنی؟",
      isSender: false, id: '9',

    ),
  ].obs;


  void sendMessage(String text) {
    if (text.trim().isEmpty) return;

    final message = ChatMessage(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      text: text,
      isSender: true,
    );

    messages.add(message);

    // Optional: simulate reply
    Future.delayed(Duration(milliseconds: 500), () {
      messages.add(ChatMessage(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        text: "پاسخ به: $text",
        isSender: false,
      ));
    });
  }
}
