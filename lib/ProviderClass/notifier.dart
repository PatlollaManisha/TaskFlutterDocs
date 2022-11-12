import 'package:flutter/material.dart';

class detailsAddedNotifier with ChangeNotifier {
  List<String> Details = ["manisha", "Chinnu"];
  addedDetails(String namedetail) {
    Details.add(namedetail);
    print(Details);
    notifyListeners();
  }
}
