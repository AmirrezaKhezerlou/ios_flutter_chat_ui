import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:modern_chat_ui/screens/chat/chat.dart';
import 'package:modern_chat_ui/screens/dashboard/widgets/custom_chat_item.dart';
import 'package:modern_chat_ui/screens/dashboard/widgets/storyItem.dart';
import 'package:modern_chat_ui/utils/consts.dart';
import '../../models/chat_item.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: CupertinoColors.systemGroupedBackground,
      navigationBar: CupertinoNavigationBar(
        middle: Text("Chats", style: TextStyle(fontWeight: FontWeight.bold)),
        trailing: CupertinoButton(
          padding: EdgeInsets.zero,
          child: Icon(CupertinoIcons.ellipsis),
          onPressed: () {},
        ),
      ),
      child: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                SizedBox(height: AppUtils.appPadding),
                _buildStoriesSection(context),
                Expanded(child: _buildChatSection(context)),
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.only(bottom: 60),
                child: _buildMiddleButton(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStoriesSection(BuildContext context) {
    final namesList = ['Amir Hossein', 'Hamed', 'Sajjad', 'Amirreza', 'Reza'];
    final assetsList = ['man1', 'man2', 'man3', 'man4', 'man1'];
    return SizedBox(
      height: 100.0,
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: namesList.length + 1,
        itemBuilder: (context, index) {
          if (index == 0) {
            return AddStoryWidget();
          } else {
            return StoryItemWidget(
              img: 'assets/images/${assetsList[index - 1]}.jpg',
              name: namesList[index - 1],
            );
          }
        },
      ),
    );
  }

  Widget _buildChatSection(BuildContext context) {
    final namesList = ['Amir Hossein', 'Hamed', 'Sajjad', 'Amirreza', 'Matin'];
    final assetsList = ['man1', 'man2', 'man3', 'man4', 'man5'];
    final List<ChatItem> chats = List.generate(5, (index) {
      return ChatItem(
        name: namesList[index],
        message: 'Please help me find a good monitor for the design',
        time: '02:1${index % 10}',
        avatarPath: 'assets/images/${assetsList[index]}.jpg',
        unreadCount: index % 3 == 0 ? 2 : 0,
      );
    });

    return CupertinoScrollbar(
      child: ListView.builder(
        itemCount: chats.length,
        itemBuilder: (context, index) => CupertinoStyleChatItem(item:chats[index]),
      ),
    );
  }



  Widget _buildMiddleButton() {
    return CupertinoButton.filled(
      borderRadius: BorderRadius.circular(24),
      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 10),
      onPressed: () {
        showCupertinoModalPopup(
          context: context,
          builder: (context) => _buildCupertinoActionSheet(),
        );
      },
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: const [
          Icon(CupertinoIcons.plus_bubble, size: 20),
          SizedBox(width: 10),
          Text('New Chat'),
        ],
      ),
    );
  }

  Widget _buildCupertinoActionSheet() {
    return CupertinoActionSheet(
      title: const Text('Start something new'),
      actions: [
        CupertinoActionSheetAction(
          onPressed: () {},
          child: const Text("New Chat"),
        ),
        CupertinoActionSheetAction(
          onPressed: () {},
          child: const Text("New Contact"),
        ),
        CupertinoActionSheetAction(
          onPressed: () {},
          child: const Text("New Community"),
        ),
      ],
      cancelButton: CupertinoActionSheetAction(
        isDefaultAction: true,
        onPressed: () => Navigator.pop(context),
        child: const Text("Cancel"),
      ),
    );
  }
}
