import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moa_diary_app/src/page/logged_in/home/bloc/home_page_bloc.dart';

import 'home_view.dart';

class HomePage extends StatefulWidget {
  static String routeName = '/home';

  static Route route() {
    return MaterialPageRoute(
      builder: (context) => HomePage(),
      settings: RouteSettings(
        name: routeName,
      ),
    );
  }

  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomePageBloc(),
      child: HomeView(),
    );
  }
}
