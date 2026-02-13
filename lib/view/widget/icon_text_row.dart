import 'package:alpha_pilot/view/widget/my_text_widget.dart';
import 'package:bounce/bounce.dart';
import 'package:flutter/material.dart';
import 'package:alpha_pilot/const/app_colors.dart';
import 'package:alpha_pilot/generated/assets.dart';

class IconTextRow extends StatelessWidget {
  const IconTextRow({
    super.key,
    this.iconpath,
    this.text,
    this.textcolor,
    this.iconcolor,
    this.padends,
    this.textsize,
    this.iconsize,
    this.crossAxisAlignment,
    this.mainAxisAlignment,
    this.expanded = true,
    this.flipX,
    this.decoration,
    this.padvertical,
    this.weight = FontWeight.w400,
    this.mBottom,
    this.spacing,
    this.ontap,
    this.lineheight,
    this.maxlines1,
  });
  final String? iconpath, text;
  final Color? textcolor, iconcolor;
  final bool? expanded, flipX;
  final double? padends,
      textsize,
      iconsize,
      padvertical,
      mBottom,
      spacing,
      lineheight;
  final CrossAxisAlignment? crossAxisAlignment;
  final MainAxisAlignment? mainAxisAlignment;
  final FontWeight? weight;
  final BoxDecoration? decoration;
  final VoidCallback? ontap;
  final int? maxlines1;
  @override
  Widget build(BuildContext context) {
    return ontap != null
        ? Bounce(
            onTap: ontap ?? () {},
            child: Container(
              margin: EdgeInsets.only(bottom: mBottom ?? 0),
              decoration: decoration ?? BoxDecoration(),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: padends ?? 0,
                  vertical: padvertical ?? 0,
                ),
                child: Row(
                  spacing: spacing ?? 0,
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment:
                      mainAxisAlignment ?? MainAxisAlignment.start,
                  crossAxisAlignment:
                      crossAxisAlignment ?? CrossAxisAlignment.start,
                  children: flipX == true
                      ? [
                          if (mainAxisAlignment == MainAxisAlignment.end)
                            Expanded(child: SizedBox()),
                          if (expanded == true)
                            Expanded(
                              child: MyText(
                                paddingLeft: 5,
                                weight: weight,
                                color: textcolor ?? kGreyColor,
                                text: text ?? '15 min • 1.5km ',
                                size: textsize ?? 11,
                                maxLines: maxlines1,
                                lineHeight: lineheight,
                              ),
                            ),
                          if (expanded == false)
                            MyText(
                              paddingLeft: 5,
                              weight: weight,
                              color: textcolor ?? kGreyColor,
                              lineHeight: lineheight,
                              text: text ?? '15 min • 1.5km ',
                              size: textsize ?? 11,
                              maxLines: maxlines1,
                            ),
                          Image.asset(
                            color: iconcolor,
                            iconpath ?? Assets.imagesLogo,
                            height: iconsize ?? 17,
                          ),
                        ]
                      : [
                          if (mainAxisAlignment == MainAxisAlignment.end)
                            Expanded(child: SizedBox()),
                          Image.asset(
                            color: iconcolor,
                            iconpath ?? Assets.imagesLogo,
                            height: iconsize ?? 17,
                          ),
                          if (expanded == true)
                            Expanded(
                              child: MyText(
                                paddingLeft: 5,
                                weight: weight,
                                color: textcolor ?? kGreyColor,
                                text: text ?? '15 min • 1.5km ',
                                size: textsize ?? 11,
                                maxLines: maxlines1,
                                lineHeight: lineheight,
                              ),
                            ),
                          if (expanded == false)
                            MyText(
                              paddingLeft: 5,
                              weight: weight,
                              color: textcolor ?? kGreyColor,
                              text: text ?? '15 min • 1.5km ',
                              size: textsize ?? 11,
                              maxLines: maxlines1,
                              lineHeight: lineheight,
                            ),
                        ],
                ),
              ),
            ),
          )
        : Container(
            margin: EdgeInsets.only(bottom: mBottom ?? 0),
            decoration: decoration ?? BoxDecoration(),
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: padends ?? 0,
                vertical: padvertical ?? 0,
              ),
              child: Row(
                spacing: spacing ?? 0,
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.start,
                crossAxisAlignment:
                    crossAxisAlignment ?? CrossAxisAlignment.start,
                children: flipX == true
                    ? [
                        if (mainAxisAlignment == MainAxisAlignment.end)
                          Expanded(child: SizedBox()),
                        if (expanded == true)
                          Expanded(
                            child: MyText(
                              paddingLeft: 5,
                              weight: weight,
                              color: textcolor ?? kGreyColor,
                              text: text ?? '15 min • 1.5km ',
                              size: textsize ?? 11,
                              maxLines: maxlines1,
                              lineHeight: lineheight,
                            ),
                          ),
                        if (expanded == false)
                          MyText(
                            paddingLeft: 5,
                            weight: weight,
                            color: textcolor ?? kGreyColor,
                            text: text ?? '15 min • 1.5km ',
                            size: textsize ?? 11,
                            maxLines: maxlines1,
                            lineHeight: lineheight,
                          ),
                        Image.asset(
                          color: iconcolor,
                          iconpath ?? Assets.imagesLogo,
                          height: iconsize ?? 17,
                        ),
                      ]
                    : [
                        if (mainAxisAlignment == MainAxisAlignment.end)
                          Expanded(child: SizedBox()),
                        Image.asset(
                          color: iconcolor,
                          iconpath ?? Assets.imagesLogo,
                          height: iconsize ?? 17,
                        ),
                        if (expanded == true)
                          Expanded(
                            child: MyText(
                              paddingLeft: 5,
                              weight: weight,
                              color: textcolor ?? kGreyColor,
                              text: text ?? '15 min • 1.5km ',
                              maxLines: maxlines1,
                              size: textsize ?? 11,
                              lineHeight: lineheight,
                            ),
                          ),
                        if (expanded == false)
                          MyText(
                            paddingLeft: 5,
                            weight: weight,
                            color: textcolor ?? kGreyColor,
                            text: text ?? '15 min • 1.5km ',
                            size: textsize ?? 11,
                            maxLines: maxlines1,
                            lineHeight: lineheight,
                          ),
                      ],
              ),
            ),
          );
  }
}
