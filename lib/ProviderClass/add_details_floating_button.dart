import 'package:api_application/ProviderClass/notifier.dart';
import 'package:api_application/app_routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class providerMainClass extends StatelessWidget {
  const providerMainClass({super.key});

  @override
  Widget build(BuildContext context) {
    final detailsProvider = Provider.of<detailsAddedNotifier>(context);
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(title: Text("Member Deatils With Providers")),
      body: Container(
        color: Colors.cyan[200],
        child: ListView.builder(
          itemCount: detailsProvider.Details.length,
          itemBuilder: (context, index) {
            return Container(
              color: Colors.purple,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  child: ListTile(
                    tileColor: Colors.white,
                    leading: const Icon(Icons.person),
                    title: Text(detailsProvider.Details[index]),
                  ),
                ),
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, AppRoutes.providerInput);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
