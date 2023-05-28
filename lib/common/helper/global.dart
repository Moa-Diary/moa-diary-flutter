import 'package:flutter/cupertino.dart';

class Global {
  static final key = GlobalKey<NavigatorState>();

  static final context = key.currentContext!;
}