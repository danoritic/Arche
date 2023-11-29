import 'package:arche/common_widget.dart';
import 'package:arche/global_object.dart';
import 'package:arche/screen/empty_screen.dart';
import 'package:flutter/material.dart';

import 'screen_handler/search_screen_handler.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List result = [];
  String? keyword;
  late SearchHandler searchHandler;

  @override
  void initState() {
    searchHandler = SearchHandler();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // automaticallyImplyLeading: true,
        // backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        primary: true,
        child: Column(mainAxisSize: MainAxisSize.max, children: [
          Container(
            padding: const EdgeInsets.all(8),
            child: SearchBar(
                onChanged: (value) {
                  keyword = value;
                  setState(() {});
                },
                leading: IconButton(
                    onPressed: () async {
                      if (keyword != null) {
                        result = await searchHandler.searchMovies(keyword!);
                        setState(() {});
                      }
                    },
                    icon: const Icon(Icons.search))),
          ),
          (result.isNotEmpty)
              ? GridView.count(
                  shrinkWrap: true,
                  primary: false,
                  mainAxisSpacing: 5,
                  crossAxisCount: 2,
                  children: List.generate(result.length, (index) {
                    print("****" * 120);
                    print(result[index]);

                    return VideoCardWithTitle(
                      image: (result[index]['poster_path'] != null)
                          ? Image.network(
                              imageBaseUrl + result[index]['poster_path'],
                              fit: BoxFit.fitHeight,
                            )
                          : null,
                      title: result[index]['title'],
                    );
                  }),
                )
              : Container(
                  height: 600, child: const Center(child: EmptyScreen())),
          const SizedBox(height: 40),
        ]),
      ),
    );
  }
}
