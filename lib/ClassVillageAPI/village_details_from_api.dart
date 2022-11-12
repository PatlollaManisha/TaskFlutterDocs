/*
Aim: To Display the village deatils in the list from response

API PArameters:


1.Base Url: "https://uat4.cgg.gov.in/blc/hcl/"
2. EndPoint: "getBeneficiaryVillages"
3.Request type: "Post"
4.Request Parameters:"null"
5.body:
{
    "roleId": 12,
    "categoryId": 1,
    "userId": "TSDR-YEL-VKB",
    "token":"T_ZSPVDlQ2gBd_AK4BNNIDYTB0KmWSAD"
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

import 'package:api_application/ClassVillageAPI/village_list_item.dart';
import 'package:api_application/ClassVillageAPI/village_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class VillageDetails extends StatefulWidget {
  const VillageDetails({super.key});

  @override
  State<VillageDetails> createState() => _VillageDetailsState();
}

class _VillageDetailsState extends State<VillageDetails> {
  VillageModelClass? _villageModelClass;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("API_getVillageDetails"),
      ),
      body: Container(
        child: ListView.builder(
          itemCount: _villageModelClass?.villagDetails?.length ?? 0,
          itemBuilder: (context, index) {
            final villageData = _villageModelClass?.villagDetails?[index];
            return VillageListItem(details: villageData);
          },
        ),
      ),
    );
  }

  @override
  void initState() {
    //TODO: implement initState
    super.initState();
    fetchVillageDetails();
  }

  fetchVillageDetails() async {
// 1.Create Request url with base url+ end point
    final requestUrl =
        "https://uat4.cgg.gov.in/blc/hcl/" + "getBeneficiaryVillages";
// 2. Create payload if required i.e, when the request type is put,post,option etc
    final requestPayLoad = {
      "roleId": 12,
      "categoryId": 1,
      "userId": "TSDR-YEL-VKB",
      "token": "T_ZSPVDlQ2gBd_AK4BNNIDYTB0KmWSAD"
    };
// 3. Create headers and authorisation
// 4. Adding Dio or http package to connect to the server
    final _dioObject = Dio();
// 5. Response...
    try {
      //Getting response from url and saving it in _response
      final _reponse = await _dioObject.post(requestUrl, data: requestPayLoad);

      //we have created a model class with variables for variables to be assigned with values
      //Covert json response to Model class
      final villageDetailsModel = VillageModelClass.fromJson(_reponse.data);
      setState(() {
        this._villageModelClass = villageDetailsModel;
      });
    } on DioError catch (e) {
      if (e.response?.statusCode == 400 || e.response?.statusCode == 500) {
        final errorMessage = e.response?.data["message"];
        print(errorMessage);
      }
      print("error is $e");

      print("status code is ${e.response?.statusCode}");
    }
  }
}
