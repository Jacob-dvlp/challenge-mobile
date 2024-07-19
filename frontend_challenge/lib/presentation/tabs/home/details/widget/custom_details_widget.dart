import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:frontend_challenge/utils/size_device_utils.dart';

import '../../../../../src/repositories/imports.dart';
import '../../../../../utils/colors/app_colors.dart';

class CustomDetailsWidget extends StatelessWidget {
  final ResponseModelDetails data;
  const CustomDetailsWidget({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: AppColors.introColorBackGround.withAlpha(240),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      width: context.sizedDevice.width,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Align(
              alignment: Alignment.bottomLeft,
              child: Text("Score: ${data.criticScore ?? 0.0}",
                  style: Theme.of(context).textTheme.bodyMedium),
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
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text("${data.popularityPercentile ?? "0"}%",
                      style: Theme.of(context).textTheme.bodyMedium),
                  const SizedBox(
                    width: 5,
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.favorite_border_rounded,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text("${data.relevancePercentile ?? "0"}%",
                          style: Theme.of(context).textTheme.bodyMedium),
                    ],
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
                Text("${data.year ?? "00.00.00"}",
                    style: Theme.of(context).textTheme.bodyMedium),
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              data.plotOverview ?? "",
              style: Theme.of(context).textTheme.bodyMedium,
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
                Text(" ${data.networkNames?.map((e) => e) ?? ""}",
                    style: Theme.of(context).textTheme.bodyMedium),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class CustomDetailsWidgetImag extends StatelessWidget {
  final String urlImg;
  const CustomDetailsWidgetImag({
    super.key,
    required this.urlImg,
  });

  @override
  Widget build(BuildContext context) {
    final size = context.sizedDevice.width;

    return SizedBox(
      height: context.sizedDevice.height,
      width: size,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            CachedNetworkImage(
              errorWidget: (context, url, error) => const Center(
                child: Icon(Icons.error),
              ),
              imageUrl: urlImg,
              fit: BoxFit.fitWidth,
              width: size >= sizeWeb ? size / 3.5 : context.sizedDevice.width,
              placeholder: (context, url) =>
                  const Center(child: CircularProgressIndicator.adaptive()),
            ),
          ],
        ),
      ),
    );
  }
}
