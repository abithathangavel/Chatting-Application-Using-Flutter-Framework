import 'package:chatting_application/constants.dart';
import 'package:chatting_application/recent_message.dart';
import 'package:flutter/material.dart';

import '/body.dart';
import 'ChatMessage.dart';
import 'chatting_card.dart';

class ChatsScreen extends StatefulWidget {
  const ChatsScreen({Key? key, this.gender}) : super(key: key);

  final String? gender;
  @override
  _ChatsScreenState createState() => _ChatsScreenState();
}

class _ChatsScreenState extends State<ChatsScreen> {
  int _selectedIndex = 0;
  var text = [];
  List<ChatMessage> v = [];
  TextEditingController _controller = TextEditingController();
  @override
  void initState() {
    v = demoChatMessages;
    print(v);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: Column(
        children: [
          Expanded(
              child: ListView(
            children:
                v.map((e) => Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding:
                        const EdgeInsets.symmetric(horizontal: kDefaultPadding),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              e.text,
                              style:
                              TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                            ),
                            SizedBox(height: 8),
                          ],
                        ),
                      ),
                    ),
                    Opacity(
                      opacity: 0.64,
                      child: Text(e.messageStatus == MessageStatus.viewed ? 'Seen' : ''),
                    ),
                  ],
                ),).toList(),
          )),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _controller,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter Text Message',
                  ),
                ),
              ),
              IconButton(
                  onPressed: () {
                    setState(() {
                      if (_controller.text.length > 0) {
                        text.add(_controller.text);
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text("Text is empty"),
                        ));
                      }
                    });
                    print(text);
                    ChatMessage c = ChatMessage(
                        text: _controller.text,
                        messageType: ChatMessageType.text,
                        messageStatus: MessageStatus.not_view,
                        isSender: true);

                    print(_controller.text);
                    _controller.clear();

                    setState(() {
                      v.add(c);
                      print(v);
                    });
                  },
                  icon: Icon(Icons.send))
            ],
          )
        ],
      ),
      bottomNavigationBar: buildBottomNavigationBar(),
    );
  }

  BottomNavigationBar buildBottomNavigationBar() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: _selectedIndex,
      onTap: (value) {
        if(value==1){
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => recent_message(),
            ),
          );
        }
        setState(() {
          _selectedIndex = value;
        });
      },
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.messenger), label: "Chats"),
        BottomNavigationBarItem(icon: Icon(Icons.people), label: "People"),

        BottomNavigationBarItem(
          icon: CircleAvatar(
            radius: 14,
            backgroundImage: widget.gender == 'Male' ? AssetImage("assets/img_4.png") : AssetImage("assets/img_7.png6"),
          ),
          label: "Profile",
        ),
      ],
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      automaticallyImplyLeading: true,
      title: Text("Chats"),
    );
  }
}
