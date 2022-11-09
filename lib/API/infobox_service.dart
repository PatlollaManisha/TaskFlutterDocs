/*
Aim: To Display the API response

API PArameters:


1.Base Url: "https://19cghmc.cgg.gov.in/myghmcwebapi/Grievance/"
2. EndPoint: "InfoBoxService1"
3.Request type: "Post"
4.Request Parameters:"null"
5.body:
{
    "userid":"cgg@ghmc",
    "password":"ghmc@cgg@2018"
}
6.Headers:"null"
7.Authorization:"null"

Steps:
1.Create Request url with base url+ end point
2. Create payload if required i.e, when the request type is put,post,option etc
3. Create headers and authorisation
4. Adding Dio or http package to connect to the server
5. Response...


 */
import 'package:api_application/API/info_box_model.dart';
import 'package:api_application/app_routes/app_routes.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class ServiceInfo extends StatefulWidget {
  const ServiceInfo({super.key});

  @override
  State<ServiceInfo> createState() => _ServiceInfoState();
}

class _ServiceInfoState extends State<ServiceInfo> {
  InfoBoxModelClass? infoBoxModelData;
  TextEditingController _userNameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Services"),
      ),
      body: Card(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                controller: _userNameController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    labelText: "Username",
                    hintText: "Enter Username"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                controller: _passwordController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    labelText: "Password",
                    hintText: "Enter Password"),
              ),
            ),
            SizedBox(
              width: 326,
              child: ElevatedButton(
                  onPressed: () {
                    FetchData();
                    showData();
                  },
                  child: Text("Log In")),
            ),
          ],
        ),
      ),
    );
  }

  FetchData() async {
    //1.Create Request url with base url+ end point
    final requestUrl = "https://19cghmc.cgg.gov.in/myghmcwebapi/Grievance/" +
        "InfoBoxService1";

    //Create payload if required i.e, when the request type is put,post,option etc
    final requestPayLoad = {
      "userid": _userNameController.text,
      "password": _passwordController.text
    };
    //Adding Dio or http package to connect to the server
    final _dioObject = Dio();

    //Response
    try {
      final _response = await _dioObject.post(requestUrl, data: requestPayLoad);
      print("Response is $_response");
      final data = InfoBoxModelClass.fromJson(_response.data);
      setState(() {
        this.infoBoxModelData = data;
      });
    } on DioError catch (e) {
      if (e.response?.statusCode == 400 || e.response?.statusCode == 500) {
        print(e.response?.statusMessage);
      }
    }
  }

  showData() async {
    Navigator.pushNamed(context, AppRoutes.getInfoBoxDetails,
        arguments: infoBoxModelData?.toJson().toString());
  }
}
