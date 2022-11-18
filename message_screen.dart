import 'package:chatting_application/constants.dart';
import 'package:flutter/material.dart';

import '/body.dart';

class message_screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: Body(),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      automaticallyImplyLeading: false,
    );
  }
}