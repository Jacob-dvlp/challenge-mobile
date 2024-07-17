import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:frontend_challenge/presentation/tabs/home/details/details_page.dart';
import 'package:frontend_challenge/routes/app_routes.dart';
import 'package:frontend_challenge/utils/size_device_utils.dart';

import '../../../../providers/imports.dart';
import '../../../../src/repositories/imports.dart';
import '../../../../utils/colors/app_colors.dart';

class CustomCardWidget extends ConsumerWidget {
  final ReleaseMove releaseMove;
  const CustomCardWidget({
    super.key,
    required this.releaseMove,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () => AppRoutes.pageWithoutReturn(context,
            page: DetailsPage(
              title: releaseMove.title,
              id: releaseMove.id,
              urlImg: releaseMove.posterUrl,
            )),
        child: Card(
          elevation: 10,
          shape: UnderlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(10)),
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Stack(
              children: [
                CachedNetworkImage(
                    imageUrl: releaseMove.posterUrl,
                    imageBuilder: (context, imageProvider) => Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                              image: imageProvider,
                              fit: BoxFit.cover,
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
                      child: CircleAvatar(
                        backgroundColor: AppColors.introColorBackGround,
                        child: IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.favorite_outline_rounded,
                                color: AppColors.colorWhite)),
                      ),
                    )),
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
                        releaseMove.title,
                        style: TextStyle(
                            color: AppColors.colorWhite,
                            fontWeight: FontWeight.bold),
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
