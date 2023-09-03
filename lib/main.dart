import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:note_app/core/caching_utils/caching_utils.dart';
import 'package:note_app/core/network_utils/network_utils.dart';
import 'package:note_app/core/route_utils/route_utils.dart';

import 'core/utils.dart';
import 'features/home/view.dart';
import 'features/login/view.dart';

void main() async {
  await ScreenUtil.ensureScreenSize();
  await CachingUtils.init();
  await NetworkUtils.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: RouteUtils.navigatorKey,
      debugShowCheckedModeBanner: false,
      builder: (context, child) {
        ScreenUtil.init(
          context,
          designSize: const Size(414, 896),
        );
        return child!;
      },
      theme: Utils.appTheme,
      title: "Notes",
      home: CachingUtils.isLogged ? HomeView() : LoginView(),
    );
  }
}
