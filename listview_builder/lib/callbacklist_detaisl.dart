import 'package:flutter/material.dart';

class CallBackDetails extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final Function(String bookUser, String userMobileNo) BookUserDetailsCallBack;
  CallBackDetails({super.key,required this.BookUserDetailsCallBack});

  @override
  Widget build(BuildContext context) {
     TextEditingController _nameController = TextEditingController();
     TextEditingController _mobileNoController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Book Details"),
        centerTitle: true,
      ),
      body: Form(
        key: _formKey,
        child: Container(
          color: Colors.pink[50],
          child: Column(
            children: [
              Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextFormField(
                      controller: _nameController,
                      decoration: InputDecoration(
                          hintText: "Enter Name",
                           labelText: "BookUserName",
                           focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                           ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter Name';
                        } else {
                          return null;
                        }
                      })),
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                      controller: _mobileNoController,
                      decoration: InputDecoration(
                          hintText: "Enter Mobile No",
                           labelText: "UserMobile:",
                           focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(20))),
                      maxLength: 10,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter mobile no';
                        } else if (value.length < 10) {
                          return 'Please enter 10 digit mobile no';
                        } else {
                          return null;
                        }
                      })),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    BookUserDetailsCallBack(_nameController.text, _mobileNoController.text);
                    Navigator.pop(context);
                  }
                },child: Container(
                    color: Colors.blue,
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        "submit",
                        style: TextStyle(color: Colors.white),
                      ),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}