import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controller/chat_controller.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final controller = Get.put(ChatController());
  final inputController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: const Text(
          'Messages',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: CupertinoColors.systemGroupedBackground,
        border: null,
        leading: CupertinoButton(
          padding: EdgeInsets.zero,
          onPressed: () {},
          child: const Text(
            'Back',
            style: TextStyle(color: CupertinoColors.activeBlue),
          ),
        ),
        trailing: CupertinoButton(
          padding: EdgeInsets.zero,
          onPressed: () {},
          child: const Icon(
            CupertinoIcons.info,
            color: CupertinoColors.activeBlue,
          ),
        ),
      ),
      backgroundColor: CupertinoColors.systemGroupedBackground,
      child: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Obx(
                    () =>
                    ListView.builder(
                      reverse: true,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      itemCount: controller.messages.length,
                      itemBuilder: (context, index) {
                        final message =
                        controller.messages.reversed.toList()[index];
                        final isSender = message.isSender;

                        return Padding(
                          padding: const EdgeInsets.only(bottom: 12),
                          child: Row(
                            mainAxisAlignment:
                            isSender
                                ? MainAxisAlignment.end
                                : MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              if (!isSender)
                                const CircleAvatar(
                                  radius: 16,
                                  backgroundColor: CupertinoColors.systemGrey3,
                                  child: Text(
                                    'U',
                                    style: TextStyle(
                                        color: CupertinoColors.white),
                                  ),
                                ),
                              if (!isSender) const SizedBox(width: 6),
                              Flexible(
                                child: Container(
                                  constraints: BoxConstraints(
                                    maxWidth:
                                    MediaQuery
                                        .of(context)
                                        .size
                                        .width * 0.75,
                                  ),
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 14,
                                    vertical: 10,
                                  ),
                                  decoration: BoxDecoration(
                                    color:
                                    isSender
                                        ? CupertinoColors.activeBlue
                                        : CupertinoColors.systemGrey4,
                                    borderRadius: BorderRadius.only(
                                      topLeft: const Radius.circular(20),
                                      topRight: const Radius.circular(20),
                                      bottomLeft: Radius.circular(
                                        isSender ? 20 : 0,
                                      ),
                                      bottomRight: Radius.circular(
                                        isSender ? 0 : 20,
                                      ),
                                    ),
                                  ),
                                  child: Directionality(
                                    textDirection: TextDirection.rtl,
                                    child: Text(
                                      message.text,
                                      style: TextStyle(
                                        color: isSender
                                            ? CupertinoColors.white
                                            : CupertinoColors.black,
                                        fontSize: 16,
                                        height: 1.4,
                                      ),
                                    ),
                                  ),

                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
              ),
            ),
            _buildInputArea(inputController, controller),
          ],
        ),
      ),
    );
  }

  Widget _buildInputArea(TextEditingController inputController, ChatController controller) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      decoration: BoxDecoration(
        color: CupertinoColors.systemGrey6,
        border: Border(
          top: BorderSide(color: CupertinoColors.systemGrey5, width: 0.5),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center, // تراز عمودی وسط برای تمام عناصر
        children: [
          // آیکون دوربین
          CupertinoButton(
            padding: EdgeInsets.zero,
            minSize: 36, // حداقل اندازه برای یکسان سازی
            onPressed: () {},
            child: const Icon(
              CupertinoIcons.camera,
              color: CupertinoColors.activeBlue,
              size: 28,
            ),
          ),

          // فیلد متن
          Expanded(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 8),
              constraints: BoxConstraints(
                minHeight: 36, // حداقل ارتفاع برابر با آیکون‌ها
              ),
              padding: const EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                color: CupertinoColors.white,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: CupertinoColors.systemGrey4,
                  width: 0.5,
                ),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Align(
                      alignment: Alignment.center, // تراز متن در وسط عمودی
                      child: CupertinoTextField(
                        controller: inputController,
                        placeholder: "Message",
                        placeholderStyle: const TextStyle(
                          color: CupertinoColors.systemGrey,
                          fontSize: 16,
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 8), // padding عمودی
                        decoration: null,
                        style: const TextStyle(fontSize: 16),
                        maxLines: null,
                        minLines: 1,
                        onChanged: (_) {
                          setState(() {});
                        },
                      ),
                    ),
                  ),
                  // آیکون smiley
                  CupertinoButton(
                    padding: EdgeInsets.zero,
                    minSize: 24,
                    onPressed: () {},
                    child: const Icon(
                      CupertinoIcons.smiley,
                      color: CupertinoColors.systemGrey,
                      size: 24,
                    ),
                  ),
                ],
              ),
            ),
          ),

          // آیکون میکروفون یا ارسال
          inputController.text.trim().isEmpty
              ? CupertinoButton(
            padding: EdgeInsets.zero,
            minSize: 36,
            onPressed: () {},
            child: const Icon(
              CupertinoIcons.mic,
              color: CupertinoColors.activeBlue,
              size: 28,
            ),
          )
              : CupertinoButton(
            padding: EdgeInsets.zero,
            minSize: 36,
            onPressed: () {
              controller.sendMessage(inputController.text);
              inputController.clear();
              controller.refresh();
            },
            child: Container(
              height: 36,
              width: 36,
              decoration: const BoxDecoration(
                color: CupertinoColors.activeBlue,
                shape: BoxShape.circle,
              ),
              child: const Center(
                child: Icon(
                  CupertinoIcons.arrow_up,
                  color: CupertinoColors.white,
                  size: 20,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  TextDirection getTextDirection(String text) {
    final isRtl = RegExp(r'^[\u0600-\u06FF]').hasMatch(text);
    return isRtl ? TextDirection.rtl : TextDirection.ltr;
  }
}
