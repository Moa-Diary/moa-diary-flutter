import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moa_diary_app/src/page/logged_out/sign_up/bloc/sign_up_page_bloc.dart';

import 'sign_up_view.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  static const routeName = '/sign_up';

  static Route route() {
    return MaterialPageRoute(
      builder: (context) => const SignUpPage(),
      settings: const RouteSettings(
        name: routeName,
      ),
    );
  }

  @override
  State<StatefulWidget> createState() {
    return _SignUpPageState();
  }
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignUpPageBloc(),
      child: SignUpView(),
    );
  }
}
