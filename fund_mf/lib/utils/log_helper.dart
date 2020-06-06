import 'package:logger/logger.dart';

class LoggingHelper {
  static final logger = Logger(
    printer: PrettyPrinter(
      lineLength: 120, // width of the output
      colors: true, // Colorful log messages
      printEmojis: true,
    ),
  );
}
