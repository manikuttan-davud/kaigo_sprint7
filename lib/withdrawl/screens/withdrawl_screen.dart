import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kaigo_sprint7/utils/colors.dart';
import 'package:kaigo_sprint7/utils/text_style.dart';

class WithdrawlScreen extends StatefulWidget {
  static const route = '/withdrawl_screen';
  const WithdrawlScreen({super.key});

  @override
  State<WithdrawlScreen> createState() => _WithdrawlScreenState();
}

class _WithdrawlScreenState extends State<WithdrawlScreen> {
  final int balance=int.parse("5000");
    final controller=TextEditingController();
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    RxBool isActive=false.obs;
    RxBool isLoading=false.obs;
    RxBool isError=false.obs;
    @override
  void initState() {
    
    super.initState();
     controller.addListener(() {
      
      isActive.value=controller.text.isNotEmpty;
  });
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorFFFFFF,
      appBar: AppBar(
        backgroundColor: colorFFFFFF ,
        shadowColor: Colors.transparent,
        leading: const Icon(Icons.arrow_back_ios,color: color45303030,),
        title: Text('出金',style:  ts30S14C0xW500 ,),
        centerTitle: true,
      ),
      body: Form(
        
        key: _formKey,
        child: Column(
          
          children: [
            Padding(
              padding:  EdgeInsets.only(left: 24.w,right: 25.w,top: 23.h),
              //containet that shows balance amount
              child: FirstContainer(balance: balance),
            ),
            SizedBox(height: 24.h,),
           //hint text
            const WithdrawlAmountText(),
            SizedBox(height: 4.h,),
             Row(
              children: [
                //for entering withdrawl amount
                TextFormFieldWidget(controller: controller, formKey: _formKey, balance: balance, isError: isError, isActive: isActive,),
                //submit button button
                WithdrawlButton(isActive: isActive, isLoading: isLoading, formKey: _formKey, controller: controller)
              ],
            ),
          const LastText()
          ],
        ),
      ),
      );
  }
}

class LastText extends StatelessWidget {
  const LastText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(left: 24.w,top: 7.h),
      child: SizedBox(
        width: 1.sw,
        child: Text('・出金時にかかる220円の手数料は自己負担になります',style:tsS11C0x400 ,)),
    );
  }
}

class WithdrawlButton extends StatelessWidget {
  const WithdrawlButton({
    Key? key,
    required this.isActive,
    required this.isLoading,
    required GlobalKey<FormState> formKey,
    required this.controller,
  }) : _formKey = formKey, super(key: key);

  final RxBool isActive;
  final RxBool isLoading;
  final GlobalKey<FormState> _formKey;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 14.w,right: 24.w),
      child: SizedBox(
        width: 73.w,
        height: 41.h,
        child: Obx(
           () {
            return 
               ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(27.5.r)
                ),
                backgroundColor: colorFAAA14 ,
                disabledBackgroundColor: Colors.orange[100]
              ), 
       onPressed:isActive.value?  (() {
      
        isLoading.value=true;
        Future.delayed((const Duration(seconds: 1)),(() {
          isLoading.value=false;
        }));
               if (_formKey.currentState!.validate()){
              isLoading.value=true;
               Future.delayed(const Duration(seconds: 1), (){
    
      isLoading.value = false;
       controller.clear();
    }
    );
               }
         
                controller.clear();
              
      }
      
      
      ):null,
       child:isLoading.value? SizedBox(
        width: 18.98.w,
        height: 18.85.w,
        child: CircularProgressIndicator(strokeWidth: 1.w,color: colorFFFFFF,)):  Padding(
         padding:  EdgeInsets.only(left: 7.37.w),
         child: Text('出金',style: tsS16C0x500,),
       ));
       
       
          
      
          }
        ),
    )
    );
  }
}

class TextFormFieldWidget extends StatelessWidget {
  const TextFormFieldWidget({
    Key? key,
    required this.controller,
    required GlobalKey<FormState> formKey,
    required this.balance,
    required this.isError, required this.isActive,
  }) : _formKey = formKey, super(key: key);

  final TextEditingController controller;
  final GlobalKey<FormState> _formKey;
  final int balance;
  final RxBool isError;
  final RxBool isActive;
  @override
  Widget build(BuildContext context) {
    return Flexible(child: Padding(
      padding:  EdgeInsets.only(left: 24.w),
      child: SizedBox(
        width: 240.w,
       // height: 42.h,
        child: Obx(
           () {
            return TextFormField(
              
              controller: controller,
              cursorColor:colorFAAA14 ,
              //cursorHeight: 17.h,
              keyboardType: const TextInputType.numberWithOptions(),
              inputFormatters: [
               // ThousandsFormatter(),
             FilteringTextInputFormatter.allow(RegExp('[0-9]')),
             
          ],
           onFieldSubmitted: ((value) {
           _formKey.currentState?.validate();
         }),
        
         validator: ((  value) {
           if(value ==null ||double.parse(value)>balance ){
            isError.value=true;
             return "you have exceeded your withdrawl balance";
           }else{
             return null;
             
           }
         }),
              decoration:  InputDecoration(
                prefixIcon: isError.value?SizedBox(
                  width: 16.68.w,
                  height: 15.01.h,
                  child:  Padding(
                    padding: EdgeInsets.only(bottom: 8.h),
                    child: const Icon(Icons.warning_amber_outlined,color: colorFF6262,),
                  )):null,
                  border: const OutlineInputBorder(
                    borderSide: BorderSide(width: 1)
                  ),
              enabledBorder:   const OutlineInputBorder(
                
                borderSide: BorderSide(color:colorF3F3F3,width:1 )
                
                ),
                focusedBorder:  OutlineInputBorder(
                
                borderSide: const BorderSide(color:colorFAAA14,width:1 ),
                borderRadius: BorderRadius.circular(9.r),
                ),
               
               
              ),
            );
          }
        ),
      ),
    ));
  }
}

class WithdrawlAmountText extends StatelessWidget {
  const WithdrawlAmountText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(left: 28.h),
      child: SizedBox(
        width: 1.sw,
        child: Text('出金額を入力してください',style:tsS12C0x400 ,)),
    );
  }
}

class FirstContainer extends StatelessWidget {
  const FirstContainer({
    Key? key,
    required this.balance,
  }) : super(key: key);

  final int balance;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 326.w,
      height: 93.h,
     decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(9.r),
      color: colorF7F7F7
     ),
     child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding:  EdgeInsets.only(top: 18.h),
          child: Text('${balance} 円',style:tsS26C0xW700 ,),
        ),
      SizedBox(height: 5.h,),
         Padding(
           padding:  EdgeInsets.only(bottom: 18.h),
           child: Text( '出金可能残高',style:tsS12C0xW400  ,),
         )
      
      ],
     ),
    );
  }
}