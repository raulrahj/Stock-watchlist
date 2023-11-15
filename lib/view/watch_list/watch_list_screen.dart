import 'package:flutter/material.dart';

class WatchListScreen extends StatelessWidget {
  const WatchListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Watch List"),
      ),
      body: SafeArea(
        child: ListView.separated(
          itemCount: 5,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
                tileColor: Colors.grey[300],
                leading: const Icon(Icons.list),
                subtitle: const Text(
                  "Price",
                  style: TextStyle(color: Colors.green, fontSize: 15),
                ),
                trailing:
                    IconButton(onPressed: () {}, icon: const Icon(Icons.close)),
                title: Text("Stock $index"));
          },
          separatorBuilder: (context, index) => const SizedBox(
            height: 5,
          ),
        ),
      ),
    );
  }
}
