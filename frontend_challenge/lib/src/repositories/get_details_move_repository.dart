import 'package:frontend_challenge/src/models/details_move_model.dart';
import 'package:frontend_challenge/src/repositories/interface/get_details_move_i.dart';

import '../../constant/app_url_contant.dart';
import '../services/clients/http_header_service.dart';
import '../services/interfaces/http_client_i.dart';

class GetDetailsMoveRepository implements GetDetailsMoveI {
  final HttpClientI httpClientI;
  ResponseModelDetails? responseModelDetails;

  GetDetailsMoveRepository({required this.httpClientI});

  @override
  Future<ResponseModelDetails> getDetails({required String id}) async {
    try {
      final response = await httpClientI.get(
        route: AppUrlContant.details(id: id),
        headers: HttpHeaderService.headers(),
      );
      if (response.statusCode == 200) {
        responseModelDetails = responseModelDetailsFromMap(response.body);
      }
      return responseModelDetails!;
    } catch (e) {
      return ResponseModelDetails();
    }
  }
}
