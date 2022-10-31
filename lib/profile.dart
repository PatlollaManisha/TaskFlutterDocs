import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ProfileDetails extends StatefulWidget {
  const ProfileDetails({super.key});

  @override
  State<ProfileDetails> createState() => _ProfileDetailsState();
}

class _ProfileDetailsState extends State<ProfileDetails> {
  dynamic jsonDetails;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Center(
          child: Container(
            width: 400,
            height: 400,
            child: Column(
              children: [
                Center(
                  child: CircleAvatar(
                    radius: 40,
                    backgroundImage: NetworkImage(
                        "https://cdn-icons-png.flaticon.com/512/3135/3135823.png"),
                  ),
                ),
                Details("First Name :", jsonDetails["firstName"]),
                Details("Last Name :", jsonDetails["lastName"]),
                Details("Email :", jsonDetails["Email"]),
                Details("Date of Birth :", jsonDetails["dateOfBirth"]),
                Details("Gender :", jsonDetails["gender"]),
                Details("Employee_Id :", jsonDetails["EmployeeId"]),
                Details("Designation :", jsonDetails["Designation"]),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Row Details(String title, String Value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(color: Colors.black, fontSize: 20),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Text(
            Value,
            style: TextStyle(color: Colors.black, fontSize: 20),
          ),
        )
      ],
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    FtechingDataFromJson();
  }

  Future<void> FtechingDataFromJson() async {
    String data = await rootBundle.loadString("profile_details.json");
    setState(() {
      jsonDetails = json.decode(data);
    });
  }
}
