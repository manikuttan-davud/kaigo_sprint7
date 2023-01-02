import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:kaigo_sprint7/screen/cancel_screen.dart';
import 'package:kaigo_sprint7/withdrawl/screens/withdrawl_screen.dart';

class HomeScreen extends StatelessWidget {
   static const route = '/home_screen';
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          ElevatedButton(onPressed: (() {
        Get.to(() => const  WithdrawlScreen());
          }), child: const Text('WithdrawlScreen')
      ),
      SizedBox(width: 15.w,),
      ElevatedButton(onPressed: (() {
        Get.to(() => const  CancelScreen());
          }), child: const Text('CancelScreen')
      ),
      ],
     
      ),
    );
  }
}