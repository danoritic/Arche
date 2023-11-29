import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

class SampleWidget extends StatelessWidget {
  const SampleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: FutureBuilder(
              future: getData(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return const Text('data');
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              })),
    );
  }
}

Future<Map<String, dynamic>> getData() async {
  Map<String, dynamic> result = {};
  String url = "http://127.0.0.1:5000/data_yen";
  Response response = await post(Uri.parse(url));
  if (response.statusCode == 200) {
    // json;
    result = json.decode(response.body);
  } else {
    print('error ti wa oooo');
    print(response.body);
  }

// things to note statuscode 200  is success, 400,500, is failure
// there are still mor things

  return result;
}
