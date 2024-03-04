import 'package:chat/widgets/constant.dart';
import 'package:flutter/material.dart';

// ignore: non_constant_identifier_names
void snack_bar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: ksnackbarColor,
      behavior: SnackBarBehavior.floating,
      margin: const EdgeInsets.all(50),
      elevation: 30,
      content: Text(message),
    ),
  );
}
