import 'package:flutter/material.dart';
import 'package:frontend_challenge/presentation/tabs/home/details/widget/custom_details_widget.dart';
import 'package:frontend_challenge/presentation/tabs/home_tab.dart';
import 'package:frontend_challenge/routes/app_routes.dart';
import 'package:frontend_challenge/utils/colors/app_colors.dart';
import 'package:hive_flutter/adapters.dart';

import '../../../../providers/imports.dart';
import '../../../../src/models/local_storage_data_model.dart';
import '../../../../src/repositories/imports.dart';
import '../../state/state_controller.dart';
import 'state_details/state_details.dart';

class DetailsPage extends ConsumerWidget {
  final ReleaseMove releaseMove;
  const DetailsPage({
    super.key,
    required this.releaseMove,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(stateDetails.call(releaseMove.id.toString()));
    return Scaffold(
        backgroundColor: AppColors.colorWhite,
        appBar: AppBar(
          backgroundColor: AppColors.introColorBackGround,
          title: Text(
            releaseMove.title!,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          centerTitle: true,
          actions: [
            ValueListenableBuilder(
              valueListenable: Hive.box(favoriteTable).listenable(),
              builder: (context, box, child) {
                return IconButton(
                  onPressed: () {
                    box.get(releaseMove.id.toString()) == null
                        ? ref.watch(
                            putStorage.call(
                              LocalStorageDataModel(
                                index: releaseMove.id.toString(),
                                data: LocalStorageDataMoveModel(
                                    id: releaseMove.id.toString(),
                                    urlImg: releaseMove.posterUrl!,
                                    title: releaseMove.title!),
                              ),
                            ),
                          )
                        : ref.watch(
                            removeFavorite.call(
                              LocalStorageDataModel(
                                  index: releaseMove.id.toString()),
                            ),
                          );
                  },
                  icon: box.get(releaseMove.id.toString()) == null
                      ? const Icon(Icons.favorite_outline_rounded,
                          color: Colors.red)
                      : const Icon(
                          Icons.favorite,
                          color: Colors.red,
                        ),
                );
              },
            )
          ],
          leading: GestureDetector(
              onTap: () =>
                  AppRoutes.pageWithoutReturn(context, page: const HomeTab()),
              child: const Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
              )),
        ),
        body: state.when(
          data: (data) => Stack(
            children: [
              CustomDetailsWidgetImag(urlImg: releaseMove.posterUrl!),
              Positioned(
                bottom: 0,
                child: CustomDetailsWidget(data: data),
              )
            ],
          ),
          error: (error, stackTrace) => Center(
            child: Text(
              error.toString(),
            ),
          ),
          loading: () => const Center(
            child: CircularProgressIndicator.adaptive(),
          ),
        ));
  }
}
