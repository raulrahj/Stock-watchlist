import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stock_watchlist/controller/watchlist_controller.dart';

class WatchListScreen extends StatelessWidget {
  const WatchListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Watch List"),
      ),
      body: SafeArea(
        child: Consumer<WatchListController>(builder: (context, state, _) {
          if (state.stockList.isNotEmpty) {
            return ListView.separated(
              itemCount: 5,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                    tileColor: Colors.grey[300],
                    leading: const Icon(Icons.list),
                    subtitle: const Text(
                      "Price",
                      style: TextStyle(color: Colors.green, fontSize: 15),
                    ),
                    trailing: IconButton(
                        onPressed: () => onDelete,
                        icon: const Icon(Icons.close)),
                    title: Text(state.stockList[index].company));
              },
              separatorBuilder: (context, index) => const SizedBox(
                height: 5,
              ),
            );
          } else {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [Center(child: Text("No Saved Items"))],
            );
          }
        }),
      ),
    );
  }

  void onDelete(BuildContext context, int index) {
    showDialog(
      context: context,
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(20.0),
          child: AlertDialog(
            title: const Text(
              'Delete ?',
              style: TextStyle(
                color: Colors.red,
              ),
            ),
            content: const Text(
              "Are you sure to delete this saved stock",
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('No'),
              ),
              TextButton(
                onPressed: () {
                  Provider.of<WatchListController>(context).deleteStock(index);
                  Navigator.of(context).pop();
                },
                child: const Text('Yes'),
              ),
            ],
          ),
        );
      },
    );
  }
}
