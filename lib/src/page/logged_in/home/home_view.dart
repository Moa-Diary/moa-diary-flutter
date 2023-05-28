import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moa_diary_app/src/page/logged_in/home/bloc/home_page_bloc.dart';

class HomeView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeViewState();
  }
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomePageBloc, HomePageState>(
      listener: _blocListener,
      builder: (context, state) {
        return Scaffold();
      },
    );
  }

  void _blocListener(
    BuildContext context,
    HomePageState state,
  ) {}
}
