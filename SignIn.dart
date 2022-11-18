import 'package:chatting_application/message_screen.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import "package:firebase_auth/firebase_auth.dart";

import 'forgot_pw_page.dart';

void main() => runApp(const SignIn());
class SignIn extends StatelessWidget {
  const SignIn({Key? key}) : super(key: key);
  static const String _title = 'chatting_application';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: Scaffold(
        appBar: AppBar(title: const Text(_title)),
        body: const MyStatefulWidget(),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: <Widget>[
            Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(10),
                child: const Text(
                  'LOGIN',
                  style: TextStyle(fontSize: 20),
                )),

            Container(
              padding: const EdgeInsets.all(10),
              child: TextFormField(
                validator: RequiredValidator(errorText: 'Required'),
                autovalidateMode: AutovalidateMode.onUserInteraction,
                controller: nameController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Username',
                ),
              ),
            ),

            Container(
             padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: TextFormField(
                validator: RequiredValidator(errorText: 'Required'),
                autovalidateMode: AutovalidateMode.onUserInteraction,
                obscureText: true,
                controller: passwordController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                ),
              ),
            ),
            Container(
    height: 50,
    padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
    child: ElevatedButton(
    child: const Text('Login'),
                  onPressed: () async{
      print('login');
                    try {
                      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
                          email: nameController.text,
                          password: passwordController.text
                      ).then((value) {
                        if (value.user != null){
                          print('Login Success');
                          Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return message_screen();
                                  },
                                ),
                              );
                        }
                      });


                    } on FirebaseAuthException catch (e) {
                      if (e.code == 'user-not-found') {
                        print('No user found for that email.');
                      } else if (e.code == 'wrong-password') {
                        print('Wrong password provided for that user.');
                      }else{
                        print(e);
                      }
                    }
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) {
                    //       return message_screen();
                    //     },
                    //   ),
                    // );
                  },
                )),
          SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: (){
                    Navigator.push(context,
                    MaterialPageRoute(builder: (context){
                      return ForgotPasswordPage();
          },),);
          },
                  child: Text(
                      'Forgot Password?',
                  style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,

                  ),),

                ),
              ],

            ),
          ),
            SizedBox(height: 10,),
            Row(
              children: <Widget>[
                const Text('Does not have account?Sign up with'),
              ],
              mainAxisAlignment: MainAxisAlignment.center,
            ),

          ],
        ));
  }
}


