import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isPasswordVisible = false;
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
            style: TextStyle(color: Colors.white),
            "SignUp Page",
            textAlign: TextAlign.center),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 30,right: 30,top: 10,bottom: 10),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Column(
              children: [
                const Text(
                  "SIGN UP",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 10, bottom: 10, left: 10, right: 10),
                        child: TextFormField(
                          decoration: const InputDecoration(
                            hintText: "Enter FirstName",
                            labelText: "First Name:",
                            //errorText: "Please enter your first name",
                            //errorStyle: TextStyle(color: Colors.red),
                            //suffixIcon: Icon(Icons.remove_red_eye_outlined),
                            focusedBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "FirstName can't be empty";
                            }
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 10, bottom: 10, left: 10, right: 10),
                        child: TextFormField(
                          decoration: const InputDecoration(
                            hintText: "Enter LastName",
                            labelText: "Last Name:",
                            //errorText: "Please enter your last name",
                            //errorStyle: TextStyle(color: Colors.red),
                            //suffixIcon: Icon(Icons.remove_red_eye_outlined),
                            focusedBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "LastName can't be empty";
                            }
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 10, bottom: 10, left: 10, right: 10),
                        child: TextFormField(
                          decoration: const InputDecoration(
                            hintText: "Enter Email",
                            labelText: "Email:",
                            //errorText: "Please enter your first name",
                            //errorStyle: TextStyle(color: Colors.red),
                            //suffixIcon: Icon(Icons.remove_red_eye_outlined),
                            focusedBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                          ),
                          controller: _emailController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Please Enter Email";
                            } else if (!RegExp(
                                    r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$')
                                .hasMatch(value)) {
                              return "Please Enter a Valid Email";
                            }
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 20, bottom: 10, left: 10, right: 10),
                        child: TextFormField(
                          obscureText: !_isPasswordVisible,
                          controller: _passwordController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Please Enter Password";
                            } else if (!RegExp(
                                    r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')
                                .hasMatch(value)) {
                              showAlert("""Please Enter valid Password with
                                                Minimum one UppercaseCharacter
                                                Minimum one specialCharacter
                                                Minimum length of 8 Characters
                                                Minimum one lowerCaseCharacter""");
                              return "Please Enter a Valid Password";
                            }
                          },
                          decoration: InputDecoration(
                            hintText: "Enter Password",
                            labelText: "Password:",
                            //errorText: "Please enter your first name",
                            //errorStyle: TextStyle(color: Colors.red),
                            //suffixIcon: Icon(Icons.remove_red_eye_outlined),
                            focusedBorder: const OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  _isPasswordVisible = !_isPasswordVisible;
                                });
                              },
                              icon: Icon(
                                _isPasswordVisible
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Container(
                          color: Colors.blue,
                          child: TextButton(
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {}
                              },
                              child: const Text(
                                  style: TextStyle(color: Colors.white),
                                  "Sign Up")),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
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
                  child: const Text('OK'),
                ),
              ),
            ],
          );
        });
  }
}
