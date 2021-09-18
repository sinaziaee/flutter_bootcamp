import 'dart:async';

import 'package:bubble/bubble.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:p_08_firebase/constants.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  FirebaseFirestore fireStore = FirebaseFirestore.instance;
  FirebaseAuth auth = FirebaseAuth.instance;
  CollectionReference messageRef =
      FirebaseFirestore.instance.collection('Messages');
  TextEditingController controller = TextEditingController();
  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chat Screen'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
              ),
              child: StreamBuilder<QuerySnapshot>(
                stream: messageRef.snapshots(),
                builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.hasData) {
                    return ListView(
                      controller: scrollController,
                      physics: const AlwaysScrollableScrollPhysics(),
                      children: snapshot.data!.docs.map(
                        (doc) {
                          Map data = doc.data() as Map;
                          bool isMe = data['sender'] == auth.currentUser!.uid;
                          return Bubble(
                            margin: BubbleEdges.only(
                                top: 10,
                                left: isMe ? 10 : 0,
                                right: !isMe ? 10 : 0),
                            nip:
                                (isMe) ? BubbleNip.rightTop : BubbleNip.leftTop,
                            color: (isMe)
                                ? const Color.fromRGBO(225, 255, 199, 1)
                                : Colors.white,
                            alignment:
                                (isMe) ? Alignment.topRight : Alignment.topLeft,
                            child: Text(data['text']),
                          );
                        },
                      ).toList(),
                    );
                  } //
                  else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              ),
            ),
          ),
          Row(
            children: [
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: TextField(
                  onTap: () {
                    Timer(
                      const Duration(milliseconds: 300),
                      () {
                        scrollController.jumpTo(scrollController.position.maxScrollExtent);
                      },
                    );
                  },
                  controller: controller,
                  decoration: kMyInputDecoration.copyWith(
                    hintText: 'Type your message...',
                  ),
                ),
              ),
              const SizedBox(
                width: 5,
              ),
              IconButton(
                icon: const Icon(
                  Icons.send,
                  color: Colors.blue,
                ),
                onPressed: sendMessage,
              ),
            ],
          ),
        ],
      ),
    );
  }

  void sendMessage() {
    String text = controller.text;
    print(text);
    if (text.length <= 2) {
      print('type sth more');
      return;
    }

    Map<String, dynamic> newMap = Map();
    newMap['text'] = text;
    String dateTime = DateTime.now().toString();
    String date = dateTime.substring(0, 10);
    String time = dateTime.substring(11, 19);
    newMap['time'] = time;
    newMap['date'] = date;
    newMap['sender'] = auth.currentUser!.uid;
    newMap['sender_phone'] = auth.currentUser!.phoneNumber;
    controller.clear();
    messageRef.add(newMap).then((value) {
      print(value);
    });
  }
}
