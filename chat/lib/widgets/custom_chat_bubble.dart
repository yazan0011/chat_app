import 'package:chat/model/message.dart';
import 'package:chat/widgets/constant.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types
class chatBubble extends StatelessWidget {
  const chatBubble({super.key, required this.message});
  final Message message;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        padding: const EdgeInsets.all(16),
        margin: const EdgeInsets.all(10),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(35),
            topRight: Radius.circular(35),
            bottomRight: Radius.circular(35),
          ),
          color: kDefaultColor,
        ),
        child: Text(
          message.message,
          style: const TextStyle(
            color: Colors.white,
            fontFamily: 'PlaypenSans',
          ),
        ),
      ),
    );
  }
}

// ignore: camel_case_types
class chatBubbleForFriend extends StatelessWidget {
  const chatBubbleForFriend({super.key, required this.message});
  final Message message;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        padding: const EdgeInsets.all(16),
        margin: const EdgeInsets.all(10),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(35),
            topRight: Radius.circular(35),
            bottomLeft: Radius.circular(35),
          ),
          color: Color.fromARGB(255, 24, 148, 215),
        ),
        child: Text(
          message.message,
          style: const TextStyle(
            color: Colors.white,
            fontFamily: 'PlaypenSans',
          ),
        ),
      ),
    );
  }
}
