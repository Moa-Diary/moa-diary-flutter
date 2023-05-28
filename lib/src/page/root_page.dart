import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moa_diary_app/moa_diary_domain/moa_diary_domain.dart';
import 'package:moa_diary_app/src/page/bloc/root_page_bloc.dart';

import 'root_view.dart';

class RootPage extends StatefulWidget {
  const RootPage({super.key});

  static String routeName = '/';

  static Route route() {
    return MaterialPageRoute<void>(
      builder: (context) => const RootPage(),
      settings: RouteSettings(
        name: routeName,
      ),
    );
  }

  @override
  State<StatefulWidget> createState() {
    return _RootPageState();
  }
}

class _RootPageState extends State<RootPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RootPageBloc(
        authenticationRepository: context.read<AuthenticationRepository>(),
      )..add(RootPageEventStarted()),
      child: const RootView(),
    );
  }
}
