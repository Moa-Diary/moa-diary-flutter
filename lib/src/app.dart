import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moa_diary_app/common/common.dart';
import 'package:moa_diary_app/src/page/root_page.dart';

class App extends StatelessWidget {
  const App({
    super.key,
    required this.repositories,
  });

  final List<RepositoryProvider> repositories;

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: repositories,
      child: MaterialApp(
        theme: ThemeData(
          fontFamily: 'Pretendard',
          brightness: Brightness.light,
        ),
        debugShowCheckedModeBanner: false,
        showPerformanceOverlay: false,
        themeMode: ThemeMode.light,
        onGenerateRoute: (settings) => MaterialPageRoute(
          builder: (context) => const RootPage(),
          settings: settings,
        ),
        navigatorKey: Global.key,
        initialRoute: '/',
        navigatorObservers: [
          NavigatorObserver(),
        ],
        builder: (context, child) {
          return child!;
        },
      ),
    );
  }
}
