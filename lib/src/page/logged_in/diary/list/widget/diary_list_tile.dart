import 'package:flutter/material.dart';
import 'package:moa_diary_app/common/common.dart';
import 'package:intl/intl.dart';

class DiaryListTile extends StatelessWidget {
  DiaryListTile({
    Key? key,
    this.userProfileImage = '',
    this.imageUrls = const [],
    this.userName = '',
    this.title = '',
    this.content = '',
    this.likeCount = 0,
    this.commentCount = 0,
    this.isPublic = false,
    this.hashTags = const [],
    this.createdAt = -1,
  }) : super(key: key);

  final String userProfileImage;
  final List<String> imageUrls;
  final String userName;
  final String title;
  final String content;
  final int likeCount;
  final int commentCount;
  final bool isPublic;
  final List<String> hashTags;
  final int createdAt;

  final dateFormatter = DateFormat('MM월 dd일');

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      padding: EdgeInsets.all(30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              ProfileNetworkImage(
                src: userProfileImage,
              ),
              SizedBox(
                width: 12,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    userName,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Color(0x88000000),
                    ),
                  )
                ],
              )
            ],
          ),
          SizedBox(height: 18),
          Text(
            content,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              color: Color(0xFF333333),
              fontSize: 14,
            ),
          ),
          SizedBox(height: 16),
          Row(
            children: hashTags
                .map((e) => Text(
                      '#$e ',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF3F80F2),
                      ),
                    ))
                .toList(),
          ),
          SizedBox(height: 12),
          Row(
            children: [
              Icon(Icons.add),
              SizedBox(width: 8),
              Text(
                '$likeCount',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 12,
                  color: Color(0xFF111111),
                ),
              ),
              SizedBox(width: 12),
              Icon(Icons.add),
              SizedBox(width: 8),
              Text(
                '$commentCount',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 12,
                  color: Color(0xFF111111),
                ),
              ),
              Spacer(),
              Text(
                dateFormatter.format(DateTime.fromMillisecondsSinceEpoch(createdAt)),
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                  color: Color(0xFF222222),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
