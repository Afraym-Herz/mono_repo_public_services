import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';

/// - Use `AppLogger.error()` for errors/exceptions.
/// - Use `AppLogger.info()` for informational messages.
/// - Use `AppLogger.success()` for operation confirmations.
/// - Use `AppLogger.debug()` for detailed debug data.

class AppLogger {
  AppLogger._();

  static final Logger logger = Logger(
    printer: PrettyPrinter(
      methodCount: 2,
      errorMethodCount: 8,
      lineLength: 120,
      colors: true,
      printEmojis: true,
    ),
    level: kDebugMode ? Level.trace : Level.off,
  );

  static void error(String message, [dynamic error, StackTrace? stackTrace]) {
    logger.e(message, error: error, stackTrace: stackTrace);
  }

  static void info(String message) {
    logger.i(message);
  }

  static void success(String message) {
    logger.t(message);
  }

  static void debug(String message) {
    logger.d(message);
  }

  static void warning(String message) {
    logger.w(message);
  }
}
