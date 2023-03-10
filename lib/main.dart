import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:kaigo_sprint7/utils/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
       designSize: const Size(375, 812),
        builder: (context, child) {
      return GetMaterialApp(
      
        theme: ThemeData(
         
          primarySwatch: Colors.blue,
        ),
     initialRoute: initialRoute,
        getPages: appRoutes(),
      );
   } );
  }
}

