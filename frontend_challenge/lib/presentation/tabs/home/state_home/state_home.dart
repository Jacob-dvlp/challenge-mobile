import 'package:frontend_challenge/providers/imports.dart';
import 'package:frontend_challenge/providers/moves_providers.dart';

bool isFullScreen = false;

final stateHome = FutureProvider(
  dependencies: [getMoves],
  (ref) {
    return ref.watch(getMoves).getReleasesMove();
  },
);

final stateDetails = FutureProviderFamily(
  dependencies: [getDetails],
  (ref, arg) {
    final id = arg as String;
    return ref.watch(getDetails).getDetails(id: id);
  },
  
);


