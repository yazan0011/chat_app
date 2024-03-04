import 'package:flutter/material.dart';

// ignore: must_be_immutable, camel_case_types
class costomBotton extends StatelessWidget {
  costomBotton({super.key, this.ontap, required this.buttonText});
  String buttonText;
  VoidCallback? ontap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        width: double.infinity,
        height: 50,
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 237, 227, 184),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            buttonText,
            style: const TextStyle(
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
