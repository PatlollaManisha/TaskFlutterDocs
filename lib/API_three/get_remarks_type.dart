/*
Aim: To Display the API response

API PArameters:


1.Base Url: "https://19cghmc.cgg.gov.in/myghmcwebapi/Grievance/"
2. EndPoint: "getRemarkTypes"
3.Request type: "Get"
4.Request Parameters:"null"
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
import 'package:api_application/API_three/remark_type_modelclass.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class getRemarkTypes extends StatefulWidget {
  const getRemarkTypes({super.key});

  @override
  State<getRemarkTypes> createState() => _getRemarkTypesState();
}

class _getRemarkTypesState extends State<getRemarkTypes> {
  getRemarksModelClass? getRemarks;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Third_API_call"),
      ),
      body: ListView.builder(
        itemCount: getRemarks?.remarks?.length,
        itemBuilder: (context, index) {
          final remarkData = getRemarks?.remarks?[index];
          return Details(details: remarkData);
        },
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
        "https://19cghmc.cgg.gov.in/myghmcwebapi/Grievance/" + "getRemarkTypes";
    //Create payload if required i.e, when the request type is put,post,option etc
    //3. Create headers and authorisation
    //Adding Dio or http package to connect to the server
    final _dioObject = Dio();

    //Response
    try {
      final _response = await _dioObject.get(requestUrl);
      print("Response is $_response");

      final data = getRemarksModelClass.fromJson(_response.data);
      setState(() {
        this.getRemarks = data;
      });
    } on DioError catch (e) {
      if (e.response?.statusCode == 400 || e.response?.statusCode == 500) {
        print(e.response?.statusMessage);
      }
    }
  }
}

class Details extends StatelessWidget {
  const Details({super.key, required this.details});
  final Remarks? details;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Center(
        child: Column(
          children: [
            Text("remark Id: ${details?.remarkid}"),
            Text("remark Name: ${details?.remarkname}")
          ],
        ),
      ),
    );
  }
}
