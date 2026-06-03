import 'package:chat_app/constants.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kDarkColor1,
        title: Text("Chat"),
        // centerTitle: true,
        // leading: Icon(Icons.add),
        // actions: [
        //   Icon(Icons.phone),
        //   Icon(Icons.video_call),
        //   Icon(Icons.more_vert)
        // ],
      ),
      body: Column(),
      bottomSheet: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextField(),
      ),
    );
  }
}
