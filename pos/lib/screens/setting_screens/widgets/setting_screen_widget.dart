import 'package:flutter/material.dart';
import 'package:pos/widgets/text_widget.dart';

class SettingScreenWidget extends StatelessWidget {
  final String? title;
  final Icon? icon;
  final Color? color;
  const SettingScreenWidget({
    Key? key,
    this.title,
    this.icon,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(20),
      child: ListTile(
        leading: Icon(
          Icons.account_circle,
          color: Colors.blue,
          size: 40,
        ),
        trailing: Icon(Icons.arrow_forward_ios),
        title: TextWidget(
          text: "account_setting",
          fontSize: 18,
          color: Colors.black,
        ),
      ),
    );
  }
}
