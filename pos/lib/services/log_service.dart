import 'package:intl/intl.dart';
import 'package:pos/services/telegram_service.dart';

class LogService {
  static void sendLog({
    required String user,
    required String logAction,
  }) {
    var _dateTime = DateFormat("yyyy-MM-dd hh:mm a").format(DateTime.now());
    TelegramService.sendMessage(
        "User: $user \nDate: $_dateTime \n==================================\n$logAction");
  }
}
