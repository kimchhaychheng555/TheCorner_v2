import 'dart:convert';

import 'package:http/http.dart' as http;

class TelegramService {
  static String chatBot = "5392242770:AAEZDJZcO8_dgxddhPOwb2TtjMQNh9SiolM";
  static String channel = "-1001104294906";

  static Future<bool> sendMessage(String message) async {
    return false;
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
