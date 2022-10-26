import 'package:flutter/material.dart';
import 'package:screen_navigation/AppRoutes/app_routes.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          style: TextStyle(
            color: Colors.white,
          ),
          "ForgotPasswordScreen4",
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 20, bottom: 5, left: 10, right: 10),
        child: ElevatedButton(
            onPressed: () {
              //Navigator.of(context).popUntil((route) => route.isFirst);
              Navigator.popUntil(
                  context, ModalRoute.withName(AppRoutes.getstart));
            },
            child: const Text(
                style: TextStyle(color: Colors.white), "Go to Screen1")),
      ),
    );
  }
}
