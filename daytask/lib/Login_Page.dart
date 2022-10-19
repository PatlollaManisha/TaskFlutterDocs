import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _numberController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('LoginPage'),
        backgroundColor: Colors.purple,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding:
                const EdgeInsets.only(left: 20, right: 20, top: 30, bottom: 30),
            child: TextField(
              cursorColor: Colors.red,
              maxLength: 10,
              decoration: InputDecoration(hintText: ('Enter 10 characters and cursor is red TF1')),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
            child: TextField(
              decoration: InputDecoration(hintText: ('Input only numbers(AADHAR NUMBER)& TextField2')),
               keyboardType: TextInputType.number,
               maxLength: 12,
              controller: _numberController,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(hintText: ('Textfield3 with maxLine:3')),
              maxLines: 3,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: ('Setting Border with color'),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 3, color: Colors.greenAccent),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: TextField(
              decoration: InputDecoration(hintText: ('With obscureText')),
              obscureText: true,
            ),
          )
        ],
      ),
    );
  }
}
