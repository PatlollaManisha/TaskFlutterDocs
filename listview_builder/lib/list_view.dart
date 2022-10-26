import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:listview_builder/listbuilder_item.dart';

class ListViewBasic extends StatefulWidget {
  const ListViewBasic({super.key});

  @override
  State<ListViewBasic> createState() => _ListViewBasicState();
}

class _ListViewBasicState extends State<ListViewBasic> {
  final statesList = [
    "Andhra Pradesh",
    "Arunachal Pradesh",
    "Assam",
    "Bihar",
    "Chhattisgarh",
    "Goa",
    "Gujarat",
    "Haryana",
    "Himachal Pradesh",
    "Jammu and Kashmir",
    "Jharkhand",
    "Karnataka",
    "Kerala",
    "Madhya Pradesh",
    "Maharashtra",
    "Manipur",
    "Meghalaya",
    "Mizoram",
    "Nagaland",
    "Odisha",
    "Punjab",
    "Rajasthan",
    "Sikkim",
    "Tamil Nadu",
    "Telangana",
    "Tripura",
    "Uttarakhand",
    "Uttar Pradesh",
    "West Bengal",
    "Andaman and Nicobar Islands",
    "Chandigarh",
    "Dadra and Nagar Haveli",
    "Daman and Diu",
    "Delhi",
    "Lakshadweep",
    "Puducherry"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ListView"),
        centerTitle: true,
      ),
      body: ListView.builder(
          itemCount: statesList.length,
          itemBuilder: (context, index) {
            final state = statesList[index];
            return listViewItem(
                  state: state,
                  callBackItem: (Value) {
                    showAlert(state);
                  }
            );
          }),
    );
  }

  showAlert(String message, {String text = ""}) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(message + text),
            actions: [
              ElevatedButton(
                onPressed: () {
                  // print("button Action");
                  Navigator.pop(context);
                },
                child: const Text("ok"),
              )
            ],
          );
        });
  }
}
