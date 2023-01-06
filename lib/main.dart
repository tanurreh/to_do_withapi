import 'package:agr_app/Screens/api_home.dart';
import 'package:agr_app/Screens/dash_board_screen.dart';
import 'package:agr_app/data/themedata.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 840),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
          defaultTransition: Transition.rightToLeft,
          debugShowCheckedModeBanner: false,
          title: 'Agriculture App',
          theme: primaryTheme,
          home: child,
        );
      },
      child: const DashBoardScreen(),
    );
  }
}
