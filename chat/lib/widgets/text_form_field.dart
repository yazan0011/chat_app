import 'package:flutter/material.dart';

// ignore: must_be_immutable, camel_case_types
class costomFormTextField extends StatelessWidget {
  costomFormTextField(
      {super.key,
      this.onChanged,
      required this.textubov,
      this.secureText = false});
  String textubov;
  Function(String)? onChanged;
  bool? secureText;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
      ),
      child: TextFormField(
        obscureText: secureText!,
        validator: (value) {
          if (value!.isEmpty) return 'this field is required';
          return null;
        },
        onChanged: onChanged,
        decoration: InputDecoration(
          label: Text(
            textubov,
            style: const TextStyle(
                fontSize: 20, color: Color.fromARGB(255, 255, 255, 255)),
          ),
          hintStyle: const TextStyle(
            color: Colors.white,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(
              color: Colors.white,
            ),
          ),
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
            borderSide: BorderSide(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
