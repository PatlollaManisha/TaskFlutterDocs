import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LoginAPIcalls extends StatefulWidget {
  const LoginAPIcalls({super.key});

  @override
  State<LoginAPIcalls> createState() => _LoginAPIcallsState();
}

class _LoginAPIcallsState extends State<LoginAPIcalls> {
  TextEditingController _phoneNumberController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  //final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("LoginPage_with_API_calls"),
        centerTitle: true,
      ),
      body: Form(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
                width: 100, height: 100, child: Lottie.asset("lottie.json")),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: SizedBox(
                width: 326,
                height: 50,
                child: TextFormField(
                  controller: _phoneNumberController,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.phone_iphone_outlined),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              child: SizedBox(
                width: 326,
                height: 50,
                child: TextFormField(
                  controller: _passwordController,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.password),
                    suffixIcon: Icon(Icons.remove_red_eye),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: SizedBox(
                width: 326,
                height: 50,
                child: ElevatedButton(
                    onPressed: () {
                      //if (_formKey.currentState!.validate()) {}
                      requestApi(context);
                    },
                    child: Text(
                      "LogIn",
                      style: TextStyle(fontSize: 26),
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void requestApi(BuildContext context) async {
    final requestUrl = "http://164.52.213.195:8088/salex/" + "authenticate";
    final requestPayload = {
      "password": _phoneNumberController.text, //"Ak@123"
      "phoneNumber": _passwordController.text //7205807205
    };
    final _dioObject = Dio();
    try {
      final response = await _dioObject.post(requestUrl, data: requestPayload);
      print(response);
    } catch (e) {}
  }
}
