
import 'package:flutter/material.dart';
import 'package:stock_watchlist/controller/services/base.dart';

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
            subtitle: const Text(
              "Price",
              style: TextStyle(color: Colors.green, fontSize: 15),
            ),
            trailing: IconButton(onPressed: () {}, icon: const Icon(Icons.add)),
            title: Text(searchResult[index].company));
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
                    leading: const Icon(Icons.list),
                    subtitle: const Text(
                      "Price",
                      style: TextStyle(color: Colors.green, fontSize: 15),
                    ),
                    trailing: IconButton(
                        onPressed: () {}, icon: const Icon(Icons.add)),
                    title: Text(searchSuggestions[index].company));
              }),
        ));
  }
}
