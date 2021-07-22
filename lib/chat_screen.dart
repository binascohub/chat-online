import 'package:flutter/material.dart';
import 'package:chat_online/text_composer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';


class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {

  void _sendMessage(String text) async{
    await Firebase.initializeApp();
    FirebaseFirestore.instance.collection('messages').doc().set({
      'text':text
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ola"),
        elevation: 0,
      ),
      body: TextComposer(_sendMessage),
    );
  }
}
