import 'package:flutter/cupertino.dart';
import 'package:profile_with_json/App_Routes/app_routes.dart';
import 'package:profile_with_json/login_api_call.dart';
import 'package:profile_with_json/profile.dart';

class AppPages {
  static Map<String, WidgetBuilder> get routes {
    return {
      AppRoutes.profile: ((context) => ProfileDetails()),
      AppRoutes.login: ((context) => LoginAPIcalls()),
    };
  }
}
