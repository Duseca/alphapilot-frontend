import 'package:alpha_pilot/view/widget/common_image_view_widget.dart';
import 'package:alpha_pilot/view/widget/custom_animated_row.dart';
import 'package:alpha_pilot/view/widget/my_text_widget.dart';
import 'package:bounce/bounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:alpha_pilot/const/app_colors.dart';
import 'package:alpha_pilot/const/app_sizes.dart';
import 'package:alpha_pilot/const/app_styling.dart';

import 'package:alpha_pilot/generated/assets.dart';
import 'package:alpha_pilot/main.dart';

class IconTitleSubtitle extends StatelessWidget {
  const IconTitleSubtitle({
    super.key,
    this.title,
    this.path,
    this.iconRadis,
    this.subtitle,
    this.iconheight,
    this.size1,
    this.gap,
    this.trailing,
    this.size2,
    this.isurl = false,
    this.color1,
    this.hastsubtitle = false,
    this.color2,
    this.subtitle2,
    this.padEnds,
    this.padVertical,
    this.hasicon = true,
    this.hasthirdtext = false,
    this.decoration,
    this.colspace,
    this.crossAxisAlignment,
    this.hastrailing = true,
    this.ontralingTap,
    this.ontap,
    this.rowspace,
    this.iconcolor,
    this.weight1,
    this.weight2,
    this.isradiotile,
    this.radiovalue,
    this.subtitleWidget,
    this.size3,
    this.topPadimg,
    this.customradio,
    this.mhoriz,
    this.mvertical,
    this.lineheight,
    this.maxlines1,
    this.maxLines2,
  });
  final String? title, path, subtitle, subtitle2;
  final double? iconheight,
      size1,
      size2,
      size3,
      gap,
      padEnds,
      iconRadis,
      padVertical,
      colspace,
      rowspace,
      topPadimg,
      mhoriz,
      lineheight,
      mvertical;
  final int? maxlines1, maxLines2;
  final Widget? trailing;
  final bool? isurl,
      hasthirdtext,
      hasicon,
      hastsubtitle,
      hastrailing,
      isradiotile;
  final Color? color1, color2, iconcolor;
  final Decoration? decoration;
  final bool? radiovalue;
  final CrossAxisAlignment? crossAxisAlignment;
  final VoidCallback? ontralingTap, ontap;
  final FontWeight? weight1, weight2;
  final Widget? customradio, subtitleWidget;
  @override
  Widget build(BuildContext context) {
    return ontap != null
        ? Bounce(
            onTap: ontap,
            child: AnimatedContainer(
              margin: EdgeInsets.symmetric(
                horizontal: mhoriz ?? 0,
                vertical: mvertical ?? 0,
              ),
              duration: 300.ms,
              decoration: decoration ?? BoxDecoration(),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: padEnds ?? 0,
                  vertical: padVertical ?? 0,
                ),
                child: AnimatedRow(
                  spacing: rowspace ?? 8,
                  crossAxisAlignment:
                      crossAxisAlignment ?? CrossAxisAlignment.center,
                  children: [
                    if (isradiotile == true)
                      customradio ??
                          AnimatedContainer(
                            height: 26,
                            width: 26,
                            duration: Duration(milliseconds: 300),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: radiovalue == true
                                  ? kMintGreen
                                  : ktransparent,
                              border: Border.all(
                                width: 1.5,
                                color: radiovalue == true
                                    ? kMintGreen
                                    : kMintGreen.withOpacity(0.5),
                              ),
                            ),
                            child: Center(
                              child: Icon(
                                Icons.check,
                                color: kPrimaryColor,
                                size: 16,
                              ),
                            ),
                          ),
                    if (hasicon == true)
                      isurl == true
                          ? Container(
                              decoration: circle(
                                ktransparent,
                                ktransparent,
                                width: 2,
                              ),
                              child: CommonImageView(
                                height: iconheight ?? 32,
                                width: iconheight ?? 32,
                                radius: iconRadis ?? 200,
                                url: path ?? dummyImage,
                              ),
                            )
                          : Padding(
                              padding: EdgeInsets.only(top: topPadimg ?? 0.0),
                              child: Image.asset(
                                height: iconheight ?? 32,
                                path ?? Assets.imagesLogo,
                                color: iconcolor,
                              ),
                            ),
                    Expanded(
                      child: Column(
                        spacing: colspace ?? 0,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          MyText(
                            text: title ?? 'Credit or debit card',
                            size: size1 ?? 14,
                            lineHeight: lineheight,
                            maxLines: maxlines1,
                            weight: weight1 ?? FontWeight.w600,
                            paddingBottom: gap ?? 0,
                            color: color1 ?? kSecondaryColor,
                          ),
                          if (hastsubtitle == true)
                            MyText(
                              color: color2,
                              size: size2 ?? 12,
                              maxLines: maxLines2,
                              text:
                                  subtitle ?? 'Visa, Mastercard, AMEX and JCB',
                              weight: weight2 ?? FontWeight.w400,
                            ),

                          subtitleWidget ?? SizedBox.shrink(),
                          if (hasthirdtext == true)
                            MyText(
                              color: color2,
                              size: size3 ?? 14,
                              text:
                                  subtitle2 ?? 'Visa, Mastercard, AMEX and JCB',
                            ),
                        ],
                      ),
                    ),
                    if (hastrailing == true) trailing ?? SizedBox(),
                  ],
                ),
              ),
            ),
          )
        : AnimatedContainer(
            margin: EdgeInsets.symmetric(
              horizontal: mhoriz ?? 0,
              vertical: mvertical ?? 0,
            ),
            duration: 300.ms,
            decoration: decoration ?? BoxDecoration(),
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: padEnds ?? 0,
                vertical: padVertical ?? 0,
              ),
              child: AnimatedRow(
                spacing: rowspace ?? 8,
                crossAxisAlignment:
                    crossAxisAlignment ?? CrossAxisAlignment.center,
                children: [
                  if (isradiotile == true)
                    customradio ??
                        AnimatedContainer(
                          height: 26,
                          width: 26,
                          duration: Duration(milliseconds: 300),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: radiovalue == true
                                ? kMintGreen
                                : ktransparent,
                            border: Border.all(
                              width: 1.5,
                              color: radiovalue == true
                                  ? kMintGreen
                                  : kMintGreen.withOpacity(0.5),
                            ),
                          ),
                          child: Center(
                            child: Icon(
                              Icons.check,
                              color: kPrimaryColor,
                              size: 16,
                            ),
                          ),
                        ),
                  if (hasicon == true)
                    isurl == true
                        ? Container(
                            decoration: circle(
                              ktransparent,
                              ktransparent,
                              width: 2,
                            ),
                            child: CommonImageView(
                              height: iconheight ?? 32,
                              width: iconheight ?? 32,
                              radius: iconRadis ?? 200,
                              url: path ?? dummyImage,
                            ),
                          )
                        : Padding(
                            padding: EdgeInsets.only(top: topPadimg ?? 0.0),

                            child: Image.asset(
                              height: iconheight ?? 32,
                              path ?? Assets.imagesLogo,
                              color: iconcolor,
                            ),
                          ),

                  Expanded(
                    child: Column(
                      spacing: colspace ?? 0,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        MyText(
                          text: title ?? 'Credit or debit card',
                          size: size1 ?? 14,
                          weight: weight1 ?? FontWeight.w600,
                          paddingBottom: gap ?? 0,
                          lineHeight: lineheight,
                          maxLines: maxlines1,
                          //   textOverflow: TextOverflow.ellipsis,
                          color: color1,
                        ),
                        if (hastsubtitle == true)
                          MyText(
                            color: color2,
                            maxLines: maxLines2,
                            size: size2 ?? 12,
                            text: subtitle ?? 'Visa, Mastercard, AMEX and JCB',
                            weight: weight2 ?? FontWeight.w400,
                          ),
                        subtitleWidget ?? SizedBox.shrink(),
                        if (hasthirdtext == true)
                          MyText(
                            color: color2,
                            size: size3 ?? 14,
                            weight: wmedium,
                            text: subtitle2 ?? 'Visa, Mastercard, AMEX and JCB',
                          ),
                      ],
                    ),
                  ),
                  if (hastrailing == true) trailing ?? SizedBox(),
                ],
              ),
            ),
          );
  }
}
