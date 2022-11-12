import 'package:api_application/ProviderClass/notifier.dart';
import 'package:api_application/reusable_button.dart';
import 'package:api_application/reusable_textfield.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProviderInputClass extends StatefulWidget {
  const ProviderInputClass({super.key});

  @override
  State<ProviderInputClass> createState() => _ProviderInputClassState();
}

class _ProviderInputClassState extends State<ProviderInputClass> {
  TextEditingController _name = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final detailsProvider = Provider.of<detailsAddedNotifier>(context);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                InputTextField(
                    prefixIcon: Icon(Icons.person_add_alt),
                    controller: _name,
                    hintText: "Enter Name"),
                ButtonComponent(
                  buttonText: 'Submit',
                  onPressed: () {
                    final name = _name.text;
                    detailsProvider.addedDetails(name);
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
