import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moa_diary_app/moa_diary_domain/diary/diary.dart';

import 'bloc/diary_list_bloc.dart';
import 'diary_list_view.dart';

class DiaryListPage extends StatelessWidget {
  const DiaryListPage({Key? key}) : super(key: key);

  static const routeName = '/diary/list';

  static Route route() {
    return MaterialPageRoute(
      builder: (context) => const DiaryListPage(),
      settings: const RouteSettings(name: routeName),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DiaryListBloc(
        diaryRepository: context.read<DiaryRepository>(),
      )..add(DiaryListEventEntered()),
      child: const DiaryListView(),
    );
  }
}
