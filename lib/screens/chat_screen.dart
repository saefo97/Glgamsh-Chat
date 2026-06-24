import 'package:chat_app/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../components/loading_screen.dart';

class ChatScreen extends StatefulWidget {
  ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  TextEditingController message = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final FirebaseAuth _auth = FirebaseAuth.instance;

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
      endDrawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              title: Text("Log Out"),
              leading: Icon(Icons.exit_to_app),
              onTap: () async {
                await FirebaseAuth.instance.signOut();
              },
            ),
          ],
        ),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection("messages")
            .orderBy("time")
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return LoadingScreen();
          }
          if (snapshot.data!.size == 0 || snapshot.data == null) {
            return Center(child: Text("No Messages yet!"));
          }

          return ListView.builder(
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, index) {
              return Column(
                crossAxisAlignment:
                    snapshot.data!.docs[index]['sender'] ==
                        _auth.currentUser!.email
                    ? CrossAxisAlignment.end
                    : CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(snapshot.data!.docs[index]['sender']),
                  Container(
                    margin: EdgeInsets.only(bottom: 8),
                    alignment:
                        snapshot.data!.docs[index]['sender'] ==
                            _auth.currentUser!.email
                        ? AlignmentGeometry.centerRight
                        : AlignmentGeometry.centerLeft,
                    child: Container(
                      constraints: BoxConstraints(
                        maxWidth: MediaQuery.of(context).size.width * 0.75,
                      ),
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        borderRadius:
                            snapshot.data!.docs[index]['sender'] ==
                                _auth.currentUser!.email
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
                        color:
                            snapshot.data!.docs[index]['sender'] ==
                                _auth.currentUser!.email
                            ? kLightColor1
                            : kDarkColor2,
                      ),
                      child: Text(
                        snapshot.data!.docs[index]['message'],
                        style: TextStyle(
                          color:
                              snapshot.data!.docs[index]['sender'] ==
                                  _auth.currentUser!.email
                              ? Colors.black
                              : Colors.white,
                          fontSize: 18,
                          fontFamily: "times",
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
            padding: EdgeInsets.all(8),
          );
        },
      ),
      bottomSheet: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Expanded(
              child: TextField(
                controller: message,
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
              onPressed: () async {
                await FirebaseFirestore.instance.collection("messages").add({
                  'message': message.text,
                  'time': DateTime.now(),
                  'sender': FirebaseAuth.instance.currentUser!.email,
                });
                message.clear();
              },
              icon: Icon(Icons.send),
            ),
          ],
        ),
      ),
    );
  }
}
