import 'package:flutter/material.dart';
import 'package:moa_diary_app/common/common.dart';
import 'package:moa_diary_app/src/page/logged_in/chat/widget/other_message_tile.dart';
import 'package:moa_diary_app/src/page/logged_in/chat/widget/self_message_tile.dart';

class SelfChatTile extends StatelessWidget {
  const SelfChatTile({
    Key? key,
    required this.messages,
  }) : super(key: key);

  final List<String> messages;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: messages
                .map(
                  (e) => SelfMessageTile(message: e),
                )
                .toList(),
        ),
      ],
    );
  }
}
