import 'imports.dart';
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
      if (response.statusCode == HttpStatus.ok) {
        responseModelDetails = responseModelDetailsFromMap(
          response.body,
        );
      }
      return responseModelDetails!;
    } catch (e) {
      return ResponseModelDetails();
    }
  }
}
