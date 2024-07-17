import 'package:flutter/material.dart';

import '../../../utils/colors/app_colors.dart';

class CustomBtnItemMenu extends StatelessWidget {
  final IconData? icon;
  final String? title;
  final bool? isEnable;
  final Function()? onTap;

  const CustomBtnItemMenu(
      {super.key, this.icon, this.title, this.isEnable = true, this.onTap});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: isEnable! ? 100 : 30,
        height: 40,
        padding: const EdgeInsets.symmetric(vertical: 5),
        decoration: BoxDecoration(
            color: AppColors.introColorBackGround,
            borderRadius: BorderRadius.circular(30)),
        child: Center(
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            physics: const NeverScrollableScrollPhysics(),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(icon, color: AppColors.colorWhite),
                const SizedBox(
                  width: 5,
                ),
                Text(
                  title!,
                  style: TextStyle(color: AppColors.colorWhite),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
