import 'package:flutter/material.dart';
import 'package:frontend_challenge/utils/size_device_utils.dart';

class SpaceByWidth extends StatelessWidget {
  final double? space;

  const SpaceByWidth({super.key, required this.space});

  @override
  Widget build(BuildContext context) {
    return SizedBox(width: context.sizedDevice.height / space!);
  }
}

class SpaceByHeigth extends StatelessWidget {
  final double? space;

  const SpaceByHeigth({super.key, required this.space});

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: context.sizedDevice.height / space!);
  }
}
