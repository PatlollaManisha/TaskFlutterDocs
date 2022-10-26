import 'package:flutter/material.dart';
import 'package:listview_builder/AppRoutes/app_routes.dart';
import 'package:listview_builder/callback_homescreen.dart';
import 'package:listview_builder/callbacklist_detaisl.dart';
import 'package:listview_builder/list_view.dart';

class AppPages {
  static Map<String, WidgetBuilder> get routes {
    return {
      AppRoutes.listView:(context) => const ListViewBasic(),
      AppRoutes.homescreen:(context) => const CallBackHomeScreen(),
      AppRoutes.details:(context) =>  CallBackDetails(BookUserDetailsCallBack: (String BookUser, String UserMobile_No) {  },),
    };
  }
}
