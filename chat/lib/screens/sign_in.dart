// ignore_for_file: use_build_context_synchronously

import 'package:chat/helper/snack_bar.dart';
import 'package:chat/screens/chat_page.dart';
import 'package:chat/screens/sign_up.dart';
import 'package:chat/widgets/costom_botton.dart';
import 'package:chat/widgets/text_form_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

// ignore: camel_case_types, must_be_immutable
class sign_in extends StatefulWidget {
  const sign_in({super.key});

  static String id = 'signIn';

  @override
  State<sign_in> createState() => _sign_inState();
}

// ignore: camel_case_types
class _sign_inState extends State<sign_in> {
  String? email, password;

  GlobalKey<FormState> formKey = GlobalKey();
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        body: Form(
          key: formKey,
          child: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [
                Color.fromARGB(255, 77, 127, 198),
                Color.fromARGB(255, 42, 90, 156),
                Color.fromARGB(255, 6, 33, 70),
              ], begin: Alignment.topRight, end: Alignment.bottomLeft),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView(
                children: [
                  const SizedBox(
                    height: 75,
                  ),
                  Image.asset(
                    'assets/images/scholar.png',
                    height: 100,
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Scholar Chat',
                        style: TextStyle(
                          fontSize: 32,
                          color: Colors.white,
                          fontFamily: 'Pacifico',
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 75,
                  ),
                  const Row(
                    children: [
                      Text(
                        'Sign In',
                        style: TextStyle(
                          fontSize: 24,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  costomFormTextField(
                    onChanged: (p0) {
                      email = p0;
                    },
                    textubov: 'email',
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  costomFormTextField(
                    secureText: true,
                    onChanged: (p0) {
                      password = p0;
                    },
                    textubov: 'password',
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  costomBotton(
                    ontap: () async {
                      if (formKey.currentState!.validate()) {
                        isLoading = true;
                        setState(() {});
                        try {
                          await logIn();
                          Navigator.pushNamed(context, chatPage.id,
                              arguments: email);
                        } on FirebaseAuthException catch (ex) {
                          if (ex.code == 'user-not-found') {
                            snack_bar(context, 'No user found for that email.');
                          } else if (ex.code == 'wrong-password') {
                            snack_bar(context,
                                'Wrong password provided for that user.');
                          }
                        }
                        isLoading = false;
                        setState(() {});
                      } else {}
                    },
                    buttonText: 'sign in',
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Don't have an account ? ",
                        style: TextStyle(color: Colors.white),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, sign_up.id);
                        },
                        child: const Text(
                          'sign up',
                          style: TextStyle(
                            color: Color.fromARGB(255, 136, 161, 232),
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> logIn() async {
    // ignore: unused_local_variable
    UserCredential user = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email!, password: password!);
  }
}
