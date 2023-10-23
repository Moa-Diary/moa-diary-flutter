import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moa_diary_app/src/page/logged_in/chat/bloc/chat_bloc.dart';
import 'package:moa_diary_app/src/page/logged_in/chat/chat_view.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({Key? key}) : super(key: key);

  static const routeName = '/chat';

  static Route route() {
    return MaterialPageRoute(
      builder: (context) => ChatPage(),
      settings: RouteSettings(
        name: routeName,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ChatBloc(),
      child: ChatView(),
    );
  }
}
