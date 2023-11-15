import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late TextEditingController textController;
  @override
  void initState() {
    super.initState();
    textController = TextEditingController();
  }

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
            child: CupertinoSearchTextField(
              // backgroundColor: Colors.,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              controller: textController,
              placeholder: 'Search Stocks',
              onSubmitted: (value) {
                debugPrint(value);
              },
            ),
          ),
          Visibility(
              visible: false,
              child: Container(
                color: Colors.grey[300],
                margin: const EdgeInsets.only(left: 20, right: 20),
                height: 350,
                child: ListView.builder(
                    itemCount: 5,
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                          leading: const Icon(Icons.list),
                          subtitle: const Text(
                            "Price",
                            style: TextStyle(color: Colors.green, fontSize: 15),
                          ),
                          trailing: IconButton(
                              onPressed: () {}, icon: const Icon(Icons.add)),
                          title: Text("Stock $index"));
                    }),
              )),
          ListView.separated(
            padding: const EdgeInsets.only(top: 10),
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: 10,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                tileColor: Colors.grey[300],
                  leading: const Icon(Icons.list),
                  subtitle: const Text(
                    "Price",
                    style: TextStyle(color: Colors.green, fontSize: 15),
                  ),
                  trailing:
                      IconButton(onPressed: () {}, icon: const Icon(Icons.add)),
                  title: Text("Stock $index"));
            },
            separatorBuilder: (context, index) => const SizedBox(
              height: 5,
            ),
          )
        ]),
      )),
    );
  }
}
