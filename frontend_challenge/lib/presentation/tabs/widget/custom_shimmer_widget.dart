import 'package:flutter/material.dart';
import 'package:frontend_challenge/utils/colors/app_colors.dart';
import 'package:frontend_challenge/utils/size_device_utils.dart';
import 'package:shimmer/shimmer.dart';

class CustomShimmerWidget extends StatelessWidget {
  const CustomShimmerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final size = context.sizedDevice.width;
    return SizedBox(
        child: GridView.builder(
      itemCount: 17,
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: size >= sizeWeb ? 4 : 2,
        mainAxisExtent: 250,
      ),
      itemBuilder: (context, index) => Container(
        alignment: Alignment.center,
        margin: EdgeInsets.only(
            left: 15,
            right: 15,
            top: size >= sizeWeb ? 3 : 10,
            bottom: size >= sizeWeb ? 3 : 10),
        child: Shimmer.fromColors(
          baseColor: Colors.grey.shade200,
          highlightColor: AppColors.colorWhite,
          child: Container(
              width: MediaQuery.of(context).size.width,
              height: context.sizedDevice.height / 4.7,
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(6),
              )),
        ),
      ),
    ));
  }
}
