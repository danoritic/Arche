import 'dart:convert';

import 'package:http/http.dart' as http;

import 'global_object.dart';

Future<http.Response> signIn(Map<String, String> body, headers) async {
  body.addEntries(
      {'Essence': 'Profile', 'regId': 'kljnjknkjnkjnbjkkjhkhj'}.entries);
  final response = await http.post(
    Uri.parse('https://www.elitepage.com.ng/yomcoin/user/entry'),
    headers: headers,
    body: body,
  );

  if (response.statusCode == 200) {
    // Successful response
    avoid_print('Response: ${response.body}');
    // return true;
  } else {
    // Error response
    avoid_print('Error: ${response.statusCode}');
    // return false;
  }

  return response;
}

Future<http.Response> requesterSignUp(Map<String, String> body, headers) async {
  final response = await http.post(
    Uri.parse('https://www.elitepage.com.ng/yomcoin/class/prt'),
    body: body,
    headers: headers,
  );

  // if (response.statusCode == 200) {
  //   // Successful response
  //   avoid_print('Response: ${response.body}');
  //   return true;
  // } else {
  //   // Error response
  //   avoid_print('Error: ${response.statusCode}');
  //   return false;
  // }

  return response;
}

Future<Map<String, dynamic>> requestResources(
  String url,
  dynamic body,
  Map<String, String> headers,
  String requestType, [
  String? baseUrl,
  String? urlPath,
]) async {
  custom_print(url, 'url');
  Uri parsedUrl = Uri.parse(url);
  late http.Response response;
  if (requestType == 'get') {
    response = await http.get(
      parsedUrl,
      headers: headers,
    );
  } else {
    if (requestType == 'encoded_post') {
      String encodedBody = json.encode(body);
      headers["Content-Type"] = "application/json";
      // {"Content-Type": "application/json"}
      response =
          await http.post(parsedUrl, body: encodedBody, headers: headers);
    } else {
      if (requestType == 'parametered_get') {
        Uri uri = Uri.https(baseUrl!, urlPath!, body);
        response = await http.get(
          uri,
          headers: headers,
        );
      } else {
        response = await http.post(
          parsedUrl,
          body: body,
          headers: headers,
        );
      }
    }
  }
  custom_print(response.body, 'request result is getting  ');
  Map<String, dynamic>? result = (handleJsonResponse(response) is List)
      ? {"result": handleJsonResponse(response)}
      : handleJsonResponse(response);
  print("this is the result " * 100);
  print(result);

  return result ?? {};
}

Future<String> requesterGetToken(
    {required String url,
    Map<String, String> body = const {},
    Map<String, String> headers = const {}}) async {
  String result = '';

  Uri parsedUrl = Uri.parse(url);
  final response = await http.post(
    parsedUrl,
    body: body,
    headers: headers,
  );
  try {
    result = await handleJsonResponse(response)!['access_token'];
  } catch (e) {
    for (int i in [1, 1, 1, 1, 1, 1, 1]) {
      avoid_print('getTokenError');
    }
  }

  return result;
}

Future<Map<String, dynamic>?> fetchData() async {
  final response = await http
      .get(Uri.parse('https://www.elitepage.com.ng/yomcoin/user/entry'));

  return handleJsonResponse(response);
}

Future<Map<String, dynamic>?> getToken(String service) async {
  final response = await http.post(
      Uri.parse('https://www.elitepage.com.ng/yomcoin/user/entry'),
      body: {'service': service});

  return handleJsonResponse(response);
}

dynamic handleJsonResponse(http.Response response) {
  dynamic jsonResponse;
  avoid_print('response.body yen is ' * 40);
  custom_print(response.body, 'to inspect');
  avoid_print(response.body.runtimeType);

  jsonResponse = json.decode(response.body);
  if (response.statusCode == 200) {
    jsonResponse = json.decode(response.body);
  } else {
    // avoid_print('Error: ${response.statusCode}');
  }
  return jsonResponse;
}

class ServerMediator {
  Map sendAirtimeSignal(Map detail) {
    Map result = {};

    return result;
  }

  Map sendDataSignal(Map detail) {
    Map result = {};

    return result;
  }

  Map sendCableSignal(Map detail) {
    Map result = {};

    return result;
  }

  Map sendElectricitySignal(Map detail) {
    Map result = {};

    return result;
  }

  Map sendCryptoSignal(Map detail) {
    Map result = {};

    return result;
  }
}
