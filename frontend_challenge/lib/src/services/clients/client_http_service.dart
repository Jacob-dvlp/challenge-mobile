import 'dart:io';

import 'package:frontend_challenge/constant/app_url_contant.dart';
import 'package:http/http.dart';
import 'package:http/io_client.dart';

import '../interfaces/http_client_i.dart';

class ClientHttpService implements HttpClientI {
  final _ioc = HttpClient();
  late Client _client;

  ClientHttpService() {
    _ioc.badCertificateCallback =
        (X509Certificate cert, String host, int port) => true;
    _client = IOClient(_ioc);
  }

  @override
  Future<Response> get(
      {required String route, required Map<String, dynamic> headers}) async {
    try {
      final response = await _client.get(Uri.parse(AppUrlContant.baseUrl),
          headers: headers.cast<String, String>());
      return response;
    } catch (e) {
      return Response(
          "{\"data\": null, \"message\": \"Ocorreu um erro interno\"}", 500);
    }
  }
}
