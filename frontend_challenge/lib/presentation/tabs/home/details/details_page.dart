import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:frontend_challenge/presentation/tabs/home/state_home/state_home.dart';
import 'package:frontend_challenge/presentation/tabs/home_tab.dart';
import 'package:frontend_challenge/routes/app_routes.dart';
import 'package:frontend_challenge/utils/colors/app_colors.dart';
import 'package:frontend_challenge/utils/size_device_utils.dart';

import '../../../../providers/imports.dart';

class DetailsPage extends ConsumerWidget {
  final int id;
  final String urlImg;
  final String title;
  const DetailsPage({
    super.key,
    required this.id,
    required this.urlImg,
    required this.title,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(stateDetails.call(id.toString()));
    return Scaffold(
        backgroundColor: AppColors.colorWhite,
        appBar: AppBar(
          backgroundColor: AppColors.introColorBackGround,
          title: Text(
            title,
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.favorite,
                color: Colors.white,
              ),
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
              SizedBox(
                height: context.sizedDevice.height,
                child: Column(
                  children: [
                    CachedNetworkImage(
                      errorWidget: (context, url, error) => const Center(
                        child: Icon(Icons.error),
                      ),
                      imageUrl: urlImg,
                      fit: BoxFit.fitWidth,
                      width: context.sizedDevice.width,
                      placeholder: (context, url) => const Center(
                          child: CircularProgressIndicator.adaptive()),
                    ),
                  ],
                ),
              ),
              Positioned(
                bottom: 0,
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: AppColors.introColorBackGround.withAlpha(240),
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                  width: context.sizedDevice.width,
                  height: data.plotOverview != null ? 400 : 200,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.bottomLeft,
                          child: Text(
                            "Score: ${data.criticScore ?? 0.0}",
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Align(
                          alignment: Alignment.bottomLeft,
                          child: Row(
                            children: [
                              const Icon(
                                Icons.favorite,
                                color: Colors.red,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                "${data.popularityPercentile ?? "0"}%",
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Row(
                                children: [
                                  const Icon(
                                    Icons.favorite_border_rounded,
                                    color: Colors.white,
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    "${data.relevancePercentile ?? "0"}%",
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            const Icon(
                              Icons.calendar_month,
                              color: Colors.white,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              "${data.year ?? "00.00.00"}",
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          data.plotOverview ?? "",
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.justify,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            const Icon(
                              Icons.tv,
                              color: Colors.white,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              " ${data.networkNames?.map((e) => e) ?? ""}",
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
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
