import 'package:chat/widgets/constant.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types
class loading extends StatelessWidget {
  const loading({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: kDefaultColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(
              flex: 3,
            ),
            Text(
              'Loading ...',
              style: TextStyle(fontSize: 35, fontFamily: 'PlaypenSans'),
            ),
            Spacer(
              flex: 1,
            )
            // Padding(
            //   padding: EdgeInsets.only(top: 20),
            //   child: Text(
            //     'Please wait ...',
            //     style: TextStyle(fontSize: 25, fontFamily: 'PlaypenSans'),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
