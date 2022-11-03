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
        child: Center(
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
                padding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
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
      ),
    );
  }

  void requestApi(BuildContext context) async {
    final requestUrl = "http://164.52.213.195:8088/salex/" + "authenticate";
    final requestPayload = {
      "password": _phoneNumberController.text.toString(), //"Ak@123"
      "phoneNumber": _passwordController.text.toString() //7205807205
    };
    final _dioObject = Dio();
    try {
      final response = await _dioObject.post(requestUrl, data: requestPayload);
      print(response);
    } on DioError catch (e) {
      if (e.response?.statusCode == 400 || e.response?.statusCode == 500) {
        final errorMessage = e.response?.data["message"];
        showAlert(errorMessage);
      }
      print("error is $e");

      print("status code is ${e.response?.statusCode}");
    }
  }

  void showAlert(errorMessage) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(title: Text(errorMessage), actions: [
            ElevatedButton(
              onPressed: () {
                // print("button Action");
                Navigator.pop(context);
              },
              child: const Text("ok"),
            )
          ]);
        });
  }
}
