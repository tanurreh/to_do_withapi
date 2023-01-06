// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:agr_app/Model/AgriculturalModel.dart';
import 'package:agr_app/Widget/add_space.dart';
import 'package:agr_app/Widget/text_widgets.dart';
import 'package:agr_app/data/data.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        SizedBox(
          height: 330.h,
          child: Stack(
            children: [
              Column(
                children: [
                  Container(
                    height: 250.h,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(24.r),
                        bottomRight: Radius.circular(24.r),
                      ),
                      color: CustomColor.klightishblue,
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(
                        top: 40.h,
                        left: 30.w,
                        right: 30.w,
                      ),
                      child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomText(
                                    text: "Good Morning",
                                    textStyle: CustomTextStyle.ksmallTextStyle,
                                    color: CustomColor.kwhite,
                                    fontWeight:
                                        CustomFontWeight.kBoldFontWeight),
                                AddCustomSpace(width: 0, height: 10.h),
                                CustomText(
                                    text: "Rachael Verisa",
                                    textStyle:
                                        CustomTextStyle.kmedhighTextStyle,
                                    color: CustomColor.kwhite,
                                    fontWeight:
                                        CustomFontWeight.kBoldFontWeight),
                              ],
                            ),
                            const Spacer(),
                            CircleAvatar(
                              radius: 25.sp,
                              backgroundImage:
                                  const AssetImage(CustomAssets.farm),
                              backgroundColor: Colors.green,
                            ),
                          ]),
                    ),
                  ),
                  SizedBox(
                    height: 80.h,
                  ),
                ],
              ),
              Positioned(
                top: 130.h,
                left: 13.w,
                child: Container(
                  height: 170.h,
                  width: 350.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.r),
                    boxShadow: boxshadow,
                    color: CustomColor.kwhite,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 20.w,
                        vertical: 20.h,
                      ),
                      child: Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Icon(
                                    Icons.location_pin,
                                    size: 20.sp,
                                    color: CustomColor.kblack,
                                  ),
                                  CustomText(
                                      text: "Purwokerto, Indonesia",
                                      textStyle: CustomTextStyle.ktextTextStyle,
                                      color: CustomColor.kblack,
                                      fontWeight:
                                          CustomFontWeight.kBoldFontWeight),
                                ],
                              ),
                              AddCustomSpace(width: 0, height: 10.h),
                              CustomText(
                                  text: "Thursday-July 7, 2021",
                                  textStyle: CustomTextStyle.ksmallTextStyle,
                                  color: CustomColor.klightgrey,
                                  fontWeight: CustomFontWeight.kBoldFontWeight),
                              AddCustomSpace(width: 0, height: 14.h),
                              CustomText(
                                  text: "24°C",
                                  textStyle: CustomTextStyle.kLargeStyle,
                                  color: CustomColor.kblack,
                                  fontWeight:
                                      CustomFontWeight.kExtraBoldFontWeight),
                            ],
                          ),
                          const Spacer(),
                          Container(
                            height: 150.h,
                            width: 80.w,
                            decoration: BoxDecoration(
                                color: CustomColor.kpendingyellow,
                                image: const DecorationImage(
                                    fit: BoxFit.fill,
                                    image: AssetImage(
                                      CustomAssets.clipart,
                                    ))),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 20.w,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              CustomText(
                  text: "My Feilds",
                  textStyle: CustomTextStyle.kmedTextStyle,
                  color: CustomColor.kblack,
                  fontWeight: CustomFontWeight.kBoldFontWeight),
              const Spacer(),
              CustomText(
                  text: "See All",
                  textStyle: CustomTextStyle.ktextTextStyle,
                  color: CustomColor.klightgrey,
                  fontWeight: CustomFontWeight.kBoldFontWeight),
            ],
          ),
        ),
        AddCustomSpace(width: 0, height: 10.h),
        Expanded(
            child: ListView.builder(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          itemCount: gardenlist.length,
          itemBuilder: (BuildContext context, int index) {
            return Column(
              children: [
                AgriculturalContainer(
                  agri: gardenlist[index],
                  onTap: () {},
                ),
                AddCustomSpace(width: 0, height: 10.h),
              ],
            );
          },
        )),
      ],
    ));
  }
}

class AgriculturalContainer extends StatelessWidget {
  final AgricultureModel agri;
  final VoidCallback onTap;
  const AgriculturalContainer({
    Key? key,
    required this.agri,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 240.h,
      width: 330.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        color: CustomColor.kwhite,
        boxShadow: boxshadow,
      ),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 15.h, bottom: 15.h),
            height: 140.h,
            width: 310.w,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.r),
                image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage(
                      agri.imagepath,
                    ))),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                        text: agri.title,
                        textStyle: CustomTextStyle.kmedTextStyle,
                        color: CustomColor.kblack,
                        fontWeight: CustomFontWeight.kBoldFontWeight),
                    AddCustomSpace(width: 0, height: 10.h),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.location_pin,
                          size: 10.sp,
                          color: CustomColor.kblack,
                        ),
                        CustomText(
                            text: agri.venue,
                            textStyle: CustomTextStyle.ksmallTextStyle,
                            color: CustomColor.klightgrey,
                            fontWeight: CustomFontWeight.kBoldFontWeight),
                      ],
                    )
                  ],
                ),
                const Spacer(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    CustomText(
                        text: "Status",
                        textStyle: CustomTextStyle.ksmallTextStyle,
                        color: CustomColor.klightgrey,
                        fontWeight: CustomFontWeight.kMediumFontWeight),
                    AddCustomSpace(width: 0, height: 10.h),
                    Container(
                      height: 20.h,
                      width: 70.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(24.r),
                        color: agri.statusColor.withOpacity(0.2),
                      ),
                      child: Center(
                        child: CustomText(
                            text: agri.status,
                            textStyle: CustomTextStyle.ksmallTextStyle,
                            color: agri.statusColor,
                            fontWeight: CustomFontWeight.kBoldFontWeight),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
          AddCustomSpace(width: 0, height: 10.h),
        ],
      ),
    );
  }
}
