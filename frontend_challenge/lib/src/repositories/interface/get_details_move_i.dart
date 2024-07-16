import '../../models/details_move_model.dart';

abstract interface class GetDetailsMoveI {
  Future<ResponseModelDetails> getDetails({required String id});
}
