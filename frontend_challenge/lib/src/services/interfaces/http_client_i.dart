import 'package:http/http.dart';

abstract interface class HttpClientI {
  Future<Response> get(
      {required String route, required Map<String, dynamic> headers});
}
