import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:logger/logger.dart';
import 'package:stackoverflow_users/src/core/constants/constants.dart';

import '../core/providers/shared_preferences_provider.dart';

abstract class BaseDataSource {
  Future<dynamic> getCallRequest(String url);
}

class BaseDataSourceImpl implements BaseDataSource {
  final String _baseUrl;
  late String token;
  late http.Client _client;
  final logger = Logger(
    level: Level.verbose,
    printer: PrettyPrinter(
        methodCount: 2,
        errorMethodCount: 8,
        lineLength: 120,
        colors: true,
        printEmojis: true,
        printTime: false),
  );

  BaseDataSourceImpl({required String url}) : _baseUrl = url {
    _client = http.Client();
  }

  @override
  Future<dynamic> getCallRequest(String url) async {
    Request request = Request('GET', Uri.parse(_baseUrl + url));
    request.headers[Constants.headers.accept] = Constants.headers.acceptValue;
    request.headers[Constants.headers.acceptLanguage] = Constants.locale.en;

    logger.i('apiUrl: ${_baseUrl + url}');

    final response = await _client.send(request);

    logger.i('response.statusCode: ${response.statusCode}');

    if (response.statusCode == 200 || response.statusCode == 201) {
      final responseBody = jsonDecode(await response.stream.bytesToString());
      logger.i('response.body: $responseBody');

      return responseBody;
    } else {
      final error = await response.stream.bytesToString();
      logger.e('Failed to fetch data $error');

      throw Exception('Failed to fetch data $error');
    }
  }
}
