import 'package:flutter/material.dart';
import 'package:moa_diary_app/common/common.dart';
import 'package:moa_diary_app/src/page/logged_in/chat/widget/other_message_tile.dart';

class OtherChatTile extends StatelessWidget {
  const OtherChatTile({
    Key? key,
    required this.messages,
    required this.name,
    required this.profileImage,
  }) : super(key: key);

  final List<String> messages;
  final String name;
  final String profileImage;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ProfileNetworkImage(
          src: profileImage,
          size: 44,
        ),
        SizedBox(
          width: 12,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: TextStyle(
                color: Colors.black,
                fontSize: 15,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 5),
            ...messages
                .map(
                  (e) => OtherMessageTile(message: e),
                )
                .toList(),
          ],
        ),
      ],
    );
  }
}
