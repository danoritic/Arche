import 'dart:async';
import 'dart:convert';

import 'package:shelf/shelf.dart' as shelf;
import 'package:shelf/shelf_io.dart' as shelf_io;
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:http/http.dart';

Future<List<String>> getData() async {
  List<String> result = [];
  Uri uri = Uri.parse('https://api.binance.com/api/v3/exchangeInfo');
  Response resp = await get(uri);

  Map<String, dynamic> rawResult = json.decode(resp.body);

  if (resp.statusCode == 200) {
    for (var i in rawResult["symbols"]) {
      result.add("${i['symbol'].toString().toLowerCase()}@ticker");
    }
  }

  return result;
}

/// connect to binance websocket
connectToServer(tickerList) {
  WebSocketChannel channelHome = IOWebSocketChannel.connect(
    Uri.parse('wss://stream.binance.com:9443/ws/stream?'),
  );

  var subRequestHome = {
    'method': "SUBSCRIBE",
    'params': tickerList,
    'id': 1,
  };

  var jsonString = json.encode(subRequestHome);
  channelHome.sink.add(jsonString);
  var result = channelHome.stream.transform(
    StreamTransformer<dynamic, dynamic>.fromHandlers(
      handleData: (number, sink) {
        sink.add(number);
      },
    ),
  );
  result.listen((event) {
    var snapshot = jsonDecode(event);

    updateCoin(snapshot['s'].toString(), snapshot['c'].toString(),
        snapshot['P'].toString());
  });
}

void updateCoin(String a, String b, String c) {
  print([a, b, c]);
}
