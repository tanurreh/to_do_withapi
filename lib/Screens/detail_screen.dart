import 'package:agr_app/Model/AgriculturalModel.dart';
import 'package:agr_app/Model/Chararcteristic.dart';
import 'package:agr_app/Widget/add_space.dart';
import 'package:agr_app/Widget/graph.dart';
import 'package:agr_app/Widget/text_widgets.dart';
import 'package:agr_app/data/data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class AgriDetailScreen extends StatelessWidget {
  const AgriDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AddCustomSpace(width: 0, height: 30.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.w),
          child: Row(
            children: [
              InkWell(
                onTap: () {
                  Get.back();
                },
                child: Icon(
                  Icons.arrow_back_ios,
                  size: 18.sp,
                  color: CustomColor.kblack,
                ),
              ),
              const Spacer(),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomText(
                      text: "Vegetable Garden",
                      textStyle: CustomTextStyle.kmedTextStyle,
                      color: CustomColor.kblack,
                      fontWeight: CustomFontWeight.kBoldFontWeight),
                  CustomText(
                      text: "Talak, Patwario",
                      textStyle: CustomTextStyle.ksearchTextStyle,
                      color: CustomColor.klightgrey,
                      fontWeight: CustomFontWeight.kBoldFontWeight),
                ],
              ),
              const Spacer(),
              Container(
                height: 50.h,
                width: 50.w,
                decoration: BoxDecoration(
                  color: CustomColor.kwhite,
                  border: Border.all(
                    color: CustomColor.klightgrey,
                  ),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.more_horiz,
                  size: 25.sp,
                  color: CustomColor.kblack,
                ),
              )
            ],
          ),
        ),
        AddCustomSpace(width: 0, height: 30.h),
        Container(
          margin: EdgeInsets.only(
            left: 20.w,
          ),
          height: 390.h,
          width: 340.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.r),
            boxShadow: boxshadow,
            color: CustomColor.kwhite,
          ),
          child: Column(children: [
            AddCustomSpace(width: 0, height: 15.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Row(
                children: [
                  CustomText(
                      text: "Harvest",
                      textStyle: CustomTextStyle.ktextTextStyle,
                      color: CustomColor.kblack,
                      fontWeight: CustomFontWeight.kBoldFontWeight),
                  const Spacer(),
                  Container(
                    height: 40.h,
                    width: 90.w,
                    decoration: BoxDecoration(
                      color: CustomColor.kwhite,
                      border: Border.all(
                        color: CustomColor.klightgrey,
                      ),
                      borderRadius: BorderRadius.circular(16.r),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.favorite,
                          size: 18.sp,
                          color: CustomColor.kprimarygreen,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            AddCustomSpace(width: 0, height: 10.h),
            const BarGraph(),
            Row(
              children: [
                AddCustomSpace(width: 10.w, height: 0),
                Icon(
                  Icons.square,
                  size: 18.sp,
                  color: CustomColor.kopacitygrey,
                ),
                AddCustomSpace(width: 5.w, height: 0),
                CustomText(
                    text: "Red Chilli",
                    textStyle: CustomTextStyle.ksearchTextStyle,
                    color: CustomColor.klightgrey,
                    fontWeight: CustomFontWeight.kBoldFontWeight),
                AddCustomSpace(width: 10.w, height: 0),
                Icon(
                  Icons.square,
                  size: 18.sp,
                  color: CustomColor.kred,
                ),
                AddCustomSpace(width: 5.w, height: 0),
                CustomText(
                    text: "Green Tomatoes",
                    textStyle: CustomTextStyle.ksearchTextStyle,
                    color: CustomColor.klightgrey,
                    fontWeight: CustomFontWeight.kBoldFontWeight),
              ],
            )
          ]),
        ),
        Padding(
          padding: EdgeInsets.only(left: 20.w, top: 20.h, bottom: 10.h),
          child: CustomText(
              text: "Characteristic",
              textStyle: CustomTextStyle.kmedTextStyle,
              color: CustomColor.kblack,
              fontWeight: CustomFontWeight.kBoldFontWeight),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: charlist.length,
            itemBuilder: (BuildContext context, int index) {
              return Column(
                children: [
                  SoilListTile(
                    agridata: charlist[index],
                  ),
                  AddCustomSpace(width: 0, height: 8.h),
                ],
              );
            },
          ),
        )
      ],
    ));
  }
}

class SoilListTile extends StatelessWidget {
  final Characteristic agridata;
  const SoilListTile({
    Key? key,
    required this.agridata,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 85.h,
      width: 340.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: boxshadow,
        color: CustomColor.kwhite,
      ),
      child: ListTile(
        //contentPadding: EdgeInsets.only(right: 30.w, left: 20.w),
        leading:
            Container(height: 65.h, width: 65.h, color: agridata.contColour),
        title: CustomText(
            text: agridata.title,
            textStyle: CustomTextStyle.ktextTextStyle,
            color: CustomColor.kblack,
            fontWeight: CustomFontWeight.kBoldFontWeight),
        subtitle: CustomText(
            text: agridata.subtitle,
            textStyle: CustomTextStyle.ksearchTextStyle,
            color: CustomColor.klightgrey,
            fontWeight: CustomFontWeight.kBoldFontWeight),
        trailing: Padding(
          padding: EdgeInsets.only(left: 20.w),
          child: CustomText(
              text: "${agridata.percentage}%",
              textStyle: CustomTextStyle.kmedTextStyle,
              color: CustomColor.kblack,
              fontWeight: CustomFontWeight.kBoldFontWeight),
        ),
      ),
    );
  }
}
