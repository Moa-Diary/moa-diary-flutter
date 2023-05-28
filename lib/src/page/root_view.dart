import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:moa_diary_app/src/page/bloc/root_page_bloc.dart';

import 'logged_in/home/home_page.dart';
import 'logged_out/sign_in/sign_in.dart';

class RootView extends StatefulWidget {
  const RootView({super.key});

  @override
  State<StatefulWidget> createState() {
    return _RootViewState();
  }
}

class _RootViewState extends State<RootView> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RootPageBloc, RootPageState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: Center(
            child: SvgPicture.asset('assets/icon/logo.svg'),
          ),
        );
      },
      listener: _blocListener,
    );
  }

  void _blocListener(
    BuildContext context,
    RootPageState state,
  ) {
    if (state is RootPageStateMoveToSignInPage) {
      Navigator.pushAndRemoveUntil(
        context,
        SignInPage.route(),
        (route) => false,
      );
      return;
    }
    if (state is RootPageStateAuthCheckSuccess) {
      Navigator.pushAndRemoveUntil(
        context,
        HomePage.route(),
        (route) => false,
      );
      return;
    }
  }
}
