import 'package:chatting_application/chat.dart';
import 'package:chatting_application/chats_screen.dart';
import 'package:chatting_application/filled_outline_button.dart';
import 'package:chatting_application/constants.dart';
import 'package:chatting_application/Chat.dart';
import 'package:chatting_application/message_screen.dart';
import 'package:flutter/material.dart';
import 'chat_card.dart';
import 'chat.dart' as chat;

class recent_message extends StatefulWidget {
  const recent_message({Key? key})
      : super(key: key);
  @override
  State<recent_message> createState() => recent_messageState();


}

class recent_messageState extends State<recent_message> {
  List<chat.Chat> cd = [];
  @override
  void initState() {
    cd = chat.chatsData;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(
                  kDefaultPadding, 0, kDefaultPadding, kDefaultPadding),
              color: kPrimaryColor,
              child: Row(
                children: [
                  FillOutlineButton(press: () {
                    setState(() {
                      cd = chat.chatsData;
                    });
                  }, text: "Recent Message"),

                  SizedBox(width: kDefaultPadding),
                  FillOutlineButton(
                    press: () {
                      setState(() {
                        cd  = chat.chatsData.where((element) => element.isActive).toList();
                      });
                    },
                    text: "Active",
                    isFilled: false,
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: cd.length,
                itemBuilder: (context, index) => ChatCard(
                  chat: cd[index],
                  press: () {
                    // showAlert();
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
