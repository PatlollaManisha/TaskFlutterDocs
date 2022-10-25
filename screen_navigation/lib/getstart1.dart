import 'package:flutter/material.dart';
import 'package:screen_navigation/addressAdd5.dart';
import 'package:screen_navigation/dashboard7.dart';
import 'package:screen_navigation/forgotpassword4.dart';
import 'package:screen_navigation/login2.dart';
import 'package:screen_navigation/otpScreen6.dart';
import 'package:screen_navigation/profile9.dart';
import 'package:screen_navigation/settings8.dart';
import 'package:screen_navigation/signup3.dart';

class GetStartPage extends StatefulWidget {
  const GetStartPage({super.key});

  @override
  State<GetStartPage> createState() => _GetStartPageState();
}

class _GetStartPageState extends State<GetStartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          style: TextStyle(
            color: Colors.white,
          ),
          "StartScreen",
        ),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding:
                const EdgeInsets.only(top: 20, bottom: 5, left: 10, right: 10),
            child: Container(
              color: Colors.blue,
              child: TextButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: ((context) => const LogInPage())));
                  },
                  child: const Text(
                      style: TextStyle(color: Colors.white), "Login Screen2")),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(top: 20, bottom: 5, left: 10, right: 10),
            child: Container(
              color: Colors.blue,
              child: TextButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: ((context) => const SignUpPage())));
                  },
                  child: const Text(
                      style: TextStyle(color: Colors.white),
                      " Sign Up Screen3")),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(top: 20, bottom: 5, left: 10, right: 10),
            child: Container(
              color: Colors.blue,
              child: TextButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: ((context) => const ForgotPasswordPage())));
                  },
                  child: const Text(
                      style: TextStyle(color: Colors.white),
                      "ForgotPassword Screen4")),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(top: 20, bottom: 5, left: 10, right: 10),
            child: Container(
              color: Colors.blue,
              child: TextButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: ((context) => const AddAddressPage())));
                  },
                  child: const Text(
                      style: TextStyle(color: Colors.white),
                      "AddAddress Screen5")),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(top: 20, bottom: 5, left: 10, right: 10),
            child: Container(
              color: Colors.blue,
              child: TextButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: ((context) => const OtpScreen())));
                  },
                  child: const Text(
                      style: TextStyle(color: Colors.white), "Otp Screen6")),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(top: 20, bottom: 5, left: 10, right: 10),
            child: Container(
              color: Colors.blue,
              child: TextButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: ((context) => const DashBoardPage())));
                  },
                  child: const Text(
                      style: TextStyle(color: Colors.white),
                      "Dashboard Screen7")),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(top: 20, bottom: 5, left: 10, right: 10),
            child: Container(
              color: Colors.blue,
              child: TextButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: ((context) => const SettingsPage())));
                  },
                  child: const Text(
                      style: TextStyle(color: Colors.white),
                      "Setting Screen8")),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(top: 20, bottom: 5, left: 10, right: 10),
            child: Container(
              color: Colors.blue,
              child: TextButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: ((context) => const ProfilePage())));
                  },
                  child: const Text(
                      style: TextStyle(color: Colors.white),
                      "Profile Screen8")),
            ),
          ),
        ],
      ),
    );
  }
}
