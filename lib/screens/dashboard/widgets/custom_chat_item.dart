import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../models/chat_item.dart';
import '../../chat/chat.dart';

class CupertinoStyleChatItem extends StatelessWidget {
  final ChatItem item;
  final VoidCallback? onTap;

  const CupertinoStyleChatItem({
    Key? key,
    required this.item,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoTheme(
      data: CupertinoTheme.of(context),
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () => Get.to(() => ChatPage(), transition: Transition.rightToLeft),
        child: Container(
          height: 76,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              _buildAvatar(context),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildHeader(context),
                    const SizedBox(height: 4),
                    _buildMessagePreview(context),
                  ],
                ),
              ),
              // ستون سمت راست (زمان و وضعیت)
              _buildRightColumn(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAvatar(BuildContext context) {
    return Container(
      width: 45,
      height: 45,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
          image: AssetImage(item.avatarPath),
          fit: BoxFit.cover,
        ),
        border: Border.all(
          color: CupertinoDynamicColor.withBrightness(
            color: CupertinoColors.systemGrey5,
            darkColor: CupertinoColors.systemGrey2,
          ),
          width: 0.25,
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            item.name,
            style: CupertinoTheme.of(context).textTheme.textStyle.copyWith(
              fontSize: 18,
              color: Colors.black87,
              fontWeight: FontWeight.w600,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }

  Widget _buildMessagePreview(BuildContext context) {
    return Row(
      children: [
        Icon(
          item.unreadCount > 0
              ? CupertinoIcons.checkmark_alt_circle_fill
              : CupertinoIcons.check_mark,
          size: 16,
          color: item.unreadCount > 0
              ? CupertinoColors.systemBlue
              : CupertinoColors.systemGrey,
        ),
        const SizedBox(width: 4),
        Expanded(
          child: Text(
            item.message,
            style: CupertinoTheme.of(context).textTheme.textStyle.copyWith(
              fontSize: 15,
              color: CupertinoColors.systemGrey,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }

  Widget _buildRightColumn(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          item.time,
          style: TextStyle(
            fontSize: 12,
            color: CupertinoDynamicColor.withBrightness(
              color: CupertinoColors.systemGrey,
              darkColor: CupertinoColors.systemGrey2,
            ),
          ),
        ),
        if (item.unreadCount > 0) ...[
          const SizedBox(height: 6),
          Container(
            width: 20,
            height: 20,
            alignment: Alignment.center,
            decoration: const BoxDecoration(
              color: CupertinoColors.systemBlue,
              shape: BoxShape.circle,
            ),
            child: Text(
              item.unreadCount > 9 ? '9+' : item.unreadCount.toString(),
              style: const TextStyle(
                color: CupertinoColors.white,
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ],
    );
  }
}