import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:moa_diary_app/common/common.dart';
import 'package:moa_diary_app/moa_diary_data/moa_diary_data.dart';
import 'package:moa_diary_app/moa_diary_domain/moa_diary_domain.dart';
import 'package:moa_diary_app/src/app.dart';

import 'firebase_options.dart';

void main() async {
  runZonedGuarded(_runApp, _onError);
}

Future<void> _runApp() async {
  WidgetsFlutterBinding.ensureInitialized();

  await _initializeFirebase();

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(Phoenix(
      child: InitializeView(
    builder: (repositories) => App(
      repositories: repositories,
    ),
    onInitialize: _onInitialize,
  )));
}

void _onError(Object error, StackTrace stack) {
  Logger.log(
    '[onError] ${error.runtimeType}',
    error: error,
    stackTrace: stack,
  );
}

Future<List<RepositoryProvider>> _onInitialize() async {
  final repositoryProvider = [
    RepositoryProvider<AuthenticationRepository>(
      create: (context) => AuthenticationDataRepository(),
    )
  ];

  Logger.log('=========== Moa Started! ===========');

  return repositoryProvider;
}

Future<void> _initializeFirebase() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
}
