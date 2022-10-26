import 'package:flutter/material.dart';
import 'package:listview_builder/callbacklist_detaisl.dart';

class CallBackHomeScreen extends StatefulWidget {
  const CallBackHomeScreen({super.key});

  @override
  State<CallBackHomeScreen> createState() => _CallBackHomeScreenState();
}

class _CallBackHomeScreenState extends State<CallBackHomeScreen> {
  List<String> bookList = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("CallBack HomeScreen"),
        centerTitle: true,
      ),
      body: Container(
        color: Colors.cyan[200],
        child: ListView.builder(
          itemCount: bookList.length,
          itemBuilder: (context, index) {
            return Container(
              color: Colors.purple,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  child: ListTile(
                    tileColor: Colors.white,
                    leading: const Icon(Icons.menu_book_sharp),
                    title: Text(bookList[index]),
                  ),
                ),
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => CallBackDetails(
                BookUserDetailsCallBack:
                    (String bookUser, String userMobileNo) {
                  final String result = '$bookUser - $userMobileNo';
                  setState(() {
                                bookList.add(result);
                              });
                },
              ),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
