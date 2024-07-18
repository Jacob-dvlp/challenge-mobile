import '../../../../../providers/app_providers.dart';
import '../../../../../providers/imports.dart';

final stateDetails = FutureProviderFamily(
  dependencies: [getDetails],
  (ref, arg) {
    final id = arg as String;
    return ref.watch(getDetails).getDetails(
          id: id,
        );
  },
);
