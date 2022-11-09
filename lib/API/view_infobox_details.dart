import 'package:flutter/material.dart';

class DisplayData extends StatelessWidget {
  const DisplayData({super.key});

  @override
  Widget build(BuildContext context) {
    final DetailsData = ModalRoute.of(context)?.settings.arguments;
    return Container(
      color: Colors.black87,
      alignment: Alignment.center,
      child: SizedBox(
        width: 300,
        height: 300,
        child: Card(
          child: Column(
            children: [
              Text("${DetailsData}"),
            ],
          ),
        ),
      ),
    );
  }
}
