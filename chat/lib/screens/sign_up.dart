// ignore_for_file: use_build_context_synchronously

import 'package:chat/helper/snack_bar.dart';
import 'package:chat/screens/chat_page.dart';
import 'package:chat/widgets/costom_botton.dart';
import 'package:chat/widgets/text_form_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

// ignore: camel_case_types, must_be_immutable
class sign_up extends StatefulWidget {
  const sign_up({super.key});
  static String id = 'signUp';

  @override
  State<sign_up> createState() => _sign_upState();
}

// ignore: camel_case_types
class _sign_upState extends State<sign_up> {
  String? email;

  String? password;

  bool isLoading = false;

  GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        body: Form(
          key: formKey,
          child: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromARGB(255, 77, 127, 198),
                  Color.fromARGB(255, 42, 90, 156),
                  Color.fromARGB(255, 6, 33, 70),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
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
                        'Sign Up',
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
                    onChanged: (data) {
                      email = data;
                    },
                    textubov: 'enter email',
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  costomFormTextField(
                    secureText: true,
                    onChanged: (data) {
                      password = data;
                    },
                    textubov: 'enter password',
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  costomBotton(
                    ontap: () async {
                      isLoading = true;
                      setState(() {});
                      if (formKey.currentState!.validate()) {
                        try {
                          await regester();
                          Navigator.pushNamed(context, chatPage.id,
                              arguments: email);
                        } on FirebaseAuthException catch (ex) {
                          if (ex.code == 'weak-password') {
                            snack_bar(context, 'weak password');
                          } else if (ex.code == 'email-already-in-use') {
                            snack_bar(context, 'email already in use');
                          }
                        } catch (ex) {
                          snack_bar(context, 'there aws an error');
                        }
                      } else {}
                      isLoading = false;
                      setState(() {});
                    },
                    buttonText: 'sign up',
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Alrady have an account ? ",
                        style: TextStyle(color: Colors.white),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: const Text(
                          'sign in',
                          style: TextStyle(
                            color: Color.fromARGB(255, 137, 141, 235),
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

  Future<void> regester() async {
    // ignore: unused_local_variable
    UserCredential user = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email!, password: password!);
  }
}
