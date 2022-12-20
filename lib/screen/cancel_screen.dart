

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kaigo_sprint7/utils/colors.dart';
import 'package:kaigo_sprint7/utils/text_style.dart';

class CancelScreen extends StatefulWidget {
  const CancelScreen({super.key});

  @override
  State<CancelScreen> createState() => _CancelScreenState();
}

class _CancelScreenState extends State<CancelScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: colorFFFFFF ,
        shadowColor: colorRGBO1,
        leading: const Icon(Icons.arrow_back_ios,color: color45303030,),
        title: Text('キャンセルポリシー',style: tsS14C0xW700 ,),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              //First white colour container
              const FirstContainer(),
              SizedBox(height: 10.h,),
               //Second white colour containe
              const SecondContainer(),
              SizedBox(height: 10.h,),
              //+ points table
              const PointsTableWidget(),
              SizedBox(height: 10.h,),
              //Third white colour container
              const ThirdContainer()
            ],
          ),
        ),
      ),
    );
  }
}

class PointsTableWidget extends StatelessWidget {
  const PointsTableWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1.sw,
      height: 620.h,
      color: colorFFFFFF,
      child: Column(
        children:  [
          Padding(
            padding:  EdgeInsets.only(top: 37.h),
            child: const PointsWidget(points: '+2pt', text: '7日前のキャンセル',),
          ),
          SizedBox(height: 12.h,),
          Divider(color: colorBABABA,endIndent: 22.w,indent: 22.w,),
          const PointsWidget(points: '+3pt', text: '7日前のキャンセル'),
          SizedBox(height: 12.h,),
           Divider(color: colorBABABA,endIndent: 22.w,indent: 22.w,),
          const PointsWidget(points: '+4pt', text:'7日前のキャンセル' ),
          SizedBox(height: 12.h,),
           Divider(color: colorBABABA,endIndent: 22.w,indent: 22.w,),
          const PointsWidget(points: '+6pt', text:'7日前のキャンセル'),
          SizedBox(height: 12.h,),
           Divider(color: colorBABABA,endIndent: 22.w,indent: 22.w,),
          const PointsWidget(points: '+8pt', text: '無断欠勤'),
          SizedBox(height: 12.h,),
           Divider(color: colorBABABA,endIndent: 22.w,indent: 22.w,),
           //widget Contains Red text
          const RedTextWidget(),
          SizedBox(height: 12.h,),
           Divider(color: colorBABABA,endIndent: 22.w,indent: 22.w,),
       
        ],
      ),
    );
  }
}

class RedTextWidget extends StatelessWidget {
  const RedTextWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(left: 24.w,right: 25.w,bottom: 19.h,top: 12.h),
      child: SizedBox(
        width: 1.sw,
        //height: 60.w,
        child: Row(
          children: [
           SizedBox(
            width: 60.w,
            height: 60.w,
            child: Text('応募停止',style: tsS24C0xW700 ,)),
            SizedBox(width: 16.w,),
             Flexible(child: Text('累積 8 pt以上ペナルティポイントが溜まった場合は、新規求人・採用応募ができなくなります。',style: tsS13C0x400 ,)),
          ],
        ),
        
     
      ),
    
    );
  }
}

class SecondContainer extends StatelessWidget {
  const SecondContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1.sw,
      height: 150.h,
     color:colorFFFFFF,
     child: Column(
      children: [
        SizedBox(
          width: 1.sw,
          child: Padding(
            padding: EdgeInsets.only(left: 24.w,top: 27.w),
            child: Text('2. ペナルティポイントが付与されるケース',style:tsS14C0xW500 ,),
          ),
        ),
        SizedBox(height: 12.h,),
        SizedBox(
          width: 1.sw,
          child: Padding(
            padding:  EdgeInsets.only(left: 24.w,right: 24.w),
            child: Text('・勤務確定済みの応募をキャンセルした場合',style: tsS13C0x400 ,),
          ),
        ),
        SizedBox(
          width: 1.sw,
          child: Padding(
            padding:  EdgeInsets.only(left: 24.w,),
            child: Text('・無断欠勤を行った場合',style:  tsS13C0x400,),
          ),
        )
      ]),
    );
  }
}

class FirstContainer extends StatelessWidget {
  const FirstContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(top: 10.h),
      child: Container(
        width: 1.sw,
        height: 300.h,
        color:colorFFFFFF,
       child: Column(
        children: [
         SizedBox(
          width: 1.sw,
           child: Padding(
              padding:  EdgeInsets.only(left: 24.w,top: 37.h),
              child: Text('1.ペナルティポイント付与数の上限',style:tsS14C0xW500 ,),
            ),
         ),
          SizedBox(height: 12.h,),
          SizedBox(
            width: 1.sw,
            child: Padding(
              padding:  EdgeInsets.only(left: 24.w,right: 24.w
              ),
              child: Text('ペナルティポイント付与数の上限は 8P です。付与されたペナルティポイント数が 8P に達すると、アカウントが一時停止となり求人 / 採用募集への応募ができなくなります。一時停止を解除するには事務局にお問い合わせください。事務局によりアカウントの一時停止が解除されますと、ペナルティポイント数が4ポイントの状態から再度利用を開始することができます。',style: tsS13C0x400,),
            ),
          )
        ],
       ),
      ),
    );
  }
}

class ThirdContainer extends StatelessWidget {
  const ThirdContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(bottom: 87.h),
      child: Container(
        width: 1.sw,
        height: 180.h,
        color:colorFFFFFF,
        child: Column(
            children: [
              SizedBox(
                width: 1.sw,
                child: Padding(
                  padding:  EdgeInsets.only(left: 24.w,top: 27.h),
                  child: Text('3. 付与されたペナルティポイントが減少するケース',style:tsS14C0xW500 ,),
                ),
              ),
              SizedBox(height: 12.h,),
              SizedBox(
                width: 1.sw,
                child: Padding(
                padding:  EdgeInsets.only(left: 24.w),
                child: Text('・勤務確定済みの応募をキャンセルした場合',style: tsS13C0x400,),
              )),
              SizedBox(
                width: 1.sw,
                child: Padding(
                padding:  EdgeInsets.only(left: 24.w),
                child: Text('・最後にペナルティポイントが付与された日から30日',style:tsS13C0x400 ,),
              )),
              SizedBox(
                width: 1.sw,
                child: Padding(
                padding:  EdgeInsets.only(left:36.w ),
                child: Text('ごとに4pt減少する',style: tsS13C0x400 ,),
              ))

            ],
        ),
      ),
    );
  }
}

class PointsWidget extends StatelessWidget {
  final String points;
  final String text;
  const PointsWidget({
    Key? key, required this.points, required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 1.sw,
      height: 48.h,
      child: Row(
        children: [
          Padding(
            padding:  EdgeInsets.only(left:24.w,top: 10.h ),
            child: Text(points,style: tsS14C0xW700,),
          ),
          SizedBox(width: 16.w,),
          Padding(
         padding:  EdgeInsets.only(left:24.w,top: 10.h ),
            child: Text(text,style:tsS13C0x400 ,),
          )
        ],
      ),
    );
  }
}