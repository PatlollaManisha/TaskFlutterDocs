// ignore: file_names
import 'package:flutter/material.dart';
import 'package:screen_navigation/AppRoutes/app_routes.dart';
import 'package:screen_navigation/dashboard7.dart';
import 'package:screen_navigation/getstart1.dart';
import 'package:screen_navigation/login2.dart';
import 'package:screen_navigation/profile9.dart';
import 'package:screen_navigation/signup3.dart';


class AppPages {
  static Map<String, WidgetBuilder> get routes {
    return {
      AppRoutes.getstart: ((context) => const GetStartPage()),
      AppRoutes.login: ((context) => const LogInPage()),
      AppRoutes.signup: ((context) => const SignUpPage()),
      AppRoutes.dashboard: ((context) => const DashBoardPage()),
      AppRoutes.profile: ((context) => const ProfilePage()),
    };
  }
}