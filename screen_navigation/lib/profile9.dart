import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    final ShowName = ModalRoute.of(context)?.settings.arguments as List;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          style: TextStyle(
            color: Colors.white,
          ),
          "ProfileScreen9",
        ),
        centerTitle: true,
      ),
      body: Column(children: [Row(
        children: [
            Text(ShowName[0]),
            const Text(" "),
            Text(ShowName[1]),
        ],
      )
      ]),
    );
  }
}
