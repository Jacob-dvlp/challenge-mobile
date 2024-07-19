import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:frontend_challenge/presentation/tabs/home/details/details_page.dart';
import 'package:frontend_challenge/routes/app_routes.dart';
import 'package:frontend_challenge/src/models/local_storage_data_model.dart';
import 'package:frontend_challenge/utils/size_device_utils.dart';
import 'package:hive_flutter/adapters.dart';

import '../../../providers/imports.dart';
import '../../../src/repositories/imports.dart';
import '../../../utils/colors/app_colors.dart';
import '../state/state_controller.dart';

class CustomCardWidget extends ConsumerWidget {
  final ReleaseMove releaseMove;
  const CustomCardWidget({
    super.key,
    required this.releaseMove,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = context.sizedDevice.width;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () => AppRoutes.pageWithoutReturn(context,
            page: DetailsPage(
              releaseMove: releaseMove,
            )),
        child: Card(
          shape: UnderlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(10)),
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Stack(
              children: [
                CachedNetworkImage(
                    imageUrl: releaseMove.posterUrl!,
                    imageBuilder: (context, imageProvider) => Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                              image: imageProvider,
                              fit: size == sizeWeb ? BoxFit.fill : BoxFit.cover,
                            ),
                          ),
                        ),
                    placeholder: (context, url) => const Center(
                        child: CircularProgressIndicator.adaptive()),
                    errorWidget: (context, url, error) {
                      return const Center(child: Icon(Icons.error));
                    }),
                Positioned(
                  right: 0,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ValueListenableBuilder(
                      valueListenable: Hive.box(favoriteTable).listenable(),
                      builder: (context, box, child) {
                        return CircleAvatar(
                          backgroundColor: AppColors.introColorBackGround,
                          child: IconButton(
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
                                ? const Icon(
                                    Icons.favorite_outline_rounded,
                                  )
                                : const Icon(
                                    Icons.favorite,
                                  ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  left: 0,
                  child: Container(
                    width: context.sizedDevice.width,
                    decoration: BoxDecoration(
                        color: AppColors.introColorBackGround.withAlpha(220),
                        borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(10),
                            bottomRight: Radius.circular(10))),
                    height: 40,
                    child: Center(
                      child: Text(
                        releaseMove.title!,
                        style: Theme.of(context).textTheme.titleLarge,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
