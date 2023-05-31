import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moa_diary_app/common/common.dart';
import 'package:moa_diary_app/src/page/logged_out/sign_up/bloc/sign_up_page_bloc.dart';

class SignUpView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SignUpViewState();
  }
}

class _SignUpViewState extends State<SignUpView> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignUpPageBloc, SignUpPageState>(
      listener: _blocListener,
      builder: (context, state) {
        return Scaffold(
          appBar: DefaultAppBar(
            title: Text('회원가입'),
          ),
        );
      },
    );
  }

  void _blocListener(BuildContext context, SignUpPageState state,) {

  }
}
