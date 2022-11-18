import 'package:chatting_application/chat.dart';
import 'package:chatting_application/chats_screen.dart';
import 'package:chatting_application/filled_outline_button.dart';
import 'package:chatting_application/constants.dart';
import 'package:chatting_application/Chat.dart';
import 'package:chatting_application/message_screen.dart';
import 'package:flutter/material.dart';
import 'chat_card.dart';
import 'chat.dart' as chat;

class Body extends StatefulWidget {
  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  List<chat.Chat> cd = [];
  @override
  void initState() {
    cd = chat.chatsData;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.fromLTRB(
              kDefaultPadding, 0, kDefaultPadding, kDefaultPadding),
          color: kPrimaryColor,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(children: [
                  FillOutlineButton(
                      press: () {
                        setState(() {
                          cd = chat.chatsData;
                        });
                      },
                      text: "Recent Message"),
                  SizedBox(width: kDefaultPadding),
                  FillOutlineButton(
                    press: () {
                      setState(() {
                        cd = chat.chatsData
                            .where((element) => element.isActive)
                            .toList();
                      });
                    },
                    text: "Active",
                    isFilled: false,
                  ),

                ],),

            CircleAvatar(
                radius: 25,
                backgroundImage: AssetImage('assets/img_2.png'),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Align(
                    alignment: Alignment.topRight,
                  ),
                )),
          ]),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: cd.length,
            itemBuilder: (context, index) => ChatCard(
              chat: cd[index],
              press: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return showAlert(cd[index].gender);
                  },
                );
                // showAlert();
              },
            ),
          ),
        ),
      ],
    );
  }

  AlertDialog showAlert(String gender) {
    // Create AlertDialog
    return AlertDialog(
      content: Text("Send friend request to connect with people"),
      actions: [
        FlatButton(
          child: Text("Send"),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ChatsScreen(gender: gender),
              ),
            );
          },
        ),
        FlatButton(
          child: Text("Cancel"),
          onPressed: () {
            Navigator.of(context, rootNavigator: true).pop('dialog');
          },
        ),
      ],
    );
  }

  showAlertDialog(BuildContext context) {
    // Create button

    // show the dialog
  }
}
