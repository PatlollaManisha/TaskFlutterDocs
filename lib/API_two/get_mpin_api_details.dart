/*
Aim: To Display the API response

API PArameters:


1.Base Url: "https://19cghmc.cgg.gov.in/myghmcwebapi/Grievance/"
2. EndPoint: "getMpin"
3.Request type: "Get"
4.Request Parameters:"MOBILE_NO:9100923132"
5.body:"null"
6.Headers:"null"
7.Authorization:"null"

Steps:
1.Create Request url with base url+ end point
2. Create payload if required i.e, when the request type is put,post,option etc
3. Create headers and authorisation
4. Adding Dio or http package to connect to the server
5. Response...


 */
import 'package:api_application/API_two/modelclass.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class getMpinDetails extends StatefulWidget {
  const getMpinDetails({super.key});

  @override
  State<getMpinDetails> createState() => _getMpinDetailsState();
}

class _getMpinDetailsState extends State<getMpinDetails> {
  ResponseModelClass? ResponseData;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Second_API_call"),
      ),
      body: Card(
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Category: ${ResponseData?.cATEGORY}"),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Designation: ${ResponseData?.dESIGNATION}"),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("EemployeeId: ${ResponseData?.eMPD}"),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("EemployeeName: ${ResponseData?.eMPNAME}"),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("MobileNumber: ${ResponseData?.mOBILENO}"),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("message: ${ResponseData?.message}"),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Mpin: ${ResponseData?.mpin}"),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("OTP: ${ResponseData?.otp}"),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Status: ${ResponseData?.status}"),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("TokenId: ${ResponseData?.tOKENID}"),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("TypeID: ${ResponseData?.tYPEID}"),
          )
        ]),
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchDetails();
  }

  fetchDetails() async {
    //1.Create Request url with base url+ end point
    final requestUrl =
        "https://19cghmc.cgg.gov.in/myghmcwebapi/Grievance/" + "getMpin";
    //Create payload if required i.e, when the request type is put,post,option etc
    //3. Create headers and authorisation
    //Adding Dio or http package to connect to the server
    final _dioObject = Dio();

    //Response
    try {
      final _response = await _dioObject
          .get(requestUrl, queryParameters: {"MOBILE_NO": 9100923132});
      print("Response is $_response");

      final data = ResponseModelClass.fromJson(_response.data);
      setState(() {
        this.ResponseData = data;
      });
    } on DioError catch (e) {
      if (e.response?.statusCode == 400 || e.response?.statusCode == 500) {
        print(e.response?.statusMessage);
      }
    }
  }
}
