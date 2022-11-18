import 'package:chatting_application/Chat.dart';
import 'package:chatting_application/ChatMessage.dart';
import 'package:flutter/material.dart';
import '../../../constants.dart';

class ChattingCard extends StatelessWidget {
  const ChattingCard({
    Key? key,
    required this.chattings,
    required this.press,
  }) : super(key: key);
  final chattings;
  final VoidCallback press;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: kDefaultPadding, vertical: kDefaultPadding * 0.75),
        child: Row(
          children: [
            Expanded(
              child: Padding(
                padding:
                const EdgeInsets.symmetric(horizontal: kDefaultPadding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      chattings.text,
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
              child: Text(chattings.messageStatus == MessageStatus.viewed ? 'Seen' : ''),
            ),
          ],
        ),
      ),
    );
  }
}