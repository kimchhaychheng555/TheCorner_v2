import 'package:flutter/material.dart';

class AddProductWidget extends StatelessWidget {
  const AddProductWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height - 125,
    );
  }
}
