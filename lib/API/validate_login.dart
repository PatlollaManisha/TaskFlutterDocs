/*
Aim: To Display the API response

API PArameters:


1.Base Url: "http://uat7.cgg.gov.in/gccfms/webservice/validate/"
2. EndPoint: "validateLogin"
3.Request type: "Post"
4.Request Parameters:"null"
5.body:
{
    "deviceId":"74615e76bf58dc12",
     "mobileNo":"9182959318"
} 
6.Headers:"null"
7.Authorization:"Basic Auth"
Username: gccinventory
Password: gccinventory

Steps:
1.Create Request url with base url+ end point
2. Create payload if required i.e, when the request type is put,post,option etc
3. Create headers and authorisation
4. Adding Dio or http package to connect to the server
5. Response...


 */
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class ValidateLoginAPI extends StatefulWidget {
  const ValidateLoginAPI({super.key});

  @override
  State<ValidateLoginAPI> createState() => _ValidateLoginAPIState();
}

class _ValidateLoginAPIState extends State<ValidateLoginAPI> {
  TextEditingController _userNameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ValidateLoginAPI"),
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
                  },
                  child: Text("Log In")),
            )
          ],
        ),
      ),
    );
  }

  FetchData() async {
    //1.Create Request url with base url+ end point
    final requestUrl =
        "http://uat7.cgg.gov.in/gccfms/webservice/validate/" + "validateLogin";

    //Create payload if required i.e, when the request type is put,post,option etc
    final requestPayLoad = {
      "deviceId": "74615e76bf58dc12",
      "mobileNo": "9182959318"
    };
    //Create headers and authorisation
    final basicAuth = {"Username": "gccinventory", "Password": "gccinventory"};
    //Adding Dio or http package to connect to the server
    final _dioObject = Dio();

    //Response
    try {
      final _response = await _dioObject.post(requestUrl,
          data: requestPayLoad,
          options: Options(headers: {
            'Authorization': 'Basic Z2NjaW52ZW50b3J5OmdjY2ludmVudG9yeQ=='
          }));
      print("Response is $_response");
    } on DioError catch (e) {
      if (e.response?.statusCode == 400 || e.response?.statusCode == 500) {
        print(e.response?.statusMessage);
      }
    }
  }
}
