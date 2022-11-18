import 'package:chatting_application/message_screen.dart';
import 'package:chatting_application/welcome_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import "package:flutter_datetime_picker/flutter_datetime_picker.dart";
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
FirebaseFirestore firestore = FirebaseFirestore.instance;
void main() {
  runApp( SignUp());
}

class SignUp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  static const String _title = 'chatting_application';
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: Scaffold(
        appBar: AppBar(title: const Text(_title)),
        body: const WelcomeScreen(),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  var con;
  String _selectedDate = 'Select your DOB';

  int currentDateDay = DateTime
      .now()
      .day;
  int currentDateMonth = DateTime
      .now()
      .month;
  int currentDateYear = DateTime
      .now()
      .year;

  _selectDate(BuildContext context) async {
    final DateTime? d = await showDatePicker(
      context: context,
      // initialDate: DateTime(2017),
      initialDate: DateTime(currentDateYear, currentDateMonth, currentDateDay),
      firstDate: DateTime(2000),
      lastDate: DateTime(currentDateYear + 5),
    );
    if (d != null)
      // ignore: curly_braces_in_flow_control_structures
      setState(() => _selectedDate = d.toString().split(' ')[0]);
  }
  String dropdownValuegender = 'Select your gender';
  var children;
  TextEditingController nameController = TextEditingController();
  TextEditingController UsernameController = TextEditingController();
  TextEditingController PasswordController = TextEditingController();
  TextEditingController GenderController = TextEditingController();
  TextEditingController DOBController = TextEditingController();
  TextEditingController EmailAddressController = TextEditingController();
  TextEditingController PhoneNumberController = TextEditingController();
  bool dropdownChanged = false;



  // FirebaseApp secondaryApp = Firebase.app('SecondaryApp');
  var firestore;
  @override
  void initState() {
     firestore = FirebaseFirestore.instance.collection("User");
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    var _chosenValue;
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 600.0,
                padding: const EdgeInsets.all(10),
                child: TextFormField(
                  validator: RequiredValidator(errorText: 'Required'),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: nameController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Name',
                  ),
                ),
              ),
              Container(
                width: 600.0,
                padding: const EdgeInsets.all(10),
                child: TextFormField(
                  validator: RequiredValidator(errorText: 'Required'),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                    controller: UsernameController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Username',
                  ),
                ),
              ),
              Container(
                width: 600.0,
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                child: TextFormField(
                  validator: RequiredValidator(errorText: 'Required'),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: PasswordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: 580,
                  decoration: const BoxDecoration(
                      border: Border(
                        top: BorderSide(width: 1.0, color: Colors.grey),
                        left: BorderSide(width: 1.0, color: Colors.grey),
                        right: BorderSide(width: 1.0, color: Colors.grey),
                        bottom: BorderSide(width: 1.0, color: Colors.grey),
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(5))),
                  child: DropdownButton<String>(
                    value: dropdownValuegender,
                    isExpanded: true,
                    icon: const Icon(Icons.arrow_drop_down),
                    elevation: 16,
                    style: const TextStyle(color: Colors.black),
                    onChanged: (String? newValue) {
                      setState(() {
                        dropdownValuegender = newValue!;
                      });
                    },
                    items: <String>[
                      'Select your gender',
                      'Female',
                      'Male',
                      'Other',
                    ].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 10.0),
                width: 580,
                decoration: const BoxDecoration(
                    border: Border(
                      top: BorderSide(width: 1.0, color: Colors.grey),
                      left: BorderSide(width: 1.0, color: Colors.grey),
                      right: BorderSide(width: 1.0, color: Colors.grey),
                      bottom: BorderSide(width: 1.0, color: Colors.grey),
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(5))),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      InkWell(
                        child: Text(
                          _selectedDate,
                          style: TextStyle(color: Colors.black),
                        ),
                        onTap: () {
                          _selectDate(context);
                        },
                      ),
                      IconButton(
                        icon: Icon(Icons.calendar_today),
                        tooltip: 'Select your DOB',
                        onPressed: () {
                          _selectDate(context);
                        },
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                width: 600.0,
                padding: const EdgeInsets.all(10),
                child: TextFormField(
                  validator: RequiredValidator(errorText: 'Required'),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Email Address ',
                  ),
                ),
              ),
              Container(
                width: 600.0,
                padding: const EdgeInsets.all(10),
                child: TextFormField(

                  validator: RequiredValidator(errorText: 'Required'),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                    controller: PhoneNumberController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Phone Number',
                  ),
                ),
              ),
              Container(
                  height: 50,
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: ElevatedButton(
                    child: const Text('Register'),
                    onPressed: () {
                      final city = <String, String>{
                        "name": "PRADEEPIKA",
                        "Username": "pradee8954",
                        "password": "Tharunvikky@8668",
                        "gender": "Male",
                        "DOB": "10/09/2002",
                        "Email Address": "tharunmass2002@gmail.com",
                        "phone Number": "8667521996"
                      };

                      firestore
                          .doc("ST")
                          .set(city)
                          .onError((e, _) => print("Error writing document: $e"));

                      var _emailController;
                      var _passwordController;
                      var _firebaseAuth;
                      _firebaseAuth.createUserWithEmailAndPassword(
                          email: _emailController.text,
                          password: _passwordController.text).then((value) {
                        FirebaseFirestore.instance.collection('UserData').doc(
                            value.user.uid).set({"email": value.user.email});
                      });
                    },
                  )),
            ],
          ),
        ),
      ),
    );
  }
}



