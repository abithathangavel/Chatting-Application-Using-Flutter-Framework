import 'package:chatting_application/SignIn.dart';
import 'package:chatting_application/SignUp.dart';
import 'package:chatting_application/primary_button.dart';
import 'package:chatting_application/constants.dart';
import 'package:chatting_application/chats_screen.dart';
import 'package:flutter/material.dart';

class signin_or_signup_screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
          child: Column(
            children: [
              Spacer(flex: 2),
              Image.asset(
                "assets/img_2.png",
                height: 146,
              ),
              Spacer(),
              PrimaryButton(
                text: "Sign In",
                press: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return SignIn();
                      },
                    ),
                  );
                }
              ),
              SizedBox(height: kDefaultPadding * 1.5),
              PrimaryButton(
                color: Theme.of(context).colorScheme.secondary,
                text: "Sign Up",
                  press: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return SignUp();
                        },
                      ),
                    );
                  }
              ),
              Spacer(flex: 2),
            ],
          ),
        ),
      ),
    );
  }
}