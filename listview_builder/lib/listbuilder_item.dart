/* import 'package:flutter/material.dart';

class listView_item extends StatelessWidget {
  const listView_item({
    Key? key,
    required this.state,
    required this.callbackValue,
  }) : super(key: key);

  final String state;
  final Function(String value) callbackValue;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: callbackValue(state),
      child: ListTile(
        title: Text(state),
        trailing: const Icon(Icons.add_photo_alternate_outlined),
        leading: Image.asset('assets/download.png'),
      ),
    );
  }
}
 */

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class listViewItem extends StatelessWidget {
  const listViewItem({super.key, required this.callBackItem,required this.state});
  final Function(String Value) callBackItem;
  final state;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:() =>  callBackItem(state),
      child: ListTile(
        title: Text(state),
        trailing: const Icon(Icons.add_photo_alternate_outlined),
        leading: Image.asset('assets/download.png'),
      ),
    );
  }
}
