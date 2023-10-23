import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moa_diary_app/src/page/logged_in/dashboard/bloc/dashboard_bloc.dart';
import 'package:moa_diary_app/src/page/logged_in/dashboard/dashboard_view.dart';

class DashBoardPage extends StatelessWidget {
  const DashBoardPage({Key? key}) : super(key: key);

  static const routeName = '/dashboard';

  static Route route() {
    return MaterialPageRoute(
      builder: (context) => DashBoardPage(),
      settings: RouteSettings(
        name: routeName,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DashboardBloc(),
      child: DashBoardView(),
    );
  }
}
