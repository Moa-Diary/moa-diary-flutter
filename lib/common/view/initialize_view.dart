import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moa_diary_app/common/common.dart';

class InitializeView extends StatefulWidget {
  const InitializeView({
    super.key,
    required this.builder,
    required this.onInitialize,
  });

  final Function(List<RepositoryProvider> repositories) builder;
  final Function() onInitialize;

  @override
  State<StatefulWidget> createState() {
    return _InitializeViewState();
  }
}

class _InitializeViewState extends State<InitializeView> {
  Future<List<RepositoryProvider>> _repositories = Future.value([]);

  @override
  void initState() {
    super.initState();
    _repositories = widget.onInitialize();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _repositories,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          Logger.log(snapshot.error.toString());
        }
        if (snapshot.connectionState == ConnectionState.done) {
          return widget.builder(snapshot.data as List<RepositoryProvider>);
        }

        return Material(
          child: Container(),
        );
      },
    );
  }
}
