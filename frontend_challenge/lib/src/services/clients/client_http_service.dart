import 'package:frontend_challenge/constant/app_url_contant.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

import '../interfaces/http_client_i.dart';

class ClientHttpService implements HttpClientI {
  @override
  Future<Response> get(
      {required String route, required Map<String, dynamic> headers}) async {
    try {
      final response = await http.get(
        Uri.parse("${AppUrlContant.baseUrl}$route"),
        headers: headers.cast<String, String>(),
      );
      return response;
    } catch (e) {
      return Response(
        "{\"data\": null, \"message\": \"Ocorreu um erro interno\"}",
        500,
      );
    }
  }
}
