import 'exports.dart';


class DebugLog {
  static Logger? _logger;

  /// Save log to local storage for web
  /// this function create local storage for web app to store app log
  /// it will only able to show when app is running state
  static Future<void> _saveLogToLocalStorage(String log) async {
    final currentLogs = window.localStorage['logs'] ?? '';
    window.localStorage['logs'] = '$currentLogs$log\n';
  }


  ///generate file
  static Future<File> _getDirectoryForLogRecord() async {
    final Directory directory = await getApplicationDocumentsDirectory();
    var file = File('${directory.path}/logger.txt');
    return file;
  }

  ///write log in file
  static Future<List<LogOutput>> _writeLogInFile() async {
    List<LogOutput> multiOutput = [];
    var file= await _getDirectoryForLogRecord();
    FileOutput fileOutPut = FileOutput(file: file);
    ConsoleOutput consoleOutput = ConsoleOutput();
    multiOutput = [fileOutPut, consoleOutput];
    return multiOutput;
  }


  /// Initialize logger
  static init() async {
    _logger ??= Logger(
      filter: DevelopmentFilter(),
      printer: PrettyPrinter(
        methodCount: 2,
        errorMethodCount: 8,
        lineLength: 120,
        colors: true,
        printEmojis: false,
        dateTimeFormat: DateTimeFormat.dateAndTime,
      ),
      output: !kIsWeb ? MultiOutput(await _writeLogInFile()) :  MultiOutput([ConsoleOutput(), WebOutput()]),
    );
  }

  static void d(dynamic message) {
    if (kDebugMode) {
      _logger?.d(message);
    }
  }

  static void t(dynamic message) {
    if (kDebugMode) {
      _logger?.t(message);
    }
  }

  static void e(dynamic message, [dynamic errors]) {
    if (kDebugMode) {
      _logger?.e(message, error: errors);
    }
  }

  static void w(dynamic message) {
    if (kDebugMode) {
      _logger?.w(message);
    }
  }

  static void i(dynamic message) {
    if (kDebugMode) {
      _logger?.i(message);
    }
  }
}

/// A custom output class for logging to web local storage
/// created override method to write log in local storage
class WebOutput extends LogOutput {
  @override
  void output(OutputEvent event) {
    final logMessage =
        '============================================================================='
        '\n${event.level.name}: ${event.origin.message}'
        '\n=============================================================================';
    DebugLog._saveLogToLocalStorage(logMessage);
  }
}
