import 'package:chat_app/constants.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  ChatScreen({super.key});
  bool isMe = false;
  List<String> X = ["Hello", "Wenk" , "?"];
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
      body: ListView.builder(
        itemCount: X.length,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.only(bottom: 8),
            alignment: isMe
                ? AlignmentGeometry.centerRight
                : AlignmentGeometry.centerLeft,
            child: Container(
              constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width * 0.75,
              ),
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: isMe
                    ? BorderRadius.only(
                        bottomLeft: Radius.circular(32),
                        bottomRight: Radius.circular(32),
                        topLeft: Radius.circular(32),
                      )
                    : BorderRadius.only(
                        bottomLeft: Radius.circular(32),
                        bottomRight: Radius.circular(32),
                        topRight: Radius.circular(32),
                      ),
                color: isMe ? kLightColor1 : kDarkColor2,
              ),
              child: Text(
                X[index],
                style: TextStyle(
                  color: isMe ? Colors.black : Colors.white,
                  fontSize: 18,
                  fontFamily: "times",
                ),
              ),
            ),
          );
        },
        padding: EdgeInsets.all(8),
      ),
      bottomSheet: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Expanded(
              child: TextField(
                minLines: 1,
                maxLines: 5,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Type a message...",
                ),
              ),
            ),
            IconButton(
              color: kDarkColor1,
              onPressed: () {},
              icon: Icon(Icons.send),
            ),
          ],
        ),
      ),
    );
  }
}
