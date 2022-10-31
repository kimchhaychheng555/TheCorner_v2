import 'dart:convert';

import 'package:http/http.dart' as http;

class TelegramService {
  static String chatBot = "1447468812:AAF-avVJ89HS888VRf6ZlvDAXbrTWTKjn0I";
  static String channel = "-1001278261579";

  static Future<bool> sendMessage(String message) async {
    var res = await http.post(
      Uri.parse('https://api.telegram.org/bot$chatBot/sendMessage'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{"chat_id": channel, "text": message}),
    );

    var _return = jsonDecode(res.body);

    return _return["ok"];
  }
}
