import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kaigo_sprint7/screen/cancel_screen.dart';

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
      return MaterialApp(
      
        theme: ThemeData(
         
          primarySwatch: Colors.blue,
        ),
        home: const CancelScreen(),
      );
   } );
  }
}

