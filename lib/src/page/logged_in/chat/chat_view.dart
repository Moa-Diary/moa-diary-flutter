import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moa_diary_app/common/widget/default_app_bar.dart';
import 'package:moa_diary_app/src/page/logged_in/chat/widget/self_chat_tile.dart';

import 'bloc/chat_bloc.dart';
import 'widget/widget.dart';

class ChatView extends StatefulWidget {
  const ChatView({Key? key}) : super(key: key);

  @override
  State<ChatView> createState() => _ChatViewState();
}

class _ChatViewState extends State<ChatView> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ChatBloc, ChatState>(
      listener: _blocListener,
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: DefaultAppBar(
            title: Text('대화하기'),
          ),
          body: Container(
            padding: EdgeInsets.fromLTRB(20, 22, 35, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  '오후 10:00',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF888888),
                  ),
                ),
                SizedBox(height: 18),
                OtherChatTile(
                  profileImage:
                  'https://fujifilm-x.com/wp-content/uploads/2021/01/gfx100s_sample_04_thum-1.jpg',
                  messages: ['안녕 어쩌구', '만나서 어쩌구'],
                  name: 'ChatGPT',
                ),
                SelfChatTile(
                  messages: ['안녕 어쩌구', '만나서 어쩌구'],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _blocListener(BuildContext context, ChatState state) {}
}
