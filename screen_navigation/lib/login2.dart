import 'package:flutter/material.dart';
import 'package:screen_navigation/signup3.dart';

import 'AppRoutes/app_routes.dart';

class LogInPage extends StatefulWidget {
  const LogInPage({super.key});

  @override
  State<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _pswdController = TextEditingController();
  bool _isPasswordvisible = false;
  var flag1 = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('LogIn Page'),
      ),
      body: Column(children: [
        Padding(
          padding:
              const EdgeInsets.only(left: 20, right: 20, top: 100, bottom: 10),
          child: TextField(
            controller: _emailController,
            cursorColor: Colors.amberAccent,
            cursorHeight: (2.0),
            decoration: const InputDecoration(
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
            obscureText: !_isPasswordvisible,
            controller: _pswdController,
            decoration: InputDecoration(
              hintText: 'Enter Password',
              suffixIcon: GestureDetector(
                onTap: () {
                  setState(() {
                    _isPasswordvisible = !_isPasswordvisible;
                  });
                },
                child: Icon(
                  _isPasswordvisible ? Icons.visibility : Icons.visibility_off,
                  color: Theme.of(context).primaryColor,
                ),
              ),
              focusedBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(5),
                ),
              ),
            ),
          ),
        ),
        Container(
          color: Colors.blue,
          child: TextButton(
            onPressed: () {
              validateInputs();
              if (flag1 == 1) {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: ((context) => SignUpPage())));
              }
            },
            child: const Text(style: TextStyle(color: Colors.white), 'LogIn'),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text(style: TextStyle(color: Colors.white), 'Back'),
          ),
        ),
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
    } else {
      return flag1 = 1;
    }
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
                  child: const Text(
                    'OK',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          );
        });
  }
}
