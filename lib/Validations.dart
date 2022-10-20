import 'dart:html';

import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:loginpagevalidations/main.dart';

class Validations extends StatefulWidget {
  const Validations({super.key});

  @override
  State<Validations> createState() => _ValidationsState();
}

class _ValidationsState extends State<Validations> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _pswdController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('LogIn Page'),
      ),
      body: Column(children: [
        Padding(
          padding:
              const EdgeInsets.only(left: 20, right: 20, top: 100, bottom: 10),
          child: TextField(
            controller: _emailController,
            cursorColor: Colors.amberAccent,
            cursorHeight: (2.0),
            decoration: InputDecoration(
              hintText: 'Enter Email address',
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(5),
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding:
              const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 100),
          child: TextField(
            controller: _pswdController,
            decoration: InputDecoration(
              hintText: 'Enter Password',
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(5),
                ),
              ),
            ),
          ),
        ),
        Container(
          color: Colors.purpleAccent,
          child: TextButton(
            onPressed: () {
              validateInputs();
            },
            child: const Text(style: TextStyle(color: Colors.black), 'LogIn'),
          ),
        )
      ]),
    );
  }

  validateInputs() {
    if (_emailController.text.isEmpty) {
      showAlert("Enter Email");
    } else if (!RegExp(r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$')
        .hasMatch(_emailController.text)) {
      showAlert("Enter Valid Email");
    } else if (_pswdController.text.isEmpty) {
      showAlert("Enter Password");
    } else if (!RegExp(
            r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')
        .hasMatch(_pswdController.text)) {
      showAlert("""Please Enter valid Password with
                        Minimum one UppercaseCharacter
                        Minimum one specialCharacter
                        Minimum length of 8 Characters
                        Minimum one lowerCaseCharacter""");
    }
    /* String  pattern = r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
        RegExp regExp = new RegExp(pattern); */
  }

  showAlert(String message) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(message),
            actions: [
              Container(
                color: Colors.blueAccent,
                child: TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('OK'),
                ),
              ),
            ],
          );
        });
  }
}
