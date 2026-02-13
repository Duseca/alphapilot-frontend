import 'package:bounce/bounce.dart';
import 'package:alpha_pilot/const/app_sizes.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:alpha_pilot/const/app_colors.dart';
import 'package:alpha_pilot/const/app_styling.dart';
import 'package:alpha_pilot/generated/assets.dart';
import 'package:alpha_pilot/main.dart';

AppBar simpleAppBar({
  String? title,
  VoidCallback? onBackIconTap,
  Color? bgColor,
  Color? titleColor,
  Color? contentColor,
  bool? haveBackButton = true,
  bool? centerTitle = F,
  hasTitleimage = false,
  double toolbarheight = 48,
  double? titlesize,
  List<Widget>? actions,
  double? height,
  double? leadingwidth,
  double? leadingWidth,
  double? lPad,
  PreferredSize? bottom,
  String? backIcon,
  double? topPad,
}) {
  return AppBar(
    bottom: bottom,
    actionsPadding: EdgeInsets.all(0),

    toolbarHeight: toolbarheight,
    surfaceTintColor: ktransparent,
    foregroundColor: ktransparent,
    backgroundColor: bgColor ?? ktransparent,
    centerTitle: centerTitle ?? F,

    shadowColor: ktransparent,
    leadingWidth: haveBackButton == false ? 0 : leadingwidth ?? 70,
    leading: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(height: topPad ?? 8),
        if (haveBackButton!)
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(width: lPad ?? 20),
              Padding(
                padding: const EdgeInsets.only(left: 0.0, bottom: 0),
                child: GestureDetector(
                  onTap: onBackIconTap ?? () => Get.back(),
                  child: Image.asset(
                    backIcon ?? Assets.imagesLogo,
                    height: height ?? 26,
                    color: contentColor ?? kQuaternaryColor,
                  ),
                ),
              ),
            ],
          ),
        SizedBox(height: 0),
      ],
    ),
    title: centerTitle == T
        ? MyText(
            maxLines: 1,
            textOverflow: TextOverflow.ellipsis,
            text: title ?? '',
            size: titlesize ?? 22,
            //    textAlign: centerTitle == true ? TextAlign.center : null,
            weight: FontWeight.w700,
            color: titleColor ?? kQuaternaryColor,
            paddingBottom: 0,
          )
        : Row(
            spacing: 10,
            children: [
              if (hasTitleimage == true)
                CommonImageView(
                  url: dummyImage,
                  height: 40,
                  width: 40,
                  radius: 100,
                ),
              Expanded(
                child: MyText(
                  maxLines: 1,
                  textOverflow: TextOverflow.ellipsis,
                  text: title ?? '',
                  size: titlesize ?? 22,
                  //    textAlign: centerTitle == true ? TextAlign.center : null,
                  weight: FontWeight.w700,
                  color: titleColor ?? kQuaternaryColor,
                ),
              ),
            ],
          ),
    actions: actions,
  );
}

ClipRRect simpleAppBar2({
  String? title,
  VoidCallback? onBackIconTap,
  Color? bgColor,
  Color? contentColor,
  bool? haveBackButton = true,
  List<Widget>? actions,
  double? height,
  PreferredSize? bottom,
}) {
  return ClipRRect(
    borderRadius: BorderRadius.only(
      bottomLeft: Radius.circular(25),
      bottomRight: Radius.circular(25),
    ),
    child: AppBar(
      bottom: bottom,
      toolbarHeight: 76,
      surfaceTintColor: kPrimaryColor,
      foregroundColor: kPrimaryColor,
      backgroundColor: bgColor ?? kPrimaryColor,
      shadowColor: kPrimaryColor,
      centerTitle: T,
      leadingWidth: haveBackButton == false ? 0 : null,
      leading: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(width: 10),
          if (haveBackButton!)
            GestureDetector(
              onTap: onBackIconTap ?? () => Get.back(),
              child: Image.asset(Assets.imagesLogo, height: height ?? 40),
            ),
        ],
      ),
      title: MyText(
        text: title ?? '',
        maxLines: 1,
        textOverflow: TextOverflow.ellipsis,
        size: 18,
        weight: FontWeight.w600,
        color: contentColor ?? kTertiaryColor,
      ),
      actions: actions,
    ),
  );
}
