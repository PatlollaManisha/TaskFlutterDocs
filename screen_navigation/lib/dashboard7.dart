import 'package:flutter/material.dart';
import 'package:screen_navigation/AppRoutes/app_routes.dart';
import 'package:screen_navigation/signup3.dart';
import 'AppRoutes/app_pages.dart';

class DashBoardPage extends StatefulWidget {
  const DashBoardPage({super.key});

  @override
  State<DashBoardPage> createState() => _DashBoardPageState();
}

class _DashBoardPageState extends State<DashBoardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          style: TextStyle(
            color: Colors.white,
          ),
          "DashboardScreen7",
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding:
                const EdgeInsets.only(top: 20, bottom: 5, left: 10, right: 10),
            child: Container(
              color: Colors.blue,
              child: TextButton(
                  onPressed: () {
                    Navigator.of(context).popAndPushNamed(AppRoutes.signup);
                  },
                  child: const Text(
                      style: TextStyle(color: Colors.white),
                      "SignUp Screen3")),
            ),
          ),
        ],
      ),
    );
  }
}
