import 'dart:developer' as developer;

class Logger {
  static void log(
    String message, {
    Object? error,
    StackTrace? stackTrace,
  }) {
    developer.log(
      message,
      error: error,
      stackTrace: stackTrace,
    );
  }
}
