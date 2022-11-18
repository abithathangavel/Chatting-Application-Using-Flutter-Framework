import 'package:chatting_application/constants.dart';
import 'package:chatting_application/signin_or_signup_screen.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Spacer(flex: 2),
              Image.asset("assets/img.png"),
              Spacer(flex: 3),

              Text("Welcome to my Chatting Application \nmessaging app",
                textAlign: TextAlign.center,
                style: Theme.of(context)
                    .textTheme
                    .headline5!
                    .copyWith(fontWeight: FontWeight.bold),
              ),
              Spacer(),
              Text(
                "Freedom talk any person of your \nmother language.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Theme.of(context)
                      .textTheme
                      .bodyText1!
                      .color!
                      .withOpacity(0.64),
                ),
              ),
              Spacer(flex: 3),
              FittedBox(
                child: TextButton(
                    onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => signin_or_signup_screen(),
                      ),
                    ),
                    child: Row(
                      children: [

                        ElevatedButton(
                            child: Text("Tap to Continue"),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return signin_or_signup_screen();
                                  },
                                ),
                              );
                            }
                        ),
                      ],
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}