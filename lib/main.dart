import 'package:flutter/material.dart';
import 'package:project_learning/modules/home/home_page.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:get/get.dart';

void main() {
  runApp(AppWidget());
}

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      builder: (context, widget) => ResponsiveWrapper.builder(
        ClampingScrollWrapper.builder(
          context,
          HomePage(),
        ),
        defaultScale: true,
        minWidth: double.infinity,
        defaultName: MOBILE,
        breakpoints: [
          ResponsiveBreakpoint.resize(450, name: MOBILE),
          ResponsiveBreakpoint.resize(700, name: TABLET),
          ResponsiveBreakpoint.resize(800, name: DESKTOP),
        ],
      ),
      home: HomePage(),
    );
  }
}
