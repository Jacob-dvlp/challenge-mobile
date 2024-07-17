import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

PageController pageController = PageController();

final indexPage = StateProvider<int>((ref) => 0);
