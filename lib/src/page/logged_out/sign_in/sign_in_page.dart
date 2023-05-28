import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moa_diary_app/moa_diary_domain/authentication/authentication.dart';
import 'package:moa_diary_app/src/page/logged_out/sign_in/bloc/sign_in_page_bloc.dart';
import 'package:moa_diary_app/src/page/logged_out/sign_in/sign_in_view.dart';

class SignInPage extends StatefulWidget {
  static String routeName = '/sign_in';

  static Route route() {
    return MaterialPageRoute(
      builder: (context) => SignInPage(),
      settings: RouteSettings(name: routeName),
    );
  }

  @override
  State<StatefulWidget> createState() {
    return _SignInPageState();
  }
}

class _SignInPageState extends State<SignInPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignInPageBloc(
        authenticationRepository: context.read<AuthenticationRepository>(),
      ),
      child: SignInView(),
    );
  }
}
