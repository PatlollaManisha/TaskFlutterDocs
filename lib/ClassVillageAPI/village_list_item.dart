import 'package:api_application/ClassVillageAPI/village_model.dart';
import 'package:flutter/material.dart';

class VillageListItem extends StatelessWidget {
  const VillageListItem({super.key, required this.details});
  final VillagDetails? details;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(children: [
          Text("Village Id: ${details?.villageId}"),
          Text("Village Name: ${details?.villageName}"),
          Text("Village NameId: ${details?.userId}"),
        ]),
      ),
    );
  }
}
