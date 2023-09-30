
import 'package:flutter/material.dart';

import '../Constants/_Globals.dart';

class CommonButton extends StatelessWidget {
  const CommonButton({super.key, required this.text, required this.action});
  final String text;
  final VoidCallback action;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50,
      color: GlobalVariables.secondaryColor,
      child: TextButton(
        onPressed: action,
        child: Text(text,style: const TextStyle(color: Colors.white),),
      ),
    );
  }
}