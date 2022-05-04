import 'package:flutter/material.dart';
import 'package:pos/constants/constants.dart';
import 'package:pos/services/app_service.dart';
import 'package:get/get.dart';
import 'package:pos/widgets/text_widget.dart';

class ChangeLanguageWidget extends StatelessWidget {
  const ChangeLanguageWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
          ),
          onPressed: () => AppService.onChangeLanguage(lang: "kh"),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 10,
              horizontal: 20,
            ),
            child: TextWidget(
              color: textColor,
              text: "khmer".tr,
              height: 1.5,
              fontFamily: "Siemreap",
            ),
          ),
        ),
        const SizedBox(width: 5),
        ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
          ),
          onPressed: () => AppService.onChangeLanguage(lang: "en"),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 10,
              horizontal: 20,
            ),
            child: TextWidget(
              color: textColor,
              text: "english".tr,
              height: 1.5,
              fontFamily: "Roboto",
            ),
          ),
        ),
      ],
    );
  }
}
