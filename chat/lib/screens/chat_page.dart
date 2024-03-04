import 'package:chat/screens/loading.dart';
import 'package:chat/widgets/constant.dart';
import 'package:chat/widgets/custom_chat_bubble.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:chat/model/message.dart';

// ignore: camel_case_types, must_be_immutable
class chatPage extends StatelessWidget {
  static String id = 'chatPage';
  final ScrollController _controller = ScrollController();

  CollectionReference messages2 =
      FirebaseFirestore.instance.collection('messages2');
  TextEditingController controller1 = TextEditingController();

  chatPage({super.key});

  @override
  Widget build(BuildContext context) {
    var email = ModalRoute.of(context)!.settings.arguments;
    return StreamBuilder<QuerySnapshot>(
      stream: messages2.orderBy('sendedAt', descending: true).snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<Message> messagesList = [];
          for (int i = 0; i < snapshot.data!.docs.length; i++) {
            messagesList.add(
              Message.fromJson(
                snapshot.data!.docs[i],
              ),
            );
          }
          return Scaffold(
            backgroundColor: const Color.fromARGB(255, 2, 39, 55),
            appBar: AppBar(
              automaticallyImplyLeading: false,
              backgroundColor: kDefaultColor,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/scholar.png',
                    height: 50,
                  ),
                  const Text(
                    'scholar chat',
                    style: TextStyle(fontFamily: 'PlaypenSans'),
                  ),
                ],
              ),
            ),
            body: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    reverse: true,
                    controller: _controller,
                    itemCount: messagesList.length,
                    itemBuilder: (context, index) {
                      return messagesList[index].id == email
                          ? chatBubble(
                              message: messagesList[index],
                            )
                          : chatBubbleForFriend(message: messagesList[index]);
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: TextField(
                    controller: controller1,
                    onSubmitted: (value) {
                      messages2.add(
                        {
                          'message': value,
                          'sendedAt': DateTime.now(),
                          'code': email,
                        },
                      );
                      controller1.clear();
                      _controller.animateTo(0,
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeIn);
                    },
                    decoration: InputDecoration(
                      hintText: 'send message',
                      suffixIcon: Builder(builder: (context) {
                        return GestureDetector(
                          onTap: () {},
                          child: const Icon(
                            Icons.send,
                            color: Color.fromARGB(255, 24, 148, 215),
                          ),
                        );
                      }),
                      prefixIcon: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.photo,
                          color: Color.fromARGB(255, 24, 148, 215),
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: const BorderSide(color: kDefaultColor),
                      ),
                      enabledBorder: const OutlineInputBorder(),
                    ),
                  ),
                ),
              ],
            ),
          );
        } else {
          return const loading();
        }
      },
    );
  }
}
