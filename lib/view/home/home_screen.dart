import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stock_watchlist/controller/search_controller.dart';
import 'package:stock_watchlist/view/home/widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late TextEditingController textController;
  Timer? _debounce;
  @override
  void initState() {
    super.initState();
    textController = TextEditingController();
  }

  @override
  void dispose() {
    textController.dispose();
    _debounce?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
      ),
      body: SafeArea(child: SingleChildScrollView(
        child: Consumer<SearchController>(builder: (context, state, _) {
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
                child: CupertinoSearchTextField(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  controller: textController,
                  placeholder: 'Search Stocks',
                  onSubmitted: (value) {
                    Provider.of<SearchController>(context, listen: false)
                        .fetchData(value, true);
                    debugPrint(value);
                  },
                  onChanged: (value) {
                    if (_debounce != null) {
                      _debounce!.cancel();
                    }
                    _debounce = Timer(
                      const Duration(milliseconds: 900),
                      () async {
                        await Provider.of<SearchController>(context,
                                listen: false)
                            .fetchData(value);
                      },
                    );
                  },
                ),
              ),
              if (state.isLoading)
                const Padding(
                  padding: EdgeInsets.only(top: 80.0),
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                )
              else
                Column(children: [
                  SearchSuggestion(searchSuggestions: state.searchSuggestions),
                  if (state.searchResult.isNotEmpty)
                    SearchResult(
                      searchResult: state.searchResult,
                    )
                  else if (textController.text.isEmpty)
                    const Padding(
                      padding: EdgeInsets.only(top: 80.0),
                      child: Center(child: Text("Hoorayy")),
                    )
                  else
                    const Padding(
                      padding: EdgeInsets.only(top: 80.0),
                      child: Center(child: Text("No Stocks Found!")),
                    )
                ]),
            ],
          );
        }),
      )),
    );
  }
}
