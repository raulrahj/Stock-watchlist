import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stock_watchlist/controller/services/base.dart';
import 'package:stock_watchlist/controller/watchlist_controller.dart';

class SearchResult extends StatelessWidget {
  const SearchResult({
    super.key,
    required this.searchResult,
  });
  final STOCKLIST searchResult;
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.only(top: 10),
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: searchResult.length,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
            tileColor: Colors.grey[300],
            leading: const Icon(Icons.list),
            subtitle: Row(
              children: [
                Text(searchResult[index].symbol),
                const SizedBox(
                  width: 8,
                ),
                FutureBuilder<String>(
                    future: Services().getPrice(searchResult[index].company),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return Text(
                          "₹ ${snapshot.data.toString()}",
                          style: const TextStyle(
                              color: Colors.green, fontSize: 15),
                        );
                      } else {
                        return const Text(
                          "...",
                          style: TextStyle(color: Colors.green, fontSize: 15),
                        );
                      }
                    }),
              ],
            ),
            trailing: IconButton(
                onPressed: () async {
                  await Provider.of<WatchListController>(context, listen: false)
                      .addStocks(searchResult[index], context);
                },
                icon: const Icon(Icons.add)),
            title: Text(
              searchResult[index].company,
              style: const TextStyle(color: Colors.black),
            ));
      },
      separatorBuilder: (context, index) => const SizedBox(
        height: 5,
      ),
    );
  }
}

class SearchSuggestion extends StatelessWidget {
  const SearchSuggestion({
    super.key,
    required this.searchSuggestions,
  });
  final STOCKLIST searchSuggestions;

  @override
  Widget build(BuildContext context) {
    return Visibility(
        visible: searchSuggestions.isNotEmpty,
        child: Container(
          color: Colors.grey[300],
          margin: const EdgeInsets.only(left: 20, right: 20),
          height: 350,
          child: ListView.builder(
              itemCount: searchSuggestions.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                    subtitle: Row(
                      children: [
                        Text(searchSuggestions[index].symbol),
                        const SizedBox(
                          width: 8,
                        ),
                        FutureBuilder<String>(
                            future: Services()
                                .getPrice(searchSuggestions[index].company),
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                return Text(
                                  "₹ ${snapshot.data.toString()}",
                                  style: const TextStyle(
                                      color: Colors.green, fontSize: 15),
                                );
                              } else {
                                return const Text(
                                  "...",
                                  style: TextStyle(
                                      color: Colors.green, fontSize: 15),
                                );
                              }
                            }),
                      ],
                    ),
                    trailing: IconButton(
                        onPressed: () async {
                          await Provider.of<WatchListController>(context,
                                  listen: false)
                              .addStocks(searchSuggestions[index], context);
                        },
                        icon: const Icon(Icons.add)),
                    title: Text(searchSuggestions[index].company));
              }),
        ));
  }
}
