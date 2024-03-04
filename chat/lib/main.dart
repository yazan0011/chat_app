import 'package:chat/screens/chat_page.dart';
import 'package:chat/screens/sign_in.dart';
import 'package:chat/screens/sign_up.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const scholarChat());
}

// ignore: camel_case_types
class scholarChat extends StatelessWidget {
  const scholarChat({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
        brightness: Brightness.dark,
      ),
      routes: {
        sign_in.id: (context) => const sign_in(),
        sign_up.id: (context) => const sign_up(),
        chatPage.id: (context) => chatPage()
      },
      debugShowCheckedModeBanner: false,
      initialRoute: sign_in.id,
    );
  }
}
